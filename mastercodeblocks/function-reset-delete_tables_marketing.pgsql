CREATE OR REPLACE FUNCTION vdm1_etl.vdm1_reset_delete_tables_marketing()
	RETURNS VOID
	LANGUAGE plpgsql
	
	AS $vdm1_reset_procedure_function_delete_tables_marketing$
	
	
	BEGIN

        -- #### #### #### #### #### #### #### #### 
        
		DROP TABLE IF EXISTS marketing.customer_category 
			CASCADE;
		
        DROP TABLE IF EXISTS marketing.failed_returns 
			CASCADE;
		
        DROP TABLE IF EXISTS marketing.new_releases 
			CASCADE;
		
        DROP TABLE IF EXISTS marketing.inventory_maintenance 
			CASCADE;
		
        DROP TABLE IF EXISTS marketing.inventory_maintenance_summary 
			CASCADE;
		
        DROP TABLE IF EXISTS marketing.customer_watch_history_detailed 
			CASCADE;
		
        DROP TABLE IF EXISTS marketing.customer_reclist_master_nonspecific 
			CASCADE;
		
        DROP TABLE IF EXISTS marketing.customer_reclist_master_specific 
			CASCADE;
		
        DROP TABLE IF EXISTS marketing.customer_reclist_summary_nonspecific 
			CASCADE;
		
        DROP TABLE IF EXISTS marketing.customer_reclist_summary_specific 
			CASCADE;
		
        DROP TABLE IF EXISTS marketing.category_popularity 
			CASCADE;
		
        DROP TABLE IF EXISTS marketing.film_category_popularity 
			CASCADE;
		
        DROP TABLE IF EXISTS marketing.customer_rec_custom_preferences 
			CASCADE;

        -- #### #### #### #### #### #### #### #### 
	
	END;
$vdm1_reset_procedure_function_delete_tables_marketing$;
