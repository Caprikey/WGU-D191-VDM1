CREATE OR REPLACE PROCEDURE staging.vdm1_stage4a()
	LANGUAGE plpgsql
	AS $vdm1_stage4a_run$

	
	BEGIN 
	
		PERFORM staging.f_vdm1_stage4_calc_update_customer_watch_history_row_number();

		PERFORM staging.f_vdm1_stage4_calc_update_category_popularity_count();

        -- #### #### #### #### 

		-- PERFORM staging.f_vdm1_stage4_city_rental_count();

		-- PERFORM staging.f_vdm1_stage4_country_rental_count();

      	-- #### #### #### #### 
        
        PERFORM staging.f_vdm1_stage4_calc_update_film_popularity_count();

		PERFORM staging.f_vdm1_stage4_calc_update_film_inventory_count();

		-- #### #### #### #### 

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_count_null_corrections();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_historical_count();

    	PERFORM staging.f_vdm1_stage4_calc_update_cuscat_average_count();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_halfaverage_count();


        -- #### #### #### #### 

        PERFORM staging.f_vdm1_stage4_calc_update_film_inventory_flag_inspection();
        
		-- MIGRATING TO STAGE 5
        -- PERFORM staging.f_vdm1_stage4_create_table_film_inventory_summary();

        PERFORM staging.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat();

		-- #### #### #### #### 

		PERFORM staging.f_vdm1_stage4_calc_insert_failed_returns_v2();

		PERFORM staging.f_vdm1_stage4_calc_insert_new_releases_v2();

		PERFORM staging.f_vdm1_stage4_calc_insert_cobbwebbed_film_inventory();
        
   		
       


	END;
$vdm1_stage4a_run$;
