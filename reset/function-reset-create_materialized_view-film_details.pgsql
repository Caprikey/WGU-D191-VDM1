CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_create_mview_film_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_reset_create_materialized_view_film_details$
	
	BEGIN 
		
		CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.film_details AS (

			SELECT

				  a.film_id
				, a.title
				, b.category_id
				, a.release_year
				, c.name
				, vdm1_data.f_transform_filmlength_int2vchar(a.length) as film_legnth
				, a.rating
				, a.description
				, a.rental_duration
				, a.rental_rate
				, a.replacement_cost

			FROM 
                public.film AS a

				INNER JOIN 
                    public.film_category AS b
					    ON b.film_id = a.film_id

                INNER JOIN
                    public.language AS c 
                        ON c.language_id = a.language_id
		)
    WITH NO DATA;

	END;
$vdm1_reset_create_materialized_view_film_details$;