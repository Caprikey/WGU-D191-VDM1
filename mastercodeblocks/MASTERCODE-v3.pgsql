-- MASTER CODE BLOCK
-- Version 3

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
--                  2. DROP SCHEMA :: STAGING - CASCADE
--                  3. CREATE SCHEMA :: STAGING
--                  4. CREATE SCHEMA :: EXTENSIONS

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
--                  3. staging.f_vdm1_stage3_create_table_cobbwebbed_film_inventory()
--                  4. staging.f_vdm1_stage3_create_table_category_count_init()
--                  5. -- DISABLED -- staging.f_vdm1_stage3_create_table_city_count_init()
--                  6. -- DISABLED -- staging.f_vdm1_stage3_create_table_country_count_init()
--                  7. staging.f_vdm1_stage3_create_table_customer_watch_history_details()
--                  8. -- DISABLED -- staging.f_vdm1_stage3_create_table_customer_watch_history_array()
--                  9. staging.f_vdm1_stage3_create_table_cx_rec_list_master()
--                 10. staging.f_vdm1_stage3_create_table_customer_rec_custom_preferences()
--                 11. staging.f_vdm1_stage3_table_changes()
--                 12. staging.f_vdm1_stage3_cleanup()

--     #### #### #### ####
--         STAGE 3 END
--     #### #### #### ####

--     #### #### #### ####
--         STAGE 4 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. staging.vdm1_stage4();

--             FUNCTIONS

--                  1. f_vdm1_stage4_calc_update_category_popularity_count()
--                  2. -- DISABLED -- f_vdm1_stage4_city_rental_count()
--                  3. -- DISABLED -- f_vdm1_stage4_country_rental_count()
--                  4. f_vdm1_stage4_calc_update_film_popularity_count()
--                  5. f_vdm1_stage4_calc_update_film_popularity_row_number()
--                  6. f_vdm1_stage4_calc_update_film_category_popularity_row_number()
--                  7. f_vdm1_stage4_calc_update_film_inventory_count()
--                  8. f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
--                  9. f_vdm1_stage4_calc_update_cust_cat_count_null_corrections()
--                 10. f_vdm1_stage4_calc_update_customer_category_historical_count()
--                 11. f_vdm1_stage4_calc_update_customer_category_average_count()
--                 12. f_vdm1_stage4_calc_update_customer_category_halfaverage_count()
--                 13. f_vdm1_stage4_calc_update_customer_category_recommendation_order_historical()
--                 14. f_vdm1_stage4_calc_update_customer_category_recommendation_order_average()
--                 15. f_vdm1_stage4_calc_update_customer_category_recommendation_order_halfaverage()
--                 16. f_vdm1_stage4_calc_update_customer_category_recommendation_order_user_custom()
--                 17. f_vdm1_stage4_calc_update_customer_watch_history_row_number()
--                 18. f_vdm1_stage4_calc_insert_failed_returns_v2()
--                 19. f_vdm1_stage4_calc_insert_new_releases_v2()
--                 20. f_vdm1_stage4_calc_insert_cobbwebbed_film_inventory()
--                 21. f_vdm1_stage4_calc_insert_customer_recommendation_list_master_v2()
--                 22. f_vdm1_stage4_calc_insert_customer_recommendation_list_summary()
--                 23. f_vdm1_stage4_transform_customer_full_name(p_first_name VARCHAR, p_last_name VARCHAR)
--                 24. f_vdm1_stage4_transform_filmlength_int2vchar(p_length INTEGER)
--                 25. f_vdm1_stage4_calc_generate_report_year_weeknumber_stamp(p_rental_date DATE)
--                 26. f_vdm1_stage4_datestamp()
--                 27. f_vdm1_stage4_calc_expected_return_date(p_film_id INT, p_rental_date DATE)
--                 28. f_vdm1_stage4_cleanup()

--     #### #### #### ####
--         STAGE 4 END
--     #### #### #### ####

--     #### #### #### ####
--         STAGE 5 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. staging.vdm1_stage5();

--             FUNCTIONS

--                  1. 

--     #### #### #### ####
--         STAGE 5 END
--     #### #### #### ####

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### ####    STAGE 0 BEGIN    #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####   SCHEMA CREATION   #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- CREATE SCHEMA IF NOT EXISTS marketing;



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
-- #### #### #### #### #### ####     STAGE 0 END     #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                       

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### ####    STAGE 1 BEGIN    #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


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

--     f_vdm1_stage1_extractimport(tablename VARCHAR(30)) 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

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



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### ####     STAGE 1 END     #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                       

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### ####    STAGE 2 BEGIN    #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


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

