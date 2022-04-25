-- MASTER CODE BLOCK
-- Version 4

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                       

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--     #### #### #### ####
--         STAGE 0 BEGIN
--     #### #### #### ####

--             SCHEMA CREATION

--                  1. CREATE SCHEMA :: MARKETING
--                  2. CREATE SCHEMA :: VDMA1_ETL
--                  3. DROP SCHEMA :: STAGING - CASCADE
--                  4. CREATE SCHEMA :: STAGING
--                  5. CREATE SCHEMA :: EXTENSIONS

--             SCHEMA PRIVILAGES

--                  1. GRANT USAGE ON SCHEMA extensions TO public
--                  2. GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA extensions TO public;
--                  3. ALTER DEFAULT PRIVILEGES IN SCHEMA extensions - GRANT EXECUTE ON FUNCTIONS TO public;
--                  4. ALTER DEFAULT PRIVILEGES IN SCHEMA extensions - GRANT USAGE ON TYPES TO public;


--             EXTENSIONS

--                  1. INSTALL EXTENSION :: intarray - To: Extensions

--             DATA TYPES

--                  1. CREATE ENUM DATA TYPE :: MPAA_RATING - To: Marketing
--                  2. CREATE ENUM DATA TYPE :: MPAA_RATING - To: Staging
--                  3. CREATE ENUM DATA TYPE :: Category_Rank - To: Marketing
--                  4. CREATE ENUM DATA TYPE :: Category_Rank - To: Staging


--            STORED PROCEDURES

--                  1. staging.vdm1_etl_main();

--     #### #### #### ####
--         STAGE 0 END
--     #### #### #### ####

--     #### #### #### ####
--         STAGE 1 BEGIN
--     #### #### #### ####


--             STORED PROCEDURES

--                  1. staging.vdm1_stage1();

--             FUNCTIONS

--                  1. staging.f_vdm1_stage1_extractimport(tablename VARCHAR(30))

--     #### #### #### ####
--         STAGE 1 END
--     #### #### #### ####

--     #### #### #### ####
--         STAGE 2 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. staging.vdm1_stage2();

--             FUNCTIONS

--                  1. staging.f_vdm1_stage2_customer_status_amend();
--                  2. staging.f_vdm1_stage2_films()
--                  3. staging.f_vdm1_stage2_film_inventory()
--                  4. staging.f_vdm1_stage2_rentals()
--                  5. staging.f_vdm1_stage2_locationdetails()
--                  6. staging.f_vdm1_stage2_stores()
--                  7. staging.f_vdm1_stage2_customers()
--                  8. staging.f_vdm1_stage2_customer_category()
--                  9. staging.f_vdm1_stage2_film_category()
--                 10. staging.f_vdm1_stage2_customer_film_category();
--                 11. staging.f_vdm1_stage2_cleanup()

--     #### #### #### ####
--         STAGE 2 END
--     #### #### #### ####

--     #### #### #### ####
--         STAGE 3 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. staging.vdm1_stage3();


--             FUNCTIONS

--                  1. staging.f_vdm1_stage3_create_table_new_releases()
--                  2. staging.f_vdm1_stage3_create_table_failed_returns()
--                  3. staging.f_vdm1_stage3_create_table_category_count_init()
--                  4. staging.f_vdm1_stage3_create_table_customer_watch_history_details()
--                  5. staging.f_vdm1_stage3_create_table_cx_reclist_master_nonspecific()
--                  6. staging.f_vdm1_stage3_create_table_cx_reclist_master_specific()
--                  7. staging.f_vdm1_stage3_create_table_customer_rec_custom_preferences()
--                  8. staging.f_vdm1_stage3_table_changes()
--                  9. staging.f_vdm1_stage3_cleanup()


--     #### #### #### ####
--         STAGE 3 END
--     #### #### #### ####

--     #### #### #### ####
--         STAGE 4 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. staging.vdm1_stage4();
--                  2. staging.vdm1_stage4a();
--                  3. staging.vdm1_stage4b();
--                  4. staging.vdm1_stage4c();


--             FUNCTIONS

--                  1. staging.f_vdm1_stage4_calc_update_category_popularity_count()
--                  2. staging.f_vdm1_stage4_calc_update_film_popularity_count()
--                  3. staging.f_vdm1_stage4_calc_update_film_popularity_row_number()
--                  4. staging.f_vdm1_stage4_calc_update_film_category_popularity_row_number()
--                  5. staging.f_vdm1_stage4_calc_update_film_inventory_count()
--                  6. staging.f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
--                  7. staging.f_vdm1_stage4_calc_update_cuscat_count_null_corrections()
--                  8. staging.f_vdm1_stage4_calc_update_cuscat_historical_count()
--                  9. staging.f_vdm1_stage4_calc_update_cuscat_average_count()
--                 10. staging.f_vdm1_stage4_calc_update_cuscat_halfaverage_count()
--                 11. staging.f_vdm1_stage4_calc_update_cuscat_recorder_historical()
--                 12. staging.f_vdm1_stage4_calc_update_cuscat_recorder_average()
--                 13. staging.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage()
--                 14. staging.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default()
--                 15. staging.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order()
--                 16. staging.f_vdm1_stage4_calc_update_customer_watch_history_row_number()
--                 17. staging.f_vdm1_stage4_calc_insert_failed_returns_v2()
--                 18. staging.f_vdm1_stage4_calc_insert_new_releases_v2()
--                 19. staging.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat
--                 20. staging.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific()
--                 21. staging.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn()
--                 22. staging.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();
--                 23. staging.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();
--                 24. staging.f_vdm1_stage4_transform_customer_full_name(p_first_name VARCHAR, p_last_name VARCHAR)
--                 25. staging.f_vdm1_stage4_transform_filmlength_int2vchar(p_length INTEGER)
--                 26. staging.f_vdm1_stage4_calc_expected_return_date(p_film_id INT, p_rental_date DATE)
--                 27. staging.f_vdm1_stage4_cleanup()


--     #### #### #### ####
--         STAGE 4 END
--     #### #### #### ####

--     #### #### #### ####
--         STAGE 5 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. staging.vdm1_stage5();

--             FUNCTIONS

--                   1. staging.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific(); 
--                   2. staging.f_vdm1_stage5_createtable_cx_reclist_summary_specific();
--                   3. staging.f_vdm1_stage5_create_table_inventory_maintenance_summary();
--                   4. staging.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();
--                   5. staging.f_vdm1_stage5_insert_cx_reclist_summary_specific();
--                   6. staging.f_vdm1_stage5_create_mview_customer_details(); 
--                   7. staging.f_vdm1_stage5_create_mview_store_details(); 
--                   8. staging.f_vdm1_stage5_create_mview_location_details(); 
--                   9. staging.f_vdm1_stage5_create_mview_film_details(); 
--                  10. staging.f_vdm1_stage5_datestamp()
--                  11. staging.f_vdm1_stage4_cleanup()

--     #### #### #### ####
--         STAGE 5 END
--     #### #### #### ####

--     #### #### #### ####
--       TRIGGERS BEGIN
--     #### #### #### ####

--              TRIGGER FUNCTIONS

--                   1. marketing.t_f_insert_failed_return();
--                   2. marketing.t_f_insert_new_category();
--                   3. marketing.t_f_insert_new_customer();
--                   4. marketing.t_f_insert_new_film();
--                   5. marketing.t_f_insert_new_inventory();
--                   6. marketing.t_f_insert_update_customer_rec_custom_preferences();
--                   7. marketing.t_f_update_category_popularity();
--                   8. marketing.t_f_update_customer_category();
--                   9. marketing.t_f_update_customer_reclist_master_nonspecific();
--                  10. marketing.t_f_update_customer_reclist_master_specific();
--                  11. marketing.t_f_update_customer_reclist_summary_nonspecific();
--                  12. marketing.t_f_update_customer_reclist_summary_specific();
--                  13. marketing.t_f_insert_customer_watch_history();
--                  14. marketing.t_f_update_film_category_popularity();
--                  15. marketing.t_f_update_inventory_maintenance();
--                  16. marketing.t_f_update_new_release();
--                  17. marketing.t_f_update_rental_return();


--             TRIGGERS

--                   1. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.RENTAL :: insert_customer_watch_history
--                   2. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.CUSTOMER :: insert_new_customer
--                   3. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.CATEGORY :: insert_new_category
--                   4. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.INVENTORY :: insert_new_inventory
--                   5. CREATE TRIGGER :: AFTER UPDATE :: PUBLIC.RENTAL :: update_rental_return 
--                   6. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.RENTAL :: insert_failed_return
--                   7. CREATE TRIGGER :: AFTER INSERT :: PUBLIC.FILM_CATEGORY :: insert_new_film
--                   8. CREATE TRIGGER :: AFTER INSERT :: MARKETING.CUSTOMER_WATCH_HISTORY_DETAILED :: update_customer_category
--                   9. CREATE TRIGGER :: AFTER INSERT :: MARKETING.CUSTOMER_WATCH_HISTORY_DETAILED :: new_rental_update_category_popularity
--                  10. CREATE TRIGGER :: AFTER INSERT :: MARKETING.CUSTOMER_WATCH_HISTORY_DETAILED :: update_film_category_popularity
--                  11. CREATE TRIGGER :: AFTER INSERT :: MARKETING.CUSTOMER_WATCH_HISTORY_DETAILED :: update_inventory_maintenance
--                  12. CREATE TRIGGER :: AFTER INSERT :: MARKETING.CUSTOMER_WATCH_HISTORY_DETAILED :: update_customer_reclist_master_nonspecific
--                  13. CREATE TRIGGER :: AFTER INSERT :: MARKETING.CUSTOMER_WATCH_HISTORY_DETAILED :: update_customer_reclist_master_specific
--                  14. CREATE TRIGGER :: AFTER UPDATE :: MARKETING.FILM_CATEGORY_POPULARITY :: update_new_release
--                  15. CREATE TRIGGER :: AFTER INSERT OR UPDATE :: MARKETING.CUSTOMER_REC_CUSTOM_PREFERNCES :: insert_update_customer_rec_custom_preferences
--                  16. CREATE TRIGGER :: AFTER INSERT OR UPDATE OR DELETE :: MARKETING.CUSTOMER_RECLIST_MASTER_NONSPECIFIC :: update_customer_reclist_master_nonspecific_summary
--                  17. CREATE TRIGGER :: AFTER INSERT OR UPDATE OR DELETE :: MARKETING.CUSTOMER_RECLIST_MASTER_SPECIFIC :: update_customer_reclist_master_specific_summary



