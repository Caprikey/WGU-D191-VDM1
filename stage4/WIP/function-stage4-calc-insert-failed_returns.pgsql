CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_failed_returns_v2()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_failed_returns$
	
	BEGIN 

        TRUNCATE TABLE staging.vdm1_stage4_failed_returns;

		INSERT INTO staging.vdm1_stage4_failed_returns(

			  customer_id
			, rental_id
			, film_id
			, inventory_id
			, store_id
			, rental_date
			, expected_return_date
		)		
		
		SELECT
			  a.customer_id
			, rental_id
			, film_id
			, inventory_id
			, store_id
			, rental_date
			, staging.f_vdm1_stage4_calc_expected_return_date(film_id::int, rental_date) as expected_return_date
		FROM staging.vdm1_stage4_rentals a
			INNER JOIN staging.vdm1_stage4_customers b
				ON b.customer_id = a.customer_id
			INNER JOIN staging.vdm1_stage4_films using (film_id)
	
		WHERE return_date IS NULL;

	END;
$vdm1_stage4_calc_insert_failed_returns$;