CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_rentals()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2rentals$
		
	BEGIN 

		CREATE TABLE staging.vdm1_stage2_rentals AS (

			SELECT
				  a.rental_id
				, a.customer_id
				, a.inventory_id
				, b.film_id
				, c.category_id
				, a.rental_date
				, a.return_date
			FROM staging.vdm1_stage1_rental a
				INNER JOIN staging.vdm1_stage1_inventory b
					ON b.inventory_id = a.inventory_id
				INNER JOIN staging.vdm1_stage2_films c
					ON c.film_id = b.film_id

		);
		
	END;
$vdm1_stage2rentals$;