-- MASTER CODE BLOCK - TABLE OF CONTENTS
-- Version 7

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                           

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--     #### #### #### ####
--         STAGE 0 BEGIN
--     #### #### #### ####

--             SCHEMA CREATION

--                  1. CREATE SCHEMA :: MARKETING
--                  2. CREATE SCHEMA :: VDM1_ETL
--                  3. DROP SCHEMA :: STAGING - CASCADE
--                  4. CREATE SCHEMA :: STAGING
--                  5. DROP SCHEMA :: VDM1_DATA - CASCADE
--					6. CREATE SCHEMA :: VDM1_DATA

--            STORED PROCEDURES

--                  1. vdm1_etl.vdm1_etl_main();
--                  2. vdm1_etl.vdm1_evdm1_reset_stage0();

--     #### #### #### ####
--         STAGE 0 END
--     #### #### #### ####

--     #### #### #### ####
--         STAGE 1 BEGIN
--     #### #### #### ####


--             STORED PROCEDURES

--                  1. vdm1_etl.vdm1_stage1();

--             FUNCTIONS

--                  1. vdm1_etl.f_vdm1_stage1_extractimport(tablename VARCHAR(30));
--                  2. vdm1_etl.f_vdm1_stage1_data_validation_count_check(p_schema_one varchar, p_table_one varchar, p_schmea_two varchar, p_table_two varchar);

--     #### #### #### ####
--         STAGE 1 END
--     #### #### #### ####

--     #### #### #### ####
--         STAGE 2 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. vdm1_etl.vdm1_stage2();

--             FUNCTIONS

--                  1. vdm1_etl.f_vdm1_stage2_customer_status_amend();
--                  2. vdm1_etl.f_vdm1_stage2_films()
--                  3. vdm1_etl.f_vdm1_stage2_film_inventory()
--                  4. vdm1_etl.f_vdm1_stage2_rentals()
--                  5. vdm1_etl.f_vdm1_stage2_locationdetails()
--                  6. vdm1_etl.f_vdm1_stage2_stores()
--                  7. vdm1_etl.f_vdm1_stage2_customers()
--                  8. vdm1_etl.f_vdm1_stage2_customer_category()
--                  9. vdm1_etl.f_vdm1_stage2_film_category()
--                 10. vdm1_etl.f_vdm1_stage2_customer_film_category();
--                 11. vdm1_etl.f_vdm1_stage2_cleanup()

--     #### #### #### ####
--         STAGE 2 END
--     #### #### #### ####

--     #### #### #### ####
--         STAGE 3 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. vdm1_etl.vdm1_stage3();


--             FUNCTIONS

--                  1. vdm1_etl.f_vdm1_stage3_create_table_new_releases()
--                  2. vdm1_etl.f_vdm1_stage3_create_table_failed_returns()
--                  3. vdm1_etl.f_vdm1_stage3_create_table_category_count_init()
--                  4. vdm1_etl.f_vdm1_stage3_create_table_customer_watch_history_details()
--                  5. vdm1_etl.f_vdm1_stage3_create_table_cx_reclist_master_nonspecific()
--                  6. vdm1_etl.f_vdm1_stage3_create_table_cx_reclist_master_specific()
--                  7. vdm1_etl.f_vdm1_stage3_create_table_customer_rec_custom_preferences()
--                  8. vdm1_etl.f_vdm1_stage3_table_changes()
--                  9. vdm1_etl.f_vdm1_stage3_cleanup()


--     #### #### #### ####
--         STAGE 3 END
--     #### #### #### ####

--     #### #### #### ####
--         STAGE 4 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. vdm1_etl.vdm1_stage4();
--                  2. vdm1_etl.vdm1_stage4a();
--                  3. vdm1_etl.vdm1_stage4b();
--                  4. vdm1_etl.vdm1_stage4c();


--             FUNCTIONS

--                  1. vdm1_etl.f_vdm1_stage4_calc_update_category_popularity_count()
--                  2. vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_count()
--                  3. vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_row_number()
--                  4. vdm1_etl.f_vdm1_stage4_calc_update_film_category_popularity_row_number()
--                  5. vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_count()
--                  6. vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
--                  7. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_count_null_corrections()
--                  8. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_historical_count()
--                  9. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_average_count()
--                 10. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_halfaverage_count()
--                 11. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_historical()
--                 12. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_average()
--                 13. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage()
--                 14. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default()
--                 15. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order()
--                 16. vdm1_etl.f_vdm1_stage4_calc_update_customer_watch_history_row_number()
--                 17. vdm1_etl.f_vdm1_stage4_calc_insert_failed_returns_v2()
--                 18. vdm1_etl.f_vdm1_stage4_calc_insert_new_releases_v2()
--                 19. vdm1_etl.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat
--                 20. vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific()
--                 21. vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn()
--                 22. vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();
--                 23. vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();
--                 24. vdm1_etl.f_vdm1_stage4_transform_customer_full_name(p_first_name VARCHAR, p_last_name VARCHAR)
--                 25. vdm1_etl.f_vdm1_stage4_transform_filmlength_int2vchar(p_length INTEGER)
--                 26. vdm1_etl.f_vdm1_stage4_calc_expected_return_date(p_film_id INT, p_rental_date DATE)
--                 27. vdm1_etl.f_vdm1_stage4_cleanup()


