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

            -- TODO :: REMOVE THESE ONCE DEFAULT VALUES ARE SET.

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
	