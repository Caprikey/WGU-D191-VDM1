-- TRIGGER FUNCTIONS CODE BLOCK

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####   TRIGGER FUNCTIONS #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS 

--   TRIGGER FUNCTIONS

--        1. marketing.t_f_insert_failed_return();
--        2. marketing.t_f_insert_new_category();
--        3. marketing.t_f_insert_new_customer();
--        4. marketing.t_f_insert_new_film();
--        5. marketing.t_f_insert_new_inventory();
--        6. marketing.t_f_insert_update_customer_rec_custom_preferences();
--        7. marketing.t_f_update_category_popularity();
--        8. marketing.t_f_update_customer_category();
--        9. marketing.t_f_update_customer_reclist_master_nonspecific();
--       10. marketing.t_f_update_customer_reclist_master_specific();
--       11. marketing.t_f_update_customer_reclist_summary_nonspecific();
--       12. marketing.t_f_update_customer_reclist_summary_specific();
--       13. marketing.t_f_insert_customer_watch_history();
--       14. marketing.t_f_update_film_category_popularity();
--       15. marketing.t_f_update_inventory_maintenance();
--       16. marketing.t_f_update_new_release();
--       17. marketing.t_f_update_rental_return();

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_insert_failed_return()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_insert_failed_return$

    BEGIN 
    
    
        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        INSERT INTO marketing.failed_returns(
              customer_id
            , rental_id 
            , film_id
            , inventory_id
            , store_id
            , rental_date
            , expected_return_date
            , age 
        )

        SELECT
              a.customer_id 
            , a.rental_id
            , a.film_id
            , a.inventory_id
            , b.store_id
            , a.rental_date
            , marketing.calc_expected_return_date(a.film_id::int, a.rental_date::DATE) as expected_return_date
            , (SELECT AGE('2007-01-01', marketing.calc_expected_return_date(a.film_id::int, a.rental_date::DATE))) as age
        FROM 
            marketing.customer_watch_history_detailed AS a
                LEFT JOIN public.customer AS b
                    ON b.customer_id = a.customer_id 

        WHERE
            a.return_date IS NULL 
                AND 
            a.rental_id = NEW.rental_id;
        
        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### 

        RETURN NEW;

    -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_insert_failed_return$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_insert_new_category()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_insert_new_category$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


	    INSERT INTO marketing.customer_rec_custom_preferences (
              customer_id
			, category_id
			, customer_rec_custom_order
        )

		WITH get_customers_with_custom_rec_preferences AS (

			SELECT
				customer_id 
			FROM 
				marketing.customer_rec_custom_preferences
		)
		, cross_join_customer_to_new_category AS (
			
			SELECT
				  DISTINCT (customer_id)
				, category_id
			FROM 
				get_customers_with_custom_rec_preferences
					CROSS JOIN
						public.category
			
			WHERE
				category_id = NEW.category_id
		)
		, get_total_count_of_categories AS (

			SELECT
				COUNT(*) AS category_length
			FROM
				public.category
		)
		, cross_join_cuscat_to_catleng AS (
			
			SELECT
				  customer_id
				, category_id 
				, category_length AS customer_rec_custom_order
			FROM
				cross_join_customer_to_new_category
					CROSS JOIN
						get_total_count_of_categories
		)

		SELECT
			  customer_id
			, category_id
			, customer_rec_custom_order
		FROM
			cross_join_cuscat_to_catleng
			
			
			; 


		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        INSERT INTO marketing.category_popularity (
              category_id
            , name
            , total_rentals
        )

        SELECT
              category_id
            , name
            , '0'
        FROM
            public.category

        WHERE
            category_id = NEW.category_id;


 		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####        
		
        INSERT INTO marketing.customer_category(
              customer_id
            , category_id
        )

        SELECT
              b.customer_id
            , a.category_id
        FROM public.category AS a
            CROSS JOIN public.customer AS b

        WHERE
            a.category_id = NEW.category_id;
	
		-- #### #### #### #### #### #### #### #### 
	
		UPDATE marketing.customer_category
		
		SET
			  historical_rental_count = 0
			, average_rental_count = 0
			, halfaverage_rental_count = 0
			
		WHERE
			category_id = NEW.category_id;

		-- #### #### #### #### #### #### #### #### 

        UPDATE marketing.customer_category 

        SET 
              recommendation_order_historical = null
			, recommendation_order_average = null
			, recommendation_order_halfaverage = null
			, recommendation_order_customer_preference = null;

		-- #### #### #### #### #### #### #### #### 

        WITH get_customer_category_rec_order_historical AS (
			
            SELECT 
				  a.customer_id
				, a.category_id
				, ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY a.historical_rental_count DESC, b.total_rentals DESC) as recommendation_order_historical

			FROM marketing.customer_category AS a
				INNER JOIN marketing.category_popularity AS b 
					ON b.category_id = a.category_id
		)

		UPDATE marketing.customer_category AS a

		SET 
			recommendation_order_historical = b.recommendation_order_historical

		FROM get_customer_category_rec_order_historical AS b

		WHERE
			b.category_id = a.category_id
                AND
            b.customer_id = a.customer_id;

        -- #### #### #### #### #### #### #### #### 

		WITH get_customer_category_rec_order_average AS (
			SELECT 
				  a.customer_id
				, a.category_id
				, ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY a.average_rental_count DESC, b.total_rentals DESC) as recommendation_order_average

			FROM marketing.customer_category AS a
				INNER JOIN marketing.category_popularity AS b
					ON b.category_id = a.category_id
		)

		UPDATE marketing.customer_category AS a

		SET 
			recommendation_order_average = b.recommendation_order_average

		FROM get_customer_category_rec_order_average AS b

		WHERE
			b.category_id = a.category_id
                AND 
            b.customer_id = a.customer_id;

		-- #### #### #### #### #### #### #### #### 

		WITH get_customer_category_rec_order_halfaverage AS (
			SELECT 
				  a.customer_id
				, a.category_id
				, ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY a.halfaverage_rental_count DESC, b.total_rentals DESC ) as recommendation_order_halfaverage

			FROM marketing.customer_category AS a
				INNER JOIN marketing.category_popularity AS b 
					ON b.category_id = a.category_id
		)

		UPDATE marketing.customer_category AS a

		SET 
			recommendation_order_halfaverage = b.recommendation_order_halfaverage

		FROM get_customer_category_rec_order_halfaverage AS b

		WHERE
			b.category_id = a.category_id
                AND 
            b.customer_id = a.customer_id;
		
	
		-- #### #### #### #### #### #### #### #### 
		
		UPDATE marketing.customer_category
		
		SET
			recommendation_order_customer_preference = recommendation_order_historical
			
		WHERE 
			category_id = category_id 
                AND 
            customer_id = customer_id;

		-- #### #### #### #### #### #### #### #### 
		
		WITH get_customer_custom_rec_preferences AS (
			
			SELECT
				  customer_id
				, category_id
				, customer_rec_custom_order
				, customer_rec_custom_amount
			FROM
				marketing.customer_rec_custom_preferences

		)
		
		UPDATE marketing.customer_category AS a
		
		SET
			recommendation_order_customer_preference = b.customer_rec_custom_order
			
		FROM 
			get_customer_custom_rec_preferences AS b
			
		WHERE
			b.category_id = a.category_id
                AND 
            b.customer_id = a.customer_id;
			
		-- #### #### #### #### #### #### #### #### 
		


		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### ####
		
		RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
	
	END;