--     #### #### #### ####
--         STAGE 4 END
--     #### #### #### ####


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
--                 21. vdm1_data.f_vdm1_stage4_calc_expected_return_date();
--                 22. vdm1_data.f_vdm1_stage4_transform_customer_full_name();
--                 23. vdm1_data.f_vdm1_stage4_transform_filmlength_int2vchar();
--                 24. vdm1_data.f_transform_customer_phone_e164();
--                 25. vdm1_etl.f_vdm1_stage5_create_table_constraints();
--                 26. vdm1_etl.f_vdm1_stage5_cleanup();
--                 27. vdm1_etl.f_vdm1_stage5_delete_stage(); 
--                 28. vdm1_etl.f_refresh_mview_all_marketing();


--     #### #### #### ####
--        STAGE 5a END
--     #### #### #### ####

--     #### #### #### ####
--       STAGE 5b BEGIN
--      TRIGGER FUNCTIONS
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. vdm1_etl.vdm1_stage5_trigger_functions_setup();



--             TRIGGER FUNCTIONS

--                  1. vdm1_data.t_f_insert_failed_return();
--                  2. vdm1_data.t_f_insert_new_category();
--                  3. vdm1_data.t_f_insert_new_customer();
--                  4. vdm1_data.t_f_insert_new_film();
--                  5. vdm1_data.t_f_insert_new_inventory();
--                  6. vdm1_data.t_f_insert_update_customer_rec_custom_preferences();
--                  7. vdm1_data.t_f_update_category_popularity();
--                  8. vdm1_data.t_f_update_customer_category();
--                  9. vdm1_data.t_f_update_customer_reclist_master_nonspecific();
--                 10. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe()
--                 11. vdm1_data.t_f_update_customer_reclist_summary_nonspecific();
--                 12. vdm1_data.t_f_update_customer_reclist_summary_specific();
--                 13. vdm1_data.t_f_insert_customer_watch_history();
--                 14. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ufcp()
--                 15. vdm1_data.t_f_update_inventory_maintenance();
--                 16. vdm1_data.t_f_update_new_release();
--                 17. vdm1_data.t_f_update_rental_return();



--             FUNCTIONS USED TO CREATED TRIGGER FUNCTIONS

--                  1. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ifr()
--                  2. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incat()
--                  3. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incust()
--                  4. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_infilm()
--                  5. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ininv()
--                  6. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_iucrcp()
--                  7. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucatpop()
--                  8. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucustcat()
--                  9. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlma_non()
--                 10. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_non()
--                 11. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_non()
--                 12. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_spe()
--                 13. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_upcxwatchhist()
--                 14. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ufcp()
--                 15. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_uinvm()
--                 16. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_unewr()
--                 17. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_urr()

--     #### #### #### ####
--        STAGE 5b END
--      TRIGGER FUNCTIONS
--     #### #### #### ####

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

--     #### #### #### ####
--         VDM1 RESET
--         STAGE START
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. vdm1_etl.vdm1_reset();
--                  2. vdm1_etl.vdm1_reset_mview_setup();

--              FUNCTIONS

--                  1. vdm1_etl.f_vdm1_reset_drop_triggers();
--             	    2. vdm1_etl.f_vdm1_reset_delete_table_vdm1_data(); 
--                  3. vdm1_etl.f_vdm1_reset_create_mview_customer_details();
--                  4. vdm1_etl.f_vdm1_reset_create_mview_store_details();
--                  5. vdm1_etl.f_vdm1_reset_create_mview_location_details();
--                  6. vdm1_etl.f_vdm1_reset_create_mview_film_details();
--                  7. vdm1_etl.f_vdm1_reset_drop_all_mviews_marketing();
--                  8. vdm1_etl.f_vdm1_reset_drop_mviews_marketing_customer_details();
--                  9. vdm1_etl.f_vdm1_reset_drop_mviews_marketing_film_details();
--                 10. vdm1_etl.f_vdm1_reset_drop_mviews_marketing_location_details();
--                 11. vdm1_etl.f_vdm1_reset_drop_mviews_marketing_store_details();
--                 12. vdm1_etl.f_vdm1_reset_refresh_mview_all_marketing();
--                 13. vdm1_etl.f_vdm1_reset_refresh_mview_marketing_customer_details();
--                 14. vdm1_etl.f_vdm1_reset_refresh_mview_marketing_film_details();
--                 15. vdm1_etl.f_vdm1_reset_refresh_mview_marketing_location_details();
--                 16. vdm1_etl.f_vdm1_reset_refresh_mview_marketing_store_details();


--     #### #### #### ####
--         VDM1 RESET
--         STAGE END
--     #### #### #### ####

--     #### #### #### ####
--     DISABLED CODE START
--     #### #### #### ####

--     #### #### #### ####
--      DISABLED CODE END
--     #### #### #### ####



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                           
