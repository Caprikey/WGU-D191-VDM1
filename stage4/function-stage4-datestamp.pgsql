CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_datestamp()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage4_datestamp$

    BEGIN

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customers
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_stores
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_films
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_rentals
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_film_inventory
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_film_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage4_failed_returns
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_new_releases
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_category_count_init
            ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;
        
        -- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_city
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_country
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_language
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

    END;
$vdm1_stage4_datestamp$;