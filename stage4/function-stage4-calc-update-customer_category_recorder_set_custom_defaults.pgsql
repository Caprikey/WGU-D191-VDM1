CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_recommendation_order_user_custom_set_defaults$
	
	BEGIN

		UPDATE staging.vdm1_stage4_customer_category a
		
		SET recommendation_order_customer_preference = b.recommendation_order_historical
		
		FROM 
			staging.vdm1_stage4_customer_category b
		WHERE  
			(b.customer_id = a.customer_id)
				AND
			(b.category_id = a.category_id);

	END;
$vdm1_stage4_calc_update_customer_category_recommendation_order_user_custom_set_defaults$;