--     f_vdm1_stage2_customer_status_admend()
--     f_vdm1_stage2_films()
--     f_vdm1_stage2_film_inventory()
--     f_vdm1_stage2_rentals()
--     f_vdm1_stage2_locationdetails()
--     f_vdm1_stage2_stores()
--     f_vdm1_stage2_customers()
--     f_vdm1_stage2_customer_category()
--     f_vdm1_stage2_film_category()
--     f_vdm1_stage2_customer_film_category()
--     f_vdm1_stage2_cleanup()


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_films()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2films$
	
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
$vdm1_stage2films$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_film_inventory()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2filminv$
	
	BEGIN 
	
		CREATE TABLE staging.vdm1_stage2_film_inventory AS (
	
            SELECT 
                a.film_id
                , b.inventory_id
            FROM staging.vdm1_stage1_film a
                INNER JOIN staging.vdm1_stage1_inventory b
                    ON b.film_id = a.film_id
	    );
	
	END;
$vdm1_stage2filminv$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_rentals()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2rentals$
		
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
$vdm1_stage2rentals$;

-- #### #### #### #### #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_locationdetails()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2locdet$
		
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
$vdm1_stage2locdet$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_stores()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2stores$
		
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
$vdm1_stage2stores$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_customers()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2customers$
	
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
$vdm1_stage2customers$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_customer_category()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2custcat$
	
	BEGIN 
	
		CREATE TABLE staging.vdm1_stage2_customer_category AS (
	
		SELECT 
			  a.customer_id
			, b.category_id
		FROM staging.vdm1_stage2_customers a
			CROSS JOIN staging.vdm1_stage1_category b

	);
	
	END;
$vdm1_stage2custcat$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_film_category()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2filmcat$
	
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
$vdm1_stage2filmcat$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_customer_film_category()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage2_customer_film_cat$

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

$vdm1_stage2_customer_film_cat$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2cleanup$

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
$vdm1_stage2cleanup$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### ####     STAGE 2 END     #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                       

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### ####    STAGE 3 BEGIN    #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####



-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE PROCEDURE staging.vdm1_stage3()
	LANGUAGE plpgsql
	AS $vdm1_stage3run$
	
	BEGIN 
	
		PERFORM staging.f_vdm1_stage3_create_table_new_releases();
		
		PERFORM staging.f_vdm1_stage3_create_table_failed_returns();

		PERFORM staging.f_vdm1_stage3_create_table_cobbwebbed_film_inventory();


		-- #### #### #### #### 

        PERFORM staging.f_vdm1_stage3_create_table_category_count_init();

		-- PERFORM staging.f_vdm1_stage3_create_table_city_count_init();

	    -- PERFORM staging.f_vdm1_stage3_create_table_country_count_init();


		-- #### #### #### #### 

		PERFORM staging.f_vdm1_stage3_create_table_customer_watch_history_details();
		
		-- PERFORM staging.f_vdm1_stage3_create_table_customer_watch_history_array();

        PERFORM staging.f_vdm1_stage3_create_table_cx_rec_list_master();

		PERFORM staging.f_vdm1_stage3_create_table_cx_rec_list_summary();

        PERFORM staging.f_vdm1_stage3_create_table_customer_rec_custom_preferences();

		-- #### #### #### #### 
		
		PERFORM staging.f_vdm1_stage3_table_changes();
		
		PERFORM staging.f_vdm1_stage3_cleanup();
		
	END;
$vdm1_stage3run$;

-- #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--     f_vdm1_stage3_create_table_new_releases()
--     f_vdm1_stage3_create_table_failed_returns()
--     f_vdm1_stage3_create_table_cobbwebbed_film_inventory()
--     f_vdm1_stage3_create_table_category_count_init()
--     -- DISABLED -- f_vdm1_stage3_create_table_city_count_init()
--     -- DISABLED -- f_vdm1_stage3_create_table_country_count_init()
--     f_vdm1_stage3_create_table_customer_watch_history_details()
--     -- DISABLED -- f_vdm1_stage3_create_table_customer_watch_history_array()
--     f_vdm1_stage3_create_table_cx_rec_list_master()
--     f_vdm1_stage3_create_table_cx_rec_list_summary()
--     f_vdm1_stage3_create_table_customer_rec_custom_preferences()
--     f_vdm1_stage3_table_changes()
--     f_vdm1_stage3_cleanup()


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_new_releases()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_new_releases$
	
	BEGIN 
	
		CREATE TABLE staging.vdm1_stage3_new_releases(
			  nr_film_id INTEGER
			, film_id INTEGER NOT NULL
			, status BOOLEAN NOT NULL DEFAULT TRUE
		);
	
	END;
$vdm1_stage3_create_table_new_releases$;


