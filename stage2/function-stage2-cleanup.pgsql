CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2cleanup$

	BEGIN	
	
		-- #### #### #### #### #### #### #### #### #### #### #### #### 

		DROP TABLE IF EXISTS staging.vdm1_stage1_address;
		
		DROP TABLE IF EXISTS staging.vdm1_stage1_customer;
		
		DROP TABLE IF EXISTS staging.vdm1_stage1_film;

		DROP TABLE IF EXISTS staging.vdm1_stage1_film_category;
		
		DROP TABLE IF EXISTS staging.vdm1_stage1_inventory;
		
		DROP TABLE IF EXISTS staging.vdm1_stage1_rental;
		
		DROP TABLE IF EXISTS staging.vdm1_stage1_store;
		
		-- #### #### #### #### 
		
		DROP TABLE IF EXISTS staging.vdm1_stage2_locationdetails;

		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage2_customers
			RENAME TO vdm1_stage3_customers;

		ALTER TABLE IF EXISTS staging.vdm1_stage2_stores
			RENAME TO vdm1_stage3_stores;

		ALTER TABLE IF EXISTS staging.vdm1_stage2_films
			RENAME TO vdm1_stage3_films;
			
		ALTER TABLE IF EXISTS staging.vdm1_stage2_rentals
			RENAME TO vdm1_stage3_rentals;

        -- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage2_film_inventory
			RENAME TO vdm1_stage3_film_inventory;

		ALTER TABLE IF EXISTS staging.vdm1_stage2_film_category
			RENAME TO vdm1_stage3_film_category;

		ALTER TABLE IF EXISTS staging.vdm1_stage2_customer_category
			RENAME TO vdm1_stage3_customer_category;

        ALTER TABLE IF EXISTS staging.vdm1_stage2_customer_film_category
            RENAME TO vdm1_stage3_customer_film_category;

		-- #### #### #### #### #### #### #### #### 
		
			
		ALTER TABLE IF EXISTS  staging.vdm1_stage1_city
			RENAME TO vdm1_stage3_dictkey_city;
			
		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS  staging.vdm1_stage1_country
			RENAME TO vdm1_stage3_dictkey_country;
		
		-- #### #### #### #### 

		
		ALTER TABLE IF EXISTS  staging.vdm1_stage1_language
			RENAME TO vdm1_stage3_dictkey_language;

		-- #### #### #### #### 

		
        ALTER TABLE IF EXISTS  staging.vdm1_stage1_category
			RENAME TO vdm1_stage3_dictkey_category;

		-- #### #### #### #### #### #### #### #### 
	
	
	END;
$vdm1_stage2cleanup$;