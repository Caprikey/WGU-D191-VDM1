CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_table_customer_reclist_summary_nonspecific$
	
	BEGIN 

		CREATE TABLE staging.vdm1_stage5_customer_reclist_summary_nonspecific AS (

		      customer_id INTEGER NOT NULL
            , film_rec_order INTEGER NULL
            , film_id INTEGER NOT NULL
            , category_id INTEGER NOT NULL 
		);
	
	END;
$vdm1_stage5_create_table_customer_reclist_summary_nonspecific$;