CREATE OR REPLACE PROCEDURE staging.vdm1_stage3()
	LANGUAGE plpgsql
	AS $vdm1_stage3run$
	
	BEGIN 
	
		PERFORM staging.f_vdm1_stage3_create_table_new_releases();
		
		PERFORM staging.f_vdm1_stage3_create_table_failed_returns();

		PERFORM staging.f_vdm1_stage3_create_table_cobbwebbed_film_inventory();


		-- #### #### #### #### 

        PERFORM staging.f_vdm1_stage3_create_table_category_count_init();

		-- PERFORM staging.f_vdm1_stage3_create_table_city_count_init();

	    -- PERFORM staging.f_vdm1_stage3_create_table_country_count_init();


		-- #### #### #### #### 

		PERFORM staging.f_vdm1_stage3_create_table_customer_watch_history_details();
		
		-- PERFORM staging.f_vdm1_stage3_create_table_customer_watch_history_array();

        PERFORM staging.f_vdm1_stage3_create_table_cx_rec_list_master();

		PERFORM staging.f_vdm1_stage3_create_table_cx_rec_list_summary();

        PERFORM staging.f_vdm1_stage3_create_table_customer_rec_custom_preferences();

		-- #### #### #### #### 
		
		PERFORM staging.f_vdm1_stage3_table_changes();
		
		PERFORM staging.f_vdm1_stage3_cleanup();
		
	END;
$vdm1_stage3run$;