--     #### #### #### ####
--        TRIGGERS END
--     #### #### #### ####




-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 0 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####   SCHEMA CREATION   #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

CREATE SCHEMA IF NOT EXISTS marketing;

-- #### #### #### #### #### #### #### #### 




CREATE SCHEMA IF NOT EXISTS vdm1_etl;


-- #### #### #### #### #### #### #### #### 

-- DROP SCHEMA IF EXISTS staging
--    CASCADE;

-- #### #### #### #### #### #### #### #### 

CREATE SCHEMA IF NOT EXISTS staging;

-- #### #### #### #### #### #### #### #### 


-- CREATE SCHEMA IF NOT EXISTS extensions;


-- #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  SCHEMA PRVILAGES   #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


-- #### #### #### #### #### #### #### #### 


-- GRANT USAGE ON SCHEMA extensions TO public;
-- GRANT USAGE ON SCHEMA extensions TO staging;
-- GRANT USAGE ON SCHEMA extensions TO marketing;

-- GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA extensions TO public;
-- GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA extensions TO staging;
-- GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA extensions TO marketing;

-- ALTER DEFAULT PRIVILEGES IN SCHEMA extensions
-- 	GRANT EXECUTE ON FUNCTIONS TO public;
--	GRANT EXECUTE ON FUNCTIONS TO staging;
--	GRANT EXECUTE ON FUNCTIONS TO marketing;

-- ALTER DEFAULT PRIVILEGES IN SCHEMA extensions
-- 	GRANT USAGE ON TYPES TO public;
--	GRANT USAGE ON TYPES TO staging;
--	GRANT USAGE ON TYPES TO marketing;


-- #### #### #### #### 

-- RESOURCE LINKS:
-- https://stackoverflow.com/questions/12986368/installing-postgresql-extension-to-all-schemas


-- #### #### #### #### #### #### #### ####


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####      EXTENSION      #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

CREATE EXTENSION IF NOT EXISTS intarray SCHEMA extensions;


-- #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####     DATA TYPES      #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


-- CREATE TYPE staging.mpaa_rating AS ENUM
-- 	('G', 'PG', 'PG-13', 'R', 'NC-17');

-- #### #### #### #### #### #### #### #### 

-- CREATE TYPE marketing.mpaa_rating AS ENUM
-- 	('G', 'PG', 'PG-13', 'R', 'NC-17');


-- #### #### #### #### #### #### #### #### 



-- CREATE TYPE staging.category_rank AS ENUM
--     ('S', 'A', 'B', 'C', 'D', 'E', 'F');


-- #### #### #### #### #### #### #### #### 


-- CREATE TYPE marketing.category_rank AS ENUM
--     ('S', 'A', 'B', 'C', 'D', 'E', 'F');


-- #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


CREATE OR REPLACE PROCEDURE staging.vdm1_etl_main()
	LANGUAGE plpgsql
	AS $etl_main_run$
	
	BEGIN 

		CALL staging.vdm1_stage1();

		CALL staging.vdm1_stage2();

		CALL staging.vdm1_stage3();

        -- DISABLING MAIN RUN DUE TO PERFORMANCE/TIME IMPACT
        -- CALL staging.vdm1_stage4();

            -- STAGE 4 HAS BEEN SPLIT INTO 3 SUBPARTS TO ASSIST WITH PERFORMANCE IMPACT
            CALL staging.vdm1_stage4a();

            CALL staging.vdm1_stage4b();

            CALL staging.vdm1_stage4c();

        -- CALL staging.vdm1_stage5();

	END;
$etl_main_run$;
	
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 0 END     #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 1 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


CREATE OR REPLACE PROCEDURE staging.vdm1_stage1()
	LANGUAGE plpgsql
	AS $vdm1_stage1run$

    BEGIN 

        -- RUN CUSTOMER STATUS AMEND PROCEDURE BEFORE IMPORTING
        -- This modifies the production database not the staging database. 
        -- This has to be ran before ETL to correct the issue before Extract occurs. 
        -- Secondary copy has been created in staging that runs at the beginning of Stage 2. 
        -- CALL public.customer_status_amend();

        -- #### #### #### #### 
        
        -- IMPORT CUSTOMER TABLE
        PERFORM staging.f_vdm1_stage1_extractimport('customer');

        -- IMPORT ADDRESSS TABLE
        PERFORM staging.f_vdm1_stage1_extractimport('address');

        -- IMPORT CITY TABLE
        PERFORM staging.f_vdm1_stage1_extractimport('city');

        -- IMPORT COUNTRY TABLE
        PERFORM staging.f_vdm1_stage1_extractimport('country');

        -- IMPORT STORE TABLE
        PERFORM staging.f_vdm1_stage1_extractimport('store');

        -- #### #### #### #### 

        -- IMPORT FILM TABLE
        PERFORM staging.f_vdm1_stage1_extractimport('film');

        -- IMPORT FILM_CATEORY TABLE
        PERFORM staging.f_vdm1_stage1_extractimport('film_category');

        -- IMPORT CATGEORY TABLE
        PERFORM staging.f_vdm1_stage1_extractimport('category');

        -- #### #### #### #### 
        
        -- IMPORT RENTAL TABLE 
        PERFORM staging.f_vdm1_stage1_extractimport('rental');

        -- IMPORT INVENTORY TABLE
        PERFORM staging.f_vdm1_stage1_extractimport('inventory');

        -- IMPORT LANGUAGE TABLE 
        PERFORM staging.f_vdm1_stage1_extractimport('language');
        
        -- #### #### #### #### 


    END;
$vdm1_stage1run$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--     1. staging.f_vdm1_stage1_extractimport(tablename VARCHAR(30)) 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage1_extractimport(tablename VARCHAR(30)) 
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage1extract$
		
	BEGIN
	 
		EXECUTE
			'CREATE UNLOGGED TABLE IF NOT EXISTS staging.vdm1_stage1_' || tablename || ' AS 
				SELECT * FROM public.' || tablename;
	
	END;
$vdm1_stage1extract$;

-- #### #### #### #### #### #### #### #### 




-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 1 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 2 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


CREATE OR REPLACE PROCEDURE staging.vdm1_stage2()
	LANGUAGE plpgsql
	AS $vdm1_stage2run$
	
	BEGIN

        -- RUN CUSTOMER STATUS AMEND PROCEDURE FIRST
        -- CALL staging.f_customer_status_amend();

        -- RUN CUSTOMER STATUS AMEND FUNCTION ON STAGE1_CUSTOMER Table to amend the activebool column
        EXECUTE staging.f_vdm1_stage2_customer_status_amend();

        -- #### #### #### #### 
	
        -- Inner Join Tables

		EXECUTE staging.f_vdm1_stage2_films();
		
		EXECUTE staging.f_vdm1_stage2_film_inventory();
		
		EXECUTE staging.f_vdm1_stage2_rentals();
		
		EXECUTE staging.f_vdm1_stage2_locationdetails();
		
		EXECUTE staging.f_vdm1_stage2_stores();
		
		EXECUTE staging.f_vdm1_stage2_customers();

        -- #### #### #### #### 

        -- Cross Join Tables

		EXECUTE staging.f_vdm1_stage2_customer_category();
		
		EXECUTE staging.f_vdm1_stage2_film_category();

        EXECUTE staging.f_vdm1_stage2_customer_film_category();
		
        -- #### #### #### #### 
        
		EXECUTE staging.f_vdm1_stage2_cleanup();
	
	
	END;
$vdm1_stage2run$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--      1. staging.f_vdm1_stage2_customer_status_admend()
--      2. staging.f_vdm1_stage2_films()
--      3. staging.f_vdm1_stage2_film_inventory()
--      4. staging.f_vdm1_stage2_rentals()
--      5. staging.f_vdm1_stage2_locationdetails()
--      6. staging.f_vdm1_stage2_stores()
--      7. staging.f_vdm1_stage2_customers()
--      8. staging.f_vdm1_stage2_customer_category()
--      9. staging.f_vdm1_stage2_film_category()
--     10. staging.f_vdm1_stage2_customer_film_category()
--     11. staging.f_vdm1_stage2_cleanup()


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 



CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_customer_status_amend()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_films()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_film_inventory()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_rentals()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_locationdetails()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_stores()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_customers()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_customer_category()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_film_category()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_customer_film_category()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_cleanup()
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

-- #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 2 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 3 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####



-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE PROCEDURE staging.vdm1_stage3()
	LANGUAGE plpgsql
	AS $vdm1_stage3_run$
	
	BEGIN 
	
		PERFORM staging.f_vdm1_stage3_create_table_new_releases();
		
		PERFORM staging.f_vdm1_stage3_create_table_failed_returns();


		-- #### #### #### #### 

        PERFORM staging.f_vdm1_stage3_create_table_category_count_init();

		-- #### #### #### #### 

		PERFORM staging.f_vdm1_stage3_create_table_customer_watch_history_details();
		
        PERFORM staging.f_vdm1_stage3_create_table_cx_reclist_master_nonspecific();

		PERFORM staging.f_vdm1_stage3_create_table_cx_reclist_master_specific();

        PERFORM staging.f_vdm1_stage3_create_table_customer_rec_custom_preferences();

		-- #### #### #### #### 
		
		PERFORM staging.f_vdm1_stage3_table_changes();
		
		PERFORM staging.f_vdm1_stage3_cleanup();
		
	END;
$vdm1_stage3_run$;

-- #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--      1. staging.f_vdm1_stage3_create_table_new_releases()
--      2. staging.f_vdm1_stage3_create_table_failed_returns()
--      3. staging.f_vdm1_stage3_create_table_category_count_init()
--      4. staging.f_vdm1_stage3_create_table_customer_watch_history_details()
--      5. staging.f_vdm1_stage3_create_table_cx_reclist_master_nonspecific()
--      6. staging.f_vdm1_stage3_create_table_cx_reclist_master_specific()
--      7. staging.f_vdm1_stage3_create_table_customer_rec_custom_preferences()
--      8. staging.f_vdm1_stage3_table_changes()
--      9. staging.f_vdm1_stage3_cleanup()


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_new_releases()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_new_releases$
	
	BEGIN 
	
		CREATE TABLE staging.vdm1_stage3_new_releases(

			  film_id INTEGER NOT NULL
			, status BOOLEAN NOT NULL DEFAULT TRUE
		
        );
	
	END;
$vdm1_stage3_create_table_new_releases$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_failed_returns()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 



-- #### #### #### #### #### #### #### #### 


