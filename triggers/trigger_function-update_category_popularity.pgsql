CREATE OR REPLACE FUNCTION t_f_update_category_popularity()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_update_category_popularity$

    BEGIN
        -- #### #### #### #### #### #### #### #### 

		WITH get_category AS (
		
			SELECT
				a.category_id
			FROM
				film_category a
					INNER JOIN inventory b
						ON b.film_id = a.film_id
						INNER JOIN rental c
							ON c.inventory_id = b.inventory_id
			
			WHERE
				b.inventory_id = NEW.inventory_id
		)


        -- #### #### #### #### 

        UPDATE marketing.category_popularity AS a

        SET
            total_rentals = a.total_rentals + 1

        FROM get_category AS b
        
        WHERE
            b.category_id = a.category_id;

        -- #### #### #### #### #### #### #### #### 

/*
		WITH get_category AS (
		
			SELECT
				a.category_id
			FROM
				film_category a
					INNER JOIN inventory b
						ON b.film_id = a.film_id
						INNER JOIN rental c
							ON c.inventory_id = b.inventory_id
			
			WHERE
				b.inventory_id = NEW.inventory_id
		)

        -- #### #### #### #### 

        UPDATE marketing.category_popularity AS a

        SET
            category_rank = null
        
        FROM get_category AS b
		
        WHERE 
            b.category_id = a.category_id;


        -- #### #### #### #### #### #### #### #### 


        WITH get_category AS (
		
			SELECT
				a.category_id
			FROM
				film_category a
					INNER JOIN inventory b
						ON b.film_id = a.film_id
						INNER JOIN rental c
							ON c.inventory_id = b.inventory_id
			
			WHERE
				b.inventory_id = NEW.inventory_id
		)
        
        -- #### #### #### #### 
        
        , calc_category_popularity AS (

            SELECT
                  b.category_id
                , ROW_NUMBER() OVER (ORDER BY a.total_rentals DESC) as category_popularity_rank
            FROM marketing.category_popularity AS a
                INNER JOIN get_category AS b 
                    ON b.category_id = a.category_id

        )

        -- #### #### #### #### 

        UPDATE marketing.category_popularity AS c

        SET
            category_rank = c.category_popularity_rank
        
        FROM calc_category_popularity AS d

		
        WHERE 
            d.category_id = c.category_id;

        -- #### #### #### #### #### #### #### #### 
*/
        RETURN NEW;

    END;
$trigger_function_update_category_popularity$;