CREATE OR REPLACE FUNCTION stating.f_vdm1_stage5_create_mview_customer_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_materialized_view_customer_details$
	
	BEGIN 
	
        CREATE MATERIALIZED VIEW marketing.customer_details AS (

            SELECT 
                a.customer_id
                , a.store_id
                , a.first_name
                , a.last_name
                , vdm1_etl.f_transform_customer_full_name(a.first_name, a.last_name) AS full_name
                , a.email
                , a.create_date
                , a.activebool
                , b.phone
                , c.city
                , d.country
            FROM 
                public.customer AS a
                
                    INNER JOIN 
                        public.address AS b
                            ON b.address_id = a.address_id
                    
                        INNER JOIN 
                            public.city AS c
                                ON c.city_id = b.address_id
                        
                            INNER JOIN 
                                public.country AS d
                                    ON d.country_id = c.country_id

            ORDER BY
                a.customer_id
        );
	
	END;
$vdm1_stage5_create_materialized_view_customer_details$;

