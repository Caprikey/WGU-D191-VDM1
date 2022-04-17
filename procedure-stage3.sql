CREATE OR REPLACE PROCEDURE staging.stage3()
	LANGUAGE plpgsql
	AS $stage3run$
	
	BEGIN 
	
		PERFORM staging.f_stage3_new_releases();
		
		PERFORM staging.f_stage3_failed_returns();
		
		PERFORM staging.stage3_tablechanges();
		
		PERFORM staging.stage3_cleanup();
		
	END;
$stage3run$