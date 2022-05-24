-- Danty Cook
-- Student ID: 007003568
-- Course: Advanced Data Management (D191)
-- Performance Assessment: VDM1 Task 1: Automating Data Integration
-- May 23, 2022

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                           

-- MASTER CODE BLOCK
-- Version 12

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
--                  6. CREATE SCHEMA :: VDM1_DATA

--            STORED PROCEDURES

--                  1. public.full_reset();
--                  2. vdm1_etl.vdm1_etl_main();
--                  3. vdm1_etl.vdm1_evdm1_reset_stage0();

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
--                  3. vdm1_data.f_vdm1_calc_expected_return_date(p_film_id INT, p_rental_date DATE)
--                  4. vdm1_data.f_vdm1_transform_customer_full_name(p_first_name VARCHAR, p_last_name VARCHAR)
--                  5. vdm1_data.f_vdm1_transform_filmlength_int2vchar(p_length INTEGER)
--                  6. vdm1_data.f_vdm1_transform_customer_phone_e164(p_phone VARCHAR)

--     #### #### #### ####
--         STAGE 1 END
--     #### #### #### ####

--     #### #### #### ####
--         STAGE 2 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. vdm1_etl.vdm1_stage2();

--             FUNCTIONS

--                   1. vdm1_etl.f_vdm1_stage2_customer_status_amend();
--                   2. vdm1_etl.f_vdm1_stage2_films()
--                   3. vdm1_etl.f_vdm1_stage2_film_inventory()
--                   4. vdm1_etl.f_vdm1_stage2_rentals()
--                   5. vdm1_etl.f_vdm1_stage2_locationdetails()
--                   6. vdm1_etl.f_vdm1_stage2_stores()
--                   7. vdm1_etl.f_vdm1_stage2_customers()
--                   8. vdm1_etl.f_vdm1_stage2_customer_category()
--                   9. vdm1_etl.f_vdm1_stage2_film_category()
--                  10. vdm1_etl.f_vdm1_stage2_customer_film_category();
--                  11. vdm1_etl.f_vdm1_stage2_cleanup()

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

--                   1. vdm1_etl.vdm1_stage4();
--                   2. vdm1_etl.vdm1_stage4a();
--                   3. vdm1_etl.vdm1_stage4b();
--                   4. vdm1_etl.vdm1_stage4c();
--                   5. vdm1_etl.vdm1_stage4c1();
--                   6. vdm1_etl.vdm1_stage4c1a();
--                   7. vdm1_etl.vdm1_stage4c1b();
--                   8. vdm1_etl.vdm1_stage4c2();
--                   9. vdm1_etl.vdm1_stage4c2a();
--                  10. vdm1_etl.vdm1_stage4c2b();
--                  11. vdm1_etl.vdm1_stage4c3();

--             FUNCTIONS

--                   1. vdm1_etl.f_vdm1_stage4_transform_customer_full_name();
--                   2. vdm1_etl.f_vdm1_stage4_transform_customer_phone_number();
--                   3. vdm1_etl.f_vdm1_stage4_transform_film_length();
--                   4. vdm1_etl.f_vdm1_stage4_calc_update_category_popularity_count()
--                   5. vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_count()
--                   6. vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_row_number()
--                   7. vdm1_etl.f_vdm1_stage4_calc_update_film_category_popularity_row_number()
--                   8. vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_count()
--                   9. vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
--                  10. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_count_null_corrections()
--                  11. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_historical_count()
--                  12. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_average_count()
--                  13. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_halfaverage_count()
--                  14. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_historical()
--                  15. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_average()
--                  16. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage()
--                  17. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default()
--                  18. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order()
--                  19. vdm1_etl.f_vdm1_stage4_calc_update_customer_watch_history_row_number()
--                  20. vdm1_etl.f_vdm1_stage4_calc_insert_failed_returns_v2()
--                  21. vdm1_etl.f_vdm1_stage4_calc_insert_new_releases_v2()
--                  22. vdm1_etl.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat
--                  23. vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific()
--                  24. vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn()
--                  25. vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();
--                  26. vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();
--                  27. vdm1_etl.f_vdm1_stage4_cleanup()

--     #### #### #### ####
--         STAGE 4 END
--     #### #### #### ####

--     #### #### #### ####
--        STAGE 5a BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. vdm1_etl.vdm1_stage5a_main();
--                  2. vdm1_etl.vdm1_stage5a_reset();

--             FUNCTIONS

--                   1. vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific(); 
--                   2. vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_specific();
--                   3. vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();
--                   4. vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_specific();
--                   5. vdm1_etl.f_vdm1_stage5_create_materialzied_view(); 
--                   6. vdm1_etl.f_vdm1_stage5_create_table_dictkey();
--                   7. vdm1_etl.f_vdm1_stage5_dictkey_insert_category_data();
--                   8. vdm1_etl.f_vdm1_stage5_dictkey_insert_language_data();
--                   9. vdm1_etl.f_vdm1_stage5_dictkey_insert_city_data();
--                  10. vdm1_etl.f_vdm1_stage5_dictkey_insert_country_data();
--                  11. vdm1_etl.f_vdm1_stage5_datestamp();
--                  12. vdm1_etl.f_vdm1_stage5_table_rename();
--                  13. vdm1_etl.f_vdm1_stage5_load_data_from_staging(p_schema_name VARCHAR, p_table_name VARCHAR);
--                  14. vdm1_etl.f_vdm1_stage5_data_validation_count_check();
--                  15. vdm1_etl.f_vdm1_stage5_table_enabled_logging_vdm1_data()
--                  16. vdm1_etl.f_vdm1_stage5_create_table_constraints();
--                  17. vdm1_etl.f_vdm1_stage5_alter_tables_set_defaults();
--                  18. vdm1_etl.f_vdm1_stage5_pkey_setval(p_schemaname VARCHAR, p_tablename VARCHAR, p_pkey_column_name VARCHAR);
--                  19. vdm1_etl.f_vdm1_stage5_cleanup();
--                  20. vdm1_etl.f_vdm1_stage5_delete_stage(); 
--                  21. vdm1_etl.f_vdm1_stage5_create_mview_inventory_summary();
--                  22. vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_master_non();
--                  23. vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_master_spec();
--                  24. vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_summary_non();
--                  25. vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_summary_spec();
--                  26. vdm1_etl.f_vdm1_stage5_refresh_materialized_view();
--                  27. vdm1_etl.f_vdm1_stage5_create_index(p_index_name VARCHAR, p_schema_name VARCHAR, p_table_name VARCHAR, p_column_name VARCHAR)

--     #### #### #### ####
--        STAGE 5a END
--     #### #### #### ####

--     #### #### #### ####
--       STAGE 5b BEGIN
--      TRIGGER FUNCTIONS
--     #### #### #### ####

--             STORED PROCEDURES

--                   1. vdm1_etl.vdm1_stage5_trigger_functions_setup();

--             TRIGGER FUNCTIONS

--                   1. vdm1_data.t_f_insert_null_returned_date_rental_to_fr_table();
--                   2. vdm1_data.t_f_insert_new_category();
--                   3. vdm1_data.t_f_insert_new_customer();
--                   4. vdm1_data.t_f_insert_new_film();
--                   5. vdm1_data.t_f_insert_new_inventory();
--                   6. vdm1_data.t_f_insert_update_customer_rec_custom_preferences();
--                   6. vdm1_data.t_f_delete_reset_customer_rec_custom_preferences();
--                   8. vdm1_data.t_f_update_category_popularity();
--                   9. vdm1_data.t_f_update_customer_category();
--                  10. vdm1_data.t_f_update_customer_reclist_master_nonspecific_new_rental();
--                  11. vdm1_data.t_f_update_customer_reclist_master_nonspecific_ru();
--                  12. vdm1_data.t_f_update_customer_reclist_master_specific_new_rental()
--                  13. vdm1_data.t_f_update_customer_reclist_master_specific_new_rental_ru()
--                  14. vdm1_data.t_f_update_customer_reclist_summary_nonspecific();
--                  15. vdm1_data.t_f_update_customer_reclist_summary_nonspecific_ru();
--                  16. vdm1_data.t_f_update_customer_reclist_summary_specific();
--                  17. vdm1_data.t_f_update_customer_reclist_summary_specific_ru();
--                  18. vdm1_data.t_f_insert_customer_watch_history();
--                  19. vdm1_data.t_f_update_film_category_popularity_new_rental()
--                  20. vdm1_data.t_f_update_inventory_maintenance_count();
--                  21. vdm1_data.t_f_update_new_release();
--                  22. vdm1_data.t_f_update_rental_return();
--                  23. vdm1_data.t_f_insert_customer_reclist_master_nonspecific_new_film();
--                  24. vdm1_data.t_f_insert_customer_reclist_master_specific_new_film();
--                  25. vdm1_data.t_f_update_inventory_maintenance_complete()
--                  26. vdm1_data.t_f_insert_new_city();
--                  27. vdm1_data.t_f_insert_new_country();
--                  28. vdm1_data.t_f_insert_new_language();
--                  29. vdm1_data.t_f_refresh_materialized_views();

--             FUNCTIONS USED TO CREATED TRIGGER FUNCTIONS

--                   1. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ifr()
--                   2. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incat()
--                   3. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incust()
--                   4. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_infilm()
--                   5. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ininv()
--                   6. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_iucrcp()
--                   7. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_drcrcp()
--                   8. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucatpop()
--                   9. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucustcat()
--                  10. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non()
--                  11. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non_nr()
--                  12. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe()
--                  13. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe_ru()
--                  14. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_non()
--                  15. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_non_ru()
--                  16. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_spe()
--                  17. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_spe_ru()
--                  18. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_upcxwatchhist()
--                  19. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ufcp()
--                  20. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_uinv_count()
--                  21. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_unewr()
--                  22. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_urr()
--                  23. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non_inf()
--                  24. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe_inf()
--                  25. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_uinv_comp()
--                  26. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incity()
--                  27. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incountry()
--                  28. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_inlanguage()
--                  29. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_refreshmviews();

--     #### #### #### ####
--        STAGE 5b END
--      TRIGGER FUNCTIONS
--     #### #### #### ####

--     #### #### #### ####
--       STAGE 5c BEGIN
--           TRIGGERS
--     #### #### #### ####

--             STORED PROCEDURES


--                   1. vdm1_etl.vdm1_stage5_triggers_setup();

--             TRIGGER FUNCTIONS

--                   1. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.RENTAL :: insert_customer_watch_history
--                   2. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.CUSTOMER :: insert_new_customer
--                   3. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.CATEGORY :: insert_new_category
--                   4. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.INVENTORY :: insert_new_inventory
--                   5. CREATE TRIGGER :: AFTER UPDATE :: PUBLIC.RENTAL :: update_rental_return_date_delete_rental_from_fr_table 
--                   6. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.RENTAL :: insert_null_returned_date_rental_to_fr_table
--                   7. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.FILM_CATEGORY :: insert_new_film
--                   8. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_WATCH_HISTORY_DETAILED :: update_a_customer_category
--                   9. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_WATCH_HISTORY_DETAILED :: update_b_category_popularity_new_rental
--                  10. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_WATCH_HISTORY_DETAILED :: update_c_film_category_popularity_new_rental
--                  11. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_WATCH_HISTORY_DETAILED :: update_d_inventory_maintenance_count
--                  12. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_WATCH_HISTORY_DETAILED :: update_e_customer_reclist_master_nonspecific_new_rental
--                  13. CREATE TRIGGER :: AFTER DELETE :: VDM1_DATA.CUSTOMER_RECLIST_MASTER_NONSPECIFIC :: update_a_customer_reclist_master_nonspecific_updaterental
--                  14. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_WATCH_HISTORY_DETAILED :: update_f_customer_reclist_master_specific_new_rental
--                  15. CREATE TRIGGER :: AFTER DELETE :: VVDM1_DATA.CUSTOMER_RECLIST_MASTER_SPECIFIC :: update_a_customer_reclist_master_specific_updaterental
--                  16. CREATE TRIGGER :: AFTER INSERT OR UPDATE :: VDM1_DATA.CUSTOMER_REC_CUSTOM_PREFERNCES :: insert_update_customer_rec_custom_preferences
--                  17. CREATE TRIGGER :: AFTER DELETE :: VDM1_DATA.CUSTOMER_REC_CUSTOM_PREFERNCES :: delete_reset_customer_rec_custom_preferences
--                  18. CREATE TRIGGER :: AFTER UPDATE :: VDM1_DATA.FILM_CATEGORY_POPULARITY :: update_new_release_status_delete_film_from_nr_table
--                  19. CREATE TRIGGER :: AFTER DELETE :: VDM1_DATA.CUSTOMER_RECLIST_MASTER_NONSPECIFIC :: update_b_customer_reclist_summary_nonspecific
--                  20. CREATE TRIGGER :: AFTER TRUNCATE :: VDM1_DATA.CUSTOMER_RECLIST_SUMMARY_NONSPECIFIC :: update_customer_reclist_summary_nonspecific_ru
--                  21. CREATE TRIGGER :: AFTER DELETE :: VDM1_DATA.CUSTOMER_RECLIST_MASTER_SPECIFIC :: update_b_customer_reclist_summary_specific
--                  22. CREATE TRIGGER :: AFTER TRUNCATE :: VDM1_DATA.CUSTOMER_RECLIST_SUMMARY_SPECIFIC :: update_customer_reclist_summary_specific_rental_update
--                  23. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.FILM_CATEGORY_POPULARITY :: insert_customer_reclist_nonspecific_with_new_film
--                  24. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.FILM_CATEGORY_POPULARITY :: insert_customer_reclist_specific_with_new_film
--                  25. CREATE TRIGGER :: AFTER UPDATE :: VDM1_DATA.INVENTORY_MAINTENCE :: update_inventory_maintenance_complete
--                  26. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.CITY :: insert_new_city
--                  27. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.COUNTRY :: insert_new_country
--                  28. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.LANGUAGE :: insert_new_language
--                  29. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_RECLIST_SUMMARY_NONSPECIFIC :: refresh_materialized_views_non
--                  30. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_RECLIST_SUMMARY_SPECIFIC :: refresh_materialized_views_spe
--                  31. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.DICTIONARY_KEY :: refresh_materialized_views_dictionary_key
--                  32. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.DICTKEY_CATEGORY :: refresh_materialized_views_dictkey_category
--                  33. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.DICTKEY_CITY :: refresh_materialized_views_dictkey_city
--                  34. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.DICTKEY_COUNTRY :: refresh_materialized_views_dictkey_country
--                  35. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.DICTKEY_LANGUAGE :: refresh_materialized_views_dictkey_language
--                  36. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.DICTKEY_STORE_DETAILS :: refresh_materialized_views_dictkey_store_details
--                  37. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.FAILED_RETURNS :: refresh_materialized_views_failed_returns
--                  38. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.NEW_RELEASES :: refresh_materialized_views_new_releases
--                  39. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.INVENTORY_MAINTENANCE_SUMMARY :: refresh_materialized_views_inventory_maintenance_summary


--             FUNCTIONS TO CREATED TRIGGERS 

--                   1. vdm1_etl.f_vdm1_stage5_trigger_setup_icwh()
--                   2. vdm1_etl.f_vdm1_stage5_trigger_setup_incust()
--                   3. vdm1_etl.f_vdm1_stage5_trigger_setup_incat()
--                   4. vdm1_etl.f_vdm1_stage5_trigger_setup_ininv()
--                   5. vdm1_etl.f_vdm1_stage5_trigger_setup_urr()
--                   6. vdm1_etl.f_vdm1_stage5_trigger_setup_ifr()
--                   7. vdm1_etl.f_vdm1_stage5_trigger_setup_infilm()
--                   8. vdm1_etl.f_vdm1_stage5_trigger_setup_ucxcat()
--                   9. vdm1_etl.f_vdm1_stage5_trigger_setup_nrucatpop()
--                  10. vdm1_etl.f_vdm1_stage5_trigger_setup_ufcpop_nr()
--                  11. vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint_count()
--                  12. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_nonspecific()
--                  13. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_non_ur();
--                  14. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific()
--                  15. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific_ur();
--                  16. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrcp()
--                  17. vdm1_etl.f_vdm1_stage5_trigger_setup_dcrcp()
--                  18. vdm1_etl.f_vdm1_stage5_trigger_setup_unr()
--                  19. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific()
--                  20. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific_ru()
--                  21. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific()
--                  22. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific_ru()
--                  23. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_non_inf();
--                  24. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_spe_inf();
--                  25. vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint_comp()
--                  26. vdm1_etl.f_vdm1_stage5_trigger_setup_incity()
--                  27. vdm1_etl.f_vdm1_stage5_trigger_setup_incountry()
--                  28. vdm1_etl.f_vdm1_stage5_trigger_setup_inlanguage()
--                  29. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_non();
--                  30. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_spe();
--                  31. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dictkey();
--                  32. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_cat();
--                  33. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_ci();
--                  34. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_co();
--                  35. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_l();
--                  36. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_sd();
--                  37. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_fr();
--                  38. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_nr();
--                  39. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_ims();


--     #### #### #### ####
--        STAGE 5c END
--           TRIGGERS
--     #### #### #### ####

--     #### #### #### ####
--         VDM1 RESET
--         STAGE START
--     #### #### #### ####

--             STORED PROCEDURES

--                   1. vdm1_etl.vdm1_reset();
--                   2. vdm1_etl.vdm1_reset_mview_setup();

--              FUNCTIONS

--                   1. vdm1_etl.f_vdm1_reset_disable_triggers();
--                   2. vdm1_etl.f_vdm1_reset_drop_triggers();
--                   3. vdm1_etl.f_vdm1_reset_drop_index(p_schema_name VARCHAR, p_index_name VARCHAR, p_concurrently BOOLEAN);
--                   4. vdm1_etl.f_vdm1_reset_delete_tables_vdm1_data();
--                   5. vdm1_etl.f_vdm1_reset_create_materialized_view();
--                   6. vdm1_etl.f_vdm1_reset_drop_materialized_view();
--                   7. vdm1_etl.f_vdm1_reset_refresh_materialized_view()
--                   8. vdm1_etl.f_vdm1_reset_create_mview_inventory_maintenance_summary
--                   9. vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_master_non()
--                  10. vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_master_spec()
--                  11. vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_summary_non()
--                  12. vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_summary_spec()
--                  13. vdm1_etl.f_vdm1_reset_enable_triggers()

--     #### #### #### ####
--         VDM1 RESET
--         STAGE END
--     #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                           

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 0 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 0 BEGIN

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--     #### #### #### ####
--         STAGE 0 BEGIN
--     #### #### #### ####

--             SCHEMA CREATION

--                   1. CREATE SCHEMA :: MARKETING
--                   2. CREATE SCHEMA :: VDM1_ETL
--                   3. DROP SCHEMA :: STAGING - CASCADE
--                   4. CREATE SCHEMA :: STAGING
--                   5. DROP SCHEMA :: VDM1_DATA - CASCADE
--                   6. CREATE SCHEMA :: VDM1_DATA

--            STORED PROCEDURES

--                   1. vdm1_etl.vdm1_etl_main();
--                   2. vdm1_etl.vdm1_evdm1_reset_stage0();

--     #### #### #### ####
--         STAGE 0 END
--     #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####   SCHEMA CREATION   #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


CREATE SCHEMA IF NOT EXISTS marketing;


-- #### #### #### #### #### #### #### #### 


CREATE SCHEMA IF NOT EXISTS vdm1_etl;


-- #### #### #### #### #### #### #### #### #### #### #### ####


DROP SCHEMA IF EXISTS staging
    CASCADE;


-- #### #### #### #### #### #### #### #### 


CREATE SCHEMA IF NOT EXISTS staging;


-- #### #### #### #### #### #### #### #### #### #### #### ####


DROP SCHEMA IF EXISTS vdm1_data
	CASCADE;


-- #### #### #### #### #### #### #### #### 


CREATE SCHEMA IF NOT EXISTS vdm1_data;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- #### FULLRESET #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.fulL_reset()
	LANGUAGE plpgsql
	AS $full_reset$
	
	BEGIN 

		-- #### #### #### #### #### #### #### #### 

		DROP SCHEMA IF EXISTS marketing
			CASCADE;

		DROP SCHEMA IF EXISTS staging
			CASCADE;

		DROP SCHEMA IF EXISTS vdm1_etl
			CASCADE;

		DROP SCHEMA IF EXISTS vdm1_data
			CASCADE;		

		-- #### #### #### #### #### #### #### #### 

	END;

$full_reset$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####  ETL MAIN #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_etl_main()
	LANGUAGE plpgsql
	AS $etl_main_run$
	
	BEGIN 

		-- #### #### #### #### #### #### #### #### 

		-- STAGE 0 / RESET STAGE 0

		RAISE NOTICE 'RUNNING VDM1 ETL STAGE 0 / RESET STAGE 0';
        CALL vdm1_etl.vdm1_reset_stage0();
		RAISE NOTICE 'COMPLETED VDM1 ETL STAGE 0 / RESET STAGE 0 ';

		-- #### #### #### #### 

		-- STAGE 1

		RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 1';
		CALL vdm1_etl.vdm1_stage1();
		RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 1';

		-- #### #### #### #### 

		-- STAGE 2

		RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 2';
		CALL vdm1_etl.vdm1_stage2();
		RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 2';

		-- #### #### #### #### 

		-- STAGE 3

		RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 3';
		CALL vdm1_etl.vdm1_stage3();
		RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 3';

		-- #### #### #### #### #### #### #### #### 

		-- STAGE 4

        -- DISABLING MAIN RUN DUE TO PERFORMANCE/TIME IMPACT
        -- CALL vdm1_etl.vdm1_stage4();

            -- STAGE 4 HAS BEEN SPLIT INTO 3 SUBPARTS, THEN AGAIN 4 MORE SUB PARTS TO ASSIST WITH PERFORMANCE IMPACT
			RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4a';
            CALL vdm1_etl.vdm1_stage4a();
		    RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4a';

			RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4b';
            CALL vdm1_etl.vdm1_stage4b();
			RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4b';

		-- #### #### #### #### #### #### #### #### 
		
		-- STAGE 4

				-- STAGE 4-C-1-A :: INSERTS CUSTOMER RECOMMENDATION LIST INTO MASTER NONSPECIFIC
				RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4c1a';
				CALL vdm1_etl.vdm1_stage4c1a();
				RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4c1a';

				-- STAGE 4-C-1-B :: PERFORMS ROW NUBMER COUNT ON CUSTOMER RECOMMENDATION LIST MASTER NONSPECIFIC
				RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4c1b';
				CALL vdm1_etl.vdm1_stage4c1b();
				RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4c1b';

				-- STAGE 4-C-2-A :: INSERTS CUSTOMER RECOMMENDATION LIST INTO MASTER SPECIFIC
				RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4c2a';
				CALL vdm1_etl.vdm1_stage4c2a();
				RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4c2a';

				-- STAGE 4-C-2-B :: PERFORMS ROW NUBMER COUNT ON CUSTOMER RECOMMENDATION LIST MASTER SPECIFIC
				RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4c2b';
				CALL vdm1_etl.vdm1_stage4c2b();
				RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4c2b';

				-- STAGE 4-C-3 :: PERFORMS CLEANUP
				RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4c3';
				CALL vdm1_etl.vdm1_stage4c3();
				RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4c3';

		-- #### #### #### #### #### #### #### #### 

		-- STAGE 5

		RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 5a - MAIN';
        CALL vdm1_etl.vdm1_stage5a_main();
		RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 5a - MAIN';
		
		RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 5b - TRIGGER FUNCTION SETUP';
        CALL vdm1_etl.vdm1_stage5b_trigger_functions_setup();
		RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 5b - TRIGGER FUNCTION SETUP';

		RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 5c - TRIGGER SETUP';
        CALL vdm1_etl.vdm1_stage5c_triggers_setup();
		RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 5c - TRIGGER SETUP';

	END;
$etl_main_run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- #### RESET / 0 #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_reset_stage0()
    LANGUAGE plpgsql
    AS $vdm1_stage0_etl_env_setup$

    BEGIN

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### #### #### #### ####

        CREATE SCHEMA IF NOT EXISTS marketing;

        -- #### #### #### #### #### #### #### #### 

        CREATE SCHEMA IF NOT EXISTS vdm1_etl;

        -- #### #### #### #### #### #### #### #### #### #### #### ####

        DROP SCHEMA IF EXISTS staging
            CASCADE;

        -- #### #### #### #### #### #### #### #### 

        CREATE SCHEMA IF NOT EXISTS staging;

        -- #### #### #### #### #### #### #### #### #### #### #### ####

        DROP SCHEMA IF EXISTS vdm1_data
            CASCADE;

        -- #### #### #### #### #### #### #### #### 

        CREATE SCHEMA IF NOT EXISTS vdm1_data;

        -- #### #### #### #### #### #### #### #### #### #### #### ####

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        END;
$vdm1_stage0_etl_env_setup$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #TODO STAGE 0 - END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 0 END     #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 1 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 1 BEGIN

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--     #### #### #### ####
--         STAGE 1 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                   1. vdm1_etl.vdm1_stage1();

--             FUNCTIONS

--                   1. vdm1_etl.f_vdm1_stage1_extractimport(tablename VARCHAR(30));
--                   2. vdm1_etl.f_vdm1_stage1_data_validation_count_check(p_schema_one varchar, p_table_one varchar, p_schmea_two varchar, p_table_two varchar);
--                   3. vdm1_data.f_vdm1_calc_expected_return_date(p_film_id INT, p_rental_date DATE)
--                   4. vdm1_data.f_vdm1_transform_customer_full_name(p_first_name VARCHAR, p_last_name VARCHAR)
--                   5. vdm1_data.f_vdm1_transform_filmlength_int2vchar(p_length INTEGER)
--                   6. vdm1_data.f_vdm1_transform_customer_phone_e164(p_phone VARCHAR)

--     #### #### #### ####
--         STAGE 1 END
--     #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 1 - STORED PROCEDURES

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage1()
	LANGUAGE plpgsql
	AS $vdm1_stage1_run$

    BEGIN 

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### #### #### #### ####
        
        -- RUN CUSTOMER STATUS AMEND PROCEDURE BEFORE IMPORTING
        -- This modifies the production database not the staging database. 
        -- This has to be ran before ETL to correct the issue before Extract occurs. 
        -- Secondary copy has been created in staging that runs at the beginning of Stage 2. 
        -- CALL public.customer_status_amend();

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
        
        -- IMPORT CUSTOMER TABLE
        PERFORM vdm1_etl.f_vdm1_stage1_extractimport('customer');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage1_data_validation_count_check('public', 'customer', 'staging', 'vdm1_stage1_customer');

        -- #### #### #### #### 
        
        -- IMPORT ADDRESSS TABLE
        PERFORM vdm1_etl.f_vdm1_stage1_extractimport('address');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage1_data_validation_count_check('public', 'address', 'staging', 'vdm1_stage1_address');

        -- #### #### #### #### 

        -- IMPORT CITY TABLE
        PERFORM vdm1_etl.f_vdm1_stage1_extractimport('city');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage1_data_validation_count_check('public', 'city', 'staging', 'vdm1_stage1_city');

        -- #### #### #### #### 

        -- IMPORT COUNTRY TABLE
        PERFORM vdm1_etl.f_vdm1_stage1_extractimport('country');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage1_data_validation_count_check('public', 'country', 'staging', 'vdm1_stage1_country');

        -- #### #### #### #### 

        -- IMPORT STORE TABLE
        PERFORM vdm1_etl.f_vdm1_stage1_extractimport('store');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage1_data_validation_count_check('public', 'store', 'staging', 'vdm1_stage1_store');

        -- #### #### #### #### #### #### #### #### 

        -- IMPORT FILM TABLE
        PERFORM vdm1_etl.f_vdm1_stage1_extractimport('film');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage1_data_validation_count_check('public', 'film', 'staging', 'vdm1_stage1_film');
        
        -- #### #### #### #### 
        
        -- IMPORT FILM_CATEORY TABLE
        PERFORM vdm1_etl.f_vdm1_stage1_extractimport('film_category');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage1_data_validation_count_check('public', 'film_category', 'staging', 'vdm1_stage1_film_category');

        -- #### #### #### #### 

        -- IMPORT CATGEORY TABLE
        PERFORM vdm1_etl.f_vdm1_stage1_extractimport('category');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage1_data_validation_count_check('public', 'category', 'staging', 'vdm1_stage1_category');

        -- #### #### #### #### #### #### #### #### 
        
        -- IMPORT RENTAL TABLE 
        PERFORM vdm1_etl.f_vdm1_stage1_extractimport('rental');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage1_data_validation_count_check('public', 'rental', 'staging', 'vdm1_stage1_rental');

        -- #### #### #### #### 

        -- IMPORT INVENTORY TABLE
        PERFORM vdm1_etl.f_vdm1_stage1_extractimport('inventory');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage1_data_validation_count_check('public', 'inventory', 'staging', 'vdm1_stage1_inventory');

        -- #### #### #### #### 

        -- IMPORT LANGUAGE TABLE 
        PERFORM vdm1_etl.f_vdm1_stage1_extractimport('language');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage1_data_validation_count_check('public', 'language', 'staging', 'vdm1_stage1_language');

        -- #### #### #### #### #### #### #### #### #### #### #### ####

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

		RAISE NOTICE 'RUNNING: VDM1_ETL.F_CALC_EXPECTED_RETURN_DATE_CONTAINER';
		PERFORM vdm1_etl.f_calc_expected_return_date_container();

		RAISE NOTICE 'RUNNING: VDM1_ETL.F_TRANSFORM_CUSTOMER_FULL_NAME_CONTAINER';
		PERFORM vdm1_etl.f_transform_customer_full_name_container();

		RAISE NOTICE 'RUNNING: VDM1_ETL.F_TRANSFORM_FILMLENGTH_INT2VCHAR_CONTAINER';
		PERFORM vdm1_etl.f_transform_filmlength_int2vchar_container();

		RAISE NOTICE 'RUNNING: VDM1_ETL.F_TRANSFORM_CUSTOMER_PHONE_E164_CONTAINER';
		PERFORM vdm1_etl.f_transform_customer_phone_e164_container();


        -- #### #### #### #### #### #### #### #### #### #### #### ####

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage1_run$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--           1. vdm1_etl.f_vdm1_stage1_extractimport(tablename VARCHAR(30));
--           2. vdm1_etl.f_vdm1_stage1_data_validation_count_check(p_schema_one varchar, p_table_one varchar, p_schmea_two varchar, p_table_two varchar);
--           3. vdm1_data.f_vdm1_calc_expected_return_date(p_film_id INT, p_rental_date DATE)
--           4. vdm1_data.f_vdm1_transform_customer_full_name(p_first_name VARCHAR, p_last_name VARCHAR)
--           5. vdm1_data.f_vdm1_transform_filmlength_int2vchar(p_length INTEGER)
--           6. vdm1_data.f_vdm1_transform_customer_phone_e164(p_phone VARCHAR)


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ###
-- #TODO STAGE 1 - FUNCTIONS

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage1_extractimport(tablename VARCHAR(30)) 
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage1extract$
		
	BEGIN

		RAISE NOTICE 'RUNNING: F_VDM1_STAGE1_EXTRACTIMPORT - TABLE: %', tablename;
		
		EXECUTE
			'CREATE UNLOGGED TABLE IF NOT EXISTS staging.vdm1_stage1_' || tablename || ' AS 
				SELECT * FROM public.' || tablename;
	
	END;
