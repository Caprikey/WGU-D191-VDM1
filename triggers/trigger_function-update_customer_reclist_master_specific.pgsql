CREATE OR REPLACE FUNCTION marketing.t_f_update_customer_reclist_master_specific()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_update_customer_reclist_master_specific$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 	
		
		DELETE FROM marketing.customer_reclist_master_specific
		
		WHERE
			customer_id = NEW.customer_id
				AND
			film_id = NEW.film_id;
	
		-- #### #### #### #### #### #### #### #### 	
		
		UPDATE marketing.customer_reclist_master_specific
		
		SET
			rental_rec_order = null
						
		WHERE
			customer_id = NEW.customer_id
                AND
            category_id = NEW.category_id;
		
		-- #### #### #### #### #### #### #### #### 	
		
		WITH get_customer_reclist_master_specific_values AS (

			SELECT
				  customer_id
                , cat_rec_order
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
			FROM marketing.customer_reclist_master_specific
			
			WHERE
				customer_id = NEW.customer_id
                    AND
                category_id = NEW.category_id
		),
		assign_row_number AS (

			SELECT
				  customer_id
                , cat_rec_order
				, category_id
				, ROW_NUMBER() OVER (ORDER BY film_category_rank) as rental_rec_order_rn
				, film_id
				, film_category_rank
				, total_rentals
			
			FROM get_customer_reclist_master_specific_values
		)
		
		UPDATE marketing.customer_reclist_master_specific AS a
		
		SET
			rental_rec_order = b.rental_rec_order_rn
			
		FROM
			assign_row_number AS b
			
		WHERE
			(b.customer_id = a.customer_id
				AND
			b.film_id = a.film_id);
		
		-- #### #### #### #### #### #### #### #### 		
		
				
		-- #### #### #### #### #### #### #### #### 
				
		
		-- #### #### #### #### 
		
			RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 		

		
	END;
$trigger_function_update_customer_reclist_master_specific$