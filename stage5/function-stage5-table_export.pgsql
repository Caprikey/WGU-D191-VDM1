CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_load_date(tablename VARCHAR(30)) 
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_load$
		
	BEGIN
	 
		EXECUTE
			'CREATE UNLOGGED TABLE IF NOT EXISTS marketing.' || tablename || ' AS 
				SELECT * FROM staging.' || tablename;
	
	END;
$vdm1_stage5_load$;