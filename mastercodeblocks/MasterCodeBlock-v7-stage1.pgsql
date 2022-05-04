
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

--                  1. vdm1_etl.vdm1_stage1();

--             FUNCTIONS

--                  1. vdm1_etl.f_vdm1_stage1_extractimport(tablename VARCHAR(30));
--                  2. vdm1_etl.f_vdm1_stage1_data_validation_count_check(p_schema_one varchar, p_table_one varchar, p_schmea_two varchar, p_table_two varchar);

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


		PERFORM vdm1_etl.f_calc_expected_return_date_container();


		PERFORM vdm1_etl.f_transform_customer_full_name_container();


		PERFORM vdm1_etl.f_transform_filmlength_int2vchar_container();


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

--      1. vdm1_etl.f_vdm1_stage1_extractimport(tablename VARCHAR(30));
--      2. vdm1_etl.f_vdm1_stage1_data_validation_count_check(p_schema_one varchar, p_table_one varchar, p_schmea_two varchar, p_table_two varchar);
--      3. vdm1_data.f_vdm1_calc_expected_return_date(p_film_id INT, p_rental_date DATE)
--      4. vdm1_data.f_vdm1_transform_customer_full_name(p_first_name VARCHAR, p_last_name VARCHAR)
--      5. vdm1_data.f_vdm1_transform_filmlength_int2vchar(p_length INTEGER)
--      6. vdm1_data.f_vdm1_transform_customer_phone_e164(p_phone VARCHAR)


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
	 
		EXECUTE
			'CREATE UNLOGGED TABLE IF NOT EXISTS staging.vdm1_stage1_' || tablename || ' AS 
				SELECT * FROM public.' || tablename;
	
	END;
$vdm1_stage1extract$;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
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
					staging.vdm1_stage4_films as A
				WHERE 
					vi_film_id = a.film_id;

				vo_expected_return_date := vi_rental_date + vlu_rental_duration;

				RETURN vo_expected_return_date;
			END;
		$vdm1_f_calc_expected_return_date$;
	';
	END;
$vdm1_data_f_calc_expected_return_date_container$;


-- #### #### #### #### #### #### #### #### 


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


-- #### #### #### #### #### #### #### #### 

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


-- #### #### #### #### #### #### #### #### 

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


-- #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #TODO STAGE 1 END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 1 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- MASTER CODE BLOCK - STAGE 2
