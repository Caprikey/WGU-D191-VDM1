	WITH get_cus_cat_paremeters AS (

			SELECT 
				CASE 
					WHEN TRIM(LOWER($1)) = 'user' then vo_recorder_value = 'b.recommendation_order_customer_preference'
					WHEN TRIM(LOWER($1)) = 'halfaverage' then vi_recorder_amount = 'b.recommendation_order_halfaverage'
					WHEN TRIM(LOWER($1)) = 'average' then vi_recorder_amount = 'b.recommendation_order_average'
					WHEN TRIM(LOWER($1)) = 'historical' then vi_recorder_amount = 'b.recommendation_order_historical'
					ELSE vi_recorder_amount = 'b.recommendation_order_historical'
				END
			FROM staging.vdm1_stage4_customer_category)
		, combined_master_with_cxcat AS (
			SELECT 
				  a.customer_id
				, CASE
					-- WHEN EXISTS (SELECT b.customer_id FROM staging.vdm1_stage4_customer_category b where b.customer_id = a.customer_id)
					-- 	THEN b.recommendation_order_customer_preference
					-- ELSE b.recommendation_order_historical
					WHEN EXISTS (SELECT b.customer_id FROM staging.vdm1_stage4_customer_category b where b.customer_id = a.customer_id)
						THEN (
							SELECT 
								CASE 
									WHEN TRIM(LOWER(vi_recorder_amount)) = 'user' then vo_recorder_value = b.recommendation_order_customer_preference
									WHEN TRIM(LOWER(vi_recorder_amount)) = 'halfaverage' then vo_recorder_value = b.recommendation_order_halfaverage
									WHEN TRIM(LOWER(vi_recorder_amount)) = 'average' then vo_recorder_value = b.recommendation_order_average
									WHEN TRIM(LOWER(vi_recorder_amount)) = 'historical' then vo_recorder_value= b.recommendation_order_historical
									ELSE vo_recorder_value = b.recommendation_order_historical
								END AS cat_rec_order
							FROM staging.vdm1_stage4_customer_category b
							)
				  END as cat_rec_order 
				, a.category_id
				, a.film_id
				, a.film_category_rank
				, a.total_rentals
			FROM 
				staging.vdm1_stage4_customer_recommendation_list_master a
					LEFT JOIN 
						staging.vdm1_stage4_customer_category b
							ON b.customer_id = a.customer_id
	-- 				LEFT JOIN 
	-- 					get_cus_cat_paremeters c
	-- 						ON c.customer_id = a.customer_id
	-- 							AND
	-- 							c.category_id = a.category_id

			WHERE
				(b.customer_id = a.customer_id
					AND
				b.category_id = a.category_id)
					AND
				vo_recorder_value IN (
					SELECT vo_recorder_value
						FROM 
					staging.vdm1_stage4_customer_category)

			ORDER BY
				a.customer_id, 2, a.film_category_rank DESC
		)

		SELECT
				  a.customer_id
				, a.cat_rec_order
				, a.category_id
				, a.film_id
				, a.film_category_rank
				, a.total_rentals
			, ROW_NUMBER() OVER (PARTITION BY a.customer_id, a.category_id ORDER BY a.cat_rec_order) as cat_rec_order
		FROM combined_master_with_cxcat a;
