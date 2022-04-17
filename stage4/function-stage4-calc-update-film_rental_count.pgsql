CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_film_category_popularity_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_film_category_popularity_count$
	
	BEGIN
	
		-- CTE used to get rental count since aggregates are not allowed in update statements. 
		WITH get_rentalcount_film AS (
			SELECT 
				  film_id
				, count(film_id) AS rentalcount_total
			FROM staging.vdm1_stage4_rentals

			GROUP BY
				film_id
		)

		-- Declaring Table that will be updated

		UPDATE staging.vdm1_stage4_film_category_popularity

		SET total_rentals = get_rentalcount_film.rentalcount_total

		FROM get_rentalcount_film
		
		WHERE 
			vdm1_stage4_film_category_popularity.film_id = get_rentalcount_film.film_id;
			
	END;
$vdm1_stage4_calc_update_film_category_popularity_count$;