$trigger_function_insert_new_category$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_insert_new_customer()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_insert_new_customer$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 
		
			INSERT INTO marketing.customer_category (
				  customer_id
				, category_id
			)

			SELECT
				  a.customer_id
				, b.category_id
			FROM public.customer a
				CROSS JOIN public.category b 

			WHERE
				a.customer_id = NEW.customer_id;
	
		-- #### #### #### #### #### #### #### #### 
	
		UPDATE marketing.customer_category
		
		SET
			  historical_rental_count = 0
			, average_rental_count = 0
			, halfaverage_rental_count = 0
			
			, recommendation_order_historical = null
			, recommendation_order_average = null
			, recommendation_order_halfaverage = null
			, recommendation_order_customer_preference = null
			
		WHERE
			customer_id = NEW.customer_id;

		-- #### #### #### #### #### #### #### #### 
		
		WITH calc_recommendation_order_default AS (

            SELECT
				  category_id	
				, ROW_NUMBER() OVER (ORDER BY total_rentals DESC) AS recommendation_order_default
            FROM 
				marketing.category_popularity
        )
		
		UPDATE marketing.customer_category AS a
		
		SET
			  recommendation_order_historical = b.recommendation_order_default
			, recommendation_order_average = b.recommendation_order_default
			, recommendation_order_halfaverage = b.recommendation_order_default
			, recommendation_order_customer_preference = b.recommendation_order_default
			
		FROM calc_recommendation_order_default AS b
		
		WHERE
			a.customer_id = NEW.customer_id
				AND
			b.category_id = a.category_id;
		
				
		-- #### #### #### #### #### #### #### #### 

		INSERT INTO marketing.customer_reclist_master_nonspecific (
			
			  customer_id
			, film_rank
			, category_id
			, film_rec_order
			, film_id
			, film_category_rank
			, total_rentals
		)
		
		SELECT
			  customer_id
			, film_rank
			, category_id
			, film_rank AS film_rec_order
			, film_id
			, film_category_rank
			, total_rentals
			
		FROM
			public.customer
				CROSS JOIN
					marketing.film_category_popularity
		
		WHERE
			customer_id = NEW.customer_id;
			
		-- #### #### #### #### #### #### #### #### 
		
		INSERT INTO marketing.customer_reclist_master_specific (
			
			  customer_id
			, cat_rec_order
			, category_id
			, rental_rec_order
			, film_id
			, film_category_rank
			, total_rentals
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
				, a.film_category_rank AS rental_rec_order
				, a.film_id
				, a.film_category_rank
				, a.total_rentals
			FROM 
				marketing.customer_reclist_master_nonspecific AS a
					LEFT JOIN 
						marketing.customer_category AS b
							ON b.customer_id = a.customer_id

			WHERE
				a.customer_id = NEW.customer_id
					AND
				(b.customer_id = a.customer_id
					AND
				b.category_id = a.category_id)
					AND
				b.recommendation_order_historical IN (
					SELECT recommendation_order_historical
						FROM 
					marketing.customer_category)

			ORDER BY
				a.customer_id, 2, a.film_category_rank DESC
		)

		SELECT
			  customer_id
			, cat_rec_order
			, category_id 
			, rental_rec_order
			, film_id
			, film_category_rank
			, total_rentals
		FROM combined_master_with_cxcat

		WHERE
			customer_id = NEW.customer_id;
		
		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### ####
		
		RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
	
	END;
