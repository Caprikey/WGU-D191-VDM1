CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_table_changes()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3tblchg$
	
	BEGIN

		-- #### #### #### #### 

        ALTER TABLE IF EXISTS staging.vdm1_stage3_dictkey_city
			DROP COLUMN IF EXISTS country_id,
			DROP COLUMN IF EXISTS last_update;

        ALTER TABLE IF EXISTS staging.vdm1_stage3_dictkey_country
			DROP COLUMN IF EXISTS last_update;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_dictkey_category
			DROP COLUMN IF EXISTS last_update;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_dictkey_language
			DROP COLUMN IF EXISTS last_update;
		
        
        -- #### #### #### #### #### #### #### #### 
        
        ALTER TABLE IF EXISTS staging.vdm1_stage3_film_category
			ADD COLUMN total_rentals INTEGER NOT NULL DEFAULT 0,
			ADD COLUMN film_rank INTEGER DEFAULT NULL,
			ADD COLUMN film_category_rank INTEGER DEFAULT NULL,
			ADD COLUMN film_category_row_number INTEGER DEFAULT NULL;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_films
			ADD COLUMN new_release BOOLEAN NOT NULL DEFAULT FALSE;
		
						
		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_rentals
			ALTER COLUMN rental_date
				SET DATA TYPE DATE USING rental_date::date;


		ALTER TABLE IF EXISTS staging.vdm1_stage3_rentals
			ALTER COLUMN return_date
				SET DATA TYPE DATE USING return_date::date;

		-- #### #### #### #### 

		-- ALTER TABLE IF EXISTS staging.vdm1_stage3_city_count_init
		-- 	DROP COLUMN IF EXISTS country_id,
		--	DROP COLUMN IF EXISTS last_update,
		--	ADD COLUMN total_rentals INT NOT NULL DEFAULT 0;


		-- ALTER TABLE IF EXISTS staging.vdm1_stage3_country_count_init
		--	DROP COLUMN IF EXISTS last_update,
		--	ADD COLUMN total_rentals INT NOT NULL DEFAULT 0;


		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_watch_history_details
			ALTER COLUMN rental_date
				SET DATA TYPE DATE USING rental_date::date;

		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_watch_history_details
			ALTER COLUMN return_date
				SET DATA TYPE DATE USING return_date::date;

        ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_watch_history_details
			ADD COLUMN customer_watch_history_desc_order INTEGER null;

		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_film_inventory
			ADD COLUMN life_cycle INTEGER NOT NULL DEFAULT 0,
			ADD COLUMN new_release BOOLEAN NOT NULL DEFAULT FALSE,
			ADD COLUMN inspect_flag BOOLEAN NOT NULL DEFAULT FALSE,
			ADD COLUMN maintenance_complete_flag BOOLEAN NOT NULL DEFAULT FALSE;


        -- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_customer_category
			ADD COLUMN historical_rental_count INTEGER DEFAULT NULL,
            ADD COLUMN recommendation_order_historical INTEGER DEFAULT NULL,
  			ADD COLUMN average_rental_count INTEGER DEFAULT NULL,
            ADD COLUMN recommendation_order_average INTEGER DEFAULT NULL,
            ADD COLUMN hafeaverage_rental_count INTEGER DEFAULT NULL,
            ADD COLUMN recommendation_order_halfaverage INTEGER DEFAULT NULL,
            ADD COLUMN recommendation_order_customer_preference INTEGER DEFAULT NULL;

		-- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage3_category_count_init
		    DROP COLUMN IF EXISTS last_update,
            ADD COLUMN total_rentals INTEGER DEFAULT 0;

		-- #### #### #### #### #### #### #### #### 

			
	END;
$vdm1_stage3tblchg$;