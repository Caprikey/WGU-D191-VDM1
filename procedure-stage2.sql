CREATE OR REPLACE PROCEDURE staging.stage2()
	LANGUAGE plpgsql
	AS $stage2run$
	
	BEGIN

        -- RUN CUSTOMER STATUS AMEND PROCEDURE FIRST
        -- CALL staging.f_customer_status_amend();

        -- RUN CUSTOMER STATUS AMEND FUNCTION ON STAGE1_CUSTOMER Table to amend the activebool column
        EXECUTE staging.f_stage2_customer_status_amend();

        -- #### #### #### #### 
	
		EXECUTE staging.f_stage2_films();
		
		EXECUTE staging.f_stage2_film_inventory();
		
		EXECUTE staging.f_stage2_rentals();
		
		EXECUTE staging.f_stage2_locationdetails();
		
		EXECUTE staging.f_stage2_stores();
		
		EXECUTE staging.f_stage2_customers();
		
		EXECUTE staging.f_stage2_customer_category();
		
		EXECUTE staging.f_stage2_film_category();
		
		EXECUTE staging.f_stage2_cleanup();
	
	
	END;
$stage2run$;