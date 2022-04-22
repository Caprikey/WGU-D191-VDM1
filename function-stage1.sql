CREATE OR REPLACE FUNCTION staging.f_stage1_extractimport(tablename VARCHAR(30)) 
	RETURNS VOID
	LANGUAGE plpgsql
	AS $stage1extract$
		
	BEGIN
	 
		EXECUTE
			'CREATE UNLOGGED TABLE IF NOT EXISTS staging.stage1_' || tablename || ' AS 
				SELECT * FROM public.' || tablename;
	
	END;
$stage1extract$;