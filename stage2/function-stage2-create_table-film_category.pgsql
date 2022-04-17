CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_film_category()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2filmcat$
	
	BEGIN 
	
	CREATE TABLE staging.vdm1_stage2_film_category AS (
		SELECT 
			  film_id
			, category_id
		FROM staging.vdm1_stage2_films

		ORDER BY
			film_id, category_id
	);
	
	END;
$vdm1_stage2filmcat$;

