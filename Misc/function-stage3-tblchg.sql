CREATE OR REPLACE FUNCTION staging.stage3_tablechanges()
	RETURNS VOID
	LANGUAGE plpgsql;
	AS $stage3tblchg;
	
	BEGIN

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.stage2_film_category
			ADD COLUMN total_rentals INTEGER NOT NULL DEFAULT 0,
			ADD COLUMN film_rank INTEGER DEFAULT NULL,
			ADD COLUMN film_category_rank INTEGER DEFAULT NULL;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.stage2_films
			ADD COLUMN new_release BOOLEAN NOT NULL DEFAULT FALSE;
			
		
						
		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.stage2_rentals
			ALTER COLUMN rental_date
				SET DATA TYPE DATE USING rental_date::date;

		ALTER TABLE IF EXISTS staging.stage2_rentals
			ALTER COLUMN return_date
				SET DATA TYPE DATE USING return_date::date;

		-- #### #### #### ####

		ALTER TABLE IF EXISTS staging.stage2_film_inventory
			ADD COLUMN life_cycle INTEGER NOT NULL DEFAULT 0,
			ADD COLUMN new_release BOOLEAN NOT NULL DEFAULT FALSE;

		ALTER TABLE IF EXISTS staging.stage2_customer_category
			ADD COLUMN category_rank INTEGER DEFAULT NULL;


		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.stage2_customers
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.stage2_stores
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.stage2_films
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.stage2_rentals
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.stage2_film_inventory
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.stage2_film_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.stage2_customer_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.stage3_failed_returns
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.stage3_new_releases
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.stage3_dictkey_category
			ADD COLUMN generation_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.stage3_dictkey_city
			ADD COLUMN generation_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.stage3_dictkey_country
			ADD COLUMN generation_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.stage3_dictkey_language
			ADD COLUMN generation_date DATE DEFAULT CURRENT_DATE;
			
	END;
$stage3tblchg$;