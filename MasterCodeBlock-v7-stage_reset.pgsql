-- MASTER CODE BLOCK - RESET

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### ####       VDM1 RESET STAGE START       #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO VDM1 RESET STAGE BEGIN


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

		PERFORM vdm1_etl.f_vdm1_reset_drop_triggers();


		-- #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_reset_delete_tables_vdm1_data();

		-- #### #### #### #### #### #### #### #### 

        CALL vdm1_etl.vdm1_stage0();

		CALL vdm1_etl.vdm1_stage1();

		CALL vdm1_etl.vdm1_stage2();

		CALL vdm1_etl.vdm1_stage3();

        -- DISABLING MAIN RUN DUE TO PERFORMANCE/TIME IMPACT
        -- CALL vdm1_etl.vdm1_stage4();

            -- STAGE 4 HAS BEEN SPLIT INTO 3 SUBPARTS TO ASSIST WITH PERFORMANCE IMPACT
            CALL vdm1_etl.vdm1_stage4a();

            CALL vdm1_etl.vdm1_stage4b();

            CALL vdm1_etl.vdm1_stage4c();

        CALL vdm1_etl.vdm1_stage5_reset();

        CALL vdm1_etl.vdm1_stage5_trigger_functions_setup();

        CALL vdm1_etl.vdm1_stage5_triggers_setup();

        CALL vdm1_etl.vdm1_reset_mview_setup();
		
	END;
$vdm1_reset$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_reset_mview_setup()
	LANGUAGE plpgsql
	AS $vdm1_reset_materialized_view_recreation$
	
	BEGIN 

		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_mviews_marketing_customer_details();

        PERFORM vdm1_etl.f_vdm1_reset_create_mview_customer_details();

        PERFORM vdm1_etl.f_vdm1_reset_refresh_mview_marketing_customer_details();
        
 		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_mviews_marketing_film_details();

        PERFORM vdm1_etl.f_vdm1_reset_create_mview_film_details();

        PERFORM vdm1_etl.f_vdm1_reset_refresh_mview_marketing_film_details();

		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_mviews_marketing_location_details();

        PERFORM vdm1_etl.f_vdm1_reset_create_mview_location_details();

        PERFORM vdm1_etl.f_vdm1_reset_refresh_mview_marketing_location_details();

  		-- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_reset_drop_mviews_marketing_store_details();

        PERFORM vdm1_etl.f_vdm1_reset_create_mview_store_details();

        PERFORM vdm1_etl.f_vdm1_reset_refresh_mview_marketing_store_details();

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

--       1. vdm1_etl.f_vdm1_reset_drop_triggers();
--  	 2. vdm1_etl.f_vdm1_reset_delete_table_vdm1_data(); 
--       3. vdm1_etl.f_vdm1_reset_create_mview_customer_details();
--       4. vdm1_etl.f_vdm1_reset_create_mview_store_details();
--       5. vdm1_etl.f_vdm1_reset_create_mview_location_details();
--       6. vdm1_etl.f_vdm1_reset_create_mview_film_details();
--       7. vdm1_etl.f_vdm1_reset_drop_all_mviews_marketing();
--       8. vdm1_etl.f_vdm1_reset_drop_mviews_marketing_customer_details();
--       9. vdm1_etl.f_vdm1_reset_drop_mviews_marketing_film_details();
--      10. vdm1_etl.f_vdm1_reset_drop_mviews_marketing_location_details();
--      11. vdm1_etl.f_vdm1_reset_drop_mviews_marketing_store_details();
--      12. vdm1_etl.f_vdm1_reset_refresh_mview_all_marketing();
--      13. vdm1_etl.f_vdm1_reset_refresh_mview_marketing_customer_details();
--      14. vdm1_etl.f_vdm1_reset_refresh_mview_marketing_film_details();
--      15. vdm1_etl.f_vdm1_reset_refresh_mview_marketing_location_details();
--      16. vdm1_etl.f_vdm1_reset_refresh_mview_marketing_store_details();


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_drop_triggers()
	RETURNS VOID
	LANGUAGE plpgsql
	
	AS $vdm1_reset_procedure_function_drop_triggers$
	
	
	BEGIN

        -- #### #### #### #### #### #### #### #### 



        -- #### #### #### #### #### #### #### #### 

	END;
