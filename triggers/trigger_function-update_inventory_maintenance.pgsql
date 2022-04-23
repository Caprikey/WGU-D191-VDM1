CREATE OR REPLACE FUNCTION marketing.t_f_update_inventory_maintenance()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_update_inventory_maintenance$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 
	
		UPDATE marketing.inventory_maintenance
		
		SET
			life_cycle = life_cycle + 1
			
		WHERE
			inventory_id = NEW.inventory_id;
			
		-- #### #### #### #### #### #### #### #### 

		UPDATE marketing.inventory_maintenance
		
		SET
			inspect_flag = true
			
		WHERE
			inventory_id = NEW.inventory_id
				AND
			(
				(life_cycle % 5 = 0)
					AND
				(maintenance_complete_flag = false)
			);
			
		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### #### 
		
			RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 		

		
	END;
$trigger_function_update_inventory_maintenance$;