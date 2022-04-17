

SELECT
	  customer_id
	, category_id
	, SORT_ASC(ARRAY_AGG(film_id))
	, (
		SELECT 
			(cxfilmlist - SORT_ASC(ARRAY_AGG(film_id))) 
		FROM 
			staging.vdm1_stage4_test_customerwatchhistoryarray b
		WHERE
			b.customer_id = a.customer_id
		) reclist
	, count(film_id) as film_category_count
	, icount(ARRAY_AGG(film_id)) as film_list_count
	, icount((
		SELECT 
			(cxfilmlist - SORT_ASC(ARRAY_AGG(film_id))) 
		FROM 
			staging.vdm1_stage4_test_customerwatchhistoryarray b
		WHERE
			b.customer_id = a.customer_id
		)) as cx_film_list_count
FROM
	staging.vdm1_stage4_film_category, staging.vdm1_stage4_customers a



GROUP BY
	customer_id, category_id
ORDER BY
	customer_id, category_id
	