-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_category_count_init()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_category_count_init$
	
	BEGIN 

        CREATE UNLOGGED TABLE IF NOT EXISTS staging.vdm1_stage3_category_count_init AS 
            SELECT * FROM staging.vdm1_stage3_dictkey_category;

    END;

$vdm1_stage3_create_table_category_count_init$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_customer_watch_history_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_cxwatchhistory_details$
	
	BEGIN 
	
        CREATE TABLE staging.vdm1_stage3_customer_watch_history_details AS (

            SELECT 
                  a.customer_id
                , b.city_id
                , b.country_id


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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_cx_reclist_master_nonspecific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_customer_reclist_master_nonspecific$
	
	BEGIN 
	
        CREATE TABLE staging.vdm1_stage3_customer_reclist_master_nonspecific (

                  customer_id INTEGER NOT NULL 
                , film_rank INTEGER NULL
                , category_id INTEGER NOT NULL
                , film_rec_order INTEGER NULL
                , film_id INTEGER NOT NULL
                , film_category_rank INTEGER NOT NULL		
                , total_rentals INTEGER NOT NULL
        );
	END;
$vdm1_stage3_create_table_customer_reclist_master_nonspecific$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_cx_reclist_master_specific()
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
                , film_category_rank INTEGER NOT NULL		
                , total_rentals INTEGER NOT NULL
        );
	END;
$vdm1_stage3_create_table_customer_reclist_master_specific$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_customer_rec_custom_preferences()
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



-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_table_changes()
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
			ADD COLUMN film_category_rank INTEGER DEFAULT NULL;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_films
			ADD COLUMN new_release BOOLEAN NOT NULL DEFAULT FALSE;
						
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


			
	END;
$vdm1_stage3_table_changes$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_cleanup()
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

-- #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 3 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 4 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE PROCEDURE staging.vdm1_stage4()
	LANGUAGE plpgsql
	AS $vdm1_stage4run$
	
	BEGIN 
	
    
		PERFORM staging.f_vdm1_stage4_calc_update_customer_watch_history_row_number();

		PERFORM staging.f_vdm1_stage4_calc_update_category_popularity_count();

        PERFORM staging.f_vdm1_stage4_calc_update_film_popularity_count();

		PERFORM staging.f_vdm1_stage4_calc_update_film_inventory_count();

        -- #### #### #### #### 

        PERFORM staging.f_vdm1_stage4_calc_update_cuscat_count_null_corrections();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_historical_count();

    	PERFORM staging.f_vdm1_stage4_calc_update_cuscat_average_count();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_halfaverage_count();

        PERFORM staging.f_vdm1_stage4_calc_update_film_inventory_flag_inspection();

        
		-- #### #### #### #### 

		PERFORM staging.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat();


		-- #### #### #### #### 

        PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_historical();

        PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_average();

        PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order();


        -- #### #### #### #### 

        PERFORM staging.f_vdm1_stage4_calc_update_film_popularity_row_number();

		PERFORM staging.f_vdm1_stage4_calc_update_film_category_popularity_row_number();

		-- #### #### #### #### 

		PERFORM staging.f_vdm1_stage4_calc_insert_failed_returns_v2();

		PERFORM staging.f_vdm1_stage4_calc_insert_new_releases_v2();

		PERFORM staging.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific();

		PERFORM staging.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn();

		PERFORM staging.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();

		PERFORM staging.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();		
		
		-- #### #### #### #### 

		PERFORM staging.f_vdm1_stage4_cleanup();

	END;
$vdm1_stage4run$;

-- #### #### #### #### #### #### #### #### 


CREATE OR REPLACE PROCEDURE staging.vdm1_stage4a()
	LANGUAGE plpgsql
	AS $vdm1_stage4a_run$

	
	BEGIN 
	
        PERFORM staging.f_vdm1_stage4_calc_update_customer_watch_history_row_number();

		PERFORM staging.f_vdm1_stage4_calc_update_category_popularity_count();

        -- #### #### #### #### 
        
        PERFORM staging.f_vdm1_stage4_calc_update_film_popularity_count();

		PERFORM staging.f_vdm1_stage4_calc_update_film_inventory_count();

		-- #### #### #### #### 

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_count_null_corrections();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_historical_count();

    	PERFORM staging.f_vdm1_stage4_calc_update_cuscat_average_count();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_halfaverage_count();


        -- #### #### #### #### 

        PERFORM staging.f_vdm1_stage4_calc_update_film_inventory_flag_inspection();

        PERFORM staging.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat();

		-- #### #### #### #### 

		PERFORM staging.f_vdm1_stage4_calc_insert_failed_returns_v2();

		PERFORM staging.f_vdm1_stage4_calc_insert_new_releases_v2();
        

	END;
$vdm1_stage4a_run$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE PROCEDURE staging.vdm1_stage4b()
	LANGUAGE plpgsql
	AS $vdm1_stage4b_run$

	
	BEGIN 


 -- #### #### #### ####      

        PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_historical();

        PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_average();

        PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order();


        -- #### #### #### #### 

        PERFORM staging.f_vdm1_stage4_calc_update_film_popularity_row_number();

		PERFORM staging.f_vdm1_stage4_calc_update_film_category_popularity_row_number();


    END;
$vdm1_stage4b_run$;

-- #### #### #### #### #### #### #### #### 


CREATE OR REPLACE PROCEDURE staging.vdm1_stage4c()
	LANGUAGE plpgsql
	AS $vdm1_stage4c_run$

	
	BEGIN 
        
        -- #### #### #### #### 


		PERFORM staging.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific();

        PERFORM staging.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn();

        PERFORM staging.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();

		PERFORM staging.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();

		-- #### #### #### #### 

		PERFORM staging.f_vdm1_stage4_cleanup();


    END;
$vdm1_stage4c_run$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--      1. staging.f_vdm1_stage4_calc_update_category_popularity_count()
--      2. staging.f_vdm1_stage4_calc_update_film_popularity_count()
--      3. staging.f_vdm1_stage4_calc_update_film_popularity_row_number()
--      4. staging.f_vdm1_stage4_calc_update_film_category_popularity_row_number()
--      5. staging.f_vdm1_stage4_calc_update_film_inventory_count()
--      6. staging.f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
--      7. staging.f_vdm1_stage4_calc_update_cuscat_count_null_corrections()
--      8. staging.f_vdm1_stage4_calc_update_cuscat_historical_count()
--      9. staging.f_vdm1_stage4_calc_update_cuscat_average_count()
--     10. staging.f_vdm1_stage4_calc_update_cuscat_halfaverage_count()
--     11. staging.f_vdm1_stage4_calc_update_cuscat_recorder_historical()
--     12. staging.f_vdm1_stage4_calc_update_cuscat_recorder_average()
--     13. staging.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage()
--     14. staging.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default()
--     15. staging.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order()
--     16. staging.f_vdm1_stage4_calc_update_customer_watch_history_row_number()
--     17. staging.f_vdm1_stage4_calc_insert_failed_returns_v2()
--     18. staging.f_vdm1_stage4_calc_insert_new_releases_v2()
--     19. staging.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat
--     20. staging.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific()
--     21. staging.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn()
--     22. staging.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();
--     23. staging.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();
--     24. staging.f_vdm1_stage4_transform_customer_full_name(p_first_name VARCHAR, p_last_name VARCHAR)
--     25. staging.f_vdm1_stage4_transform_filmlength_int2vchar(p_length INTEGER)
--     26. staging.f_vdm1_stage4_calc_expected_return_date(p_film_id INT, p_rental_date DATE)
--     27. staging.f_vdm1_stage4_cleanup()


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_category_popularity_count()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_film_popularity_count()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_film_popularity_row_number()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_film_category_popularity_row_number()
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

-- #### #### #### #### #### #### #### #### 


-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_film_inventory_count()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 
 
CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
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


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cuscat_count_null_corrections()
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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cuscat_historical_count()
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


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cuscat_average_count()
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


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cuscat_halfaverage_count()
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


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cuscat_recorder_historical()
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


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    12     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cuscat_recorder_average()
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


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage()
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

-- #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    14     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default()
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

 
-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    15     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order()
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

 
-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    16     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_customer_watch_history_row_number()
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




-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    17     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_failed_returns_v2()
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
			, staging.f_vdm1_stage4_calc_expected_return_date(a.film_id::int, rental_date::DATE) as expected_return_date
            , (SELECT AGE('2007-01-01', staging.f_vdm1_stage4_calc_expected_return_date(a.film_id::int, rental_date::DATE))) as age
		FROM staging.vdm1_stage4_rentals a
			INNER JOIN staging.vdm1_stage4_customers b
				ON b.customer_id = a.customer_id
			INNER JOIN staging.vdm1_stage4_films c
                ON c.film_id = a.film_id
	                
		WHERE a.return_date IS NULL;

	END;
$vdm1_stage4_calc_insert_failed_returns$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    18     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_new_releases_v2()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_new_releases$
	
	BEGIN 


		INSERT INTO staging.vdm1_stage4_new_releases(
			  film_id
		)		
		
		SELECT
			  film_id
		FROM staging.vdm1_stage4_films
		
		WHERE new_release = true;
		
	END;
$vdm1_stage4_calc_insert_new_releases$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    19     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat()
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
		historyfromrecommended as (
			(SELECT * FROM staging.vdm1_stage4_customer_film_category)
				INTERSECT  
			(SELECT * FROM get_customer_watch_history)
		)

		DELETE FROM staging.vdm1_stage4_customer_film_category a

		WHERE EXISTS  (
			SELECT * FROM historyfromrecommended b
			where b.customer_id = a.customer_id AND b.film_id = a.film_id);

		
	END;
$vdm1_stage4_calc_delete_customer_film_category$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    20     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific()
    RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_reclist_master_nonspecific$

	BEGIN 


    INSERT INTO staging.vdm1_stage4_customer_reclist_master_nonspecific(

			  customer_id
			, film_rank
            , category_id
			, film_id
			, film_category_rank
			, total_rentals
		)	
    
	WITH get_customer_film_cat_x_film_cat_pop AS (

		SELECT
			  a.customer_id
			, b.film_rank
			, a.category_id
			, a.film_id
			, b.film_category_rank
			, b.total_rentals
		FROM staging.vdm1_stage4_customer_film_category a
			LEFT JOIN 
				staging.vdm1_stage4_film_category_popularity b
					ON b.film_id = a.film_id 

		ORDER BY 
			a.customer_id, a.film_id	
	)
    
    SELECT
	      customer_id
	    , film_rank
	    , category_id
        , film_id
		, film_category_rank
	    , total_rentals
    FROM get_customer_film_cat_x_film_cat_pop;


    
	END;
