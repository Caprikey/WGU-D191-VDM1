CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_datestamp()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage5_datestamp$

    BEGIN

		ALTER TABLE IF EXISTS staging.vdm1_stage5_inventory_maintenance
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_inventory_maintenance_summary
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_film_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_watch_history_details
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_rec_custom_preferences
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

        -- #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_master_nonspecific
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_master_specific
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_summary_nonspecific
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_customer_reclist_summary_specific
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage5_failed_returns
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_new_releases
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_stagnant_film_inventory
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_category_popularity
            ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_film_category_popularity
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;
        
        -- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_category
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_city
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_country
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_language
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_customer_details
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_store_details
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

		ALTER TABLE IF EXISTS staging.vdm1_stage5_dictkey_film_details
			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;

--		ALTER TABLE IF EXISTS staging.vdm1_stage5_rentals
--			ADD COLUMN generated_date DATE DEFAULT CURRENT_DATE;


    END;
$vdm1_stage5_datestamp$;