-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### ####       VDM1 RESET STAGE START       #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO VDM1 RESET STAGE BEGIN

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--     #### #### #### ####
--         VDM1 RESET
--         STAGE START
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. vdm1_etl.vdm1_reset();
--                  2. vdm1_etl.vdm1_reset_mview_setup();

--              FUNCTIONS

--                  1. vdm1_etl.f_vdm1_reset_disable_triggers() 
--                  2. vdm1_etl.f_vdm1_reset_drop_triggers();
--             	    3. vdm1_etl.f_vdm1_reset_delete_table_vdm1_data(); 
--                  4. vdm1_etl.f_vdm1_reset_create_materialized_view();
--                  5. vdm1_etl.f_vdm1_reset_drop_materialized_view();
--                  6. vdm1_etl.f_vdm1_reset_referesh_materialized_view();


--     #### #### #### ####
--         VDM1 RESET
--         STAGE END
--     #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO VDM1 RESET - STORED PROCECURES


CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_reset()
	LANGUAGE plpgsql
	AS $vdm1_reset$
	
	BEGIN 

		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_disable_triggers();

		PERFORM vdm1_etl.f_vdm1_reset_drop_triggers();


		-- #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_reset_delete_tables_vdm1_data();

		-- #### #### #### #### #### #### #### #### 

        CALL vdm1_etl.vdm1_reset_stage0();

		CALL vdm1_etl.vdm1_stage1();

		CALL vdm1_etl.vdm1_stage2();

		CALL vdm1_etl.vdm1_stage3();

        -- DISABLING MAIN RUN DUE TO PERFORMANCE/TIME IMPACT
        -- CALL vdm1_etl.vdm1_stage4();

            -- STAGE 4 HAS BEEN SPLIT INTO 3 SUBPARTS TO ASSIST WITH PERFORMANCE IMPACT
            CALL vdm1_etl.vdm1_stage4a();

            CALL vdm1_etl.vdm1_stage4b();

            CALL vdm1_etl.vdm1_stage4c();

        CALL vdm1_etl.vdm1_stage5a_reset();

        CALL vdm1_etl.vdm1_stage5b_trigger_functions_setup();

        CALL vdm1_etl.vdm1_stage5c_triggers_setup();

        CALL vdm1_etl.vdm1_reset_mview_setup();
		
	END;
$vdm1_reset$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_reset_mview_setup()
	LANGUAGE plpgsql
	AS $vdm1_reset_materialized_view_recreation$
	
	BEGIN 

		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('dictionary_key');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('dictionary_key');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('dictionary_key');

		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('dictkey_category');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('dictkey_category');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('dictkey_category');
        
 		-- #### #### #### #### #### #### #### #### 
        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('dictkey_city');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('dictkey_city');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('dictkey_city');
        

		-- #### #### #### #### #### #### #### #### 
        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('dictkey_country');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('dictkey_country');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('dictkey_country');
        

  		-- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('dictkey_language');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('dictkey_language');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('dictkey_language');
        
		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('customer_details');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('customer_details');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('customer_details');
        
		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('store_details');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('store_details');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('store_details');
        
 		-- #### #### #### #### #### #### #### #### 
        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('film_details');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('film_details');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('film_details');
        

		-- #### #### #### #### #### #### #### #### 
        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('customer_reclist_master_nonspecific');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('customer_reclist_master_nonspecific');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('customer_reclist_master_nonspecific');
        

  		-- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('customer_reclist_master_specific');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('customer_reclist_master_specific');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('customer_reclist_master_specific');
        
		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('customer_reclist_summary_nonspecific');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('customer_reclist_summary_nonspecific');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('customer_reclist_summary_nonspecific');
        
		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('customer_reclist_summary_specific');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('customer_reclist_summary_specific');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('customer_reclist_summary_specific');
        
 		-- #### #### #### #### #### #### #### #### 
        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('failed_returns');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('failed_returns');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('failed_returns');
        

		-- #### #### #### #### #### #### #### #### 
        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('new_releases');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('new_releases');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('new_releases');
        

  		-- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('film_category_popularity');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('film_category_popularity');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('film_category_popularity');
        
		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('category_popularity');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('category_popularity');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('category_popularity');
        
		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('customer_watch_history_detailed');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('customer_watch_history_detailed');

        PERFORM vdm1_etl.f_vdm1_reset_referesh_materialized_view('customer_watch_history_detailed');
        
		-- #### #### #### #### #### #### #### #### 


	END;
