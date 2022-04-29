CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_drop_mviews_vdm1_etl();
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_drop_materialized_views_vdm1_etl$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

            DROP MATERIALIZED VIEW vdm1_etl.customer_details;

            DROP MATERIALIZED VIEW vdm1_etl.film_details;

            DROP MATERIALIZED VIEW vdm1_etl.location_details;

            DROP MATERIALIZED VIEW vdm1_etl.store_details;


        -- #### #### #### #### #### #### #### #### 




        -- #### #### #### #### #### #### #### #### 

    END;

$vdm1_reset_drop_materialized_views_vdm1_etl$;