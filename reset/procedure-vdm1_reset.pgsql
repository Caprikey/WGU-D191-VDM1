CREATE OR REPLACE PROCEDURE vdm1_etl.vmd1_reset()
	LANGUAGE 'plpgsql'
	AS $vdm1_reset$
	
	BEGIN 

		-- #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.vdm1_reset_delete_tables_vdm1_data();

		-- #### #### #### #### #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_reset_delete_tables_marketing();

        PERFORM vdm1_etl.f_vdm1_reset_delete_tables_vdm1_etl();

        PERFORM vdm1_etl.f_vdm1_reset_delete_tables_vdm1_data();
			
		-- #### #### #### #### #### #### #### #### 
		

		

        
		-- #### #### #### #### #### #### #### #### 		
		
	END;
$vdm1_reset$;
