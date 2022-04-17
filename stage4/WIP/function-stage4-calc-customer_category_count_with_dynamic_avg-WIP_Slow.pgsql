CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_customer_category_count_with_dynamic_avg_half_avg()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $$
	
	-- FUNCTION WORKS BUT IS SLOW
	-- WIP
	
	BEGIN 
	
		WITH calc_rentals_per_cx AS (
			SELECT
				  (FLOOR(AVG(cx_wh_order))) AS rental_avg
				, ((FLOOR(AVG(cx_wh_order))) / 2 ) AS rental_half_avg
			FROM
				staging.vdm1_stage4_customer_watch_history
			-- GROUP BY 

			),
		-- 	get_half_avg_rentals_per_cx AS (
		-- 	SELECT 
		-- 		(rental_avg / 2) AS rental_half_avg
		-- 	FROM 
		-- 			get_avg_rentals_per_cx
		-- 	),
			wh_length_calc AS (
			SELECT
				  customer_id
				, COUNT(cx_wh_order) AS total
				, ((COUNT(cx_wh_order) - (SELECT rental_half_avg FROM calc_rentals_per_cx)) + 1) AS count_from_total
			FROM
				staging.vdm1_stage4_customer_watch_history


			GROUP BY
				customer_id
			ORDER BY
				customer_id
		)

		-- SELECT
		-- 	*
		-- FROM get_avg_rentals_per_cx


		SELECT
			  a.customer_id
			, a.category_id
			, COUNT(a.category_id) AS category_count

		FROM staging.vdm1_stage4_customer_watch_history a

			WHERE cx_wh_order <= (
				SELECT 
					count_from_total
				FROM
					wh_length_calc
				WHERE customer_id = a.customer_id)

		GROUP BY
			customer_id, category_id
		ORDER BY
			customer_id, 3 DESC;
			
	END;
$$;