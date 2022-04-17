CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_country_count_init()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_country_count_init$
	
	BEGIN 

    CREATE UNLOGGED TABLE IF NOT EXISTS staging.vdm1_stage3_country_count_init AS 
        SELECT * FROM staging.vdm1_stage3_dictkey_country;

    END;
$vdm1_stage3_create_table_country_count_init$;