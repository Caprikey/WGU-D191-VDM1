CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_drop_mviews_marketing();
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_drop_materialized_views_marketing$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

            DROP MATERIALIZED VIEW marketing.customer_details;

            DROP MATERIALIZED VIEW marketing.film_details;

            DROP MATERIALIZED VIEW marketing.location_details;

            DROP MATERIALIZED VIEW marketing.store_details;


        -- #### #### #### #### #### #### #### #### 




        -- #### #### #### #### #### #### #### #### 

    END;

$vdm1_reset_drop_materialized_views_marketing$;