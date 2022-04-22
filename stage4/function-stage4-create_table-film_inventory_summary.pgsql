CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_create_table_film_inventory_summary()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_create_table_film_inventory_summary$

	BEGIN
		
		CREATE TABLE staging.vdm1_stage4_film_inventory_summary AS (
			SELECT 
				*
			FROM staging.vdm1_stage4_film_inventory

			WHERE
				inspect_flag = true

			ORDER BY
				life_cycle DESC, film_id, inventory_id
		);
	
	END;
$vdm1_stage4_create_table_film_inventory_summary$;n
