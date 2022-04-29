CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup$
		
	BEGIN

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
        --                      #### #### #### #### #### #### #### #### 
        --                      #### ####      TRIGGERS       #### #### 
        --                      #### #### #### #### #### #### #### #### 
        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

        -- TABLE OF CONTENTS 
        --    TRIGGERS

        --        1. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.RENTAL :: insert_customer_watch_history
        --        2. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.CUSTOMER :: insert_new_customer
        --        3. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.CATEGORY :: insert_new_category
        --        4. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.INVENTORY :: insert_new_inventory
        --        5. CREATE TRIGGER :: AFTER UPDATE :: PUBLIC.RENTAL :: update_rental_return 
        --        6. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.RENTAL :: insert_failed_return
        --        7. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.FILM_CATEGORY :: insert_new_film
        --        8. CREATE TRIGGER :: AFTER INSERT :: MARKETING.CUSTOMER_WATCH_HISTORY_DETAILED :: update_customer_category
        --        9. CREATE TRIGGER :: AFTER INSERT :: MARKETING.CUSTOMER_WATCH_HISTORY_DETAILED :: update_category_popularity
        --       10. CREATE TRIGGER :: AFTER INSERT :: MARKETING.CUSTOMER_WATCH_HISTORY_DETAILED :: update_film_category_popularity
        --       11. CREATE TRIGGER :: AFTER INSERT :: MARKETING.CUSTOMER_WATCH_HISTORY_DETAILED :: update_inventory_maintenance
        --       12. CREATE TRIGGER :: AFTER INSERT :: MARKETING.CUSTOMER_WATCH_HISTORY_DETAILED :: update_customer_reclist_master_nonspecific
        --       13. CREATE TRIGGER :: AFTER INSERT :: MARKETING.CUSTOMER_WATCH_HISTORY_DETAILED :: update_customer_reclist_master_specific
        --       14. CREATE TRIGGER :: AFTER UPDATE :: MARKETING.FILM_CATEGORY_POPULARITY :: update_new_release
        --       15. CREATE TRIGGER :: AFTER INSERT OR UPDATE :: MARKETING.CUSTOMER_REC_CUSTOM_PREFERNCES :: insert_update_customer_rec_custom_preferences
        --       16. CREATE TRIGGER :: AFTER INSERT OR UPDATE OR DELETE :: MARKETING.CUSTOMER_RECLIST_MASTER_NONSPECIFIC :: update_customer_reclist_master_nonspecific_summary
        --       17. CREATE TRIGGER :: AFTER INSERT OR UPDATE OR DELETE :: MARKETING.CUSTOMER_RECLIST_MASTER_SPECIFIC :: update_customer_reclist_master_specific_summary

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####     1     #### 
        -- #### #### #### #### 

        EXECUTE
            'CREATE OR REPLACE TRIGGER insert_customer_watch_history
                AFTER INSERT
                ON public.rental
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_insert_customer_watch_history()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####     2     #### 
        -- #### #### #### #### 

        EXECUTE
            'CREATE OR REPLACE TRIGGER insert_new_customer
                AFTER INSERT
                ON public.customer
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_insert_new_customer()';


        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####     3     #### 
        -- #### #### #### #### 

        EXECUTE
            'CREATE OR REPLACE TRIGGER insert_new_category
                AFTER INSERT
                ON public.category
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_insert_new_category()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####     4     #### 
        -- #### #### #### #### 

        EXECUTE
            'CREATE OR REPLACE TRIGGER insert_new_inventory
                AFTER INSERT
                ON public.inventory
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_insert_new_inventory()';
            
        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####     5     #### 
        -- #### #### #### #### 

        EXECUTE
            'CREATE OR REPLACE TRIGGER update_rental_return
                AFTER UPDATE
                ON public.rental
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_update_rental_return()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####     6     #### 
        -- #### #### #### #### 

        EXECUTE
            'CREATE OR REPLACE TRIGGER insert_failed_return
                AFTER INSERT
                ON public.rental
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_insert_failed_return()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####     7     #### 
        -- #### #### #### #### 

        EXECUTE
            'CREATE OR REPLACE TRIGGER insert_new_film
                AFTER INSERT
                ON public.film_category
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_insert_new_film()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####     8     #### 
        -- #### #### #### #### 

        EXECUTE
            'CREATE OR REPLACE TRIGGER update_customer_category
                AFTER INSERT 
                ON marketing.customer_watch_history_detailed
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_update_customer_category()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####     9     #### 
        -- #### #### #### #### 

        EXECUTE
            'CREATE OR REPLACE TRIGGER new_rental_update_category_popularity
                AFTER INSERT 
                ON marketing.customer_watch_history_detailed
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_update_category_popularity()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####    10     #### 
        -- #### #### #### #### 

        EXECUTE
            'CREATE OR REPLACE TRIGGER update_film_category_popularity
                AFTER INSERT 
                ON marketing.customer_watch_history_detailed
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_update_film_category_popularity()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####    11     #### 
        -- #### #### #### #### 

        EXECUTE
            'CREATE OR REPLACE TRIGGER update_inventory_maintenance
                AFTER INSERT 
                ON marketing.customer_watch_history_detailed
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_update_inventory_maintenance()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####    12     #### 
        -- #### #### #### #### 

        EXECUTE
            'CREATE OR REPLACE TRIGGER update_customer_reclist_master_nonspecific
                AFTER INSERT
                ON marketing.customer_watch_history_detailed
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_update_customer_reclist_master_nonspecific()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####    13     #### 
        -- #### #### #### #### 

        EXECUTE 
            'CREATE OR REPLACE TRIGGER update_customer_reclist_master_specific
                AFTER INSERT
                ON marketing.customer_watch_history_detailed
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_update_customer_reclist_master_specific()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####    14     #### 
        -- #### #### #### #### 

        EXECUTE 
            'CREATE OR REPLACE TRIGGER insert_update_customer_rec_custom_preferences
                AFTER INSERT OR UPDATE 
                ON marketing.customer_rec_custom_preferences
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_insert_update_customer_rec_custom_preferences()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####    15     #### 
        -- #### #### #### #### 

        EXECUTE 
            'CREATE OR REPLACE TRIGGER update_new_release
                AFTER UPDATE
                ON marketing.film_category_popularity
                FOR EACH ROW
                WHEN (OLD.new_release IS DISTINCT FROM NEW.new_release)
                EXECUTE FUNCTION marketing.t_f_update_new_release()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####    16     #### 
        -- #### #### #### #### 

        EXECUTE 
            'CREATE OR REPLACE TRIGGER update_customer_reclist_master_nonspecific_summary
                AFTER INSERT OR UPDATE OR DELETE 
                ON marketing.customer_reclist_master_nonspecific
                FOR EACH ROW
                EXECUTE FUNCTION marketing.t_f_update_customer_reclist_summary_nonspecific()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### ####
        -- ####    17     #### 
        -- #### #### #### #### 

        EXECUTE
            'CREATE OR REPLACE TRIGGER update_customer_reclist_master_specific_summary
                    AFTER INSERT OR UPDATE OR DELETE 
                    ON marketing.customer_reclist_master_specific
                    FOR EACH ROW
                    EXECUTE FUNCTION marketing.t_f_update_customer_reclist_summary_specific()';

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
        -- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    TRIGGERS END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
                
                
	
	END;
$vdm1_stage5_trigger_setup$;