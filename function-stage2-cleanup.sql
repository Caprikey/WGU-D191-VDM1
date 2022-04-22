CREATE OR REPLACE FUNCTION staging.f_stage2_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $stage2cleanup$

	BEGIN	
	
		-- #### #### #### #### #### #### #### #### #### #### #### #### 

		DROP TABLE IF EXISTS staging.stage1_address;
		
		DROP TABLE IF EXISTS staging.stage1_customer;
		
		DROP TABLE IF EXISTS staging.stage1_film;

		DROP TABLE IF EXISTS staging.stage1_film_category;
		
		DROP TABLE IF EXISTS staging.stage1_inventory;
		
		DROP TABLE IF EXISTS staging.stage1_rental;
		
		DROP TABLE IF EXISTS staging.stage1_store;
		
		-- #### #### #### #### 
		
		DROP TABLE IF EXISTS staging.stage2_locationdetails;

		-- #### #### #### #### #### #### #### #### 


		ALTER TABLE IF EXISTS staging.stage1_city
			DROP COLUMN IF EXISTS country_id,
			DROP COLUMN IF EXISTS last_update;
			
		ALTER TABLE IF EXISTS  staging.stage1_city
			RENAME TO stage3_dictkey_city;
			
		-- #### #### #### #### 

		ALTER TABLE IF EXISTS  staging.stage1_country
			DROP COLUMN IF EXISTS last_update;
		
		ALTER TABLE IF EXISTS  staging.stage1_country
			RENAME TO stage3_dictkey_country;
		
		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS  staging.stage1_language
			DROP COLUMN IF EXISTS last_update;
		
		ALTER TABLE IF EXISTS  staging.stage1_language
			RENAME TO stage3_dictkey_language;

		-- #### #### #### #### 

						
		ALTER TABLE  IF EXISTS staging.stage1_category
			DROP COLUMN IF EXISTS last_update;


		ALTER TABLE IF EXISTS  staging.stage1_category
			RENAME TO stage3_dictkey_category;

		-- #### #### #### #### #### #### #### #### 
	
	
	END;
$stage2cleanup$;