CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_customer_category_rank()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_rank$
	
	BEGIN
	
		WITH get_customer_category_rank AS (
			SELECT 
				  customer_id
				,  category_id
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
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY category_rental_count DESC) as category_rank_row_number
                
			FROM staging.vdm1_stage4_customer_category
		)

		UPDATE staging.vdm1_stage4_customer_category a

		SET 
            -- category_rank = get_customer_category_rank.cat_rank_letter,
            -- category_rank_number = get_customer_category_rank.cat_rank_number,
            category_rank_row_number = get_customer_category_rank.category_rank_row_number
            
		FROM get_customer_category_rank

		WHERE
			a.customer_id = get_customer_category_rank.customer_id
				AND
			a.category_id = get_customer_category_rank.category_id;
			
	END;
$vdm1_stage4_calc_update_customer_category_rank$;