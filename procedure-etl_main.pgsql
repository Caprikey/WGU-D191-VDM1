CREATE OR REPLACE PROCEDURE staging.vdm1_etl_main()
	LANGUAGE plpgsql
	AS $vdm1_main_run$

    BEGIN 

		-- STAGE 1
		CALL staging.vdm1_stage1();
		
		-- STAGE 2 RUN
		CALL staging.vdm1_stage2();

		-- STAGE 3 RUN 
		CALL staging.vdm1_stage3();
		
		-- STAGE 4 RUN
		CALL staging.vdm1_stage4();
		
		-- STAGE 5 RUN
		CALL staging.vdm1_stage5();


	END;
$vdm1_main_run$;