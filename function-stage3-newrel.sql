CREATE OR REPLACE FUNCTION staging.f_stage3_new_releases()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $stage3newrel$
	
	BEGIN 
	
		CREATE TABLE new_release(
			  nr_film_id INTEGER NOT NULL
			, film_id INTEGER NOT NULL
			, status BOOLEAN NOT NULL DEFAULT TRUE
		);
	
	END;
$stage3newrel$;
