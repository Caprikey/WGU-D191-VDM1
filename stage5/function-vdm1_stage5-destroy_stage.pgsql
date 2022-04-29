CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_destroy_stage()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_destroy_stage$
	
	BEGIN
		
		DROP SCHEMA IF EXISTS staging
			CASCADE;

	END;
$vdm1_stage5_destroy_stage$;

