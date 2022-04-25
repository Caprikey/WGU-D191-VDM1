CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_create_mview_location_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_materialized_view_location_details$
		
	BEGIN 
	
        CREATE MATERIALIZED VIEW marketing.customer_details AS (
        
            SELECT 

                  a.address_id
                , a.address
                , a.address2
                , a.district
                , b.city
                , c.country
                , a.postal_code
                , a.phone

            FROM 
                public.address AS a
                
                
                INNER JOIN 
                    public.city AS b
                        ON b.city_id = a.city_id
                
                
                    INNER JOIN 
                        public.country AS c
                            ON c.country_id = b.country_id
        
        );

    END;
$vdm1_stage5_create_materialized_view_location_details$;