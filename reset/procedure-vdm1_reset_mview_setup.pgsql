CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_reset_mview_setup()
	LANGUAGE plpgsql
	AS $vdm1_reset_materialized_view_recreation$
	
	BEGIN 

		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_mviews_marketing_customer_details();

        PERFORM vdm1_etl.f_vdm1_reset_create_mview_customer_details();

        PERFORM vdm1_etl.f_vdm1_reset_refresh_mview_marketing_customer_details();
        
 		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_mviews_marketing_film_details();

        PERFORM vdm1_etl.f_vdm1_reset_create_mview_film_details();

        PERFORM vdm1_etl.f_vdm1_reset_refresh_mview_marketing_film_details();

		-- #### #### #### #### #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_reset_drop_mviews_marketing_location_details();

        PERFORM vdm1_etl.f_vdm1_reset_create_mview_location_details();

        PERFORM vdm1_etl.f_vdm1_reset_refresh_mview_marketing_location_details();

  		-- #### #### #### #### #### #### #### ####       

        PERFORM vdm1_etl.f_vdm1_reset_drop_mviews_marketing_store_details();

        PERFORM vdm1_etl.f_vdm1_reset_create_mview_store_details();

        PERFORM vdm1_etl.f_vdm1_reset_refresh_mview_marketing_store_details();

		-- #### #### #### #### #### #### #### #### 

	END;
$vdm1_reset_materialized_view_recreation$;