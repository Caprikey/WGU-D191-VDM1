CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_dropmviews_marketing_location_details()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_drop_materialized_views_marketing_location_details$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

            -- DROP MATERIALIZED VIEW vdm1_data.customer_details;

            -- DROP MATERIALIZED VIEW vdm1_data.film_details;

            DROP MATERIALIZED VIEW vdm1_data.location_details;

            -- DROP MATERIALIZED VIEW vdm1_data.store_details;


        -- #### #### #### #### #### #### #### #### 





        -- #### #### #### #### #### #### #### #### 

    END;

$vdm1_reset_drop_materialized_views_marketing_location_details$;