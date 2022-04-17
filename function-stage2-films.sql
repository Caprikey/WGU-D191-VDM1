CREATE OR REPLACE FUNCTION staging.f_stage2_films()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $stage2films$
	
	BEGIN 
		
		CREATE TABLE staging.stage2_films AS (
			SELECT
				  a.film_id
				, a.title
				, b.category_id
				, a.release_year
				, a.language_id
				, a.length
				, a.rating
				, a.description
			FROM staging.stage1_film a
				INNER JOIN staging.stage1_film_category b
					ON b.film_id = a.film_id
		);
	END;
$stage2films$;

