

SELECT
    COUNT(*) AS table_count_customer_public
FROM 
    public.customer;

SELECT
    COUNT(*) AS table_count_address_public
FROM 
    public.address;

SELECT
    COUNT(*) AS table_count_city_public
FROM 
    public.city;

SELECT
    COUNT(*) AS table_count_country_public
FROM 
    public.country;

SELECT
    COUNT(*) AS table_count_store_public
FROM 
    public.store;

SELECT
    COUNT(*) AS table_count_film_public
FROM 
    public.film;

SELECT
    COUNT(*) AS table_count_film_category_public
FROM 
    public.film_category;

SELECT
    COUNT(*) AS table_count_category_public
FROM 
    public.category;

SELECT
    COUNT(*) AS table_count_inventory_public
FROM 
    public.inventory;

SELECT
    COUNT(*) AS table_count_rental_public
FROM 
    public.rental;

SELECT
    COUNT(*) AS table_count_language_public
FROM 
    public.language;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

SELECT
    COUNT(*) AS table_count_customer_vdm1_stage1
FROM 
    staging.vdm1_stage1_customer;

SELECT
    COUNT(*) AS table_count_address_vdm1_stage1
FROM 
    staging.vdm1_stage1_address;

SELECT
    COUNT(*) AS table_count_city_vdm1_stage1
FROM 
    staging.vdm1_stage1_city;

SELECT
    COUNT(*) AS table_count_country_vdm1_stage1
FROM 
    staging.vdm1_stage1_country;

SELECT
    COUNT(*) AS table_count_store_vdm1_stage1
FROM 
    staging.vdm1_stage1_store;

SELECT
    COUNT(*) AS table_count_film_vdm1_stage1
FROM 
    staging.vdm1_stage1_film;

SELECT
    COUNT(*) AS table_count_film_category_vdm1_stage1
FROM 
    staging.vdm1_stage1_film_category;

SELECT
    COUNT(*) AS table_count_category_vdm1_stage1
FROM 
    staging.vdm1_stage1_category;

SELECT
    COUNT(*) AS table_count_inventory_vdm1_stage1
FROM 
    staging.vdm1_stage1_inventory;

SELECT
    COUNT(*) AS table_count_rental_vdm1_stage1
FROM 
    staging.vdm1_stage1_rental;

SELECT
    COUNT(*) AS table_count_language_vdm1_stage1
FROM 
    staging.vdm1_stage1_language;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

SELECT
    COUNT(*) AS table_count_customer_category_vdm1_stage5
FROM
    staging.vdm1_stage5_customer_category;
    
SELECT
    COUNT(*) AS table_count_failed_returns_vdm1_stage5
FROM
    staging.vdm1_stage5_failed_returns;
    
SELECT
    COUNT(*) AS table_count_new_releases_vdm1_stage5
FROM
    staging.vdm1_stage5_new_releases;
    
SELECT
    COUNT(*) AS table_count_inventory_maintenance_vdm1_stage5
FROM
    staging.vdm1_stage5_inventory_maintenance;
    
SELECT
    COUNT(*) AS table_count_inventory_maintenance_summary_vdm1_stage5
FROM
    staging.vdm1_stage5_inventory_maintenance_summary;
    
SELECT
    COUNT(*) AS table_count_customer_watch_history_detailed_vdm1_stage5
FROM
    staging.vdm1_stage5_customer_watch_history_detailed;
    
SELECT
    COUNT(*) AS table_count_customer_reclist_master_nonspecific_vdm1_stage5
FROM
    staging.vdm1_stage5_customer_reclist_master_nonspecific;
    
SELECT
    COUNT(*) AS table_count_customer_reclist_master_specific_vdm1_stage5
FROM
    staging.vdm1_stage5_customer_reclist_master_specific;
    
SELECT
    COUNT(*) AS table_count_customer_reclist_summary_nonspecific_vdm1_stage5
FROM
    staging.vdm1_stage5_customer_reclist_summary_nonspecific;
    
SELECT
    COUNT(*) AS table_count_customer_reclist_summary_specific_vdm1_stage5
FROM
    staging.vdm1_stage5_customer_reclist_summary_specific;
    
SELECT
    COUNT(*) AS table_count_category_popularity_vdm1_stage5
