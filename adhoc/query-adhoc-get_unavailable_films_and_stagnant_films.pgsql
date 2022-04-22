		SELECT
			  a.film_id
		FROM staging.vdm1_stage5_film_category_popularity a
            LEFT JOIN staging.vdm1_stage5_new_releases b
                ON b.film_id = a.film_id
		
		WHERE
			a.total_rentals = 0 
				AND
			NOT EXISTS (
					SELECT 
							film_id
						FROM 
							staging.vdm1_stage5_new_releases
					)
				AND
			NOT EXISTS (
				SELECT 
					film_id
				FROM
					inventory
				where film_id = a.film_id
			)

/*

-- Gives 4581 results. One inventory_id missing. Inventory_id = 5
    SELECT 
        COUNT(DISTINCT inventory_id)
    FROM 
        rental

*/


