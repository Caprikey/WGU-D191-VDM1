CREATE OR REPLACE PROCEDURE staging.vdm1_stage4()
	LANGUAGE plpgsql
	AS $vdm1_stage4run$
	
	BEGIN 
	
		PERFORM staging.f_vdm1_stage4_calc_update_customer_watch_history_row_number();

		PERFORM staging.f_vdm1_stage4_calc_update_category_popularity_count();

		-- PERFORM staging.f_vdm1_stage4_city_rental_count();

		-- PERFORM staging.f_vdm1_stage4_country_rental_count();

        PERFORM staging.f_vdm1_stage4_calc_update_film_popularity_count();

		PERFORM staging.f_vdm1_stage4_calc_update_film_inventory_count();

        PERFORM staging.f_vdm1_stage4_calc_update_film_inventory_flag_inspection();

		PERFORM staging.f_vdm1_stage4_create_table_film_inventory_summary();
        
		-- #### #### #### #### 


		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_count_null_corrections();

		PERFORM staging.f_vdm1_stage4_calc_update_customer_category_historical_count();

    	PERFORM staging.f_vdm1_stage4_calc_update_customer_category_average_count();

		PERFORM staging.f_vdm1_stage4_calc_update_customer_category_halfaverage_count();




		-- #### #### #### #### 

		
		-- PERFORM staging.f_vdm1_stage4_calc_update_customer_category_rank();

        PERFORM staging.f_vdm1_stage4_calc_update_customer_category_recorder_historical();

        PERFORM staging.f_vdm1_stage4_calc_update_customer_category_recorder_average();

        PERFORM staging.f_vdm1_stage4_calc_update_customer_category_recorder_halfaverage();

        PERFORM staging.f_vdm1_stage4_calc_update_customer_category_recorder_user_custom();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order();


        -- #### #### #### #### 

        PERFORM staging.f_vdm1_stage4_calc_update_film_popularity_row_number();

		PERFORM staging.f_vdm1_stage4_calc_update_film_category_popularity_row_number();

		-- PERFORM staging.f_vdm1_stage4_calc_update_customer_watch_history_row_number();

		-- #### #### #### #### 

		PERFORM staging.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat();

		-- #### #### #### #### 
		

		PERFORM staging.f_vdm1_stage4_calc_insert_failed_returns_v2();

		PERFORM staging.f_vdm1_stage4_calc_insert_new_releases_v2();

		PERFORM staging.f_vdm1_stage4_calc_insert_cobbwebbed_film_inventory();

		-- PERFORM staging.f_vdm1_stage4_calc_insert_customer_reclist_master_v2();

		-- PERFORM staging.f_vdm1_stage4_calc_insert_customer_recommendation_list_summary();
    
        -- PERFORM staging.f_vdm1_stage4_calc_insert_customer_reclist_summary_default();
    	
		-- PERFORM staging.f_vdm1_stage4_calc_update_customer_reclist_summary_row_number();

		PERFORM staging.f_vdm1_stage4_calc_insert_customer_reclist_master_nonspecific();
		
		PERFORM staging.f_vdm1_stage4_calc_update_customer_reclist_master_nonspecific_row_number();

		PERFORM staging.f_vdm1_stage4_calc_insert_customer_reclist_master_specific_default();

		PERFORM staging.f_vdm1_stage4_calc_insert_customer_reclist_master_specific_row_number();


		-- #### #### #### #### 

		-- Migrating to stage 5
		-- PERFORM staging.f_vdm1_stage4_datestamp();

		PERFORM staging.f_vdm1_stage4_cleanup();

	END;
$vdm1_stage4run$;