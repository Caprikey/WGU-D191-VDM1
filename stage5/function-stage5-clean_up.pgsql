CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_cleanup$
	
	BEGIN
		

		-- #### #### #### ####
	
        -- #### #### #### #### 

        DROP TABLE IF EXISTS staging.vdm1_stage5_customers;

        DROP TABLE IF EXISTS staging.vdm1_stage5_stores;

        DROP TABLE IF EXISTS staging.vdm1_stage5_films;

        DROP TABLE IF EXISTS staging.vdm1_stage5_dictkey_category;		

        DROP TABLE IF EXISTS staging.vdm1_stage5_dictkey_city;		

        DROP TABLE IF EXISTS staging.vdm1_stage5_dictkey_country;		

        DROP TABLE IF EXISTS staging.vdm1_stage5_dictkey_language;		
    
		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_category
			RENAME TO customer_category;

		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage5_failed_returns
			RENAME TO failed_returns;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_new_releases
			RENAME TO new_releases;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_inventory_maintenance
			RENAME TO inventory_maintenance;


		ALTER TABLE IF EXISTS staging.vdm1_stage5_inventory_maintenance_summary
			RENAME TO inventory_maintenance_summary;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_stagnant_film_inventory
			RENAME TO stagnant_film_inventory;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_watch_history_details
			RENAME TO customer_watch_history_detailed;
            
		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_master_nonspecific
			RENAME TO customer_reclist_master_nonspecific;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_master_specific
			RENAME TO customer_reclist_master_specific;
		
        -- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_summary_nonspecific
			RENAME TO customer_reclist_summary_nonspecific;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_summary_specific
			RENAME TO customer_reclist_summary_specific;


		-- #### #### #### #### #### #### #### #### 
 

        ALTER TABLE IF EXISTS staging.vdm1_stage5_category_popularity
            RENAME TO category_popularity;

        ALTER TABLE IF EXISTS staging.vdm1_stage5_film_category_popularity
            RENAME TO film_category_popularity;
			
        ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_rec_custom_preferences
            RENAME TO customer_rec_custom_preferences;

        -- #### #### #### #### 


	END;
$vdm1_stage5_cleanup$;
