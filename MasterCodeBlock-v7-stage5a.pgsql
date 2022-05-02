-- MASTER CODE BLOCK - STAGE 5

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--     #### #### #### ####
--        STAGE 5a BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. vdm1_etl.vdm1_stage5_main();
--                  2. vdm1_etl.vdm1_stage5_reset();

--             FUNCTIONS

--                  1. vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific(); 
--                  2. vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_specific();
--                  3. vdm1_etl.f_vdm1_stage5_create_table_inventory_maintenance_summary();
--                  4. vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();
--                  5. vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_specific();
--                  6. vdm1_etl.f_vdm1_stage5_create_mview_customer_details(); 
--                  7. vdm1_etl.f_vdm1_stage5_create_mview_store_details(); 
--                  8. vdm1_etl.f_vdm1_stage5_create_mview_location_details(); 
--                  9. vdm1_etl.f_vdm1_stage5_create_mview_film_details(); 
--                 10. vdm1_etl.f_vdm1_stage5_create_table_dictkey();
--                 11. vdm1_etl.f_vdm1_stage5_dictkey_insert_category_data();
--                 12. vdm1_etl.f_vdm1_stage5_dictkey_insert_language_data();
--                 13. vdm1_etl.f_vdm1_stage5_dictkey_insert_city_data();
--                 14. vdm1_etl.f_vdm1_stage5_dictkey_insert_country_data();
--                 15. vdm1_etl.f_vdm1_stage5_datestamp();
--                 16. vdm1_etl.f_vdm1_stage5_table_rename();
--                 17. vdm1_etl.f_vdm1_stage5_load_data_marketing();
--                 18. vdm1_etl.f_vdm1_stage5_load_data_vdm1_data();
--                 19. vdm1_etl.f_vdm1_stage5_data_validation_count_check();
--                 20. vdm1_etl.f_vdm1_stage5_table_enabled_logging_vdm1_data()
--                 21. vdm1_data.f_calc_expected_return_date();
--                 22. vdm1_data.f_transform_customer_full_name();
--                 23. vdm1_data.f_transform_filmlength_int2vchar();
--                 24. vdm1_data.f_transform_customer_phone_e164();
--                 25. vdm1_etl.f_vdm1_stage5_create_table_constraints();
--                 26. vdm1_etl.f_vdm1_stage5_cleanup();
--                 27. vdm1_etl.f_vdm1_stage5_delete_stage(); 
--                 28. vdm1_etl.f_refresh_mview_all_marketing();


