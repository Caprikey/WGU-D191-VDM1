CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_locationdetails()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2locdet$
		
	BEGIN 
	
	CREATE TABLE staging.vdm1_stage2_locationdetails AS (
	
		SELECT 
			  a.address_id
			, a.address
			, a.address2
			, a.district
			, b.city_id
			, c.country_id
			, a.postal_code
			, a.phone
		FROM staging.vdm1_stage1_address a
			INNER JOIN staging.vdm1_stage1_city b
				ON b.city_id = a.city_id
			INNER JOIN staging.vdm1_stage1_country c
				ON c.country_id = b.country_id
	
	);

END;
$vdm1_stage2locdet$;