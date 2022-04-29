CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_mview_customer_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_create_materialized_view_customer_details$
	
	BEGIN 
	
        CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.customer_details AS (

            SELECT 
                  a.customer_id
                , a.store_id
                , a.first_name
                , a.last_name
                , vdm1_data.f_transform_customer_full_name(a.first_name, a.last_name) AS full_name
                , a.email
                , (SELECT AGE('2007-04-29', a.create_date)) as account_age
                , CASE 
                    WHEN a.activebool = true 
                        THEN 'ACTIVE'
                    ELSE 
                        'INACTIVE'
                  END AS active_status
                , vdm1_data.f_transform_customer_phone_e164(b.phone) AS phone
                , c.city
                , d.country
            FROM 
                public.customer AS a
                
                    INNER JOIN 
                        public.address AS b
                            ON b.address_id = a.address_id
                    
                        INNER JOIN 
                            public.city AS c
                                ON c.city_id = b.city_id
                        
                            INNER JOIN 
                                public.country AS d
                                    ON d.country_id = c.country_id

            ORDER BY
                a.customer_id
        )
            WITH NO DATA;
	
	END;
$vdm1_reset_create_materialized_view_customer_details$;
