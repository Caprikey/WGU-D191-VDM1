-- DELETE FROM 
-- 	marketing.customer_watch_history_detailed
-- WHERE
-- 	customer_id = 600;
	

-- INSERT INTO marketing.customer_watch_history_detailed(
-- 	  customer_id
-- 	, rental_id
-- 	, inventory_id
-- 	, film_id
-- 	, category_id
-- 	, rental_date 
-- 	, return_date
-- )

-- SELECT 
-- 	  a.customer_id
-- 	, a.rental_id
-- 	, a.inventory_id
-- 	, b.film_id
-- 	, c.category_id
-- 	, a.rental_date
-- 	, a.return_date

-- FROM public.rental a
-- 	INNER JOIN public.inventory b
-- 		ON b.inventory_id = a.inventory_id

-- 		INNER JOIN public.film_category c
-- 			ON c.film_id = b.film_id

-- WHERE
-- 	a.customer_id = 600;

-- UPDATE marketing.customer_category

-- SET
-- 	recommendation_order_historical = null,
-- 	recommendation_order_average = null,
-- 	recommendation_order_halfaverage = null,
-- 	historical_rental_count = 0,
-- 	average_rental_count = 0,
-- 	halfaverage_rental_count = 0

-- WHERE customer_id = 600;

WITH get_customer_category_historical_count AS (
	SELECT
		  customer_id
		, category_id
		, COUNT(category_id) as historical_rental_count
	FROM 
		marketing.customer_watch_history_detailed
		GROUP BY 
			customer_id, category_id
		ORDER BY 
			customer_id, category_id
	
)


UPDATE marketing.customer_category AS a

SET
	historical_rental_count = b.historical_rental_count
FROM
	get_customer_category_historical_count as b

	WHERE 
		b.customer_id = a.customer_id
			AND
		b.category_id = a.category_id;
		
-- #### #### #### #### 

WITH get_customer_category_average_count AS (
	SELECT
		  customer_id
		, category_id
		, COUNT(category_id) as average_rental_count
	FROM 
		marketing.customer_watch_history_detailed
	WHERE
		customer_watch_history_desc_order <= 14
	GROUP BY 
		customer_id, category_id
	ORDER BY 
		customer_id, category_id
)


UPDATE marketing.customer_category AS a

SET
	average_rental_count = b.average_rental_count
FROM
	get_customer_category_average_count as b

	WHERE 
		b.customer_id = a.customer_id
			AND
		b.category_id = a.category_id;
		
-- #### #### #### #### 

WITH get_customer_category_halfaverage_count AS (
	SELECT
		  customer_id
		, category_id
		, COUNT(category_id) as halfaverage_rental_count
	FROM 
		marketing.customer_watch_history_detailed
	WHERE
		customer_watch_history_desc_order <= 7
	GROUP BY 
		customer_id, category_id
	ORDER BY 
		customer_id, category_id
)


UPDATE marketing.customer_category AS a

SET
	halfaverage_rental_count = b.halfaverage_rental_count
FROM
	get_customer_category_halfaverage_count as b

	WHERE 
		b.customer_id = a.customer_id
			AND
		b.category_id = a.category_id;

-- #### #### #### #### #### #### #### #### 

WITH get_customer_category_rec_order_historical AS (
	SELECT 
		  customer_id
		, category_id
		, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY historical_rental_count DESC, b.total_rentals) as recommendation_order_historical

	FROM marketing.customer_category
		INNER JOIN marketing.category_popularity b USING (category_id)
)

UPDATE marketing.customer_category a

SET 
	recommendation_order_historical = b.recommendation_order_historical

FROM get_customer_category_rec_order_historical as b

WHERE
	a.customer_id = b.customer_id
		AND
	a.category_id = b.category_id;
	
	-- #### #### #### #### #### #### #### #### 

WITH get_customer_category_rec_order_average AS (
	SELECT 
		  customer_id
		, category_id
		, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY average_rental_count DESC, b.total_rentals DESC) as recommendation_order_average
	
	FROM marketing.customer_category
		INNER JOIN marketing.category_popularity b USING (category_id)
)

UPDATE marketing.customer_category a

SET 
	recommendation_order_average = b.recommendation_order_average

FROM get_customer_category_rec_order_average as b

WHERE
	a.customer_id = b.customer_id
		AND
	a.category_id = b.category_id;
	
	-- #### #### #### #### #### #### #### #### 

WITH get_customer_category_rec_order_halfaverage AS (
	SELECT 
		  customer_id
		, category_id
		, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY halfaverage_rental_count DESC, b.total_rentals DESC ) as recommendation_order_halfaverage

	FROM marketing.customer_category
		INNER JOIN marketing.category_popularity b USING (category_id)
)

UPDATE marketing.customer_category a

SET 
	recommendation_order_halfaverage = b.recommendation_order_halfaverage

FROM get_customer_category_rec_order_halfaverage as b

WHERE
	a.customer_id = b.customer_id
		AND
	a.category_id = b.category_id;