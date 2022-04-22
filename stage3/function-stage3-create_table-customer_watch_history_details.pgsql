CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_customer_watch_history_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_cxwatchhistory_details$
	
	BEGIN 
	
CREATE TABLE staging.vdm1_stage3_customer_watch_history_details AS (

	SELECT 
		  a.customer_id
		-- , b.city_id
		-- , b.country_id
		, a.rental_id
		, a.inventory_id
		, a.film_id
		, a.category_id
		
		, a.rental_date
		, a.return_date
		
		-- , (EXTRACT('year' FROM rental_date)::int) AS rental_year
		-- , (EXTRACT('week' FROM rental_date)::int) AS rental_week_number
		
		-- , CONCAT('rpt_y', (RIGHT((EXTRACT('year' FROM rental_date)::text),2)), 'wk', (EXTRACT('week' FROM rental_date)::text))
		
		
		
	FROM staging.vdm1_stage3_rentals a
	    INNER JOIN staging.vdm1_stage3_customers b
		    ON b.customer_id = a.customer_id
	 
	GROUP BY
		a.customer_id, b.city_id, b.country_id, a.rental_id, a.inventory_id, a.film_id, a.category_id, a.rental_date, a.return_date
	ORDER BY 
		a.customer_id

);

	
	END;
$vdm1_stage3_create_table_cxwatchhistory_details$;
