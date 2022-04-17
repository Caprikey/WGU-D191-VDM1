CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_row_number_get_s_list()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_row_number_get_s_list$
	
	BEGIN

		WITH get_s_list as (SELECT 
			  a.customer_id
			, a.category_rank
			, b.*
			, ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY film_category_rank) as rec_order
		FROM staging.vdm1_stage4_customer_category a
			INNER JOIN staging.vdm1_stage4_film_category b USING (category_id)

			WHERE a.category_rank = 'S'
			AND b.film_id NOT IN (
				SELECT 
					DISTINCT film_id
				FROM staging.vdm1_stage4_rentals
				WHERE customer_id = a.customer_id
			)

			ORDER By 1,5 DESC, 8
		)
	
		SELECT 
			* 
		FROM get_s_list
		
		-- WHERE rec_order <=10
		
	END;
$vdm1_stage4_calc_row_number_get_s_list$;