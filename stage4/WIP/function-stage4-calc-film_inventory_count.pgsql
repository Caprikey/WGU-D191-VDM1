CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_update_film_inventory_count()
    RETURNS VOID
    LANGUAGE plpgsql
    AS 
    $vdm1_stage4_calc_update_film_inventory_count$

    BEGIN

        WITH get_inventory_lifecycle AS (
            SELECT 
                inventory_id
                , count(inventory_id) AS product_lifecycle
            FROM staging.vdm1_stage4_rentals
            GROUP BY
                inventory_id
            ORDER BY
                inventory_id        
        )


        UPDATE staging.vdm1_stage4_film_inventory

        SET life_cycle = get_inventory_lifecycle.product_lifecycle

        FROM get_inventory_lifecycle

        WHERE 
            vdm1_stage4_film_inventory.inventory_id = get_inventory_lifecycle.inventory_id;

    END;
$vdm1_stage4_calc_update_film_inventory_count$;