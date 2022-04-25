CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_create_mview_film_details()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_create_materialized_view_film_details$
	
	BEGIN 
		
		CREATE MATERIALIZED VIEW marketing.film_details AS (

			SELECT

				  a.film_id
				, a.title
				, b.category_id
				, a.release_year
				, c.name
				, vdm1_etl.f_transform_film_length_int2vhar(a.length) as legnth
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
		);

	END;
$vdm1_stage5_create_materialized_view_film_details$;

