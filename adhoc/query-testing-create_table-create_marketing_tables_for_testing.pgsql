-- CREATE TABLE marketing.customer_watch_history_detailed AS (

-- 	SELECT
-- 		  customer_id
-- 		, rental_id
-- 		, inventory_id
-- 		, film_id
-- 		, category_id
-- 		, rental_date
-- 		, return_date
-- 		, customer_watch_history_desc_order
-- 	FROM staging.vdm1_stage5_customer_watch_history_details
-- )
CREATE TABLE marketing.customer_category AS (

	SELECT
		*
	FROM staging.vdm1_stage5_customer_category
);

CREATE TABLE marketing.customer_rec_custom_preferences AS (

	SELECT
		*
	FROM staging.vdm1_stage5_customer_rec_custom_preferences
);

CREATE TABLE marketing.category_popularity AS (

	SELECT
		*
	FROM staging.vdm1_stage5_category_popularity
);
CREATE TABLE marketing.film_category_popularity AS (

	SELECT
		*
	FROM staging.vdm1_stage5_film_category_popularity
);

CREATE TABLE marketing.inventory_maintenance AS (

	SELECT
		*
	FROM staging.vdm1_stage5_inventory_maintenance
);
CREATE TABLE marketing.customer_reclist_master_specific AS (

	SELECT
		*
	FROM staging.vdm1_stage5_customer_reclist_master_specific
);
CREATE TABLE marketing.customer_reclist_master_nonspecific AS (

	SELECT
		*
	FROM staging.vdm1_stage5_customer_reclist_master_nonspecific
);
CREATE TABLE marketing.failed_returns AS (

	SELECT
		*
	FROM staging.vdm1_stage5_failed_returns
);
CREATE TABLE marketing.new_releases AS (

	SELECT
		*
	FROM staging.vdm1_stage5_new_releases
);