-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_failed_returns()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_failed_returns$
	
	BEGIN 
	
	CREATE TABLE staging.vdm1_stage3_failed_returns(
		  fr_id INTEGER
		, customer_id INTEGER NOT NULL
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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_cobbwebbed_film_inventory()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_cobbwebbed_film_inventory$
	
	BEGIN 
	
	CREATE TABLE IF NOT EXISTS staging.vdm1_stage3_cobbwebbed_film_inventory(
		  cbfilms_id INTEGER NOT NULL
		, film_id INTEGER NOT NULL
		, inventory_id INTEGER NOT NULL
	);
	END;
$vdm1_stage3_create_table_cobbwebbed_film_inventory$;

-- #### #### #### #### #### #### #### #### 


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

-- DISABLED 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_city_count_init()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_city_count_init$
	
	BEGIN 

    CREATE UNLOGGED TABLE IF NOT EXISTS staging.vdm1_stage3_city_count_init AS 
        SELECT * FROM staging.vdm1_stage3_dictkey_city;

    END;
$vdm1_stage3_create_table_city_count_init$;

-- #### #### #### #### #### #### #### #### 

-- DISABLED 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_country_count_init()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_country_count_init$
	
	BEGIN 

    CREATE UNLOGGED TABLE IF NOT EXISTS staging.vdm1_stage3_country_count_init AS 
        SELECT * FROM staging.vdm1_stage3_dictkey_country;

    END;
$vdm1_stage3_create_table_country_count_init$;

-- #### #### #### #### #### #### #### #### 

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
		
		-- , (EXTRACT('year' FROM rental_date)::int) AS rental_year
		-- , (EXTRACT('week' FROM rental_date)::int) AS rental_week_number
		
		-- , CONCAT('rpt_y', (RIGHT((EXTRACT('year' FROM rental_date)::text),2)), 'wk', (EXTRACT('week' FROM rental_date)::text))
		
		
		
	FROM staging.vdm1_stage3_rentals a
	    INNER JOIN staging.vdm1_stage3_customers b
		    ON b.customer_id = a.customer_id
	 
	GROUP BY
		a.customer_id, b.city_id, b.country_id, a.rental_id, a.inventory_id, a.film_id, a.category_id, a.rental_date, a.return_date
	ORDER BY 
		a.customer_id

);

	
	END;
$vdm1_stage3_create_table_cxwatchhistory_details$;

-- #### #### #### #### #### #### #### #### 

-- DISABLED 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_customer_watch_history_array()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_cxwatchhistory_array$
	
	BEGIN 
	
CREATE TABLE staging.vdm1_stage3_customer_watch_history_array AS (

	SELECT 
		  customer_id
        , ARRAY_AGG(DISTINCT film_id) as customer_watch_history_distinct_film_array
		
	FROM staging.vdm1_stage3_customer_watch_history_details
	 
	GROUP BY
		customer_id
	ORDER BY 
		customer_id

);

	
	END;
$vdm1_stage3_create_table_cxwatchhistory_array$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_cx_rec_list_master()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_customer_recommendation_list_master$
	
	BEGIN 
	
	CREATE TABLE staging.vdm1_stage3_customer_recommendation_list_master (

			  customer_id INTEGER NOT NULL 
            , film_rank INTEGER NULL
            , category_id INTEGER NOT NULL
            , rec_order INTEGER NULL
            , film_id INTEGER NOT NULL
			, film_category_rank INTEGER NOT NULL		
            , total_rentals INTEGER NOT NULL
	);
	END;
$vdm1_stage3_create_table_customer_recommendation_list_master$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_cx_rec_list_summary()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_ccustomer_recommendation_list_summary$
	
	BEGIN 
	
	CREATE TABLE staging.vdm1_stage3_customer_recommendation_list_summary (


			  customer_id INTEGER NOT NULL 
            , cat_rec_order INTEGER NULL
            , category_id INTEGER NOT NULL
            , rec_order INTEGER NULL
            , film_id INTEGER NOT NULL
			, film_category_rank INTEGER NOT NULL		
            , total_rentals INTEGER NOT NULL
	);
	END;
$vdm1_stage3_create_table_ccustomer_recommendation_list_summary$;

-- #### #### #### #### #### #### #### #### 


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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_table_changes()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3tblchg$
	
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
		--	ADD COLUMN film_category_row_number INTEGER DEFAULT NULL;

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

		-- ALTER TABLE IF EXISTS staging.vdm1_stage3_city_count_init
		-- 	DROP COLUMN IF EXISTS country_id,
		--	DROP COLUMN IF EXISTS last_update,
		--	ADD COLUMN total_rentals INT NOT NULL DEFAULT 0;


		-- ALTER TABLE IF EXISTS staging.vdm1_stage3_country_count_init
		--	DROP COLUMN IF EXISTS last_update,
		--	ADD COLUMN total_rentals INT NOT NULL DEFAULT 0;


		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_watch_history_details
			ALTER COLUMN rental_date
				SET DATA TYPE DATE USING rental_date::date;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_watch_history_details
			ALTER COLUMN return_date
				SET DATA TYPE DATE USING return_date::date;

        ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_watch_history_details
			ADD COLUMN customer_watch_history_desc_order INTEGER null;

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
$vdm1_stage3tblchg$;

