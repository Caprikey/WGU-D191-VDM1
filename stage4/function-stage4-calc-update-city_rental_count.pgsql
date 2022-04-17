CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_city_rental_count()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage4_calc_update_city_rental_count$

    BEGIN 


    WITH calc_city_rentals AS (
        
        SELECT 
              b.city
            , a.city_id
            , COUNT(a.city_id) AS total_rentals
        FROM
            staging.vdm1_stage4_customer_watch_history_details a
                INNER JOIN staging.vdm1_stage4_dictkey_city b
                    ON b.city_id = a.city_id

        GROUP BY 
            b.city, a.city_id

        ORDER BY 
            total_rentals DESC
    )

    UPDATE staging.vdm1_stage4_city_count_init a

    SET 
        total_rentals = calc_city_rentals.total_rentals

    FROM calc_city_rentals

    WHERE
        a.city_id = calc_city_rentals.city_id;

    END;
$vdm1_stage4_calc_update_city_rental_count$;