$trigger_function_insert_new_customer$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_insert_new_inventory()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_insert_new_inventory$
	
	BEGIN
	
		-- #### #### #### #### #### #### #### #### 
				
		INSERT INTO marketing.inventory_maintenance (
			  film_id
			, inventory_id
			, life_cycle
			, new_release
			, inspect_flag
			, maintenance_complete_flag
		)
		
		VALUES (
            
			  NEW.film_id
			, NEW.inventory_id


			, 0
			, false -- NEW RELEASE FLAG
			, false -- INSPECT FLAG
			, false -- MAINTENANCE COMPLETE FLAG
		); 
	
	
		-- #### #### #### #### #### #### #### #### 
				
		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### #### 
		
		RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
	END;
$trigger_function_insert_new_inventory$;
	

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_insert_update_customer_rec_custom_preferences()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_insert_update_customer_rec_custom_preferences$

    BEGIN

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        UPDATE marketing.customer_reclist_master_specific

        SET 
            cat_rec_order = null

        WHERE
            customer_id = NEW.customer_id;

        
        -- #### #### #### #### #### #### #### #### 
		
		WITH get_customer_reclist_custom_preferences AS (

			SELECT
                  customer_id
                , category_id 
                , recommendation_order_customer_preference as cat_rec_order
            FROM
                marketing.customer_category

            WHERE 
                customer_id = OLD.customer_id
        )

        UPDATE marketing.customer_reclist_master_specific AS a 

		SET 
			cat_rec_order = b.cat_rec_order
		
        FROM 
            get_customer_reclist_custom_preferences AS b 

		WHERE
			b.customer_id = a.customer_id
                AND 
            b.category_id = a.category_id;

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


        
        -- #### #### #### #### #### #### #### #### 
        
        -- #### #### #### #### 

        RETURN NEW;

        -- #### #### #### #### #### #### #### #### 


    END;
$trigger_function_insert_update_customer_rec_custom_preferences$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_category_popularity()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_update_category_popularity$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 
	
		UPDATE marketing.category_popularity
		
		SET
			total_rentals = total_rentals + 1
			
		WHERE
			category_id = NEW.category_id;
			
		-- #### #### #### #### #### #### #### #### 

		

		
		-- #### #### #### #### 
		
			RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
		
	END;
