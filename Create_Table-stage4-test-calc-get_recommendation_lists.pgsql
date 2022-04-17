CREATE TABLE staging.vdm1_stage4_test_calc_get_customer_recommenation_list as (

WITH get_s_list AS (SELECT 
	a.customer_id
	-- , a.category_rank
	, a.category_rank_number
	, b.*
	, ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
FROM staging.vdm1_stage4_customer_category a
	INNER JOIN staging.vdm1_stage4_film_category b USING (category_id)

	--  WHERE a.category_rank = 'S'
	WHERE a.category_rank_number = 1
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

	ORDER BY 1,5 DESC --, 8)
),
get_a_list AS (SELECT 
	a.customer_id
	-- , a.category_rank
	, a.category_rank_number
	, b.*
	, ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
FROM staging.vdm1_stage4_customer_category a
	INNER JOIN staging.vdm1_stage4_film_category b USING (category_id)

	--  WHERE a.category_rank = 'A'
	WHERE a.category_rank_number = 2
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

	ORDER BY 1,5 DESC --, 8)
),
get_b_list AS (SELECT 
	a.customer_id
	-- , a.category_rank
	, a.category_rank_number
	, b.*
	, ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
FROM staging.vdm1_stage4_customer_category a
	INNER JOIN staging.vdm1_stage4_film_category b USING (category_id)

	--  WHERE a.category_rank = 'B'
	WHERE a.category_rank_number = 3
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

	ORDER BY 1,5 DESC --, 8)
),
get_c_list AS (SELECT 
	a.customer_id
	-- , a.category_rank
	, a.category_rank_number
	, b.*
	, ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
FROM staging.vdm1_stage4_customer_category a
	INNER JOIN staging.vdm1_stage4_film_category b USING (category_id)

	--  WHERE a.category_rank = 'C'
	WHERE a.category_rank_number = 4
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

	ORDER BY 1,5 DESC --, 8)
),
get_d_list AS (SELECT 
	a.customer_id
	-- , a.category_rank
	, a.category_rank_number
	, b.*
	, ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
FROM staging.vdm1_stage4_customer_category a
	INNER JOIN staging.vdm1_stage4_film_category b USING (category_id)

	--  WHERE a.category_rank = '(d)'
	WHERE a.category_rank_number = 5
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

	ORDER BY 1,5 DESC --, 8)
)
SELECT * FROM get_s_list
UNION ALL
SELECT * FROM get_a_list
UNION ALL 
SELECT * FROM get_b_list
UNION ALL 
SELECT * FROM get_c_list
UNION ALL 
SELECT * FROM get_d_list
	
)