-- #### #### #### #### #### #### #### #### 

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

		ALTER TABLE IF EXISTS staging.vdm1_stage3_cobbwebbed_film_inventory
			RENAME TO vdm1_stage4_cobbwebbed_film_inventory;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_failed_returns
			RENAME TO vdm1_stage4_failed_returns;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_new_releases
			RENAME TO vdm1_stage4_new_releases;
		
		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_recommendation_list_master
			RENAME TO vdm1_stage4_customer_recommendation_list_master;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_recommendation_list_summary
			RENAME TO vdm1_stage4_customer_recommendation_list_summary;

        ALTER TABLE IF EXISTS staging.vdm1_stage3_category_count_init
            RENAME TO vdm1_stage4_category_popularity_count;

        ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_rec_custom_preferences
            RENAME TO vdm1_stage4_customer_rec_custom_preferences;

        -- ALTER TABLE IF EXISTS staging.vdm1_stage3_city_count_init
        --    RENAME TO vdm1_stage4_city_count_init;

        -- ALTER TABLE IF EXISTS staging.vdm1_stage3_country_count_init
        --    RENAME TO vdm1_stage4_country_count_init;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_watch_history_details
			RENAME TO vdm1_stage4_customer_watch_history_details;

		-- ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_watch_history_array
		--	RENAME TO vdm1_stage4_customer_watch_history_array;

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


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### ####     STAGE 3 END     #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                       

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### ####    STAGE 4 BEGIN    #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 



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
	
		PERFORM staging.f_vdm1_stage4_calc_update_category_popularity_count();

		-- PERFORM staging.f_vdm1_stage4_city_rental_count();

		-- PERFORM staging.f_vdm1_stage4_country_rental_count();

        PERFORM staging.f_vdm1_stage4_calc_update_film_popularity_count();

		PERFORM staging.f_vdm1_stage4_calc_update_film_inventory_count();

        PERFORM staging.f_vdm1_stage4_calc_update_film_inventory_flag_inspection();

        
		-- #### #### #### #### 


		PERFORM staging.f_vdm1_stage4_calc_update_cust_cat_count_null_corrections();

		PERFORM staging.f_vdm1_stage4_calc_update_customer_category_historical_count();

    	PERFORM staging.f_vdm1_stage4_calc_update_customer_category_average_count();

		PERFORM staging.f_vdm1_stage4_calc_update_customer_category_halfaverage_count();




		-- #### #### #### #### 

		
		-- PERFORM staging.f_vdm1_stage4_calc_update_customer_category_rank();

        PERFORM staging.f_vdm1_stage4_calc_update_custcat_recorder_historical();

        PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_average();

        PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage();

        PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_user_custom();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default();

		PERFORM staging.f_vdm1_stage4_calc_update_cus_cat_recorder_set_custom_order();


        -- #### #### #### #### 

        PERFORM staging.f_vdm1_stage4_calc_update_film_popularity_row_number();

		PERFORM staging.f_vdm1_stage4_calc_update_film_category_popularity_row_number();

		PERFORM staging.f_vdm1_stage4_calc_update_customer_watch_history_row_number();

		-- #### #### #### #### 



		-- #### #### #### #### 
		

		PERFORM staging.f_vdm1_stage4_calc_insert_failed_returns_v2();

		PERFORM staging.f_vdm1_stage4_calc_insert_new_releases_v2();

		PERFORM staging.f_vdm1_stage4_calc_insert_cobbwebbed_film_inventory();

		PERFORM staging.f_vdm1_stage4_calc_insert_customer_rec_list_master_v2();

		-- PERFORM staging.f_vdm1_stage4_calc_insert_customer_recommendation_list_summary();


		-- #### #### #### #### 

		PERFORM staging.f_vdm1_stage4_datestamp();

		PERFORM staging.f_vdm1_stage4_cleanup();

	END;
