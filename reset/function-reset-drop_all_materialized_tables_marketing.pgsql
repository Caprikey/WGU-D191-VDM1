CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_drop_all_mviews_marketing()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_drop_all_materialized_views_marketing$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

            DROP MATERIALIZED VIEW vdm1_data.customer_details;

            DROP MATERIALIZED VIEW vdm1_data.film_details;

            DROP MATERIALIZED VIEW vdm1_data.location_details;

            DROP MATERIALIZED VIEW vdm1_data.store_details;


        -- #### #### #### #### #### #### #### #### 





        -- #### #### #### #### #### #### #### #### 

    END;

$vdm1_reset_drop_all_materialized_views_marketing$;