$trigger_function_update_category_popularity$;
-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_customer_category()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_update_customer_category$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 
	
		UPDATE marketing.customer_category
		
		SET
			recommendation_order_historical = null,
			recommendation_order_average = null,
			recommendation_order_halfaverage = null
			
		WHERE
			customer_id = NEW.customer_id;
	
		-- #### #### #### #### #### #### #### #### 
		
		UPDATE marketing.customer_category
		
		SET
			historical_rental_count = historical_rental_count + 1,
			average_rental_count = average_rental_count + 1,
			halfaverage_rental_count = halfaverage_rental_count +1
			
		WHERE 
			customer_id = NEW.customer_id
				AND
			category_id = NEW.category_id;
			
		-- #### #### #### #### #### #### #### #### 
		
		WITH get_customer_category_rec_order_historical AS (
			SELECT 
				  a.customer_id
				, a.category_id
				, ROW_NUMBER() OVER (ORDER BY a.historical_rental_count DESC, b.total_rentals DESC) as recommendation_order_historical

			FROM marketing.customer_category AS a
				INNER JOIN marketing.category_popularity AS b 
					ON b.category_id = a.category_id
			
			WHERE
				a.customer_id = NEW.customer_id
		)

		UPDATE marketing.customer_category a

		SET 
			recommendation_order_historical = b.recommendation_order_historical

		FROM get_customer_category_rec_order_historical AS b

		WHERE
			b.category_id = a.category_id;

			-- #### #### #### #### #### #### #### #### 

		WITH get_customer_category_rec_order_average AS (
			SELECT 
				  a.customer_id
				, a.category_id
				, ROW_NUMBER() OVER (ORDER BY a.average_rental_count DESC, b.total_rentals DESC) as recommendation_order_average

			FROM marketing.customer_category AS a
				INNER JOIN marketing.category_popularity AS b
					ON b.category_id = a.category_id
			
			WHERE
				a.customer_id = NEW.customer_id
		)

		UPDATE marketing.customer_category a

		SET 
			recommendation_order_average = b.recommendation_order_average

		FROM get_customer_category_rec_order_average AS b

		WHERE
			b.category_id = a.category_id;

			-- #### #### #### #### #### #### #### #### 

		WITH get_customer_category_rec_order_halfaverage AS (
			SELECT 
				  a.customer_id
				, a.category_id
				, ROW_NUMBER() OVER (ORDER BY a.halfaverage_rental_count DESC, b.total_rentals DESC ) as recommendation_order_halfaverage

			FROM marketing.customer_category AS a
				INNER JOIN marketing.category_popularity AS b 
					ON b.category_id = a.category_id
			
			WHERE
				a.customer_id = NEW.customer_id
		)

		UPDATE marketing.customer_category a

		SET 
			recommendation_order_halfaverage = b.recommendation_order_halfaverage

		FROM get_customer_category_rec_order_halfaverage AS b

		WHERE
			b.category_id = a.category_id;
		
	
		-- #### #### #### #### #### #### #### #### 
		
		UPDATE marketing.customer_category
		
		SET
			recommendation_order_customer_preference = recommendation_order_historical
			
		WHERE 
			customer_id = NEW.customer_id;

		-- #### #### #### #### #### #### #### #### 
		
		WITH get_customer_custom_rec_preferences AS (
			
			SELECT
				  customer_id
				, category_id
				, customer_rec_custom_order
				, customer_rec_custom_amount
			FROM
				marketing.customer_rec_custom_preferences
		
			WHERE
				customer_id = NEW.customer_id
		)
		
		UPDATE marketing.customer_category AS a
		
		SET
			recommendation_order_customer_preference = b.customer_rec_custom_order
			
		FROM 
			get_customer_custom_rec_preferences AS b
			
		WHERE
			b.category_id = a.category_id;
			
		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### #### 
		
			RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
		
	END;
