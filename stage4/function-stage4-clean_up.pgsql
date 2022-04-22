CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_cleanup$
	
	BEGIN
		

		-- #### #### #### ####
	
		DROP TABLE IF EXISTS staging.vdm1_stage4_rentals;
		
		DROP TABLE IF EXISTS staging.vdm1_stage4_customer_film_category;
		
		
		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage4_customers
			RENAME TO vdm1_stage5_dictkey_customer_details;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_stores
			RENAME TO vdm1_stage5_dictkey_store_details;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_films
			RENAME TO vdm1_stage5_dictkey_film_details;


        -- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_category
		    RENAME TO vdm1_stage5_dictkey_category;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_city
			RENAME TO vdm1_stage5_dictkey_city;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_country
			RENAME TO vdm1_stage5_dictkey_country;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_language
			RENAME TO vdm1_stage5_dictkey_language;
			

        -- #### #### #### #### #### #### #### #### 



		-- ALTER TABLE IF EXISTS staging.vdm1_stage4_film_category
		--	RENAME TO vdm1_stage5_film_category;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_category
			RENAME TO vdm1_stage5_customer_category;

		-- ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_film_category
		--	RENAME TO vdm1_stage5_customer_film_category;


		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage4_failed_returns
			RENAME TO vdm1_stage5_failed_returns;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_new_releases
			RENAME TO vdm1_stage5_new_releases;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_film_inventory
			RENAME TO vdm1_stage5_inventory_maintenance;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_film_inventory_summary
			RENAME TO vdm1_stage5_inventory_maintenance_summary;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_cobbwebbed_film_inventory
			RENAME TO vdm1_stage5_stagnant_film_inventory;

		-- #### #### #### #### 

		-- ALTER TABLE IF EXISTS staging.vdm1_stage4_rentals
		--	RENAME TO vdm1_stage5_rentals;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_watch_history_details
			RENAME TO vdm1_stage5_customer_watch_history_details;

		-- ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_watch_history_array
		--	RENAME TO vdm1_stage5_customer_watch_history_array;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_reclist_master_nonspecific
			RENAME TO vdm1_stage5_customer_reclist_master_nonspecific;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_reclist_master_specific
			RENAME TO vdm1_stage5_customer_reclist_master_specific;

		-- #### #### #### #### 

        ALTER TABLE IF EXISTS staging.vdm1_stage4_category_popularity_count
            RENAME TO vdm1_stage5_category_popularity;

        ALTER TABLE IF EXISTS staging.vdm1_stage4_film_category_popularity
            RENAME TO vdm1_stage5_film_category_popularity;
			
        ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_rec_custom_preferences
            RENAME TO vdm1_stage5_customer_rec_custom_preferences;

        -- ALTER TABLE IF EXISTS staging.vdm1_stage4_city_count_init
        --    RENAME TO vdm1_stage5_city_rental_count;

        -- ALTER TABLE IF EXISTS staging.vdm1_stage4_country_count_init
        --    RENAME TO vdm1_stage5_country_rental_count;

        -- #### #### #### #### 




	END;
$vdm1_stage4_cleanup$;