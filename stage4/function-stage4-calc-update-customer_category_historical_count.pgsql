CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_customer_category_historical_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_historical_count$
	
	BEGIN
	
		WITH get_customer_category_historical_count AS (
			SELECT
				  customer_id
				, category_id
				, COUNT(category_id) as historical_rental_count
			FROM staging.vdm1_stage4_customer_watch_history
			GROUP BY 
				customer_id, category_id
			ORDER BY 
				customer_id, category_id
		)

		UPDATE staging.vdm1_stage4_customer_category

		SET historical_rental_count = get_customer_category_historical_count.historical_rental_count

		FROM get_customer_category_historical_count

		WHERE 
			(vdm1_stage4_customer_category.customer_id = get_customer_category_historical_count.customer_id)
				AND
			(vdm1_stage4_customer_category.category_id = get_customer_category_historical_count.category_id);
	END;
$vdm1_stage4_calc_update_customer_category_historical_count$;