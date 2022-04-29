CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_mview_location_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_create_materialized_view_location_details$
		
	BEGIN 
	
        CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.location_details AS (
        
            SELECT 

                  a.address_id
                , a.address
                , a.address2
                , a.district
                , b.city
                , c.country
                , a.postal_code
                , vdm1_data.f_transform_customer_phone_e164(a.phone) AS phone

            FROM 
                public.address AS a
                
                
                INNER JOIN 
                    public.city AS b
                        ON b.city_id = a.city_id
                
                
                    INNER JOIN 
                        public.country AS c
                            ON c.country_id = b.country_id
        
        )
        
            WITH NO DATA;

    END;
$vdm1_reset_create_materialized_view_location_details$;