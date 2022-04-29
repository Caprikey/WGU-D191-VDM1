CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_drop_mviews_vdm1_data();
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_drop_materialized_views_vdm1_data$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

            DROP MATERIALIZED VIEW vdm1_data.customer_details;

            DROP MATERIALIZED VIEW vdm1_data.film_details;

            DROP MATERIALIZED VIEW vdm1_data.location_details;

            DROP MATERIALIZED VIEW vdm1_data.store_details;


        -- #### #### #### #### #### #### #### #### 




        -- #### #### #### #### #### #### #### #### 

    END;

$vdm1_reset_drop_materialized_views_vdm1_data$;