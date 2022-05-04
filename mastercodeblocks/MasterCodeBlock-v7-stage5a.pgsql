
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 5a BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 5a BEGIN


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--     #### #### #### ####
--        STAGE 5a BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. vdm1_etl.vdm1_stage5a_main();
--                  2. vdm1_etl.vdm1_stage5a_reset();

--             FUNCTIONS

--                  1. vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific(); 
--                  2. vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_specific();
--                  3. vdm1_etl.f_vdm1_stage5_create_table_inventory_maintenance_summary();
--                  4. vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();
--                  5. vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_specific();
--                  6. vdm1_etl.f_vdm1_stage5_create_materialized_view(); 
--                  7. vdm1_etl.f_vdm1_stage5_create_table_dictkey();
--                  8. vdm1_etl.f_vdm1_stage5_dictkey_insert_category_data();
--                  9. vdm1_etl.f_vdm1_stage5_dictkey_insert_language_data();
--                 10. vdm1_etl.f_vdm1_stage5_dictkey_insert_city_data();
--                 11. vdm1_etl.f_vdm1_stage5_dictkey_insert_country_data();
--                 12. vdm1_etl.f_vdm1_stage5_datestamp();
--                 13. vdm1_etl.f_vdm1_stage5_table_rename();
--                 14. vdm1_etl.f_vdm1_stage5_load_data_marketing();
--                 15. vdm1_etl.f_vdm1_stage5_load_data_vdm1_data();
--                 16. vdm1_etl.f_vdm1_stage5_data_validation_count_check();
--                 17. vdm1_etl.f_vdm1_stage5_table_enabled_logging_vdm1_data()
--                 18. vdm1_data.f_calc_expected_return_date(p_film_id INT, p_rental_date DATE);
--                 19. vdm1_data.f_transform_customer_full_name(p_first_name VARCHAR, p_last_name VARCHAR);
--                 20. vdm1_data.f_transform_filmlength_int2vchar(p_length INTEGER);
--                 21. vdm1_data.f_transform_customer_phone_e164(p_phone VARCHAR);
--                 22. vdm1_etl.f_vdm1_stage5_create_table_constraints();
--                 23. vdm1_etl.f_vdm1_stage5_cleanup();
--                 24. vdm1_etl.f_vdm1_stage5_delete_stage(); 
--                 25. vdm1_etl.f_vdm1_stage5_referesh_materialized_view();


