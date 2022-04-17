CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_stores()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2stores$
		
	BEGIN 

		CREATE TABLE staging.vdm1_stage2_stores AS (

			SELECT
				  a.store_id
				, b.phone
				, b.address
				, b.address2
				, b.district
				, b.city_id
				, b.country_id
				, b.postal_code
			FROM staging.vdm1_stage1_store a 
				INNER JOIN staging.vdm1_stage2_locationdetails b
					ON b.address_id = a.address_id

		);
		
	END;
$vdm1_stage2stores$;