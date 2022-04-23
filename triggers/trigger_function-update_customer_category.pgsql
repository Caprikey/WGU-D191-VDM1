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