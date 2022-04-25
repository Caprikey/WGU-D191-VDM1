CREATE OR REPLACE PROCEDURE staging.vdm1_stage2()
	LANGUAGE plpgsql
	AS $vdm1_stage2run$
	
	BEGIN

        -- RUN CUSTOMER STATUS AMEND PROCEDURE FIRST
        -- CALL staging.f_customer_status_amend();

        -- RUN CUSTOMER STATUS AMEND FUNCTION ON STAGE1_CUSTOMER Table to amend the activebool column
        EXECUTE staging.f_vdm1_stage2_customer_status_amend();

        -- #### #### #### #### 

		-- Inner Join Tables
	
		EXECUTE staging.f_vdm1_stage2_films();
		
		EXECUTE staging.f_vdm1_stage2_film_inventory();
		
		EXECUTE staging.f_vdm1_stage2_rentals();
		
		EXECUTE staging.f_vdm1_stage2_locationdetails();
		
		EXECUTE staging.f_vdm1_stage2_stores();
		
		EXECUTE staging.f_vdm1_stage2_customers();

        -- #### #### #### #### 

        -- Cross Join Tables

		EXECUTE staging.f_vdm1_stage2_customer_category();
		
		EXECUTE staging.f_vdm1_stage2_film_category();

		EXECUTE staging.f_vdm1_stage2_customer_film_category();
		
        -- #### #### #### #### 
        
		EXECUTE staging.f_vdm1_stage2_cleanup();
	
	
	END;
$vdm1_stage2run$;