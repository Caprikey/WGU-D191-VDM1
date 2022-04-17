CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_customer_category()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2custcat$
	
	BEGIN 
	
		CREATE TABLE staging.vdm1_stage2_customer_category AS (
	
		SELECT 
			  a.customer_id
			, b.category_id
		FROM staging.vdm1_stage2_customers a
			CROSS JOIN staging.vdm1_stage1_category b

	);
	
	END;
$vdm1_stage2custcat$;