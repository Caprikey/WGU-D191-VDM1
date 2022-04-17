CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_film_popularity_row_number()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_film_popularity_row_number$
	
	BEGIN
	
	
		WITH get_film_popularity_row_number AS (
			SELECT 
				film_id,
				category_id,
				ROW_NUMBER() OVER (ORDER BY total_rentals DESC) as film_popularity_rental_order
			FROM staging.vdm1_stage4_film_category_popularity
		)

		UPDATE staging.vdm1_stage4_film_category_popularity a

		SET film_rank = get_film_popularity_row_number.film_popularity_rental_order

		FROM get_film_popularity_row_number

		WHERE
			a.film_id = get_film_popularity_row_number.film_id
				AND
			a.category_id = get_film_popularity_row_number.category_id;
			
	END;
$vdm1_stage4_calc_update_film_popularity_row_number$;