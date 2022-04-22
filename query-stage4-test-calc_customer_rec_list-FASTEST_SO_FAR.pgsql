CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_customer_recommendation_list()
    RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_rec_list$

	BEGIN 


WITH get_s_list AS (SELECT 
	  a.customer_id
	-- , a.category_rank
	, a.category_rank_number
	, a.category_rank_row_number
	, b.*
	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
FROM staging.vdm1_stage4_customer_category a
	INNER JOIN staging.vdm1_stage4_film_category b USING (category_id)

	--  WHERE a.category_rank = 'S'
	-- WHERE a.category_rank_number = 1
	WHERE a.category_rank_row_number = 1
	AND 
-- 	b.film_id NOT IN (
-- 		SELECT 
-- 			DISTINCT film_id
-- 		FROM staging.vdm1_stage4_rentals
-- 		WHERE customer_id = a.customer_id
-- 	)
	b.film_id != ALL (
		SELECT 
			  unnest(cxfilmlist)
		FROM 
			staging.vdm1_stage4_test_customerwatchhistoryarray
		WHERE
			customer_id = a.customer_id
			)

	ORDER BY 1,5 DESC--, 8
),

get_a_list AS (SELECT 
	  a.customer_id
	-- , a.category_rank
	, a.category_rank_number
	, a.category_rank_row_number
	, b.*
	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
FROM staging.vdm1_stage4_customer_category a
	INNER JOIN staging.vdm1_stage4_film_category b USING (category_id)

	--  WHERE a.category_rank = 'A'
	-- WHERE a.category_rank_number = 2
	WHERE a.category_rank_row_number = 2
	AND 
-- 	b.film_id NOT IN (
-- 		SELECT 
-- 			DISTINCT film_id
-- 		FROM staging.vdm1_stage4_rentals
-- 		WHERE customer_id = a.customer_id
-- 	)
	b.film_id != ALL (
		SELECT 
			  unnest(cxfilmlist)
		FROM 
			staging.vdm1_stage4_test_customerwatchhistoryarray
		WHERE
			customer_id = a.customer_id
			)

	ORDER BY 1,5 DESC--, 8
),

get_b_list AS (SELECT 
	  a.customer_id
	-- , a.category_rank
	, a.category_rank_number
	, a.category_rank_row_number
	, b.*
	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
FROM staging.vdm1_stage4_customer_category a
	INNER JOIN staging.vdm1_stage4_film_category b USING (category_id)

	--  WHERE a.category_rank = 'B'
	-- WHERE a.category_rank_number = 3
	WHERE a.category_rank_row_number = 3
	AND 
-- 	b.film_id NOT IN (
-- 		SELECT 
-- 			DISTINCT film_id
-- 		FROM staging.vdm1_stage4_rentals
-- 		WHERE customer_id = a.customer_id
-- 	)
	b.film_id != ALL (
		SELECT 
			  unnest(cxfilmlist)
		FROM 
			staging.vdm1_stage4_test_customerwatchhistoryarray
		WHERE
			customer_id = a.customer_id
			)

	ORDER BY 1,5 DESC--, 8
),

get_c_list AS (SELECT 
	  a.customer_id
	-- , a.category_rank
	, a.category_rank_number
	, a.category_rank_row_number
	, b.*
	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
FROM staging.vdm1_stage4_customer_category a
	INNER JOIN staging.vdm1_stage4_film_category b USING (category_id)

	--  WHERE a.category_rank = 'C'
	-- WHERE a.category_rank_number = 4
	WHERE a.category_rank_row_number = 4
	AND 
-- 	b.film_id NOT IN (
-- 		SELECT 
-- 			DISTINCT film_id
-- 		FROM staging.vdm1_stage4_rentals
-- 		WHERE customer_id = a.customer_id
-- 	)
	b.film_id != ALL (
		SELECT 
			  unnest(cxfilmlist)
		FROM 
			staging.vdm1_stage4_test_customerwatchhistoryarray
		WHERE
			customer_id = a.customer_id
			)

	ORDER BY 1,5 DESC--, 8
),

get_d_list AS (SELECT 
	  a.customer_id
	-- , a.category_rank
	, a.category_rank_number
	, a.category_rank_row_number
	, b.*
	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
FROM staging.vdm1_stage4_customer_category a
	INNER JOIN staging.vdm1_stage4_film_category b USING (category_id)

	-- WHERE a.category_rank = 'D'
	-- WHERE a.category_rank_number = 5
	-- WHERE a.category_rank_row_number >= 5
	WHERE a.category_rank_row_number = 5
	AND 
-- 	b.film_id NOT IN (
-- 		SELECT 
-- 			DISTINCT film_id
-- 		FROM staging.vdm1_stage4_rentals
-- 		WHERE customer_id = a.customer_id
-- 	)
	b.film_id != ALL (
		SELECT 
			  unnest(cxfilmlist)
		FROM 
			staging.vdm1_stage4_test_customerwatchhistoryarray
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
	, category_rank_number
	, category_rank_row_number
	, film_id
	, category_id
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
	customer_id, (category_rank_row_number, category_id)
)
UPDATE staging.vdm1_stage4_customer_recommendation_list_master

SET 

SELECT
	  *
	, ROW_NUMBER() OVER (PARTITION BY customer_id, category_id ORDER BY film_category_rank) as rec_order
FROM list