$vdm1_stage1extract$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage1_data_validation_count_check(
      p_schema_one varchar
    , p_table_one varchar
    , p_schmea_two varchar
    , p_table_two varchar
)
    RETURNS BOOLEAN
    LANGUAGE plpgsql
    AS $vdm1_stage1_data_validation_source_count_matches_destination_count$

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


$vdm1_stage1_data_validation_source_count_matches_destination_count$;


-- REFERENCE LINKS
-- https://www.geeksforgeeks.org/postgresql-if-statement/
-- https://www.postgresql.org/docs/current/plpgsql-errors-and-messages.html
-- https://www.enterprisedb.com/postgres-tutorials/how-raise-errors-and-report-messages-within-stored-procedures-and-functions


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_calc_expected_return_date_container()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_data_f_calc_expected_return_date_container$

	BEGIN

	EXECUTE
	'
		CREATE OR REPLACE FUNCTION vdm1_data.f_calc_expected_return_date(
				p_film_id INT,
				p_rental_date DATE)
			RETURNS DATE
			LANGUAGE plpgsql
			AS $vdm1_f_calc_expected_return_date$
			
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
					public.film as A
				WHERE 
					vi_film_id = a.film_id;

				vo_expected_return_date := vi_rental_date + vlu_rental_duration;

				RETURN vo_expected_return_date;
			END;
		$vdm1_f_calc_expected_return_date$;
	';
	END;
$vdm1_data_f_calc_expected_return_date_container$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_transform_customer_full_name_container()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_data_f_transform_customer_full_name_container$

	BEGIN
	
	EXECUTE
	'
		CREATE OR REPLACE FUNCTION vdm1_data.f_transform_customer_full_name(
				p_first_name VARCHAR,
				p_last_name VARCHAR)
			RETURNS VARCHAR
			LANGUAGE plpgsql
			AS $vdm1_f_transform_customer_full_name$
			
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
				
				-- bicapitalization_list := array[''mc'', ''le'', ''la'', ''o'''''', ''da'', ''de'' ];
				bicapitalization_list_2l := array[''mc'', ''o''];
				bicapitalization_list_3l := array[''mac''];
				bicapitalization_list_4l := array[''von '', ''fitz''];

				
				CASE 
						
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
						'' '',
						vi_first_name, 
						vi_last_name)
				INTO vo_full_name;

				RETURN vo_full_name;
			END;
		$vdm1_f_transform_customer_full_name$;
	';
	END;
