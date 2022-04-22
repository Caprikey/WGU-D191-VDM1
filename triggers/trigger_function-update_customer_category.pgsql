CREATE OR REPLACE FUNCTION t_f_update_customer_category()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_update_customer_category$

    BEGIN

        -- #### #### #### #### #### #### #### #### 


        WITH get_category AS (
		
			SELECT
				a.category_id
			FROM
				film_category a
					INNER JOIN inventory b
						ON b.film_id = a.film_id
						INNER JOIN rental c
							ON c.inventory_id = b.inventory_id
			
			WHERE
				b.inventory_id = NEW.inventory_id
		)

        -- #### #### #### #### #### #### #### #### 

        UPDATE marketing.customer_category AS a

        SET
            historical_rental_count = a.historical_rental_count + 1,
            average_rental_count = a.average_rental_count + 1,
            halfaverage_rental_count = a.halfaverage_rental_count + 1

        FROM get_category AS b

        WHERE
            a.customer_id = OLD.customer_id
                AND
            b.category_id = b.category_id;


        -- #### #### #### #### #### #### #### #### 


        UPDATE marketing.customer_category

        SET
            recommendation_order_historical = null,
            recommendation_order_average = null,
            recommendation_order_halfaverage = null,
            recommendation_order_customer_preference = null

        FROM marketing.customer_category AS c

        WHERE
            c.customer_id = OLD.customer_id;


        -- #### #### #### #### #### #### #### #### 

        WITH calc_recommendation_row_number AS (

            SELECT
                  customer_id
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY historical_rental_count DESC) AS recommendation_order_historical
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY average_rental_count DESC) AS recommendation_order_average
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY halfaverage_rental_count DESC) AS recommendation_order_halfaverage
            
            FROM marketing.customer_category

            WHERE 
                customer_id = NEW.customer_id
        )

        UPDATE marketing.customer_category AS d

        SET
              recommendation_order_historical = e.recommendation_order_historical
            , recommendation_order_average = e.recommendation_order_average
            , recommendation_order_halfaverage = e.recommendation_order_halfaverage

        FROM calc_recommendation_row_number AS e

        WHERE
            (d.customer_id = e.customer_id);

        -- #### #### #### #### #### #### #### #### 

        UPDATE marketing.customer_category

        SET
            recommendation_order_customer_preference = f.recommendation_order_historical

        FROM marketing.customer_category AS f

        WHERE
            f.customer_id = OLD.customer_id;
        

        -- #### #### #### #### #### #### #### #### 

		WITH get_customer_custom_preferences AS (

			SELECT 
				  customer_id
				, category_id
				, customer_rec_custom_order
				, customer_rec_custom_amount
			FROM 
				marketing.customer_rec_custom_preferences
			
			WHERE customer_id = NEW.customer_id
		)

		UPDATE marketing.customer_category AS g
		
		SET recommendation_order_customer_preference = h.customer_rec_custom_order

		FROM get_customer_custom_preferences AS h

		WHERE 
			(g.customer_id = h.customer_id)
				AND
			(g.category_id = h.category_id);

        -- #### #### #### #### #### #### #### #### 

        RETURN NEW;

        -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_update_customer_category$;