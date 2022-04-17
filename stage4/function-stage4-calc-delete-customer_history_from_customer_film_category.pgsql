CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat()
    RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_delete_customer_film_category$

	BEGIN 

		WITH get_customer_watch_history AS (

			SELECT 
				  customer_id
				, film_id
				, category_id 
			FROM staging.vdm1_stage4_customer_watch_history_details
		),
		historyfromrecommended as (
			(SELECT * FROM staging.vdm1_stage4_customer_film_category)
				INTERSECT  
			(SELECT * FROM get_customer_watch_history)
		)

		DELETE FROM staging.vdm1_stage4_customer_film_category a

		WHERE EXISTS  (
			SELECT * FROM historyfromrecommended b
			where b.customer_id = a.customer_id AND b.film_id = a.film_id)

		
	END;
$vdm1_stage4_calc_delete_customer_film_category$;