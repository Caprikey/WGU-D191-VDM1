CREATE OR REPLACE FUNCTION vdm1_etl.vdm1_reset_delete_tables_vdm1_etl()
	RETURNS VOID
	LANGUAGE plpgsql
	
	AS $vdm1_reset_procedure_function_delete_tables_vdm1_etl$
	
	
	BEGIN

		DROP TABLE IF EXISTS vdm1_etl.customer_category 
			CASCADE;
		DROP TABLE IF EXISTS vdm1_etl.failed_returns 
			CASCADE;
		DROP TABLE IF EXISTS vdm1_etl.new_releases 
			CASCADE;
		DROP TABLE IF EXISTS vdm1_etl.inventory_maintenance 
			CASCADE;
		DROP TABLE IF EXISTS vdm1_etl.inventory_maintenance_summary 
			CASCADE;
		DROP TABLE IF EXISTS vdm1_etl.customer_watch_history_detailed 
			CASCADE;
		DROP TABLE IF EXISTS vdm1_etl.customer_reclist_master_nonspecific 
			CASCADE;
		DROP TABLE IF EXISTS vdm1_etl.customer_reclist_master_specific 
			CASCADE;
		DROP TABLE IF EXISTS vdm1_etl.customer_reclist_summary_nonspecific 
			CASCADE;
		DROP TABLE IF EXISTS vdm1_etl.customer_reclist_summary_specific 
			CASCADE;
		DROP TABLE IF EXISTS vdm1_etl.category_popularity 
			CASCADE;
		DROP TABLE IF EXISTS vdm1_etl.film_category_popularity 
			CASCADE;
		DROP TABLE IF EXISTS vdm1_etl.customer_rec_custom_preferences 
			CASCADE;

	
	END;
$vdm1_reset_procedure_function_delete_tables_vdm1_etl$;