--     #### #### #### ####
--        STAGE 5a END
--     #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 5a BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 5a BEGIN

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO STAGE 5 - STORED PROCEDURES

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage5a_main()
	LANGUAGE plpgsql
	AS $vdm1_stage5_run_main$
	
	BEGIN 


        -- #### #### #### #### #### #### #### #### 


        PERFORM vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_table_inventory_maintenance_summary();

        PERFORM vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 


        PERFORM vdm1_etl.f_vdm1_stage5_create_mview_customer_details(); 

        PERFORM vdm1_etl.f_vdm1_stage5_create_mview_store_details(); 

        PERFORM vdm1_etl.f_vdm1_stage5_create_mview_location_details(); 
        
        PERFORM vdm1_etl.f_vdm1_stage5_create_mview_film_details(); 

        PERFORM vdm1_etl.f_vdm1_stage5_table_rename();


        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_category');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_category', 'vdm1_data', 'customer_category');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('failed_returns');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'failed_returns', 'vdm1_data', 'failed_returns');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('new_releases');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'new_releases', 'vdm1_data', 'new_releases');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('inventory_maintenance');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'inventory_maintenance', 'vdm1_data', 'inventory_maintenance');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('inventory_maintenance_summary');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'inventory_maintenance_summary', 'vdm1_data', 'inventory_maintenance_summary');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_watch_history_detailed');
 
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_watch_history_detailed', 'vdm1_data', 'customer_watch_history_detailed');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_master_nonspecific');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_master_nonspecific', 'vdm1_data', 'customer_reclist_master_nonspecific');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_master_specific');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_master_specific', 'vdm1_data', 'customer_reclist_master_specific');

        -- #### #### #### #### 
        
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_summary_nonspecific');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_summary_nonspecific', 'vdm1_data', 'customer_reclist_summary_nonspecific');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_summary_specific');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_summary_specific', 'vdm1_data', 'customer_reclist_summary_specific');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('category_popularity');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'category_popularity', 'vdm1_data', 'category_popularity');


        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('film_category_popularity');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'film_category_popularity', 'vdm1_data', 'film_category_popularity');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_rec_custom_preferences');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_rec_custom_preferences', 'vdm1_data', 'customer_rec_custom_preferences');

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


        -- PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup();


        -- PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup();


        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_table_constraints();
        
        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_cleanup();

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_destroy_stage();

        PERFORM vdm1_etl.f_refresh_mview_all_marketing();

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage5_run_main$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage5a_reset()
	LANGUAGE plpgsql
	AS $vdm1_stage5_run_reset$
	
	BEGIN 


        -- #### #### #### #### #### #### #### #### 


        PERFORM vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_table_inventory_maintenance_summary();

        PERFORM vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 

        -- PERFORM vdm1_etl.f_vdm1_stage5_create_mview_customer_details(); 

        -- PERFORM vdm1_etl.f_vdm1_stage5_create_mview_store_details(); 

        -- PERFORM vdm1_etl.f_vdm1_stage5_create_mview_location_details(); 
        
        -- PERFORM vdm1_etl.f_vdm1_stage5_create_mview_film_details(); 

        PERFORM vdm1_etl.f_vdm1_stage5_table_rename();


        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_category');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_category', 'vdm1_data', 'customer_category');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('failed_returns');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'failed_returns', 'vdm1_data', 'failed_returns');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('new_releases');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'new_releases', 'vdm1_data', 'new_releases');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('inventory_maintenance');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'inventory_maintenance', 'vdm1_data', 'inventory_maintenance');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('inventory_maintenance_summary');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'inventory_maintenance_summary', 'vdm1_data', 'inventory_maintenance_summary');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_watch_history_detailed');
 
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_watch_history_detailed', 'vdm1_data', 'customer_watch_history_detailed');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_master_nonspecific');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_master_nonspecific', 'vdm1_data', 'customer_reclist_master_nonspecific');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_master_specific');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_master_specific', 'vdm1_data', 'customer_reclist_master_specific');

        -- #### #### #### #### 
        
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_summary_nonspecific');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_summary_nonspecific', 'vdm1_data', 'customer_reclist_summary_nonspecific');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_summary_specific');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_summary_specific', 'vdm1_data', 'customer_reclist_summary_specific');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('category_popularity');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'category_popularity', 'vdm1_data', 'category_popularity');


        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('film_category_popularity');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'film_category_popularity', 'vdm1_data', 'film_category_popularity');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_rec_custom_preferences');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_rec_custom_preferences', 'vdm1_data', 'customer_rec_custom_preferences');

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


        -- PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup();

        -- PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup();

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_table_constraints();
        
        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_cleanup();

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_destroy_stage();

        -- PERFORM vdm1_etl.f_refresh_mview_all_marketing();

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage5_run_reset$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO STAGE 5 - FUNCTIONS

-- TABLE OF CONTENTS

--      1. vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific(); 
--      2. vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_specific();
--      3. vdm1_etl.f_vdm1_stage5_create_table_inventory_maintenance_summary();
--      4. vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();
--      5. vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_specific();
--      6. vdm1_etl.f_vdm1_stage5_create_mview_customer_details(); 
--      7. vdm1_etl.f_vdm1_stage5_create_mview_store_details(); 
--      8. vdm1_etl.f_vdm1_stage5_create_mview_location_details(); 
--      9. vdm1_etl.f_vdm1_stage5_create_mview_film_details(); 
--     10. vdm1_etl.f_vdm1_stage5_create_table_dictkey();
--     11. vdm1_etl.f_vdm1_stage5_dictkey_insert_category_data();
--     12. vdm1_etl.f_vdm1_stage5_dictkey_insert_language_data();
--     13. vdm1_etl.f_vdm1_stage5_dictkey_insert_city_data();
--     14. vdm1_etl.f_vdm1_stage5_dictkey_insert_country_data();
--     15. vdm1_etl.f_vdm1_stage5_datestamp();
--     16. vdm1_etl.f_vdm1_stage5_table_rename();
--     17. vdm1_etl.f_vdm1_stage5_load_data_marketing();
--     18. vdm1_etl.f_vdm1_stage5_load_data_vdm1_data();
--     19. vdm1_etl.f_vdm1_stage5_data_validation_count_check();
--     20. vdm1_etl.f_vdm1_stage5_table_enabled_logging_vdm1_data()
--     21. vdm1_data.f_calc_expected_return_date();
--     22. vdm1_data.f_transform_customer_full_name();
--     23. vdm1_data.f_transform_filmlength_int2vchar();
--     24. vdm1_data.f_transform_customer_phone_e164();
--     25. vdm1_etl.f_vdm1_stage5_create_table_constraints();
--     26. vdm1_etl.f_vdm1_stage5_cleanup();
--     27. vdm1_etl.f_vdm1_stage5_delete_stage(); 
--     28. vdm1_etl.f_refresh_mview_all_marketing();



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_table_customer_reclist_summary_nonspecific$
	
	BEGIN 

		CREATE TABLE staging.vdm1_stage5_customer_reclist_summary_nonspecific (

		      customer_id INTEGER NOT NULL
            , film_rec_order INTEGER NULL
            , film_id INTEGER NOT NULL
            , category_id INTEGER NOT NULL 
		);
	
	END;
