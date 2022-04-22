CREATE OR REPLACE FUNCTION staging.f_stage2_rentals()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $stage2rentals$
		
	BEGIN 

		CREATE TABLE staging.stage2_rentals AS (

			SELECT
				  a.rental_id
				, a.customer_id
				, a.inventory_id
				, b.film_id
				, c.category_id
				, a.rental_date
				, a.return_date
			FROM staging.stage1_rental a
				INNER JOIN staging.stage1_inventory b
					ON b.inventory_id = a.inventory_id
				INNER JOIN staging.stage2_films c
					ON c.film_id = b.film_id

		);
		
	END;
$stage2rentals$;