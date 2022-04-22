
CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_customer_category_recorder_average()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_rec_order_average$
	
	BEGIN
	
		WITH get_customer_category_rec_order_average AS (
			SELECT 
				  customer_id
				, category_id
				/*
				,  CASE
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 1 THEN 'S'
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 2 THEN 'A'
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 3 THEN 'B'
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 4 THEN 'C'
					ELSE 
						'D'		
				END as cat_rank_letter
                , CASE
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 1 THEN 1
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 2 THEN 2
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 3 THEN 3
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 4 THEN 4
					ELSE 
						5		
				END as cat_rank_number
				*/
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY average_rental_count DESC) as recommendation_order_average
                
			FROM staging.vdm1_stage4_customer_category
		)

		UPDATE staging.vdm1_stage4_customer_category a

		SET 
            -- category_rank = get_customer_category_rec_order_average.cat_rank_letter,
            -- category_rank_number = get_customer_category_rec_order_average.cat_rank_number,
            recommendation_order_average = get_customer_category_rec_order_average.recommendation_order_average
            
		FROM get_customer_category_rec_order_average

		WHERE
			a.customer_id = get_customer_category_rec_order_average.customer_id
				AND
			a.category_id = get_customer_category_rec_order_average.category_id;
			
	END;
$vdm1_stage4_calc_update_customer_category_rec_order_average$;