$vdm1_stage4_calc_insert_customer_reclist_master_nonspecific$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### ####
-- ####    21     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_reclist_master_nonspecific_row_number$
	
	
	BEGIN
		
		WITH get_customer_reclist_master_nonspecific_values AS (

			SELECT
				  customer_id
				, film_rank
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
			FROM staging.vdm1_stage4_customer_reclist_master_nonspecific
		),
		assign_row_number AS (

			SELECT
				  customer_id
				, film_rank
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
				, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY film_rank) as rental_rec_order_rn
			FROM get_customer_reclist_master_nonspecific_values
		)


		UPDATE staging.vdm1_stage4_customer_reclist_master_nonspecific a

		SET film_rec_order = assign_row_number.rental_rec_order_rn

		FROM assign_row_number 	  

		WHERE 
			(a.customer_id = assign_row_number.customer_id
				AND
			a.film_id = assign_row_number.film_id);
			
	END;

$vdm1_stage4_calc_update_customer_reclist_master_nonspecific_row_number$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    22     #### 
-- #### #### #### ####


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_reclist_master_specific_default$

	BEGIN


    INSERT INTO staging.vdm1_stage4_customer_reclist_master_specific(

			  customer_id           -- customer id
		    , cat_rec_order         -- customer's category rec order     
		    , category_id           -- category id 
            , film_id               -- film id
		    , film_category_rank    -- film rank by category
		    , total_rentals         -- Film's Total Rentals
		)	

	WITH combined_master_with_cxcat AS (

		SELECT 
			a.customer_id
			, CASE
			  	WHEN EXISTS (SELECT b.customer_id FROM staging.vdm1_stage4_customer_category b where b.customer_id = a.customer_id)
			  		THEN b.recommendation_order_customer_preference
			  	ELSE b.recommendation_order_historical
			  END as cat_rec_order 
			, a.category_id
			, a.film_id
			, a.film_category_rank
			, a.total_rentals
		FROM 
			staging.vdm1_stage4_customer_reclist_master_nonspecific a
				LEFT JOIN 
					staging.vdm1_stage4_customer_category b
						ON b.customer_id = a.customer_id
						
		WHERE
			(b.customer_id = a.customer_id
				AND
			b.category_id = a.category_id)
				AND
			b.recommendation_order_historical IN (
				SELECT recommendation_order_historical
					FROM 
				staging.vdm1_stage4_customer_category)

		ORDER BY
			a.customer_id, 2, a.film_category_rank DESC
	)

    SELECT
		  customer_id
		, cat_rec_order
		, category_id 
		, film_id
		, film_category_rank
		, total_rentals
    FROM combined_master_with_cxcat;



	END;

$vdm1_stage4_calc_insert_customer_reclist_master_specific_default$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### ####
-- ####    23     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_reclist_master_specific_row_number$
	
	
	BEGIN
		
		WITH get_customer_reclist_master_specific_values AS (

			SELECT
				  customer_id
				, cat_rec_order
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
			FROM staging.vdm1_stage4_customer_reclist_master_specific
		),
		assign_row_number AS (

			SELECT
				  customer_id
				, cat_rec_order
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
				, ROW_NUMBER() OVER(PARTITION BY customer_id, cat_rec_order ORDER BY cat_rec_order, film_category_rank) AS rental_rec_order_rn
			FROM get_customer_reclist_master_specific_values
		)


		UPDATE staging.vdm1_stage4_customer_reclist_master_specific a

		SET rental_rec_order = assign_row_number.rental_rec_order_rn

		FROM assign_row_number 	  

		WHERE 
			(a.customer_id = assign_row_number.customer_id
				AND
			a.film_id = assign_row_number.film_id);
			
	END;

