CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_create_mview_store_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_materialized_view_store_details$
		
	BEGIN 

		CREATE MATERIALIZED VIEW marketing.store_details AS (

			SELECT
				  a.store_id
                  b.address_id
                , b.address
                , b.address2
                , b.district
                , c.city
                , d.country
                , b.postal_code
                , b.phone

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


		);
		
	END;
$vdm1_stage5_create_materialized_view_store_details$;