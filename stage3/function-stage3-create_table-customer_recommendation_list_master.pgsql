CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_cx_rec_list_master()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_ccustomer_recommendation_list_master$
	
	BEGIN 
	
	CREATE TABLE staging.vdm1_stage3_customer_recommendation_list_master (


			  customer_id INTEGER NOT NULL 
            , film_rank INTEGER NULL
            , category_id INTEGER NOT NULL
            , rec_order INTEGER NULL
            , film_id INTEGER NOT NULL
			, film_category_rank INTEGER NOT NULL		
            , total_rentals INTEGER NOT NULL
	);
	END;
$vdm1_stage3_create_table_ccustomer_recommendation_list_master$;