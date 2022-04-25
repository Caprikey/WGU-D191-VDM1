CREATE OR REPLACE FUNCTION marketing.t_f_insert_update_customer_rec_custom_preferences()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_insert_update_customer_rec_custom_preferences$

    BEGIN

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        UPDATE marketing.customer_reclist_master_specific

        SET 
            cat_rec_order = null

        WHERE
            customer_id = NEW.customer_id;

        
        -- #### #### #### #### #### #### #### #### 
		
		WITH get_customer_reclist_custom_preferences AS (

			SELECT
                  customer_id
                , category_id 
                , recommendation_order_customer_preference as cat_rec_order
            FROM
                marketing.customer_category

            WHERE 
                customer_id = OLD.customer_id
        )

        UPDATE marketing.customer_reclist_master_specific AS a 

		SET 
			cat_rec_order = b.cat_rec_order
		
        FROM 
            get_customer_reclist_custom_preferences AS b 

		WHERE
			b.customer_id = a.customer_id
                AND 
            b.category_id = a.category_id;

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


        
        -- #### #### #### #### #### #### #### #### 
        
        -- #### #### #### #### 

        RETURN NEW;

        -- #### #### #### #### #### #### #### #### 


    END;
$trigger_function_insert_update_customer_rec_custom_preferences$;