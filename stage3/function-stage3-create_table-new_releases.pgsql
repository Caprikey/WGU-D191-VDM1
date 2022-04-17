CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_new_releases()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_new_releases$
	
	BEGIN 
	
		CREATE TABLE staging.vdm1_stage3_new_releases(
			  nr_film_id INTEGER
			, film_id INTEGER NOT NULL
			, status BOOLEAN NOT NULL DEFAULT TRUE
		);
	
	END;
$vdm1_stage3_create_table_new_releases$;