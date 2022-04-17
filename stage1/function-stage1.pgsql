CREATE OR REPLACE FUNCTION staging.f_vdm1_stage1_extractimport(tablename VARCHAR(30)) 
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage1extract$
		
	BEGIN
	 
		EXECUTE
			'CREATE UNLOGGED TABLE IF NOT EXISTS staging.vdm1_stage1_' || tablename || ' AS 
				SELECT * FROM public.' || tablename;
	
	END;
$vdm1_stage1extract$;