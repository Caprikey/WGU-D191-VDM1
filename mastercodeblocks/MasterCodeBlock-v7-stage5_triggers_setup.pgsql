-- STAGE 5c - TRIGGERS CODE BLOCK


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 5c BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 5c BEGIN

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


--     #### #### #### ####
--       STAGE 5c BEGIN
--           TRIGGERS
--     #### #### #### ####
--             STORED PROCEDURES

--                  1. vdm1_etl.vdm1_stage5_triggers_setup();



--             TRIGGER FUNCTIONS

--                  1. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.RENTAL :: insert_customer_watch_history
--                  2. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.CUSTOMER :: insert_new_customer
--                  3. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.CATEGORY :: insert_new_category
--                  4. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.INVENTORY :: insert_new_inventory
--                  5. CREATE TRIGGER :: AFTER UPDATE :: PUBLIC.RENTAL :: update_rental_return 
--                  6. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.RENTAL :: insert_failed_return
--                  7. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.FILM_CATEGORY :: insert_new_film
--                  8. CREATE TRIGGER :: AFTER INSERT :: vdm1_data.CUSTOMER_WATCH_HISTORY_DETAILED :: update_customer_category
--                  9. CREATE TRIGGER :: AFTER INSERT :: vdm1_data.CUSTOMER_WATCH_HISTORY_DETAILED :: update_category_popularity
--                 10. CREATE TRIGGER :: AFTER INSERT :: vdm1_data.CUSTOMER_WATCH_HISTORY_DETAILED :: update_film_category_popularity
--                 11. CREATE TRIGGER :: AFTER INSERT :: vdm1_data.CUSTOMER_WATCH_HISTORY_DETAILED :: update_inventory_maintenance
--                 12. CREATE TRIGGER :: AFTER INSERT :: vdm1_data.CUSTOMER_WATCH_HISTORY_DETAILED :: update_customer_reclist_master_nonspecific
--                 13. CREATE TRIGGER :: AFTER INSERT :: vdm1_data.CUSTOMER_WATCH_HISTORY_DETAILED :: update_customer_reclist_master_specific
--                 14. CREATE TRIGGER :: AFTER UPDATE :: vdm1_data.FILM_CATEGORY_POPULARITY :: update_new_release
--                 15. CREATE TRIGGER :: AFTER INSERT OR UPDATE :: vdm1_data.CUSTOMER_REC_CUSTOM_PREFERNCES :: insert_update_customer_rec_custom_preferences
--                 16. CREATE TRIGGER :: AFTER INSERT OR UPDATE OR DELETE :: vdm1_data.CUSTOMER_RECLIST_MASTER_NONSPECIFIC :: update_customer_reclist_master_nonspecific_summary
--                 17. CREATE TRIGGER :: AFTER INSERT OR UPDATE OR DELETE :: vdm1_data.CUSTOMER_RECLIST_MASTER_SPECIFIC :: update_customer_reclist_master_specific_summary



--             FUNCTIONS TO CREATED TRIGGERS 

--                  1. vdm1_etl.f_vdm1_stage5_trigger_setup_icwh()
--                  2. vdm1_etl.f_vdm1_stage5_trigger_setup_incust()
--                  3. vdm1_etl.f_vdm1_stage5_trigger_setup_incat()
--                  4. vdm1_etl.f_vdm1_stage5_trigger_setup_ininv()
--                  5. vdm1_etl.f_vdm1_stage5_trigger_setup_urr()
--                  6. vdm1_etl.f_vdm1_stage5_trigger_setup_ifr()
--                  7. vdm1_etl.f_vdm1_stage5_trigger_setup_infilm()
--                  8. vdm1_etl.f_vdm1_stage5_trigger_setup_ucxcat()
--                  9. vdm1_etl.f_vdm1_stage5_trigger_setup_nrucatpop()
--                 10. vdm1_etl.f_vdm1_stage5_trigger_setup_ufcpop()
--                 11. vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint()
--                 12. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_nonspecific()
--                 13. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific()
--                 14. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrcp()
--                 15. vdm1_etl.f_vdm1_stage5_trigger_setup_unr()
--                 16. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific()
--                 17. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific()


