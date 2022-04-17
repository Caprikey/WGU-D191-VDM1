CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_cobbwebbed_film_inventory()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_cobbwebbed_film_inventory$
	
	BEGIN 

		TRUNCATE TABLE staging.vdm1_stage4_cobbwebbed_film_inventory;


		INSERT INTO staging.vdm1_stage4_cobbwebbed_film_inventory(
			  film_id
            , inventory_id
		)		
		
		SELECT
			  a.film_id
			, c.inventory_id
		FROM staging.vdm1_stage4_film_category_popularity a
            LEFT JOIN staging.vdm1_stage4_new_releases b
                ON b.film_id = a.film_id
            LEFT JOIN staging.vdm1_stage4_film_inventory c
                ON c.film_id = a.film_id

		
		WHERE a.total_rentals = 0
            AND
        b.film_id != a.film_id;
		
	END;
$vdm1_stage4_calc_insert_cobbwebbed_film_inventory$;