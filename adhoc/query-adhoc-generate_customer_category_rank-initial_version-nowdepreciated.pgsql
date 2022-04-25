-- Category Rank Order Revision 

WITH customer_x_category AS (

    SELECT
          customer_id AS cx_id
        , category_id AS cat_id
    FROM
        public.customer
        -- staging.vdm1_stage2_customers
        -- staging.vdm1_stage5_dictkey_customer_details

    CROSS JOIN  
        public.category
        -- staging.vdm1_stage2_category
        -- staging.vdm1_stage5_dictkey_category
    
    ORDER BY
        customer_id, category_id
)

, customerxcategory_count_historical AS (

    SELECT
          customer_id
        , category_id
        , COUNT(category_id) AS historical_count
    FROM
        -- public.rental INNER JOIN inventory USING (inventory_id) INNER JOIN film_category USING (film_id)
        -- staging.vmd1_stage2_rentals
        staging.vdm1_stage5_customer_watch_history_details
    GROUP BY 
        category_id, customer_id
)

, customerxcategory_count_average AS (

        SELECT
          customer_id
        , category_id
        , COUNT(category_id) AS average_count
    FROM
        -- public.rental INNER JOIN inventory USING (inventory_id) INNER JOIN film_category USING (film_id)
        -- staging.vmd1_stage2_rentals
        staging.vdm1_stage5_customer_watch_history_details

    WHERE 
        customer_watch_history_desc_order >= 14

    GROUP BY 
        category_id, customer_id
)

, customerxcategory_count_half_average AS (

        SELECT
          customer_id
        , category_id
        , COUNT(category_id) AS half_average_count
    FROM
        -- public.rental INNER JOIN inventory USING (inventory_id) INNER JOIN film_category USING (film_id)
        -- staging.vmd1_stage2_rentals
        staging.vdm1_stage5_customer_watch_history_details

    WHERE 
        customer_watch_history_desc_order >= 7

    GROUP BY 
        category_id, customer_id
)

, category_popularity_count AS (
    SELECT
          category_id
        , COUNT(category_id) AS category_popularity_count
    FROM
        -- public.rental INNER JOIN inventory USING (inventory_id) INNER JOIN film_category USING (film_id)
        -- staging.vmd1_stage2_rentals
        staging.vdm1_stage5_customer_watch_history_details
    GROUP BY 
        category_id

)

, category_popularity_count_rank AS (

    SELECT
          category_id
        , category_popularity_count
        , ROW_NUMBER() OVER (ORDER BY category_popularity_count DESC) AS category_popularity_rank
    FROM
        category_popularity_count

)

, customerxcategoryljcustomercategorycounts AS (

    SELECT 
          cx_id
        , cat_id
        , CASE 
            WHEN historical_count is null then 0
            ELSE historical_count
          END AS historical_count
        , CASE 
            WHEN average_count is null then 0
            ELSE average_count 
          END AS average_count
        , CASE 
            WHEN half_average_count is null then 0
            ELSE half_average_count
          END AS half_average_count
    FROM 
        customer_x_category a
            LEFT JOIN
                customerxcategory_count_historical b 
                    ON b.customer_id = a.cx_id AND b.category_id = b.cat_id
            LEFT JOIN 
                customerxcategory_count_average c 
                    ON c.customer_id = a.cx_id AND c.category_id = c.cat_id
            LEFT JOIN 
                customerxcategory_count_half_average d 
                    ON d.customer_id = d.cx_id AND d.category_id = d.cat_id
)

, get_customer_configuration AS (

    SELECT
          customer_id
        , category_id
        , customer_custom_order
    FROM 
        staging.vdm1_stage5_customer_custom_config a 
            LEFT JOIN customer_x_category b 
                ON b.cat_id = a.customer_id AND b.cat_id = a.category_id

    WHERE
        customer_id = cx_id and category_id = cat_id

)


, customerxcategoryljcustomercategorycounts_rownumber AS (

    SELECT
          cx_id
        , cat_id
        , historical_count
        , ROW_NUMBER() OVER (PARTITION BY cx_id ORDER BY historical_count DESC, category_popularity_count_rank) AS historical_preference_order
        , average_count
        , ROW_NUMBER() OVER (PARTITION BY cx_id ORDER BY average_count DESC, category_popularity_rank) AS average_preference_order
        , half_average_count
        , ROW_NUBMER() OVER (PARTITION BY cx_id ORDER BY half_average_count DESC), category_popularity_rank as half_average_preference_order
    FROM 
        customerxcategoryljcustomercategorycounts 
            LEFT JOIN category_popularity_count
                ON category_id = cat_id

)

, customerxcategoryljcustomercategorycountsorderljcustomercustom AS (

    SELECT 
          cx_id
        , cat_id
        , historical_count
        , historical_preference_order
        , average_count
        , average_preference_order
        , half_average_count
        , half_average_preference_order
        , CASE 
            WHEN customer_custom_order is null then historical_preference_order
            ELSE customer_custom_order
        END AS customer_custom_order
    FROM 
        customerxcategoryljcustomercategorycounts_rownumber a 
            LEFT JOIN get_customer_configuration
                ON b.customer_id = a.cx_id AND b.category_id = a.cat_id

)

SELECT
      cx_id
    , cat_id
    , historical_count
    , historical_preference_order
    , average_count
    , average_preference_order
    , half_average_count
    , half_average_preference_order
    , customer_custom_order
FROM 
    customerxcategoryljcustomercategorycountsorderljcustomercustom