FROM
    staging.vdm1_stage5_category_popularity;
    
SELECT
    COUNT(*) AS table_count_film_category_popularity_vdm1_stage5
FROM
    staging.vdm1_stage5_film_category_popularity;
    
SELECT
    COUNT(*) AS table_count_customer_rec_custom_preferences_vdm1_stage5
FROM
    staging.vdm1_stage5_customer_rec_custom_preferences;


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

SELECT
    COUNT(*) AS table_count_customer_category_marketing
FROM
    marketing.customer_category;
    
SELECT
    COUNT(*) AS table_count_failed_returns_marketing
FROM
    marketing.failed_returns;
    
SELECT
    COUNT(*) AS table_count_new_releases_marketing
FROM
    marketing.new_releases;
    
SELECT
    COUNT(*) AS table_count_inventory_maintenance_marketing
FROM
    marketing.inventory_maintenance;
    
SELECT
    COUNT(*) AS table_count_inventory_maintenance_summary_marketing
FROM
    marketing.inventory_maintenance_summary;
    
SELECT
    COUNT(*) AS table_count_customer_watch_history_detailed_marketing
FROM
    marketing.customer_watch_history_detailed;
    
SELECT
    COUNT(*) AS table_count_customer_reclist_master_nonspecific_marketing
FROM
    marketing.customer_reclist_master_nonspecific;
    
SELECT
    COUNT(*) AS table_count_customer_reclist_master_specific_marketing
FROM
    marketing.customer_reclist_master_specific;
    
SELECT
    COUNT(*) AS table_count_customer_reclist_summary_nonspecific_marketing
FROM
    marketing.customer_reclist_summary_nonspecific;
    
SELECT
    COUNT(*) AS table_count_customer_reclist_summary_specific_marketing
FROM
    marketing.customer_reclist_summary_specific;
    
SELECT
    COUNT(*) AS table_count_category_popularity_marketing
FROM
    marketing.category_popularity;
    
SELECT
    COUNT(*) AS table_count_film_category_popularity_marketing
FROM
    marketing.film_category_popularity;
    
SELECT
    COUNT(*) AS table_count_customer_rec_custom_preferences_marketing
FROM
    marketing.customer_rec_custom_preferences;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

SELECT
    COUNT(*) AS table_count_customer_category_vdm1_data
FROM
    vdm1_data.customer_category;
    
SELECT
    COUNT(*) AS table_count_failed_returns_vdm1_data
FROM
    vdm1_data.failed_returns;
    
SELECT
    COUNT(*) AS table_count_new_releases_vdm1_data
FROM
    vdm1_data.new_releases;
    
SELECT
    COUNT(*) AS table_count_inventory_maintenance_vdm1_data
FROM
    vdm1_data.inventory_maintenance;
    
SELECT
    COUNT(*) AS table_count_inventory_maintenance_summary_vdm1_data
FROM
    vdm1_data.inventory_maintenance_summary;
    
SELECT
    COUNT(*) AS table_count_customer_watch_history_detailed_vdm1_data
FROM
    vdm1_data.customer_watch_history_detailed;
    
SELECT
    COUNT(*) AS table_count_customer_reclist_master_nonspecific_vdm1_data
FROM
    vdm1_data.customer_reclist_master_nonspecific;
    
SELECT
    COUNT(*) AS table_count_customer_reclist_master_specific_vdm1_data
FROM
    vdm1_data.customer_reclist_master_specific;
    
SELECT
    COUNT(*) AS table_count_customer_reclist_summary_nonspecific_vdm1_data
FROM
    vdm1_data.customer_reclist_summary_nonspecific;
    
SELECT
    COUNT(*) AS table_count_customer_reclist_summary_specific_vdm1_data
FROM
    vdm1_data.customer_reclist_summary_specific;
    
SELECT
    COUNT(*) AS table_count_category_popularity_vdm1_data
FROM
    vdm1_data.category_popularity;
    
SELECT
    COUNT(*) AS table_count_film_category_popularity_vdm1_data
FROM
    vdm1_data.film_category_popularity;
    
SELECT
    COUNT(*) AS table_count_customer_rec_custom_preferences_vdm1_data
FROM
    vdm1_data.customer_rec_custom_preferences;

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 