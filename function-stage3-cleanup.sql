CREATE OR REPLACE FUNCTION staging.stage3_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $stage3cleanup$
	
	BEGIN
		
        
		
		ALTER TABLE IF EXISTS staging.stage2_customers
			RENAME TO stage4_customers;

		ALTER TABLE IF EXISTS staging.stage2_stores
			RENAME TO stage4_stores;

		ALTER TABLE IF EXISTS staging.stage2_films
			RENAME TO stage4_films;
			
		ALTER TABLE IF EXISTS staging.stage2_rentals
			RENAME TO stage4_rentals;

		ALTER TABLE IF EXISTS staging.stage2_film_inventory
			RENAME TO stage4_film_inventory;

		ALTER TABLE IF EXISTS staging.stage2_film_category
			RENAME TO stage4_film_category;

		ALTER TABLE IF EXISTS staging.stage2_customer_category
			RENAME TO stage4_customer_category;

		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.stage3_failed_returns
			RENAME TO stage4_fail_returns;

		ALTER TABLE IF EXISTS staging.stage3_new_releases
			RENAME TO stage4_new_release;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.stage3_dictkey_category
			RENAME TO stage4_dictkey_category;

		ALTER TABLE IF EXISTS staging.stage3_dictkey_city
			RENAME TO stage4_dictkey_city;

		ALTER TABLE IF EXISTS staging.stage3_dictkey_country
			RENAME TO stage4_dictkey_country;

		ALTER TABLE IF EXISTS staging.stage3_dictkey_language
			RENAME TO stage4_dictkey_language;
			
	END;
$stage3cleanup$;