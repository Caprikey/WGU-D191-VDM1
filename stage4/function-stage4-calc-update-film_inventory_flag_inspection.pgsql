CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calcupdate_film_inventory_flag_inspection$

	BEGIN
	
		UPDATE staging.vdm1_stage4_film_inventory 

		SET inspect_flag = true
        
        
		WHERE life_cycle % 5 = 0
            AND
        maintenance_complete_flag = false;
	
	
	END;

$vdm1_stage4_calcupdate_film_inventory_flag_inspection$;

