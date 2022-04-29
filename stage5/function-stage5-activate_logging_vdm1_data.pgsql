CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_table_enabled_logging_vdm1_data()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage5_table_changes_activate_logging_vdm1_data$
    
    BEGIN

        -- #### #### #### #### #### #### #### #### 

        ALTER TABLE IF EXISTS vdm1_data.customer_category
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.failed_returns
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.new_releases
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.inventory_maintenance
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.inventory_maintenance_summary
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.customer_watch_history_detailed
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.customer_reclist_master_nonspecific
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.customer_reclist_master_specific
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.customer_reclist_summary_nonspecific
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.customer_reclist_summary_specific
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.category_popularity
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.film_category_popularity
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_data.customer_rec_custom_preferences
            SET LOGGED;

        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage5_table_changes_activate_logging_vdm1_data$;

