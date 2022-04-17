CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cust_cat_count_null_corrections()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_count_null_correction$
	
	BEGIN

		-- PRESETTING COUNT VALUES FOR HISTORICAL, AVERAGE, AND HALF AVERAGE TO ZERO
		-- USING CTE TO FIND NULLS HAS TO BE DONE INDIVIDUALLY FOR EACH COLUMN AND/OR IS MUCH SLOWER
		-- USING A CTE TO FIND ALL NULLS IN HISTORICAL THEN SETTING TO ZERO INSTEAD OF NULL TOOK 3 SECONDS 555 MSEC
		-- SETTING ALL VALUES TO ZERO FOR ALL THREE COLUMNS TOOK 69 MSEC
		
		UPDATE staging.vdm1_stage4_customer_category

		SET
			historical_rental_count = 0,
			average_rental_count = 0,
			halfaverage_rental_count = 0;


	END;
$vdm1_stage4_calc_update_customer_category_count_null_correction$;