$vdm1_stage5_create_table_customer_reclist_summary_nonspecific$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_specific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_table_customer_reclist_summary_specific$

    BEGIN

        CREATE TABLE staging.vdm1_stage5_customer_reclist_summary_specific (
            
              customer_id INTEGER NOT NULL
            , cat_rec_order INTEGER NULL
			, rental_rec_order INTEGER NULL 
			, film_id INTEGER NOT NULL
			, category_id INTEGER NOT NULL
        );
			
			
	
	END;
$vdm1_stage5_create_table_customer_reclist_summary_specific$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_table_inventory_maintenance_summary()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_table_film_inventory_summary$

	BEGIN
		
		CREATE TABLE staging.vdm1_stage5_inventory_maintenance_summary AS (
			SELECT 
				*
			FROM staging.vdm1_stage5_inventory_maintenance

			WHERE
				inspect_flag = true

			ORDER BY
				life_cycle DESC, film_id, inventory_id
		);
	
	END;
$vdm1_stage5_create_table_film_inventory_summary$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_insert_customer_reclist_summary_nonspecific$
	
	BEGIN 
    
        INSERT INTO staging.vdm1_stage5_customer_reclist_summary_nonspecific (

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
				staging.vdm1_stage5_customer_reclist_master_nonspecific	
			
            WHERE
                film_rec_order <= 10

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
	
	END;
$vdm1_stage5_insert_customer_reclist_summary_nonspecific$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_specific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_insert_customer_reclist_summary_specific$
	
	BEGIN 
	
		INSERT INTO staging.vdm1_stage5_customer_reclist_summary_specific (
			  customer_id
			, cat_rec_order
			, rental_rec_order
			, film_id
			, category_id
		)

		WITH get_customer_reclist_summary_specific_topfives_filmcat AS (
			
			SELECT
				  customer_id
                , cat_rec_order
				, rental_rec_order
				, film_id
				, category_id
			
			FROM
				staging.vdm1_stage5_customer_reclist_master_specific	
			
            WHERE
                rental_rec_order <= 5
                    AND
                cat_rec_order <= 5

			ORDER BY
				customer_id, cat_rec_order, rental_rec_order

		)
        , get_first_cat_films AS (

            SELECT 
                  customer_id
                , cat_rec_order
                , rental_rec_order
                , film_id
                , category_id
            FROM 
                get_customer_reclist_summary_specific_topfives_filmcat
            
            WHERE
                cat_rec_order = 1
        )
        , get_second_cat_films AS (

            SELECT 
                  customer_id
                , cat_rec_order
                , rental_rec_order
                , film_id
                , category_id
            FROM 
                get_customer_reclist_summary_specific_topfives_filmcat
            
            WHERE
                cat_rec_order = 2
                    AND
                rental_rec_order <= 4
        )
        , get_third_cat_films AS (

            SELECT 
                  customer_id
                , cat_rec_order
                , rental_rec_order
                , film_id
                , category_id
            FROM 
                get_customer_reclist_summary_specific_topfives_filmcat
            
            WHERE
                cat_rec_order = 3
                    AND
                rental_rec_order <= 3
        )
        , get_forth_cat_films AS (

            SELECT 
                  customer_id
                , cat_rec_order
                , rental_rec_order
                , film_id
                , category_id
            FROM 
                get_customer_reclist_summary_specific_topfives_filmcat
            
            WHERE
                cat_rec_order = 4
                    AND
                rental_rec_order <= 2
        )
        , get_fifth_cat_films AS (

            SELECT 
                  customer_id
                , cat_rec_order
                , rental_rec_order
                , film_id
                , category_id
            FROM 
                get_customer_reclist_summary_specific_topfives_filmcat
            
            WHERE
                cat_rec_order = 5
                    AND 
                rental_rec_order <= 1
        )
        , build_list AS (
            
            (
                SELECT
                      customer_id
                    , cat_rec_order
                    , rental_rec_order
                    , film_id
                    , category_id
                FROM
                    get_first_cat_films
            )
                UNION ALL 
            (
                SELECT
                      customer_id
                    , cat_rec_order
                    , rental_rec_order
                    , film_id
                    , category_id
                FROM
                    get_second_cat_films
            )
                UNION ALL 
            (
                SELECT
                      customer_id
                    , cat_rec_order
                    , rental_rec_order
                    , film_id
                    , category_id
                FROM
                    get_third_cat_films
            )
                UNION ALL 
            (
                SELECT
                      customer_id
                    , cat_rec_order
                    , rental_rec_order
                    , film_id
                    , category_id
                FROM
                    get_forth_cat_films
            )
                UNION ALL
            (
                SELECT
                      customer_id
                    , cat_rec_order
                    , rental_rec_order
                    , film_id
                    , category_id
                FROM
                    get_fifth_cat_films
            )
        )

		SELECT
			  customer_id
			, cat_rec_order
			, rental_rec_order
			, film_id
			, category_id

		FROM
			build_list;
			
	END;
$vdm1_stage5_insert_customer_reclist_summary_specific$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_mview_customer_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_materialized_view_customer_details$
	
	BEGIN 
	
        CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.customer_details AS (

            SELECT 
                  a.customer_id
                , a.store_id
                , a.first_name
                , a.last_name
                , vdm1_data.f_transform_customer_full_name(a.first_name :: VARCHAR, a.last_name :: VARCHAR ) AS full_name
                , a.email
                , (SELECT AGE('2007-04-29', a.create_date)) as account_age
                , CASE 
                    WHEN a.activebool = true 
                        THEN 'ACTIVE'
                    ELSE 
                        'INACTIVE'
                  END AS active_status
                , vdm1_data.f_transform_customer_phone_e164(b.phone :: VARCHAR ) AS phone
                , c.city
                , d.country
            FROM 
                public.customer AS a
                
                    INNER JOIN 
                        public.address AS b
                            ON b.address_id = a.address_id
                    
                        INNER JOIN 
                            public.city AS c
                                ON c.city_id = b.city_id
                        
                            INNER JOIN 
                                public.country AS d
                                    ON d.country_id = c.country_id

            ORDER BY
                a.customer_id
        )
            WITH NO DATA;
	
	END;
$vdm1_stage5_create_materialized_view_customer_details$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_mview_store_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_materialized_view_store_details$
		
	BEGIN 

		CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.store_details AS (

			SELECT
				  a.store_id
                , b.address_id
                , b.address
                , b.address2
                , b.district
                , c.city
                , d.country
                , b.postal_code
                , vdm1_data.f_transform_customer_phone_e164(b.phone :: VARCHAR ) AS phone

            FROM 
                public.store AS a
                
                
                INNER JOIN 
                    public.address AS b
                        ON b.address_id = a.address_id
                
                
                    INNER JOIN 
                        public.city AS c
                            ON c.city_id = b.city_id

					INNER JOIN
						public.country AS d 
							ON d.country_id = c.country_id


		)
            WITH NO DATA;
		
	END;
$vdm1_stage5_create_materialized_view_store_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_mview_location_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_materialized_view_location_details$
		
	BEGIN 
	
        CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.location_details AS (
        
            SELECT 

                  a.address_id
                , a.address
                , a.address2
                , a.district
                , b.city
                , c.country
                , a.postal_code
                , vdm1_data.f_transform_customer_phone_e164(a.phone :: VARCHAR) AS phone

            FROM 
                public.address AS a
                
                
                INNER JOIN 
                    public.city AS b
                        ON b.city_id = a.city_id
                
                
                    INNER JOIN 
                        public.country AS c
                            ON c.country_id = b.country_id
        
        )
        
            WITH NO DATA;

    END;
$vdm1_stage5_create_materialized_view_location_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_mview_film_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_materialized_view_film_details$
	
	BEGIN 
		
		CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.film_details AS (

			SELECT

				  a.film_id
				, a.title
				, b.category_id
				, a.release_year
				, c.name
				, vdm1_data.f_transform_filmlength_int2vchar(a.length :: INT ) as film_length
				, a.rating
				, a.description
				, a.rental_duration
				, a.rental_rate
				, a.replacement_cost

			FROM 
                public.film AS a

				INNER JOIN 
                    public.film_category AS b
					    ON b.film_id = a.film_id

                INNER JOIN
                    public.language AS c 
                        ON c.language_id = a.language_id
		)
    WITH NO DATA;

	END;
$vdm1_stage5_create_materialized_view_film_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_table_dictkey()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_table_dictkey$
		
	BEGIN 

		CREATE TABLE staging.vdm1_stage5_dictionary_key (

                  dictkey_id INTEGER        -- Primary Key for new Dictionary Key table
                , dictionary VARCHAR      -- Table Name is Dictionary
                , key_id INTEGER            -- Column ID is Key ID
                , key_name VARCHAR        -- Column Data is Key Name 
            );
    
    END;
$vdm1_stage5_create_table_dictkey$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_dictkey_insert_category_data()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_dictkey_insert_category_data$
		
	BEGIN 

        INSERT INTO staging.vdm1_stage5_dictionary_key(

              table_name
            , key_id
            , key_name
        )

            SELECT
				  'category'  
				, category_id
				, name
				
            FROM
				vdm1_etl.vdm1_stage5_dictkey_category;
		
	END;
$vdm1_stage5_dictkey_insert_category_data$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    12     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_dictkey_insert_language_data()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_dictkey_insert_language_data$
		
	BEGIN 

        INSERT INTO staging.vdm1_stage5_dictionary_key(

              table_name
            , key_id
            , key_name
        )

            SELECT
				  'language'  
				, language_id
				, name
				
            FROM
				vdm1_etl.vdm1_stage5_dictkey_language;
		
	END;
$vdm1_stage5_dictkey_insert_language_data$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_dictkey_insert_city_data()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_dictkey_insert_city_data$
		
	BEGIN 

        INSERT INTO staging.vdm1_stage5_dictionary_key(

              table_name
            , key_id
            , key_name
        )

            SELECT
				  'city'  
				, city_id
				, city
				
            FROM
				vdm1_etl.vdm1_stage5_dictkey_city;
		
	END;

$vdm1_stage5_dictkey_insert_city_data$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    14     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_dictkey_insert_country_data()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_dictkey_insert_country_data$
		
	BEGIN 

        INSERT INTO staging.vdm1_stage5_dictionary_key(

              table_name
            , key_id
            , key_name
        )

            SELECT
				  'country'  
				, country_id
				, country
				
            FROM
				vdm1_etl.vdm1_stage5_dictkey_category;
		
	END;
$vdm1_stage5_dictkey_insert_country_data$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    15     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_datestamp()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage5_datestamp$

    BEGIN

		ALTER TABLE IF EXISTS staging.vdm1_stage5_inventory_maintenance
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_inventory_maintenance_summary
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_film_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_watch_history_details
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_rec_custom_preferences
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

        -- #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_master_nonspecific
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_master_specific
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_summary_nonspecific
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_summary_specific
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage5_failed_returns
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_new_releases
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_category_popularity
            ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_film_category_popularity
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;
        
        -- #### #### #### #### 


    END;
$vdm1_stage5_datestamp$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    16     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_table_rename()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_table_rename$
	
	BEGIN
		
		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_category
			RENAME TO customer_category;

		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage5_failed_returns
			RENAME TO failed_returns;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_new_releases
			RENAME TO new_releases;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_inventory_maintenance
			RENAME TO inventory_maintenance;


		ALTER TABLE IF EXISTS staging.vdm1_stage5_inventory_maintenance_summary
			RENAME TO inventory_maintenance_summary;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_watch_history_details
			RENAME TO customer_watch_history_detailed;
            
		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_master_nonspecific
			RENAME TO customer_reclist_master_nonspecific;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_master_specific
			RENAME TO customer_reclist_master_specific;
		
        -- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_summary_nonspecific
			RENAME TO customer_reclist_summary_nonspecific;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_summary_specific
			RENAME TO customer_reclist_summary_specific;


		-- #### #### #### #### #### #### #### #### 
 
        ALTER TABLE IF EXISTS staging.vdm1_stage5_category_popularity
            RENAME TO category_popularity;

        ALTER TABLE IF EXISTS staging.vdm1_stage5_film_category_popularity
            RENAME TO film_category_popularity;
			
        ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_rec_custom_preferences
            RENAME TO customer_rec_custom_preferences;

        -- #### #### #### #### 


	END;
$vdm1_stage5_table_rename$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    17     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_load_data_marketing(tablename VARCHAR(30)) 
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_load_data_marketing$
		
	BEGIN
	 
		EXECUTE
			'CREATE UNLOGGED TABLE IF NOT EXISTS marketing.' || tablename || ' AS 
				SELECT * FROM staging.' || tablename;
	
	END;
$vdm1_stage5_load_data_marketing$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    18     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_load_data_vdm1_data(tablename VARCHAR(30)) 
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_load_data_vdm1_data$
		
	BEGIN
	 
		EXECUTE
			'CREATE UNLOGGED TABLE IF NOT EXISTS vdm1_data.' || tablename || ' AS 
				SELECT * FROM staging.' || tablename;
	
	END;
$vdm1_stage5_load_data_vdm1_data$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    19     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_data_validation_count_check(
      p_schema_one varchar
    , p_table_one varchar
    , p_schmea_two varchar
    , p_table_two varchar
)
    RETURNS BOOLEAN
    LANGUAGE plpgsql
    AS $vdm1_stage5_data_validation_source_count_matches_destination_count$

    DECLARE

        vi_schema_one VARCHAR; 
        vi_table_one VARCHAR;

        vi_schema_two VARCHAR;
        vi_table_two VARCHAR;

        table_one_count INTEGER;
        table_two_count INTEGER;

        vo_table_check BOOLEAN;

    BEGIN

        vi_schema_one := $1;
        vi_table_one := $2;
        
        vi_schema_two := $3;
        vi_table_two := $4;
		
		table_one_count := 0;
		table_two_count := 0;

        EXECUTE
			'SELECT COUNT(*) FROM ' || vi_schema_one || '.' || vi_table_one INTO table_one_count;
		
        EXECUTE 
			'SELECT COUNT(*) FROM ' || vi_schema_two || '.' || vi_table_two INTO table_two_count;


        IF table_one_count > table_two_count THEN
            
            RAISE NOTICE 'The %.% table count is: %', vi_schema_one, vi_table_one, table_one_count;
            RAISE NOTICE 'The %.% table count is: %', vi_schema_two, vi_table_two, table_two_count;
            RAISE NOTICE 'The %.% table count is greater than the %.% table count', vi_schema_one, vi_table_one, vi_schema_two, vi_table_two;
            RAISE NOTICE 'There are % more entries on the %.% table', (table_one_count - table_two_count), vi_schema_two, vi_table_two;
            vo_table_check := false;
			RETURN vo_table_check;

        ELSEIF table_one_count < table_two_count THEN
            
            RAISE NOTICE 'The %.% table count is: %', vi_schema_one, vi_table_one, table_one_count;
            RAISE NOTICE 'The %.% table count is: %', vi_schema_two, vi_table_two, table_two_count;
            RAISE NOTICE 'The %.% table count is less than the %.% table count', vi_schema_one, vi_table_one, vi_schema_two, vi_table_two;
            RAISE NOTICE 'There are % less entries on the %.% table', (table_two_count - table_one_count), vi_schema_one, vi_table_one;
			vo_table_check := false;
            RETURN vo_table_check;

        ELSE
            
            RAISE NOTICE 'The %.% table count is: %', vi_schema_one, vi_table_one, table_one_count;
            RAISE NOTICE 'The %.% table count is: %', vi_schema_two, vi_table_two, table_two_count;
            RAISE NOTICE 'The %.% table count matches the %.% table count', vi_schema_one, vi_table_one, vi_schema_two, vi_table_two;
            vo_table_check := true;
			RETURN vo_table_check;
            
        END IF;
    END;

$vdm1_stage5_data_validation_source_count_matches_destination_count$;
  
-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    20     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_table_enabled_logging_vdm1_data()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage5_table_changes_activate_logging_vdm1_data$
    
    BEGIN

        -- #### #### #### #### #### #### #### #### 

        ALTER TABLE IF EXISTS vdm1_data.customer_category
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.failed_returns
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.new_releases
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.inventory_maintenance
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.inventory_maintenance_summary
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.customer_watch_history_detailed
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.customer_reclist_master_nonspecific
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.customer_reclist_master_specific
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.customer_reclist_summary_nonspecific
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.customer_reclist_summary_specific
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.category_popularity
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.film_category_popularity
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.customer_rec_custom_preferences
            SET LOGGED;

        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage5_table_changes_activate_logging_vdm1_data$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    21     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_data.f_calc_expected_return_date(
		p_film_id INT,
		p_rental_date DATE)
	RETURNS DATE
	LANGUAGE plpgsql
	AS $vdm1_data_calc_expectedreturndate$
	
	DECLARE
		
		vi_film_id INTEGER;
		vlu_rental_duration INTEGER;
		vi_rental_date DATE;
		
		vo_expected_return_date DATE;
	
	BEGIN
		
		vi_film_id := $1;
		vi_rental_date := $2;
		
			SELECT 
				rental_duration INTO vlu_rental_duration
			FROM 
                public.film AS a
			WHERE 
                vi_film_id = a.film_id;

			vo_expected_return_date := vi_rental_date + vlu_rental_duration;

		RETURN vo_expected_return_date;
	END;
$vdm1_data_calc_expectedreturndate$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### ####
-- ####    22     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_data.f_transform_customer_full_name(
		p_first_name VARCHAR,
		p_last_name VARCHAR)
	RETURNS VARCHAR
	LANGUAGE plpgsql
	AS $vdm1_stage4_transform_customer_full_name$
	
	DECLARE
		
		vi_first_name VARCHAR;
		vi_last_name VARCHAR;
		
		vo_full_name VARCHAR;
		
		-- bicapitalization_list varchar[]; 
		bicapitalization_list_2l varchar[]; 
		bicapitalization_list_3l varchar[]; 
		bicapitalization_list_4l varchar[]; 

	BEGIN
		
		vi_first_name := $1;
		vi_last_name := $2;
		
		-- bicapitalization_list := array['mc', 'le', 'la', 'o''', 'da', 'de' ];
		bicapitalization_list_2l := array['mc', 'o'''];
		bicapitalization_list_3l := array['mac'];
		bicapitalization_list_4l := array['von ', 'fitz'];

		
		CASE 
			-- WHEN (LOWER(LEFT($2,4)) = 'von ') THEN
			--	vi_last_name := (UPPER(LEFT($2,1))) || (LOWER(SUBSTRING($2,2,2))) || ' ' || (UPPER(SUBSTRING($2,5,1))) || (LOWER(SUBSTRING($2,5,length($2))));			
			-- WHEN (LOWER(LEFT($2,4)) = 'fitz') THEN
			--	vi_last_name := (UPPER(LEFT($2,1))) || (LOWER(SUBSTRING($2,2,3))) || (UPPER(SUBSTRING($2,4,1))) || (LOWER(SUBSTRING($2,5,length($2))));
			-- WHEN (LOWER(LEFT($2,3)) = 'mac') THEN
			--	vi_last_name := (UPPER(LEFT($2,1))) || (LOWER(SUBSTRING($2,2,2))) || (UPPER(SUBSTRING($2,3,1))) || (LOWER(SUBSTRING($2,4,length($2))));
				
			WHEN (LOWER(LEFT($2,4)) = ANY(bicapitalization_list_4l)) THEN
				vi_last_name := (UPPER(LEFT($2,1))) || (LOWER(SUBSTRING($2,2,3))) || (UPPER(SUBSTRING($2,4,1))) || (LOWER(SUBSTRING($2,5,length($2))));
			WHEN (LOWER(LEFT($2,3)) = ANY(bicapitalization_list_3l)) THEN
				vi_last_name := (UPPER(LEFT($2,1))) || (LOWER(SUBSTRING($2,2,2))) || (UPPER(SUBSTRING($2,4,1))) || (LOWER(SUBSTRING($2,5,length($2))));
			WHEN (LOWER(LEFT($2,2)) = ANY(bicapitalization_list_2l)) THEN 
				vi_last_name := (UPPER(LEFT($2,1))) || (LOWER(SUBSTRING($2,2,1))) || (UPPER(SUBSTRING($2,3,1))) || (LOWER(SUBSTRING($2,4,length($2))));
			ELSE 
				vi_last_name := $2;
		END CASE;

		SELECT 
			CONCAT_WS( 
				' ',
				vi_first_name, 
				vi_last_name)
		INTO vo_full_name;

		RETURN vo_full_name;
	END;
