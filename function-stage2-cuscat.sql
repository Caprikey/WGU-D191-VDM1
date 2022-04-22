CREATE OR REPLACE FUNCTION staging.f_stage2_customer_category()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $stage2custcat$
	
	BEGIN 
	
		CREATE TABLE staging.stage2_customer_category AS (
	
		SELECT 
			  a.customer_id
			, b.category_id
		FROM staging.stage1_customer a
			CROSS JOIN staging.stage1_category b
	);
	
	END;
$stage2custcat$;