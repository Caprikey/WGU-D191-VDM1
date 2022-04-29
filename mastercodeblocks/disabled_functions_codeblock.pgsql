-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### DISABLED FUNCTIONS START #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 




-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- Original film recommendation master list function.


/* 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_insert_customer_reclist_master_v2()
    RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_reclist_master$

	BEGIN 

    -- TRUNCATE TABLE staging.vdm1_stage4_customer_recommendation_list_master;

    -- TRUNCATE TABLE staging.vdm1_stage4_customer_recommendation_list_master;

    INSERT INTO staging.vdm1_stage4_customer_reclist_master_nonspecific(

			  customer_id
			, film_rank
            , category_id
			, film_rec_order
			, film_id
			, film_category_rank
			, total_rentals
		)	

*/
/*
    WITH get_s_list AS (SELECT 
    	  a.customer_id
    	-- , a.category_rank
    	-- , a.category_rank_number
    	, a.recommendation_order_historical
    	, b.*
    	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
    FROM staging.vdm1_stage4_customer_category a
    	INNER JOIN staging.vdm1_stage4_film_category_popularity b USING (category_id)
    
    	--  WHERE a.category_rank = 'S'
    	-- WHERE a.category_rank_number = 1
    	WHERE a.recommendation_order_historical = 1
    	AND 
    -- 	b.film_id NOT IN (
    -- 		SELECT 
    -- 			DISTINCT film_id
    -- 		FROM staging.vdm1_stage4_rentals
    -- 		WHERE customer_id = a.customer_id
    -- 	)
    	b.film_id != ALL (
    		SELECT 
    			  unnest(customer_watch_history_distinct_film_array)
    		FROM 
    			staging.vdm1_stage4_customer_watch_history_array
    		WHERE
    			customer_id = a.customer_id
    			)
    
    	ORDER BY 1,5 DESC--, 8
    ),
    
    get_a_list AS (SELECT 
    	  a.customer_id
    	-- , a.category_rank
    	-- , a.category_rank_number
    	, a.recommendation_order_historical
    	, b.*
    	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
    FROM staging.vdm1_stage4_customer_category a
    	INNER JOIN staging.vdm1_stage4_film_category_popularity b USING (category_id)
    
    	--  WHERE a.category_rank = 'A'
    	-- WHERE a.category_rank_number = 2
    	WHERE a.recommendation_order_historical = 2
    	AND 
    -- 	b.film_id NOT IN (
    -- 		SELECT 
    -- 			DISTINCT film_id
    -- 		FROM staging.vdm1_stage4_rentals
    -- 		WHERE customer_id = a.customer_id
    -- 	)
    	b.film_id != ALL (
    		SELECT 
    			  unnest(customer_watch_history_distinct_film_array)
    		FROM 
    			staging.vdm1_stage4_customer_watch_history_array
    		WHERE
    			customer_id = a.customer_id
    			)
    
    	ORDER BY 1,5 DESC--, 8
    ),
    
    get_b_list AS (SELECT 
    	  a.customer_id
    	-- , a.category_rank
    	-- , a.category_rank_number
    	, a.recommendation_order_historical
    	, b.*
    	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
    FROM staging.vdm1_stage4_customer_category a
    	INNER JOIN staging.vdm1_stage4_film_category_popularity b USING (category_id)
    
    	--  WHERE a.category_rank = 'B'
    	-- WHERE a.category_rank_number = 3
    	WHERE a.recommendation_order_historical = 3
    	AND 
    -- 	b.film_id NOT IN (
    -- 		SELECT 
    -- 			DISTINCT film_id
    -- 		FROM staging.vdm1_stage4_rentals
    -- 		WHERE customer_id = a.customer_id
    -- 	)
    	b.film_id != ALL (
    		SELECT 
    			  unnest(customer_watch_history_distinct_film_array)
    		FROM 
    			staging.vdm1_stage4_customer_watch_history_array
    		WHERE
    			customer_id = a.customer_id
    			)
    
    	ORDER BY 1,5 DESC--, 8
    ),
    
    get_c_list AS (SELECT 
    	  a.customer_id
    	-- , a.category_rank
    	-- , a.category_rank_number
    	, a.recommendation_order_historical
    	, b.*
    	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
    FROM staging.vdm1_stage4_customer_category a
    	INNER JOIN staging.vdm1_stage4_film_category_popularity b USING (category_id)
    
    	--  WHERE a.category_rank = 'C'
    	-- WHERE a.category_rank_number = 4
    	WHERE a.recommendation_order_historical = 4
    	AND 
    -- 	b.film_id NOT IN (
    -- 		SELECT 
    -- 			DISTINCT film_id
    -- 		FROM staging.vdm1_stage4_rentals
    -- 		WHERE customer_id = a.customer_id
    -- 	)
    	b.film_id != ALL (
    		SELECT 
    			  unnest(customer_watch_history_distinct_film_array)
    		FROM 
    			staging.vdm1_stage4_customer_watch_history_array
    		WHERE
    			customer_id = a.customer_id
    			)
    
    	ORDER BY 1,5 DESC--, 8
    ),
    
    get_d_list AS (SELECT 
    	  a.customer_id
    	-- , a.category_rank
    	-- , a.category_rank_number
    	, a.recommendation_order_historical
    	, b.*
    	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
    FROM staging.vdm1_stage4_customer_category a
    	INNER JOIN staging.vdm1_stage4_film_category_popularity b USING (category_id)
    
    	-- WHERE a.category_rank = 'D'
    	-- WHERE a.category_rank_number = 5
    	-- WHERE a.category_rank_row_number >= 5
    	WHERE a.recommendation_order_historical = 5
    	AND 
    -- 	b.film_id NOT IN (
    -- 		SELECT 
    -- 			DISTINCT film_id
    -- 		FROM staging.vdm1_stage4_rentals
    -- 		WHERE customer_id = a.customer_id
    -- 	)
    	b.film_id != ALL (
    		SELECT 
    			  unnest(customer_watch_history_distinct_film_array)
    		FROM 
    			staging.vdm1_stage4_customer_watch_history_array
    		WHERE
    			customer_id = a.customer_id
    			)
    
    	ORDER BY 1,5 DESC--, 8
    ),
    list_build AS (
    	SELECT 
    		*
    	FROM get_s_list
    		-- WHERE rec_order <= 5
    	
    	UNION ALL
    	
    	SELECT 
    		* 
    	FROM get_a_list
    		-- WHERE rec_order <= 4
    	
    	UNION ALL
    	
    	SELECT 
    		* 
    	FROM get_b_list
    		-- WHERE rec_order <= 3
    	
    	UNION ALL
    	
    	SELECT 
    		* 
    	FROM get_c_list
    		-- WHERE rec_order <= 2
    	
    	UNION ALL
    	
    	SELECT 
    		* 
    	FROM get_d_list
    		-- WHERE rec_order = 1
    		
    ),
    		
    list as (
    SELECT
    	  customer_id
    	-- , category_rank_number
    	, recommendation_order_historical
    	, film_id
    	, category_idA
    	, total_rentals
    	-- , film_rank
    	, film_category_rank
    	-- , generated_date
    	-- , rec_order
    	-- *
    	--  category_id
    	-- , count(distinct category_id) 
    FROM list_build
    	-- WHERE customer_id = 1
    -- GROUP BY 
    	-- customer_id
    	-- category_id
    ORDER BY 
    	-- category_id
    	-- customer_id, (category_rank_row_number, category_id, rec_order)
    	customer_id, (recommendation_order_historical, category_id)
    )
    */
	
   /* 


	WITH get_customer_film_cat_x_film_cat_pop AS (

		SELECT
			  a.customer_id
			, b.film_rank
			, a.category_id
			, a.film_id
			, b.film_category_rank
			, b.total_rentals
		FROM staging.vdm1_stage4_customer_film_category a
			LEFT JOIN 
				staging.vdm1_stage4_film_category_popularity b
					ON b.film_id = a.film_id 

		ORDER BY 
			a.customer_id, a.film_id	
	)
    
    SELECT
	      customer_id
	    , film_rank
	    , category_id
        -- , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY film_rank) as film_rec_order
        , film_id
		, film_category_rank
	    , total_rentals
    FROM get_customer_film_cat_x_film_cat_pop;


    
	END;
$vdm1_stage4_calc_insert_customer_reclist_master$;
 */

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

