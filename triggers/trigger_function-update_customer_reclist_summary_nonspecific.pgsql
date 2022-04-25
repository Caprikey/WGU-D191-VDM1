CREATE OR REPLACE FUNCTION marketing.t_f_update_customer_reclist_summary_nonspecific()
    RETURNS TRIGGER 
    LANGUAGE plpgsql
    AS $trigger_function_update_customer_reclist_summary_nonspecific$


    BEGIN 

        -- #### #### #### #### #### #### #### #### 

        DELETE FROM marketing.customer_reclist_master_nonspecific
		
		WHERE
			customer_id = NEW.customer_id;
	
		-- #### #### #### #### #### #### #### #### 	

        INSERT INTO marketing.customer_reclist_summary_nonspecific (

				  customer_id
				, film_rec_order
				, film_id
				, category_id
        )


        WITH get_customer_reclist_summary_nonspecific AS (
			
			SELECT
				  customer_id
                , film_rec_order
				, film_id
				, category_id
			
			FROM
				marketing.customer_reclist_master_nonspecific	
			
            WHERE
                (customer_id = NEW.customer_id)
                    AND 
                (film_rec_order <= 10)

			ORDER BY
				customer_id, film_rec_order

		)

        SELECT
			  customer_id
            , film_rec_order
			, film_id
			, category_id
		FROM
            get_customer_reclist_summary_nonspecific;

    	-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### 

        RETURN NEW;

        -- #### #### #### #### #### #### #### ####    

    END;
$trigger_function_update_customer_reclist_summary_nonspecific$;