$vdm1_stage4_transform_customer_full_name$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    23     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_data.f_transform_filmlength_int2vchar(
	p_length INTEGER
)
	RETURNS VARCHAR
	LANGUAGE plpgsql
	AS $vdm1_stage4_filmlength_int2vchar$
	
	DECLARE
		-- IN Variable
		vi_len_int INTEGER;
		-- OUT Variable
		vo_len_varchar VARCHAR;
	
	BEGIN 
		-- Clearing the variables
		vo_len_varchar := '';
		vi_len_int := 0;
		-- Setting the variable to input integer
		vi_len_int := $1;
		
		-- Mathing
		CASE
			WHEN ((vi_len_int / 60 > 0) AND (vi_len_int % 60) = 0) THEN 
				vo_len_varchar := (
					(vi_len_int / 60) || ' hrs'
				);
			WHEN (vi_len_int / 60 > 0) THEN 
				vo_len_varchar := (
					(vi_len_int / 60) || ' hrs ' || (vi_len_int % 60) || ' min'
				);
			ELSE
				vo_len_varchar := (
					(vi_len_int % 60) || ' min'
				);
		END CASE;
			
		RETURN vo_len_varchar;
	
	END;
$vdm1_stage4_filmlength_int2vchar$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    24     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_data.f_transform_customer_phone_e164(
		p_phone VARCHAR)
	RETURNS VARCHAR
	LANGUAGE plpgsql
	AS $vdm1_stage5_transform_customer_phone_e164$
	
	DECLARE
		
		vi_phone VARCHAR;
		
		vo_phone VARCHAR;

    BEGIN 

    	vi_phone := $1;

