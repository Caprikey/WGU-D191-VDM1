CREATE OR REPLACE FUNCTION staging.f_vdm1_stage2_customer_film_category();
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage2_customer_film_cat$

    BEGIN

    CREATE TABLE staging.vdm1_stage2_customer_film_category AS (

        SELECT 
              customer_id
            , film_id 
            , category_id 
        FROM staging.vdm1_stage2_customers
            CROSS JOIN staging.vdm1_stage2_film_category
    
        ORDER BY
            customer_id, film_id

    );

    END;

$vdm1_stage2_customer_film_cat$;