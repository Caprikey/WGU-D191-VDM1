CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rnow_number()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_reclist_master_specific_row_number$
	
	
	BEGIN
		
		WITH get_customer_reclist_master_specific_values AS (

			SELECT
				  customer_id
				, cat_rec_order
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
			FROM staging.vdm1_stage4_customer_reclist_master_specific
		),
		assign_row_number AS (

			SELECT
				  customer_id
				, cat_rec_order
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
				, ROW_NUMBER() OVER(PARTITION BY customer_id, cat_rec_order ORDER BY cat_rec_order, film_category_rank) AS rental_rec_order_rn
			FROM get_customer_reclist_master_specific_values
		)


		UPDATE staging.vdm1_stage4_customer_reclist_master_specific a

		SET rental_rec_order = assign_row_number.rental_rec_order_rn

		FROM assign_row_number 	  

		WHERE 
			(a.customer_id = assign_row_number.customer_id
				AND
			a.film_id = assign_row_number.film_id);
			
	END;

$vdm1_stage4_calc_update_customer_reclist_master_specific_row_number$;