$vdm1_stage4_calc_update_customer_reclist_master_specific_row_number$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    24    #### 
-- #### #### #### ####


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_transform_customer_full_name(
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
-- ####    25     #### 
-- #### #### #### ####



CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_transform_filmlength_int2vchar(
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
-- ####    26     #### 
-- #### #### #### ####




CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_expected_return_date(
		p_film_id INT,
		p_rental_date DATE)
	RETURNS DATE
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_expectedreturndate$
	
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
			FROM staging.vdm1_stage4_films a
			WHERE vi_film_id = a.film_id;

			vo_expected_return_date := vi_rental_date + vlu_rental_duration;

		RETURN vo_expected_return_date;
	END;
$vdm1_stage4_calc_expectedreturndate$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### ####
-- ####    27     #### 
-- #### #### #### ####


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_cleanup$
	
	BEGIN
		

		-- #### #### #### ####
	
		DROP TABLE IF EXISTS staging.vdm1_stage4_rentals;
		
		DROP TABLE IF EXISTS staging.vdm1_stage4_customer_film_category;
		
		
		-- #### #### #### #### 
		
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

		-- #### #### #### #### 

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

        -- #### #### #### #### 


	END;
$vdm1_stage4_cleanup$;

-- #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 4 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 5 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


CREATE OR REPLACE PROCEDURE staging.vdm1_stage5()
	LANGUAGE plpgsql
	AS $vdm1_stage5_run$
	
	BEGIN 


        -- #### #### #### #### #### #### #### #### 


        PERFORM staging.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific();

        PERFORM staging.f_vdm1_stage5_createtable_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 

        PERFOMR staging.f_vdm1_stage5_create_table_inventory_maintenance_summary();

        PERFORM staging.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();

        PERFORM staging.f_vdm1_stage5_insert_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 


        PERFORM staging.f_vdm1_stage5_create_mview_customer_details(); 

        PERFORM staging.f_vdm1_stage5_create_mview_store_details(); 

        PERFORM staging.f_vdm1_stage5_create_mview_location_details(); 
        
        PERFORM staging.f_vdm1_stage5_create_mview_film_details(); 



        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage5_run$;



-- #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--      1. staging.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific(); 
--      2. staging.f_vdm1_stage5_createtable_cx_reclist_summary_specific();
--      3. staging.f_vdm1_stage5_create_table_inventory_maintenance_summary();
--      4. staging.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();
--      5. staging.f_vdm1_stage5_insert_cx_reclist_summary_specific();
--      6. staging.f_vdm1_stage5_create_mview_customer_details(); 
--      7. staging.f_vdm1_stage5_create_mview_store_details(); 
--      8. staging.f_vdm1_stage5_create_mview_location_details(); 
--      9. staging.f_vdm1_stage5_create_mview_film_details(); 
--     10. staging.f_vdm1_stage5_datestamp()
--     11. staging.f_vdm1_stage4_cleanup()


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_table_customer_reclist_summary_nonspecific$
	
	BEGIN 

		CREATE TABLE staging.vdm1_stage5_customer_reclist_summary_nonspecific AS (

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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_createtable_cx_reclist_summary_specific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_table_customer_reclist_summary_specific$

    BEGIN

        CREATE TABLE staging.vdm1_stage5_customer_reclist_summary_specific AS (
            
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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_create_table_inventory_maintenance_summary()
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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific()
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
	
	END;
$vdm1_stage5_insert_customer_reclist_summary_nonspecific$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_insert_cx_reclist_summary_specific()
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

CREATE OR REPLACE FUNCTION stating.f_vdm1_stage5_create_mview_customer_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_materialized_view_customer_details$
	
	BEGIN 
	
        CREATE MATERIALIZED VIEW marketing.customer_details AS (

            SELECT 
                a.customer_id
                , a.store_id
                , a.first_name
                , a.last_name
                , vdm1_etl.f_transform_customer_full_name(a.first_name, a.last_name) AS full_name
                , a.email
                , a.create_date
                , a.activebool
                , b.phone
                , c.city
                , d.country
            FROM 
                public.customer AS a
                
                    INNER JOIN 
                        public.address AS b
                            ON b.address_id = a.address_id
                    
                        INNER JOIN 
                            public.city AS c
                                ON c.city_id = b.address_id
                        
                            INNER JOIN 
                                public.country AS d
                                    ON d.country_id = c.country_id

            ORDER BY
                a.customer_id
        );
	
	END;
$vdm1_stage5_create_materialized_view_customer_details$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_create_mview_store_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_materialized_view_store_details$
		
	BEGIN 

		CREATE MATERIALIZED VIEW marketing.store_details AS (

			SELECT
				  a.store_id
                  b.address_id
                , b.address
                , b.address2
                , b.district
                , c.city
                , d.country
                , b.postal_code
                , b.phone

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


		);
		
	END;
$vdm1_stage5_create_materialized_view_store_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_create_mview_location_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_materialized_view_location_details$
		
	BEGIN 
	
        CREATE MATERIALIZED VIEW marketing.customer_details AS (
        
            SELECT 

                  a.address_id
                , a.address
                , a.address2
                , a.district
                , b.city
                , c.country
                , a.postal_code
                , a.phone

            FROM 
                public.address AS a
                
                
                INNER JOIN 
                    public.city AS b
                        ON b.city_id = a.city_id
                
                
                    INNER JOIN 
                        public.country AS c
                            ON c.country_id = b.country_id
        
        );

    END;
$vdm1_stage5_create_materialized_view_location_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_create_mview_film_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_materialized_view_film_details$
	
	BEGIN 
		
		CREATE MATERIALIZED VIEW marketing.film_details AS (

			SELECT

				  a.film_id
				, a.title
				, b.category_id
				, a.release_year
				, c.name
				, vdm1_etl.f_transform_film_length_int2vhar(a.length) as legnth
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
		);

	END;
$vdm1_stage5_create_materialized_view_film_details$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_datestamp()
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
-- ####    11     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_cleanup()
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
$vdm1_stage5_cleanup$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    12     #### 
-- #### #### #### #### 


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    14     #### 
-- #### #### #### #### 


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    15     #### 
-- #### #### #### #### 


-- #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 5 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####   TRIGGERS BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####   TRIGGER FUNCTIONS #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS 

--   TRIGGER FUNCTIONS

--        1. marketing.t_f_insert_failed_return();
--        2. marketing.t_f_insert_new_category();
--        3. marketing.t_f_insert_new_customer();
--        4. marketing.t_f_insert_new_film();
--        5. marketing.t_f_insert_new_inventory();
--        6. marketing.t_f_insert_update_customer_rec_custom_preferences();
--        7. marketing.t_f_update_category_popularity();
--        8. marketing.t_f_update_customer_category();
--        9. marketing.t_f_update_customer_reclist_master_nonspecific();
--       10. marketing.t_f_update_customer_reclist_master_specific();
--       11. marketing.t_f_update_customer_reclist_summary_nonspecific();
--       12. marketing.t_f_update_customer_reclist_summary_specific();
--       13. marketing.t_f_insert_customer_watch_history();
--       14. marketing.t_f_update_film_category_popularity();
--       15. marketing.t_f_update_inventory_maintenance();
--       16. marketing.t_f_update_new_release();
--       17. marketing.t_f_update_rental_return();

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_insert_failed_return()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_insert_failed_return$

    BEGIN 
    
    
        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        INSERT INTO marketing.failed_returns(
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
            , marketing.calc_expected_return_date(a.film_id::int, a.rental_date::DATE) as expected_return_date
            , (SELECT AGE('2007-01-01', marketing.calc_expected_return_date(a.film_id::int, a.rental_date::DATE))) as age
        FROM 
            marketing.customer_watch_history_detailed AS a
                LEFT JOIN public.customer AS b
                    ON b.customer_id = a.customer_id 

        WHERE
            a.return_date IS NULL 
                AND 
            a.rental_id = NEW.rental_id;
        
        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### 

        RETURN NEW;

    -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_insert_failed_return$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_insert_new_category()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_insert_new_category$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


	    INSERT INTO marketing.customer_rec_custom_preferences (
              customer_id
			, category_id
			, customer_rec_custom_order
        )

		WITH get_customers_with_custom_rec_preferences AS (

			SELECT
				customer_id 
			FROM 
				marketing.customer_rec_custom_preferences
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
				COUNT(*) AS category_length
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
			cross_join_cuscat_to_catleng
			
			
			; 


		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        INSERT INTO marketing.category_popularity (
              category_id
            , name
            , total_rentals
        )

        SELECT
              category_id
            , name
            , '0'
        FROM
            public.category

        WHERE
            category_id = NEW.category_id;


 		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####        
		
        INSERT INTO marketing.customer_category(
              customer_id
            , category_id
        )

        SELECT
              b.customer_id
            , a.category_id
        FROM public.category AS a
            CROSS JOIN public.customer AS b

        WHERE
            a.category_id = NEW.category_id;
	
		-- #### #### #### #### #### #### #### #### 
	
		UPDATE marketing.customer_category
		
		SET
			  historical_rental_count = 0
			, average_rental_count = 0
			, halfaverage_rental_count = 0
			
		WHERE
			category_id = NEW.category_id;

		-- #### #### #### #### #### #### #### #### 

        UPDATE marketing.customer_category 

        SET 
              recommendation_order_historical = null
			, recommendation_order_average = null
			, recommendation_order_halfaverage = null
			, recommendation_order_customer_preference = null;

		-- #### #### #### #### #### #### #### #### 

        WITH get_customer_category_rec_order_historical AS (
			
            SELECT 
				  a.customer_id
				, a.category_id
				, ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY a.historical_rental_count DESC, b.total_rentals DESC) as recommendation_order_historical

			FROM marketing.customer_category AS a
				INNER JOIN marketing.category_popularity AS b 
					ON b.category_id = a.category_id
		)

		UPDATE marketing.customer_category AS a

		SET 
			recommendation_order_historical = b.recommendation_order_historical

		FROM get_customer_category_rec_order_historical AS b

		WHERE
			b.category_id = a.category_id
                AND
            b.customer_id = a.customer_id;

        -- #### #### #### #### #### #### #### #### 

		WITH get_customer_category_rec_order_average AS (
			SELECT 
				  a.customer_id
				, a.category_id
				, ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY a.average_rental_count DESC, b.total_rentals DESC) as recommendation_order_average

			FROM marketing.customer_category AS a
				INNER JOIN marketing.category_popularity AS b
					ON b.category_id = a.category_id
		)

		UPDATE marketing.customer_category AS a

		SET 
			recommendation_order_average = b.recommendation_order_average

		FROM get_customer_category_rec_order_average AS b

		WHERE
			b.category_id = a.category_id
                AND 
            b.customer_id = a.customer_id;

		-- #### #### #### #### #### #### #### #### 

		WITH get_customer_category_rec_order_halfaverage AS (
			SELECT 
				  a.customer_id
				, a.category_id
				, ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY a.halfaverage_rental_count DESC, b.total_rentals DESC ) as recommendation_order_halfaverage

			FROM marketing.customer_category AS a
				INNER JOIN marketing.category_popularity AS b 
					ON b.category_id = a.category_id
		)

		UPDATE marketing.customer_category AS a

		SET 
			recommendation_order_halfaverage = b.recommendation_order_halfaverage

		FROM get_customer_category_rec_order_halfaverage AS b

		WHERE
			b.category_id = a.category_id
                AND 
            b.customer_id = a.customer_id;
		
	
		-- #### #### #### #### #### #### #### #### 
		
		UPDATE marketing.customer_category
		
		SET
			recommendation_order_customer_preference = recommendation_order_historical
			
		WHERE 
			category_id = category_id 
                AND 
            customer_id = customer_id;

		-- #### #### #### #### #### #### #### #### 
		
		WITH get_customer_custom_rec_preferences AS (
			
			SELECT
				  customer_id
				, category_id
				, customer_rec_custom_order
				, customer_rec_custom_amount
			FROM
				marketing.customer_rec_custom_preferences

		)
		
		UPDATE marketing.customer_category AS a
		
		SET
			recommendation_order_customer_preference = b.customer_rec_custom_order
			
		FROM 
			get_customer_custom_rec_preferences AS b
			
		WHERE
			b.category_id = a.category_id
                AND 
            b.customer_id = a.customer_id;
			
		-- #### #### #### #### #### #### #### #### 
		


		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### ####
		
		RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
	
	END;
$trigger_function_insert_new_category$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_insert_new_customer()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_insert_new_customer$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 
		
			INSERT INTO marketing.customer_category (
				  customer_id
				, category_id
			)

			SELECT
				  a.customer_id
				, b.category_id
			FROM public.customer a
				CROSS JOIN public.category b 

			WHERE
				a.customer_id = NEW.customer_id;
	
		-- #### #### #### #### #### #### #### #### 
	
		UPDATE marketing.customer_category
		
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

		-- #### #### #### #### #### #### #### #### 
		
		WITH calc_recommendation_order_default AS (

            SELECT
				  category_id	
				, ROW_NUMBER() OVER (ORDER BY total_rentals DESC) AS recommendation_order_default
            FROM 
				marketing.category_popularity
        )
		
		UPDATE marketing.customer_category AS a
		
		SET
			  recommendation_order_historical = b.recommendation_order_default
			, recommendation_order_average = b.recommendation_order_default
			, recommendation_order_halfaverage = b.recommendation_order_default
			, recommendation_order_customer_preference = b.recommendation_order_default
			
		FROM calc_recommendation_order_default AS b
		
		WHERE
			a.customer_id = NEW.customer_id
				AND
			b.category_id = a.category_id;
		
				
		-- #### #### #### #### #### #### #### #### 

		INSERT INTO marketing.customer_reclist_master_nonspecific (
			
			  customer_id
			, film_rank
			, category_id
			, film_rec_order
			, film_id
			, film_category_rank
			, total_rentals
		)
		
		SELECT
			  customer_id
			, film_rank
			, category_id
			, film_rank AS film_rec_order
			, film_id
			, film_category_rank
			, total_rentals
			
		FROM
			public.customer
				CROSS JOIN
					marketing.film_category_popularity
		
		WHERE
			customer_id = NEW.customer_id;
			
		-- #### #### #### #### #### #### #### #### 
		
		INSERT INTO marketing.customer_reclist_master_specific (
			
			  customer_id
			, cat_rec_order
			, category_id
			, rental_rec_order
			, film_id
			, film_category_rank
			, total_rentals
		)
		
		WITH combined_master_with_cxcat AS (

			SELECT 
				a.customer_id
				, CASE
					WHEN EXISTS (SELECT b.customer_id FROM marketing.customer_category b where b.customer_id = a.customer_id)
						THEN b.recommendation_order_customer_preference
					ELSE b.recommendation_order_historical
				  END as cat_rec_order 
				, a.category_id			
				, a.film_category_rank AS rental_rec_order
				, a.film_id
				, a.film_category_rank
				, a.total_rentals
			FROM 
				marketing.customer_reclist_master_nonspecific AS a
					LEFT JOIN 
						marketing.customer_category AS b
							ON b.customer_id = a.customer_id

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
					marketing.customer_category)

			ORDER BY
				a.customer_id, 2, a.film_category_rank DESC
		)

		SELECT
			  customer_id
			, cat_rec_order
			, category_id 
			, rental_rec_order
			, film_id
			, film_category_rank
			, total_rentals
		FROM combined_master_with_cxcat

		WHERE
			customer_id = NEW.customer_id;
		
		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### ####
		
		RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
	
	END;
$trigger_function_insert_new_customer$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_insert_new_film()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_insert_new_film$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        INSERT INTO marketing.film_category_popularity (
              film_id
            , category_id
            , total_rentals 
            , film_rank
            , film_category_rank
            , new_release
        )


        WITH get_film_category AS (

            SELECT
                  film_id
                , category_id
            FROM
                public.film_category
            
            WHERE
                film_id = NEW.film_id
        )

        SELECT
              film_id
            , category_id
            , 0
            , null
            , null
            , true
        FROM
            get_film_category;


 		-- #### #### #### #### #### #### #### ####        


        UPDATE marketing.film_category_popularity

        SET
            film_rank = null;


    	-- #### #### #### #### #### #### #### ####        


        WITH generate_film_rank AS (

            SELECT
                  film_id
                , ROW_NUMBER() OVER (ORDER BY a.total_rentals DESC, b.total_rentals DESC) AS film_rank
            FROM 
                marketing.film_category_popularity AS a 
                    LEFT JOIN marketing.category_popularity AS b 
                        ON b.category_id = a.category_id
        )
        
        UPDATE marketing.film_category_popularity AS a

        SET
            film_rank = b.film_rank

        FROM 
            generate_film_rank AS b 

        WHERE 
            b.film_id = a.film_id;

	
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####    


        UPDATE marketing.film_category_popularity

        SET
            film_category_rank = null
			
		WHERE
            category_id = NEW.category_id;


		-- #### #### #### #### #### #### #### #### 


        WITH generate_film_category_rank AS (

            SELECT
                  film_id
                , category_id
                , ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY total_rentals DESC) AS film_category_rank
            FROM 
                marketing.film_category_popularity
        )
        
        UPDATE marketing.film_category_popularity AS a

        SET
            film_category_rank = b.film_category_rank

        FROM 
            generate_film_category_rank AS b 

        WHERE 
            b.film_id = a.film_id
                AND
            b.category_id = a.category_id;


		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


        INSERT INTO marketing.customer_reclist_master_nonspecific (
            
              customer_id 
            , category_id
            , film_id
            , total_rentals
        )


        WITH get_film_category_details AS (

            SELECT 
                  category_id
                , film_id
                , total_rentals 
            FROM 
                marketing.film_category_popularity

            WHERE 
                film_id = NEW.film_id
        )
        , get_customers_list AS (
            
            SELECT
                customer_id
            FROM
                public.customer
        )
        , combined_film_category_with_customers AS (
            
            SELECT
                  b.customer_id
                , a.category_id
                , a.film_id
                , a.total_rentals

            FROM
                get_film_category_details AS a 
                    CROSS JOIN
                        get_customers_list AS b 
        )

        SELECT 
              customer_id
            , category_id
            , film_id
            , total_rentals
        
        FROM 
            combined_film_category_with_customers;

   		-- #### #### #### #### #### #### #### ####  

        UPDATE marketing.customer_reclist_master_nonspecific

        SET
              film_rec_order = null 
            , film_rank = null
            , film_category_rank = null;

		-- #### #### #### #### #### #### #### ####

        WITH get_updated_film_ranks AS (

            SELECT
                  film_id
                , film_rank
                , film_category_rank
            FROM
                marketing.film_category_popularity
        ), get_customer_reclist_master_nonspecific_values AS (

			SELECT
				  a.customer_id
				, b.film_rank
				, a.category_id
				, a.film_id
				, b.film_category_rank
				, a.total_rentals
			FROM 
                marketing.customer_reclist_master_nonspecific AS a
                    LEFT JOIN 
                        marketing.film_category_popularity AS b
                            ON b.film_id = a.film_id
        )
        , assign_rental_rec_row_number AS (

			SELECT
				  customer_id
				, film_rank
				, category_id
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY film_rank) as rental_rec_order_rn
				, film_id
				, film_category_rank
				, total_rentals
			FROM get_customer_reclist_master_nonspecific_values
		)

        UPDATE marketing.customer_reclist_master_nonspecific AS a

		SET 
              film_rank = b.film_rank
            , film_rec_order = b.rental_rec_order_rn
            , film_category_rank = b.film_category_rank

		FROM assign_rental_rec_row_number AS b

		WHERE 
			(a.customer_id = b.customer_id
				AND
			a.film_id = b.film_id);

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        UPDATE marketing.customer_reclist_master_specific

        SET
            rental_rec_order = null;

		-- #### #### #### #### #### #### #### #### 

        INSERT INTO marketing.customer_reclist_master_specific(

                  customer_id           -- customer id
                , cat_rec_order         -- customer's category rec order     
                , category_id           -- category id 
                , film_id               -- film id
                , film_category_rank    -- film rank by category
                , total_rentals         -- Film's Total Rentals
            )	

        WITH combined_master_with_cxcat AS (

            SELECT 
                a.customer_id
                , CASE
                    WHEN EXISTS (SELECT b.customer_id FROM marketing.customer_category b where b.customer_id = a.customer_id)
                        THEN b.recommendation_order_customer_preference
                    ELSE b.recommendation_order_historical
                END as cat_rec_order 
                , a.category_id
                , a.film_id
                , a.film_category_rank
                , a.total_rentals
            FROM 
                marketing.customer_reclist_master_nonspecific AS a
                    LEFT JOIN 
                        marketing.customer_category AS b
                            ON b.customer_id = a.customer_id
                            
            WHERE
                (a.film_id = NEW.film_id)
                    AND 
                (
                    (b.customer_id = a.customer_id
                        AND
                    b.category_id = a.category_id)
                        AND
                    b.recommendation_order_historical IN (
                        SELECT recommendation_order_historical
                            FROM 
                        marketing.customer_category)
                )

            ORDER BY
                a.customer_id, 2, a.film_category_rank DESC
        )

        SELECT
              customer_id
            , cat_rec_order
            , category_id 
            , film_id
            , film_category_rank
            , total_rentals
        FROM combined_master_with_cxcat;

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
		),
		assign_row_number AS (

			SELECT
				  customer_id
				, cat_rec_order
				, category_id
                , ROW_NUMBER() OVER(PARTITION BY customer_id, cat_rec_order ORDER BY cat_rec_order, film_category_rank) AS rental_rec_order_rn
				, film_id
				, film_category_rank
				, total_rentals
			FROM get_customer_reclist_master_specific_values
		)


		UPDATE marketing.customer_reclist_master_specific AS a

		SET rental_rec_order = b.rental_rec_order_rn

		FROM assign_row_number AS b

		WHERE 
			(a.customer_id = b.customer_id
				AND
			a.film_id = b.film_id);
			
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        INSERT INTO marketing.new_releases(
              film_id
            , status
        )

        SELECT
              film_id
            , true
        FROM 
            marketing.film_category_popularity

        WHERE
            film_id = NEW.film_id;


  		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####           
		
		-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### ####
		
		RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
	
	END;
