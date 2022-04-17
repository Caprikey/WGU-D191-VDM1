CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_customer_category_set_custom_order()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_recommendation_order_user_set_custom_pref$
	
	BEGIN

		WITH get_customer_custom_preferences AS (

			SELECT 
				  customer_id
				, category_id
				, customer_rec_custom_order
				, customer_rec_custom_amount
			FROM 
				staging.vdm1_stage4_customer_rec_custom_preferences
		)

		UPDATE staging.vdm1_stage4_customer_category
		
		SET recommendation_order_customer_preference = get_customer_custom_preferences.customer_rec_custom_order

		FROM get_customer_custom_preferences

		WHERE 
			(vdm1_stage4_customer_category.customer_id = get_customer_custom_preferences.customer_id)
				AND
			(vdm1_stage4_customer_category.category_id = get_customer_custom_preferences.category_id);

	END;
$vdm1_stage4_calc_update_customer_category_recommendation_order_user_set_custom_pref$;