--     #### #### #### ####
--        STAGE 5c END
--           TRIGGERS
--     #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage5c_triggers_setup()
    LANGUAGE plpgsql
    AS $vdm1_stage5_triggers_setup_procedure$

    BEGIN
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_icwh();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_incust();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_incat();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ininv();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_urr();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ifr();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_infilm();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucxcat();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_nrucatpop();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ufcpop();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_nonspecific();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrcp();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_unr();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific();
        
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific();

    END;
$vdm1_stage5_triggers_setup_procedure$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####   TRIGGER FUNCTIONS #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--        1. vdm1_etl.f_vdm1_stage5_trigger_setup_icwh()
--        2. vdm1_etl.f_vdm1_stage5_trigger_setup_incust()
--        3. vdm1_etl.f_vdm1_stage5_trigger_setup_incat()
--        4. vdm1_etl.f_vdm1_stage5_trigger_setup_ininv()
--        5. vdm1_etl.f_vdm1_stage5_trigger_setup_urr()
--        6. vdm1_etl.f_vdm1_stage5_trigger_setup_ifr()
--        7. vdm1_etl.f_vdm1_stage5_trigger_setup_infilm()
--        8. vdm1_etl.f_vdm1_stage5_trigger_setup_ucxcat()
--        9. vdm1_etl.f_vdm1_stage5_trigger_setup_nrucatpop()
--       10. vdm1_etl.f_vdm1_stage5_trigger_setup_ufcpop()
--       11. vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint()
--       12. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_nonspecific()
--       13. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific()
--       14. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrcp()
--       15. vdm1_etl.f_vdm1_stage5_trigger_setup_unr()
--       16. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific()
--       17. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific()

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_icwh()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_insert_customer_watch_history$

    BEGIN 
        EXECUTE
            'CREATE OR REPLACE TRIGGER insert_customer_watch_history
                AFTER INSERT
                ON public.rental
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_insert_customer_watch_history()';

    END;
$vdm1_stage5_trigger_setup_insert_customer_watch_history$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_incust()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_insert_new_customer$

    BEGIN 
        EXECUTE
            'CREATE OR REPLACE TRIGGER insert_new_customer
                AFTER INSERT
                ON public.customer
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_insert_new_customer()';


    END;
$vdm1_stage5_trigger_setup_insert_new_customer$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_incat()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_insert_new_category$

    BEGIN 
        EXECUTE
            'CREATE OR REPLACE TRIGGER insert_new_category
                AFTER INSERT
                ON public.category
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_insert_new_category()';
    END;
$vdm1_stage5_trigger_setup_insert_new_category$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ininv()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_insert_new_inventory$

    BEGIN 
        EXECUTE
            'CREATE OR REPLACE TRIGGER insert_new_inventory
                AFTER INSERT
                ON public.inventory
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_insert_new_inventory()';

    END;
$vdm1_stage5_trigger_setup_insert_new_inventory$;  

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_urr()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_rental_return$

    BEGIN 
        EXECUTE
            'CREATE OR REPLACE TRIGGER update_rental_return
                AFTER UPDATE
                ON public.rental
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_update_rental_return()';

    END;
$vdm1_stage5_trigger_setup_update_rental_return$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ifr()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_insert_failed_return$

    BEGIN 

        EXECUTE
            'CREATE OR REPLACE TRIGGER insert_failed_return
                AFTER INSERT
                ON public.rental
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_insert_failed_return()';

    END;
$vdm1_stage5_trigger_setup_insert_failed_return$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_infilm()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_insert_new_film$

    BEGIN 

        EXECUTE
            'CREATE OR REPLACE TRIGGER insert_new_film
                AFTER INSERT
                ON public.film_category
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_insert_new_film()';

    END;
