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