$vdm1_reset_materialized_view_recreation$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO VDM1 RESET - FUNCTIONS

-- TABLE OF CONTENTS

--       1. vdm1_etl.f_vdm1_reset_disable_triggers() 
--       2. vdm1_etl.f_vdm1_reset_drop_triggers();
--  	 3. vdm1_etl.f_vdm1_reset_delete_table_vdm1_data(); 
--       4. vdm1_etl.f_vdm1_reset_create_materialized_view();
--       5. vdm1_etl.f_vdm1_reset_drop_materialized_view();
--       6. vdm1_etl.f_vdm1_reset_referesh_materialized_view();


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_disable_triggers()
	RETURNS VOID
	LANGUAGE plpgsql
	
	AS $vdm1_reset_procedure_function_disable_triggers$
	
	
	BEGIN

        -- #### #### #### #### #### #### #### #### 

			ALTER TABLE public.customer
				DISABLE TRIGGER ALL;

			ALTER TABLE public.category
				DISABLE TRIGGER ALL;

			ALTER TABLE public.inventory
				DISABLE TRIGGER ALL;

			ALTER TABLE public.rental
				DISABLE TRIGGER ALL;

			ALTER TABLE public.film_category
				DISABLE TRIGGER ALL;

			ALTER TABLE vdm1_data.customer_watch_history_detailed
				DISABLE TRIGGER ALL;

			ALTER TABLE vdm1_data.customer_rec_custom_preferences
				DISABLE TRIGGER ALL;

			ALTER TABLE vdm1_data.film_category_popularity
				DISABLE TRIGGER ALL;

			ALTER TABLE vdm1_data.customer_reclist_master_nonspecific
				DISABLE TRIGGER ALL;

			ALTER TABLE vdm1_data.customer_reclist_master_specific
				DISABLE TRIGGER ALL;



        -- #### #### #### #### #### #### #### #### 

	END;
$vdm1_reset_procedure_function_disable_triggers$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_drop_triggers()
	RETURNS VOID
	LANGUAGE plpgsql
	
	AS $vdm1_reset_procedure_function_drop_triggers$
	
	
	BEGIN

        -- #### #### #### #### #### #### #### #### 

            /*

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ifr()
				ON public.rental CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incat()
				ON public.category CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incust()
				ON public.customer CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_infilm()
				ON public.film_category CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ininv()
				ON public.inventory CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_iucrcp()
				ON vdm1_data.customer_rec_custom_preferences CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucatpop()
				ON vdm1_data.category_popularity CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucustcat()
				ON vdm1_data.customer_category CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non()
				ON vdm1_data.customer_reclist_master_nonspecific CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe()
				ON vdm1_data.customer_reclist_master_specific CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_non()
				ON vdm1_data.customer_reclist_summary_nonspecific CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_spe()
				ON vdm1_data.customer_reclist_summary_specific CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_upcxwatchhist()
				ON vdm1_data.customer_watch_history_detailed CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ufcp()
				ON vdm1_data.film_category_popularity CASCADE; 

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_uinvm()
				ON vdm1_data.inventory_maintenance CASCADE;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_unewr()
				ON vdm1_data.film_category_popularity;

			DROP TRIGGER IF EXISTS vdm1_etl.f_vdm1_stage5_trigger_functions_setup_urr()
				ON public.rental CASCADE;

            */

        -- #### #### #### #### #### #### #### #### 
                    
            DROP TRIGGER IF EXISTS insert_customer_watch_history
                ON public.rental CASCADE;

            DROP TRIGGER IF EXISTS insert_new_customer
                ON public.customer CASCADE;

            DROP TRIGGER IF EXISTS insert_new_category
                ON public.category CASCADE;

            DROP TRIGGER IF EXISTS insert_new_inventory
                ON public.inventory CASCADE;

            DROP TRIGGER IF EXISTS update_rental_return
                ON public.rental CASCADE;

            DROP TRIGGER IF EXISTS insert_failed_return
                ON public.rental CASCADE;

            DROP TRIGGER IF EXISTS insert_new_film
                ON public.film_category CASCADE;

            DROP TRIGGER IF EXISTS update_customer_category
                ON vdm1_data.customer_watch_history_detailed CASCADE;

            DROP TRIGGER IF EXISTS new_rental_update_category_popularity
                ON vdm1_data.customer_watch_history_detailed CASCADE;

            DROP TRIGGER IF EXISTS update_film_category_popularity
                ON vdm1_data.customer_watch_history_detailed CASCADE;

            DROP TRIGGER IF EXISTS update_inventory_maintenance
                ON vdm1_data.customer_watch_history_detailed CASCADE;

            DROP TRIGGER IF EXISTS update_customer_reclist_master_nonspecific
                ON vdm1_data.customer_watch_history_detailed CASCADE;

            DROP TRIGGER IF EXISTS update_customer_reclist_master_specific
                ON vdm1_data.customer_watch_history_detailed CASCADE;

            DROP TRIGGER IF EXISTS insert_update_customer_rec_custom_preferences
                ON vdm1_data.customer_rec_custom_preferences CASCADE;

            DROP TRIGGER IF EXISTS update_new_release
                ON vdm1_data.film_category_popularity CASCADE;

            DROP TRIGGER IF EXISTS update_customer_reclist_summary_nonspecific
                ON vdm1_data.customer_reclist_master_nonspecific CASCADE;

            DROP TRIGGER IF EXISTS update_customer_reclist_summary_specific
                ON vdm1_data.customer_reclist_master_specific CASCADE;

        -- #### #### #### #### #### #### #### #### 

	END;
