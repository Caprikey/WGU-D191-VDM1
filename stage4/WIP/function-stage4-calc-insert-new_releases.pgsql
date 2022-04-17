CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_new_releases()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_new_releases$
	
	BEGIN 

		TRUNCATE TABLE staging.vdm1_stage_new_releases;


		INSERT INTO staging.vdm1_stage4_new_releases(
			  film_id
		)		
		
		SELECT
			  film_id
			, default
		FROM staging.vdm1_stage4_films
		
		WHERE new_release = true;
		
	END;
$vdm1_stage4_calc_insert_new_releases$;