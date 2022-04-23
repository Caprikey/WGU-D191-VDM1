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