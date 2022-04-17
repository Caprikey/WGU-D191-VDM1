

	SELECT 
		  customer_id
		, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY rental_date DESC) as watch_history_order_desc
		
		, film_id
		, category_id
		, rental_date

		
		, (EXTRACT('year' FROM rental_date)::int) AS rental_year
		, (EXTRACT('week' FROM rental_date)::int) AS rental_week_number

		, return_date
		
		
		
	FROM staging.vdm1_stage4_rentals
	
	GROUP BY
		customer_id, film_id, category_id, rental_date, return_date
	ORDER BY 
		customer_id
