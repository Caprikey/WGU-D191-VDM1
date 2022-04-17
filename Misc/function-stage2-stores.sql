CREATE OR REPLACE FUNCTION staging.f_stage2_stores()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $stage2stores$
		
	BEGIN 

		CREATE TABLE staging.stage2_stores AS (

			SELECT
				  a.store_id
				, b.phone
				, b.address
				, b.address2
				, b.district
				, b.city_id
				, b.country_id
				, b.postal_code
			FROM staging.stage1_store a 
				INNER JOIN staging.stage2_locationdetails b
					ON b.address_id = a.address_id

		);
		
	END;
$stage2stores$;