CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_customers()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2customers$
	
	BEGIN 
	
	CREATE TABLE staging.vdm1_stage2_customers AS (

		SELECT 
			  a.customer_id
			, a.store_id
			, a.first_name
			, a.last_name
			, a.email
			, a.create_date
			, a.activebool
			, b.phone
			, b.city_id
			, b.country_id
		FROM staging.vdm1_stage1_customer a 
			INNER JOIN staging.vdm1_stage2_locationdetails b
				ON b.address_id = a.address_id

		ORDER BY
			a.customer_id
	);
	
	END;
$vdm1_stage2customers$;

