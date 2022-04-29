CREATE OR REPLACE FUNCTION vdm1_etl.f_refresh_mview_all_marketing()
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_refresh_materialized_views_all_marketing$

    BEGIN

        -- #### #### #### #### #### #### #### #### 

		REFERESH MATERIALIZED VIEW marketing.customer_details;  

		REFERESH MATERIALIZED VIEW marketing.film_details;  

		REFERESH MATERIALIZED VIEW marketing.location_details;  

		REFERESH MATERIALIZED VIEW marketing.store_details ;    

		REFERESH MATERIALIZED VIEW marketing.category;  

		REFERESH MATERIALIZED VIEW marketing.city;  

		REFERESH MATERIALIZED VIEW marketing.country;   

		REFERESH MATERIALIZED VIEW marketing.language;  
    
        -- #### #### #### #### #### #### #### #### 

    END;
$vdm1_refresh_materialized_views_all_marketing$;