CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_country_rental_count()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage4_calc_update_country_rental_count$

    BEGIN 

    WITH calc_country_rentals AS (

        SELECT 
            b.country
            , a.country_id
            , COUNT(a.country_id) AS total_rentals
        FROM
            staging.vdm1_stage4_customer_watch_history_details a
                INNER JOIN staging.vdm1_stage4_dictkey_country b
                    ON b.country_id = a.country_id
        GROUP BY 
            b.country, a.country_id

        ORDER BY 
	        total_rentals DESC
    )

    UPDATE staging.vdm1_stage4_country_count_init a

    SET 
        total_rentals = calc_country_rentals.total_rentals

    FROM calc_country_rentals

    WHERE
        a.country_id = calc_country_rentals.country_id;

    END;
$vdm1_stage4_calc_update_country_rental_count$;