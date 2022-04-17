CREATE OR REPLACE PROCEDURE staging.stage1()
	LANGUAGE plpgsql
	AS $stage1run$

    BEGIN 

        -- RUN CUSTOMER STATUS AMEND PROCEDURE BEFORE IMPORTING
        -- This modifies the production database not the staging database. 
        -- This has to be ran before ETL to correct the issue before Extract occurs. 
        -- Secondary copy has been created in staging that runs at the beginning of Stage 2. 
        -- CALL public.customer_status_amend();

        -- #### #### #### #### 
        
        -- IMPORT CUSTOMER TABLE
        PERFORM staging.f_etl_tableimport_createasis('customer');

        -- IMPORT ADDRESSS TABLE
        PERFORM staging.f_etl_tableimport_createasis('address');

        -- IMPORT CITY TABLE
        PERFORM staging.f_etl_tableimport_createasis('city');

        -- IMPORT COUNTRY TABLE
        PERFORM staging.f_etl_tableimport_createasis('country');

        -- IMPORT STORE TABLE
        PERFORM staging.f_etl_tableimport_createasis('store');

        -- #### #### #### #### 

        -- IMPORT FILM TABLE
        PERFORM staging.f_etl_tableimport_createasis('film');

        -- IMPORT FILM_CATEORY TABLE
        PERFORM staging.f_etl_tableimport_createasis('film_category');

        -- IMPORT CATGEORY TABLE
        PERFORM staging.f_etl_tableimport_createasis('category');

        -- #### #### #### #### 
        
        -- IMPORT RENTAL TABLE 
        PERFORM staging.f_etl_tableimport_createasis('rental');

        -- IMPORT INVENTORY TABLE
        PERFORM staging.f_etl_tableimport_createasis('inventory');

        -- IMPORT LANGUAGE TABLE 
        PERFORM staging.f_etl_tableimport_createasis('language');
        
        -- #### #### #### #### 


    END;
$stage1run$