$vdm1_stage4run$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--     f_vdm1_stage4_calc_update_category_popularity_count()
--     -- DISABLED -- f_vdm1_stage4_city_rental_count()
--     -- DISABLED -- f_vdm1_stage4_country_rental_count()
--     f_vdm1_stage4_calc_update_film_popularity_count()
--     f_vdm1_stage4_calc_update_film_popularity_row_number()
--     f_vdm1_stage4_calc_update_film_category_popularity_row_number()
--     f_vdm1_stage4_calc_update_film_inventory_count()
--     f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
--     f_vdm1_stage4_calc_update_cust_cat_count_null_corrections()
--     f_vdm1_stage4_calc_update_customer_category_historical_count()
--     f_vdm1_stage4_calc_update_customer_category_average_count()
--     f_vdm1_stage4_calc_update_customer_category_halfaverage_count()
--     f_vdm1_stage4_calc_update_customer_category_recommendation_order_historical()
--     f_vdm1_stage4_calc_update_customer_category_recommendation_order_average()
--     f_vdm1_stage4_calc_update_customer_category_recommendation_order_halfaverage()
--     f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default()
--     f_vdm1_stage4_calc_update_cus_cat_recorder_set_custom_order()
--     f_vdm1_stage4_calc_update_customer_watch_history_row_number()
--     f_vdm1_stage4_calc_insert_failed_returns_v2()
--     f_vdm1_stage4_calc_insert_new_releases_v2()
--     f_vdm1_stage4_calc_insert_cobbwebbed_film_inventory()
--     f_vdm1_stage4_calc_insert_customer_rec_list_master_v2()
--     f_vdm1_stage4_calc_insert_customer_recommendation_list_summary()
--     f_vdm1_stage4_transform_customer_full_name(p_first_name VARCHAR, p_last_name VARCHAR)
--     f_vdm1_stage4_transform_filmlength_int2vchar(p_length INTEGER)
--     f_vdm1_stage4_calc_generate_report_year_weeknumber_stamp(p_rental_date DATE)
--     f_vdm1_stage4_datestamp()
--     f_vdm1_stage4_calc_expected_return_date(p_film_id INT, p_rental_date DATE)
--     f_vdm1_stage4_cleanup()


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_category_popularity_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_category_popularity_count$
	
	BEGIN
	
		-- CTE used to get rental count since aggregates are not allowed in update statements. 
		WITH get_rentalcount_cat AS (
			SELECT 
				  category_id
				, count(category_id) AS rentalcount_total
			FROM staging.vdm1_stage4_rentals

			GROUP BY
				category_id
		)

		-- Declaring Table that will be updated

		UPDATE staging.vdm1_stage4_category_popularity_count

		SET total_rentals = get_rentalcount_cat.rentalcount_total

		FROM get_rentalcount_cat
		
		WHERE 
			vdm1_stage4_category_popularity_count.category_id = get_rentalcount_cat.category_id;
			
	END;
$vdm1_stage4_calc_update_category_popularity_count$;

-- #### #### #### #### #### #### #### #### 

-- DISABLED

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

-- #### #### #### #### #### #### #### #### 

-- DISABLED

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

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_film_popularity_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_film_popularity_count$
	
	BEGIN
	
		-- CTE used to get rental count since aggregates are not allowed in update statements. 
		WITH get_rentalcount_film AS (
			SELECT 
				  film_id
				, count(film_id) AS rentalcount_total
			FROM staging.vdm1_stage4_rentals

			GROUP BY
				film_id
		)

		-- Declaring Table that will be updated

		UPDATE staging.vdm1_stage4_film_category_popularity

		SET total_rentals = get_rentalcount_film.rentalcount_total

		FROM get_rentalcount_film
		
		WHERE 
			vdm1_stage4_film_category_popularity.film_id = get_rentalcount_film.film_id;
			
	END;
$vdm1_stage4_calc_update_film_popularity_count$;

-- #### #### #### #### #### #### #### #### 

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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calcupdate_film_inventory_flag_inspection$

	BEGIN
	
		UPDATE staging.vdm1_stage4_film_inventory 

		SET inspect_flag = true
        
        
		WHERE life_cycle % 5 = 0
            AND
        maintenance_complete_flag = false;
	
	
	END;

$vdm1_stage4_calcupdate_film_inventory_flag_inspection$;


-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cust_cat_count_null_corrections()
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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_customer_category_historical_count()
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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_customer_category_average_count()
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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_customer_category_halfaverage_count()
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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_customer_category_recorder_historical()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_rec_order_historical$
	
	BEGIN
	
		WITH get_customer_category_rec_order_historical AS (
			SELECT 
				  customer_id
				, category_id
				/*
				,  CASE
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 1 THEN 'S'
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 2 THEN 'A'
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 3 THEN 'B'
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 4 THEN 'C'
					ELSE 
						'D'		
				END as cat_rank_letter
                , CASE
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 1 THEN 1
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 2 THEN 2
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 3 THEN 3
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 4 THEN 4
					ELSE 
						5		
				END as cat_rank_number
				*/
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY historical_rental_count DESC) as recommendation_order_historical
                
			FROM staging.vdm1_stage4_customer_category
		)

		UPDATE staging.vdm1_stage4_customer_category a

		SET 
            -- category_rank = get_customer_category_rec_order_historical .cat_rank_letter,
            -- category_rank_number = get_customer_category_rec_order_historical .cat_rank_number,
            recommendation_order_historical = get_customer_category_rec_order_historical.recommendation_order_historical
            
		FROM get_customer_category_rec_order_historical 

		WHERE
			a.customer_id = get_customer_category_rec_order_historical.customer_id
				AND
			a.category_id = get_customer_category_rec_order_historical.category_id;
			
	END;
