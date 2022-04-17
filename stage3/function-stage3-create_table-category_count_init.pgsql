CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_category_count_init()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_category_count_init$
	
	BEGIN 

    CREATE UNLOGGED TABLE IF NOT EXISTS staging.vdm1_stage3_category_count_init AS 
        SELECT * FROM staging.vdm1_stage3_dictkey_category;

    END;

$vdm1_stage3_create_table_category_count_init$;