$vdm1_stage5_trigger_setup_insert_new_film$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucxcat()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_category$

    BEGIN 

        EXECUTE
            'CREATE OR REPLACE TRIGGER update_customer_category
                AFTER INSERT 
                ON vdm1_data.customer_watch_history_detailed
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_update_customer_category()';

    END;
$vdm1_stage5_trigger_setup_update_customer_category$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_nrucatpop()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_new_rental_update_category_popularity$

    BEGIN 
        EXECUTE
            'CREATE OR REPLACE TRIGGER new_rental_update_category_popularity
                AFTER INSERT 
                ON vdm1_data.customer_watch_history_detailed
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_update_category_popularity()';

    END;
$vdm1_stage5_trigger_setup_new_rental_update_category_popularity$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ufcpop()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_film_category_popularity$

    BEGIN 

        EXECUTE
            'CREATE OR REPLACE TRIGGER update_film_category_popularity
                AFTER INSERT 
                ON vdm1_data.customer_watch_history_detailed
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_update_film_category_popularity()';

    END;
$vdm1_stage5_trigger_setup_update_film_category_popularity$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_inventory_maintenance$

    BEGIN 

        EXECUTE
            'CREATE OR REPLACE TRIGGER update_inventory_maintenance
                AFTER INSERT 
                ON vdm1_data.customer_watch_history_detailed
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_update_inventory_maintenance()';

    END;
$vdm1_stage5_trigger_setup_update_inventory_maintenance$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    12     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_nonspecific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_reclist_master_nonspecific$

    BEGIN 

        EXECUTE
            'CREATE OR REPLACE TRIGGER update_customer_reclist_master_nonspecific
                AFTER INSERT
                ON vdm1_data.customer_watch_history_detailed
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_master_nonspecific()';

    END;
$vdm1_stage5_trigger_setup_update_customer_reclist_master_nonspecific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_reclist_master_specific$

    BEGIN 

        EXECUTE 
            'CREATE OR REPLACE TRIGGER update_customer_reclist_master_specific
                AFTER INSERT
                ON vdm1_data.customer_watch_history_detailed
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_master_specific()';

    END;
$vdm1_stage5_trigger_setup_update_customer_reclist_master_specific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

-- #### #### #### ####
-- ####    14     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrcp()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_rec_custom_preferences$

    BEGIN 

        EXECUTE 
            'CREATE OR REPLACE TRIGGER insert_update_customer_rec_custom_preferences
                AFTER INSERT OR UPDATE 
                ON vdm1_data.customer_rec_custom_preferences
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_insert_update_customer_rec_custom_preferences()';

    END;
$vdm1_stage5_trigger_setup_update_customer_rec_custom_preferences$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    15     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_unr()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_new_release$

    BEGIN 

        EXECUTE 
            'CREATE OR REPLACE TRIGGER update_new_release
                AFTER UPDATE
                ON vdm1_data.film_category_popularity
                FOR EACH ROW
                WHEN (OLD.new_release IS DISTINCT FROM NEW.new_release)
                EXECUTE FUNCTION vdm1_data.t_f_update_new_release()';

    END;
$vdm1_stage5_trigger_setup_update_new_release$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    16     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_reclist_summary_nonspecific$

    BEGIN 

        EXECUTE 
            'CREATE OR REPLACE TRIGGER update_customer_reclist_summary_nonspecific
                AFTER INSERT OR UPDATE OR DELETE 
                ON vdm1_data.customer_reclist_master_nonspecific
                FOR EACH ROW
                EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_nonspecific()';

    END;
$vdm1_stage5_trigger_setup_update_customer_reclist_summary_nonspecific$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    17     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_reclist_summary_specific$

    BEGIN 
        EXECUTE
            'CREATE OR REPLACE TRIGGER update_customer_reclist_summary_specific
                    AFTER INSERT OR UPDATE OR DELETE 
                    ON vdm1_data.customer_reclist_master_specific
                    FOR EACH ROW
                    EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_specific()';

    END;
$vdm1_stage5_trigger_setup_update_customer_reclist_summary_specific$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 5c END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
