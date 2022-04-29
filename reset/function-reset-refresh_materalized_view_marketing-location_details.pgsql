
CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_reset_refresh_mview_marketing_location_details()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_reset_refresh_materialized_views_marketing_location_details$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

		-- REFRESH MATERIALIZED VIEW marketing.customer_details;  

		-- REFRESH MATERIALIZED VIEW marketing.film_details;  

		REFRESH MATERIALIZED VIEW marketing.location_details;  

		-- REFRESH MATERIALIZED VIEW marketing.store_details;    

		-- REFRESH MATERIALIZED VIEW marketing.category;  

		-- REFRESH MATERIALIZED VIEW marketing.city;  

		-- REFRESH MATERIALIZED VIEW marketing.country;   

		-- REFRESH MATERIALIZED VIEW marketing.language;  
    
        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_reset_refresh_materialized_views_marketing_location_details$;