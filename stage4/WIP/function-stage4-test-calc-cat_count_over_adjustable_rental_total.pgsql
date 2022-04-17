CREATE OR REPLACE FUNCTION staging.f_stage4_calc_test_cat_count_over_adjustable_rental_total(
	p_rentaltotal INT)
	RETURNS TABLE (
		customer_id SMALLINT,
		category_id SMALLINT,
		count BIGINT
	)
	LANGUAGE plpgsql
	AS $$
	
	DECLARE 
	
		vi_rental_total INT;
	
	BEGIN
	
		vi_rental_total := $1;

		RETURN QUERY

		with cxwatchhistory as (
			SELECT 
				  a.customer_id
				, ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY a.rental_date DESC) as watch_history_order_desc

				, a.film_id
				, a.category_id
				, a.rental_date


				, (EXTRACT('year' FROM a.rental_date)::int) AS rental_year
				, (EXTRACT('week' FROM a.rental_date)::int) AS rental_week_number

				, a.return_date



			FROM staging.vdm1_stage4_rentals a

			GROUP BY
				a.customer_id, a.film_id, a.category_id, a.rental_date, a.return_date
			ORDER BY 
				a.customer_id
		),
		get_average_rental_watchhistory as (
		Select
		*
		from cxwatchhistory
		where watch_history_order_desc <= $1
		)

		select
			--  row_number() over (partition by customer_id) as rownum
			--, customer_id
			  vo.customer_id
			, vo.category_id
			, count(vo.category_id) as vocount
		FROM get_average_rental_watchhistory vo
		group by 
		vo.customer_id, vo.category_id
		order by 
		vo.customer_id, vocount desc;
	
	END;
$$;