$vdm1_data_f_transform_customer_full_name_container$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_transform_filmlength_int2vchar_container()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_data_f_transform_filmlength_int2vchar_container$

	BEGIN
	
	EXECUTE
	'
		CREATE OR REPLACE FUNCTION vdm1_data.f_transform_filmlength_int2vchar(
			p_length INTEGER
		)
			RETURNS VARCHAR
			LANGUAGE plpgsql
			AS $vdm1_f_transform_filmlength_int2vchar$
			
			DECLARE
				-- IN Variable
				vi_len_int INTEGER;
				-- OUT Variable
				vo_len_varchar VARCHAR;
			
			BEGIN 
				-- Clearing the variables
				vo_len_varchar := '''';
				vi_len_int := 0;
				-- Setting the variable to input integer
				vi_len_int := $1;
				
				-- Mathing
				CASE
					WHEN ((vi_len_int / 60 > 0) AND (vi_len_int % 60) = 0) THEN 
						vo_len_varchar := (
							(vi_len_int / 60) || '' hrs''
						);
					WHEN (vi_len_int / 60 > 0) THEN 
						vo_len_varchar := (
							(vi_len_int / 60) || '' hrs '' || (vi_len_int % 60) || '' min''
						);
					ELSE
						vo_len_varchar := (
							(vi_len_int % 60) || '' min''
						);
				END CASE;
					
				RETURN vo_len_varchar;
			
			END;
		$vdm1_f_transform_filmlength_int2vchar$;
	';
	END;
$vdm1_data_f_transform_filmlength_int2vchar_container$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_transform_customer_phone_e164_container()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_data_f_transform_customer_phone_e164_container$

	BEGIN
	
	EXECUTE
	'

		CREATE OR REPLACE FUNCTION vdm1_data.f_transform_customer_phone_e164(
				p_phone VARCHAR)
			RETURNS VARCHAR
			LANGUAGE plpgsql
			AS $vdm1_f_transform_customer_phone_e164$
			
			DECLARE
				
				vi_phone VARCHAR;
				
				vo_phone VARCHAR;

			BEGIN 

				vi_phone := $1;

		SELECT
			CONCAT_WS(
				'' ''
				, ''+''
				, LEFT(vi_phone, (LENGTH(vi_phone)-10))
				, SUBSTRING(vi_phone, (LENGTH(vi_phone)-10)+1, 2)
				, SUBSTRING(vi_phone, ((LENGTH(vi_phone)-8)+1), 4)
				, RIGHT(vi_phone,4)
			)
			INTO
				vo_phone;

			RETURN vo_phone;


			END;
		$vdm1_f_transform_customer_phone_e164$;
	';
	END;
$vdm1_data_f_transform_customer_phone_e164_container$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #TODO STAGE 1 END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 1 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 2 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 2 BEGIN
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--     #### #### #### ####
--         STAGE 2 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                   1. vdm1_etl.vdm1_stage2();

--             FUNCTIONS

--                   1. vdm1_etl.f_vdm1_stage2_customer_status_amend();
--                   2. vdm1_etl.f_vdm1_stage2_films()
--                   3. vdm1_etl.f_vdm1_stage2_film_inventory()
--                   4. vdm1_etl.f_vdm1_stage2_rentals()
--                   5. vdm1_etl.f_vdm1_stage2_locationdetails()
--                   6. vdm1_etl.f_vdm1_stage2_stores()
--                   7. vdm1_etl.f_vdm1_stage2_customers()
--                   8. vdm1_etl.f_vdm1_stage2_customer_category()
--                   9. vdm1_etl.f_vdm1_stage2_film_category()
--                  10. vdm1_etl.f_vdm1_stage2_customer_film_category();
--                  11. vdm1_etl.f_vdm1_stage2_cleanup()

--     #### #### #### ####
--         STAGE 2 END
--     #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO STAGE 2 - STORED PROCEDURES

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage2()
	LANGUAGE plpgsql
	AS $vdm1_stage2run$
	
	BEGIN

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### #### #### #### ####
        

        -- RUN CUSTOMER STATUS AMEND PROCEDURE FIRST
        -- CALL staging.f_customer_status_amend();

        -- RUN CUSTOMER STATUS AMEND FUNCTION ON STAGE1_CUSTOMER Table to amend the activebool column
        EXECUTE vdm1_etl.f_vdm1_stage2_customer_status_amend();

        -- #### #### #### #### 
	
        -- Inner Join Tables

		EXECUTE vdm1_etl.f_vdm1_stage2_films();
		
		EXECUTE vdm1_etl.f_vdm1_stage2_film_inventory();
		
		EXECUTE vdm1_etl.f_vdm1_stage2_rentals();
		
		EXECUTE vdm1_etl.f_vdm1_stage2_locationdetails();
		
		EXECUTE vdm1_etl.f_vdm1_stage2_stores();
		
		EXECUTE vdm1_etl.f_vdm1_stage2_customers();

        -- #### #### #### #### 

        -- Cross Join Tables

		EXECUTE vdm1_etl.f_vdm1_stage2_customer_category();
		
		EXECUTE vdm1_etl.f_vdm1_stage2_film_category();

        EXECUTE vdm1_etl.f_vdm1_stage2_customer_film_category();
		
        -- #### #### #### #### 
        
		EXECUTE vdm1_etl.f_vdm1_stage2_cleanup();
	
        -- #### #### #### #### #### #### #### #### #### #### #### ####
        
	    -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

	END;
$vdm1_stage2run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO STAGE 2 - FUNCTIONS 

-- TABLE OF CONTENTS

--           1. vdm1_etl.f_vdm1_stage2_customer_status_amend()
--           2. vdm1_etl.f_vdm1_stage2_films()
--           3. vdm1_etl.f_vdm1_stage2_film_inventory()
--           4. vdm1_etl.f_vdm1_stage2_rentals()
--           5. vdm1_etl.f_vdm1_stage2_locationdetails()
--           6. vdm1_etl.f_vdm1_stage2_stores()
--           7. vdm1_etl.f_vdm1_stage2_customers()
--           8. vdm1_etl.f_vdm1_stage2_customer_category()
--           9. vdm1_etl.f_vdm1_stage2_film_category()
--          10. vdm1_etl.f_vdm1_stage2_customer_film_category()
--          11. vdm1_etl.f_vdm1_stage2_cleanup()


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage2_customer_status_amend()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2_cxstatamend$
	
	BEGIN
	
	UPDATE staging.vdm1_stage1_customer
	
	SET 
		activebool = FALSE
	
	FROM (
		SELECT
			customer_id
		FROM staging.vdm1_stage1_customer
	) AS a
	
	WHERE 
		(active = 0 AND activebool = true)
			OR
		(active = 1 AND activebool = false);
	
	END;
$vdm1_stage2_cxstatamend$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage2_films()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2_create_table_films$
	
	BEGIN 
		
		CREATE TABLE staging.vdm1_stage2_films AS (
			SELECT
				  a.film_id
				, a.title
				, b.category_id
				, a.release_year
				, a.language_id
				, a.length
				, a.rating
				, a.description
				, a.rental_duration
				, a.rental_rate
				, a.replacement_cost
			FROM staging.vdm1_stage1_film a
				INNER JOIN staging.vdm1_stage1_film_category b
					ON b.film_id = a.film_id
		);
	END;
$vdm1_stage2_create_table_films$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage2_film_inventory()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2_create_table_film_inventory$
	
	BEGIN 
	
		CREATE TABLE staging.vdm1_stage2_film_inventory AS (
	
            SELECT 
                  a.film_id
                , b.inventory_id

            FROM staging.vdm1_stage1_film AS a
                INNER JOIN staging.vdm1_stage1_inventory AS b
                    ON b.film_id = a.film_id
	    );
	
	END;
$vdm1_stage2_create_table_film_inventory$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage2_rentals()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2_create_table_rentals$
		
	BEGIN 

		CREATE TABLE staging.vdm1_stage2_rentals AS (

			SELECT
				  a.rental_id
				, a.customer_id
				, a.inventory_id
				, b.film_id
				, c.category_id
				, a.rental_date
				, a.return_date
			FROM staging.vdm1_stage1_rental a
				INNER JOIN staging.vdm1_stage1_inventory b
					ON b.inventory_id = a.inventory_id
				INNER JOIN staging.vdm1_stage2_films c
					ON c.film_id = b.film_id
		);
		
	END;
$vdm1_stage2_create_table_rentals$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage2_locationdetails()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2_create_table_location_details$
		
	BEGIN 
	
	CREATE TABLE staging.vdm1_stage2_locationdetails AS (
	
		SELECT 
			  a.address_id
			, a.address
			, a.address2
			, a.district
			, b.city_id
			, c.country_id
			, a.postal_code
			, a.phone
		FROM staging.vdm1_stage1_address a
			INNER JOIN staging.vdm1_stage1_city b
				ON b.city_id = a.city_id
			INNER JOIN staging.vdm1_stage1_country c
				ON c.country_id = b.country_id
	
	);

END;
$vdm1_stage2_create_table_location_details$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage2_stores()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2_create_table_store_details$
		
	BEGIN 

		CREATE TABLE staging.vdm1_stage2_stores AS (

			SELECT
				  a.store_id
				, b.phone
				, b.address
				, b.address2
				, b.district
				, b.city_id
				, b.country_id
				, b.postal_code
			FROM staging.vdm1_stage1_store a 
				INNER JOIN staging.vdm1_stage2_locationdetails b
					ON b.address_id = a.address_id

		);
		
	END;
$vdm1_stage2_create_table_store_details$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage2_customers()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2_create_table_customer_details$
	
	BEGIN 
	
	CREATE TABLE staging.vdm1_stage2_customers AS (

		SELECT 
			  a.customer_id
			, a.store_id
			, a.first_name
			, a.last_name
			, a.email
			, a.create_date
			, a.activebool
			, b.phone
			, b.city_id
			, b.country_id
		FROM staging.vdm1_stage1_customer a 
			INNER JOIN staging.vdm1_stage2_locationdetails b
				ON b.address_id = a.address_id

		ORDER BY
			a.customer_id
	);
	
	END;
$vdm1_stage2_create_table_customer_details$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage2_customer_category()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2_create_table_customer_category$
	
	BEGIN 
	
		CREATE TABLE staging.vdm1_stage2_customer_category AS (
	
		SELECT 
			  a.customer_id
			, b.category_id
		FROM staging.vdm1_stage2_customers a
			CROSS JOIN staging.vdm1_stage1_category b

	);
	
	END;
$vdm1_stage2_create_table_customer_category$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage2_film_category()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2_create_table_film_category$
	
	BEGIN 
	
	CREATE TABLE staging.vdm1_stage2_film_category AS (
		SELECT 
			  film_id
			, category_id
		FROM staging.vdm1_stage2_films

		ORDER BY
			film_id, category_id
	);
	
	END;
$vdm1_stage2_create_table_film_category$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage2_customer_film_category()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage2_create_table_customer_film_category$

    BEGIN

    CREATE TABLE staging.vdm1_stage2_customer_film_category AS (

        SELECT 
              customer_id
            , film_id 
            , category_id 
        FROM staging.vdm1_stage2_customers
            CROSS JOIN staging.vdm1_stage2_film_category
    
        ORDER BY
            customer_id, film_id

    );

    END;

$vdm1_stage2_create_table_customer_film_category$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage2_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2_cleanup$

	BEGIN	
	
		-- #### #### #### #### #### #### #### #### #### #### #### #### 

		DROP TABLE IF EXISTS staging.vdm1_stage1_address;
		
		DROP TABLE IF EXISTS staging.vdm1_stage1_customer;
		
		DROP TABLE IF EXISTS staging.vdm1_stage1_film;

		DROP TABLE IF EXISTS staging.vdm1_stage1_film_category;
		
		DROP TABLE IF EXISTS staging.vdm1_stage1_inventory;
		
		DROP TABLE IF EXISTS staging.vdm1_stage1_rental;
		
		DROP TABLE IF EXISTS staging.vdm1_stage1_store;
		
		-- #### #### #### #### 
		
		DROP TABLE IF EXISTS staging.vdm1_stage2_locationdetails;

		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage2_customers
			RENAME TO vdm1_stage3_customers;

		ALTER TABLE IF EXISTS staging.vdm1_stage2_stores
			RENAME TO vdm1_stage3_stores;

		ALTER TABLE IF EXISTS staging.vdm1_stage2_films
			RENAME TO vdm1_stage3_films;
			
		ALTER TABLE IF EXISTS staging.vdm1_stage2_rentals
			RENAME TO vdm1_stage3_rentals;

        -- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage2_film_inventory
			RENAME TO vdm1_stage3_film_inventory;

		ALTER TABLE IF EXISTS staging.vdm1_stage2_film_category
			RENAME TO vdm1_stage3_film_category;

		ALTER TABLE IF EXISTS staging.vdm1_stage2_customer_category
			RENAME TO vdm1_stage3_customer_category;

        ALTER TABLE IF EXISTS staging.vdm1_stage2_customer_film_category
            RENAME TO vdm1_stage3_customer_film_category;

		-- #### #### #### #### #### #### #### #### 
		
			
		ALTER TABLE IF EXISTS  staging.vdm1_stage1_city
			RENAME TO vdm1_stage3_dictkey_city;
			
		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS  staging.vdm1_stage1_country
			RENAME TO vdm1_stage3_dictkey_country;
		
		-- #### #### #### #### 

		
		ALTER TABLE IF EXISTS  staging.vdm1_stage1_language
			RENAME TO vdm1_stage3_dictkey_language;

		-- #### #### #### #### 

		
        ALTER TABLE IF EXISTS  staging.vdm1_stage1_category
			RENAME TO vdm1_stage3_dictkey_category;

		-- #### #### #### #### #### #### #### #### 
	
	
	END;
$vdm1_stage2_cleanup$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #TODO STAGE 2 END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 2 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- MASTER CODE BLOCK - STAGE 3

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 3 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 3 BEGIN

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--     #### #### #### ####
--         STAGE 3 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                   1. vdm1_etl.vdm1_stage3();


--             FUNCTIONS

--                   1. vdm1_etl.f_vdm1_stage3_create_table_new_releases()
--                   2. vdm1_etl.f_vdm1_stage3_create_table_failed_returns()
--                   3. vdm1_etl.f_vdm1_stage3_create_table_category_count_init()
--                   4. vdm1_etl.f_vdm1_stage3_create_table_customer_watch_history_details()
--                   5. vdm1_etl.f_vdm1_stage3_create_table_cx_reclist_master_nonspecific()
--                   6. vdm1_etl.f_vdm1_stage3_create_table_cx_reclist_master_specific()
--                   7. vdm1_etl.f_vdm1_stage3_create_table_customer_rec_custom_preferences()
--                   8. vdm1_etl.f_vdm1_stage3_table_changes()
--                   9. vdm1_etl.f_vdm1_stage3_cleanup()


--     #### #### #### ####
--         STAGE 3 END
--     #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO STAGE 3 - STORED PROCEDURES 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage3()
	LANGUAGE plpgsql
	AS $vdm1_stage3_run$
	
	BEGIN 
	
		PERFORM vdm1_etl.f_vdm1_stage3_create_table_new_releases();
		
		PERFORM vdm1_etl.f_vdm1_stage3_create_table_failed_returns();


		-- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage3_create_table_category_count_init();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage3_create_table_customer_watch_history_details();
		
        PERFORM vdm1_etl.f_vdm1_stage3_create_table_cx_reclist_master_nonspecific();

		PERFORM vdm1_etl.f_vdm1_stage3_create_table_cx_reclist_master_specific();

        PERFORM vdm1_etl.f_vdm1_stage3_create_table_customer_rec_custom_preferences();

		-- #### #### #### #### 
		
		PERFORM vdm1_etl.f_vdm1_stage3_table_changes();
		
		PERFORM vdm1_etl.f_vdm1_stage3_cleanup();
		
	END;
$vdm1_stage3_run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO STAGE 3 - FUNCTIONS 

-- TABLE OF CONTENTS

--           1. vdm1_etl.f_vdm1_stage3_create_table_new_releases()
--           2. vdm1_etl.f_vdm1_stage3_create_table_failed_returns()
--           3. vdm1_etl.f_vdm1_stage3_create_table_category_count_init()
--           4. vdm1_etl.f_vdm1_stage3_create_table_customer_watch_history_details()
--           5. vdm1_etl.f_vdm1_stage3_create_table_cx_reclist_master_nonspecific()
--           6. vdm1_etl.f_vdm1_stage3_create_table_cx_reclist_master_specific()
--           7. vdm1_etl.f_vdm1_stage3_create_table_customer_rec_custom_preferences()
--           8. vdm1_etl.f_vdm1_stage3_table_changes()
--           9. vdm1_etl.f_vdm1_stage3_cleanup()


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage3_create_table_new_releases()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_new_releases$
	
	BEGIN 
	
		CREATE TABLE staging.vdm1_stage3_new_releases(

			  film_id INTEGER NOT NULL
			, status BOOLEAN NOT NULL DEFAULT TRUE
			, created_date DATE NOT NULL DEFAULT CURRENT_DATE
		
        );
	
	END;
$vdm1_stage3_create_table_new_releases$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage3_create_table_failed_returns()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_failed_returns$
	
	BEGIN 
	
        CREATE TABLE staging.vdm1_stage3_failed_returns(

              customer_id INTEGER NOT NULL
            , rental_id INTEGER NOT NULL
            , film_id INTEGER NOT NULL
            , inventory_id INTEGER NOT NULL
            , store_id INTEGER NOT NULL
            , rental_date DATE NOT NULL
            , expected_return_date DATE NOT NULL
            , age INTERVAL NOT NULL
        );
	END;
$vdm1_stage3_create_table_failed_returns$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage3_create_table_category_count_init()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_category_count_init$
	
	BEGIN 

        CREATE UNLOGGED TABLE IF NOT EXISTS staging.vdm1_stage3_category_count_init AS 
            SELECT * FROM staging.vdm1_stage3_dictkey_category;

    END;

$vdm1_stage3_create_table_category_count_init$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage3_create_table_customer_watch_history_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_cxwatchhistory_details$
	
	BEGIN 
	
        CREATE TABLE staging.vdm1_stage3_customer_watch_history_details AS (

            SELECT 
                  a.customer_id
                , a.rental_id
                , a.inventory_id
                , a.film_id
                , a.category_id
                
                , a.rental_date
                , a.return_date

            FROM staging.vdm1_stage3_rentals AS a
                INNER JOIN staging.vdm1_stage3_customers AS b
                    ON b.customer_id = a.customer_id
            
            GROUP BY
                a.customer_id, b.city_id, b.country_id, a.rental_id, a.inventory_id, a.film_id, a.category_id, a.rental_date, a.return_date
            ORDER BY 
                a.customer_id

        );

	
	END;
$vdm1_stage3_create_table_cxwatchhistory_details$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage3_create_table_cx_reclist_master_nonspecific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_customer_reclist_master_nonspecific$
	
	BEGIN 
	
        CREATE TABLE staging.vdm1_stage3_customer_reclist_master_nonspecific (

                  customer_id INTEGER NOT NULL 
                --, film_rank INTEGER NULL
                , category_id INTEGER NOT NULL
                , film_rec_order INTEGER NULL
                , film_id INTEGER NOT NULL
                --, film_category_rank INTEGER NOT NULL		
                --, total_rentals INTEGER NOT NULL
        );
	END;
$vdm1_stage3_create_table_customer_reclist_master_nonspecific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage3_create_table_cx_reclist_master_specific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_customer_reclist_master_specific$
	
	BEGIN 
	
        CREATE TABLE staging.vdm1_stage3_customer_reclist_master_specific (

                  customer_id INTEGER NOT NULL 
                , cat_rec_order INTEGER NULL
                , category_id INTEGER NOT NULL
                , rental_rec_order INTEGER NULL
                , film_id INTEGER NOT NULL
                --, film_category_rank INTEGER NOT NULL		
                --, total_rentals INTEGER NOT NULL
        );
	END;
$vdm1_stage3_create_table_customer_reclist_master_specific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 



CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage3_create_table_customer_rec_custom_preferences()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_customer_rec_custom_preferences$
	
	BEGIN 

        CREATE TABLE staging.vdm1_stage3_customer_rec_custom_preferences (

              customer_id INT DEFAULT NULL
            , category_id INT DEFAULT NULL
            , customer_rec_custom_order INT NULL
            , customer_rec_custom_amount INT NULL

        );

    END;
$vdm1_stage3_create_table_customer_rec_custom_preferences$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage3_table_changes()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_table_changes$
	
	BEGIN

		-- #### #### #### #### 

        ALTER TABLE IF EXISTS staging.vdm1_stage3_dictkey_city
			DROP COLUMN IF EXISTS country_id,
			DROP COLUMN IF EXISTS last_update;

        ALTER TABLE IF EXISTS staging.vdm1_stage3_dictkey_country
			DROP COLUMN IF EXISTS last_update;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_dictkey_category
			DROP COLUMN IF EXISTS last_update;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_dictkey_language
			DROP COLUMN IF EXISTS last_update;
		
        
        -- #### #### #### #### #### #### #### #### 
        
        ALTER TABLE IF EXISTS staging.vdm1_stage3_film_category
			ADD COLUMN total_rentals INTEGER NOT NULL DEFAULT 0,
			ADD COLUMN film_rank INTEGER DEFAULT NULL,
			ADD COLUMN film_category_rank INTEGER DEFAULT NULL,
            ADD COLUMN new_release BOOLEAN DEFAULT FALSE;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_films
			ADD COLUMN new_release BOOLEAN NOT NULL DEFAULT FALSE, 
			ALTER COLUMN length TYPE VARCHAR(20);
						
		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_rentals
			ALTER COLUMN rental_date
				SET DATA TYPE DATE USING rental_date::date;


		ALTER TABLE IF EXISTS staging.vdm1_stage3_rentals
			ALTER COLUMN return_date
				SET DATA TYPE DATE USING return_date::date;

		-- #### #### #### #### 


		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_watch_history_details
			ALTER COLUMN rental_date
				SET DATA TYPE DATE USING rental_date::date;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_watch_history_details
			ALTER COLUMN return_date
				SET DATA TYPE DATE USING return_date::date;

        ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_watch_history_details
			ADD COLUMN customer_watch_history_desc_order INTEGER NULL;

		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_film_inventory
			ADD COLUMN life_cycle INTEGER NOT NULL DEFAULT 0,
			ADD COLUMN new_release BOOLEAN NOT NULL DEFAULT FALSE,
			ADD COLUMN inspect_flag BOOLEAN NOT NULL DEFAULT FALSE,
			ADD COLUMN maintenance_complete_flag BOOLEAN NOT NULL DEFAULT FALSE;


        -- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_category
			ADD COLUMN historical_rental_count INTEGER DEFAULT NULL,
            ADD COLUMN recommendation_order_historical INTEGER DEFAULT NULL,
  			ADD COLUMN average_rental_count INTEGER DEFAULT NULL,
            ADD COLUMN recommendation_order_average INTEGER DEFAULT NULL,
            ADD COLUMN halfaverage_rental_count INTEGER DEFAULT NULL,
            ADD COLUMN recommendation_order_halfaverage INTEGER DEFAULT NULL,
            ADD COLUMN recommendation_order_customer_preference INTEGER DEFAULT NULL;

		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_category_count_init
		    DROP COLUMN IF EXISTS last_update,
            ADD COLUMN total_rentals INTEGER DEFAULT 0;

		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_customers
			ADD COLUMN customer_full_name VARCHAR,
			ALTER COLUMN phone TYPE VARCHAR(40);



		-- #### #### #### #### #### #### #### #### 
			
	END;
$vdm1_stage3_table_changes$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage3_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3cleanup$
	
	BEGIN
		
        
		
		ALTER TABLE IF EXISTS staging.vdm1_stage3_customers
			RENAME TO vdm1_stage4_customers;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_stores
			RENAME TO vdm1_stage4_stores;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_films
			RENAME TO vdm1_stage4_films;
			
		ALTER TABLE IF EXISTS staging.vdm1_stage3_rentals
			RENAME TO vdm1_stage4_rentals;


        -- #### #### #### #### #### #### #### #### 


		ALTER TABLE IF EXISTS staging.vdm1_stage3_film_inventory
			RENAME TO vdm1_stage4_film_inventory;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_film_category
			RENAME TO vdm1_stage4_film_category_popularity;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_category
			RENAME TO vdm1_stage4_customer_category;

        ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_film_category
			RENAME TO vdm1_stage4_customer_film_category;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_failed_returns
			RENAME TO vdm1_stage4_failed_returns;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_new_releases
			RENAME TO vdm1_stage4_new_releases;
		
		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_reclist_master_nonspecific
			RENAME TO vdm1_stage4_customer_reclist_master_nonspecific;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_reclist_master_specific
			RENAME TO vdm1_stage4_customer_reclist_master_specific;

        ALTER TABLE IF EXISTS staging.vdm1_stage3_category_count_init
            RENAME TO vdm1_stage4_category_popularity_count;

        ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_rec_custom_preferences
            RENAME TO vdm1_stage4_customer_rec_custom_preferences;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_watch_history_details
			RENAME TO vdm1_stage4_customer_watch_history_details;

		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_dictkey_category
		    RENAME TO vdm1_stage4_dictkey_category;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_dictkey_city
			RENAME TO vdm1_stage4_dictkey_city;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_dictkey_country
			RENAME TO vdm1_stage4_dictkey_country;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_dictkey_language
			RENAME TO vdm1_stage4_dictkey_language;

		-- #### #### #### #### #### #### #### #### 

	END;
$vdm1_stage3cleanup$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #TODO STAGE 3 END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 3 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 4 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 4 BEGIN


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--     #### #### #### ####
--         STAGE 4 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                   1. vdm1_etl.vdm1_stage4();
--                   2. vdm1_etl.vdm1_stage4a();
--                   3. vdm1_etl.vdm1_stage4b();
--                   4. vdm1_etl.vdm1_stage4c();
--                   5. vdm1_etl.vdm1_stage4c1();
--                   6. vdm1_etl.vdm1_stage4c1a();
--                   7. vdm1_etl.vdm1_stage4c1b();
--                   8. vdm1_etl.vdm1_stage4c2();
--                   9. vdm1_etl.vdm1_stage4c2a();
--                  10. vdm1_etl.vdm1_stage4c2b();
--                  11. vdm1_etl.vdm1_stage4c3();

--             FUNCTIONS

--                   1. vdm1_etl.f_vdm1_stage4_transform_customer_full_name();
--                   2. vdm1_etl.f_vdm1_stage4_transform_customer_phone_number();
--                   3. vdm1_etl.f_vdm1_stage4_transform_film_length();
--                   4. vdm1_etl.f_vdm1_stage4_calc_update_category_popularity_count()
--                   5. vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_count()
--                   6. vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_row_number()
--                   7. vdm1_etl.f_vdm1_stage4_calc_update_film_category_popularity_row_number()
--                   8. vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_count()
--                   9. vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
--                  10. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_count_null_corrections()
--                  11. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_historical_count()
--                  12. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_average_count()
--                  13. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_halfaverage_count()
--                  14. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_historical()
--                  15. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_average()
--                  16. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage()
--                  17. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default()
--                  18. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order()
--                  19. vdm1_etl.f_vdm1_stage4_calc_update_customer_watch_history_row_number()
--                  20. vdm1_etl.f_vdm1_stage4_calc_insert_failed_returns_v2()
--                  21. vdm1_etl.f_vdm1_stage4_calc_insert_new_releases_v2()
--                  22. vdm1_etl.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat
--                  23. vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific()
--                  24. vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn()
--                  25. vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();
--                  26. vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();
--                  27. vdm1_etl.f_vdm1_stage4_cleanup()

--     #### #### #### ####
--         STAGE 4 END
--     #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO STAGE 4 - STORED PROCEDURES

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####  4 Main   #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4()
	LANGUAGE plpgsql
	AS $vdm1_stage4run$
	
	BEGIN 
	
        -- #### #### #### #### #### #### #### ####    

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_customer_watch_history_row_number();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_category_popularity_count();

        -- #### #### #### #### 
        
        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_count();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_count();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_count_null_corrections();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_historical_count();

    	PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_average_count();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_halfaverage_count();


        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_flag_inspection();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_failed_returns_v2();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_new_releases_v2();

		-- PERFORM vdm1_etl.f_vdm1_stage4_create_transform_function();

		PERFORM vdm1_etl.f_vdm1_stage4_transform_customer_full_name();

		PERFORM vdm1_etl.f_vdm1_stage4_transform_customer_phone_number();

		PERFORM vdm1_etl.f_vdm1_stage4_transform_film_length();

        -- #### #### #### #### #### #### #### ####    

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_historical();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_average();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order();


        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_row_number();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_category_popularity_row_number();

        -- #### #### #### #### #### #### #### ####    

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_cleanup();

        -- #### #### #### #### #### #### #### ####    
	END;
$vdm1_stage4run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4a    #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4a()
	LANGUAGE plpgsql
	AS $vdm1_stage4a_run$

	
	BEGIN 
	
        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_customer_watch_history_row_number();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_category_popularity_count();

        -- #### #### #### #### 
        
        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_count();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_count();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_count_null_corrections();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_historical_count();

    	PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_average_count();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_halfaverage_count();


        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_flag_inspection();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_failed_returns_v2();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_new_releases_v2();

		-- PERFORM vdm1_etl.f_vdm1_stage4_create_transform_function();

		PERFORM vdm1_etl.f_vdm1_stage4_transform_customer_full_name();

		PERFORM vdm1_etl.f_vdm1_stage4_transform_customer_phone_number();

		PERFORM vdm1_etl.f_vdm1_stage4_transform_film_length();
        

	END;
$vdm1_stage4a_run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4b    #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4b()
	LANGUAGE plpgsql
	AS $vdm1_stage4b_run$

	
	BEGIN 

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_historical();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_average();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order();

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_row_number();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_category_popularity_row_number();

        -- #### #### #### #### #### #### #### #### 


    END;
$vdm1_stage4b_run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4c    #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c()
	LANGUAGE plpgsql
	AS $vdm1_stage4c_run$

	
	BEGIN 
        
        --- #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_cleanup();

        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage4c_run$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    4c1    #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c1()
	LANGUAGE plpgsql
	AS $vdm1_stage4c1_run$

	
	BEGIN 
        
        -- #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn();
        
        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage4c1_run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####   4c1a    #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c1a()
	LANGUAGE plpgsql
	AS $vdm1_stage4c1a_run$

	
	BEGIN 
        
        -- #### #### #### #### #### #### #### ####  

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific();
        
       -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage4c1a_run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####   4c1b    #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c1b()
	LANGUAGE plpgsql
	AS $vdm1_stage4c1b_run$

	
	BEGIN 
        
        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn();
        
        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage4c1b_run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####   4c2    #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c2()
	LANGUAGE plpgsql
	AS $vdm1_stage4c2_run$

	
	BEGIN 
        
        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();

        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage4c2_run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####   4c2a    #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c2a()
	LANGUAGE plpgsql
	AS $vdm1_stage4c2a_run$

	
	BEGIN 
        
        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();

        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage4c2a_run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####   4c2b    #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c2b()
	LANGUAGE plpgsql
	AS $vdm1_stage4c2b_run$

	
	BEGIN 
        
        -- #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();

        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage4c2b_run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    4c3    #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c3()
	LANGUAGE plpgsql
	AS $vdm1_stage4c3_run$

	
	BEGIN 
        
        -- #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_cleanup();

        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage4c3_run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO STAGE 4 - FUNCTIONS

-- TABLE OF CONTENTS

--           1. vdm1_etl.f_vdm1_stage4_transform_customer_full_name();
--           2. vdm1_etl.f_vdm1_stage4_transform_customer_phone_number();
--           3. vdm1_etl.f_vdm1_stage4_transform_film_length();
--           4. vdm1_etl.f_vdm1_stage4_calc_update_category_popularity_count()
--           5. vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_count()
--           6. vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_row_number()
--           7. vdm1_etl.f_vdm1_stage4_calc_update_film_category_popularity_row_number()
--           8. vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_count()
--           9. vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
--          10. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_count_null_corrections()
--          11. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_historical_count()
--          12. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_average_count()
--          13. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_halfaverage_count()
--          14. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_historical()
--          15. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_average()
--          16. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage()
--          17. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default()
--          18. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order()
--          19. vdm1_etl.f_vdm1_stage4_calc_update_customer_watch_history_row_number()
--          20. vdm1_etl.f_vdm1_stage4_calc_insert_failed_returns_v2()
--          21. vdm1_etl.f_vdm1_stage4_calc_insert_new_releases_v2()
--          22. vdm1_etl.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat
--          23. vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific()
--          24. vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn()
--          25. vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();
--          26. vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();
--          27. vdm1_etl.f_vdm1_stage4_cleanup()


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_transform_customer_full_name()
	RETURNS VOID 
	LANGUAGE plpgsql
	AS $vdm1_stage4_transform_update_customer_full_name$

	BEGIN

			WITH get_customer_details AS (
			SELECT 
				  customer_id
				, first_name
				, last_name
			FROM 
				staging.vdm1_stage4_customers
		)

	UPDATE staging.vdm1_stage4_customers AS a

	SET customer_full_name = vdm1_data.f_transform_customer_full_name(b.first_name :: VARCHAR, b.last_name :: VARCHAR)

	FROM get_customer_details AS b

	WHERE
		a.customer_id = b.customer_id;

	END;
$vdm1_stage4_transform_update_customer_full_name$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_transform_customer_phone_number()
	RETURNS VOID 
	LANGUAGE plpgsql
	AS $vdm1_stage4_transform_update_customer_phone_number$

	BEGIN

			WITH get_customer_details AS (
			SELECT 
				  customer_id
				, phone
			FROM 
				staging.vdm1_stage4_customers
		)

	UPDATE staging.vdm1_stage4_customers AS a

	SET phone = vdm1_data.f_transform_customer_phone_e164(b.phone)

	FROM get_customer_details AS b

	WHERE
		a.customer_id = b.customer_id;

	END;
$vdm1_stage4_transform_update_customer_phone_number$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_transform_film_length()
	RETURNS VOID 
	LANGUAGE plpgsql
	AS $vdm1_stage4_transform_update_film_length$

	BEGIN

			WITH get_film_details AS (
			SELECT 
				  film_id
				, length
			FROM 
				staging.vdm1_stage4_films
		)

	UPDATE staging.vdm1_stage4_films AS a

	SET length = vdm1_data.f_transform_filmlength_int2vchar(b.length :: INTEGER)

	FROM get_film_details AS b

	WHERE
		a.film_id = b.film_id;

	END;
$vdm1_stage4_transform_update_film_length$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_category_popularity_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_category_popularity_count$
	
	BEGIN

		WITH get_rentalcount_cat AS (
			SELECT 
				  category_id
				, count(category_id) AS rentalcount_total
			FROM staging.vdm1_stage4_rentals

			GROUP BY
				category_id
		)

		UPDATE staging.vdm1_stage4_category_popularity_count

		SET total_rentals = get_rentalcount_cat.rentalcount_total

		FROM get_rentalcount_cat
		
		WHERE 
			vdm1_stage4_category_popularity_count.category_id = get_rentalcount_cat.category_id;
			
	END;
$vdm1_stage4_calc_update_category_popularity_count$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_film_popularity_count$
	
	BEGIN
	
		WITH get_rentalcount_film AS (
			SELECT 
				  film_id
				, count(film_id) AS rentalcount_total
			FROM staging.vdm1_stage4_rentals

			GROUP BY
				film_id
		)


		UPDATE staging.vdm1_stage4_film_category_popularity

		SET total_rentals = get_rentalcount_film.rentalcount_total

		FROM get_rentalcount_film
		
		WHERE 
			vdm1_stage4_film_category_popularity.film_id = get_rentalcount_film.film_id;
			
	END;
$vdm1_stage4_calc_update_film_popularity_count$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_row_number()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_film_popularity_row_number$
	
	BEGIN
	
	
		WITH get_film_popularity_row_number AS (
			SELECT 
				film_id,
				category_id,
				ROW_NUMBER() OVER (ORDER BY total_rentals DESC) as film_popularity_rental_order
			FROM staging.vdm1_stage4_film_category_popularity
		)

		UPDATE staging.vdm1_stage4_film_category_popularity a

		SET film_rank = get_film_popularity_row_number.film_popularity_rental_order

		FROM get_film_popularity_row_number

		WHERE
			a.film_id = get_film_popularity_row_number.film_id
				AND
			a.category_id = get_film_popularity_row_number.category_id;
			
	END;
$vdm1_stage4_calc_update_film_popularity_row_number$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_film_category_popularity_row_number()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_film_category_popularity_row_number$
	
	BEGIN
	
	
		WITH get_film_category_row_number AS (
			SELECT 
				film_id,
				category_id,
				ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY total_rentals DESC) as film_cat_rental_order
			FROM staging.vdm1_stage4_film_category_popularity
		)

		UPDATE staging.vdm1_stage4_film_category_popularity a

		SET film_category_rank = get_film_category_row_number.film_cat_rental_order

		FROM get_film_category_row_number

		WHERE
			a.film_id = get_film_category_row_number.film_id
				AND
			a.category_id = get_film_category_row_number.category_id;
			
	END;
$vdm1_stage4_calc_update_film_category_popularity_row_number$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_count()
    RETURNS VOID
    LANGUAGE plpgsql
    AS 
    $vdm1_stage4_calc_update_film_inventory_count$

    BEGIN

        WITH get_inventory_lifecycle AS (
            SELECT 
                  inventory_id
                , count(inventory_id) AS product_lifecycle
            FROM staging.vdm1_stage4_rentals
            GROUP BY
                inventory_id
            ORDER BY
                inventory_id        
        )


        UPDATE staging.vdm1_stage4_film_inventory

        SET life_cycle = get_inventory_lifecycle.product_lifecycle

        FROM get_inventory_lifecycle

        WHERE 
            vdm1_stage4_film_inventory.inventory_id = get_inventory_lifecycle.inventory_id;

    END;
$vdm1_stage4_calc_update_film_inventory_count$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 
 
CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calcupdate_film_inventory_flag_inspection$

	BEGIN
	
		UPDATE staging.vdm1_stage4_film_inventory 

		SET inspect_flag = true
        
        
		WHERE 
            (life_cycle % 5) = 0
            AND
        maintenance_complete_flag = false;
	
	
	END;

$vdm1_stage4_calcupdate_film_inventory_flag_inspection$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_count_null_corrections()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_count_null_correction$
	
	BEGIN

		-- PRESETTING COUNT VALUES FOR HISTORICAL, AVERAGE, AND HALF AVERAGE TO ZERO
		-- USING CTE TO FIND NULLS HAS TO BE DONE INDIVIDUALLY FOR EACH COLUMN AND/OR IS MUCH SLOWER
		-- USING A CTE TO FIND ALL NULLS IN HISTORICAL THEN SETTING TO ZERO INSTEAD OF NULL TOOK 3 SECONDS 555 MSEC
		-- SETTING ALL VALUES TO ZERO FOR ALL THREE COLUMNS TOOK 69 MSEC
		
		UPDATE staging.vdm1_stage4_customer_category

		SET
			historical_rental_count = 0,
			average_rental_count = 0,
			halfaverage_rental_count = 0;


	END;
$vdm1_stage4_calc_update_customer_category_count_null_correction$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_historical_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_historical_count$
	
	BEGIN
	
		WITH get_customer_category_historical_count AS (
			SELECT
				  customer_id
				, category_id
				, COUNT(category_id) as historical_rental_count
			FROM staging.vdm1_stage4_customer_watch_history_details
			GROUP BY 
				customer_id, category_id
			ORDER BY 
				customer_id, category_id
		)

		UPDATE staging.vdm1_stage4_customer_category

		SET historical_rental_count = get_customer_category_historical_count.historical_rental_count

		FROM get_customer_category_historical_count

		WHERE 
			(vdm1_stage4_customer_category.customer_id = get_customer_category_historical_count.customer_id)
				AND
			(vdm1_stage4_customer_category.category_id = get_customer_category_historical_count.category_id);
	END;
$vdm1_stage4_calc_update_customer_category_historical_count$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    12     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_average_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_average_count$
	
	BEGIN
	
		WITH get_customer_category_average_count AS (
			SELECT
				  customer_id
				, category_id
				, COUNT(category_id) as average_rental_count
			FROM staging.vdm1_stage4_customer_watch_history_details

            WHERE customer_watch_history_desc_order <= 14
			GROUP BY 
				customer_id, category_id
			ORDER BY 
				customer_id, category_id
		)

		UPDATE staging.vdm1_stage4_customer_category

		SET average_rental_count = get_customer_category_average_count.average_rental_count

		FROM get_customer_category_average_count

		WHERE 
			(vdm1_stage4_customer_category.customer_id = get_customer_category_average_count.customer_id)
				AND
			(vdm1_stage4_customer_category.category_id = get_customer_category_average_count.category_id);
	END;
$vdm1_stage4_calc_update_customer_category_average_count$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_halfaverage_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_halfaverage_count$
	
	BEGIN
	
		WITH get_customer_category_halfaverage_count AS (
			SELECT
				  customer_id
				, category_id
				, COUNT(category_id) as halfaverage_rental_count
			FROM staging.vdm1_stage4_customer_watch_history_details

            WHERE customer_watch_history_desc_order <= 7
			GROUP BY 
				customer_id, category_id
			ORDER BY 
				customer_id, category_id
		)

		UPDATE staging.vdm1_stage4_customer_category

		SET halfaverage_rental_count = (get_customer_category_halfaverage_count.halfaverage_rental_count / 2)

		FROM get_customer_category_halfaverage_count

		WHERE 
			(vdm1_stage4_customer_category.customer_id = get_customer_category_halfaverage_count.customer_id)
				AND
			(vdm1_stage4_customer_category.category_id = get_customer_category_halfaverage_count.category_id);
	END;
$vdm1_stage4_calc_update_customer_category_halfaverage_count$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    14     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_historical()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_rec_order_historical$
	
	BEGIN
	
		WITH get_customer_category_rec_order_historical AS (
			SELECT 
				  customer_id
				, category_id
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY historical_rental_count DESC) as recommendation_order_historical
                
			FROM staging.vdm1_stage4_customer_category
		)

		UPDATE staging.vdm1_stage4_customer_category a

		SET 
            recommendation_order_historical = get_customer_category_rec_order_historical.recommendation_order_historical
            
		FROM get_customer_category_rec_order_historical 

		WHERE
			a.customer_id = get_customer_category_rec_order_historical.customer_id
				AND
			a.category_id = get_customer_category_rec_order_historical.category_id;
			
	END;
$vdm1_stage4_calc_update_customer_category_rec_order_historical$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    15     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_average()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_rec_order_average$
	
	BEGIN
	
		WITH get_customer_category_rec_order_average AS (
			SELECT 
				  customer_id
				, category_id
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY average_rental_count DESC) as recommendation_order_average
                
			FROM staging.vdm1_stage4_customer_category
		)

		UPDATE staging.vdm1_stage4_customer_category a

		SET 
            recommendation_order_average = get_customer_category_rec_order_average.recommendation_order_average
            
		FROM get_customer_category_rec_order_average

		WHERE
			a.customer_id = get_customer_category_rec_order_average.customer_id
				AND
			a.category_id = get_customer_category_rec_order_average.category_id;
			
	END;
$vdm1_stage4_calc_update_customer_category_rec_order_average$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    16     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_rec_order_halfaverage$
	
	BEGIN
	
		WITH get_customer_category_rec_order_halfaverage AS (
			SELECT 
				  customer_id
				, category_id
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY halfaverage_rental_count DESC) as recommendation_order_halfaverage
                
			FROM staging.vdm1_stage4_customer_category
		)

		UPDATE staging.vdm1_stage4_customer_category a

		SET 
            recommendation_order_halfaverage = get_customer_category_rec_order_halfaverage.recommendation_order_halfaverage
            
		FROM get_customer_category_rec_order_halfaverage

		WHERE
			a.customer_id = get_customer_category_rec_order_halfaverage.customer_id
				AND
			a.category_id = get_customer_category_rec_order_halfaverage.category_id;
			
	END;
$vdm1_stage4_calc_update_customer_category_rec_order_halfaverage$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    17     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_recommendation_order_user_custom_set_defaults$
	
	BEGIN

		UPDATE staging.vdm1_stage4_customer_category a
		
		SET recommendation_order_customer_preference = b.recommendation_order_historical
		
		FROM 
			staging.vdm1_stage4_customer_category b
		WHERE  
			(b.customer_id = a.customer_id)
				AND
			(b.category_id = a.category_id);

	END;
$vdm1_stage4_calc_update_customer_category_recommendation_order_user_custom_set_defaults$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    18     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_recommendation_order_user_set_custom_pref$
	
	BEGIN

		WITH get_customer_custom_preferences AS (

			SELECT 
				  customer_id
				, category_id
				, customer_rec_custom_order
				, customer_rec_custom_amount
			FROM 
				staging.vdm1_stage4_customer_rec_custom_preferences
		)

		UPDATE staging.vdm1_stage4_customer_category
		
		SET recommendation_order_customer_preference = get_customer_custom_preferences.customer_rec_custom_order

		FROM get_customer_custom_preferences

		WHERE 
			(vdm1_stage4_customer_category.customer_id = get_customer_custom_preferences.customer_id)
				AND
			(vdm1_stage4_customer_category.category_id = get_customer_custom_preferences.category_id);

	END;
$vdm1_stage4_calc_update_customer_category_recommendation_order_user_set_custom_pref$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    19     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_customer_watch_history_row_number()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_cx_wh_rn$
	
	BEGIN
		
		WITH get_init_cx_wh AS (

			SELECT
				*
			FROM staging.vdm1_stage4_customer_watch_history_details
		),
		assign_row_number AS (

			SELECT
				  ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY rental_id DESC) AS customer_watch_history_desc_order_row_number
				, *
			FROM get_init_cx_wh
		)


		UPDATE staging.vdm1_stage4_customer_watch_history_details a

		SET customer_watch_history_desc_order = assign_row_number.customer_watch_history_desc_order_row_number

		FROM assign_row_number 	  

		WHERE 
			a.customer_id = assign_row_number.customer_id
			AND
			a.rental_id = assign_row_number.rental_id;
			
	END;
$vdm1_stage4_calc_update_cx_wh_rn$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    20     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_insert_failed_returns_v2()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_failed_returns$
	
	BEGIN  
            
		INSERT INTO staging.vdm1_stage4_failed_returns(

			  customer_id
			, rental_id
			, film_id
			, inventory_id
			, store_id
			, rental_date
			, expected_return_date
            , age
		)		
		
		SELECT
			  a.customer_id
			, rental_id
			, a.film_id
			, inventory_id
			, store_id
			, rental_date
			, vdm1_data.f_calc_expected_return_date(a.film_id::int, rental_date::DATE) AS expected_return_date
            , (SELECT AGE('2007-01-01', vdm1_data.f_calc_expected_return_date(a.film_id::int, rental_date::DATE))) AS age
		FROM staging.vdm1_stage4_rentals AS a
			INNER JOIN staging.vdm1_stage4_customers AS b
				ON b.customer_id = a.customer_id
			INNER JOIN staging.vdm1_stage4_films AS c
                ON c.film_id = a.film_id
	                
		WHERE a.return_date IS NULL;

	END;
$vdm1_stage4_calc_insert_failed_returns$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    21     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_insert_new_releases_v2()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_new_releases$
	
	BEGIN 


		INSERT INTO staging.vdm1_stage4_new_releases(
			  film_id
            , status
		)		
		
		SELECT
			  film_id
            , true
		FROM staging.vdm1_stage4_films
		
		WHERE new_release = true;
		
	END;
$vdm1_stage4_calc_insert_new_releases$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    22     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat()
    RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_delete_customer_film_category$

	BEGIN 

		WITH get_customer_watch_history AS (

			SELECT 
				  customer_id
				, film_id
				, category_id 
			FROM staging.vdm1_stage4_customer_watch_history_details
		),
		historyfromrecommended AS (
			(SELECT * FROM staging.vdm1_stage4_customer_film_category)
				INTERSECT  
			(SELECT * FROM get_customer_watch_history)
		)

		DELETE FROM staging.vdm1_stage4_customer_film_category AS a

		WHERE EXISTS  (
			SELECT * FROM historyfromrecommended AS b
			where b.customer_id = a.customer_id AND b.film_id = a.film_id);

		
	END;
$vdm1_stage4_calc_delete_customer_film_category$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    23     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific()
    RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_reclist_master_nonspecific$

	BEGIN 


    INSERT INTO staging.vdm1_stage4_customer_reclist_master_nonspecific(

			  customer_id
			--, film_rank
            , category_id
			, film_id
			--, film_category_rank
			--, total_rentals
		)	
    
	WITH get_customer_film_cat_x_film_cat_pop AS (

		SELECT
			  a.customer_id
			--, b.film_rank
			, a.category_id
			, a.film_id
			--, b.film_category_rank
			--, b.total_rentals
		FROM staging.vdm1_stage4_customer_film_category AS a
			-- LEFT JOIN 
				-- staging.vdm1_stage4_film_category_popularity b
					-- ON b.film_id = a.film_id 

		ORDER BY 
			a.customer_id, a.film_id	
	)
    
    SELECT
	      customer_id
	    --, film_rank
	    , category_id
        , film_id
		--, film_category_rank
	    --, total_rentals
    FROM get_customer_film_cat_x_film_cat_pop;


    
	END;
$vdm1_stage4_calc_insert_customer_reclist_master_nonspecific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    24     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_reclist_master_nonspecific_row_number$
	
	BEGIN
		
		WITH get_film_category_ranks AS (

			SELECT 
				  film_id
				, film_rank
				, film_category_rank
			FROM 
				staging.vdm1_stage4_film_category_popularity
		)
		, get_customer_reclist_master_nonspecific_values AS (

			SELECT
				  customer_id
				--, film_rank
				, category_id
				, film_id
				--, film_category_rank
				--, total_rentals
			FROM staging.vdm1_stage4_customer_reclist_master_nonspecific
		),
		assign_row_number AS (

			SELECT
				  a.customer_id
				--, film_rank
				, a.category_id
				, a.film_id
				--, film_category_rank
				--, total_rentals
				, ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY b.film_rank) AS rental_rec_order_rn
			FROM get_customer_reclist_master_nonspecific_values AS a
				LEFT JOIN 
					get_film_category_ranks AS b
						ON a.film_id = b.film_id
		)


		UPDATE staging.vdm1_stage4_customer_reclist_master_nonspecific a

		SET film_rec_order = b.rental_rec_order_rn

		FROM assign_row_number AS b

		WHERE 
			(a.customer_id = b.customer_id
				AND
			a.film_id = b.film_id);
			
	END;

$vdm1_stage4_calc_update_customer_reclist_master_nonspecific_row_number$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    25     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_reclist_master_specific_default$

	BEGIN


        INSERT INTO staging.vdm1_stage4_customer_reclist_master_specific(

                  customer_id           -- customer id
                , cat_rec_order         -- customer's category rec order     
                , category_id           -- category id 
                , film_id               -- film id
                --, film_category_rank    -- film rank by category
                --, total_rentals         -- Film's Total Rentals
            )	

        WITH get_film_category_ranks AS (

			SELECT 
				  film_id
				--, film_rank
				, film_category_rank
			FROM 
				staging.vdm1_stage4_film_category_popularity
		)
		, combined_master_with_cxcat AS (

            SELECT 
                a.customer_id
                , CASE
                    WHEN EXISTS (SELECT b.customer_id FROM staging.vdm1_stage4_customer_rec_custom_preferences AS b where b.customer_id = a.customer_id)
                        THEN b.recommendation_order_customer_preference
                    ELSE b.recommendation_order_historical
                    -- ELSE b.recommendation_order_average
                    -- ELSE b.recommendation_order_halfaverage
                END AS cat_rec_order 
                , a.category_id
                , a.film_id
                --, a.film_category_rankS
                --, a.total_rentals
            FROM 
                staging.vdm1_stage4_customer_reclist_master_nonspecific AS a
                    LEFT JOIN 
                        staging.vdm1_stage4_customer_category AS b
                            ON b.customer_id = a.customer_id
					LEFT JOIN
						get_film_category_ranks AS c
                            ON a.film_id = c.film_id
            WHERE
                (b.customer_id = a.customer_id
                    AND
                b.category_id = a.category_id)
                    AND

                b.recommendation_order_historical IN (
                    SELECT recommendation_order_historical
                        FROM 
                    staging.vdm1_stage4_customer_category)
            /*
                b.recommendation_order_average IN (
                    SELECT recommendation_order_average
                        FROM 
                    staging.vdm1_stage4_customer_category)
            */
            /*
                b.recommendation_order_halfaverage IN (
                    SELECT recommendation_order_halfaverage
                        FROM 
                    staging.vdm1_stage4_customer_category)
            */
            ORDER BY
                a.customer_id, 2, c.film_category_rank DESC
        )

        SELECT
              customer_id
            , cat_rec_order
            , category_id 
            , film_id
            --, film_category_rank
            --, total_rentals
        FROM 
            combined_master_with_cxcat;

	END;

$vdm1_stage4_calc_insert_customer_reclist_master_specific_default$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     26    #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_reclist_master_specific_row_number$
	
	
	BEGIN
		
		WITH get_film_category_ranks AS (

			SELECT 
				  film_id
				, film_rank
				, film_category_rank
			FROM 
				staging.vdm1_stage4_film_category_popularity
		)
		, get_customer_reclist_master_specific_values AS (

			SELECT
				  customer_id
				, cat_rec_order
				, category_id
				, film_id
				--, film_category_rank
				--, total_rentals
			FROM staging.vdm1_stage4_customer_reclist_master_specific
		),
		assign_row_number AS (

			SELECT
				  a.customer_id
				, a.cat_rec_order
				, a.category_id
				, a.film_id
				--, film_category_rank
				--, total_rentals
				, ROW_NUMBER() OVER(PARTITION BY a.customer_id, a.cat_rec_order ORDER BY a.cat_rec_order, b.film_category_rank) AS rental_rec_order_rn
			FROM get_customer_reclist_master_specific_values AS a
				LEFT JOIN
					get_film_category_ranks AS b
						ON a.film_id = b.film_id
		)


		UPDATE staging.vdm1_stage4_customer_reclist_master_specific a

		SET rental_rec_order = b.rental_rec_order_rn

		FROM assign_row_number AS b

		WHERE 
			(a.customer_id = b.customer_id
				AND
			a.film_id = b.film_id);
			
	END;

$vdm1_stage4_calc_update_customer_reclist_master_specific_row_number$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    27     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_cleanup$
	
	BEGIN
		

		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
	
		DROP TABLE IF EXISTS staging.vdm1_stage4_rentals;
		
		DROP TABLE IF EXISTS staging.vdm1_stage4_customer_film_category;
		
		
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage4_customers
			RENAME TO vdm1_stage5_dictkey_customer_details;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_stores
			RENAME TO vdm1_stage5_dictkey_store_details;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_films
			RENAME TO vdm1_stage5_dictkey_film_details;

        -- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_category
		    RENAME TO vdm1_stage5_dictkey_category;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_city
			RENAME TO vdm1_stage5_dictkey_city;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_country
			RENAME TO vdm1_stage5_dictkey_country;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_language
			RENAME TO vdm1_stage5_dictkey_language;

        -- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_category
			RENAME TO vdm1_stage5_customer_category;

		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage4_failed_returns
			RENAME TO vdm1_stage5_failed_returns;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_new_releases
			RENAME TO vdm1_stage5_new_releases;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_film_inventory
			RENAME TO vdm1_stage5_inventory_maintenance;

		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_watch_history_details
			RENAME TO vdm1_stage5_customer_watch_history_details;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_reclist_master_nonspecific
			RENAME TO vdm1_stage5_customer_reclist_master_nonspecific;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_reclist_master_specific
			RENAME TO vdm1_stage5_customer_reclist_master_specific;

		-- #### #### #### #### 

        ALTER TABLE IF EXISTS staging.vdm1_stage4_category_popularity_count
            RENAME TO vdm1_stage5_category_popularity;

        ALTER TABLE IF EXISTS staging.vdm1_stage4_film_category_popularity
            RENAME TO vdm1_stage5_film_category_popularity;
			
        ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_rec_custom_preferences
            RENAME TO vdm1_stage5_customer_rec_custom_preferences;

		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


	END;
$vdm1_stage4_cleanup$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #TODO STAGE 4 END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 4 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

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

--			        1. vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific(); 
--			        2. vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_specific();
--			        3. vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();
--			        4. vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_specific();
--			        5. vdm1_etl.f_vdm1_stage5_create_materialzied_view(); 
--			        6. vdm1_etl.f_vdm1_stage5_create_table_dictkey();
--			        7. vdm1_etl.f_vdm1_stage5_dictkey_insert_category_data();
--			        8. vdm1_etl.f_vdm1_stage5_dictkey_insert_language_data();
--			        9. vdm1_etl.f_vdm1_stage5_dictkey_insert_city_data();
--			       10. vdm1_etl.f_vdm1_stage5_dictkey_insert_country_data();
--			       11. vdm1_etl.f_vdm1_stage5_datestamp();
--			       12. vdm1_etl.f_vdm1_stage5_table_rename();
--			       13. vdm1_etl.f_vdm1_stage5_load_data_from_staging(p_schema_name VARCHAR, p_table_name VARCHAR);
--			       14. vdm1_etl.f_vdm1_stage5_data_validation_count_check();
--			       15. vdm1_etl.f_vdm1_stage5_table_enabled_logging_vdm1_data()
--			       16. vdm1_etl.f_vdm1_stage5_create_table_constraints();
--			   	   17. vdm1_etl.f_vdm1_stage5_alter_tables_set_defaults();
--			       18. vdm1_etl.f_vdm1_stage5_pkey_setval(p_schemaname VARCHAR, p_tablename VARCHAR, p_pkey_column_name VARCHAR);
--			       19. vdm1_etl.f_vdm1_stage5_cleanup();
--			       20. vdm1_etl.f_vdm1_stage5_delete_stage(); 
--			       21. vdm1_etl.f_vdm1_stage5_create_mview_inventory_summary();
--			  	   22. vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_master_non();
--			  	   23. vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_master_spec();
--			  	   24. vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_summary_non();
--			  	   25. vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_summary_spec();
--			       26. vdm1_etl.f_vdm1_stage5_refresh_materialized_view();
--				   27. vdm1_etl.f_vdm1_stage5_create_index(p_index_name VARCHAR, p_schema_name VARCHAR, p_table_name VARCHAR, p_column_name VARCHAR)

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
-- #TODO STAGE 5a - STORED PROCEDURES

-- #### #### #### ####
-- ####  5a Main  #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage5a_main()
	LANGUAGE plpgsql
	AS $vdm1_stage5_run_main$
	
	BEGIN 


        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 
        
        PERFORM vdm1_etl.f_vdm1_stage5_create_table_dictkey();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_category_data();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_city_data();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_country_data();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_language_data();


        -- #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage5_datestamp();

        PERFORM vdm1_etl.f_vdm1_stage5_table_rename();
    
        -- #### #### #### #### #### #### #### #### 


        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_category');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_category', 'vdm1_data', 'customer_category');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'failed_returns');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'failed_returns', 'vdm1_data', 'failed_returns');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'new_releases');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'new_releases', 'vdm1_data', 'new_releases');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'inventory_maintenance');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'inventory_maintenance', 'vdm1_data', 'inventory_maintenance');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_watch_history_detailed');
 
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_watch_history_detailed', 'vdm1_data', 'customer_watch_history_detailed');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_reclist_master_nonspecific');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_master_nonspecific', 'vdm1_data', 'customer_reclist_master_nonspecific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_reclist_master_specific');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_master_specific', 'vdm1_data', 'customer_reclist_master_specific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA         
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_reclist_summary_nonspecific');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_summary_nonspecific', 'vdm1_data', 'customer_reclist_summary_nonspecific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_reclist_summary_specific');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_summary_specific', 'vdm1_data', 'customer_reclist_summary_specific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'category_popularity');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'category_popularity', 'vdm1_data', 'category_popularity');


        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'film_category_popularity');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'film_category_popularity', 'vdm1_data', 'film_category_popularity');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_rec_custom_preferences');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_rec_custom_preferences', 'vdm1_data', 'customer_rec_custom_preferences');


        -- #### #### #### #### #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictionary_key');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictionary_key', 'vdm1_data', 'dictionary_key');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_category');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_category', 'vdm1_data', 'dictkey_category');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_city');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_city', 'vdm1_data', 'dictkey_city');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_country');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_country', 'vdm1_data', 'dictkey_country');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_language');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_language', 'vdm1_data', 'dictkey_language');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_customer_details');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_customer_details', 'vdm1_data', 'dictkey_customer_details');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_film_details');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_film_details', 'vdm1_data', 'dictkey_film_details');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_store_details');

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

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('failed_returns', 'customer_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('new_releases', 'film_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('customer_watch_history_detailed', 'customer_id, customer_watch_history_desc_order');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('film_category_popularity', 'total_rentals DESC, film_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('category_popularity', 'total_rentals DESC');

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_table_constraints();

		-- #### #### #### #### 
		
		PERFORM vdm1_etl.f_vdm1_stage5_table_enabled_logging_vdm1_data();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage5_alter_tables_set_defaults();

		PERFORM vdm1_etl.f_vdm1_stage5_pkey_setval('vdm1_data', 'dictionary_key', 'dictkey_id');
        
        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_cleanup();

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_destroy_stage();

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
	
		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_customer_reclist_master_nonspecific', 'vdm1_data', 'customer_reclist_master_nonspecific', 'customer_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_customer_reclist_master_specific', 'vdm1_data', 'customer_reclist_master_specific', 'customer_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_customer_reclist_summary_nonspecific', 'vdm1_data', 'customer_reclist_summary_nonspecific', 'customer_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_customer_reclist_summary_specific', 'vdm1_data', 'customer_reclist_summary_specific', 'customer_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_customer_watch_history', 'vdm1_data', 'customer_watch_history_detailed', 'customer_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_customer_category', 'vdm1_data', 'customer_category', 'customer_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_inventory_maintenance', 'vdm1_data', 'inventory_maintenance', 'inventory_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_film_category_popularity', 'vdm1_data', 'film_category_popularity', 'film_id'); 
		
        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_mview_inventory_maintenance_summary();

		-- #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_master_non();
		
		PERFORM vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_master_spec();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_summary_non();

		PERFORM vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_summary_spec();


        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_category');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_city');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_country');

        -- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_language');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_customer_details');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_store_details');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_film_details');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('customer_reclist_master_nonspecific');

        -- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('customer_reclist_master_specific');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('customer_reclist_summary_nonspecific');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('customer_reclist_summary_specific');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('inventory_maintenance_summary');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('failed_returns');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('new_releases');

        -- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('film_category_popularity');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('category_popularity');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('customer_watch_history_detailed');

        -- #### #### #### #### #### #### #### #### 
        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage5_run_main$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####  5a RESET #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage5a_reset()
	LANGUAGE plpgsql
	AS $vdm1_stage5_run_reset$
	
	BEGIN 

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


        PERFORM vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 

        
        PERFORM vdm1_etl.f_vdm1_stage5_create_table_dictkey();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_category_data();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_city_data();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_country_data();
        
        PERFORM vdm1_etl.f_vdm1_stage5_dictkey_insert_language_data();


        -- #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage5_datestamp();

        PERFORM vdm1_etl.f_vdm1_stage5_table_rename();
    
        -- #### #### #### #### #### #### #### #### 


        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_category');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_category', 'vdm1_data', 'customer_category');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'failed_returns');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'failed_returns', 'vdm1_data', 'failed_returns');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'new_releases');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'new_releases', 'vdm1_data', 'new_releases');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'inventory_maintenance');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'inventory_maintenance', 'vdm1_data', 'inventory_maintenance');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_watch_history_detailed');
 
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_watch_history_detailed', 'vdm1_data', 'customer_watch_history_detailed');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_reclist_master_nonspecific');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_master_nonspecific', 'vdm1_data', 'customer_reclist_master_nonspecific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_reclist_master_specific');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_master_specific', 'vdm1_data', 'customer_reclist_master_specific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA         
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_reclist_summary_nonspecific');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_summary_nonspecific', 'vdm1_data', 'customer_reclist_summary_nonspecific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_reclist_summary_specific');
        
        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_reclist_summary_specific', 'vdm1_data', 'customer_reclist_summary_specific');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'category_popularity');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'category_popularity', 'vdm1_data', 'category_popularity');


        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'film_category_popularity');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'film_category_popularity', 'vdm1_data', 'film_category_popularity');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'customer_rec_custom_preferences');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'customer_rec_custom_preferences', 'vdm1_data', 'customer_rec_custom_preferences');


        -- #### #### #### #### #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictionary_key');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictionary_key', 'vdm1_data', 'dictionary_key');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_category');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_category', 'vdm1_data', 'dictkey_category');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_city');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_city', 'vdm1_data', 'dictkey_city');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_country');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_country', 'vdm1_data', 'dictkey_country');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_language');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_language', 'vdm1_data', 'dictkey_language');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_customer_details');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_customer_details', 'vdm1_data', 'dictkey_customer_details');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_film_details');

        -- DATA VALIDATION - COUNT CHECK - SOURCE COUNT TO TARGET COUNT 
        PERFORM vdm1_etl.f_vdm1_stage5_data_validation_count_check('staging', 'dictkey_film_details', 'vdm1_data', 'dictkey_film_details');

        -- #### #### #### #### 

        -- LOAD TABLE FROM STAGING TO VDM1_DATA 
        PERFORM vdm1_etl.f_vdm1_stage5_load_data_from_staging('vdm1_data', 'dictkey_store_details');

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

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('failed_returns', 'customer_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('new_releases', 'film_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('customer_watch_history_detailed', 'customer_id, customer_watch_history_desc_order');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('film_category_popularity', 'total_rentals DESC, film_id');

        PERFORM vdm1_etl.f_vdm1_stage5_create_materialized_view('category_popularity', 'total_rentals DESC');

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage5_table_enabled_logging_vdm1_data();

		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_create_table_constraints();

        -- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage5_alter_tables_set_defaults();

		PERFORM vdm1_etl.f_vdm1_stage5_pkey_setval('vdm1_data', 'dictionary_key', 'dictkey_id');
        
        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_cleanup();

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_destroy_stage();

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
	
		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_customer_reclist_master_nonspecific', 'vdm1_data', 'customer_reclist_master_nonspecific', 'customer_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_customer_reclist_master_specific', 'vdm1_data', 'customer_reclist_master_specific', 'customer_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_customer_reclist_summary_nonspecific', 'vdm1_data', 'customer_reclist_summary_nonspecific', 'customer_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_customer_reclist_summary_specific', 'vdm1_data', 'customer_reclist_summary_specific', 'customer_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_customer_watch_history', 'vdm1_data', 'customer_watch_history_detailed', 'customer_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_customer_category', 'vdm1_data', 'customer_category', 'customer_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_inventory_maintenance', 'vdm1_data', 'inventory_maintenance', 'inventory_id'); 

		PERFORM vdm1_etl.f_vdm1_stage5_create_index('index_film_category_popularity', 'vdm1_data', 'film_category_popularity', 'film_id'); 


        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


        PERFORM vdm1_etl.f_vdm1_stage5_create_mview_inventory_maintenance_summary();

		-- #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_master_non();
		
		PERFORM vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_master_spec();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_summary_non();

		PERFORM vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_summary_spec();


        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
        
        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_category');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_city');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_country');

        -- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_language');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_customer_details');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_store_details');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('dictkey_film_details');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('customer_reclist_master_nonspecific');

        -- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('customer_reclist_master_specific');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('customer_reclist_summary_nonspecific');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('customer_reclist_summary_specific');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('inventory_maintenance_summary');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('failed_returns');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('new_releases');

        -- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('film_category_popularity');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('category_popularity');

        -- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage5_refresh_materialized_view('customer_watch_history_detailed');

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
-- #TODO STAGE 5a - FUNCTIONS

-- TABLE OF CONTENTS

--           1. vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific(); 
--           2. vdm1_etl.f_vdm1_stage5_createtable_cx_reclist_summary_specific();
--           3. vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();
--           4. vdm1_etl.f_vdm1_stage5_insert_cx_reclist_summary_specific();
--           5. vdm1_etl.f_vdm1_stage5_create_materialzied_view(); 
--           6. vdm1_etl.f_vdm1_stage5_create_table_dictkey();
--           7. vdm1_etl.f_vdm1_stage5_dictkey_insert_category_data();
--           8. vdm1_etl.f_vdm1_stage5_dictkey_insert_language_data();
--           9. vdm1_etl.f_vdm1_stage5_dictkey_insert_city_data();
--          10. vdm1_etl.f_vdm1_stage5_dictkey_insert_country_data();
--          11. vdm1_etl.f_vdm1_stage5_datestamp();
--          12. vdm1_etl.f_vdm1_stage5_table_rename();
--          13. vdm1_etl.f_vdm1_stage5_load_data_from_staging();
--          14. vdm1_etl.f_vdm1_stage5_data_validation_count_check();
--          15. vdm1_etl.f_vdm1_stage5_table_enabled_logging_vdm1_data()
--          16. vdm1_etl.f_vdm1_stage5_create_table_constraints();
--          17. vdm1_etl.f_vdm1_stage5_alter_tables_set_defaults();
--          18. vdm1_etl.f_vdm1_stage5_pkey_setval(p_schemaname VARCHAR, p_tablename VARCHAR, p_pkey_column_name VARCHAR);
--          19. vdm1_etl.f_vdm1_stage5_cleanup();
--          20. vdm1_etl.f_vdm1_stage5_delete_stage(); 
--          21. vdm1_etl.f_vdm1_stage5_create_mview_inventory_summary();
--          22. vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_master_non();
--          23. vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_master_spec();
--          24. vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_summary_non();
--          25. vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_summary_spec();
--          26. vdm1_etl.f_vdm1_stage5_refresh_materialized_view();
--          27. vdm1_etl.f_vdm1_stage5_create_index(p_index_name VARCHAR, p_schema_name VARCHAR, p_table_name VARCHAR, p_column_name VARCHAR)

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     3     #### 
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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     4     #### 
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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     5     #### 
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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_table_dictkey()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_table_dictkey$
		
	BEGIN 

		CREATE TABLE staging.vdm1_stage5_dictionary_key (

                  dictkey_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY		-- Primary Key for new Dictionary Key table.
                , dictionary VARCHAR        												-- Table Name is Dictionary
                , key_id INTEGER            												-- Column ID is Key ID
                , key_name VARCHAR          												-- Column Data is Key Name 
            );
    
    END;
$vdm1_stage5_create_table_dictkey$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     7     #### 
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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     8     #### 
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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     9     #### 
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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    10     #### 
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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_datestamp()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage5_datestamp$

    BEGIN

    	-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_inventory_maintenance
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

    	-- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage5_datestamp$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    12     #### 
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

    	-- #### #### #### #### #### #### #### #### 

	END;
$vdm1_stage5_table_rename$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_load_data_from_staging(
		  p_schema_name VARCHAR
		, p_tablename VARCHAR
	) 
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_load_data_vdm1_data$
		
	DECLARE

		vi_schema_name VARCHAR;
		vi_table_name VARCHAR;
	
	BEGIN
	 
		vi_schema_name := $1;
		vi_table_name := $2;

		EXECUTE
			'CREATE UNLOGGED TABLE IF NOT EXISTS ' || vi_schema_name || '.' || vi_table_name || ' AS 
				SELECT * FROM staging.' || vi_table_name;
	
	END;
$vdm1_stage5_load_data_vdm1_data$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    14     #### 
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
  
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    15     #### 
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

        -- #### #### #### #### 

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

        ALTER TABLE IF EXISTS vdm1_data.dictionary_key
            SET LOGGED;

        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage5_table_changes_activate_logging_vdm1_data$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    16     #### 
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

-- LINK:
-- https://www.2ndquadrant.com/en/blog/postgresql-10-identity-columns/
-- https://www.postgresql.org/docs/current/sql-altertable.html
-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-primary-key/
-- https://stackoverflow.com/questions/2944499/how-to-add-an-auto-incrementing-primary-key-to-an-existing-table-in-postgresql
-- https://www.cybertec-postgresql.com/en/sequences-gains-and-pitfalls/
-- https://popsql.com/learn-sql/postgresql/how-to-alter-sequence-in-postgresql

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    17     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_alter_tables_set_defaults()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage5_alter_tables_set_defaults$

    BEGIN

		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        ALTER TABLE vdm1_data.dictionary_key
			ALTER dictkey_id ADD GENERATED BY DEFAULT AS IDENTITY, 
			ADD PRIMARY KEY (dictkey_id);

		-- #### #### #### #### #### #### #### #### 

        ALTER TABLE vdm1_data.new_releases
			ALTER created_date SET DEFAULT CURRENT_DATE;

		-- #### #### #### #### #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS vdm1_data.inventory_maintenance
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.customer_category
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.customer_film_category
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.customer_watch_history_detailed
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.customer_rec_custom_preferences
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS vdm1_data.customer_reclist_master_nonspecific
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.customer_reclist_master_specific
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.customer_reclist_summary_nonspecific
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.customer_reclist_summary_specific
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS vdm1_data.failed_returns
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.new_releases
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.category_popularity
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.film_category_popularity
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS vdm1_data.dictionary_key
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.dictkey_category
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.dictkey_city
			ALTER generated_date SET DEFAULT CURRENT_DATE;
			
		ALTER TABLE IF EXISTS vdm1_data.dictkey_country
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.dictkey_language
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.dictkey_customer_details
			ALTER generated_date SET DEFAULT CURRENT_DATE;
			
		ALTER TABLE IF EXISTS vdm1_data.dictkey_store_details
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS vdm1_data.dictkey_film_details
			ALTER generated_date SET DEFAULT CURRENT_DATE;

		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
	
    END;
$vdm1_stage5_alter_tables_set_defaults$;

-- REFERENCE LINKS:
-- https://stackoverflow.com/questions/61886884/postgresql-add-auto-increment-to-empty-id-column
-- https://www.postgresql.org/docs/current/ddl-alter.html#:~:text=To%20set%20a%20new%20default,default%20for%20future%20INSERT%20commands.

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    18     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_pkey_setval(
	  p_schemaname VARCHAR
	, p_tablename VARCHAR
	, p_pkey_column_name VARCHAR

)
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_primary_key_setval$
	
	DECLARE 
		p_schemaname VARCHAR;
		p_tablename VARCHAR;
		p_pkey_column_name VARCHAR;

		vi_schemaname VARCHAR;
		vi_tablename VARCHAR;
		vi_pkey_columnname VARCHAR;

	BEGIN
		
    	-- #### #### #### #### #### #### #### #### 

		vi_schemaname := $1;
		vi_tablename := $2;
		vi_pkey_columnname := $3;

		EXECUTE
			'
				SELECT setval(pg_get_serial_sequence(''' || $1 || '.' || $2 || ''', ''' || $3 || '''), 
                                      (select max(' || $3 || ') from '|| $1 || '.' || $2 ||'))';

    	-- #### #### #### #### #### #### #### #### 

	END;
$vdm1_stage5_primary_key_setval$;

-- REFERENCE LINKS
-- https://stackoverflow.com/questions/55664506/reset-identity-column-with-last-value-of-tables-identity-in-postgres
-- https://pgpedia.info/p/pg_get_serial_sequence.html
-- https://www.postgresql.org/docs/8.2/functions-sequence.html
-- https://stackoverflow.com/questions/55664506/reset-identity-column-with-last-value-of-tables-identity-in-postgres

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    19     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_cleanup$
	
	BEGIN
		
    	-- #### #### #### #### #### #### #### #### 

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


    	-- #### #### #### #### #### #### #### #### 

	END;
$vdm1_stage5_cleanup$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    20     #### 
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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    21     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_mview_inventory_maintenance_summary()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_mview_film_inventory_summary$

	BEGIN
		
		CREATE MATERIALIZED VIEW marketing.inventory_maintenance_summary AS (
			
			SELECT 
				*
			FROM 
				vdm1_data.inventory_maintenance

			WHERE
				inspect_flag = true

			ORDER BY
				life_cycle DESC, film_id, inventory_id
		);
	
	END;
$vdm1_stage5_create_mview_film_inventory_summary$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    22     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_master_non()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_mview_customer_reclist_master_nonspecific$

	BEGIN
		
		CREATE MATERIALIZED VIEW marketing.customer_reclist_master_nonspecific AS (
			
			SELECT 
				  a.customer_id
				, b.customer_full_name
				, b.email 
				, b.phone
				, a.film_rec_order
				, a.film_id
				, c.title
				, d.name AS language
				, c.release_year
				, e.name AS genre
				, c.length
				, c.rating
				, c.description
				, CONCAT('Available for ' || c.rental_duration || ' days for only $' || c.rental_rate)
			FROM 
				vdm1_data.customer_reclist_master_nonspecific AS a 

					LEFT JOIN
						vdm1_data.dictkey_customer_details AS b 
							ON a.customer_id = b.customer_id 

					LEFT JOIN 
						vdm1_data.dictkey_film_details AS c 
							ON a.film_id = c.film_id 

					LEFT JOIN 
						vdm1_data.dictkey_language AS d 
							ON c.language_id = d.language_id
					
					LEFT JOIN 
						vdm1_data.dictkey_category AS e 
							ON c.category_id = e.category_id



			ORDER BY
				customer_id, film_rec_order
		);
	
	END;
$vdm1_stage5_create_mview_customer_reclist_master_nonspecific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    23     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_master_spec()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_mview_customer_reclist_master_specific$

	BEGIN
		
		CREATE MATERIALIZED VIEW marketing.customer_reclist_master_specific AS (
			
			SELECT 
				  a.customer_id
				, b.customer_full_name
				, b.email 
				, b.phone
				, a.cat_rec_order
				, a.rental_rec_order
				, a.film_id
				, c.title
				, d.name AS language
				, c.release_year
				, e.name AS genre
				, c.length
				, c.rating
				, c.description
				, CONCAT('Available for ' || c.rental_duration || ' days for only $' || c.rental_rate)
			FROM 
				vdm1_data.customer_reclist_master_specific AS a 

					LEFT JOIN
						vdm1_data.dictkey_customer_details AS b 
							ON a.customer_id = b.customer_id 

					LEFT JOIN 
						vdm1_data.dictkey_film_details AS c 
							ON a.film_id = c.film_id 

					LEFT JOIN 
						vdm1_data.dictkey_language AS d 
							ON c.language_id = d.language_id
					
					LEFT JOIN 
						vdm1_data.dictkey_category AS e 
							ON c.category_id = e.category_id



			ORDER BY
				customer_id, cat_rec_order, rental_rec_order
		);
	
	END;
$vdm1_stage5_create_mview_customer_reclist_master_specific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    24     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_summary_non()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_mview_customer_reclist_summary_nonspecific$

	BEGIN

		CREATE MATERIALIZED VIEW marketing.customer_reclist_summary_nonspecific AS (
			
			SELECT 
				  a.customer_id
				, b.customer_full_name
				, b.email 
				, b.phone
				, a.film_rec_order
				, a.film_id
				, c.title
				, d.name AS language
				, c.release_year
				, e.name AS genre
				, c.length
				, c.rating
				, c.description
				, CONCAT('Available for ' || c.rental_duration || ' days for only $' || c.rental_rate)
			FROM 
				vdm1_data.customer_reclist_summary_nonspecific AS a 

					LEFT JOIN
						vdm1_data.dictkey_customer_details AS b 
							ON a.customer_id = b.customer_id 

					LEFT JOIN 
						vdm1_data.dictkey_film_details AS c 
							ON a.film_id = c.film_id 

					LEFT JOIN 
						vdm1_data.dictkey_language AS d 
							ON c.language_id = d.language_id
					
					LEFT JOIN 
						vdm1_data.dictkey_category AS e 
							ON c.category_id = e.category_id


			ORDER BY
				customer_id, film_rec_order
		);
	
	END;
$vdm1_stage5_create_mview_customer_reclist_summary_nonspecific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    25     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_mview_customer_reclist_summary_spec()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_mview_customer_reclist_summary_specific$

	BEGIN
		
		CREATE MATERIALIZED VIEW marketing.customer_reclist_summary_specific AS (
			
			SELECT 
				  a.customer_id
				, b.customer_full_name
				, b.email 
				, b.phone
				, a.cat_rec_order
				, a.rental_rec_order
				, a.film_id
				, c.title
				, d.name AS language
				, c.release_year
				, e.name AS genre
				, c.length
				, c.rating
				, c.description
				, CONCAT('Available for ' || c.rental_duration || ' days for only $' || c.rental_rate)
			FROM 
				vdm1_data.customer_reclist_summary_specific AS a 

					LEFT JOIN
						vdm1_data.dictkey_customer_details AS b 
							ON a.customer_id = b.customer_id 

					LEFT JOIN 
						vdm1_data.dictkey_film_details AS c 
							ON a.film_id = c.film_id 

					LEFT JOIN 
						vdm1_data.dictkey_language AS d 
							ON c.language_id = d.language_id
					
					LEFT JOIN 
						vdm1_data.dictkey_category AS e 
							ON c.category_id = e.category_id


			ORDER BY
				customer_id, cat_rec_order, rental_rec_order
		);
	
	END;
$vdm1_stage5_create_mview_customer_reclist_summary_specific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    26     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_refresh_materialized_view(
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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    27     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_create_index(
      p_index_name VARCHAR
	, p_schema_name VARCHAR
	, p_table_name VARCHAR
	, p_column_name VARCHAR
)
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_index$

    DECLARE 

		vi_index_name VARCHAR;
		vi_schema_name VARCHAR;
        vi_table_name VARCHAR;
		vi_column_name VARCHAR;

	BEGIN 
		
		vi_index_name := $1;
		vi_schema_name :=$2;
        vi_table_name := $3;
		vi_column_name := $4;
		
			EXECUTE 
            	'CREATE INDEX IF NOT EXISTS ' || vi_index_name || ' ON ' || 
					COALESCE(vi_schema_name || '.' || vi_table_name, vi_table_name) 
						|| ' (' || vi_column_name || ')';
	
	END;
$vdm1_stage5_create_index$;

-- REFERENCE LINKS:
-- https://www.postgresql.org/docs/current/sql-createindex.html
-- https://www.postgresqltutorial.com/postgresql-indexes/postgresql-create-index/
-- https://www.tutorialspoint.com/postgresql/postgresql_indexes.htm
-- https://popsql.com/learn-sql/postgresql/how-to-create-an-index-in-postgresql
-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-coalesce/
-- https://www.postgresql.org/docs/current/functions-conditional.html
-- https://www.geeksforgeeks.org/postgresql-coalesce/
-- https://www.enterprisedb.com/postgres-tutorials/how-use-coalesce-postgresql

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #TODO STAGE 5a END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 5a END    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                           

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 5b BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 5b BEGIN

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--     #### #### #### ####
--       STAGE 5b BEGIN
--      TRIGGER FUNCTIONS
--     #### #### #### ####

--             STORED PROCEDURES

--                   1. vdm1_etl.vdm1_stage5_trigger_functions_setup();

--             TRIGGER FUNCTIONS

--                   1. vdm1_data.t_f_insert_null_returned_date_rental_to_fr_table();
--                   2. vdm1_data.t_f_insert_new_category();
--                   3. vdm1_data.t_f_insert_new_customer();
--                   4. vdm1_data.t_f_insert_new_film();
--                   5. vdm1_data.t_f_insert_new_inventory();
--                   6. vdm1_data.t_f_insert_update_customer_rec_custom_preferences();
--                   6. vdm1_data.t_f_delete_reset_customer_rec_custom_preferences();
--                   8. vdm1_data.t_f_update_category_popularity();
--                   9. vdm1_data.t_f_update_customer_category();
--                  10. vdm1_data.t_f_update_customer_reclist_master_nonspecific_new_rental();
--                  11. vdm1_data.t_f_update_customer_reclist_master_nonspecific_ru();
--                  12. vdm1_data.t_f_update_customer_reclist_master_specific_new_rental()
--                  13. vdm1_data.t_f_update_customer_reclist_master_specific_new_rental_ru()
--                  14. vdm1_data.t_f_update_customer_reclist_summary_nonspecific();
--                  15. vdm1_data.t_f_update_customer_reclist_summary_nonspecific_ru();
--                  16. vdm1_data.t_f_update_customer_reclist_summary_specific();
--                  17. vdm1_data.t_f_update_customer_reclist_summary_specific_ru();
--                  18. vdm1_data.t_f_insert_customer_watch_history();
--                  19. vdm1_data.t_f_update_film_category_popularity_new_rental()
--                  20. vdm1_data.t_f_update_inventory_maintenance_count();
--                  21. vdm1_data.t_f_update_new_release();
--                  22. vdm1_data.t_f_update_rental_return();
--                  23. vdm1_data.t_f_insert_customer_reclist_master_nonspecific_new_film();
--                  24. vdm1_data.t_f_insert_customer_reclist_master_specific_new_film();
--                  25. vdm1_data.t_f_update_inventory_maintenance_complete()
--                  26. vdm1_data.t_f_insert_new_city();
--                  27. vdm1_data.t_f_insert_new_country();
--                  28. vdm1_data.t_f_insert_new_language();
--                  29. vdm1_data.t_f_refresh_materialized_views();

--             FUNCTIONS USED TO CREATED TRIGGER FUNCTIONS

--                   1. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ifr()
--                   2. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incat()
--                   3. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incust()
--                   4. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_infilm()
--                   5. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ininv()
--                   6. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_iucrcp()
--                   7. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_drcrcp()
--                   8. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucatpop()
--                   9. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucustcat()
--                  10. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non()
--                  11. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non_nr()
--                  12. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe()
--                  13. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe_ru()
--                  14. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_non()
--                  15. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_non_ru()
--                  16. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_spe()
--                  17. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_spe_ru()
--                  18. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_upcxwatchhist()
--                  19. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ufcp()
--                  20. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_uinv_count()
--                  21. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_unewr()
--                  22. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_urr()
--                  23. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non_inf()
--                  24. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe_inf()
--                  25. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_uinv_comp()
--                  26. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incity()
--                  27. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incountry()
--                  28. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_inlanguage()
--                  29. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_refreshmviews();

--     #### #### #### ####
--        STAGE 5b END
--      TRIGGER FUNCTIONS
--     #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####   TRIGGERS BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 5b - STORED PROCEDURES



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    5b     #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage5b_trigger_functions_setup()
    LANGUAGE plpgsql
    AS $vdm1_stage5_trigger_functions_setup_procedure$

    BEGIN

        -- 01
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ifr();

        -- 02
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incat();

        -- 03
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incust();

        -- 04
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_infilm();

        -- 05
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ininv();

        -- 06
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_iucrcp();

        -- 07
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_drcrcp();

        -- 08
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucatpop();

        -- 09
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucustcat();

        -- 10
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non();

        -- 11
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non_nr();

        -- 12
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe();

        -- 13
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe_ru();
        
        -- 14
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_non();

        -- 15
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_non_ru();

        -- 16
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_spe();

        -- 17
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_spe_ru();

        -- 18
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_upcxwatchhist();

        -- 19
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ufcp_nr();

        -- 20
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_uinv_count();

        -- 21
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_unewr();

        -- 22
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_urr();

        -- 23
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non_inf();

        -- 24
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe_inf();

        -- 25
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_uinv_comp();

        -- 26
		PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incity();

        -- 27
		PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incountry();

        -- 28
		PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_inlanguage();

        -- 29
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_functions_setup_refreshmviews();


    END;
$vdm1_stage5_trigger_functions_setup_procedure$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


-- #TODO STAGE 5b - FUNCTIONS
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####   TRIGGER FUNCTIONS #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS 

--   TRIGGER FUNCTIONS

--           1. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ifr()
--           2. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incat()
--           3. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incust()
--           4. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_infilm()
--           5. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ininv()
--           6. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_iucrcp()
--           7. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucatpop()
--           8. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucustcat()
--           9. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non()
--          10. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non_nr()
--          11. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe()
--          12. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe_ru()
--          13. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_non()
--          14. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_non_ru()
--          15. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_spe()
--          16. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_spe_ru()
--          17. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_upcxwatchhist()
--          18. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ufcp()
--          19. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_uinv_count()
--          20. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_unewr()
--          21. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_urr()
--          22. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non_inf()
--          23. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe_inf()
--          24. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_uinv_comp()
--          25. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incity()
--          26. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incountry()
--          27. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_inlanguage()
--          28. vdm1_etl.f_vdm1_stage5_trigger_functions_setup_refreshmviews();

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ifr()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_insert_failed_return$

	BEGIN

		EXECUTE 
		    'CREATE OR REPLACE FUNCTION vdm1_data.t_f_insert_null_returned_date_rental_to_fr_table()
                RETURNS TRIGGER
                LANGUAGE plpgsql
                AS $trigger_function_insert_failed_return$

                BEGIN 
                
                
                    -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

						BEGIN
						
							INSERT INTO vdm1_data.failed_returns(
								customer_id
								, rental_id 
								, film_id
								, inventory_id
								, store_id
								, rental_date
								, expected_return_date
								, age 
							)

							SELECT
								a.customer_id 
								, a.rental_id
								, a.film_id
								, a.inventory_id
								, b.store_id
								, a.rental_date
								, vdm1_data.f_calc_expected_return_date(a.film_id::int, a.rental_date::DATE) as expected_return_date
								, (SELECT AGE(''2007-01-01'', vdm1_data.f_calc_expected_return_date(a.film_id::int, a.rental_date::DATE))) as age
							FROM 
								vdm1_data.customer_watch_history_detailed AS a
									LEFT JOIN vdm1_data.dictkey_customer_details AS b
										ON b.customer_id = a.customer_id 

							WHERE
								a.return_date IS NULL 
									AND 
								a.rental_id = NEW.rental_id;

						END;
                    
                    -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

                    RETURN NEW;

                    -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                END;
            $trigger_function_insert_failed_return$;';

    END;
$vdm1_stage5_trigger_functions_setup_insert_failed_return$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incat()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_insert_new_category$

	BEGIN

		EXECUTE
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_insert_new_category()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_insert_new_category$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						INSERT INTO vdm1_data.dictkey_category (
							category_id
							, name
						)

						SELECT
							category_id
							, name
						FROM public.category

						WHERE 
							category_id = NEW.category_id;
				
					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						INSERT INTO vdm1_data.dictionary_key (
							dictionary
							, key_id
							, key_name
						)

						SELECT
							''category''
							, category_id
							, name
						FROM public.category

						WHERE 
							category_id = NEW.category_id;
				
					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						INSERT INTO vdm1_data.customer_rec_custom_preferences (
							customer_id
							, category_id
							, customer_rec_custom_order
						)

						WITH get_customers_with_custom_rec_preferences AS (

							SELECT
								customer_id 
							FROM 
								vdm1_data.customer_rec_custom_preferences
						)
						, cross_join_customer_to_new_category AS (
							
							SELECT
								DISTINCT (customer_id)
								, category_id
							FROM 
								get_customers_with_custom_rec_preferences
									CROSS JOIN
										public.category
							
							WHERE
								category_id = NEW.category_id
						)
						, get_total_count_of_categories AS (

							SELECT
								COUNT(1) AS category_length
							FROM
								public.category
						)
						, cross_join_cuscat_to_catleng AS (
							
							SELECT
								customer_id
								, category_id 
								, category_length AS customer_rec_custom_order
							FROM
								cross_join_customer_to_new_category
									CROSS JOIN
										get_total_count_of_categories
						)

						SELECT
							customer_id
							, category_id
							, customer_rec_custom_order
						FROM
							cross_join_cuscat_to_catleng; 

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						INSERT INTO vdm1_data.category_popularity (
							category_id
							, name
							, total_rentals
						)

						SELECT
							category_id
							, name
							, ''0''
						FROM
							public.category

						WHERE
							category_id = NEW.category_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####          
				
					BEGIN 

						INSERT INTO vdm1_data.customer_category(
							customer_id
							, category_id
						)

						SELECT
							b.customer_id
							, a.category_id
						FROM public.category AS a
							CROSS JOIN vdm1_data.dictkey_customer_details AS b

						WHERE
							a.category_id = NEW.category_id;
					
					END;
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  
			
					BEGIN 

						UPDATE vdm1_data.customer_category
						
						SET
							  historical_rental_count = 0
							, average_rental_count = 0
							, halfaverage_rental_count = 0
							
						WHERE
							category_id = NEW.category_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   

					BEGIN 
							
						UPDATE vdm1_data.customer_category 

						SET 
							  recommendation_order_historical = null
							, recommendation_order_average = null
							, recommendation_order_halfaverage = null
							, recommendation_order_customer_preference = null;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   

					BEGIN 

						WITH get_customer_category_rec_order_historical AS (
							
							SELECT 
								  a.customer_id
								, a.category_id
								, ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY a.historical_rental_count DESC, b.total_rentals DESC) as recommendation_order_historical

							FROM vdm1_data.customer_category AS a
								INNER JOIN vdm1_data.category_popularity AS b 
									ON b.category_id = a.category_id
						)

						UPDATE vdm1_data.customer_category AS a

						SET 
							recommendation_order_historical = b.recommendation_order_historical

						FROM get_customer_category_rec_order_historical AS b

						WHERE
							b.category_id = a.category_id
								AND
							b.customer_id = a.customer_id;
					
					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   

					BEGIN 

						WITH get_customer_category_rec_order_average AS (
							SELECT 
								  a.customer_id
								, a.category_id
								, ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY a.average_rental_count DESC, b.total_rentals DESC) as recommendation_order_average

							FROM vdm1_data.customer_category AS a
								INNER JOIN vdm1_data.category_popularity AS b
									ON b.category_id = a.category_id
						)

						UPDATE vdm1_data.customer_category AS a

						SET 
							recommendation_order_average = b.recommendation_order_average

						FROM get_customer_category_rec_order_average AS b

						WHERE
							b.category_id = a.category_id
								AND 
							b.customer_id = a.customer_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   

					BEGIN 

						WITH get_customer_category_rec_order_halfaverage AS (
							SELECT 
								  a.customer_id
								, a.category_id
								, ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY a.halfaverage_rental_count DESC, b.total_rentals DESC ) as recommendation_order_halfaverage

							FROM vdm1_data.customer_category AS a
								INNER JOIN vdm1_data.category_popularity AS b 
									ON b.category_id = a.category_id
						)

						UPDATE vdm1_data.customer_category AS a

						SET 
							recommendation_order_halfaverage = b.recommendation_order_halfaverage

						FROM get_customer_category_rec_order_halfaverage AS b

						WHERE
							b.category_id = a.category_id
								AND 
							b.customer_id = a.customer_id;

					END;
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   
				
					BEGIN 

						UPDATE vdm1_data.customer_category
						
						SET
							recommendation_order_customer_preference = recommendation_order_historical
							
						WHERE 
							category_id = category_id 
								AND 
							customer_id = customer_id;
					
					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   
				
					BEGIN 

						WITH get_customer_custom_rec_preferences AS (
							
							SELECT
								customer_id
								, category_id
								, customer_rec_custom_order
								, customer_rec_custom_amount
							FROM
								vdm1_data.customer_rec_custom_preferences

						)
						
						UPDATE vdm1_data.customer_category AS a
						
						SET
							recommendation_order_customer_preference = b.customer_rec_custom_order
							
						FROM 
							get_customer_custom_rec_preferences AS b
							
						WHERE
							b.category_id = a.category_id
								AND 
							b.customer_id = a.customer_id;
		
					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####     
				
				RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   
			
			END;
		$trigger_function_insert_new_category$;
		';
		-- #### #### #### #### #### #### #### #### 
        
    END;
$vdm1_stage5_trigger_functions_setup_insert_new_category$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incust()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_insert_new_customer$

	BEGIN

		EXECUTE
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_insert_new_customer()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_insert_new_customer$
			
			BEGIN 

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   			    

					BEGIN 

						INSERT INTO vdm1_data.dictkey_customer_details (
								customer_id
							, store_id
							, first_name
							, last_name
							, email
							, create_date
							, activebool
							, phone
							, city_id
							, country_id
							, customer_full_name						
						)

						SELECT 
							a.customer_id
							, a.store_id
							, a.first_name
							, a.last_name
							, a.email
							, a.create_date
							, a.activebool
							, vdm1_data.f_transform_customer_phone_e164(b.phone :: VARCHAR) AS phone
							, b.city_id
							, c.country_id
							, vdm1_data.f_transform_customer_full_name(a.first_name :: VARCHAR, a.last_name :: VARCHAR) AS customer_full_name
						FROM 
							public.customer AS a 
								LEFT JOIN public.address AS b
									ON b.address_id = a.address_id
								LEFT JOIN public.city AS c
									ON c.city_id = b.city_id

						WHERE 
							a.customer_id = NEW.customer_id;
						
					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####     									
				
					BEGIN 
					
							INSERT INTO vdm1_data.customer_category (
								customer_id
								, category_id
							)

							SELECT
								a.customer_id
								, b.category_id
							FROM 
								public.customer a
									CROSS JOIN 
										vdm1_data.dictkey_category b 

							WHERE
								a.customer_id = NEW.customer_id;

					END;
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   
			
					BEGIN 

						UPDATE vdm1_data.customer_category
						
						SET
							historical_rental_count = 0
							, average_rental_count = 0
							, halfaverage_rental_count = 0
							
							, recommendation_order_historical = null
							, recommendation_order_average = null
							, recommendation_order_halfaverage = null
							, recommendation_order_customer_preference = null
							
						WHERE
							customer_id = NEW.customer_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   
				
					BEGIN 

						WITH calc_recommendation_order_default AS (

							SELECT
								category_id	
								, ROW_NUMBER() OVER (ORDER BY total_rentals DESC) AS recommendation_order_default
							FROM 
								vdm1_data.category_popularity
						)
						
						UPDATE vdm1_data.customer_category AS a
						
						SET
							recommendation_order_historical = b.recommendation_order_default
							, recommendation_order_average = b.recommendation_order_default
							, recommendation_order_halfaverage = b.recommendation_order_default
							, recommendation_order_customer_preference = b.recommendation_order_default
							
						FROM 
							calc_recommendation_order_default AS b
						
						WHERE
							a.customer_id = NEW.customer_id
								AND
							b.category_id = a.category_id;
				
					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   

					BEGIN 

						INSERT INTO vdm1_data.customer_reclist_master_nonspecific (
							
							  customer_id
							, category_id
							, film_rec_order
							, film_id
						)
						
						SELECT
							customer_id
							, category_id
							, film_rank AS film_rec_order
							, film_id
							
						FROM
							public.customer
								CROSS JOIN
									vdm1_data.film_category_popularity
						
						WHERE
							customer_id = NEW.customer_id;

					END;
					
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####       
				
					BEGIN 

						INSERT INTO vdm1_data.customer_reclist_master_specific (
							
							customer_id
							, cat_rec_order
							, category_id
							, rental_rec_order
							, film_id
						)
						
						WITH combined_master_with_cxcat AS (

							SELECT 
								  a.customer_id
								, CASE
									WHEN EXISTS (SELECT b.customer_id FROM vdm1_data.customer_rec_custom_preferences b where b.customer_id = a.customer_id)
										THEN b.recommendation_order_customer_preference
									ELSE b.recommendation_order_historical
								END as cat_rec_order 
								, a.category_id			
								, c.film_category_rank AS rental_rec_order
								, a.film_id

							FROM 
								vdm1_data.customer_reclist_master_nonspecific AS a
									LEFT JOIN 
										vdm1_data.customer_category AS b
											ON a.customer_id = b.customer_id
									LEFT JOIN 
										vdm1_data.film_category_popularity AS c
											ON a.film_id = c.film_id

							WHERE
								a.customer_id = NEW.customer_id
									AND
								(b.customer_id = a.customer_id
									AND
								b.category_id = a.category_id)
									AND
								b.recommendation_order_historical IN (
									SELECT recommendation_order_historical
										FROM 
									vdm1_data.customer_category)

							ORDER BY
								a.customer_id, 2, c.film_category_rank DESC
						)

						SELECT
							customer_id
							, cat_rec_order
							, category_id 
							, rental_rec_order
							, film_id
						FROM 
							combined_master_with_cxcat

						WHERE
							customer_id = NEW.customer_id;

					END;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####       
				
				RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   
			
			END;
		$trigger_function_insert_new_customer$;
		';
    END;
$vdm1_stage5_trigger_functions_setup_insert_new_customer$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_infilm()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_insert_new_film$

	BEGIN

		EXECUTE
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_insert_new_film()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_insert_new_film$
			

			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						INSERT INTO vdm1_data.dictkey_film_details (
							film_id
							, title
							, category_id
							, release_year
							, language_id
							, length
							, rating
							, description
							, rental_duration
							, rental_rate
							, replacement_cost
							, new_release
						)

						SELECT
							a.film_id
							, a.title
							, NEW.category_id
							, a.release_year
							, a.language_id
							, vdm1_data.f_transform_filmlength_int2vchar(a.length :: INT) AS length
							, a.rating
							, a.description
							, a.rental_duration
							, a.rental_rate
							, a.replacement_cost
							, true

						FROM public.film AS a
						
						WHERE
							a.film_id = NEW.film_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
                
					BEGIN 

						INSERT INTO vdm1_data.new_releases(
							film_id
						, status
						, created_date
						) VALUES ( 
							NEW.film_id
						, true
						, default
						);

					END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  
                
					BEGIN 

						UPDATE vdm1_data.inventory_maintenance

						SET
							new_release = true

						WHERE 
							film_id = NEW.film_id;

					END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
                
					BEGIN 

						INSERT INTO vdm1_data.film_category_popularity (
							film_id
							, category_id
							, total_rentals 
							, new_release
						) VALUES (
							NEW.film_id
							, NEW.category_id
							, 0
							, true
						);

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
                
					BEGIN 

						WITH generate_film_category_rank AS (
							SELECT
								  film_id
								, category_id
								, ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY total_rentals DESC) AS film_category_rank
							FROM
								vdm1_data.film_category_popularity
						)
						, generate_film_rank AS (
							SELECT
								film_id
								, ROW_NUMBER() OVER (ORDER BY total_rentals DESC) AS film_rank
							FROM
								vdm1_data.film_category_popularity
						)
						, combined_aggrate_ranks AS (
							
							SELECT
								  a.film_id
								, b.film_rank
								, c.film_category_rank
							FROM 
								vdm1_data.film_category_popularity AS a
							LEFT JOIN
								generate_film_rank AS b
									ON a.film_id = b.film_id
							LEFT JOIN
								generate_film_category_rank AS c
									ON a.film_id = c.film_id
						)

						UPDATE vdm1_data.film_category_popularity AS a
						
						SET
							  film_rank = b.film_rank
							, film_category_rank = b.film_category_rank
							
						FROM 
							combined_aggrate_ranks AS b
			
						WHERE
							a.film_id = b.film_id;
                
					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  
				
				RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  
			
			END;
		
		$trigger_function_insert_new_film$;
		';

    END; 
$vdm1_stage5_trigger_functions_setup_insert_new_film$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ininv()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_insert_new_inventory$

	BEGIN

		EXECUTE
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_insert_new_inventory()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_insert_new_inventory$
			
			BEGIN
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
						
					BEGIN 

						INSERT INTO vdm1_data.inventory_maintenance (
							film_id
							, inventory_id
							, life_cycle
							, new_release
							, inspect_flag
							, maintenance_complete_flag
						)
						
						VALUES (
							
							NEW.film_id
							, NEW.inventory_id
							, 0
							, false -- NEW RELEASE FLAG
							, false -- INSPECT FLAG
							, false -- MAINTENANCE COMPLETE FLAG
						); 
			
					END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
				
				RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
			END;
		$trigger_function_insert_new_inventory$;
		';	

    END;
$vdm1_stage5_trigger_functions_setup_insert_new_inventory$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_iucrcp()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_insert_update_customer_rec_custom_preferences$

	BEGIN

		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_insert_update_customer_rec_custom_preferences()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_insert_update_customer_rec_custom_preferences$

			BEGIN

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

				-- FOR INSERT OR UPDATE TO CUSTOMER REC CUSTOM PREFERENCE

					BEGIN 

						UPDATE vdm1_data.customer_category

						SET 
							recommendation_order_customer_preference = null

						WHERE
							customer_id = NEW.customer_id;

					END;
		
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
		
					BEGIN 

						WITH get_customer_rec_custom_preferences AS (

							SELECT
									customer_id
								, category_id 
								, customer_rec_custom_order
							FROM
								vdm1_data.customer_rec_custom_preferences

							WHERE 
								customer_id = NEW.customer_id
						)

						UPDATE vdm1_data.customer_category AS a 

						SET 
							recommendation_order_customer_preference = b.customer_rec_custom_order
						
						FROM 
							get_customer_rec_custom_preferences AS b 

						WHERE
							a.customer_id = b.customer_id
								AND 
							a.category_id = b.category_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
		
					BEGIN 

						UPDATE vdm1_data.customer_reclist_master_specific

						SET 
							cat_rec_order = null

						WHERE
							customer_id = NEW.customer_id;

					END;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
		
					BEGIN 

						WITH get_customer_category_details AS (

							SELECT
									customer_id
								, category_id 
								, recommendation_order_customer_preference as cat_rec_order
							FROM
								vdm1_data.customer_category

							WHERE 
								customer_id = NEW.customer_id
						)

						UPDATE vdm1_data.customer_reclist_master_specific AS a 

						SET 
							cat_rec_order = b.cat_rec_order
						
						FROM 
							get_customer_category_details AS b 

						WHERE
							a.customer_id = b.customer_id
								AND 
							a.category_id = b.category_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN

                        TRUNCATE TABLE vdm1_data.customer_reclist_summary_specific;

                    END;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					RETURN NEW;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

			END;
		$trigger_function_insert_update_customer_rec_custom_preferences$;
		';

    END;
$vdm1_stage5_trigger_functions_setup_insert_update_customer_rec_custom_preferences$; 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_drcrcp()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_delete_reset_customer_rec_custom_preferences$

	BEGIN

		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_delete_reset_customer_rec_custom_preferences()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_delete_reset_customer_rec_custom_preferences$

			BEGIN

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN

						UPDATE vdm1_data.customer_category

						SET 
							recommendation_order_customer_preference = null

						WHERE
							customer_id = OLD.customer_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						WITH get_customer_category_details AS (

							SELECT
									customer_id
								, category_id 
								, recommendation_order_historical
							FROM
								vdm1_data.customer_category

							WHERE
								customer_id = OLD.customer_id

						)

						UPDATE vdm1_data.customer_category AS a 

						SET 
							recommendation_order_customer_preference = b.recommendation_order_historical

						FROM
							get_customer_category_details AS b

						WHERE
							a.customer_id = b.customer_id
								AND 
							a.category_id = b.category_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

					BEGIN 

						UPDATE vdm1_data.customer_reclist_master_specific

						SET 
							cat_rec_order = null

						WHERE
							customer_id = OLD.customer_id;

					END;
		
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						WITH get_customer_category_details AS (

							SELECT
									customer_id
								, category_id 
								, recommendation_order_historical as cat_rec_order
							FROM
								vdm1_data.customer_category

							WHERE 
								customer_id = OLD.customer_id
						)

						UPDATE vdm1_data.customer_reclist_master_specific AS a 

						SET 
							cat_rec_order = b.cat_rec_order
						
						FROM 
							get_customer_category_details AS b 

						WHERE
							a.customer_id = b.customer_id
								AND 
							a.category_id = b.category_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN

                        TRUNCATE TABLE vdm1_data.customer_reclist_summary_specific;

                    END;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					RETURN NEW;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

			END;
		$trigger_function_delete_reset_customer_rec_custom_preferences$;
		';


    END;
$vdm1_stage5_trigger_functions_setup_delete_reset_customer_rec_custom_preferences$; 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucatpop()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_category_popularity$

	BEGIN

		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_category_popularity()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_update_category_popularity$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
			
					BEGIN 

						UPDATE vdm1_data.category_popularity
						
						SET
							total_rentals = total_rentals + 1
							
						WHERE
							category_id = NEW.category_id;

					END;
					
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
				
					RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
				
			END;
		$trigger_function_update_category_popularity$;

		';

    END;
$vdm1_stage5_trigger_functions_setup_update_category_popularity$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucustcat()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_customer_category$

	BEGIN


		EXECUTE
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_customer_category()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_update_customer_category$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
			
					BEGIN 

						UPDATE vdm1_data.customer_category
						
						SET
							recommendation_order_historical = null,
							recommendation_order_average = null,
							recommendation_order_halfaverage = null
							
						WHERE
							customer_id = NEW.customer_id;

					END;
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  
				
					BEGIN 

						UPDATE vdm1_data.customer_category
						
						SET
							historical_rental_count = historical_rental_count + 1,
							average_rental_count = average_rental_count + 1,
							halfaverage_rental_count = halfaverage_rental_count +1
							
						WHERE 
							customer_id = NEW.customer_id
								AND
							category_id = NEW.category_id;

					END;
					
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
				
					BEGIN 

						WITH get_customer_category_rec_order_historical AS (

							SELECT 
								a.customer_id
								, a.category_id
								, ROW_NUMBER() OVER (ORDER BY a.historical_rental_count DESC, b.total_rentals DESC) as recommendation_order_historical

							FROM vdm1_data.customer_category AS a
								INNER JOIN vdm1_data.category_popularity AS b 
									ON b.category_id = a.category_id
							
							WHERE
								a.customer_id = NEW.customer_id
						)

						UPDATE vdm1_data.customer_category a

						SET 
							recommendation_order_historical = b.recommendation_order_historical

						FROM get_customer_category_rec_order_historical AS b

						WHERE
							a.customer_id = b.customer_id
								AND
							a.category_id = b.category_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

					BEGIN 

						WITH get_customer_category_rec_order_average AS (
							SELECT 
								a.customer_id
								, a.category_id
								, ROW_NUMBER() OVER (ORDER BY a.average_rental_count DESC, b.total_rentals DESC) as recommendation_order_average

							FROM vdm1_data.customer_category AS a
								INNER JOIN vdm1_data.category_popularity AS b
									ON b.category_id = a.category_id
							
							WHERE
								a.customer_id = NEW.customer_id
						)

						UPDATE vdm1_data.customer_category a

						SET 
							recommendation_order_average = b.recommendation_order_average

						FROM get_customer_category_rec_order_average AS b

						WHERE
							a.customer_id = b.customer_id
								AND
							a.category_id = b.category_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						WITH get_customer_category_rec_order_halfaverage AS (
							SELECT 
								a.customer_id
								, a.category_id
								, ROW_NUMBER() OVER (ORDER BY a.halfaverage_rental_count DESC, b.total_rentals DESC ) as recommendation_order_halfaverage

							FROM vdm1_data.customer_category AS a
								INNER JOIN vdm1_data.category_popularity AS b 
									ON b.category_id = a.category_id
							
							WHERE
								a.customer_id = NEW.customer_id
						)

						UPDATE vdm1_data.customer_category a

						SET 
							recommendation_order_halfaverage = b.recommendation_order_halfaverage

						FROM get_customer_category_rec_order_halfaverage AS b

						WHERE
							a.customer_id = b.customer_id
								AND
							a.category_id = b.category_id;

					END;
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  
				
					BEGIN 

						UPDATE vdm1_data.customer_category
						
						SET
							recommendation_order_customer_preference = recommendation_order_historical
							
						WHERE 
							customer_id = NEW.customer_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
				
					BEGIN 

						WITH get_customer_custom_rec_preferences AS (
							
							SELECT
								customer_id
								, category_id
								, customer_rec_custom_order
								, customer_rec_custom_amount
							FROM
								vdm1_data.customer_rec_custom_preferences
						
							WHERE
								customer_id = NEW.customer_id
						)
						
						UPDATE vdm1_data.customer_category AS a
						
						SET
							recommendation_order_customer_preference = b.customer_rec_custom_order
							
						FROM 
							get_customer_custom_rec_preferences AS b
							
						WHERE
							a.customer_id = b.customer_id
								AND
							a.category_id = b.category_id;

					END;
					
                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
				
				RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
				
			END;
		$trigger_function_update_customer_category$;
		';

    END;
$vdm1_stage5_trigger_functions_setup_update_customer_category$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_customer_reclist_master_nonspecific$

	BEGIN
		EXECUTE
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_customer_reclist_master_nonspecific_new_rental()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_update_customer_reclist_master_nonspecific$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  	
				
					BEGIN 

						DELETE FROM vdm1_data.customer_reclist_master_nonspecific
						
						WHERE
							customer_id = NEW.customer_id
								AND
							film_id = NEW.film_id;

					END;
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  
				
					RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  		

			END;
		$trigger_function_update_customer_reclist_master_nonspecific$;
		';
    
    END;
$vdm1_stage5_trigger_functions_setup_update_customer_reclist_master_nonspecific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non_nr()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_customer_reclist_master_nonspecific$

	BEGIN
		EXECUTE
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_customer_reclist_master_nonspecific_ru()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_update_customer_reclist_master_nonspecific$
			
			BEGIN 

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 	
				
					BEGIN 

						UPDATE vdm1_data.customer_reclist_master_nonspecific
						
						SET
							film_rec_order = null;

					END;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 	
				
					BEGIN 

						WITH get_film_category_details AS (

							SELECT 
								category_id
								, film_id
								, film_rank
							FROM 
								vdm1_data.film_category_popularity

						)
                        , get_category_popularity_details AS (

							SELECT 
								  category_id
                                , total_rentals
							FROM 
								vdm1_data.category_popularity

						)
						, get_customer_reclist_master_nonspecific_values AS (

							SELECT
								  customer_id
								, category_id
								, film_id
							FROM vdm1_data.customer_reclist_master_nonspecific

						)
                        , assign_row_number AS (

							SELECT
								  a.customer_id
								, a.category_id
								, ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY b.film_rank, c.total_rentals) as rental_rec_order_rn
								, a.film_id
							
							FROM 
								get_customer_reclist_master_nonspecific_values AS a
									LEFT JOIN 
										get_film_category_details AS b
											ON a.film_id = b.film_id
									LEFT JOIN 
										get_category_popularity_details AS c
											ON a.category_id = c.category_id
						)
						
						UPDATE vdm1_data.customer_reclist_master_nonspecific AS a
						
						SET
							film_rec_order = b.rental_rec_order_rn
							
						FROM
							assign_row_number AS b
							
						WHERE
							(a.customer_id = b.customer_id
								AND
							a.film_id = b.film_id);

					END;
					
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 	
				
					RETURN NEW;
				
                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 	

			END;
		$trigger_function_update_customer_reclist_master_nonspecific$;
		';
    
    END;
$vdm1_stage5_trigger_functions_setup_update_customer_reclist_master_nonspecific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    12     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_customer_reclist_master_specific$

	BEGIN
		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_customer_reclist_master_specific_new_rental()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_update_customer_reclist_master_specific$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 	
				
					BEGIN 

						DELETE FROM vdm1_data.customer_reclist_master_specific
						
						WHERE
							customer_id = NEW.customer_id
								AND
							film_id = NEW.film_id;

					END;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 	
				
					RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 			

				
			END;
		$trigger_function_update_customer_reclist_master_specific$;
		';

    END;
$vdm1_stage5_trigger_functions_setup_update_customer_reclist_master_specific$;
		
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe_ru()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_customer_reclist_master_specific$

	BEGIN
		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_customer_reclist_master_specific_new_rental_ru()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_update_customer_reclist_master_specific$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 	
				
					BEGIN 

						UPDATE vdm1_data.customer_reclist_master_specific
						
						SET
							  rental_rec_order = null
                            , cat_rec_order = null;

					END;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 		
				
					BEGIN 

						WITH get_film_category_details AS (

							SELECT 
								  category_id
								, film_id
								, film_category_rank
							FROM 
								vdm1_data.film_category_popularity

						)
						, get_category_popularity AS (

							SELECT 
								  category_id
								, total_rentals
							FROM 
								vdm1_data.category_popularity

						)
						, get_customer_reclist_master_specific_values AS (

							SELECT
								  customer_id
								, category_id
								, film_id
							FROM 
								vdm1_data.customer_reclist_master_specific  
						)
                        , get_customer_category AS (
						
							SELECT
								  a.customer_id
								, a.category_id
								, CASE
									WHEN EXISTS (SELECT b.customer_id FROM vdm1_data.customer_rec_custom_preferences AS b WHERE a.customer_id = b.customer_id)
									THEN a.recommendation_order_customer_preference
								ELSE a.recommendation_order_historical
							-- ELSE b.recommendation_order_average
							-- ELSE b.recommendation_order_halfaverage
								END AS cat_rec_order 
							FROM 
								vdm1_data.customer_category AS a
                        )
                        , assign_cat_rec_order AS (

                            SELECT
								  a.customer_id
								, b.cat_rec_order
								, a.category_id
								, a.film_id
                            FROM 
                                get_customer_reclist_master_specific_values AS a

                                    LEFT JOIN 
                                        get_customer_category AS b
                                            ON a.customer_id = b.customer_id 
                                                AND
                                               a.category_id = b.category_id

                        )
                        , assign_row_number AS (

							SELECT
								  a.customer_id
								, a.cat_rec_order
								, a.category_id
								, ROW_NUMBER() OVER (PARTITION BY a.customer_id, a.cat_rec_order ORDER BY b.film_category_rank, c.total_rentals) as rental_rec_order_rn
								, a.film_id
							
							FROM assign_cat_rec_order AS a 
								LEFT JOIN 
									get_film_category_details AS b
										ON a.film_id = b.film_id
                                LEFT JOIN 
                                    get_category_popularity AS c 
                                        ON a.category_id = c.category_id
						)
						
						UPDATE vdm1_data.customer_reclist_master_specific AS a
						
						SET
                              cat_rec_order = b.cat_rec_order
							, rental_rec_order = b.rental_rec_order_rn
							
						FROM
							assign_row_number AS b
							
						WHERE
							(a.customer_id = b.customer_id
								AND
							a.film_id = b.film_id);

					END;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 		
				
					RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 			

				
			END;
		$trigger_function_update_customer_reclist_master_specific$;
		';

    END;
$vdm1_stage5_trigger_functions_setup_update_customer_reclist_master_specific$;
		
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    14     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_non()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_customer_reclist_summary_nonspecific$

    BEGIN 

		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_nonspecific()
			RETURNS TRIGGER 
			LANGUAGE plpgsql
			AS $trigger_function_update_customer_reclist_summary_nonspecific$


			BEGIN 

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

                    BEGIN 
                        
                        TRUNCATE TABLE vdm1_data.customer_reclist_summary_nonspecific;

                    END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

				RETURN NEW;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

			END;
		$trigger_function_update_customer_reclist_summary_nonspecific$;
		';

    END;
$vdm1_stage5_trigger_functions_setup_update_customer_reclist_summary_nonspecific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    15     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_non_ru()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_customer_reclist_summary_nonspecific$

    BEGIN 

		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_nonspecific_ru()
			RETURNS TRIGGER 
			LANGUAGE plpgsql
			AS $trigger_function_update_customer_reclist_summary_nonspecific$


			BEGIN 

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN

						INSERT INTO vdm1_data.customer_reclist_summary_nonspecific (

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
								vdm1_data.customer_reclist_master_nonspecific	

                        	WHERE
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

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

				RETURN NEW;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

			END;
		$trigger_function_update_customer_reclist_summary_nonspecific$;
		';

    END;
$vdm1_stage5_trigger_functions_setup_update_customer_reclist_summary_nonspecific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    16     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_spe()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_customer_reclist_summary_specific$

    
    BEGIN

		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####		

		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_specific()
			RETURNS TRIGGER 
			LANGUAGE plpgsql
			AS $trigger_function_update_customer_reclist_summary_specific$


			BEGIN 

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN

                        TRUNCATE TABLE vdm1_data.customer_reclist_summary_specific;

                    END;


				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

				RETURN NEW;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

				END;
		$trigger_function_update_customer_reclist_summary_specific$;
		';
		
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####		
    END;
$vdm1_stage5_trigger_functions_setup_update_customer_reclist_summary_specific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    17     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrls_spe_ru()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_customer_reclist_summary_specific$

    
    BEGIN

		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####		

		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_specific_ru()
			RETURNS TRIGGER 
			LANGUAGE plpgsql
			AS $trigger_function_update_customer_reclist_summary_specific$


			BEGIN 

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						INSERT INTO vdm1_data.customer_reclist_summary_specific (

							  customer_id
							, cat_rec_order
							, rental_rec_order
							, film_id
							, category_id
						)


						WITH get_customer_reclist_summary_specific_topten_filmcat AS (
							
							SELECT
								  customer_id
								, cat_rec_order
								, rental_rec_order
								, film_id
								, category_id
							
							FROM
								vdm1_data.customer_reclist_master_specific	

							WHERE
								(rental_rec_order <= 10
									AND
								cat_rec_order <= 10)

							ORDER BY
								customer_id, cat_rec_order, rental_rec_order

						)
						, cat_rec_order_second_pass AS (

							SELECT
								customer_id
								, cat_rec_order
								, DENSE_RANK() OVER (ORDER BY cat_rec_order) AS cat_rec_second_pass_order
								, rental_rec_order
								, film_id
								, category_id
							FROM 
								get_customer_reclist_summary_specific_topten_filmcat
								
							ORDER BY
								customer_id, cat_rec_second_pass_order, rental_rec_order
						)
						, get_first_cat_films AS (

							SELECT 
								customer_id
								, cat_rec_second_pass_order
								, rental_rec_order
								, film_id
								, category_id
							FROM 
								cat_rec_order_second_pass
							
							WHERE
								cat_rec_second_pass_order = 1
                            		AND
								rental_rec_order <= 5
						)
						, get_second_cat_films AS (

							SELECT 
								customer_id
								, cat_rec_second_pass_order
								, rental_rec_order
								, film_id
								, category_id
							FROM 
								cat_rec_order_second_pass
							
							WHERE
								cat_rec_second_pass_order = 2
									AND
								rental_rec_order <= 4
						)
						, get_third_cat_films AS (

							SELECT 
								customer_id
								, cat_rec_second_pass_order
								, rental_rec_order
								, film_id
								, category_id
							FROM 
								cat_rec_order_second_pass
							
							WHERE
								cat_rec_second_pass_order = 3
									AND
								rental_rec_order <= 3
						)
						, get_forth_cat_films AS (

							SELECT 
								customer_id
								, cat_rec_second_pass_order
								, rental_rec_order
								, film_id
								, category_id
							FROM 
								cat_rec_order_second_pass
							
							WHERE
								cat_rec_second_pass_order = 4
									AND
								rental_rec_order <= 2
						)
						, get_fifth_cat_films AS (

							SELECT 
								customer_id
								, cat_rec_second_pass_order
								, rental_rec_order
								, film_id
								, category_id
							FROM 
								cat_rec_order_second_pass
							
							WHERE
								cat_rec_second_pass_order = 5
									AND 
								rental_rec_order <= 1
						)
						, build_list AS (
							
							(
								SELECT
									customer_id
									, cat_rec_second_pass_order
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
									, cat_rec_second_pass_order
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
									, cat_rec_second_pass_order
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
									, cat_rec_second_pass_order
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
									, cat_rec_second_pass_order
									, rental_rec_order
									, film_id
									, category_id
								FROM
									get_fifth_cat_films
							)
						)

						SELECT
							customer_id
							, cat_rec_second_pass_order
							, rental_rec_order
							, film_id
							, category_id

						FROM   
							build_list;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

				RETURN NEW;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

				END;
		$trigger_function_update_customer_reclist_summary_specific$;
		';
		
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####		
    END;
$vdm1_stage5_trigger_functions_setup_update_customer_reclist_summary_specific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    18     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_upcxwatchhist()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_customer_watch_history$

    
    BEGIN
		
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####		
		
		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_insert_customer_watch_history()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_insert_customer_watch_history$
			
			BEGIN
			
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####		

					-- Setting Customer Watch History Order To Null.
						
					BEGIN

						UPDATE vdm1_data.customer_watch_history_detailed
						
						SET
							customer_watch_history_desc_order = null
							
						WHERE
							customer_id = NEW.customer_id;
			
					END;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  
				
					BEGIN
				
						INSERT INTO vdm1_data.customer_watch_history_detailed(
							customer_id
							, rental_id
							, inventory_id
							, film_id
							, category_id
							, rental_date 
							, return_date
						)

						SELECT 
							a.customer_id
							, a.rental_id
							, a.inventory_id
							, b.film_id
							, c.category_id
							, a.rental_date
							, a.return_date
						
						FROM public.rental a
							INNER JOIN public.inventory b
								ON b.inventory_id = a.inventory_id

								INNER JOIN vdm1_data.dictkey_film_details c
									ON c.film_id = b.film_id

						WHERE
							a.customer_id = NEW.customer_id
								AND 
							a.rental_id = NEW.rental_id;

					END;
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  
				
					BEGIN 

						WITH get_customer_watch_history AS (

							SELECT
								customer_id
								, rental_id
								, inventory_id
								, film_id 
								, category_id
								, rental_date 
								, return_date 
							FROM 
								vdm1_data.customer_watch_history_detailed

							WHERE
								customer_id = NEW.customer_id
						),
						assign_watch_history_order_row_number AS (

							SELECT
								customer_id
								, rental_id
								, inventory_id
								, film_id 
								, category_id
								, rental_date 
								, return_date 
								, ROW_NUMBER() OVER (ORDER BY rental_id DESC) AS customer_watch_history_desc_order_row_number
							FROM 
								get_customer_watch_history
						)

						UPDATE vdm1_data.customer_watch_history_detailed AS a

						SET customer_watch_history_desc_order = b.customer_watch_history_desc_order_row_number

						FROM assign_watch_history_order_row_number AS b

						WHERE 
							b.customer_id = a.customer_id
								AND
							b.rental_id = a.rental_id;

					END;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  	
				
				RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####		
			END;
		$trigger_function_insert_customer_watch_history$;
		';

		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####		
    END;
$vdm1_stage5_trigger_functions_setup_update_customer_watch_history$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    19     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ufcp_nr()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_film_category_popularity_with_new_rental$

    
    BEGIN
		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_film_category_popularity_new_rental()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_update_film_category_popularity_with_new_rental$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####		
			
					BEGIN 

						UPDATE vdm1_data.film_category_popularity
						
						SET
							total_rentals = total_rentals + 1
							
						WHERE
							film_id = NEW.film_id;

					END;
					
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

					BEGIN 

						UPDATE vdm1_data.film_category_popularity
				
						SET
							film_rank = null;

					END;
					
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
				
					BEGIN 

						WITH generate_film_rank AS (
							SELECT
								film_id
								, ROW_NUMBER() OVER (ORDER BY total_rentals DESC) AS film_rank
							FROM
								vdm1_data.film_category_popularity
						)
						
						UPDATE vdm1_data.film_category_popularity AS a
						
						SET
							film_rank = b.film_rank
						
						FROM
							generate_film_rank AS b
							
						WHERE
							b.film_id = a.film_id;

					END;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  
				
					BEGIN 
						
						UPDATE vdm1_data.film_category_popularity
				
						SET
							film_category_rank = null
					
						WHERE
							category_id = NEW.category_id;

					END;
					
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
				
					BEGIN 

						WITH generate_film_category_rank AS (
							SELECT
								film_id
								, category_id
								, ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY total_rentals DESC) AS film_category_rank
							FROM
								vdm1_data.film_category_popularity
						)
						
						UPDATE vdm1_data.film_category_popularity AS a
						
						SET
							film_category_rank = b.film_category_rank
						
						FROM
							generate_film_category_rank AS b
							
						WHERE
							b.film_id = a.film_id		
								AND
							b.category_id = a.category_id;
						
					END;
					
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
				
					RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####		
				
			END;
		$trigger_function_update_film_category_popularity_with_new_rental$;
		';

    END;
$vdm1_stage5_trigger_functions_setup_update_film_category_popularity_with_new_rental$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    20     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_uinv_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_inventory_maintenance$

    
    BEGIN
		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_inventory_maintenance_count()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_update_inventory_maintenance$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

					BEGIN 

						UPDATE vdm1_data.inventory_maintenance
				
						SET
							life_cycle = life_cycle + 1
					
						WHERE
							inventory_id = NEW.inventory_id;
					
					END;
					
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 
				
						UPDATE vdm1_data.inventory_maintenance
				
						SET
							inspect_flag = true
					
						WHERE
							inventory_id = NEW.inventory_id
								AND
							(
								(life_cycle % 5 = 0)
									AND
								(maintenance_complete_flag = false)
							);

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  
				
					RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 	
			
			END;
		$trigger_function_update_inventory_maintenance$;
		';

    END;
$vdm1_stage5_trigger_functions_setup_update_inventory_maintenance$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    21     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_unewr()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_new_release$

    BEGIN

		EXECUTE
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_new_release_status_delete_from_nr_table()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_update_new_releases$

			BEGIN 
			
                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN

                		UPDATE vdm1_data.film_category_popularity

                		SET
                    		new_release = false

                		WHERE
                    		film_id = OLD.film_id;

					END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN

                		DELETE FROM vdm1_data.new_releases

                		WHERE
                    		film_id = OLD.film_id;

					END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                RETURN NEW;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

			END;
		$trigger_function_update_new_releases$;
		';

    END;
$vdm1_stage5_trigger_functions_setup_update_new_release$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    22     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_urr()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_rental_return$

    
    BEGIN
		EXECUTE
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_rental_return_date_delete_from_fr_table()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_update_rental_return$

			BEGIN 
			
			
			-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

				BEGIN 
					
					UPDATE vdm1_data.customer_watch_history_detailed

					SET
						return_date = NEW.return_date

					WHERE
						rental_id = OLD.rental_id;

				END;

			-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

				BEGIN 
				
					DELETE FROM vdm1_data.failed_returns

					WHERE
						rental_id = OLD.rental_id;

				END;

			-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

			RETURN NEW;

			-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

			END;
		$trigger_function_update_rental_return$;
		';
		-- #### #### #### #### #### #### #### #### 
    END;
$vdm1_stage5_trigger_functions_setup_update_rental_return$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    23     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_non_inf()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_insert_customer_reclist_master_nonspecific_with_new_film$

    
    BEGIN
		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_insert_customer_reclist_master_nonspecific_new_film()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_insert_customer_reclist_master_nonspecific_with_new_film$

			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
                
					BEGIN 

						INSERT INTO vdm1_data.customer_reclist_master_nonspecific (

							  customer_id 
							, category_id
							, film_id
							, film_rec_order
						)


						WITH get_film_category_details AS (

							SELECT 
								category_id
								, film_id
							FROM 
								vdm1_data.film_category_popularity

							WHERE 
								film_id = NEW.film_id
						)
						, get_customers_list AS (

							SELECT
								customer_id
							FROM
								vdm1_data.dictkey_customer_details
						)
						, combined_film_category_with_customers AS (

							SELECT
								  b.customer_id
								, a.category_id
								, a.film_id

							FROM
								get_film_category_details AS a 
									CROSS JOIN
										get_customers_list AS b 
						)

						SELECT 
							  customer_id
							, category_id
							, film_id
							, 0

						FROM 
							combined_film_category_with_customers;

					END;
                
                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   
                
                RETURN NEW;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
            END;
        
        $trigger_function_insert_customer_reclist_master_nonspecific_with_new_film$;
            ';

    END;
$vdm1_stage5_trigger_functions_setup_insert_customer_reclist_master_nonspecific_with_new_film$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    24     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_ucrlm_spe_inf()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_insert_customer_reclist_master_specific_with_new_film$

    
    BEGIN
		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_insert_customer_reclist_master_specific_new_film()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_insert_customer_reclist_master_specific_with_new_film$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						INSERT INTO vdm1_data.customer_reclist_master_specific (

							  customer_id
							, cat_rec_order
							, category_id
							, film_id
							, rental_rec_order
						)

						WITH get_film_category_details AS (

							SELECT 
								  category_id
								, film_id
							FROM 
								vdm1_data.film_category_popularity

							WHERE 
								film_id = NEW.film_id
						)
						, get_customers_list AS (

							SELECT
								customer_id
							FROM
								vdm1_data.dictkey_customer_details
						)
						, combined_customer_list_to_film_category_details AS (
							
							SELECT 
								  customer_id 
								, category_id 
								, film_id
							FROM 
								get_customers_list
									CROSS JOIN 
										get_film_category_details
						
						) 
						, get_customer_category_details AS (
						
							SELECT 
								  customer_id 
								, category_id
								, recommendation_order_historical
                                -- , recommendation_order_average
                                -- , recommendation_order_halfaverage
                                -- , recommendation_order_customer_preference
								
							FROM 
								vdm1_data.customer_category
						)
						, combined_customer_film_category_with_customer_category AS (
						
							SELECT
								  a.customer_id
								, b.recommendation_order_historical
                                -- , b.recommendation_order_average
                                -- , b.recommendaiton_order_halfaverage
                                -- , b.recommendation_order_customer_preference
								, a.category_id 
								, a.film_id
							FROM 
								combined_customer_list_to_film_category_details AS a 
								
									LEFT JOIN
										get_customer_category_details AS b
											ON a.customer_id = b.customer_id

							
							WHERE
								a.category_id = b.category_id
									AND
								a.customer_id = b.customer_id 
						)

						SELECT 
							  customer_id
							, recommendation_order_historical
                            -- , recommendation_order_average
                            -- , recommendation_order_halfaverage
                            -- , recommendation_order_customer_preference
							, category_id
							, film_id
							, 0

						FROM 
							combined_customer_film_category_with_customer_category;
						
					END;
    
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
				
				RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
	
			END;
		$trigger_function_insert_customer_reclist_master_specific_with_new_film$;
		';

    END;
$vdm1_stage5_trigger_functions_setup_insert_customer_reclist_master_specific_with_new_film$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    25     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_uinv_comp()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_update_inventory_maintenance_complete$

    
    BEGIN
		EXECUTE 
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_update_inventory_maintenance_complete()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_update_inventory_maintenance_complete$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
			
					BEGIN 

						UPDATE vdm1_data.inventory_maintenance
						
						SET
							inspect_flag = false
							
						WHERE
							inventory_id = NEW.inventory_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  
				
				RETURN NEW;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 	
				
			END;
		$trigger_function_update_inventory_maintenance_complete$;
		';

    END;
$vdm1_stage5_trigger_functions_setup_update_inventory_maintenance_complete$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    26     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incity()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_insert_new_city$

	BEGIN

		EXECUTE
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_insert_new_city()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_insert_new_city$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						INSERT INTO vdm1_data.dictkey_city (
							city_id
							, city
						)

						SELECT
							city_id
							, city
						FROM public.city

						WHERE 
							city_id = NEW.city_id;
						
					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						INSERT INTO vdm1_data.dictionary_key (
							dictionary
							, key_id
							, key_name
						)

						SELECT
							''city''
							, city_id
							, city
						FROM public.city

						WHERE 
							city_id = NEW.city_id;

					END;

				-- ### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

				RETURN NEW;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

			END;

		$trigger_function_insert_new_city$';

	END;
$vdm1_stage5_trigger_functions_setup_insert_new_city$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    27     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_incountry()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_insert_new_country$

	BEGIN

		EXECUTE
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_insert_new_country()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_insert_new_country$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						INSERT INTO vdm1_data.dictkey_country (
							  country_id
							, country
						)

						SELECT
							country_id
							, country
						FROM public.country

						WHERE 
							country_id = NEW.country_id;

					END;						

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN 

						INSERT INTO vdm1_data.dictionary_key (
							dictionary
							, key_id
							, key_name
						)

						SELECT
							''country''
							, country_id
							, country
						FROM public.country

						WHERE 
							country_id = NEW.country_id;

					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

				RETURN NEW;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

			END;
		
		$trigger_function_insert_new_country$';
	
	END;

$vdm1_stage5_trigger_functions_setup_insert_new_country$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    28     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_inlanguage()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_insert_new_language$

	BEGIN

		EXECUTE
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_insert_new_language()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_insert_new_language$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN

						INSERT INTO vdm1_data.dictkey_country (
							  language_id
							, name
						)

						SELECT
							  language_id
							, name
						FROM public.language

						WHERE 
							language_id = NEW.language_id;
				
					END;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

					BEGIN

						INSERT INTO vdm1_data.dictionary_key (
							  dictionary
							, key_id
							, key_name
						)

						SELECT
							  ''language''
							, language_id
							, name
						FROM public.language

						WHERE 
							language_id = NEW.language_id;

					END;
				
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

				RETURN NEW;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

			END;
		
		$trigger_function_insert_new_language$';
	
	END;

$vdm1_stage5_trigger_functions_setup_insert_new_language$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    29     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_functions_setup_refreshmviews()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_functions_setup_refresh_materialized_views$

	BEGIN

		EXECUTE
		'
		CREATE OR REPLACE FUNCTION vdm1_data.t_f_refresh_materialized_views()
			RETURNS TRIGGER
			LANGUAGE plpgsql
			AS $trigger_function_refresh_materialized_views$
			
			BEGIN 
			
				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 



                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                -- IF RETURN DATE IS STILL GOING TO BE CALCULATED OFF THE WATCH HISTORY LIST 
                -- THEN WATCH HISTORY MATERIALIZED VIEW NEEDS TO BE UPDATED

                -- IF RETURN DATE IS REMOVED FROM WATCH HISTORY 
                -- THEN REMOVE REFRESH CUSTOMER WATCH HISTORY MATERIALIZED VIEW 
                
                    BEGIN 

                        REFRESH MATERIALIZED VIEW marketing.customer_watch_history_detailed;
                    
                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN 

                        REFRESH MATERIALIZED VIEW marketing.customer_reclist_master_nonspecific;

                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN 

                        REFRESH MATERIALIZED VIEW marketing.customer_reclist_summary_nonspecific;

                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN 

                        REFRESH MATERIALIZED VIEW marketing.customer_reclist_master_specific;
                    
                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

                    BEGIN

                        REFRESH MATERIALIZED VIEW marketing.customer_reclist_summary_specific;

                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

                    BEGIN 

                        REFRESH MATERIALIZED VIEW marketing.film_category_popularity;
                    
                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN 

                        REFRESH MATERIALIZED VIEW marketing.inventory_maintenance_summary;
                    
                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN 

                        REFRESH MATERIALIZED VIEW marketing.new_releases;
                    
                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN

                        REFRESH MATERIALIZED VIEW marketing.failed_returns;

                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN 

                        REFRESH MATERIALIZED VIEW marketing.category_popularity;

                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

                    BEGIN

                        REFRESH MATERIALIZED VIEW marketing.dictionary_key;
                    
                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN

                        REFRESH MATERIALIZED VIEW marketing.dictkey_city;

                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

                    BEGIN
                        
                        REFRESH MATERIALIZED VIEW marketing.dictkey_country;
                    
                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN
                        
                        REFRESH MATERIALIZED VIEW marketing.dictkey_language;
                    
                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN
                    
                        REFRESH MATERIALIZED VIEW marketing.dictkey_film_details; 
                    
                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

                    BEGIN
                    
                        REFRESH MATERIALIZED VIEW marketing.dictkey_customer_details;

                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   

                    BEGIN

                        REFRESH MATERIALIZED VIEW marketing.dictkey_category;

                    END;

                -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

				RETURN NEW;

				-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

			END;
		
		$trigger_function_refresh_materialized_views$';
	
	END;

$vdm1_stage5_trigger_functions_setup_refresh_materialized_views$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    TRIGGERS END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 5b END    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                           

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

--                   1. vdm1_etl.vdm1_stage5_triggers_setup();

--             TRIGGER FUNCTIONS

--                   1. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.RENTAL :: insert_customer_watch_history
--                   2. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.CUSTOMER :: insert_new_customer
--                   3. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.CATEGORY :: insert_new_category
--                   4. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.INVENTORY :: insert_new_inventory
--                   5. CREATE TRIGGER :: AFTER UPDATE :: PUBLIC.RENTAL :: update_rental_return_date_delete_rental_from_fr_table 
--                   6. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.RENTAL :: insert_null_returned_date_rental_to_fr_table
--                   7. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.FILM_CATEGORY :: insert_new_film
--                   8. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_WATCH_HISTORY_DETAILED :: update_a_customer_category
--                   9. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_WATCH_HISTORY_DETAILED :: update_b_category_popularity_new_rental
--                  10. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_WATCH_HISTORY_DETAILED :: update_c_film_category_popularity_new_rental
--                  11. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_WATCH_HISTORY_DETAILED :: update_d_inventory_maintenance_count
--                  12. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_WATCH_HISTORY_DETAILED :: update_e_customer_reclist_master_nonspecific_new_rental
--                  13. CREATE TRIGGER :: AFTER DELETE :: VDM1_DATA.CUSTOMER_RECLIST_MASTER_NONSPECIFIC :: update_a_customer_reclist_master_nonspecific_updaterental
--                  14. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_WATCH_HISTORY_DETAILED :: update_f_customer_reclist_master_specific_new_rental
--                  15. CREATE TRIGGER :: AFTER DELETE :: VVDM1_DATA.CUSTOMER_RECLIST_MASTER_SPECIFIC :: update_a_customer_reclist_master_specific_updaterental
--                  16. CREATE TRIGGER :: AFTER INSERT OR UPDATE :: VDM1_DATA.CUSTOMER_REC_CUSTOM_PREFERNCES :: insert_update_customer_rec_custom_preferences
--                  17. CREATE TRIGGER :: AFTER DELETE :: VDM1_DATA.CUSTOMER_REC_CUSTOM_PREFERNCES :: delete_reset_customer_rec_custom_preferences
--                  18. CREATE TRIGGER :: AFTER UPDATE :: VDM1_DATA.FILM_CATEGORY_POPULARITY :: update_new_release_status_delete_film_from_nr_table
--                  19. CREATE TRIGGER :: AFTER DELETE :: VDM1_DATA.CUSTOMER_RECLIST_MASTER_NONSPECIFIC :: update_b_customer_reclist_summary_nonspecific
--                  20. CREATE TRIGGER :: AFTER TRUNCATE :: VDM1_DATA.CUSTOMER_RECLIST_SUMMARY_NONSPECIFIC :: update_customer_reclist_summary_nonspecific_ru
--                  21. CREATE TRIGGER :: AFTER DELETE :: VDM1_DATA.CUSTOMER_RECLIST_MASTER_SPECIFIC :: update_b_customer_reclist_summary_specific
--                  22. CREATE TRIGGER :: AFTER TRUNCATE :: VDM1_DATA.CUSTOMER_RECLIST_SUMMARY_SPECIFIC :: update_customer_reclist_summary_specific_rental_update
--                  23. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.FILM_CATEGORY_POPULARITY :: insert_customer_reclist_nonspecific_with_new_film
--                  24. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.FILM_CATEGORY_POPULARITY :: insert_customer_reclist_specific_with_new_film
--                  25. CREATE TRIGGER :: AFTER UPDATE :: VDM1_DATA.INVENTORY_MAINTENCE :: update_inventory_maintenance_complete
--                  26. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.CITY :: insert_new_city
--                  27. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.COUNTRY :: insert_new_country
--                  28. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.LANGUAGE :: insert_new_language
--                  29. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_RECLIST_SUMMARY_NONSPECIFIC :: refresh_materialized_views_non
--                  30. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.CUSTOMER_RECLIST_SUMMARY_SPECIFIC :: refresh_materialized_views_spe
--                  31. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.DICTIONARY_KEY :: refresh_materialized_views_dictionary_key
--                  32. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.DICTKEY_CATEGORY :: refresh_materialized_views_dictkey_category
--                  33. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.DICTKEY_CITY :: refresh_materialized_views_dictkey_city
--                  34. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.DICTKEY_COUNTRY :: refresh_materialized_views_dictkey_country
--                  35. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.DICTKEY_LANGUAGE :: refresh_materialized_views_dictkey_language
--                  36. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.DICTKEY_STORE_DETAILS :: refresh_materialized_views_dictkey_store_details
--                  37. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.FAILED_RETURNS :: refresh_materialized_views_failed_returns
--                  38. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.NEW_RELEASES :: refresh_materialized_views_new_releases
--                  39. CREATE TRIGGER :: AFTER INSERT :: VDM1_DATA.INVENTORY_MAINTENANCE_SUMMARY :: refresh_materialized_views_inventory_maintenance_summary


--             FUNCTIONS TO CREATED TRIGGERS 

--                   1. vdm1_etl.f_vdm1_stage5_trigger_setup_icwh()
--                   2. vdm1_etl.f_vdm1_stage5_trigger_setup_incust()
--                   3. vdm1_etl.f_vdm1_stage5_trigger_setup_incat()
--                   4. vdm1_etl.f_vdm1_stage5_trigger_setup_ininv()
--                   5. vdm1_etl.f_vdm1_stage5_trigger_setup_urr()
--                   6. vdm1_etl.f_vdm1_stage5_trigger_setup_ifr()
--                   7. vdm1_etl.f_vdm1_stage5_trigger_setup_infilm()
--                   8. vdm1_etl.f_vdm1_stage5_trigger_setup_ucxcat()
--                   9. vdm1_etl.f_vdm1_stage5_trigger_setup_nrucatpop()
--                  10. vdm1_etl.f_vdm1_stage5_trigger_setup_ufcpop_nr()
--                  11. vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint_count()
--                  12. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_nonspecific()
--                  13. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_non_ur();
--                  14. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific()
--                  15. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific_ur();
--                  16. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrcp()
--                  17. vdm1_etl.f_vdm1_stage5_trigger_setup_dcrcp()
--                  18. vdm1_etl.f_vdm1_stage5_trigger_setup_unr()
--                  19. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific()
--                  20. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific_ru()
--                  21. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific()
--                  22. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific_ru()
--                  23. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_non_inf();
--                  24. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_spe_inf();
--                  25. vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint_comp()
--                  26. vdm1_etl.f_vdm1_stage5_trigger_setup_incity()
--                  27. vdm1_etl.f_vdm1_stage5_trigger_setup_incountry()
--                  28. vdm1_etl.f_vdm1_stage5_trigger_setup_inlanguage()
--                  29. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_non();
--                  30. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_spe();
--                  31. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dictkey();
--                  32. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_cat();
--                  33. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_ci();
--                  34. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_co();
--                  35. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_l();
--                  36. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_sd();
--                  37. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_fr();
--                  38. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_nr();
--                  39. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_ims();

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
-- #TODO STAGE 5c - STORED PROCECURES

-- #### #### #### ####
-- ####    5c     #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage5c_triggers_setup()
    LANGUAGE plpgsql
    AS $vdm1_stage5_triggers_setup_procedure$

    BEGIN
        
        --  1
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_icwh();
        
        --  2
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_incust();
        
        --  3
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_incat();
        
        --  4
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ininv();
        
        --  5
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_urr();
        
        --  6
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ifr();

        --  7       
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_infilm();
        
        --  8
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucxcat();

        --  9
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_nrucatpop();

        -- 10
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ufcpop_nr();
        
        -- 11
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint_count();

        -- 12
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_nonspecific();

        -- 13
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_non_ur();
        
        -- 14
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific();

        -- 15
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific_ur();
        
        -- 16
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrcp();
    	
		-- 17
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_dcrcp();
          
        -- 18
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_unr();
        
        -- 19
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific();

        -- 20
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific_ru();
        
        -- 21
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific();

        -- 22
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific_ru();

        -- 23
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_non_inf();

        -- 24
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_spe_inf();

        -- 25
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint_comp();

        -- 26
		PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_incity();

        -- 27
		PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_incountry();

        -- 28
		PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_inlanguage();

        -- 29 
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_non();
        
        -- 30 
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_spe();

        -- 31
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dictkey();

        -- 32
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_cat();

        -- 33
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_ci();

        -- 34
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_co();

        -- 35
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_l();

        -- 36
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_sd();

        -- 37
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_fr();

        -- 38
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_nr();

        -- 39
        PERFORM vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_ims();


    END;
$vdm1_stage5_triggers_setup_procedure$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


-- #TODO STAGE 5c - FUNCTIONS 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####   TRIGGER FUNCTIONS #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--           1. vdm1_etl.f_vdm1_stage5_trigger_setup_icwh()
--           2. vdm1_etl.f_vdm1_stage5_trigger_setup_incust()
--           3. vdm1_etl.f_vdm1_stage5_trigger_setup_incat()
--           4. vdm1_etl.f_vdm1_stage5_trigger_setup_ininv()
--           5. vdm1_etl.f_vdm1_stage5_trigger_setup_urr()
--           6. vdm1_etl.f_vdm1_stage5_trigger_setup_ifr()
--           7. vdm1_etl.f_vdm1_stage5_trigger_setup_infilm()
--           8. vdm1_etl.f_vdm1_stage5_trigger_setup_ucxcat()
--           9. vdm1_etl.f_vdm1_stage5_trigger_setup_nrucatpop()
--          10. vdm1_etl.f_vdm1_stage5_trigger_setup_ufcpop_nr()
--          11. vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint_count()
--          12. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_nonspecific()
--          13. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_non_ur();
--          14. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific()
--          15. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific_ur();
--          16. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrcp()
--          17. vdm1_etl.f_vdm1_stage5_trigger_setup_dcrcp()
--          18. vdm1_etl.f_vdm1_stage5_trigger_setup_unr()
--          19. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific()
--          20. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific_ru()
--          21. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific()
--          22. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific_ru()
--          23. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_non_inf();
--          24. vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_spe_inf();
--          25. vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint_comp()
--          26. vdm1_etl.f_vdm1_stage5_trigger_setup_incity()
--          27. vdm1_etl.f_vdm1_stage5_trigger_setup_incountry()
--          28. vdm1_etl.f_vdm1_stage5_trigger_setup_inlanguage()
--          29. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_non();
--          30. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_spe();
--          31. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dictkey();
--          32. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_cat();
--          33. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_ci();
--          34. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_co();
--          35. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_l();
--          36. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_sd();
--          37. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_fr();
--          38. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_nr();
--          39. vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_ims();

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_icwh()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_insert_customer_watch_history$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER insert_customer_watch_history
					AFTER INSERT
					ON public.rental
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_customer_watch_history()';

		ELSE
			EXECUTE
				' DROP TRIGGER IF EXISTS insert_customer_watch_history
					ON public.rental;
				
				CREATE TRIGGER insert_customer_watch_history
					AFTER INSERT
					ON public.rental
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_customer_watch_history()';
		END IF;

    END;
$vdm1_stage5_trigger_setup_insert_customer_watch_history$;

-- REFERENCE LINKS
-- https://wiki.postgresql.org/wiki/Transactional_DDL_in_PostgreSQL:_A_Competitive_Analysis
-- https://stackoverflow.com/questions/35927365/create-or-replace-trigger-postgres
-- https://stackoverflow.com/questions/45579643/trigger-error-create-trigger
-- https://www.postgresql.org/docs/13/sql-createtrigger.html
-- https://phoenixnap.com/kb/check-postgresql-version#:~:text=Type%20the%20following%20SQL%20statement,information%20for%20the%20PostgreSQL%20server.
-- https://stackoverflow.com/questions/11299037/postgresql-if-statement

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_incust()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_insert_new_customer$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER insert_new_customer
					AFTER INSERT
					ON public.customer
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_new_customer()';

		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS insert_new_customer
					ON public.customer;
				
				 CREATE TRIGGER insert_new_customer
					AFTER INSERT
					ON public.customer
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_new_customer()';

		END IF;

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

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER insert_new_category
					AFTER INSERT
					ON public.category
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_new_category()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS insert_new_category
					ON public.category;
			
				 CREATE TRIGGER insert_new_category
                	AFTER INSERT
                	ON public.category
                	FOR EACH ROW
                	EXECUTE FUNCTION vdm1_data.t_f_insert_new_category()';

		END IF;

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

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER insert_new_inventory
					AFTER INSERT
					ON public.inventory
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_new_inventory()';
		
		ELSE
			EXECUTE 
            	'DROP TRIGGER IF EXISTS insert_new_inventory
					ON public.inventory;

				 CREATE TRIGGER insert_new_inventory
					AFTER INSERT
					ON public.inventory
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_new_inventory()';
			
		END IF;

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

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_rental_return_date_delete_rental_from_fr_table
					AFTER UPDATE
					ON public.rental
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_rental_return_date_delete_from_fr_table()';

		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS update_rental_return_date_delete_rental_from_fr_table
					ON public.rental;
										
				 CREATE TRIGGER update_rental_return_date_delete_rental_from_fr_table
					AFTER UPDATE
					ON public.rental
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_rental_return_date_delete_from_fr_table()';
		
		END IF ;

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

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER insert_null_returned_date_rental_to_fr_table
					AFTER INSERT
					ON public.rental
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_null_returned_date_rental_to_fr_table()';

		ELSE 
			EXECUTE
				'DROP TRIGGER IF EXISTS insert_null_returned_date_rental_to_fr_table
					ON public.rental;
		
				 CREATE TRIGGER insert_null_returned_date_rental_to_fr_table
					AFTER INSERT
					ON public.rental
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_null_returned_date_rental_to_fr_table()';
		
		END IF;

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

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER insert_new_film
					AFTER INSERT
					ON public.film_category
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_new_film()';

		ELSE 
			EXECUTE
				'DROP TRIGGER IF EXISTS insert_new_film
					ON public.film_category;

		         CREATE TRIGGER insert_new_film
                	AFTER INSERT
                	ON public.film_category
                	FOR EACH ROW
                	EXECUTE FUNCTION vdm1_data.t_f_insert_new_film()';			
		END IF;

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

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_a_customer_category
					AFTER INSERT 
					ON vdm1_data.customer_watch_history_detailed
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_category()';

		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS update_a_customer_category
					ON vdm1_data.customer_watch_history_detailed;
				
				 CREATE TRIGGER update_a_customer_category
					AFTER INSERT 
					ON vdm1_data.customer_watch_history_detailed
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_category()';

		END IF;

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

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_b_category_popularity_new_rental
					AFTER INSERT 
					ON vdm1_data.customer_watch_history_detailed
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_category_popularity()';
		
		ELSE
			EXECUTE 
				'DROP TRIGGER IF EXISTS update_b_category_popularity_new_rental
					ON vdm1_data.customer_watch_history_detailed;
					
				 CREATE TRIGGER update_b_category_popularity_new_rental
					AFTER INSERT 
					ON vdm1_data.customer_watch_history_detailed
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_category_popularity()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_new_rental_update_category_popularity$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ufcpop_nr()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_film_category_popularity_with_rental$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_c_film_category_popularity_new_rental
					AFTER INSERT 
					ON vdm1_data.customer_watch_history_detailed
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_film_category_popularity_new_rental()';

		ELSE
			EXECUTE 
				'DROP TRIGGER IF EXISTS update_c_film_category_popularity_new_rental
					ON vdm1_data.customer_watch_history_detailed;
				
				 CREATE TRIGGER update_c_film_category_popularity_new_rental
					AFTER INSERT 
					ON vdm1_data.customer_watch_history_detailed
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_film_category_popularity_new_rental()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_update_film_category_popularity_with_rental$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_inventory_maintenance_count$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_d_inventory_maintenance_count
					AFTER INSERT 
					ON vdm1_data.customer_watch_history_detailed
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_inventory_maintenance_count()';

		ELSE
			EXECUTE 
				'DROP TRIGGER IF EXISTS update_d_inventory_maintenance_count
					ON vdm1_data.customer_watch_history_detailed;
					
				 CREATE TRIGGER update_d_inventory_maintenance_count
					AFTER INSERT 
					ON vdm1_data.customer_watch_history_detailed
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_inventory_maintenance_count()';
		
		END IF;

    END;
$vdm1_stage5_trigger_setup_update_inventory_maintenance_count$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    12     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_nonspecific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_reclist_master_nonspecific$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_e_customer_reclist_master_nonspecific_new_rental
					AFTER INSERT
					ON vdm1_data.customer_watch_history_detailed
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_master_nonspecific_new_rental()';

		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS update_e_customer_reclist_master_nonspecific_new_rental
					ON vdm1_data.customer_watch_history_detailed;
				
				 CREATE TRIGGER update_e_customer_reclist_master_nonspecific_new_rental
					AFTER INSERT
					ON vdm1_data.customer_watch_history_detailed
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_master_nonspecific_new_rental()';
		
		END IF;

    END;
$vdm1_stage5_trigger_setup_update_customer_reclist_master_nonspecific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_non_ur()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_reclist_master_nonspecific$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_a_customer_reclist_master_nonspecific_updaterental
					AFTER INSERT OR DELETE
					ON vdm1_data.customer_reclist_master_nonspecific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_master_nonspecific_ru()';

		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS update_a_customer_reclist_master_nonspecific_updaterental
					ON vdm1_data.customer_reclist_master_nonspecific;
				
				 CREATE TRIGGER update_a_customer_reclist_master_nonspecific_updaterental
					AFTER INSERT OR DELETE
					ON vdm1_data.customer_reclist_master_nonspecific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_master_nonspecific_ru()';
		
		END IF;

    END;
$vdm1_stage5_trigger_setup_update_customer_reclist_master_nonspecific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    14     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_reclist_master_specific$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_f_customer_reclist_master_specific_new_rental
					AFTER INSERT
					ON vdm1_data.customer_watch_history_detailed
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_master_specific_new_rental()';
		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS update_f_customer_reclist_master_specific_new_rental
					ON vdm1_data.customer_watch_history_detailed;
				
				 CREATE TRIGGER update_f_customer_reclist_master_specific_new_rental
					AFTER INSERT
					ON vdm1_data.customer_watch_history_detailed
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_master_specific_new_rental()';
		
		END IF;
    
	END;
$vdm1_stage5_trigger_setup_update_customer_reclist_master_specific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

-- #### #### #### ####
-- ####    15     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_specific_ur()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_reclist_master_specific$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_a_customer_reclist_master_specific_updaterental
					AFTER INSERT OR DELETE
					ON vdm1_data.customer_reclist_master_specific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_master_specific_new_rental_ru()';

		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS update_a_customer_reclist_master_specific_updaterental
					ON vdm1_data.customer_reclist_master_specific;
				
				 CREATE TRIGGER update_a_customer_reclist_master_specific_updaterental
					AFTER INSERT OR DELETE
					ON vdm1_data.customer_reclist_master_specific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_master_specific_new_rental_ru()';
		
		END IF;

    END;
$vdm1_stage5_trigger_setup_update_customer_reclist_master_specific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    16     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrcp()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_rec_custom_preferences$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER insert_update_customer_rec_custom_preferences
					AFTER INSERT OR UPDATE
					ON vdm1_data.customer_rec_custom_preferences
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_update_customer_rec_custom_preferences()';
		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS insert_update_customer_rec_custom_preferences
					ON vdm1_data.customer_rec_custom_preferences;
				
				 CREATE TRIGGER insert_update_customer_rec_custom_preferences
					AFTER INSERT OR UPDATE
					ON vdm1_data.customer_rec_custom_preferences
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_update_customer_rec_custom_preferences()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_update_customer_rec_custom_preferences$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    17     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_dcrcp()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_rec_custom_preferences$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER delete_reset_customer_rec_custom_preferences
					AFTER DELETE
					ON vdm1_data.customer_rec_custom_preferences
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_delete_reset_customer_rec_custom_preferences()';
		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS delete_reset_customer_rec_custom_preferences
					ON vdm1_data.customer_rec_custom_preferences;
				
				 CREATE TRIGGER delete_reset_customer_rec_custom_preferences
					AFTER DELETE
					ON vdm1_data.customer_rec_custom_preferences
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_delete_reset_customer_rec_custom_preferences()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_update_customer_rec_custom_preferences$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    18     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_unr()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_new_release$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_new_release_status_delete_film_from_nr_table
					AFTER UPDATE
					ON vdm1_data.film_category_popularity
					FOR EACH ROW
					WHEN (OLD.new_release IS DISTINCT FROM NEW.new_release)
					EXECUTE FUNCTION vdm1_data.t_f_update_new_release_status_delete_from_nr_table()';

		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS update_new_release_status_delete_film_from_nr_table
					ON vdm1_data.film_category_popularity;
				
				 CREATE TRIGGER update_new_release_status_delete_film_from_nr_table
					AFTER UPDATE
					ON vdm1_data.film_category_popularity
					FOR EACH ROW
					WHEN (OLD.new_release IS DISTINCT FROM NEW.new_release)
					EXECUTE FUNCTION vdm1_data.t_f_update_new_release_status_delete_from_nr_table()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_update_new_release$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    19     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_reclist_summary_nonspecific$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_b_customer_reclist_summary_nonspecific
					AFTER INSERT OR DELETE
					ON vdm1_data.customer_reclist_master_nonspecific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_nonspecific()';

		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS update_b_customer_reclist_summary_nonspecific
					ON vdm1_data.customer_reclist_master_nonspecific;
				
				 CREATE TRIGGER update_b_customer_reclist_summary_nonspecific
					AFTER INSERT OR DELETE
					ON vdm1_data.customer_reclist_master_nonspecific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_nonspecific()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_update_customer_reclist_summary_nonspecific$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    20     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_nonspecific_ru()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_reclist_summary_nonspecific$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_customer_reclist_summary_nonspecific_ru
					AFTER TRUNCATE
					ON vdm1_data.customer_reclist_summary_nonspecific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_nonspecific_ru()';

		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS update_customer_reclist_summary_nonspecific_ru
					ON vdm1_data.customer_reclist_summary_nonspecific;
				
				 CREATE TRIGGER update_customer_reclist_summary_nonspecific_ru
					AFTER TRUNCATE
					ON vdm1_data.customer_reclist_summary_nonspecific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_nonspecific_ru()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_update_customer_reclist_summary_nonspecific$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    21     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_reclist_summary_specific$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_b_customer_reclist_summary_specific
					AFTER INSERT OR DELETE
					ON vdm1_data.customer_reclist_master_specific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_specific()';
		
		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS update_b_customer_reclist_summary_specific
					ON vdm1_data.customer_reclist_master_specific;
					
				CREATE TRIGGER update_b_customer_reclist_summary_specific
					AFTER INSERT OR DELETE
					ON vdm1_data.customer_reclist_master_specific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_specific()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_update_customer_reclist_summary_specific$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    22     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrls_specific_ru()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_customer_reclist_summary_specific$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_customer_reclist_summary_specific_rental_update
					AFTER TRUNCATE
					ON vdm1_data.customer_reclist_summary_specific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_specific_ru()';
		
		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS update_customer_reclist_summary_specific
					ON vdm1_data.customer_reclist_summary_specific;
					
				CREATE TRIGGER update_customer_reclist_summary_specific
					AFTER TRUNCATE
					ON vdm1_data.customer_reclist_summary_specific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_update_customer_reclist_summary_specific_ru()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_update_customer_reclist_summary_specific$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    23     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_non_inf()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_insert_customer_reclist_master_nonspecific_with_new_film$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER insert_customer_reclist_nonspecific_with_new_film
					AFTER INSERT
					ON vdm1_data.film_category_popularity
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_customer_reclist_master_nonspecific_new_film()';

		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS insert_customer_reclist_nonspecific_with_new_film
					ON vdm1_data.film_category_popularity;

				 CREATE TRIGGER insert_customer_reclist_nonspecific_with_new_film
					AFTER INSERT
					ON vdm1_data.film_category_popularity
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_customer_reclist_master_nonspecific_new_film()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_insert_customer_reclist_master_nonspecific_with_new_film$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    24     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_ucrlm_spe_inf()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_insert_customer_reclist_master_specific_with_new_film$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER insert_customer_reclist_specific_with_new_film
					AFTER INSERT
					ON vdm1_data.film_category_popularity
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_customer_reclist_master_specific_new_film()';

		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS insert_customer_reclist_specific_with_new_film
					ON vdm1_data.film_category_popularity;
				
				 CREATE TRIGGER insert_customer_reclist_specific_with_new_film
					AFTER INSERT
					ON vdm1_data.film_category_popularity
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_customer_reclist_master_specific_new_film()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_insert_customer_reclist_master_specific_with_new_film$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    25     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_uinvmaint_comp()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_update_inventory_maintenance$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER update_inventory_maintenance_complete
					AFTER UPDATE 
					ON vdm1_data.inventory_maintenance
					FOR EACH ROW
					WHEN (NEW.maintenance_complete_flag = true)
					EXECUTE FUNCTION vdm1_data.t_f_update_inventory_maintenance_complete()';

		ELSE
			EXECUTE
				'DROP TRIGGER IF EXISTS update_inventory_maintenance_complete
					ON vdm1_data.inventory_maintenance;
				
				CREATE TRIGGER update_inventory_maintenance_complete
					AFTER UPDATE 
					ON vdm1_data.inventory_maintenance
					FOR EACH ROW
					WHEN (NEW.maintenance_complete_flag = true)
					EXECUTE FUNCTION vdm1_data.t_f_update_inventory_maintenance_complete()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_update_inventory_maintenance$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    26     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_incity()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_insert_new_city$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER insert_new_city
					AFTER INSERT
					ON public.city
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_new_city()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS insert_new_city
					ON public.city;
			
				 CREATE TRIGGER insert_new_city
                	AFTER INSERT
                	ON public.city
                	FOR EACH ROW
                	EXECUTE FUNCTION vdm1_data.t_f_insert_new_city()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_insert_new_city$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    27     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_incountry()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_insert_new_country$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER insert_new_country
					AFTER INSERT
					ON public.country
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_new_country()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS insert_new_country
					ON public.country;
			
				 CREATE TRIGGER insert_new_country
                	AFTER INSERT
                	ON public.country
                	FOR EACH ROW
                	EXECUTE FUNCTION vdm1_data.t_f_insert_new_country()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_insert_new_country$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    28     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_inlanguage()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_insert_new_language$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER insert_new_language
					AFTER INSERT
					ON public.language
					FOR EACH ROW
					EXECUTE FUNCTION vdm1_data.t_f_insert_new_language()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS insert_new_language
					ON public.language;
			
				 CREATE TRIGGER insert_new_language
                	AFTER INSERT
                	ON public.language
                	FOR EACH ROW
                	EXECUTE FUNCTION vdm1_data.t_f_insert_new_language()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_insert_new_language$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    29     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_non()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_refresh_mview$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER refresh_materialized_views_non
					AFTER INSERT
					ON vdm1_data.customer_reclist_summary_nonspecific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS refresh_materialized_views_non
					ON vdm1_data.customer_reclist_summary_nonspecific;
			
				 CREATE TRIGGER refresh_materialized_views_non
                	AFTER INSERT
                	ON vdm1_data.customer_reclist_summary_nonspecific
                	FOR EACH STATEMENT
                	EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_refresh_mview$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    30     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_spe()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_refresh_mview$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER refresh_materialized_views_spe
					AFTER INSERT
					ON vdm1_data.customer_reclist_summary_specific
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS refresh_materialized_views_spe
					ON vdm1_data.customer_reclist_summary_specific;
			
				 CREATE TRIGGER refresh_materialized_views_spe
                	AFTER INSERT
                	ON vdm1_data.customer_reclist_summary_specific
                	FOR EACH STATEMENT
                	EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_refresh_mview$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    31     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dictkey()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_refresh_mview$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER refresh_materialized_views_dictionary_key
					AFTER INSERT
					ON vdm1_data.dictionary_key
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS refresh_materialized_views_dictionary_key
					ON vdm1_data.dictionary_key;
			
				 CREATE TRIGGER refresh_materialized_views_dictionary_key
                	AFTER INSERT
                	ON vdm1_data.dictionary_key
                	FOR EACH STATEMENT
                	EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_refresh_mview$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    32     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_cat()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_refresh_mview$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER refresh_materialized_views_dictkey_category
					AFTER INSERT
					ON vdm1_data.dictkey_category
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS refresh_materialized_views_dictkey_category
					ON vdm1_data.dictkey_category;
			
				 CREATE TRIGGER refresh_materialized_views_dictkey_category
                	AFTER INSERT
                	ON vdm1_data.dictkey_category
                	FOR EACH STATEMENT
                	EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_refresh_mview$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    33     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_ci()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_refresh_mview$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER refresh_materialized_views_dictkey_city
					AFTER INSERT
					ON vdm1_data.dictkey_city
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS refresh_materialized_views_dictkey_city
					ON vdm1_data.dictkey_city;
			
				 CREATE TRIGGER refresh_materialized_views_dictkey_city
                	AFTER INSERT
                	ON vdm1_data.dictkey_city
                	FOR EACH STATEMENT
                	EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_refresh_mview$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    34     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_co()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_refresh_mview$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER refresh_materialized_views_dictkey_country
					AFTER INSERT
					ON vdm1_data.dictkey_country
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS refresh_materialized_views_dictkey_country
					ON vdm1_data.dictkey_country;
			
				 CREATE TRIGGER refresh_materialized_views_dictkey_country
                	AFTER INSERT
                	ON vdm1_data.dictkey_country
                	FOR EACH STATEMENT
                	EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_refresh_mview$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    35     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_l()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_refresh_mview$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER refresh_materialized_views_dictkey_language
					AFTER INSERT
					ON vdm1_data.dictkey_language
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS refresh_materialized_views_dictkey_language
					ON vdm1_data.dictkey_language;
			
				 CREATE TRIGGER refresh_materialized_views_dictkey_language
                	AFTER INSERT
                	ON vdm1_data.dictkey_language
                	FOR EACH STATEMENT
                	EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_refresh_mview$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    36     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_dk_sd()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_refresh_mview$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER refresh_materialized_views_dictkey_store_details
					AFTER INSERT
					ON vdm1_data.dictkey_store_details
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS refresh_materialized_views_dictkey_store_details
					ON vdm1_data.dictkey_store_details;
			
				 CREATE TRIGGER refresh_materialized_views_dictkey_store_details
                	AFTER INSERT
                	ON vdm1_data.dictkey_store_details
                	FOR EACH STATEMENT
                	EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_refresh_mview$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    37     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_fr()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_refresh_mview$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER refresh_materialized_views_failed_returns
					AFTER INSERT
					ON vdm1_data.failed_returns
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS refresh_materialized_views_failed_returns
					ON vdm1_data.failed_returns;
			
				 CREATE TRIGGER refresh_materialized_views_failed_returns
                	AFTER INSERT
                	ON vdm1_data.failed_returns
                	FOR EACH STATEMENT
                	EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_refresh_mview$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    38     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_nr()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_refresh_mview$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER refresh_materialized_views_new_releases
					AFTER INSERT
					ON vdm1_data.new_releases
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS refresh_materialized_views_new_releases
					ON vdm1_data.new_releases;
			
				 CREATE TRIGGER refresh_materialized_views_new_releases
                	AFTER INSERT
                	ON vdm1_data.new_releases
                	FOR EACH STATEMENT
                	EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_refresh_mview$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    39     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_trigger_setup_refresh_mview_ims()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_trigger_setup_refresh_mview$

    BEGIN 

		IF (SELECT SUBSTRING((SELECT VERSION()), 12, 2)::INT > 13) THEN 
			EXECUTE
				'CREATE OR REPLACE TRIGGER refresh_materialized_views_inventory_maintenance_summary
					AFTER INSERT
					ON vdm1_data.inventory_maintenance
					FOR EACH STATEMENT
					EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		ELSE
        	EXECUTE
            	'DROP TRIGGER IF EXISTS refresh_materialized_views_inventory_maintenance_summary
					ON vdm1_data.inventory_maintenance;
			
				 CREATE TRIGGER refresh_materialized_views_inventory_maintenance_summary
                	AFTER INSERT
                	ON vdm1_data.inventory_maintenance
                	FOR EACH STATEMENT
                	EXECUTE FUNCTION vdm1_data.t_f_refresh_materialized_views()';

		END IF;

    END;
$vdm1_stage5_trigger_setup_refresh_mview$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 5c END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                           

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

--                   1. vdm1_etl.vdm1_reset();
--                   2. vdm1_etl.vdm1_reset_mview_setup();

--              FUNCTIONS

--                   1. vdm1_etl.f_vdm1_reset_disable_triggers();
--                   2. vdm1_etl.f_vdm1_reset_drop_triggers();
--                   3. vdm1_etl.f_vdm1_reset_drop_index(p_schema_name VARCHAR, p_index_name VARCHAR, p_concurrently BOOLEAN);
--                   4. vdm1_etl.f_vdm1_reset_delete_tables_vdm1_data();
--                   5. vdm1_etl.f_vdm1_reset_create_materialized_view();
--                   6. vdm1_etl.f_vdm1_reset_drop_materialized_view();
--                   7. vdm1_etl.f_vdm1_reset_refresh_materialized_view()
--                   8. vdm1_etl.f_vdm1_reset_create_mview_inventory_maintenance_summary
--                   9. vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_master_non()
--                  10. vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_master_spec()
--                  11. vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_summary_non()
--                  12. vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_summary_spec()
--                  13. vdm1_etl.f_vdm1_reset_enable_triggers()

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

-- #### #### #### ####
-- ####   RESET   #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_reset()
	LANGUAGE plpgsql
	AS $vdm1_reset$
	
	BEGIN 

		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_reset_disable_triggers();

		PERFORM vdm1_etl.f_vdm1_reset_drop_triggers();

		-- #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_reset_drop_index('vdm1_data', 'index_customer_category', false);

		PERFORM vdm1_etl.f_vdm1_reset_drop_index('vdm1_data', 'index_customer_reclist_master_nonspecific', false);

		PERFORM vdm1_etl.f_vdm1_reset_drop_index('vdm1_data', 'index_customer_reclist_master_specific', false);

		PERFORM vdm1_etl.f_vdm1_reset_drop_index('vdm1_data', 'index_customer_reclist_summary_nonspecific', false);

		PERFORM vdm1_etl.f_vdm1_reset_drop_index('vdm1_data', 'index_customer_reclist_summary_specific', false);

		PERFORM vdm1_etl.f_vdm1_reset_drop_index('vdm1_data', 'index_customer_watch_history_detailed', false);

		PERFORM vdm1_etl.f_vdm1_reset_drop_index('vdm1_data', 'index_film_category_popularity', false);
		
		PERFORM vdm1_etl.f_vdm1_reset_drop_index('vdm1_data', 'index_inventory_maintenance', false);

		-- #### #### #### #### #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_reset_delete_tables_vdm1_data();

		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

		RAISE NOTICE 'RUNNING VDM1 ETL STAGE 0 / RESET STAGE 0';
        CALL vdm1_etl.vdm1_reset_stage0();
		RAISE NOTICE 'COMPLETED VDM1 ETL STAGE 0 / RESET STAGE 0 ';

		-- #### #### #### #### 

		-- STAGE 1

		RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 1';
		CALL vdm1_etl.vdm1_stage1();
		RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 1';

		-- #### #### #### #### 

		-- STAGE 2

		RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 2';
		CALL vdm1_etl.vdm1_stage2();
		RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 2';

		-- #### #### #### #### 

		-- STAGE 3

		RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 3';
		CALL vdm1_etl.vdm1_stage3();
		RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 3';

		-- #### #### #### #### #### #### #### #### 

		-- STAGE 4

        -- DISABLING MAIN RUN DUE TO PERFORMANCE/TIME IMPACT
        -- CALL vdm1_etl.vdm1_stage4();

            -- STAGE 4 HAS BEEN SPLIT INTO 3 SUBPARTS, THEN AGAIN 4 MORE SUB PARTS TO ASSIST WITH PERFORMANCE IMPACT
			RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4a';
            CALL vdm1_etl.vdm1_stage4a();
		    RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4a';

			RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4b';
            CALL vdm1_etl.vdm1_stage4b();
			RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4b';

		-- #### #### #### #### #### #### #### #### 
		
		-- STAGE 4

				-- STAGE 4-C-1-A :: INSERTS CUSTOMER RECOMMENDATION LIST INTO MASTER NONSPECIFIC
				RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4c1a';
				CALL vdm1_etl.vdm1_stage4c1a();
				RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4c1a';

				-- STAGE 4-C-1-B :: PERFORMS ROW NUBMER COUNT ON CUSTOMER RECOMMENDATION LIST MASTER NONSPECIFIC
				RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4c1b';
				CALL vdm1_etl.vdm1_stage4c1b();
				RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4c1b';

				-- STAGE 4-C-2-A :: INSERTS CUSTOMER RECOMMENDATION LIST INTO MASTER SPECIFIC
				RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4c2a';
				CALL vdm1_etl.vdm1_stage4c2a();
				RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4c2a';

				-- STAGE 4-C-2-B :: PERFORMS ROW NUBMER COUNT ON CUSTOMER RECOMMENDATION LIST MASTER SPECIFIC
				RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4c2b';
				CALL vdm1_etl.vdm1_stage4c2b();
				RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4c2b';

				-- STAGE 4-C-3 :: PERFORMS CLEANUP
				RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 4c3';
				CALL vdm1_etl.vdm1_stage4c3();
				RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 4c3';

		-- #### #### #### #### #### #### #### #### 

		-- STAGE 5

		RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 5a - RESET';
        CALL vdm1_etl.vdm1_stage5a_reset();
		RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 5a - RESET';
		
		RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 5b - TRIGGER FUNCTION SETUP';
        CALL vdm1_etl.vdm1_stage5b_trigger_functions_setup();
		RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 5b - TRIGGER FUNCTION SETUP';

		RAISE NOTICE 'RUNNING VDM1 ETL  STAGE 5c - TRIGGER SETUP';
        CALL vdm1_etl.vdm1_stage5c_triggers_setup();
		RAISE NOTICE 'COMPLETED VDM1 ETL  STAGE 5c - TRIGGER SETUP';

		-- #### #### #### #### #### #### #### #### 

        -- CALL vdm1_etl.vdm1_reset_mview_setup();

		PERFORM vdm1_etl.f_vdm1_reset_enable_triggers();

		-- #### #### #### #### #### #### #### #### 
		
	END;
$vdm1_reset$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- #### RESET MVS #### 
-- #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_reset_mview_setup()
	LANGUAGE plpgsql
	AS $vdm1_reset_materialized_view_recreation$
	
	BEGIN 

		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('dictionary_key');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('dictionary_key');

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('dictionary_key');

		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('dictkey_category');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('dictkey_category');

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('dictkey_category');
        
 		-- #### #### #### #### #### #### #### #### 
        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('dictkey_city');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('dictkey_city');

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('dictkey_city');
        

		-- #### #### #### #### #### #### #### #### 
        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('dictkey_country');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('dictkey_country');

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('dictkey_country');
        

  		-- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('dictkey_language');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('dictkey_language');

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('dictkey_language');
        
		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('dictkey_customer_details');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('dictkey_customer_details');

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('dictkey_customer_details');
        
		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('dictkey_store_details');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('dictkey_store_details');

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('dictkey_store_details');
        
 		-- #### #### #### #### #### #### #### #### 
        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('dictkey_film_details');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('dictkey_film_details');

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('dictkey_film_details');
        

		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('customer_reclist_master_nonspecific');

        PERFORM vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_master_non();

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('customer_reclist_master_nonspecific');
        

  		-- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('customer_reclist_master_specific');

        PERFORM vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_master_spec();

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('customer_reclist_master_specific');
        
		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('customer_reclist_summary_nonspecific');

        PERFORM vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_summary_non();

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('customer_reclist_summary_nonspecific');
        
		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('customer_reclist_summary_specific');

        PERFORM vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_summary_spec();

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('customer_reclist_summary_specific');
        
 		-- #### #### #### #### #### #### #### #### 
        
		PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('failed_returns');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('failed_returns');

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('failed_returns');
        

		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('new_releases');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('new_releases');

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('new_releases');
        

  		-- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('film_category_popularity');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('film_category_popularity');

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('film_category_popularity');
        
		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('category_popularity');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('category_popularity');

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('category_popularity');
        
		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('customer_watch_history_detailed');

        PERFORM vdm1_etl.f_vdm1_reset_create_materialized_view('customer_watch_history_detailed');

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('customer_watch_history_detailed');
        
		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_materialized_view('inventory_maintenance_summary');

        PERFORM vdm1_etl.f_vdm1_reset_create_mview_inventory_maintenance_summary();

        PERFORM vdm1_etl.f_vdm1_reset_refresh_materialized_view('inventory_maintenance_summary');
    
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

--           1. vdm1_etl.f_vdm1_reset_disable_triggers();
--           2. vdm1_etl.f_vdm1_reset_drop_triggers();
--           3. vdm1_etl.f_vdm1_reset_drop_index(p_schema_name VARCHAR, p_index_name VARCHAR, p_concurrently BOOLEAN);
--           4. vdm1_etl.f_vdm1_reset_delete_tables_vdm1_data();
--           5. vdm1_etl.f_vdm1_reset_create_materialized_view();
--           6. vdm1_etl.f_vdm1_reset_drop_materialized_view();
--           7. vdm1_etl.f_vdm1_reset_refresh_materialized_view()
--           8. vdm1_etl.f_vdm1_reset_create_mview_inventory_maintenance_summary
--           9. vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_master_non()
--          10. vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_master_spec()
--          11. vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_summary_non()
--          12. vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_summary_spec()
--          13. vdm1_etl.f_vdm1_reset_enable_triggers()

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

			ALTER TABLE IF EXISTS public.customer
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.category
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.city
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.country
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.language
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.inventory
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.rental
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.film_category
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.customer_watch_history_detailed
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.customer_rec_custom_preferences
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.film_category_popularity
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.customer_reclist_master_nonspecific
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.customer_reclist_master_specific
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.customer_reclist_summary_nonspecific
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.customer_reclist_summary_specific
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.dictionary_key
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.dictkey_category
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.dictkey_city
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.dictkey_country
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.dictkey_customer_details
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.dictkey_film_details
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.dictkey_language
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.dictkey_store_details
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.failed_returns
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.new_releases
				DISABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.inventory_maintenance
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

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
                    
		DROP TRIGGER IF EXISTS insert_customer_watch_history
		ON public.rental CASCADE;

		DROP TRIGGER IF EXISTS insert_new_customer
		ON public.customer CASCADE;

		DROP TRIGGER IF EXISTS insert_new_category
		ON public.category CASCADE;

		DROP TRIGGER IF EXISTS insert_new_inventory
		ON public.inventory CASCADE;

		DROP TRIGGER IF EXISTS update_rental_return_date_delete_rental_from_fr_table
		ON public.rental CASCADE;

		DROP TRIGGER IF EXISTS insert_null_returned_date_rental_to_fr_table
		ON public.rental CASCADE;

		DROP TRIGGER IF EXISTS insert_new_film
		ON public.film_category CASCADE;

		DROP TRIGGER IF EXISTS update_a_customer_category
		ON vdm1_data.customer_watch_history_detailed CASCADE;

		DROP TRIGGER IF EXISTS update_b_category_popularity_new_rental
		ON vdm1_data.customer_watch_history_detailed CASCADE;

		DROP TRIGGER IF EXISTS update_c_film_category_popularity_new_rental
		ON vdm1_data.customer_watch_history_detailed CASCADE;

		DROP TRIGGER IF EXISTS update_d_inventory_maintenance_count
		ON vdm1_data.customer_watch_history_detailed CASCADE;

		DROP TRIGGER IF EXISTS update_e_customer_reclist_master_nonspecific
		ON vdm1_data.customer_watch_history_detailed CASCADE;

        DROP TRIGGER IF EXISTS update_a_customer_reclist_master_nonspecific_updaterental
        ON vdm1_data.customer_reclist_master_nonspecific CASCADE;

		DROP TRIGGER IF EXISTS update_f_customer_reclist_master_nonspecific
		ON vdm1_data.customer_watch_history_detailed CASCADE;

        DROP TRIGGER IF EXISTS update_a_customer_reclist_master_specific_updaterental
        ON vdm1_data.customer_reclist_master_specific CASCADE;

		DROP TRIGGER IF EXISTS insert_update_customer_rec_custom_preferences
		ON vdm1_data.customer_rec_custom_preferences CASCADE;

		DROP TRIGGER IF EXISTS update_new_release_status_delete_film_from_nr_table
		ON vdm1_data.film_category_popularity CASCADE;

		DROP TRIGGER IF EXISTS update_b_customer_reclist_summary_nonspecific
		ON vdm1_data.customer_reclist_master_nonspecific CASCADE;

        DROP TRIGGER IF EXISTS update_customer_reclist_summary_nonspecific_ru
        ON vdm1_data.customer_reclist_summary_nonspecific CASCADE;

		DROP TRIGGER IF EXISTS update_b_customer_reclist_summary_specific
		ON vdm1_data.customer_reclist_master_specific CASCADE;

        DROP TRIGGER IF EXISTS update_customer_reclist_summary_specific_ru
        ON vdm1_data.customer_reclist_summary_specific CASCADE;

        DROP TRIGGER IF EXISTS update_customer_reclist_summary_specific_rental_update
        ON vdm1_data.customer_reclist_summary_specific CASCADE;

        DROP TRIGGER IF EXISTS update_customer_reclist_master_nonspecific_summary
        ON vdm1_data.customer_reclist_master_nonspecific CASCADE;

		DROP TRIGGER IF EXISTS insert_customer_reclist_nonspecific_with_new_film
		ON vdm1_data.film_category_popularity CASCADE;

		DROP TRIGGER IF EXISTS insert_customer_reclist_specific_with_new_film
		ON vdm1_data.film_category_popularity CASCADE;

		DROP TRIGGER IF EXISTS update_inventory_maintenance_complete
		ON vdm1_data.inventory_maintenance CASCADE;   

		DROP TRIGGER IF EXISTS insert_new_city
		ON public.city CASCADE;

		DROP TRIGGER IF EXISTS insert_new_country
		ON public.country CASCADE;

		DROP TRIGGER IF EXISTS insert_new_language
		ON public.language CASCADE;

		DROP TRIGGER IF EXISTS refresh_materialized_views_non
		ON vdm1_data.customer_reclist_summary_nonspecific CASCADE;
        
        DROP TRIGGER IF EXISTS refresh_materialized_views_spe
		ON vdm1_data.customer_reclist_summary_specific CASCADE;

        DROP TRIGGER IF EXISTS refresh_materialized_views_dictionary_key
        ON vdm1_data.dictionary_key CASCADE;

        DROP TRIGGER IF EXISTS refresh_materialized_views_dictkey_category
        ON vdm1_data.dictkey_category CASCADE;

        DROP TRIGGER IF EXISTS refresh_materialized_views_dictkey_city
        ON vdm1_data.dictkey_city CASCADE;

        DROP TRIGGER IF EXISTS refresh_materialized_views_dictkey_country
        ON vdm1_data.dictkey_country CASCADE;

        DROP TRIGGER IF EXISTS refresh_materialized_views_dictkey_language
        ON vdm1_data.dictkey_language CASCADE;

        DROP TRIGGER IF EXISTS refresh_materialized_views_dictkey_store_details
        ON vdm1_data.dictkey_store_details CASCADE;

        DROP TRIGGER IF EXISTS refresh_materialized_views_failed_returns
        ON vdm1_data.failed_returns CASCADE;

        DROP TRIGGER IF EXISTS refresh_materialized_views_new_releases
        ON vdm1_data.new_releases CASCADE;

        DROP TRIGGER IF EXISTS refresh_materialized_views_inventory_maintenance_summary
        ON vdm1_data.inventory_maintenance CASCADE;
        
        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

	END;
$vdm1_reset_procedure_function_drop_triggers$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_drop_index(
	  p_schema_name VARCHAR
	, p_index_name VARCHAR
	, p_concurrently BOOLEAN
)
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_drop_index$

    DECLARE 

		vi_schema_name VARCHAR;
		vi_index_name VARCHAR;
		vi_concurrently BOOLEAN;

		vo_concurrently VARCHAR;

	BEGIN 
		
		vi_schema_name := $1;
		vi_index_name := $2;
		vi_concurrently := $3;

		vo_concurrently := '';

		IF vi_concurrently = false THEN
			vo_concurrently := ' ';
		ELSE
			vo_concurrently := ' CONCURRENTLY ';
		END IF;
		
			EXECUTE 
            	'DROP INDEX' || vo_concurrently  || 'IF EXISTS ' 
					|| vi_schema_name || '.' || vi_index_name || ' CASCADE';
	
	END;
$vdm1_stage5_drop_index$;

-- REFERENCE LINKS:
-- https://www.postgresql.org/docs/current/sql-dropindex.html
-- https://www.geeksforgeeks.org/postgresql-drop-index/
-- https://stackoverflow.com/questions/11299037/postgresql-if-statement
-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-coalesce/
-- https://www.postgresql.org/docs/current/functions-conditional.html
-- https://www.geeksforgeeks.org/postgresql-coalesce/
-- https://www.enterprisedb.com/postgres-tutorials/how-use-coalesce-postgresql
-- https://www.oracletutorial.com/oracle-index/oracle-drop-index/

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     5     #### 
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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     6     #### 
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


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    7     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_refresh_materialized_view(
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
            ' REFRESH MATERIALIZED VIEW marketing.' || table_name;
	END;
$vdm1_reset_refresh_materialized_view$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_mview_inventory_maintenance_summary()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_create_mview_film_inventory_summary$

	BEGIN
		
		CREATE MATERIALIZED VIEW marketing.inventory_maintenance_summary AS (
			
			SELECT 
				*
			FROM 
				vdm1_data.inventory_maintenance

			WHERE
				inspect_flag = true

			ORDER BY
				life_cycle DESC, film_id, inventory_id
		);
	
	END;
$vdm1_reset_create_mview_film_inventory_summary$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_master_non()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_create_mview_customer_reclist_master_nonspecific$

	BEGIN
		
		CREATE MATERIALIZED VIEW marketing.customer_reclist_master_nonspecific AS (
			
			SELECT 
				  a.customer_id
				, b.customer_full_name
				, b.email 
				, b.phone
				, a.film_rec_order
				, a.film_id
				, c.title
				, d.name AS language
				, c.release_year
				, e.name AS genre
				, c.length
				, c.rating
				, c.description
				, CONCAT('Available for ' || c.rental_duration || ' days for only $' || c.rental_rate)
			FROM 
				vdm1_data.customer_reclist_master_nonspecific AS a 

					LEFT JOIN
						vdm1_data.dictkey_customer_details AS b 
							ON a.customer_id = b.customer_id 

					LEFT JOIN 
						vdm1_data.dictkey_film_details AS c 
							ON a.film_id = c.film_id 

					LEFT JOIN 
						vdm1_data.dictkey_language AS d 
							ON c.language_id = d.language_id
					
					LEFT JOIN 
						vdm1_data.dictkey_category AS e 
							ON c.category_id = e.category_id


			ORDER BY
				customer_id, film_rec_order
		);
	
	END;
$vdm1_reset_create_mview_customer_reclist_master_nonspecific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_master_spec()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_create_mview_customer_reclist_master_specific$

	BEGIN
		
		CREATE MATERIALIZED VIEW marketing.customer_reclist_master_specific AS (
			
			SELECT 
				  a.customer_id
				, b.customer_full_name
				, b.email 
				, b.phone
				, a.cat_rec_order
				, a.rental_rec_order
				, a.film_id
				, c.title
				, d.name AS language
				, c.release_year
				, e.name AS genre
				, c.length
				, c.rating
				, c.description
				, CONCAT('Available for ' || c.rental_duration || ' days for only $' || c.rental_rate)
			FROM 
				vdm1_data.customer_reclist_master_specific AS a 

					LEFT JOIN
						vdm1_data.dictkey_customer_details AS b 
							ON a.customer_id = b.customer_id 

					LEFT JOIN 
						vdm1_data.dictkey_film_details AS c 
							ON a.film_id = c.film_id 

					LEFT JOIN 
						vdm1_data.dictkey_language AS d 
							ON c.language_id = d.language_id
					
					LEFT JOIN 
						vdm1_data.dictkey_category AS e 
							ON c.category_id = e.category_id


			ORDER BY
				customer_id, cat_rec_order, rental_rec_order
		);
	
	END;
$vdm1_reset_create_mview_customer_reclist_master_specific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_summary_non()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_create_mview_customer_reclist_summary_nonspecific$

	BEGIN
		
		CREATE MATERIALIZED VIEW marketing.customer_reclist_summary_nonspecific AS (
			
			SELECT 
				  a.customer_id
				, b.customer_full_name
				, b.email 
				, b.phone
				, a.film_rec_order
				, a.film_id
				, c.title
				, d.name AS language
				, c.release_year
				, e.name AS genre
				, c.length
				, c.rating
				, c.description
				, CONCAT('Available for ' || c.rental_duration || ' days for only $' || c.rental_rate)
			FROM 
				vdm1_data.customer_reclist_summary_nonspecific AS a 

					LEFT JOIN
						vdm1_data.dictkey_customer_details AS b 
							ON a.customer_id = b.customer_id 

					LEFT JOIN 
						vdm1_data.dictkey_film_details AS c 
							ON a.film_id = c.film_id 

					LEFT JOIN 
						vdm1_data.dictkey_language AS d 
							ON c.language_id = d.language_id
					
					LEFT JOIN 
						vdm1_data.dictkey_category AS e 
							ON c.category_id = e.category_id

			ORDER BY
				customer_id, film_rec_order
		);
	
	END;
$vdm1_reset_create_mview_customer_reclist_summary_nonspecific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    12     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_mview_customer_reclist_summary_spec()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_create_mview_customer_reclist_summary_specific$

	BEGIN
		
		CREATE MATERIALIZED VIEW marketing.customer_reclist_summary_specific AS (
			
			SELECT 
				  a.customer_id
				, b.customer_full_name
				, b.email 
				, b.phone
				, a.cat_rec_order
				, a.rental_rec_order
				, a.film_id
				, c.title
				, d.name AS language
				, c.release_year
				, e.name AS genre
				, c.length
				, c.rating
				, c.description
				, CONCAT('Available for ' || c.rental_duration || ' days for only $' || c.rental_rate)
			FROM 
				vdm1_data.customer_reclist_summary_specific AS a 

					LEFT JOIN
						vdm1_data.dictkey_customer_details AS b 
							ON a.customer_id = b.customer_id 

					LEFT JOIN 
						vdm1_data.dictkey_film_details AS c 
							ON a.film_id = c.film_id 

					LEFT JOIN 
						vdm1_data.dictkey_language AS d 
							ON c.language_id = d.language_id
					
					LEFT JOIN 
						vdm1_data.dictkey_category AS e 
							ON c.category_id = e.category_id


			ORDER BY
				customer_id, cat_rec_order, rental_rec_order
		);
	
	END;
$vdm1_reset_create_mview_customer_reclist_summary_specific$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_enable_triggers()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_procedure_function_enable_triggers$
	
	BEGIN

		-- THIS MAY BE UNNECESSARY SINCE I BELIEVE THE RECREATE ENABLES ALL TRIGGERS 
		-- AGAIN BUT TO BE ON THE SAFE SIDE I'M REVERSING THE DISABLE FUNCTION FROM ABOVE.

        -- #### #### #### #### #### #### #### ####    
	   
			ALTER TABLE IF EXISTS public.customer
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.category
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.city
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.country
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.language
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.inventory
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.rental
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS public.film_category
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.customer_watch_history_detailed
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.customer_rec_custom_preferences
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.film_category_popularity
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.customer_reclist_master_nonspecific
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.customer_reclist_master_specific
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.customer_reclist_summary_nonspecific
				ENABLE TRIGGER ALL;

			ALTER TABLE IF EXISTS vdm1_data.customer_reclist_summary_specific
				ENABLE TRIGGER ALL;


        -- #### #### #### #### #### #### #### #### 

	END;
$vdm1_reset_procedure_function_enable_triggers$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #TODO VDM1 RESET STAGE END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### ####        VDM1 RESET STAGE END        #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                           