SELECT
	CONCAT_WS(
          ' '
        , '+'
        , LEFT(vi_phone, (LENGTH(vi_phone)-10))
		, SUBSTRING(vi_phone, (LENGTH(vi_phone)-10)+1, 2)
		, SUBSTRING(vi_phone, ((LENGTH(vi_phone)-8)+1), 4)
		, RIGHT(vi_phone,4)
    )
    INTO
        vo_phone;

    RETURN vo_phone;


	END;
$vdm1_stage5_transform_customer_phone_e164$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### ####
-- ####    25     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_table_constraints()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage5_add_table_constraints$

    BEGIN


        ALTER TABLE vdm1_data.customer_category
            ADD PRIMARY KEY (customer_id, category_id),
            ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category (category_id);

        ALTER TABLE vdm1_data.failed_returns
            ADD PRIMARY KEY (customer_id, rental_id),
            ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_rental_id FOREIGN KEY (rental_id) REFERENCES public.rental (rental_id);

        ALTER TABLE vdm1_data.new_releases
            ADD PRIMARY KEY (film_id),
            ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES public.film (film_id);

        ALTER TABLE vdm1_data.inventory_maintenance
            ADD PRIMARY KEY (inventory_id),
            ADD CONSTRAINT fk_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.inventory (inventory_id);

        ALTER TABLE vdm1_data.inventory_maintenance_summary
            ADD PRIMARY KEY (inventory_id),
            ADD CONSTRAINT fk_inventory_id FOREIGN KEY (inventory_id) REFERENCES public.inventory (inventory_id);

        ALTER TABLE vdm1_data.customer_watch_history_detailed
            ADD PRIMARY KEY (customer_id, rental_id),
            ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_rental_id FOREIGN KEY (rental_id) REFERENCES public.rental (rental_id),
            ALTER COLUMN rental_date SET NOT NULL;

        ALTER TABLE vdm1_data.customer_reclist_master_nonspecific
            ADD PRIMARY KEY (customer_id, film_id),
            ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES public.film (film_id);

        ALTER TABLE vdm1_data.customer_reclist_master_specific
            ADD PRIMARY KEY (customer_id, film_id),
            ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES public.film (film_id),
            ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category (category_id);

        ALTER TABLE vdm1_data.customer_reclist_summary_nonspecific
            ADD PRIMARY KEY (customer_id, film_id),
            ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES public.film (film_id);

        ALTER TABLE vdm1_data.customer_reclist_summary_specific
            ADD PRIMARY KEY (customer_id, film_id),
            ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES public.film (film_id),
            ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category (category_id);

        ALTER TABLE vdm1_data.category_popularity
            ADD PRIMARY KEY (category_id),
            ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category (category_id);

        ALTER TABLE vdm1_data.film_category_popularity
            ADD PRIMARY KEY (film_id),
            ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES public.film (film_id),
            ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category (category_id);

        ALTER TABLE vdm1_data.customer_rec_custom_preferences
            ADD PRIMARY KEY (customer_id, category_id),
            ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category (category_id);

    END;
