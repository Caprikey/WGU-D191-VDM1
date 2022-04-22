CREATE OR REPLACE FUNCTION t_f_insert_new_customer_category()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_insert_new_customer_category$

    BEGIN 

        -- #### #### #### #### #### #### #### #### 
        
        INSERT INTO marketing.customer_category (
              customer_id
            , category_id
        )

        SELECT
              a.customer_id
            , b.category_id
        FROM customer a
            CROSS JOIN category b 

        WHERE
            a.customer_id = NEW.customer_id;


        -- #### #### #### #### #### #### #### #### 


        UPDATE marketing.customer_category

        SET
            historical_rental_count = 0,
            average_rental_count = 0,
            halfaverage_rental_count = 0

        FROM marketing.customer_category c

        WHERE
            c.customer_id = NEW.customer_id;


        -- #### #### #### #### #### #### #### #### 

        UPDATE marketing.customer_category

        SET
            recommendation_order_historical = null,
            recommendation_order_average = null,
            recommendation_order_halfaverage = null,
            recommendation_order_customer_preference = null

        FROM marketing.customer_category AS d

        WHERE
            d.customer_id = NEW.customer_id;

        -- #### #### #### #### #### #### #### #### 

        WITH calc_recommendation_row_number AS (

            SELECT
                  customer_id
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY e.historical_rental_count DESC) AS recommendation_order_historical
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY e.average_rental_count DESC) AS recommendation_order_average
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY e.halfaverage_rental_count DESC) AS recommendation_order_halfaverage
            FROM 
                marketing.customer_category
        )

        -- #### #### #### #### 
        
        UPDATE marketing.customer_category

        SET
              recommendation_order_historical = e.recommendation_order_historical
            , recommendation_order_average = e.recommendation_order_average
            , recommendation_order_halfaverage = e.recommendation_order_halfaverage

        FROM calc_recommendation_row_number AS e

        WHERE
            e.customer_id = NEW.customer_id;

        -- #### #### #### #### #### #### #### #### 

        UPDATE marketing.customer_category

        SET
            recommendation_order_customer_preference = f.recommendation_order_historical

        FROM marketing.customer_category AS f

        WHERE
            f.customer_id = NEW.customer_id;
        

        -- #### #### #### #### #### #### #### #### 

        WITH get_customer_custom_preferences AS (

			SELECT 
				  customer_id
				, category_id
				, customer_rec_custom_order
				, customer_rec_custom_amount
			FROM 
				marketing.customer_rec_custom_preferences
		)

        -- #### #### #### ####

		UPDATE marketing.customer_category AS g
		
		SET 
            recommendation_order_customer_preference = h.customer_rec_custom_order

		FROM get_customer_custom_preferences AS h

		WHERE 
			(NEW.customer_id = h.customer_id)
				AND
			(NEW.category_id = h.category_id);

        -- #### #### #### #### #### #### #### #### 

    END;

$trigger_function_insert_new_customer_category$;