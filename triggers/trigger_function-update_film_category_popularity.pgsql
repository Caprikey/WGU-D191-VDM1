CREATE OR REPLACE FUNCTION t_f_update_film_category_popularity()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_update_film_category_popularity$

    BEGIN
        -- #### #### #### #### #### #### #### #### 

    		WITH get_film_category AS (
		
			SELECT
				  a.film_id
                , c.category_id
			FROM inventory a
				INNER JOIN rental b
					ON b.inventory_id = a.inventory_id
                INNER JOIN film_category c 
                    ON c.film_id = a.film_id
			
			WHERE
				a.inventory_id = NEW.inventory_id
		)

        -- #### #### #### #### #### #### #### #### 

        UPDATE marketing.film_category_popularity AS a

        SET
            total_rentals = a.total_rentals + 1

        -- FROM marketing.film_category_popularity AS a
        FROM get_film_category AS b
        
        WHERE
            b.film_id = b.film_id;

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

    	WITH get_film_category AS (
		
			SELECT
				  a.film_id
                , c.category_id
			FROM inventory a
				INNER JOIN rental b
					ON b.inventory_id = a.inventory_id
                INNER JOIN film_category c 
                    ON c.film_id = a.film_id
			
			WHERE
				a.inventory_id = NEW.inventory_id
		)

        UPDATE marketing.film_category_popularity AS c

        SET
            film_rank = null
        
        FROM get_film_category AS d
		
        WHERE 
            d.film_id = c.film_id;


        -- #### #### #### #### #### #### #### #### 

    	WITH get_film_category AS (
		
			SELECT
				  a.film_id
                , c.category_id
			FROM inventory a
				INNER JOIN rental b
					ON b.inventory_id = a.inventory_id
                INNER JOIN film_category c 
                    ON c.film_id = a.film_id
			
			WHERE
				a.inventory_id = NEW.inventory_id
		)
        
        UPDATE marketing.film_category_popularity AS e

        SET
            film_category_rank = null
        
        FROM get_film_category AS f
		
        WHERE 
            f.film_id = e.film_id
                AND 
            f.category_id = e.category_id;


        -- #### #### #### #### #### #### #### #### 

        WITH calc_film_rank AS (
            
            SELECT
                  film_id
                , category_id
                , ROW_NUMBER() OVER (ORDER BY total_rentals DESC) as film_rank
            FROM
                marketing.film_category_popularity
        )

        UPDATE marketing.film_category_popularity as g

        SET
            film_rank = h.film_rank
        
        FROM calc_film_rank AS h
		
        WHERE 
            h.film_id = g.film_id;


        -- #### #### #### #### #### #### #### #### 
        
        WITH calc_film_category_rank AS (
            
            SELECT
                  film_id
                , category_id
                , ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY total_rentals DESC) as film_category_rank
            FROM
                marketing.film_category_popularity
        )
        UPDATE marketing.film_category_popularity AS i

        SET
            film_category_rank = j.film_category_rank
        
        FROM calc_film_category_rank AS j
		
        WHERE 
            j.film_id = i.film_id
                AND 
            j.category_id = i.category_id;


        -- #### #### #### #### #### #### #### #### 

        RETURN NEW;

        -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_update_film_category_popularity$;