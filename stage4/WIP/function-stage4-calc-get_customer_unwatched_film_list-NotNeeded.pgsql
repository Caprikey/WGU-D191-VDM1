CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_get_cx_unwatched_film_list(
    p_customer_id INT DEFAULT NULL
)
    RETURNS QUERY
    LANGUAGE plpgsql
    AS $$
    DECLARE 

        v_customer_id INTEGER;


    BEGIN 


        WITH cxfilmwatcharray AS (
            SELECT
                customer_id
                , ARRAY_AGG(
                    DISTINCT film_id) AS film_array
            FROM staging.vdm1_stage4_rentals
            WHERE
                customer_id = $1
            GROUP BY
                customer_id
        )

        SELECT 
            film_id 
        FROM staging.vdm1_stage4_films
        WHERE film_id = ANY(
            SELECT 
                UNNEST(film_array) 
            FROM cxfilmwatcharray
            )

        ORDER BY
            film_id

        RETURNS QUERY;
    
    END;
$$;