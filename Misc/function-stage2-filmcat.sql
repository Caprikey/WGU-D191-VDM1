CREATE OR REPLACE FUNCTION staging.f_stage2_film_category()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $stage2filmcat$
	
	BEGIN 
	
	CREATE TABLE staging.stage2_film_category AS (
		SELECT 
			  film_id
			, category_id
		FROM staging.stage2_films

		ORDER BY
			film_id, category_id
	);
	
	END;
$stage2filmcat$;

