-- MASTER CODE BLOCK - STAGE 1

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

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

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 1 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 1 BEGIN


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

--     1. vdm1_etl.f_vdm1_stage1_extractimport(tablename VARCHAR(30));
--     2. vdm1_etl.f_vdm1_stage1_data_validation_count_check(p_schema_one varchar, p_table_one varchar, p_schmea_two varchar, p_table_two varchar);

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
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

-- #TODO STAGE 1 END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 1 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