--     #### #### #### ####
--        STAGE 5a END
--     #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

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

		-- PERFORM vdm1_etl.f_vdm1_stage5_adhoc_functions_setup_cerd();

		-- PERFORM vdm1_etl.f_vdm1_stage5_adhoc_functions_setup_tcfn();

		-- PERFORM vdm1_etl.f_vdm1_stage5_adhoc_functions_setup_tcpn();

		-- PERFORM vdm1_etl.f_vdm1_stage5_adhoc_functions_setup_tfldt();

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_table_inventory_maintenance_summary();

        PERFORM vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 
        
        PERFORM vdm1_etl.f_vdm1_stage5_create_table_dictkey();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_category_data();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_city_data();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_country_data();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_language_data();


        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_table_rename();
    
        -- #### #### #### #### #### #### #### #### 


        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_category');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_category', 'vdm1_data', 'customer_category');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('failed_returns');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'failed_returns', 'vdm1_data', 'failed_returns');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('new_releases');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'new_releases', 'vdm1_data', 'new_releases');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('inventory_maintenance');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'inventory_maintenance', 'vdm1_data', 'inventory_maintenance');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('inventory_maintenance_summary');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'inventory_maintenance_summary', 'vdm1_data', 'inventory_maintenance_summary');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_watch_history_detailed');
 
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_watch_history_detailed', 'vdm1_data', 'customer_watch_history_detailed');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_master_nonspecific');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_master_nonspecific', 'vdm1_data', 'customer_reclist_master_nonspecific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_master_specific');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_master_specific', 'vdm1_data', 'customer_reclist_master_specific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA         
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_summary_nonspecific');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_summary_nonspecific', 'vdm1_data', 'customer_reclist_summary_nonspecific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_summary_specific');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_summary_specific', 'vdm1_data', 'customer_reclist_summary_specific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('category_popularity');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'category_popularity', 'vdm1_data', 'category_popularity');


        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('film_category_popularity');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'film_category_popularity', 'vdm1_data', 'film_category_popularity');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_rec_custom_preferences');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_rec_custom_preferences', 'vdm1_data', 'customer_rec_custom_preferences');


        -- #### #### #### #### #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictionary_key');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictionary_key', 'vdm1_data', 'dictionary_key');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_category');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_category', 'vdm1_data', 'dictkey_category');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_city');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_city', 'vdm1_data', 'dictkey_city');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_country');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_country', 'vdm1_data', 'dictkey_country');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_language');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_language', 'vdm1_data', 'dictkey_language');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_customer_details');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_customer_details', 'vdm1_data', 'dictkey_customer_details');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_film_details');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_film_details', 'vdm1_data', 'dictkey_film_details');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_store_details');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_store_details', 'vdm1_data', 'dictkey_store_details');

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_customer_details', 'customer_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_store_details', 'store_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_film_details', 'film_id');
        
        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictionary_key');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_category', 'category_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_city', 'city_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_country', 'country_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_language', 'language_id');

        -- #### #### #### #### 


        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('customer_reclist_master_nonspecific', 'customer_id, film_rec_order');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('customer_reclist_master_specific', 'customer_id, cat_rec_order, rental_rec_order');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('customer_reclist_summary_nonspecific', 'customer_id, film_rec_order');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('customer_reclist_summary_specific', 'customer_id, cat_rec_order, rental_rec_order');

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('failed_returns', 'customer_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('new_releases', 'film_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('customer_watch_history_detailed', 'customer_id, customer_watch_history_desc_order');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('film_category_popularity', 'total_rentals DESC, film_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('category_popularity', 'total_rentals DESC');

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup();


        -- PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup();


        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_table_constraints();
        
        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_cleanup();

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_destroy_stage();

        -- #### #### #### #### #### #### #### ###

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_category');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_city');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_country');

        -- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_language');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_customer_details');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_store_details');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_film_details');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('customer_reclist_master_nonspecific');

        -- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('customer_reclist_master_specific');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('customer_reclist_summary_nonspecific');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('customer_reclist_summary_specific');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('failed_returns');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('new_releases');

        -- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('film_category_popularity');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('category_popularity');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('customer_watch_history_detailed');

        -- #### #### #### #### #### #### #### #### 



        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage5_run_main$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage5a_reset()
	LANGUAGE plpgsql
	AS $vdm1_stage5_run_reset$
	
	BEGIN 


 
        -- #### #### #### #### #### #### #### #### 

		-- PERFORM vdm1_etl.f_vdm1_stage5_adhoc_functions_setup_cerd();

		-- PERFORM vdm1_etl.f_vdm1_stage5_adhoc_functions_setup_tcfn();

		-- PERFORM vdm1_etl.f_vdm1_stage5_adhoc_functions_setup_tcpn();

		-- PERFORM vdm1_etl.f_vdm1_stage5_adhoc_functions_setup_tfldt();

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_table_inventory_maintenance_summary();

        PERFORM vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 

        
        PERFORM vdm1_etl.f_vdm1_stage5_create_table_dictkey();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_category_data();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_city_data();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_country_data();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_language_data();


        -- #### #### #### #### #### #### #### #### 


        PERFORM vdm1_etl.f_vdm1_stage5_table_rename();
    
        -- #### #### #### #### #### #### #### #### 


        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_category');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_category', 'vdm1_data', 'customer_category');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('failed_returns');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'failed_returns', 'vdm1_data', 'failed_returns');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('new_releases');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'new_releases', 'vdm1_data', 'new_releases');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('inventory_maintenance');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'inventory_maintenance', 'vdm1_data', 'inventory_maintenance');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('inventory_maintenance_summary');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'inventory_maintenance_summary', 'vdm1_data', 'inventory_maintenance_summary');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_watch_history_detailed');
 
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_watch_history_detailed', 'vdm1_data', 'customer_watch_history_detailed');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_master_nonspecific');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_master_nonspecific', 'vdm1_data', 'customer_reclist_master_nonspecific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_master_specific');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_master_specific', 'vdm1_data', 'customer_reclist_master_specific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA         
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_summary_nonspecific');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_summary_nonspecific', 'vdm1_data', 'customer_reclist_summary_nonspecific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_reclist_summary_specific');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_summary_specific', 'vdm1_data', 'customer_reclist_summary_specific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('category_popularity');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'category_popularity', 'vdm1_data', 'category_popularity');


        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('film_category_popularity');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'film_category_popularity', 'vdm1_data', 'film_category_popularity');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('customer_rec_custom_preferences');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_rec_custom_preferences', 'vdm1_data', 'customer_rec_custom_preferences');


        -- #### #### #### #### #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictionary_key');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictionary_key', 'vdm1_data', 'dictionary_key');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_category');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_category', 'vdm1_data', 'dictkey_category');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_city');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_city', 'vdm1_data', 'dictkey_city');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_country');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_country', 'vdm1_data', 'dictkey_country');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_language');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_language', 'vdm1_data', 'dictkey_language');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_customer_details');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_customer_details', 'vdm1_data', 'dictkey_customer_details');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_film_details');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_film_details', 'vdm1_data', 'dictkey_film_details');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_vdm1_data('dictkey_store_details');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_store_details', 'vdm1_data', 'dictkey_store_details');

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_customer_details', 'customer_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_store_details', 'store_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_film_details', 'film_id');
        
        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictionary_key');


        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_category', 'category_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_city', 'city_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_country', 'country_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('dictkey_language', 'language_id');

        -- #### #### #### #### 


        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('customer_reclist_master_nonspecific', 'customer_id, film_rec_order');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('customer_reclist_master_specific', 'customer_id, cat_rec_order, rental_rec_order');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('customer_reclist_summary_nonspecific', 'customer_id, film_rec_order');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('customer_reclist_summary_specific', 'customer_id, cat_rec_order, rental_rec_order');
        
        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('failed_returns', 'customer_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('new_releases', 'film_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('customer_watch_history_detailed', 'customer_id, customer_watch_history_desc_order');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('film_category_popularity', 'total_rentals DESC, film_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('category_popularity', 'total_rentals DESC');


        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_table_constraints();
        
        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_cleanup();

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_destroy_stage();


        -- #### #### #### #### #### #### #### ###

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_category');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_city');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_country');

        -- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_language');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_customer_details');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_store_details');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('dictkey_film_details');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('customer_reclist_master_nonspecific');

        -- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('customer_reclist_master_specific');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('customer_reclist_summary_nonspecific');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('customer_reclist_summary_specific');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('failed_returns');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('new_releases');

        -- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('film_category_popularity');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('category_popularity');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_referesh_materialized_view('customer_watch_history_detailed');

        -- #### #### #### #### #### #### #### #### 




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
--      6. vdm1_etl.f_vdm1_stage5_create_materialzied_view(); 
--      7. vdm1_etl.f_vdm1_stage5_create_table_dictkey();
--      8. vdm1_etl.f_vdm1_stage5_dictkey_insert_category_data();
--      9. vdm1_etl.f_vdm1_stage5_dictkey_insert_language_data();
--     10. vdm1_etl.f_vdm1_stage5_dictkey_insert_city_data();
--     11. vdm1_etl.f_vdm1_stage5_dictkey_insert_country_data();
--     12. vdm1_etl.f_vdm1_stage5_datestamp();
--     13. vdm1_etl.f_vdm1_stage5_table_rename();
--     14. vdm1_etl.f_vdm1_stage5_load_data_marketing();
--     15. vdm1_etl.f_vdm1_stage5_load_data_vdm1_data();
--     16. vdm1_etl.f_vdm1_stage5_data_validation_count_check();
--     17. vdm1_etl.f_vdm1_stage5_table_enabled_logging_vdm1_data()
--     18. vdm1_data.f_calc_expected_return_date(p_film_id INT, p_rental_date DATE);
--     19. vdm1_data.f_transform_customer_full_name(p_first_name VARCHAR, p_last_name VARCHAR);
--     20. vdm1_data.f_transform_filmlength_int2vchar(p_length INTEGER);
--     21. vdm1_data.f_transform_customer_phone_e164(p_phone VARCHAR);
--     22. vdm1_etl.f_vdm1_stage5_create_table_constraints();
--     23. vdm1_etl.f_vdm1_stage5_cleanup();
--     24. vdm1_etl.f_vdm1_stage5_delete_stage(); 
--     25. vdm1_etl.f_vdm1_stage5_referesh_materialized_view();



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

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_materialized_view(
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
-- ####     7     #### 
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
-- ####     8     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_dictkey_insert_category_data()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_dictkey_insert_category_data$
		
	BEGIN 

        INSERT INTO staging.vdm1_stage5_dictionary_key(

              dictionary
            , key_id
            , key_name
        )

            SELECT
				  'category'  
				, category_id
				, name
				
            FROM
				staging.vdm1_stage5_dictkey_category;
		
	END;
$vdm1_stage5_dictkey_insert_category_data$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_dictkey_insert_language_data()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_dictkey_insert_language_data$
		
	BEGIN 

        INSERT INTO staging.vdm1_stage5_dictionary_key(

              dictionary
            , key_id
            , key_name
        )

            SELECT
				  'language'  
				, language_id
				, name
				
            FROM
				staging.vdm1_stage5_dictkey_language;
		
	END;
$vdm1_stage5_dictkey_insert_language_data$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_dictkey_insert_city_data()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_dictkey_insert_city_data$
		
	BEGIN 

        INSERT INTO staging.vdm1_stage5_dictionary_key(

              dictionary
            , key_id
            , key_name
        )

            SELECT
				  'city'  
				, city_id
				, city
				
            FROM
				staging.vdm1_stage5_dictkey_city;
		
	END;

$vdm1_stage5_dictkey_insert_city_data$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_dictkey_insert_country_data()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_dictkey_insert_country_data$
		
	BEGIN 

        INSERT INTO staging.vdm1_stage5_dictionary_key(

              dictionary
            , key_id
            , key_name
        )

            SELECT
				  'country'  
				, country_id
				, country
				
            FROM
				staging.vdm1_stage5_dictkey_country;
		
	END;
$vdm1_stage5_dictkey_insert_country_data$;



-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    12     #### 
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

        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictionary_key
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_city
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;
			
        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_country
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_language
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_customer_details
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;
			
        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_store_details
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_film_details
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

        -- #### #### #### #### 

    END;
$vdm1_stage5_datestamp$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    13     #### 
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

        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictionary_key
            RENAME TO dictionary_key;

        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_category
            RENAME TO dictkey_category;

        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_city
            RENAME TO dictkey_city;
			
        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_country
            RENAME TO dictkey_country;

        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_language
            RENAME TO dictkey_language;

        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_customer_details
            RENAME TO dictkey_customer_details;
			
        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_store_details
            RENAME TO dictkey_store_details;

        ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_film_details
            RENAME TO dictkey_film_details;

        -- #### #### #### #### 
	END;
$vdm1_stage5_table_rename$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    14     #### 
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
-- ####    15     #### 
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
-- ####    16     #### 
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
-- ####    17     #### 
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


        ALTER TABLE IF EXISTS vdm1_data.dictkey_category
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.dictkey_city
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.dictkey_country
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.dictkey_language
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.dictkey_customer_details
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.dictkey_store_details
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.dictkey_location_details
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.dictionary_key
            SET LOGGED;

        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage5_table_changes_activate_logging_vdm1_data$;

-- #### #### #### #### #### #### #### #### 



-- #### #### #### ####
-- ####    22     #### 
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
-- ####    23     #### 
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

        DROP TABLE IF EXISTS staging.vdm1_stage5_dictionary_key;	

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
-- ####    24     #### 
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
-- ####    25     #### 
-- #### #### #### #### 



CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_referesh_materialized_view(
      p_tablename VARCHAR
)
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_refresh_materialized_view$

    DECLARE 

        table_name VARCHAR;

	BEGIN 

        table_name := $1;

			EXECUTE 
            ' REFRESH MATERIALIZED VIEW marketing.' || table_name;
	END;
$vdm1_stage5_refresh_materialized_view$;

-- #### #### #### #### #### #### #### #### 



-- #TODO STAGE 5 END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 5a END    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