$trigger_function_update_customer_category$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_customer_reclist_master_nonspecific()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_update_customer_reclist_master_nonspecific$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 	
		
		DELETE FROM marketing.customer_reclist_master_nonspecific
		
		WHERE
			customer_id = NEW.customer_id
				AND
			film_id = NEW.film_id;
	
		-- #### #### #### #### #### #### #### #### 	
		
		UPDATE marketing.customer_reclist_master_nonspecific
		
		SET
			film_rec_order = null
						
		WHERE
			customer_id = NEW.customer_id;
		
		-- #### #### #### #### #### #### #### #### 	
		
		WITH get_customer_reclist_master_nonspecific_values AS (

			SELECT
				  customer_id
				, film_rank
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
			FROM marketing.customer_reclist_master_nonspecific
			
			WHERE
				customer_id = NEW.customer_id
		),
		assign_row_number AS (

			SELECT
				  customer_id
				, film_rank
				, category_id
				, ROW_NUMBER() OVER (ORDER BY film_rank) as rental_rec_order_rn
				, film_id
				, film_category_rank
				, total_rentals
			
			FROM get_customer_reclist_master_nonspecific_values
		)
		
		UPDATE marketing.customer_reclist_master_nonspecific AS a
		
		SET
			film_rec_order = b.rental_rec_order_rn
			
		FROM
			assign_row_number AS b
			
		WHERE
			(b.customer_id = a.customer_id
				AND
			b.film_id = a.film_id);
		
		-- #### #### #### #### #### #### #### #### 		
		
				
		-- #### #### #### #### #### #### #### #### 
				
		
		-- #### #### #### #### 
		
			RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 		

		
	END;
$trigger_function_update_customer_reclist_master_nonspecific$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_customer_reclist_master_specific()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_update_customer_reclist_master_specific$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 	
		
		DELETE FROM marketing.customer_reclist_master_specific
		
		WHERE
			customer_id = NEW.customer_id
				AND
			film_id = NEW.film_id;
	
		-- #### #### #### #### #### #### #### #### 	
		
		UPDATE marketing.customer_reclist_master_specific
		
		SET
			rental_rec_order = null
						
		WHERE
			customer_id = NEW.customer_id
                AND
            category_id = NEW.category_id;
		
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
			
			WHERE
				customer_id = NEW.customer_id
                    AND
                category_id = NEW.category_id
		),
		assign_row_number AS (

			SELECT
				  customer_id
                , cat_rec_order
				, category_id
				, ROW_NUMBER() OVER (ORDER BY film_category_rank) as rental_rec_order_rn
				, film_id
				, film_category_rank
				, total_rentals
			
			FROM get_customer_reclist_master_specific_values
		)
		
		UPDATE marketing.customer_reclist_master_specific AS a
		
		SET
			rental_rec_order = b.rental_rec_order_rn
			
		FROM
			assign_row_number AS b
			
		WHERE
			(b.customer_id = a.customer_id
				AND
			b.film_id = a.film_id);
		
		-- #### #### #### #### #### #### #### #### 		
		
				
		-- #### #### #### #### #### #### #### #### 
				
		
		-- #### #### #### #### 
		
			RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 		

		
	END;
$trigger_function_update_customer_reclist_master_specific$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_customer_reclist_summary_nonspecific()
    RETURNS TRIGGER 
    LANGUAGE plpgsql
    AS $trigger_function_update_customer_reclist_summary_nonspecific$


    BEGIN 

        -- #### #### #### #### #### #### #### #### 

        DELETE FROM marketing.customer_reclist_master_nonspecific
		
		WHERE
			customer_id = NEW.customer_id;
	
		-- #### #### #### #### #### #### #### #### 	

        INSERT INTO marketing.customer_reclist_summary_nonspecific (

				  customer_id
				, film_rec_order
				, film_id
				, category_id
        )


        WITH get_customer_reclist_summary_nonspecific AS (
			
			SELECT
				  customer_id
                , film_rec_order
				, film_id
				, category_id
			
			FROM
				marketing.customer_reclist_master_nonspecific	
			
            WHERE
                (customer_id = NEW.customer_id)
                    AND 
                (film_rec_order <= 10)

			ORDER BY
				customer_id, film_rec_order

		)

        SELECT
			  customer_id
            , film_rec_order
			, film_id
			, category_id
		FROM
            get_customer_reclist_summary_nonspecific;

    	-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### 

        RETURN NEW;

        -- #### #### #### #### #### #### #### ####    

    END;
