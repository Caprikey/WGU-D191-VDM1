CREATE OR REPLACE FUNCTION staging.f_stage2_locationdetails()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $stage2locdet$
		
	BEGIN 
	
	CREATE TABLE staging.stage2_locationdetails AS (
	
		SELECT 
			  a.address_id
			, a.address
			, a.address2
			, a.district
			, b.city_id
			, c.country_id
			, a.postal_code
			, a.phone
		FROM staging.stage1_address a
			INNER JOIN staging.stage1_city b
				ON b.city_id = a.city_id
			INNER JOIN staging.stage1_country c
				ON c.country_id = b.country_id
	
	);

END;
$stage2locdet$;