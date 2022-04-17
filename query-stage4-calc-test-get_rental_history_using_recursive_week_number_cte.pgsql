WITH RECURSIVE week_number_iterate (n) AS (
	SELECT 1
	UNION ALL
	SELECT n+1 FROM week_number_iterate WHERE n+1 <= 52
)


SELECT 
	  customer_id
	, film_id
	, inventory_id
	, category_id
	, rental_date
	, EXTRACT('week' FROM rental_date) as week_number
FROM staging.vdm1_stage4_rentals

-- WHERE customer_id = 1
-- AND
-- WHERE (EXTRACT('month' FROM rental_date)= '05')
WHERE (EXTRACT('week' FROM rental_date) = (SELECT 1 from week_number_iterate))

ORDER BY 
	rental_date DESC


/*

WITH RECURSIVE week_number_iterate (n) AS (
	SELECT 1
	UNION ALL
	SELECT n+1 FROM week_number_iterate WHERE n+1 <= 52
)

SELECT * FROM week_number_iterate

*/ 