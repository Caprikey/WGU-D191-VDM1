CREATE OR REPLACE FUNCTION t_f_update_customer_watch_history()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_update_customer_watch_history$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

        UPDATE marketing.customer_watch_history_details

        SET
            customer_watch_history_desc_order = null

        FROM marketing.customer_watch_history_details AS a

        WHERE 
            a.customer_id = NEW.customer_id;

        -- #### #### #### #### #### #### #### #### 

        INSERT INTO marketing.customer_watch_history_details(
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
		
	    FROM rental a
	        INNER JOIN inventory b
		        ON b.inventory_id = a.inventory_id

                INNER JOIN film_category c
                    ON c.film_id = b.film_id

        WHERE
            a.customer_id = NEW.customer_id
    
        GROUP BY
            (a.customer_id, a.rental_id, a.inventory_id, b.film_id, c.category_id, a.rental_date, a.return_date)
        ORDER BY 
            a.customer_id;

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
			FROM marketing.customer_watch_history_details

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
				, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY rental_id DESC) AS customer_watch_history_desc_order_row_number
			FROM get_customer_watch_history

        WHERE
            customer_id = NEW.customer_id
		)


		UPDATE marketing.customer_watch_history_details

		SET customer_watch_history_desc_order = a.customer_watch_history_desc_order_row_number

		FROM assign_watch_history_order_row_number AS a

		WHERE 
			NEW.customer_id = a.customer_id
			    AND
			NEW.rental_id = a.rental_id;

        -- #### #### #### #### #### #### #### #### 

        RETURN NEW;

        -- #### #### #### #### #### #### #### #### 
             
    END;
$trigger_function_update_customer_watch_history$;