$vdm1_stage4_calc_update_customer_category_rec_order_historical$;


-- #### #### #### #### #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_customer_category_recorder_average()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_rec_order_average$
	
	BEGIN
	
		WITH get_customer_category_rec_order_average AS (
			SELECT 
				  customer_id
				, category_id
				/*
				,  CASE
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 1 THEN 'S'
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 2 THEN 'A'
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 3 THEN 'B'
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 4 THEN 'C'
					ELSE 
						'D'		
				END as cat_rank_letter
                , CASE
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 1 THEN 1
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 2 THEN 2
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 3 THEN 3
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 4 THEN 4
					ELSE 
						5		
				END as cat_rank_number
				*/
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY average_rental_count DESC) as recommendation_order_average
                
			FROM staging.vdm1_stage4_customer_category
		)

		UPDATE staging.vdm1_stage4_customer_category a

		SET 
            -- category_rank = get_customer_category_rec_order_average.cat_rank_letter,
            -- category_rank_number = get_customer_category_rec_order_average.cat_rank_number,
            recommendation_order_average = get_customer_category_rec_order_average.recommendation_order_average
            
		FROM get_customer_category_rec_order_average

		WHERE
			a.customer_id = get_customer_category_rec_order_average.customer_id
				AND
			a.category_id = get_customer_category_rec_order_average.category_id;
			
	END;
$vdm1_stage4_calc_update_customer_category_rec_order_average$;


-- #### #### #### #### #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_customer_category_recorder_halfaverage()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_rec_order_halfaverage$
	
	BEGIN
	
		WITH get_customer_category_rec_order_halfaverage AS (
			SELECT 
				  customer_id
				, category_id
				/*
				,  CASE
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 1 THEN 'S'
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 2 THEN 'A'
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 3 THEN 'B'
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 4 THEN 'C'
					ELSE 
						'D'		
				END as cat_rank_letter
                , CASE
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 1 THEN 1
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 2 THEN 2
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 3 THEN 3
					WHEN dense_rank() over (partition by customer_id order by category_rental_count desc) = 4 THEN 4
					ELSE 
						5		
				END as cat_rank_number
				*/
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY halfaverage_rental_count DESC) as recommendation_order_halfaverage
                
			FROM staging.vdm1_stage4_customer_category
		)

		UPDATE staging.vdm1_stage4_customer_category a

		SET 
            -- category_rank = get_customer_category_rec_order_halfaverage.cat_rank_letter,
            -- category_rank_number = get_customer_category_rec_order_halfaverage.cat_rank_number,
            recommendation_order_halfaverage = get_customer_category_rec_order_halfaverage.recommendation_order_halfaverage
            
		FROM get_customer_category_rec_order_halfaverage

		WHERE
			a.customer_id = get_customer_category_rec_order_halfaverage.customer_id
				AND
			a.category_id = get_customer_category_rec_order_halfaverage.category_id;
			
	END;
$vdm1_stage4_calc_update_customer_category_rec_order_halfaverage$;

-- #### #### #### #### #### #### #### ####

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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_cus_cat_recorder_set_custom_order()
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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_failed_returns_v2()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_failed_returns$
	
	BEGIN  
    
        TRUNCATE TABLE staging.vdm1_stage4_failed_returns;
            
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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_new_releases_v2()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_new_releases$
	
	BEGIN 

		TRUNCATE TABLE staging.vdm1_stage4_new_releases;


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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_cobbwebbed_film_inventory()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_cobbwebbed_film_inventory$
	
	BEGIN 

		TRUNCATE TABLE staging.vdm1_stage4_cobbwebbed_film_inventory;


		INSERT INTO staging.vdm1_stage4_cobbwebbed_film_inventory(
			  film_id
            , inventory_id
		)		
		
		SELECT
			  a.film_id
			, c.inventory_id
		FROM staging.vdm1_stage4_film_category_popularity a
            LEFT JOIN staging.vdm1_stage4_new_releases b
                ON b.film_id = a.film_id
            LEFT JOIN staging.vdm1_stage4_film_inventory c 
                ON c.film_id = a.film_id
		
		WHERE a.total_rentals = 0
            AND
        b.film_id != a.film_id;
		
	END;