$vdm1_stage5_add_table_constraints$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    26     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_cleanup$
	
	BEGIN
		

		-- #### #### #### ####
	
        -- #### #### #### #### 

        DROP TABLE IF EXISTS staging.vdm1_stage5_customers;

        DROP TABLE IF EXISTS staging.vdm1_stage5_stores;

        DROP TABLE IF EXISTS staging.vdm1_stage5_films;

        DROP TABLE IF EXISTS staging.vdm1_stage5_dictkey_category;		

        DROP TABLE IF EXISTS staging.vdm1_stage5_dictkey_city;		

        DROP TABLE IF EXISTS staging.vdm1_stage5_dictkey_country;		

        DROP TABLE IF EXISTS staging.vdm1_stage5_dictkey_language;	

        -- #### #### #### #### 	

        DROP TABLE IF EXISTS staging.vdm1_stage5_dictkey_customer_details;		

        DROP TABLE IF EXISTS staging.vdm1_stage5_dictkey_film_details;		

        DROP TABLE IF EXISTS staging.vdm1_stage5_dictkey_store_details;			
/*

		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_category
			RENAME TO customer_category;

		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage5_failed_returns
			RENAME TO failed_returns;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_new_releases
			RENAME TO new_releases;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_inventory_maintenance
			RENAME TO inventory_maintenance;


		ALTER TABLE IF EXISTS staging.vdm1_stage5_inventory_maintenance_summary
			RENAME TO inventory_maintenance_summary;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_watch_history_details
			RENAME TO customer_watch_history_detailed;
            
		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_master_nonspecific
			RENAME TO customer_reclist_master_nonspecific;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_master_specific
			RENAME TO customer_reclist_master_specific;
		
        -- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_summary_nonspecific
			RENAME TO customer_reclist_summary_nonspecific;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_summary_specific
			RENAME TO customer_reclist_summary_specific;


		-- #### #### #### #### #### #### #### #### 
 

        ALTER TABLE IF EXISTS staging.vdm1_stage5_category_popularity
            RENAME TO category_popularity;

        ALTER TABLE IF EXISTS staging.vdm1_stage5_film_category_popularity
            RENAME TO film_category_popularity;
			
        ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_rec_custom_preferences
            RENAME TO customer_rec_custom_preferences;

        -- #### #### #### #### 
    */

	END;
$vdm1_stage5_cleanup$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    27     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_destroy_stage()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_destroy_stage$
	
	BEGIN
		
		DROP SCHEMA IF EXISTS staging
			CASCADE;

	END;
$vdm1_stage5_destroy_stage$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    28     #### 
-- #### #### #### #### 



CREATE OR REPLACE FUNCTION vdm1_etl.f_refresh_mview_all_marketing()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_refresh_materialized_views_all_marketing$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

		REFRESH MATERIALIZED VIEW marketing.customer_details;  

		REFRESH MATERIALIZED VIEW marketing.film_details;  

		REFRESH MATERIALIZED VIEW marketing.location_details;  

		REFRESH MATERIALIZED VIEW marketing.store_details;    

		-- REFRESH MATERIALIZED VIEW marketing.category;  

		-- REFRESH MATERIALIZED VIEW marketing.city;  

		-- REFRESH MATERIALIZED VIEW marketing.country;   

		-- REFRESH MATERIALIZED VIEW marketing.language;  
    
        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_refresh_materialized_views_all_marketing$;

-- #TODO STAGE 5 END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 5a END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
