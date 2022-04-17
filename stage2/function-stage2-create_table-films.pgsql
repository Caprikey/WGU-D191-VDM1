CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_films()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2films$
	
	BEGIN 
		
		CREATE TABLE staging.vdm1_stage2_films AS (
			SELECT
				  a.film_id
				, a.title
				, b.category_id
				, a.release_year
				, a.language_id
				, a.length
				, a.rating
				, a.description
				, a.rental_duration
				, a.rental_rate
				, a.replacement_cost
			FROM staging.vdm1_stage1_film a
				INNER JOIN staging.vdm1_stage1_film_category b
					ON b.film_id = a.film_id
		);
	END;
$vdm1_stage2films$;

