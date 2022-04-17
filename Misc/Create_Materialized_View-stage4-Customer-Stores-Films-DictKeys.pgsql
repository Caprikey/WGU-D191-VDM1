CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.vdm1_mview_store_details AS (
	SELECT
		  a.store_id
		, b.phone
		, b.address
		, b.address2
		, b.district
		, c.city_id
		, c.city
		, d.country_id
		, d.country
		, b.postal_code
	FROM
		public.store a
			INNER JOIN public.address b
				ON b.address_id = a.address_id
			
			INNER JOIN public.city c
				ON c.city_id = b.city_id
	
			INNER JOIN public.country d
				ON d.country_id = c.country_id
	
	GROUP BY
		a.store_id, b.phone, b.address, b.address2, b.district, c.city_id, c.city, d.country_id, d.country, b.postal_code
	
	ORDER BY
		a.store_id
) WITH NO DATA;


-- #### #### #### #### 

CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.vdm1_mview_film_details AS (
	SELECT 
		  a.film_id
		, a.title
		, b.category_id
		, c.name as genre_name
		, a.release_year
		, d.language_id
		, d.name as lanaguage
		, a.length
		, a.rating
		, a.description
		, e.status as new_release
		, a.rental_duration
		, a.rental_rate
		, a.replacement_cost
	FROM
		public.film a
			
			INNER JOIN public.film_category b
				ON b.film_id = a.film_id
				
				INNER JOIN public.category c
					ON c.category_id = b.category_id
	
			INNER JOIN public.language d
				ON d.language_id = a.language_id
	
			INNER JOIN marketing.new_releases e
				ON e.film_id = a.film_id
) WITH NO DATA;


-- #### #### #### #### 

CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.vdm1_mview_customer_details AS (

	SELECT
		  a.customer_id
		, a.store_id
		, a.first_name
		, a.last_name
		-- , full_name
		, a.email
		, a.create_date
		, AGE(a.create_date)
		, a.activebool
		, b.phone
		, c.city_id
		, c.city
		, d.country_id
		, d.country
	
	FROM
		public.customer a
			
			INNER JOIN public.address b
				ON b.address_id = a.address_id
	
				INNER JOIN public.city c
					ON c.city_id = b.city_id
					
					INNER JOIN public.country d
						ON d.country_id = c.country_id
	
	GROUP BY
		a.customer_id, b.phone, c.city_id, c.city, d.country_id, d.country
	
	ORDER BY
		a.customer_id
	
) WITH NO DATA;


-- #### #### #### #### 

CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.vdm1_mview_dictkey_language AS (
	SELECT 
		  language_id
		, name
	FROM
		public.language
) WITH NO DATA;


-- #### #### #### #### 

CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.vdm1_mview_dictkey_city AS (
	SELECT 
		  city_id
		, city
	FROM
		public.city
) WITH NO DATA;


-- #### #### #### #### 


CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.vdm1_mview_dictkey_country AS (
	SELECT 
		  country_id
		, country
	FROM
		public.country
) WITH NO DATA;


-- #### #### #### #### 

CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.vdm1_mview_dictkey_category AS (
	SELECT 
		  category_id
		, name
	FROM
		public.category
) WITH NO DATA;


-- #### #### #### #### 

CREATE MATERIALIZED VIEW IF NOT EXISTS marketing.vdm1_mview_dictkey_language AS (
	SELECT 
		  language_id
		, name
	FROM
		public.language
) WITH NO DATA;

-- #### #### #### #### 


