CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_category_popularity_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_category_popularity_count$
	
	BEGIN
	
		-- CTE used to get rental count since aggregates are not allowed in update statements. 
		WITH get_rentalcount_cat AS (
			SELECT 
				  category_id
				, count(category_id) AS rentalcount_total
			FROM staging.vdm1_stage4_rentals

			GROUP BY
				category_id
		)

		-- Declaring Table that will be updated

		UPDATE staging.vdm1_stage4_category_popularity_count

		SET total_rentals = get_rentalcount_cat.rentalcount_total

		FROM get_rentalcount_cat
		
		WHERE 
			vdm1_stage4_category_popularity_countt.category_id = get_rentalcount_cat.category_id;
			
	END;
$vdm1_stage4_calc_update_category_popularity_count$;