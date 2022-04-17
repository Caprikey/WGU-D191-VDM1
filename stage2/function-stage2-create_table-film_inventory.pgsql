CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_film_inventory()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2filminv$
	
	BEGIN 
	
		CREATE TABLE staging.vdm1_stage2_film_inventory AS (
	
		SELECT 
			  a.film_id
			, b.inventory_id
		FROM staging.vdm1_stage1_film a
			INNER JOIN staging.vdm1_stage1_inventory b
				ON b.film_id = a.film_id
	);
	
	END;
$vdm1_stage2filminv$;