/*
CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_city_rental_count()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage4_calc_update_city_rental_count$

    BEGIN 


    WITH calc_city_rentals AS (
        
        SELECT 
              b.city
            , a.city_id
            , COUNT(a.city_id) AS total_rentals
        FROM
            staging.vdm1_stage4_customer_watch_history_details a
                INNER JOIN staging.vdm1_stage4_dictkey_city b
                    ON b.city_id = a.city_id

        GROUP BY 
            b.city, a.city_id

        ORDER BY 
            total_rentals DESC
    )

    UPDATE staging.vdm1_stage4_city_count_init a

    SET 
        total_rentals = calc_city_rentals.total_rentals

    FROM calc_city_rentals

    WHERE
        a.city_id = calc_city_rentals.city_id;

    END;
$vdm1_stage4_calc_update_city_rental_count$;

*/

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

/*
CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_country_rental_count()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage4_calc_update_country_rental_count$

    BEGIN 

    WITH calc_country_rentals AS (

        SELECT 
            b.country
            , a.country_id
            , COUNT(a.country_id) AS total_rentals
        FROM
            staging.vdm1_stage4_customer_watch_history_details a
                INNER JOIN staging.vdm1_stage4_dictkey_country b
                    ON b.country_id = a.country_id
        GROUP BY 
            b.country, a.country_id

        ORDER BY 
	        total_rentals DESC
    )

    UPDATE staging.vdm1_stage4_country_count_init a

    SET 
        total_rentals = calc_country_rentals.total_rentals

    FROM calc_country_rentals

    WHERE
        a.country_id = calc_country_rentals.country_id;

    END;
$vdm1_stage4_calc_update_country_rental_count$;

*/

