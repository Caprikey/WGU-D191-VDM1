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