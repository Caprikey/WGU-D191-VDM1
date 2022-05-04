
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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO STAGE 2 - STORED PROCEDURES

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

--      1. vdm1_etl.f_vdm1_stage2_customer_status_amend()
--      2. vdm1_etl.f_vdm1_stage2_films()
--      3. vdm1_etl.f_vdm1_stage2_film_inventory()
--      4. vdm1_etl.f_vdm1_stage2_rentals()
--      5. vdm1_etl.f_vdm1_stage2_locationdetails()
--      6. vdm1_etl.f_vdm1_stage2_stores()
--      7. vdm1_etl.f_vdm1_stage2_customers()
--      8. vdm1_etl.f_vdm1_stage2_customer_category()
--      9. vdm1_etl.f_vdm1_stage2_film_category()
--     10. vdm1_etl.f_vdm1_stage2_customer_film_category()
--     11. vdm1_etl.f_vdm1_stage2_cleanup()


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

-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### 


-- #TODO STAGE 2 END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 2 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- MASTER CODE BLOCK - STAGE 3
