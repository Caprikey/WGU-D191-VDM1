CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage5_table_enabled_logging_vdm1_etl()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage5_table_changes_activate_logging_vdm1_etl$
    
    BEGIN

        -- #### #### #### #### #### #### #### #### 

        ALTER TABLE IF EXISTS vdm1_etl.customer_category
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_etl.failed_returns
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_etl.new_releases
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_etl.inventory_maintenance
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_etl.inventory_maintenance_summary
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_etl.customer_watch_history_detailed
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_etl.customer_reclist_master_nonspecific
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_etl.customer_reclist_master_specific
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_etl.customer_reclist_summary_nonspecific
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_etl.customer_reclist_summary_specific
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_etl.category_popularity
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_etl.film_category_popularity
            SET LOGGED;

        ALTER TABLE IF EXISTS vdm1_etl.customer_rec_custom_preferences
            SET LOGGED;

        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_stage5_table_changes_activate_logging_vdm1_etl$;

