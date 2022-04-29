CREATE OR REPLACE FUNCTION vdm1_etl.vdm1_reset_delete_tables_vdm1_data()
	RETURNS VOID
	LANGUAGE plpgsql
	
	AS $vdm1_reset_procedure_function_delete_tables_vdm1_data$
	
	
	BEGIN

        -- #### #### #### #### #### #### #### #### 

		DROP TABLE IF EXISTS vdm1_data.customer_category 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.failed_returns 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.new_releases 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.inventory_maintenance 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.inventory_maintenance_summary 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.customer_watch_history_detailed 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.customer_reclist_master_nonspecific 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.customer_reclist_master_specific 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.customer_reclist_summary_nonspecific 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.customer_reclist_summary_specific 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.category_popularity 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.film_category_popularity 
			CASCADE;
		
        DROP TABLE IF EXISTS vdm1_data.customer_rec_custom_preferences 
			CASCADE;

	
        -- #### #### #### #### #### #### #### #### 

	END;
$vdm1_reset_procedure_function_delete_tables_vdm1_data$;
