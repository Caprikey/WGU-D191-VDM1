CREATE OR REPLACE FUNCTION staging.f_stage2_film_inventory()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $stage2filminv$
	
	BEGIN 
	
		CREATE TABLE staging.stage2_film_inventory AS (
	
		SELECT 
			  a.film_id
			, b.inventory_id
		FROM staging.stage1_film a
			INNER JOIN staging.stage1_inventory b
				ON b.film_id = a.film_id
	);
	
	END;
$stage2filminv$;