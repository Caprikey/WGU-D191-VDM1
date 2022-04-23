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