$trigger_function_update_customer_reclist_summary_nonspecific$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    12     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_customer_reclist_summary_specific()
    RETURNS TRIGGER 
    LANGUAGE plpgsql
    AS $trigger_function_update_customer_reclist_summary_specific$


    BEGIN 

        -- #### #### #### #### #### #### #### #### 

        DELETE FROM marketing.customer_reclist_master_specific
		
		WHERE
			customer_id = NEW.customer_id;
	
		-- #### #### #### #### #### #### #### #### 	

        INSERT INTO marketing.customer_reclist_summary_specific (

                  customer_id
                , cat_rec_order
                , rental_rec_order
                , film_id
                , category_id
        )


        WITH get_customer_reclist_summary_specific_topfives_filmcat AS (
			
			SELECT
				  customer_id
                , cat_rec_order
				, rental_rec_order
				, film_id
				, category_id
			
			FROM
				marketing.customer_reclist_master_specific	
			
            WHERE
                (customer_id = NEW.customer_id)
                    AND 
                (rental_rec_order <= 5
                    AND
                cat_rec_order <= 5)

			ORDER BY
				customer_id, cat_rec_order, rental_rec_order

		)
        , get_first_cat_films AS (

            SELECT 
                  customer_id
                , cat_rec_order
                , rental_rec_order
                , film_id
                , category_id
            FROM 
                get_customer_reclist_summary_specific_topfives_filmcat
            
            WHERE
                cat_rec_order = 1
        )
        , get_second_cat_films AS (

            SELECT 
                  customer_id
                , cat_rec_order
                , rental_rec_order
                , film_id
                , category_id
            FROM 
                get_customer_reclist_summary_specific_topfives_filmcat
            
            WHERE
                cat_rec_order = 2
                    AND
                rental_rec_order <= 4
        )
        , get_third_cat_films AS (

            SELECT 
                  customer_id
                , cat_rec_order
                , rental_rec_order
                , film_id
                , category_id
            FROM 
                get_customer_reclist_summary_specific_topfives_filmcat
            
            WHERE
                cat_rec_order = 3
                    AND
                rental_rec_order <= 3
        )
        , get_forth_cat_films AS (

            SELECT 
                  customer_id
                , cat_rec_order
                , rental_rec_order
                , film_id
                , category_id
            FROM 
                get_customer_reclist_summary_specific_topfives_filmcat
            
            WHERE
                cat_rec_order = 4
                    AND
                rental_rec_order <= 2
        )
        , get_fifth_cat_films AS (

            SELECT 
                  customer_id
                , cat_rec_order
                , rental_rec_order
                , film_id
                , category_id
            FROM 
                get_customer_reclist_summary_specific_topfives_filmcat
            
            WHERE
                cat_rec_order = 5
                    AND 
                rental_rec_order <= 1
        )
        , build_list AS (
            
            (
                SELECT
                      customer_id
                    , cat_rec_order
                    , rental_rec_order
                    , film_id
                    , category_id
                FROM
                    get_first_cat_films
            )
                UNION ALL 
            (
                SELECT
                      customer_id
                    , cat_rec_order
                    , rental_rec_order
                    , film_id
                    , category_id
                FROM
                    get_second_cat_films
            )
                UNION ALL 
            (
                SELECT
                      customer_id
                    , cat_rec_order
                    , rental_rec_order
                    , film_id
                    , category_id
                FROM
                    get_third_cat_films
            )
                UNION ALL 
            (
                SELECT
                      customer_id
                    , cat_rec_order
                    , rental_rec_order
                    , film_id
                    , category_id
                FROM
                    get_forth_cat_films
            )
                UNION ALL
            (
                SELECT
                      customer_id
                    , cat_rec_order
                    , rental_rec_order
                    , film_id
                    , category_id
                FROM
                    get_fifth_cat_films
            )
        )

        SELECT
              customer_id
            , cat_rec_order
            , rental_rec_order
            , film_id
            , category_id

        FROM   
            build_list;


        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### 

        RETURN NEW;

        -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_update_customer_reclist_summary_specific$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_insert_customer_watch_history()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_insert_customer_watch_history$
	
	BEGIN
	
	
		-- #### #### #### #### 
		-- Setting Customer Watch History Order To Null.
		
		
		UPDATE marketing.customer_watch_history_detailed
		
		SET
			customer_watch_history_desc_order = null
			
		WHERE
			customer_id = NEW.customer_id;
	
		
		-- #### #### #### #### #### #### #### #### 
		
		INSERT INTO marketing.customer_watch_history_detailed(
              customer_id
            , rental_id
            , inventory_id
            , film_id
            , category_id
            , rental_date 
            , return_date
        )

        SELECT 
		      a.customer_id
		    , a.rental_id
		    , a.inventory_id
		    , b.film_id
		    , c.category_id
		    , a.rental_date
		    , a.return_date
		
	    FROM public.rental a
	        INNER JOIN public.inventory b
		        ON b.inventory_id = a.inventory_id

                INNER JOIN public.film_category c
                    ON c.film_id = b.film_id

        WHERE
            a.customer_id = NEW.customer_id
				AND 
			a.rental_id = NEW.rental_id;
			
    
		-- #### #### #### #### #### #### #### #### 
		
        WITH get_customer_watch_history AS (

			SELECT
				  customer_id
                , rental_id
                , inventory_id
                , film_id 
                , category_id
                , rental_date 
                , return_date 
			FROM 
				marketing.customer_watch_history_detailed

            WHERE
                customer_id = NEW.customer_id
		),
		assign_watch_history_order_row_number AS (

			SELECT
				  customer_id
                , rental_id
                , inventory_id
                , film_id 
                , category_id
                , rental_date 
                , return_date 
				, ROW_NUMBER() OVER (ORDER BY rental_id DESC) AS customer_watch_history_desc_order_row_number
			FROM 
				get_customer_watch_history
		)


		UPDATE marketing.customer_watch_history_detailed AS a

		SET customer_watch_history_desc_order = b.customer_watch_history_desc_order_row_number

		FROM assign_watch_history_order_row_number AS b

		WHERE 
			b.customer_id = a.customer_id
				AND
			b.rental_id = a.rental_id;
		
		-- #### #### #### #### 
		
		RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
	END;