$trigger_function_insert_new_film$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_insert_new_inventory()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_insert_new_inventory$
	
	BEGIN
	
		-- #### #### #### #### #### #### #### #### 
				
		INSERT INTO marketing.inventory_maintenance (
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
	
	
		-- #### #### #### #### #### #### #### #### 
				
		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### #### 
		
		RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
	END;
$trigger_function_insert_new_inventory$;
	

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_category_popularity()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_update_category_popularity$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 
	
		UPDATE marketing.category_popularity
		
		SET
			total_rentals = total_rentals + 1
			
		WHERE
			category_id = NEW.category_id;
			
		-- #### #### #### #### #### #### #### #### 

		

		
		-- #### #### #### #### 
		
			RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
		
	END;
$trigger_function_update_category_popularity$;
-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_customer_category()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_update_customer_category$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 
	
		UPDATE marketing.customer_category
		
		SET
			recommendation_order_historical = null,
			recommendation_order_average = null,
			recommendation_order_halfaverage = null
			
		WHERE
			customer_id = NEW.customer_id;
	
		-- #### #### #### #### #### #### #### #### 
		
		UPDATE marketing.customer_category
		
		SET
			historical_rental_count = historical_rental_count + 1,
			average_rental_count = average_rental_count + 1,
			halfaverage_rental_count = halfaverage_rental_count +1
			
		WHERE 
			customer_id = NEW.customer_id
				AND
			category_id = NEW.category_id;
			
		-- #### #### #### #### #### #### #### #### 
		
		WITH get_customer_category_rec_order_historical AS (
			SELECT 
				  a.customer_id
				, a.category_id
				, ROW_NUMBER() OVER (ORDER BY a.historical_rental_count DESC, b.total_rentals DESC) as recommendation_order_historical

			FROM marketing.customer_category AS a
				INNER JOIN marketing.category_popularity AS b 
					ON b.category_id = a.category_id
			
			WHERE
				a.customer_id = NEW.customer_id
		)

		UPDATE marketing.customer_category a

		SET 
			recommendation_order_historical = b.recommendation_order_historical

		FROM get_customer_category_rec_order_historical AS b

		WHERE
			b.category_id = a.category_id;

			-- #### #### #### #### #### #### #### #### 

		WITH get_customer_category_rec_order_average AS (
			SELECT 
				  a.customer_id
				, a.category_id
				, ROW_NUMBER() OVER (ORDER BY a.average_rental_count DESC, b.total_rentals DESC) as recommendation_order_average

			FROM marketing.customer_category AS a
				INNER JOIN marketing.category_popularity AS b
					ON b.category_id = a.category_id
			
			WHERE
				a.customer_id = NEW.customer_id
		)

		UPDATE marketing.customer_category a

		SET 
			recommendation_order_average = b.recommendation_order_average

		FROM get_customer_category_rec_order_average AS b

		WHERE
			b.category_id = a.category_id;

			-- #### #### #### #### #### #### #### #### 

		WITH get_customer_category_rec_order_halfaverage AS (
			SELECT 
				  a.customer_id
				, a.category_id
				, ROW_NUMBER() OVER (ORDER BY a.halfaverage_rental_count DESC, b.total_rentals DESC ) as recommendation_order_halfaverage

			FROM marketing.customer_category AS a
				INNER JOIN marketing.category_popularity AS b 
					ON b.category_id = a.category_id
			
			WHERE
				a.customer_id = NEW.customer_id
		)

		UPDATE marketing.customer_category a

		SET 
			recommendation_order_halfaverage = b.recommendation_order_halfaverage

		FROM get_customer_category_rec_order_halfaverage AS b

		WHERE
			b.category_id = a.category_id;
		
	
		-- #### #### #### #### #### #### #### #### 
		
		UPDATE marketing.customer_category
		
		SET
			recommendation_order_customer_preference = recommendation_order_historical
			
		WHERE 
			customer_id = NEW.customer_id;

		-- #### #### #### #### #### #### #### #### 
		
		WITH get_customer_custom_rec_preferences AS (
			
			SELECT
				  customer_id
				, category_id
				, customer_rec_custom_order
				, customer_rec_custom_amount
			FROM
				marketing.customer_rec_custom_preferences
		
			WHERE
				customer_id = NEW.customer_id
		)
		
		UPDATE marketing.customer_category AS a
		
		SET
			recommendation_order_customer_preference = b.customer_rec_custom_order
			
		FROM 
			get_customer_custom_rec_preferences AS b
			
		WHERE
			b.category_id = a.category_id;
			
		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### #### 
		
			RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
		
	END;
$trigger_function_update_customer_category$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_customer_reclist_master_nonspecific()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_update_customer_reclist_master_nonspecific$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 	
		
		DELETE FROM marketing.customer_reclist_master_nonspecific
		
		WHERE
			customer_id = NEW.customer_id
				AND
			film_id = NEW.film_id;
	
		-- #### #### #### #### #### #### #### #### 	
		
		UPDATE marketing.customer_reclist_master_nonspecific
		
		SET
			film_rec_order = null
						
		WHERE
			customer_id = NEW.customer_id;
		
		-- #### #### #### #### #### #### #### #### 	
		
		WITH get_customer_reclist_master_nonspecific_values AS (

			SELECT
				  customer_id
				, film_rank
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
			FROM marketing.customer_reclist_master_nonspecific
			
			WHERE
				customer_id = NEW.customer_id
		),
		assign_row_number AS (

			SELECT
				  customer_id
				, film_rank
				, category_id
				, ROW_NUMBER() OVER (ORDER BY film_rank) as rental_rec_order_rn
				, film_id
				, film_category_rank
				, total_rentals
			
			FROM get_customer_reclist_master_nonspecific_values
		)
		
		UPDATE marketing.customer_reclist_master_nonspecific AS a
		
		SET
			film_rec_order = b.rental_rec_order_rn
			
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
$trigger_function_update_customer_reclist_master_nonspecific$

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

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
$trigger_function_update_customer_reclist_master_specific$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    12     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_customer_reclist_summary_specific()
    RETURNS TRIGGER 
    LANGUAGE plpgsql
    AS $trigger_function_update_customer_reclist_summary_specific$


    BEGIN 

        -- #### #### #### #### #### #### #### #### 

        DELETE FROM marketing.customer_reclist_master_specific
		
		WHERE
			customer_id = NEW.customer_id;
	
		-- #### #### #### #### #### #### #### #### 	

        INSERT INTO marketing.customer_reclist_summary_specific (

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
				marketing.customer_reclist_master_specific	
			
            WHERE
                (customer_id = NEW.customer_id)
                    AND 
                (rental_rec_order <= 5
                    AND
                cat_rec_order <= 5)

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


        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### 

        RETURN NEW;

        -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_update_customer_reclist_summary_specific$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_insert_customer_watch_history()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_insert_customer_watch_history$
	
	BEGIN
	
	
		-- #### #### #### #### 
		-- Setting Customer Watch History Order To Null.
		
		
		UPDATE marketing.customer_watch_history_detailed
		
		SET
			customer_watch_history_desc_order = null
			
		WHERE
			customer_id = NEW.customer_id;
	
		
		-- #### #### #### #### #### #### #### #### 
		
		INSERT INTO marketing.customer_watch_history_detailed(
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

                INNER JOIN public.film_category c
                    ON c.film_id = b.film_id

        WHERE
            a.customer_id = NEW.customer_id
				AND 
			a.rental_id = NEW.rental_id;
			
    
		-- #### #### #### #### #### #### #### #### 
		
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
				marketing.customer_watch_history_detailed

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


		UPDATE marketing.customer_watch_history_detailed AS a

		SET customer_watch_history_desc_order = b.customer_watch_history_desc_order_row_number

		FROM assign_watch_history_order_row_number AS b

		WHERE 
			b.customer_id = a.customer_id
				AND
			b.rental_id = a.rental_id;
		
		-- #### #### #### #### 
		
		RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 
	END;
$trigger_function_insert_customer_watch_history$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    14     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_film_category_popularity()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_update_film_category_popularity$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 
	
		UPDATE marketing.film_category_popularity
		
		SET
			total_rentals = total_rentals + 1
			
		WHERE
			film_id = NEW.film_id;
			
		-- #### #### #### #### #### #### #### #### 

		UPDATE marketing.film_category_popularity
		
		SET
			film_rank = null;
			
		-- #### #### #### #### #### #### #### #### 
		
		WITH generate_film_rank AS (
			SELECT
				  film_id
				, ROW_NUMBER() OVER (ORDER BY total_rentals DESC) AS film_rank
			FROM
				marketing.film_category_popularity
		)
		
		UPDATE marketing.film_category_popularity AS a
		
		SET
			film_rank = b.film_rank
		
		FROM
			generate_film_rank AS b
			
		WHERE
			b.film_id = a.film_id;
		
		-- #### #### #### #### #### #### #### #### 
		
		UPDATE marketing.film_category_popularity
		
		SET
			film_category_rank = null
			
		WHERE
			category_id = NEW.category_id;
			
		-- #### #### #### #### #### #### #### #### 
		
		WITH generate_film_category_rank AS (
			SELECT
				  film_id
				, category_id
				, ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY total_rentals DESC) AS film_category_rank
			FROM
				marketing.film_category_popularity
		)
		
		UPDATE marketing.film_category_popularity AS a
		
		SET
			film_category_rank = b.film_category_rank
		
		FROM
			generate_film_category_rank AS b
			
		WHERE
			b.film_id = a.film_id		
				AND
			b.category_id = a.category_id;
			
		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### #### 
		
			RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 		

		
	END;
$trigger_function_update_film_category_popularity$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    15     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_inventory_maintenance()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS $trigger_function_update_inventory_maintenance$
	
	BEGIN 
	
		-- #### #### #### #### #### #### #### #### 
	
		UPDATE marketing.inventory_maintenance
		
		SET
			life_cycle = life_cycle + 1
			
		WHERE
			inventory_id = NEW.inventory_id;
			
		-- #### #### #### #### #### #### #### #### 

		UPDATE marketing.inventory_maintenance
		
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
			
		-- #### #### #### #### #### #### #### #### 
		
		-- #### #### #### #### 
		
			RETURN NEW;
		
		-- #### #### #### #### #### #### #### #### 		

		
	END;
$trigger_function_update_inventory_maintenance$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    16     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_new_release()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_update_new_releases$

    BEGIN 
    
    
    -- #### #### #### #### #### #### #### #### 

    UPDATE marketing.film_category_popularity

    SET
        new_release = false

    WHERE
        film_id = OLD.film_id;

    -- #### #### #### #### #### #### #### #### 

    DELETE FROM marketing.new_releases

    WHERE
        film_id = OLD.film_id;


    -- #### #### #### #### #### #### #### #### 

    -- #### #### #### #### #### #### #### #### 

    -- #### #### #### #### 

    RETURN NEW;

    -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_update_new_releases$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    17     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION marketing.t_f_update_rental_return()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_update_rental_return$

    BEGIN 
    
    
    -- #### #### #### #### #### #### #### #### 

    UPDATE marketing.customer_watch_history_detailed

    SET
        return_date = NEW.return_date

    WHERE
        rental_id = OLD.rental_id;

    -- #### #### #### #### #### #### #### #### 

    DELETE FROM marketing.failed_returns

    WHERE
        rental_id = OLD.rental_id;


    -- #### #### #### #### #### #### #### #### 

    -- #### #### #### #### #### #### #### #### 

    -- #### #### #### #### 

    RETURN NEW;

    -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_update_rental_return$;

-- #### #### #### #### #### #### #### #### 


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

CREATE OR REPLACE TRIGGER insert_customer_watch_history
    AFTER INSERT
    ON public.rental
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_insert_customer_watch_history();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER insert_new_customer
    AFTER INSERT
    ON public.customer
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_insert_new_customer();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER insert_new_category
    AFTER INSERT
    ON public.category
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_insert_new_category();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER insert_new_inventory
    AFTER INSERT
    ON public.inventory
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_insert_new_inventory();
	
-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER update_rental_return
    AFTER UPDATE
    ON public.rental
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_rental_return();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER insert_failed_return
    AFTER INSERT
    ON public.rental
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_insert_failed_return();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER insert_new_film
    AFTER INSERT
    ON public.film_category
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_insert_new_film();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER update_customer_category
	AFTER INSERT 
    ON marketing.customer_watch_history_detailed
	FOR EACH ROW
	EXECUTE FUNCTION marketing.t_f_update_customer_category();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER new_rental_update_category_popularity
    AFTER INSERT 
    ON marketing.customer_watch_history_detailed
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_category_popularity();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER update_film_category_popularity
	AFTER INSERT 
    ON marketing.customer_watch_history_detailed
	FOR EACH ROW
	EXECUTE FUNCTION marketing.t_f_update_film_category_popularity();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER update_inventory_maintenance
	AFTER INSERT 
	ON marketing.customer_watch_history_detailed
	FOR EACH ROW
	EXECUTE FUNCTION marketing.t_f_update_inventory_maintenance();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    12     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER update_customer_reclist_master_nonspecific
    AFTER INSERT
    ON marketing.customer_watch_history_detailed
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_customer_reclist_master_nonspecific();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER update_customer_reclist_master_specific
    AFTER INSERT
    ON marketing.customer_watch_history_detailed
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_customer_reclist_master_specific();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    14     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER insert_update_customer_rec_custom_preferences
    AFTER INSERT OR UPDATE 
    ON marketing.customer_rec_custom_preferences
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_insert_update_customer_rec_custom_preferences();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    15     #### 
-- #### #### #### #### 

CREATE OR REPLACE TRIGGER update_new_release
    AFTER UPDATE
    ON marketing.film_category_popularity
    FOR EACH ROW
	WHEN ((OLD.new_release) IS DISTINCT FROM (NEW.new_release))
    EXECUTE FUNCTION marketing.t_f_update_new_release();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    16     #### 
-- #### #### #### #### 

CREATE OR REPLACE update_customer_reclist_master_nonspecific_summary
    AFTER INSERT OR UPDATE OR DELETE 
    ON marketing.customer_reclist_master_nonspecific
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_customer_reclist_summary_nonspecific();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    17     #### 
-- #### #### #### #### 

CREATE OR REPLACE update_customer_reclist_master_specific_summary
    AFTER INSERT OR UPDATE OR DELETE 
    ON marketing.customer_reclist_master_specific
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_customer_reclist_summary_specific();

-- #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    TRIGGERS END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### DISABLED FUNCTIONS START #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 




-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- Original film recommendation master list function.


/* 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_customer_reclist_master_v2()
    RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_reclist_master$

	BEGIN 

    -- TRUNCATE TABLE staging.vdm1_stage4_customer_recommendation_list_master;

    -- TRUNCATE TABLE staging.vdm1_stage4_customer_recommendation_list_master;

    INSERT INTO staging.vdm1_stage4_customer_reclist_master_nonspecific(

			  customer_id
			, film_rank
            , category_id
			, film_rec_order
			, film_id
			, film_category_rank
			, total_rentals
		)	

*/
/*
    WITH get_s_list AS (SELECT 
    	  a.customer_id
    	-- , a.category_rank
    	-- , a.category_rank_number
    	, a.recommendation_order_historical
    	, b.*
    	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
    FROM staging.vdm1_stage4_customer_category a
    	INNER JOIN staging.vdm1_stage4_film_category_popularity b USING (category_id)
    
    	--  WHERE a.category_rank = 'S'
    	-- WHERE a.category_rank_number = 1
    	WHERE a.recommendation_order_historical = 1
    	AND 
    -- 	b.film_id NOT IN (
    -- 		SELECT 
    -- 			DISTINCT film_id
    -- 		FROM staging.vdm1_stage4_rentals
    -- 		WHERE customer_id = a.customer_id
    -- 	)
    	b.film_id != ALL (
    		SELECT 
    			  unnest(customer_watch_history_distinct_film_array)
    		FROM 
    			staging.vdm1_stage4_customer_watch_history_array
    		WHERE
    			customer_id = a.customer_id
    			)
    
    	ORDER BY 1,5 DESC--, 8
    ),
    
    get_a_list AS (SELECT 
    	  a.customer_id
    	-- , a.category_rank
    	-- , a.category_rank_number
    	, a.recommendation_order_historical
    	, b.*
    	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
    FROM staging.vdm1_stage4_customer_category a
    	INNER JOIN staging.vdm1_stage4_film_category_popularity b USING (category_id)
    
    	--  WHERE a.category_rank = 'A'
    	-- WHERE a.category_rank_number = 2
    	WHERE a.recommendation_order_historical = 2
    	AND 
    -- 	b.film_id NOT IN (
    -- 		SELECT 
    -- 			DISTINCT film_id
    -- 		FROM staging.vdm1_stage4_rentals
    -- 		WHERE customer_id = a.customer_id
    -- 	)
    	b.film_id != ALL (
    		SELECT 
    			  unnest(customer_watch_history_distinct_film_array)
    		FROM 
    			staging.vdm1_stage4_customer_watch_history_array
    		WHERE
    			customer_id = a.customer_id
    			)
    
    	ORDER BY 1,5 DESC--, 8
    ),
    
    get_b_list AS (SELECT 
    	  a.customer_id
    	-- , a.category_rank
    	-- , a.category_rank_number
    	, a.recommendation_order_historical
    	, b.*
    	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
    FROM staging.vdm1_stage4_customer_category a
    	INNER JOIN staging.vdm1_stage4_film_category_popularity b USING (category_id)
    
    	--  WHERE a.category_rank = 'B'
    	-- WHERE a.category_rank_number = 3
    	WHERE a.recommendation_order_historical = 3
    	AND 
    -- 	b.film_id NOT IN (
    -- 		SELECT 
    -- 			DISTINCT film_id
    -- 		FROM staging.vdm1_stage4_rentals
    -- 		WHERE customer_id = a.customer_id
    -- 	)
    	b.film_id != ALL (
    		SELECT 
    			  unnest(customer_watch_history_distinct_film_array)
    		FROM 
    			staging.vdm1_stage4_customer_watch_history_array
    		WHERE
    			customer_id = a.customer_id
    			)
    
    	ORDER BY 1,5 DESC--, 8
    ),
    
    get_c_list AS (SELECT 
    	  a.customer_id
    	-- , a.category_rank
    	-- , a.category_rank_number
    	, a.recommendation_order_historical
    	, b.*
    	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
    FROM staging.vdm1_stage4_customer_category a
    	INNER JOIN staging.vdm1_stage4_film_category_popularity b USING (category_id)
    
    	--  WHERE a.category_rank = 'C'
    	-- WHERE a.category_rank_number = 4
    	WHERE a.recommendation_order_historical = 4
    	AND 
    -- 	b.film_id NOT IN (
    -- 		SELECT 
    -- 			DISTINCT film_id
    -- 		FROM staging.vdm1_stage4_rentals
    -- 		WHERE customer_id = a.customer_id
    -- 	)
    	b.film_id != ALL (
    		SELECT 
    			  unnest(customer_watch_history_distinct_film_array)
    		FROM 
    			staging.vdm1_stage4_customer_watch_history_array
    		WHERE
    			customer_id = a.customer_id
    			)
    
    	ORDER BY 1,5 DESC--, 8
    ),
    
    get_d_list AS (SELECT 
    	  a.customer_id
    	-- , a.category_rank
    	-- , a.category_rank_number
    	, a.recommendation_order_historical
    	, b.*
    	-- , ROW_NUMBER() OVER (PARTITION BY a.customer_id, category_id ORDER BY film_category_rank) as rec_order
    FROM staging.vdm1_stage4_customer_category a
    	INNER JOIN staging.vdm1_stage4_film_category_popularity b USING (category_id)
    
    	-- WHERE a.category_rank = 'D'
    	-- WHERE a.category_rank_number = 5
    	-- WHERE a.category_rank_row_number >= 5
    	WHERE a.recommendation_order_historical = 5
    	AND 
    -- 	b.film_id NOT IN (
    -- 		SELECT 
    -- 			DISTINCT film_id
    -- 		FROM staging.vdm1_stage4_rentals
    -- 		WHERE customer_id = a.customer_id
    -- 	)
    	b.film_id != ALL (
    		SELECT 
    			  unnest(customer_watch_history_distinct_film_array)
    		FROM 
    			staging.vdm1_stage4_customer_watch_history_array
    		WHERE
    			customer_id = a.customer_id
    			)
    
    	ORDER BY 1,5 DESC--, 8
    ),
    list_build AS (
    	SELECT 
    		*
    	FROM get_s_list
    		-- WHERE rec_order <= 5
    	
    	UNION ALL
    	
    	SELECT 
    		* 
    	FROM get_a_list
    		-- WHERE rec_order <= 4
    	
    	UNION ALL
    	
    	SELECT 
    		* 
    	FROM get_b_list
    		-- WHERE rec_order <= 3
    	
    	UNION ALL
    	
    	SELECT 
    		* 
    	FROM get_c_list
    		-- WHERE rec_order <= 2
    	
    	UNION ALL
    	
    	SELECT 
    		* 
    	FROM get_d_list
    		-- WHERE rec_order = 1
    		
    ),
    		
    list as (
    SELECT
    	  customer_id
    	-- , category_rank_number
    	, recommendation_order_historical
    	, film_id
    	, category_idA
    	, total_rentals
    	-- , film_rank
    	, film_category_rank
    	-- , generated_date
    	-- , rec_order
    	-- *
    	--  category_id
    	-- , count(distinct category_id) 
    FROM list_build
    	-- WHERE customer_id = 1
    -- GROUP BY 
    	-- customer_id
    	-- category_id
    ORDER BY 
    	-- category_id
    	-- customer_id, (category_rank_row_number, category_id, rec_order)
    	customer_id, (recommendation_order_historical, category_id)
    )
    */
	
   /* 


	WITH get_customer_film_cat_x_film_cat_pop AS (

		SELECT
			  a.customer_id
			, b.film_rank
			, a.category_id
			, a.film_id
			, b.film_category_rank
			, b.total_rentals
		FROM staging.vdm1_stage4_customer_film_category a
			LEFT JOIN 
				staging.vdm1_stage4_film_category_popularity b
					ON b.film_id = a.film_id 

		ORDER BY 
			a.customer_id, a.film_id	
	)
    
    SELECT
	      customer_id
	    , film_rank
	    , category_id
        -- , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY film_rank) as film_rec_order
        , film_id
		, film_category_rank
	    , total_rentals
    FROM get_customer_film_cat_x_film_cat_pop;


    
	END;
$vdm1_stage4_calc_insert_customer_reclist_master$;
 */

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

/*
CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_city_rental_count()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage4_calc_update_city_rental_count$

    BEGIN 


    WITH calc_city_rentals AS (
        
        SELECT 
              b.city
            , a.city_id
            , COUNT(a.city_id) AS total_rentals
        FROM
            staging.vdm1_stage4_customer_watch_history_details a
                INNER JOIN staging.vdm1_stage4_dictkey_city b
                    ON b.city_id = a.city_id

        GROUP BY 
            b.city, a.city_id

        ORDER BY 
            total_rentals DESC
    )

    UPDATE staging.vdm1_stage4_city_count_init a

    SET 
        total_rentals = calc_city_rentals.total_rentals

    FROM calc_city_rentals

    WHERE
        a.city_id = calc_city_rentals.city_id;

    END;
$vdm1_stage4_calc_update_city_rental_count$;

*/

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

/*
CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_country_rental_count()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage4_calc_update_country_rental_count$

    BEGIN 

    WITH calc_country_rentals AS (

        SELECT 
            b.country
            , a.country_id
            , COUNT(a.country_id) AS total_rentals
        FROM
            staging.vdm1_stage4_customer_watch_history_details a
                INNER JOIN staging.vdm1_stage4_dictkey_country b
                    ON b.country_id = a.country_id
        GROUP BY 
            b.country, a.country_id

        ORDER BY 
	        total_rentals DESC
    )

    UPDATE staging.vdm1_stage4_country_count_init a

    SET 
        total_rentals = calc_country_rentals.total_rentals

    FROM calc_country_rentals

    WHERE
        a.country_id = calc_country_rentals.country_id;

    END;
$vdm1_stage4_calc_update_country_rental_count$;

*/

-- #### #### #### #### #### #### #### #### 

/*
CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_generate_report_year_weeknumber_stamp(
		p_rental_date DATE
)
	RETURNS VARCHAR
	LANGUAGE plpgsql
	AS $vdm1_stage4_transform_rental_date_to_report_stamp$
	
	DECLARE
		
		vi_rental_date DATE;

		vo_report_name VARCHAR;
		
	BEGIN
		
		vi_rental_date := $1;

    SELECT 
        CONCAT('rpt_y', (RIGHT((EXTRACT('year' FROM rental_date)::text),2)), 'wk', (EXTRACT('week' FROM rental_date)::text))
    INTO
        vo_report_name;

		RETURN vo_report_name;

	END;
$vdm1_stage4_transform_rental_date_to_report_stamp$;

*/


-- #### #### #### #### #### #### #### #### 

/*
CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_cobbwebbed_film_inventory()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_cobbwebbed_film_inventory$
	
	BEGIN 
	
        CREATE TABLE IF NOT EXISTS staging.vdm1_stage3_cobbwebbed_film_inventory(

              film_id INTEGER NOT NULL
            , inventory_id INTEGER NOT NULL
        );
	END;
$vdm1_stage3_create_table_cobbwebbed_film_inventory$;

*/


-- #### #### #### #### #### #### #### #### 

/*


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_cobbwebbed_film_inventory()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_cobbwebbed_film_inventory$
	
	BEGIN 


		INSERT INTO staging.vdm1_stage4_cobbwebbed_film_inventory(
			  film_id
            , inventory_id
		)		
		
		SELECT
			  a.film_id
			, c.inventory_id

		FROM staging.vdm1_stage4_film_category_popularity AS a

            LEFT JOIN staging.vdm1_stage4_new_releases AS b
                ON b.film_id = a.film_id
        
            LEFT JOIN staging.vdm1_stage4_film_inventory AS c 
                ON c.film_id = a.film_id
		
		WHERE 
            a.total_rentals = 0
                AND
            b.film_id != a.film_id;
		
	END;
$vdm1_stage4_calc_insert_cobbwebbed_film_inventory$;
*/
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### ####  DISABLED FUNCTIONS END  #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

