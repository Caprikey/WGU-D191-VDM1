CREATE OR REPLACE FUNCTION f_generate_customer_reclist(
	  p_customer_id INT
	, p_category_id INT DEFAULT NULL
    )
    RETURNS TABLE (


    )
    LANGUAGE plpgsql
    AS $adhoc_function_generate_customer_reclist$

    DECLARE 

        vi_cxid INT;
        vi_catid INT;

    BEGIN 

            vi_cxid := $1;

            WITH get_cx_watch_history AS (
                SELECT
                    customer_id
                    , film_id
                    , category_id
                FROM 
                    staging.vdm1_stage5_customer_watch_history_details

                WHERE customer_id = vi_cxid
                
                ORDER BY
                    customer_id, film_id
            )
            , customerxfilmcat AS (
                
                SELECT
                    customer_id
                    , film_id
                    , category_id
                FROM 
                    staging.vdm1_stage5_dictkey_film_details
                        CROSS JOIN 
                            staging.vdm1_stage5_dictkey_customer_details

                WHERE customer_id = vi_cxid
                ORDER BY
                    customer_id, film_id
            )
            , historyfromrecommended AS (
                
                (SELECT * FROM customerxfilmcat)
                    EXCEPT
                (SELECT * FROM get_cx_watch_history)
                
            )
            , filmdetailsxfilmcat AS (
                SELECT
                      a.customer_id
                    , a.film_id
                    , a.category_id
                    , b.total_rentals
                    , b.film_category_rank
                FROM
                    historyfromrecommended a
                        INNER JOIN
                            staging.vdm1_stage5_film_category b
                                ON b.film_id = a.film_id
                
                WHERE 
                    a.film_id = b.film_id
                
                ORDER BY
                    customer_id, category_id, film_category_rank ASC
            )
            , cxrecxcxcat AS (

                SELECT
                      a.customer_id
                    , a.film_id
                    , a.category_id
                    , a.total_rentals
                    , a.film_category_rank
                    , b.category_rank_row_number
                FROM 
                    filmdetailsxfilmcat a
                        INNER JOIN 
                            staging.vdm1_stage5_customer_category b
                                ON b.customer_id = a.customer_id
                
                WHERE 
                    b.customer_id = a.customer_id
                        AND
                    b.category_id = a.category_id
                
                ORDER BY
                    customer_id, category_rank_row_number, film_category_rank
            )
            , cxrecrownumber AS (

                SELECT
                    *
                    , ROW_NUMBER() OVER (PARTITION BY customer_id, category_id ORDER BY film_category_rank) as rec_order
                FROM cxrecxcxcat
            )
            , limitcxreclist AS (

                SELECT 
                    *
                FROM 
                    cxrecrownumber
                
                WHERE 
                    ( 
                        category_rank_row_number <= 4
                            AND
                        rec_order <= 4
                    )
                        OR
                    (
                        (
                            category_rank_row_number > 4
                                AND
                            category_rank_row_number <= 8
                        )
                            AND
                        rec_order <= 3
                    )
                        OR
                    (
                        (
                            category_rank_row_number > 8
                                AND
                            category_rank_row_number <= 12
                        )
                            AND
                        rec_order <= 2
                    )
                        OR
                    (
                        (
                            category_rank_row_number > 12
                                AND
                            category_rank_row_number <= 17
                        )
                            AND
                        rec_order < 2
                    )
            )



            SELECT 
                  a.customer_id
                , staging.f_vdm1_stage4_transform_customer_full_name(b.first_name, b.last_name) as customer_name
                , b.email
                , a.category_rank_row_number
                , a.rec_order
                , a.film_id
                , c.title
                , d.name
                --, ARRAY_AGG(a.film_id, c.title, a.category_id, c.release_year, e.name, staging.f_vdm1_stage4_transform_filmlength_int2vchar(c.length), c.rating, c.description)
            FROM limitcxreclist a
                LEFT JOIN 
                    staging.vdm1_stage5_dictkey_customer_details b
                        ON b.customer_id = a.customer_id
                LEFT JOIN
                    staging.vdm1_stage5_dictkey_film_details c
                        ON c.film_id = a.film_id
                LEFT JOIN
                    staging.vdm1_stage5_dictkey_category d
                        ON d.category_id = a.category_id
                LEFT JOIN
                    staging.vdm1_stage5_dictkey_language e
                        ON e.language_id = c.language_id
                        
                ORDER BY
                    a.customer_id, a.category_rank_row_number, a.rec_order;

        RETURN QUERY;

    END;
$adhoc_function_generate_customer_reclist$;