-- #### #### #### #### #### #### #### #### 

/*
CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_generate_report_year_weeknumber_stamp(
		p_rental_date DATE
)
	RETURNS VARCHAR
	LANGUAGE plpgsql
	AS $vdm1_stage4_transform_rental_date_to_report_stamp$
	
	DECLARE
		
		vi_rental_date DATE;

		vo_report_name VARCHAR;
		
	BEGIN
		
		vi_rental_date := $1;

    SELECT 
        CONCAT('rpt_y', (RIGHT((EXTRACT('year' FROM rental_date)::text),2)), 'wk', (EXTRACT('week' FROM rental_date)::text))
    INTO
        vo_report_name;

		RETURN vo_report_name;

	END;
$vdm1_stage4_transform_rental_date_to_report_stamp$;

*/


-- #### #### #### #### #### #### #### #### 

/*
CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage3_create_table_cobbwebbed_film_inventory()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_cobbwebbed_film_inventory$
	
	BEGIN 
	
        CREATE TABLE IF NOT EXISTS staging.vdm1_stage3_cobbwebbed_film_inventory(

              film_id INTEGER NOT NULL
            , inventory_id INTEGER NOT NULL
        );
	END;
$vdm1_stage3_create_table_cobbwebbed_film_inventory$;

*/


-- #### #### #### #### #### #### #### #### 

/*


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_insert_cobbwebbed_film_inventory()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_cobbwebbed_film_inventory$
	
	BEGIN 


		INSERT INTO staging.vdm1_stage4_cobbwebbed_film_inventory(
			  film_id
            , inventory_id
		)		
		
		SELECT
			  a.film_id
			, c.inventory_id

		FROM staging.vdm1_stage4_film_category_popularity AS a

            LEFT JOIN staging.vdm1_stage4_new_releases AS b
                ON b.film_id = a.film_id
        
            LEFT JOIN staging.vdm1_stage4_film_inventory AS c 
                ON c.film_id = a.film_id
		
		WHERE 
            a.total_rentals = 0
                AND
            b.film_id != a.film_id;
		
	END;
$vdm1_stage4_calc_insert_cobbwebbed_film_inventory$;
*/
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### ####  DISABLED FUNCTIONS END  #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

