CREATE OR REPLACE PROCEDURE staging.vdm1_stage4b()
	LANGUAGE plpgsql
	AS $vdm1_stage4b_run$

	
	BEGIN 


 -- #### #### #### ####      

		-- PERFORM staging.f_vdm1_stage4_calc_update_customer_category_rank();

        PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_historical();

        PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_average();

        PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage();

        -- PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_user_custom();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default();

		PERFORM staging.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order();


        -- #### #### #### #### 

        PERFORM staging.f_vdm1_stage4_calc_update_film_popularity_row_number();

		PERFORM staging.f_vdm1_stage4_calc_update_film_category_popularity_row_number();

		-- PERFORM staging.f_vdm1_stage4_calc_update_customer_watch_history_row_number();



    END;
$vdm1_stage4b_run$;