$vdm1_reset_procedure_function_drop_triggers$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 



CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_delete_tables_vdm1_data()
	RETURNS VOID
	LANGUAGE plpgsql
	
	AS $vdm1_reset_procedure_function_delete_tables_vdm1_data$
	
	
	BEGIN

        -- #### #### #### #### #### #### #### #### 

		DROP TABLE IF EXISTS vdm1_data.customer_category 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.failed_returns 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.new_releases 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.inventory_maintenance 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.inventory_maintenance_summary 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.customer_watch_history_detailed 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.customer_reclist_master_nonspecific 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.customer_reclist_master_specific 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.customer_reclist_summary_nonspecific 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.customer_reclist_summary_specific 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.category_popularity 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.film_category_popularity 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.customer_rec_custom_preferences 
			CASCADE;

        -- #### #### #### #### #### #### #### #### 

		DROP TABLE IF EXISTS vdm1_data.dictionary_key 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.dictkey_category 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.dictkey_city
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.dictkey_country
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.dictkey_language
			CASCADE;

        DROP TABLE IF EXISTS vdm1_data.dictkey_customer_details
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.dictkey_store_details
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.dictkey_film_details
			CASCADE;



        -- #### #### #### #### #### #### #### #### 

	END;
$vdm1_reset_procedure_function_delete_tables_vdm1_data$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_materialized_view(
      p_tablename VARCHAR
    , p_order_by VARCHAR DEFAULT NULL
)
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_materialized_view$

    DECLARE 

        table_name VARCHAR;
        order_by VARCHAR;
		order_by_clause VARCHAR;
	
	BEGIN 

        table_name := $1;
        order_by := $2;
		
		IF 
			(order_by is not null)
		THEN 

			EXECUTE
				'CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.' || table_name || ' AS (
					SELECT
						*
					FROM 
						vdm1_data.' || table_name || ' ORDER BY ' || order_by ||
				' ) 
					WITH NO DATA';
		ELSE 
			EXECUTE
				'CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.' || table_name || ' AS (
					SELECT
						*
					FROM 
						vdm1_data.' || table_name || 
				' ) 
					WITH NO DATA';
		END IF;
	END;
$vdm1_stage5_create_materialized_view$;


-- #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 
        
CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_drop_materialized_view(
      p_tablename VARCHAR
)
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_drop_materialized_view$

    DECLARE 

        table_name VARCHAR;

	BEGIN 

        table_name := $1;

			EXECUTE 
            ' DROP MATERIALIZED VIEW marketing.' || table_name || ' CASCADE';
	END;
$vdm1_stage5_drop_materialized_view$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    6     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_referesh_materialized_view(
      p_tablename VARCHAR
)
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_refresh_materialized_view$

    DECLARE 

        table_name VARCHAR;

	BEGIN 

        table_name := $1;

			EXECUTE 
            ' REFERSH MATERIALIZED VIEW marketing.' || table_name;
	END;
$vdm1_reset_refresh_materialized_view$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


-- #TODO VDM1 RESET STAGE END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### ####        VDM1 RESET STAGE END        #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