$vdm1_reset_procedure_function_drop_triggers$;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     2     #### 
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

	END;
$vdm1_reset_procedure_function_delete_tables_vdm1_data$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_mview_customer_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_create_materialized_view_customer_details$
	
	BEGIN 
	
        CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.customer_details AS (

            SELECT 
                  a.customer_id
                , a.store_id
                , a.first_name
                , a.last_name
                --, vdm1_data.f_transform_customer_full_name(a.first_name, a.last_name) AS full_name
                , a.email
                , (SELECT AGE('2007-04-29', a.create_date)) as account_age
                , CASE 
                    WHEN a.activebool = true 
                        THEN 'ACTIVE'
                    ELSE 
                        'INACTIVE'
                  END AS active_status
                , vdm1_data.f_transform_customer_phone_e164(b.phone) AS phone
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
$vdm1_reset_create_materialized_view_customer_details$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_mview_store_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_create_materialized_view_store_details$
		
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
                , vdm1_data.f_transform_customer_phone_e164(b.phone) AS phone

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
$vdm1_reset_create_materialized_view_store_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_mview_location_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_create_materialized_view_location_details$
		
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
                , vdm1_data.f_transform_customer_phone_e164(a.phone) AS phone

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
$vdm1_reset_create_materialized_view_location_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_mview_film_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_create_materialized_view_film_details$
	
	BEGIN 
		
		CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.film_details AS (

			SELECT

				  a.film_id
				, a.title
				, b.category_id
				, a.release_year
				, c.name
				, vdm1_data.f_transform_filmlength_int2vchar(a.length) as film_legnth
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
$vdm1_reset_create_materialized_view_film_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_drop_all_mviews_marketing()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_drop_all_materialized_views_marketing$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

            DROP MATERIALIZED VIEW vdm1_data.customer_details;

            DROP MATERIALIZED VIEW vdm1_data.film_details;

            DROP MATERIALIZED VIEW vdm1_data.location_details;

            DROP MATERIALIZED VIEW vdm1_data.store_details;


        -- #### #### #### #### #### #### #### #### 





        -- #### #### #### #### #### #### #### #### 

    END;

$vdm1_reset_drop_all_materialized_views_marketing$;

-- #### #### #### #### #### #### #### #### 
-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_drop_mviews_marketing_customer_details()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_drop_materialized_views_marketing_customer_details$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

            DROP MATERIALIZED VIEW vdm1_data.customer_details;

            -- DROP MATERIALIZED VIEW vdm1_data.film_details;

            -- DROP MATERIALIZED VIEW vdm1_data.location_details;

            -- DROP MATERIALIZED VIEW vdm1_data.store_details;


        -- #### #### #### #### #### #### #### #### 





        -- #### #### #### #### #### #### #### #### 

    END;

$vdm1_reset_drop_materialized_views_marketing_customer_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_drop_mviews_marketing_film_details()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_drop_materialized_views_marketing_film_details$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

            -- DROP MATERIALIZED VIEW vdm1_data.customer_details;

            DROP MATERIALIZED VIEW vdm1_data.film_details;

            -- DROP MATERIALIZED VIEW vdm1_data.location_details;

            -- DROP MATERIALIZED VIEW vdm1_data.store_details;


        -- #### #### #### #### #### #### #### #### 





        -- #### #### #### #### #### #### #### #### 

    END;

$vdm1_reset_drop_materialized_views_marketing_film_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_drop_mviews_marketing_location_details()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_drop_materialized_views_marketing_location_details$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

            -- DROP MATERIALIZED VIEW vdm1_data.customer_details;

            -- DROP MATERIALIZED VIEW vdm1_data.film_details;

            DROP MATERIALIZED VIEW vdm1_data.location_details;

            -- DROP MATERIALIZED VIEW vdm1_data.store_details;


        -- #### #### #### #### #### #### #### #### 





        -- #### #### #### #### #### #### #### #### 

    END;

$vdm1_reset_drop_materialized_views_marketing_location_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_drop_mviews_marketing_store_details()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_drop_materialized_views_marketing_store_details$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

            -- DROP MATERIALIZED VIEW vdm1_data.customer_details;

            -- DROP MATERIALIZED VIEW vdm1_data.film_details;

            -- DROP MATERIALIZED VIEW vdm1_data.location_details;

            DROP MATERIALIZED VIEW vdm1_data.store_details;


        -- #### #### #### #### #### #### #### #### 





        -- #### #### #### #### #### #### #### #### 

    END;

$vdm1_reset_drop_materialized_views_marketing_store_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    12     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_refresh_mview_all_marketing()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_refresh_materialized_views_all_marketing$

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
$vdm1_reset_refresh_materialized_views_all_marketing$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_refresh_mview_marketing_customer_details()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_refresh_materialized_views_marketing_customer_details$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

		REFRESH MATERIALIZED VIEW marketing.customer_details;  

		-- REFRESH MATERIALIZED VIEW marketing.film_details;  

		-- REFRESH MATERIALIZED VIEW marketing.location_details;  

		-- REFRESH MATERIALIZED VIEW marketing.store_details;    

		-- REFRESH MATERIALIZED VIEW marketing.category;  

		-- REFRESH MATERIALIZED VIEW marketing.city;  

		-- REFRESH MATERIALIZED VIEW marketing.country;   

		-- REFRESH MATERIALIZED VIEW marketing.language;  
    
        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_reset_refresh_materialized_views_marketing_customer_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    14     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_refresh_mview_marketing_film_details()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_refresh_materialized_views_marketing_film_details$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

		-- REFRESH MATERIALIZED VIEW marketing.customer_details;  

		REFRESH MATERIALIZED VIEW marketing.film_details;  

		-- REFRESH MATERIALIZED VIEW marketing.location_details;  

		-- REFRESH MATERIALIZED VIEW marketing.store_details;    

		-- REFRESH MATERIALIZED VIEW marketing.category;  

		-- REFRESH MATERIALIZED VIEW marketing.city;  

		-- REFRESH MATERIALIZED VIEW marketing.country;   

		-- REFRESH MATERIALIZED VIEW marketing.language;  
    
        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_reset_refresh_materialized_views_marketing_film_details$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    15     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_refresh_mview_marketing_location_details()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_refresh_materialized_views_marketing_location_details$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

		-- REFRESH MATERIALIZED VIEW marketing.customer_details;  

		-- REFRESH MATERIALIZED VIEW marketing.film_details;  

		REFRESH MATERIALIZED VIEW marketing.location_details;  

		-- REFRESH MATERIALIZED VIEW marketing.store_details;    

		-- REFRESH MATERIALIZED VIEW marketing.category;  

		-- REFRESH MATERIALIZED VIEW marketing.city;  

		-- REFRESH MATERIALIZED VIEW marketing.country;   

		-- REFRESH MATERIALIZED VIEW marketing.language;  
    
        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_reset_refresh_materialized_views_marketing_location_details$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    16     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_refresh_mview_marketing_store_details()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_refresh_materialized_views_marketing_store_details$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

		-- REFRESH MATERIALIZED VIEW marketing.customer_details;  

		-- REFRESH MATERIALIZED VIEW marketing.film_details;  

		-- REFRESH MATERIALIZED VIEW marketing.location_details;  

		REFRESH MATERIALIZED VIEW marketing.store_details;    

		-- REFRESH MATERIALIZED VIEW marketing.category;  

		-- REFRESH MATERIALIZED VIEW marketing.city;  

		-- REFRESH MATERIALIZED VIEW marketing.country;   

		-- REFRESH MATERIALIZED VIEW marketing.language;  
    
        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_reset_refresh_materialized_views_marketing_store_details$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


-- #TODO VDM1 RESET STAGE END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### ####        VDM1 RESET STAGE END        #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
