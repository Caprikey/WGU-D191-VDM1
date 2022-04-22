CREATE OR REPLACE FUNCTION t_f_insert_customer_watch_history()
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