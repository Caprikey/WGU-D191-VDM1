CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_cx_reclist_master_specific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_customer_reclist_master_specific$
	
	BEGIN 
	
	CREATE TABLE staging.vdm1_stage3_customer_reclist_master_specific (


			  customer_id INTEGER NOT NULL 
            , category_rank_row_number INTEGER NULL
            , category_id INTEGER NOT NULL
            , rec_order INTEGER NULL
            , film_id INTEGER NOT NULL
			, film_category_rank INTEGER NOT NULL		
            , total_rentals INTEGER NOT NULL
	);
	END;
$vdm1_stage3_create_table_customer_reclist_master_specific$;