CREATE OR REPLACE PROCEDURE staging.vdm1_stage5()
	LANGUAGE plpgsql
	AS $vdm1_stage5_run$
	
	BEGIN 


        -- #### #### #### #### #### #### #### #### 


        PERFORM staging.f_vdm1_stage5_createtable_cx_reclist_summary_nonspecific();


        PERFORM staging.f_vdm1_stage5_createtable_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 
        PERFOMR staging.f_vdm1_stage5_create_table_inventory_maintenance_summary();

        PERFORM staging.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific();


        PERFORM staging.f_vdm1_stage5_insert_cx_reclist_summary_specific();


        -- #### #### #### #### #### #### #### #### 


        PERFORM staging.f_vdm1_stage5_create_mview_customer_details(); 

        PERFORM staging.f_vdm1_stage5_create_mview_store_details(); 

        PERFORM staging.f_vdm1_stage5_create_mview_location_details(); 
        
        PERFORM staging.f_vdm1_stage5_create_mview_film_details(); 

        









        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage5_run$;



-- #### #### #### #### #### #### #### #### 