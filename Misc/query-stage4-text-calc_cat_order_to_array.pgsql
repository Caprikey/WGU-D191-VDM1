WITH get_cx_cat_order as (
	SELECT 
		  customer_id
		--, category_id
		--, category_rental_count
		--, category_rank_number
		--, DENSE_RANK () OVER ( ORDER BY category_rental_count DESC)
		--, ROW_NUMBER () OVER (ORDER BY category_rental_count DESC)
		, ARRAY_AGG(category_rental_count)
		, ARRAY_AGG(category_id)
	FROM staging.vdm1_stage4_customer_category

	-- WHERE customer_id = 1
	GROUP BY 1
)

SELECT * FROM get_cx_cat_order
order by 1