$vdm1_stage4_calc_insert_cobbwebbed_film_inventory$;

-- #### #### #### #### #### #### #### #### 

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


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_customer_rec_list_master_v2()
    RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_rec_list_master$

	BEGIN 

    -- TRUNCATE TABLE staging.vdm1_stage4_customer_recommendation_list_master;

    INSERT INTO staging.vdm1_stage4_customer_recommendation_list_master(

			  customer_id
			, film_rank
            , category_id
			, rec_order
			, film_id
			, film_category_rank
			, total_rentals
		)	
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
	
    


	WITH get_customer_film_cat_x_film_cat_pop AS (

		SELECT
			  a.customer_id
			, b.film_rank
			, a.category_id
			, a.film_id
			, b.film_category_rank
			, b.total_rentals
		FROM staging.vdm1_stage4_customer_recommendation_list_master a
			LEFT JOIN 
				staging.vdm1_stage4_film_category_popularity b
					ON b.film_id = a.film_id 

		ORDER BY 
			a.customer_id, a.film_id	
	)
    
    SELECT
    	  *
    	, ROW_NUMBER() OVER (PARTITION BY customer_id, category_id ORDER BY film_rank) as rec_order
    FROM get_customer_film_cat_x_film_cat_pop;


    
	END;
$vdm1_stage4_calc_insert_customer_rec_list_master$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_customer_reclist_summary_default()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_rec_list_customer_summary_defaults$

	BEGIN

	TRUNCATE TABLE staging.vdm1_stage4_customer_recommendation_list_summary;

    INSERT INTO staging.vdm1_stage4_customer_recommendation_list_summary(

			  customer_id
			, rec_order 
            , category_id
			, cat_rec_order
			, film_id
			, film_category_rank
			, total_rentals
		)	

	WITH combined_master_with_cxcat AS (

		SELECT 
			a.customer_id
			, CASE
				-- WHEN EXISTS (SELECT b.customer_id FROM staging.vdm1_stage4_customer_category b where b.customer_id = a.customer_id)
				-- 	THEN b.recommendation_order_customer_preference
				-- ELSE b.recommendation_order_historical
			  	WHEN EXISTS (SELECT b.customer_id FROM staging.vdm1_stage4_customer_category b where b.customer_id = a.customer_id)
			  		THEN b.recommendation_order_customer_preference
			  	ELSE b.recommendation_order_historical
			  END as cat_rec_order 
			, a.category_id
			, a.film_id
			, a.film_category_rank
			, a.total_rentals
		FROM 
			staging.vdm1_stage4_customer_recommendation_list_master a
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
		, ROW_NUMBER() OVER (PARTITION BY customer_id, category_id ORDER BY cat_rec_order) as rec_order
    FROM combined_master_with_cxcat;



	END;
$vdm1_stage4_calc_insert_customer_rec_list_customer_summary_defaults$;

-- #### #### #### #### #### #### #### #### 

-- CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_customer_reclist_summary_custom(
-- 		p_recorder_amount VARCHAR
-- )
-- 	RETURNS VOID
-- 	LANGUAGE plpgsql
-- 	AS $vdm1_stage4_calc_insert_customer_rec_list_customer_summary$

-- 	DECLARE 

-- 		vi_recorder_amount VARCHAR;

-- 	BEGIN

-- 	-- TRUNCATE TABLE staging.vdm1_stage4_customer_recommendation_list_summary;

--     INSERT INTO staging.vdm1_stage4_customer_recommendation_list_summary(

-- 			  customer_id
-- 			, rec_order 
--             , category_id
-- 			, rec_order
-- 			, film_id
-- 			, film_rank 
-- 			, film_category_rank
-- 			, total_rentals
-- 		)	

-- 	CASE 
-- 		WHEN TRIM(LOWER($1)) = 'user' then vi_recorder_amount := b.recommendation_order_customer_preference;
-- 		WHEN TRIM(LOWER($1)) = 'halfaverage' then vi_recorder_amount := b.recommendation_order_halfaverage;
-- 		WHEN TRIM(LOWER($1)) = 'average' then vi_recorder_amount := b.recommendation_order_historical;
-- 		ELSE TRIM(LOWER($1)) = 'historical' then vi_recorder_amount := b.recommendation_order_historical;
-- 	END


-- 	WITH combined_master_with_cxcat AS (

-- 		SELECT 
-- 			a.customer_id
-- 			, CASE
-- 				-- WHEN EXISTS (SELECT b.customer_id FROM staging.vdm1_stage4_customer_category b where b.customer_id = a.customer_id)
-- 				-- 	THEN b.recommendation_order_customer_preference
-- 				-- ELSE b.recommendation_order_historical
-- 			  	WHEN EXISTS (SELECT b.customer_id FROM staging.vdm1_stage4_customer_category b where b.customer_id = a.customer_id)
-- 			  		THEN vi_recorder_amount
-- 			  	ELSE vi_recorder_amount
-- 			  END as rec_order 
-- 			, a.category_id
-- 			, a.film_id
-- 			, a.film_category_rank
-- 			, a.total_rentals
-- 		FROM 
-- 			staging.vdm1_stage4_customer_recommendation_list_master a
-- 				LEFT JOIN 
-- 					staging.vdm1_stage4_customer_category b
-- 						ON b.customer_id = a.customer_id
						
-- 		WHERE
-- 			(b.customer_id = a.customer_id
-- 				AND
-- 			b.category_id = a.category_id)
-- 				AND
-- 			vi_recorder_amount IN (
-- 				SELECT vi_recorder_amount
-- 					FROM 
-- 				staging.vdm1_stage4_customer_category)

-- 		ORDER BY
-- 			a.customer_id, 2, a.film_category_rank DESC
-- 	)

--     SELECT
--     	  *
--     	, ROW_NUMBER() OVER (PARTITION BY customer_id, category_id ORDER BY rec_order) as rec_order
--     FROM combined_master_with_cxcat;


-- 	END;
-- $vdm1_stage4_calc_insert_customer_rec_list_customer_summary$;


-- #### #### #### #### #### #### #### #### 

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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_generate_report_year_weeknumber_stamp(
		p_rental_date DATE
)
	RETURNS VARCHAR
	LANGUAGE plpgsql
	AS $vdm1_stage4_transform_rental_date_to_report_stamp$
	
	DECLARE
		
		vi_rental_date DATE;

		vo_report_name VARCHAR;
		-- vo_report_name TEXT;
		
	BEGIN
		
		vi_rental_date := $1;

    SELECT 
        CONCAT('rpt_y', (RIGHT((EXTRACT('year' FROM rental_date)::text),2)), 'wk', (EXTRACT('week' FROM rental_date)::text))
    INTO
        vo_report_name;

		RETURN vo_report_name;

	END;
$vdm1_stage4_transform_rental_date_to_report_stamp$;

-- #### #### #### #### #### #### #### #### 


CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_datestamp()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage4_datestamp$

    BEGIN

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customers
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_stores
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_films
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_rentals
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_film_inventory
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_film_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage4_failed_returns
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_new_releases
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_category_popularity_count
            ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;
        
        -- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_city
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_country
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_language
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

    END;
$vdm1_stage4_datestamp$;

-- #### #### #### #### #### #### #### #### 


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

CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_cleanup$
	
	BEGIN
		

		-- #### #### #### ####



		ALTER TABLE IF EXISTS staging.vdm1_stage4_film_category
			RENAME TO vdm1_stage5_film_category;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_category
			RENAME TO vdm1_stage5_customer_category;


		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage4_failed_returns
			RENAME TO vdm1_stage5_failed_returns;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_new_releases
			RENAME TO vdm1_stage5_new_releases;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_film_inventory
			RENAME TO vdm1_stage5_inventory_maintenance;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_cobbwebbed_film_inventory
			RENAME TO vdm1_stage5_stagnant_film_inventory;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage4_rentals
			RENAME TO vdm1_stage5_rentals;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_watch_history_details
			RENAME TO vdm1_stage5_customer_watch_history_details;

		-- ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_watch_history_array
		--	RENAME TO vdm1_stage5_customer_watch_history_array;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_recommendation_list_master
			RENAME TO vdm1_stage5_customer_recommendation_list_master;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_recommendation_list_master
			RENAME TO vdm1_stage5_customer_recommendation_list_summary;

		-- #### #### #### #### 

        ALTER TABLE IF EXISTS staging.vdm1_stage4_category_popularity_count
            RENAME TO vdm1_stage5_category_popularity;

        ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_rec_custom_preferences
            RENAME TO vdm1_stage5_customer_rec_custom_preferences;

        -- ALTER TABLE IF EXISTS staging.vdm1_stage4_city_count_init
        --    RENAME TO vdm1_stage5_city_rental_count;

        -- ALTER TABLE IF EXISTS staging.vdm1_stage4_country_count_init
        --    RENAME TO vdm1_stage5_country_rental_count;

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
			

        -- #### #### #### #### 


	END;
$vdm1_stage4_cleanup$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### ####     STAGE 4 END     #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                       

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### ####    STAGE 5 BEGIN    #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####





-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

--    
--    
--    
--    
--    
--    
--    
--    
--    
--   


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####





-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### ####     STAGE 5 END     #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####   