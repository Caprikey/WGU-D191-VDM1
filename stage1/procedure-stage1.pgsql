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
$vdm1_stage1run$
