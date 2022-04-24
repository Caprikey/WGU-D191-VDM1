CREATE OR REPLACE FUNCTION marketing.t_f_insert_new_film()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_insert_new_film$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        INSERT INTO marketing.film_category_popularity (
              film_id
            , category_id
            , total_rentals 
            , film_rank
            , film_category_rank
            , new_release
        )


        WITH get_film_category AS (

            SELECT
                  film_id
                , category_id
            FROM
                public.film_category
            
            WHERE
                film_id = NEW.film_id
        )

        SELECT
              film_id
            , category_id
            , 0
            , null
            , null
            , true
        FROM
            get_film_category;


 		-- #### #### #### #### #### #### #### ####        


        UPDATE marketing.film_category_popularity

        SET
            film_rank = null;


    	-- #### #### #### #### #### #### #### ####        


        WITH generate_film_rank AS (

            SELECT
                  film_id
                , ROW_NUMBER() OVER (ORDER BY a.total_rentals DESC, b.total_rentals DESC) AS film_rank
            FROM 
                marketing.film_category_popularity AS a 
                    LEFT JOIN marketing.category_popularity AS b 
                        ON b.category_id = a.category_id
        )
        
        UPDATE marketing.film_category_popularity AS a

        SET
            film_rank = b.film_rank

        FROM 
            generate_film_rank AS b 

        WHERE 
            b.film_id = a.film_id;

	
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####    


        UPDATE marketing.film_category_popularity

        SET
            film_category_rank = null
			
		WHERE
            category_id = NEW.category_id;


		-- #### #### #### #### #### #### #### #### 


        WITH generate_film_category_rank AS (

            SELECT
                  film_id
                , category_id
                , ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY total_rentals DESC) AS film_category_rank
            FROM 
                marketing.film_category_popularity
        )
        
        UPDATE marketing.film_category_popularity AS a

        SET
            film_category_rank = b.film_category_rank

        FROM 
            generate_film_category_rank AS b 

        WHERE 
            b.film_id = a.film_id
                AND
            b.category_id = a.category_id;


		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


        INSERT INTO marketing.customer_reclist_master_nonspecific (
            
              customer_id 
            , category_id
            , film_id
            , total_rentals
        )


        WITH get_film_category_details AS (

            SELECT 
                  category_id
                , film_id
                , total_rentals 
            FROM 
                marketing.film_category_popularity

            WHERE 
                film_id = NEW.film_id
        )
        , get_customers_list AS (
            
            SELECT
                customer_id
            FROM
                public.customer
        )
        , combined_film_category_with_customers AS (
            
            SELECT
                  b.customer_id
                , a.category_id
                , a.film_id
                , a.total_rentals

            FROM
                get_film_category_details AS a 
                    CROSS JOIN
                        get_customers_list AS b 
        )

        SELECT 
              customer_id
            , category_id
            , film_id
            , total_rentals
        
        FROM 
            combined_film_category_with_customers;

   		-- #### #### #### #### #### #### #### ####  

        UPDATE marketing.customer_reclist_master_nonspecific

        SET
              film_rec_order = null 
            , film_rank = null
            , film_category_rank = null;

		-- #### #### #### #### #### #### #### ####

        WITH get_updated_film_ranks AS (

            SELECT
                  film_id
                , film_rank
                , film_category_rank
            FROM
                marketing.film_category_popularity
        ), get_customer_reclist_master_nonspecific_values AS (

			SELECT
				  a.customer_id
				, b.film_rank
				, a.category_id
				, a.film_id
				, b.film_category_rank
				, a.total_rentals
			FROM 
                marketing.customer_reclist_master_nonspecific AS a
                    LEFT JOIN 
                        marketing.film_category_popularity AS b
                            ON b.film_id = a.film_id
        )
        , assign_rental_rec_row_number AS (

			SELECT
				  customer_id
				, film_rank
				, category_id
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY film_rank) as rental_rec_order_rn
				, film_id
				, film_category_rank
				, total_rentals
			FROM get_customer_reclist_master_nonspecific_values
		)

        UPDATE marketing.customer_reclist_master_nonspecific AS a

		SET 
              film_rank = b.film_rank
            , film_rec_order = b.rental_rec_order_rn
            , film_category_rank = b.film_category_rank

		FROM assign_rental_rec_row_number AS b

		WHERE 
			(a.customer_id = b.customer_id
				AND
			a.film_id = b.film_id);

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        UPDATE marketing.customer_reclist_master_specific

        SET
            rental_rec_order = null;

		-- #### #### #### #### #### #### #### #### 

        INSERT INTO marketing.customer_reclist_master_specific(

                  customer_id           -- customer id
                , cat_rec_order         -- customer's category rec order     
                , category_id           -- category id 
                , film_id               -- film id
                , film_category_rank    -- film rank by category
                , total_rentals         -- Film's Total Rentals
            )	

        WITH combined_master_with_cxcat AS (

            SELECT 
                a.customer_id
                , CASE
                    WHEN EXISTS (SELECT b.customer_id FROM marketing.customer_category b where b.customer_id = a.customer_id)
                        THEN b.recommendation_order_customer_preference
                    ELSE b.recommendation_order_historical
                END as cat_rec_order 
                , a.category_id
                , a.film_id
                , a.film_category_rank
                , a.total_rentals
            FROM 
                marketing.customer_reclist_master_nonspecific AS a
                    LEFT JOIN 
                        marketing.customer_category AS b
                            ON b.customer_id = a.customer_id
                            
            WHERE
                (a.film_id = NEW.film_id)
                    AND 
                (
                    (b.customer_id = a.customer_id
                        AND
                    b.category_id = a.category_id)
                        AND
                    b.recommendation_order_historical IN (
                        SELECT recommendation_order_historical
                            FROM 
                        marketing.customer_category)
                )

            ORDER BY
                a.customer_id, 2, a.film_category_rank DESC
        )

        SELECT
              customer_id
            , cat_rec_order
            , category_id 
            , film_id
            , film_category_rank
            , total_rentals
        FROM combined_master_with_cxcat;

        -- #### #### #### #### #### #### #### ####  

        WITH get_customer_reclist_master_specific_values AS (

			SELECT
				  customer_id
				, cat_rec_order
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
			FROM marketing.customer_reclist_master_specific
		),
		assign_row_number AS (

			SELECT
				  customer_id
				, cat_rec_order
				, category_id
                , ROW_NUMBER() OVER(PARTITION BY customer_id, cat_rec_order ORDER BY cat_rec_order, film_category_rank) AS rental_rec_order_rn
				, film_id
				, film_category_rank
				, total_rentals
			FROM get_customer_reclist_master_specific_values
		)


		UPDATE marketing.customer_reclist_master_specific AS a

		SET rental_rec_order = b.rental_rec_order_rn

		FROM assign_row_number AS b

		WHERE 
			(a.customer_id = b.customer_id
				AND
			a.film_id = b.film_id);
			
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        INSERT INTO marketing.new_releases(
              film_id
            , status
        )

        SELECT
              film_id
            , true
        FROM 
            marketing.film_category_popularity

        WHERE
            film_id = NEW.film_id;


  		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####           
		
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### ####
		
		RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
	
	END;
$trigger_function_insert_new_film$;