WITH get_count_rentals AS (

	SELECT 
		  customer_id
		, COUNT(DISTINCT film_id) as rental_count_distinct
	FROM staging.vdm1_stage4_rentals
		-- WHERE customer_id = 80
	GROUP BY 
		customer_id
),
get_count_customerwatchhistoryarray AS (
	SELECT
		  customer_id
		, array_length(cxfilmlist, 1) AS array_count_distinct
	FROM staging.vdm1_stage4_test_customerwatchhistoryarray
		-- WHERE customer_id = 80
)

SELECT 
	  a.customer_id
	, b.rental_count_distinct
	, c.array_count_distinct
FROM staging.vdm1_stage4_customers a
	-- LEFT JOIN staging.vdm1_stage4_rentals b 
	LEFT JOIN get_count_rentals b
		ON b.customer_id = a.customer_id
	-- LEFT JOIN staging.vdm1_stage4_test_customerwatchhistoryarray c
	LEFT JOIN get_count_customerwatchhistoryarray c	
		ON c.customer_id = a.customer_id