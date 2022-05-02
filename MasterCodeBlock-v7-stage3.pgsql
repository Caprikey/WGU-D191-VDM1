-- MASTER CODE BLOCK - STAGE 3

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS

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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 3 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 3 BEGIN


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO STAGE 3 - STORED PROCEDURES 


-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO STAGE 3 - FUNCTIONS 

-- TABLE OF CONTENTS

--      1vdm1_etl.f_vdm1_stage3_create_table_new_releases()
--      2vdm1_etl.f_vdm1_stage3_create_table_failed_returns()
--      3vdm1_etl.f_vdm1_stage3_create_table_category_count_init()
--      4vdm1_etl.f_vdm1_stage3_create_table_customer_watch_history_details()
--      5vdm1_etl.f_vdm1_stage3_create_table_cx_reclist_master_nonspecific()
--      6vdm1_etl.f_vdm1_stage3_create_table_cx_reclist_master_specific()
--      7vdm1_etl.f_vdm1_stage3_create_table_customer_rec_custom_preferences()
--      8vdm1_etl.f_vdm1_stage3_table_changes()
--      9vdm1_etl.f_vdm1_stage3_cleanup()


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
		
        );
	
	END;
$vdm1_stage3_create_table_new_releases$;


-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

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
                , film_category_rank INTEGER NOT NULL		
                , total_rentals INTEGER NOT NULL
        );
	END;
$vdm1_stage3_create_table_customer_reclist_master_specific$;

-- #### #### #### #### #### #### #### #### 

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



-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

-- #TODO STAGE 3 END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 3 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
