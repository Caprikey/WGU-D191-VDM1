CREATE OR REPLACE FUNCTION t_f_update_inventory_maintenance()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_update_inventory_maintenance$

    BEGIN
        -- #### #### #### #### #### #### #### #### 

        UPDATE marketing.inventory_maintenance

        SET
            life_cycle = a.life_cycle + 1

        FROM marketing.inventory_maintenance AS a
        
        WHERE
            a.inventory_id = NEW.inventory_id;

        -- #### #### #### #### #### #### #### #### 

        UPDATE marketing.inventory_maintenance

        SET
            inspect_flag = true
        
        FROM marketing.inventory_maintenance AS b
		
        WHERE 
			b.inventory_id = NEW.inventory_id
				AND
            (
				(b.life_cycle % 5) = 0
                	AND
            	b.maintenance_complete_flag = false
			);

        -- #### #### #### #### #### #### #### #### 

        RETURN NEW;

        -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_update_inventory_maintenance$;