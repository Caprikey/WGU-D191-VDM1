CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_reclist_master_nonspecific_row_number$
	
	
	BEGIN
		
		WITH get_customer_reclist_master_nonspecific_values AS (

			SELECT
				  customer_id
				, film_rank
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
			FROM staging.vdm1_stage4_customer_reclist_master_nonspecific
		),
		assign_row_number AS (

			SELECT
				  customer_id
				, film_rank
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
				, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY film_rank) as rental_rec_order_rn
			FROM get_customer_reclist_master_nonspecific_values
		)


		UPDATE staging.vdm1_stage4_customer_reclist_master_nonspecific a

		SET film_rec_order = assign_row_number.rental_rec_order_rn

		FROM assign_row_number 	  

		WHERE 
			(a.customer_id = assign_row_number.customer_id
				AND
			a.film_id = assign_row_number.film_id);
			
	END;

$vdm1_stage4_calc_update_customer_reclist_master_nonspecific_row_number$;

