CREATE TABLE staging.vdm1_stage3_customerwatchhistory AS (

	SELECT 
		  customer_id
		, city_id
		, country_id
		
		, inventory_id
		, film_id
		, category_id
		
		, rental_date
		, return_date

        

		-- , null AS cxfilmlist
		
		-- , (EXTRACT('year' FROM rental_date)::int) AS rental_year
		-- , (EXTRACT('week' FROM rental_date)::int) AS rental_week_number
		
		-- , CONCAT('rpt_y', (RIGHT((EXTRACT('year' FROM rental_date)::text),2)), 'wk', (EXTRACT('week' FROM rental_date)::text))
		
		
		
	FROM staging.vdm1_stage3_rentals a
	    INNER JOIN staging.vdm1_stage3_customers b
		    ON b.customer_id = a.customer_id
	 
	GROUP BY
		a.customer_id, city_id, country_id, film_id, category_id, rental_date, return_date, 
	ORDER BY 
		a.customer_id

);

