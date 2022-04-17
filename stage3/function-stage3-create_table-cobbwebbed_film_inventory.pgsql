CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_cobbwebbed_film_inventory()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_cobbwebbed_film_inventory$
	
	BEGIN 
	
	CREATE TABLE staging.vdm1_stage3_cobbwebbed_film_inventory(
		  cbfilms_id INTEGER NOT NULL
		, film_id INTEGER NOT NULL
		, inventory_id INTEGER NOT NULL
	);
	END;
$vdm1_stage3_create_table_cobbwebbed_film_inventory$;