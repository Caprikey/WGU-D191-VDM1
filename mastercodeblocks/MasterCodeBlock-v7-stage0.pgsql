
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

--                  1. CREATE SCHEMA :: MARKETING
--                  2. CREATE SCHEMA :: VDM1_ETL
--                  3. DROP SCHEMA :: STAGING - CASCADE
--                  4. CREATE SCHEMA :: STAGING
--                  5. DROP SCHEMA :: VDM1_DATA - CASCADE
--					6. CREATE SCHEMA :: VDM1_DATA

--            STORED PROCEDURES

--                  1. vdm1_etl.vdm1_etl_main();
--                  2. vdm1_etl.vdm1_evdm1_reset_stage0();

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

