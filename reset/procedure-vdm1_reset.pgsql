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

        CALL vdm1_etl.vdm1_reset_mview_setup();

		
	END;
$vdm1_reset$;