$trigger_function_insert_customer_watch_history$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    14     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_film_category_popularity()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_update_film_category_popularity$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 
	
		UPDATE marketing.film_category_popularity
		
		SET
			total_rentals = total_rentals + 1
			
		WHERE
			film_id = NEW.film_id;
			
		-- #### #### #### #### #### #### #### #### 

		UPDATE marketing.film_category_popularity
		
		SET
			film_rank = null;
			
		-- #### #### #### #### #### #### #### #### 
		
		WITH generate_film_rank AS (
			SELECT
				  film_id
				, ROW_NUMBER() OVER (ORDER BY total_rentals DESC) AS film_rank
			FROM
				marketing.film_category_popularity
		)
		
		UPDATE marketing.film_category_popularity AS a
		
		SET
			film_rank = b.film_rank
		
		FROM
			generate_film_rank AS b
			
		WHERE
			b.film_id = a.film_id;
		
		-- #### #### #### #### #### #### #### #### 
		
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
			
		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### #### 
		
			RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 		

		
	END;
$trigger_function_update_film_category_popularity$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    15     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_inventory_maintenance()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_update_inventory_maintenance$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 
	
		UPDATE marketing.inventory_maintenance
		
		SET
			life_cycle = life_cycle + 1
			
		WHERE
			inventory_id = NEW.inventory_id;
			
		-- #### #### #### #### #### #### #### #### 

		UPDATE marketing.inventory_maintenance
		
		SET
			inspect_flag = true
			
		WHERE
			inventory_id = NEW.inventory_id
				AND
			(
				(life_cycle % 5 = 0)
					AND
				(maintenance_complete_flag = false)
			);
			
		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### #### 
		
			RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 		

		
	END;
$trigger_function_update_inventory_maintenance$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    16     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_new_release()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_update_new_releases$

    BEGIN 
    
    
    -- #### #### #### #### #### #### #### #### 

    UPDATE marketing.film_category_popularity

    SET
        new_release = false

    WHERE
        film_id = OLD.film_id;

    -- #### #### #### #### #### #### #### #### 

    DELETE FROM marketing.new_releases

    WHERE
        film_id = OLD.film_id;


    -- #### #### #### #### #### #### #### #### 

    -- #### #### #### #### #### #### #### #### 

    -- #### #### #### #### 

    RETURN NEW;

    -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_update_new_releases$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    17     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_rental_return()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_update_rental_return$

    BEGIN 
    
    
    -- #### #### #### #### #### #### #### #### 

    UPDATE marketing.customer_watch_history_detailed

    SET
        return_date = NEW.return_date

    WHERE
        rental_id = OLD.rental_id;

    -- #### #### #### #### #### #### #### #### 

    DELETE FROM marketing.failed_returns

    WHERE
        rental_id = OLD.rental_id;


    -- #### #### #### #### #### #### #### #### 

    -- #### #### #### #### #### #### #### #### 

    -- #### #### #### #### 

    RETURN NEW;

    -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_update_rental_return$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####