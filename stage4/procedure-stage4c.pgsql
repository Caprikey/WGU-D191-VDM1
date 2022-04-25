CREATE OR REPLACE PROCEDURE staging.vdm1_stage4c()
	LANGUAGE plpgsql
	AS $vdm1_stage4c_run$

	
	BEGIN 
        
        -- #### #### #### #### 


		PERFORM staging.f_vdm1_stage4_calc_insert_customer_reclist_master_nonspecific();

        PERFORM staging.f_vdm1_stage4_calc_update_customer_reclist_master_nonspecific_row_number();

        PERFORM staging.f_vdm1_stage4_calc_insert_customer_reclist_master_specific_default();

		PERFORM staging.f_vdm1_stage4_calc_update_customer_reclist_master_specific_row_number();
    
        -- PERFORM staging.f_vdm1_stage4_calc_insert_customer_reclist_summary_default();
        
        -- PERFORM staging.f_vdm1_stage4_calc_update_customer_reclist_summary_row_number();

		-- PERFORM staging.f_vdm1_stage4_calc_insert_customer_recommendation_list_summary();


		-- #### #### #### #### 

        -- MIGRATING TO STAGE 5
		-- PERFORM staging.f_vdm1_stage4_datestamp();

		PERFORM staging.f_vdm1_stage4_cleanup();


    END;
$vdm1_stage4c_run$;

CR034617998
