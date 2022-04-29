
CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_mview_store_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_create_materialized_view_store_details$
		
	BEGIN 

		CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.store_details AS (

			SELECT
				  a.store_id
                , b.address_id
                , b.address
                , b.address2
                , b.district
                , c.city
                , d.country
                , b.postal_code
                , vdm1_data.f_transform_customer_phone_e164(b.phone) AS phone

            FROM 
                public.store AS a
                
                
                INNER JOIN 
                    public.address AS b
                        ON b.address_id = a.address_id
                
                
                    INNER JOIN 
                        public.city AS c
                            ON c.city_id = b.city_id

					INNER JOIN
						public.country AS d 
							ON d.country_id = c.country_id


		)
            WITH NO DATA;
		
	END;
$vdm1_reset_create_materialized_view_store_details$;
