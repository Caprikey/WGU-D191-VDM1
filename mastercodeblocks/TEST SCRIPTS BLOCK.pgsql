-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### ####         TEST SCRIPTS START         #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                           



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

/*

DROP SCHEMA IF EXISTS marketing CASCADE;
DROP SCHEMA IF EXISTS staging CASCADE;
DROP SCHEMA IF EXISTS vdm1_data CASCADE;
DROP SCHEMA IF EXISTS vdm1_etl CASCADE;

*/

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

/*
--
--	WITH insert_category AS (
--	
--	    INSERT INTO public.category (
--	        name
--	    ) VALUES (
--	        'Thriller'
--	    )
--	
--	    RETURNING category_id
--	)

WITH get_category AS (
	SELECT 
		category_id 
	FROM 
		public.category 
        
	WHERE name LIKE '%Thriller%'
)
, insert_film AS (
    INSERT INTO public.film (
          title
        , description
        , release_year
        , language_id 
        , rental_duration
        , rental_rate
        , length
        , replacement_cost
        , rating
        , special_features
    ) VALUES (
          'Jason Bourne'
        , 'The CIA''s most dangerous former operative is drawn out of hiding to uncover more explosive truths about his past.'
        , 2016
        , (SELECT language_id FROM public.language WHERE name = 'English')
        , 4
        , 3.99
        , 123
        , 14.99
        , 'PG-13'
        , '{Trailers,Commentaries,"Deleted Scenes","Behind the Scenes"}'
    )  
    RETURNING film_id
)
, get_store_inventory_counts AS (
			SELECT 
	  			(SELECT COUNT(*) FROM public.inventory WHERE store_id = 1) AS store_1_count
				, (SELECT COUNT(*) FROM public.inventory WHERE store_id = 2) AS store_2_count

)
, insert_film_to_inventory AS (

    INSERT INTO public.inventory (
          film_id
		, store_id
    ) VALUES (
        (
            SELECT 
                film_id 
            FROM 
                insert_film
        )
		, 
		(
			SELECT 
				CASE
					WHEN ((SELECT store_1_count FROM get_store_inventory_counts) > (SELECT store_2_count FROM get_store_inventory_counts)) THEN 2
					WHEN ((SELECT store_1_count FROM get_store_inventory_counts) < (SELECT store_2_count FROM get_store_inventory_counts)) THEN 1
					ELSE (SELECT floor(random() * 2 + 1)::int)
				END AS store_id
		) 
		
    )
    
    RETURNING inventory_id, film_id
)

INSERT INTO public.film_category (
      film_id
    , category_id
) VALUES (
        (SELECT film_id FROM insert_film_to_inventory)
       ,(SELECT category_id FROM get_category)
)

RETURNING film_id, category_id, (Select inventory_id FROM insert_film_to_inventory)--, (SELECT store_id FROM insert_film_to_inventory)


-- https://www.postgresql.org/docs/current/dml-returning.html
-- https://www.postgresql.org/docs/current/sql-insert.html
-- https://stackoverflow.com/questions/19167349/postgresql-insert-from-select-returning-id
-- https://stackoverflow.com/questions/4928054/postgresql-wildcard-like-for-any-of-a-list-of-words
-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-random-range/

*/

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

/*
WITH insert_category AS (

    INSERT INTO public.category (
        name
    ) VALUES (
        'Thriller'
    )

    RETURNING category_id
    
)
, insert_film AS (
    
    INSERT INTO public.film (
          title
        , description
        , release_year
        , language_id 
        , rental_duration
        , rental_rate
        , length
        , replacement_cost
        , rating
        , special_features
    ) VALUES (
          'The Silence Of The Lambs'
        , 'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.'
        , 1991
        , (SELECT language_id FROM public.language WHERE name = 'English')
        , 4
        , 4.99
        , 118
        , 14.99
        , 'R'
        , '{Trailers,Commentaries,"Deleted Scenes","Behind the Scenes"}'
    )  
    RETURNING film_id
)
, get_store_inventory_counts AS (
			SELECT 
	  			(SELECT COUNT(*) FROM public.inventory WHERE store_id = 1) AS store_1_count
				, (SELECT COUNT(*) FROM public.inventory WHERE store_id = 2) AS store_2_count

)
, insert_film_to_inventory AS (

    INSERT INTO public.inventory (
          film_id
		, store_id
    ) VALUES (
          (
            SELECT 
                film_id 
            FROM 
                insert_film
          )
		, (
			CASE
				WHEN ((SELECT store_1_count FROM get_store_inventory_counts) > (SELECT store_2_count FROM get_store_inventory_counts)) THEN 2
				WHEN ((SELECT store_1_count FROM get_store_inventory_counts) < (SELECT store_2_count FROM get_store_inventory_counts)) THEN 1
				ELSE (SELECT floor(random() * 2 + 1)::int)
			END
		  )
        )
    
    RETURNING inventory_id, film_id
)

INSERT INTO public.film_category (
      film_id
    , category_id
) VALUES (
        (SELECT film_id FROM insert_film_to_inventory)
       ,(SELECT category_id FROM insert_category)
)

RETURNING film_id, category_id, (Select inventory_id FROM insert_film_to_inventory), (SELECT store_id FROM insert_film_to_inventory)


-- https://www.postgresql.org/docs/current/dml-returning.html
-- https://www.postgresql.org/docs/current/sql-insert.html
-- https://stackoverflow.com/questions/19167349/postgresql-insert-from-select-returning-id
-- https://stackoverflow.com/questions/4928054/postgresql-wildcard-like-for-any-of-a-list-of-words
-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-random-range/

*/
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
/*

WITH get_country_id_usa AS (

    SELECT
        country_id
    FROM
        public.country
    WHERE
        country LIKE ANY (ARRAY['%United States Of America%','%U.S.A%', '%USA%', '%United State%'])
)
, insert_city AS (
	
    INSERT INTO public.city (
		  city
		, country_id
	) VALUES (
		 'Knoxville'
		, (SELECT country_id from get_country_id_usa)
	)
	RETURNING city_id
)
, insert_address AS (
	
    INSERT INTO public.address (
          address
        , address2
        , district
        , city_id
        , postal_code 
        , phone
    ) VALUES (
          '9101 Cedpark Lane'
        , 'Apt C'
        , 'Tennessee'
        , (SELECT city_id FROM insert_city)
        , 37923
        , '18653000201'
    )
	RETURNING address_id
)

INSERT INTO public.customer (
	  store_id
	, first_name
	, last_name
	, email
	, address_id
	, activebool
	, create_date
	, active
)
VALUES (
	  2
	, 'Danty'
	, 'Cook'
	, 'DCoo230@wgu.edu'
	, (SELECT address_id from insert_address)
	, true
	, '2022-05-04'
	, 1
)


RETURNING customer_id, address_id, (SELECT city_id FROM insert_city), (SELECT country_id from get_country_id_usa)


-- https://www.postgresql.org/docs/current/dml-returning.html
-- https://www.postgresql.org/docs/current/sql-insert.html
-- https://stackoverflow.com/questions/19167349/postgresql-insert-from-select-returning-id
-- https://stackoverflow.com/questions/4928054/postgresql-wildcard-like-for-any-of-a-list-of-words

*/
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
/*
WITH insert_category AS (

    INSERT INTO public.category (
        name
    ) VALUES (
        'Crime Drama'
    )

    RETURNING category_id
)
, insert_film AS (
    INSERT INTO public.film (
          title
        , description
        , release_year
        , language_id 
        , rental_duration
        , rental_rate
        , length
        , replacement_cost
        , rating
        , special_features
    ) VALUES (
          'The Godfather'
        , 'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.'
        , 1972
        , (SELECT language_id FROM public.language WHERE name = 'English')
        , 5
        , 5.99
        , 175
        , 19.99
        , 'R'
        , '{Trailers,Commentaries,"Deleted Scenes","Behind the Scenes"}'
    )  
    RETURNING film_id
)
, insert_film_to_inventory AS (

    INSERT INTO public.inventory (
          film_id
		, store_id
    ) VALUES (
        (
            SELECT 
                film_id 
            FROM 
                insert_film
        )
		, 2
    )
    
    RETURNING inventory_id, film_id
)

INSERT INTO public.film_category (
      film_id
    , category_id
) VALUES (
        (SELECT film_id FROM insert_film_to_inventory)
       ,(SELECT category_id FROM insert_category)
)

RETURNING film_id, category_id, (Select inventory_id FROM insert_film_to_inventory)


-- https://www.postgresql.org/docs/current/dml-returning.html
-- https://www.postgresql.org/docs/current/sql-insert.html
-- https://stackoverflow.com/questions/19167349/postgresql-insert-from-select-returning-id
-- https://stackoverflow.com/questions/4928054/postgresql-wildcard-like-for-any-of-a-list-of-words

*/
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

/*

INSERT INTO public.film (
	  title
	, description
	, release_year
	, language_id
	, rental_duration
	, rental_rate
	, length
	, replacement_cost
	, rating
	, special_features
)
VALUES (
	  'Dune'
	, 'A noble family becomes embroiled in a war for control over the galaxys most valuable asset while its heir becomes troubled by visions of a dark future.'
	, 2021
	, 1
	, 5
	, 4.99
	, 155
	, 19.99
	, 'PG-13'
	, '{Trailers,Commentaries,"Deleted Scenes","Behind the Scenes"}'
)

*/

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####






/*

INSERT INTO public.rental (
        
      rental_date
    , inventory_id
    , customer_id
    , return_date
    , staff_id
    
) VALUES (
        
      '2007-02-05'
    , 4603
    , 600
    , '2007-02-07'
    , (SELECT floor(random() * (SELECT COUNT(*) FROM public.staff) + 1)::int)

)

*/

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

/*

	INSERT INTO public.rental (
		
		  rental_date
		, inventory_id
		, customer_id
		, return_date
		, staff_id
		
	) VALUES (
		 

		  '2007-01-01'
		, (SELECT floor(random() * (SELECT COUNT(*) FROM public.inventory) + 1)::int)
		, (SELECT floor(random() * (SELECT COUNT(*) FROM public.customer) + 1)::int)
		, '2007-01-01'
		, (SELECT floor(random() * (SELECT COUNT(*) FROM public.staff) + 1)::int)
	
	)


*/

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

/*
with get_store_inventory_counts AS (
			SELECT 
	  			(SELECT COUNT(*) FROM public.inventory WHERE store_id = 1) AS store_1_count
				, (SELECT COUNT(*) FROM public.inventory WHERE store_id = 2) AS store_2_count

)

INSERT INTO public.inventory (
	  film_id
	, store_id
) VALUES (
	  1001
	, (
		CASE
			WHEN ((SELECT store_1_count FROM get_store_inventory_counts) > (SELECT store_2_count FROM get_store_inventory_counts)) THEN 2
			WHEN ((SELECT store_1_count FROM get_store_inventory_counts) < (SELECT store_2_count FROM get_store_inventory_counts)) THEN 1
			ELSE (SELECT floor(random() * 2 + 1)::int)
		END
	  )
)

*/
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

/*

SELECT * FROM pg_locks pl LEFT JOIN pg_stat_activity psa
    ON pl.pid = psa.pid;

*/
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

/*

select tgrelid::regclass, tgname from pg_trigger

*/
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  


    /*

    WITH existential_table_check AS (
        SELECT EXISTS (
            SELECT 
                table_name 
            FROM 
                information_schema.tables 
            WHERE
                table_schema = 'vdm1_data'
                    AND
                table_name = 'dictkey_film_details'
            ) AS existence
        )
                
    SELECT existence from existential_table_check

    */

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

    /*

		SELECT 
			CASE WHEN (SELECT EXISTS (SELECT table_name FROM information_schema.tables WHERE table_schema = 'vdm1_data' AND table_name = 'dictkey_film_details') AS existence ) = false then 'life'
			ELSE 'death'
			END
			
    */

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

    /*

    WITH check_existence AS (
            SELECT EXISTS (
                SELECT 
                    table_name 
                FROM 
                    information_schema.tables 
                WHERE 
                    table_schema = 'vdm1_data' 
                        AND 
                    table_name = 'dictkey_film_details' 
                ) AS existence
            ), existence_state AS (
                SELECT 
                    existence
                INTO 
                    v_existence
                FROM 
                    check_existence
            )
            
            SELECT 
                CASE 
                    WHEN (SELECT EXISTS (SELECT table_name FROM information_schema.tables WHERE table_schema = 'vdm1_data' AND table_name = 'dictkey_film_details') AS existence) = true) 
                        THEN v_existence := 'vdm1_data.dictkey_film_details'
                    ELSE v_existence := 'public.film'
                END

    */

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

    /*



INSERT INTO vdm1_data.customer_rec_custom_preferences(
	  customer_id
	, category_id
	, customer_rec_custom_order
) VALUES
	  (599, 1, 9)
	, (599, 2, 13)
	, (599, 3, 6)
	, (599, 4, 2)
	, (599, 5, 16)
	, (599, 6, 8)
	, (599, 7, 3)
	, (599, 8, 1)
	, (599, 9, 11)
	, (599, 10, 4)
	, (599, 11, 15)
	, (599, 12, 5)
	, (599, 13, 12)
	, (599, 14, 7)
	, (599, 15, 10)
	, (599, 16, 14)

    */

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

    /*

DELETE FROM vdm1_data.customer_rec_custom_preferences
	WHERE customer_id = 599

    
    */

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

    /*

SELECT
	COUNT (DISTINCT customer_id)=COUNT(*) AS equal_ids
FROM
	vdm1_data.customer_details;
	
SELECT
	COUNT (DISTINCT rental_id)=COUNT(*) AS equal_ids
FROM
	vdm1_data.customer_watch_history_detailed;


    */

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  

    /*

SELECT
	CASE
		WHEN 
			(
				COUNT(
					DISTINCT
						(customer_id, rental_id, film_id)
				)=COUNT(*)
			) is true THEN 'passed'
			ELSE 'failed'
		END as unique_check
FROM
	vdm1_data.customer_watch_history_detailed;


SELECT
	COUNT (DISTINCT customer_id)=COUNT(*) AS equal_ids
FROM
	vdm1_data.customer_details;
	
SELECT
	COUNT (DISTINCT rental_id)=COUNT(*) AS equal_ids
FROM
	vdm1_data.customer_watch_history_detailed;


-- #### #### #### #### #### #### #### #### 

SELECT
    SUM(
        CASE
            WHEN customer_id IS NULL -- OR customer_id IN ('')
                THEN 1
            ELSE 0
        END
    )::FLOAT/COUNT(*) AS missing_watch_history
	
FROM
    vdm1_data.customer_watch_history_detailed;

SELECT
    SUM(
        CASE
            WHEN email IS NULL OR email IN ('')
                THEN 1
            ELSE 0
        END
    )::FLOAT/COUNT(*) AS missing_customer_email
	
FROM
    vdm1_data.customer_details;


-- #### 

SELECT 
    table_name
FROM 
    information_schema.tables
WHERE 
    table_type='BASE TABLE'
        AND 
    table_schema='staging'
        AND 
    table_name LIKE '%dictkey%';


SELECT 
   table_name, 
   column_name, 
   data_type 
FROM 
   information_schema.columns
WHERE 
   table_name = 'city';



-- #### #### #### #### #### #### #### #### 

WITH get_table_names_full AS (
	SELECT 
	  DISTINCT table_name
   -- , column_name
   -- , data_type 
FROM 
   information_schema.columns
WHERE 
--    table_type = 'BASE TABLE'
--        AND 
    table_schema='staging9'
        AND 
    (
		table_name LIKE '%dictkey%'
			AND
	 	table_name NOT LIKE '%details%'
	 )
-- 	 	AND
-- 	column_name LIKE '%id%'
ORDER BY
	table_name
)
, extract_table_name_identifier AS (
	
	SELECT
		SUBSTRING(table_name, (POSITION('dictkey_' IN table_name)+8), LENGTH(table_name)) AS table_name
	FROM
		get_table_names_full
)
, build_tables AS (
	SELECT
		*
	FROM 
		extract_table_name_identifier
)
SELECT * FROM build_tables



-- #### #### #### #### #### #### #### #### 



WITH get_public_count_customer AS (
	
	SELECT
		COUNT(*) AS source_count_customer
	FROM
		public.customer

)
, get_staging9_count_customer_details AS (

	SELECT
		COUNT(*) AS staging_count_customer
	FROM
		staging9.vdm1_stage5_dictkey_customer_details
), combined AS (
	(SELECT 'public', source_count_customer from get_public_count_customer)
		UNION ALL
	(SELECT 'staging9', staging_count_customer FROM get_staging9_count_customer_details)
)
SELECT 
	CASE
		WHEN (source_count_customer != 0)
			THEN 'ERROR NOT EQUAL'
		ELSE
			'EQUAL'
	END
FROM combined 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 



WITH get_table_names_full AS (
	SELECT 
	  DISTINCT table_name :: text
   -- , column_name
   -- , data_type 
FROM 
   information_schema.columns
WHERE 
    table_type = 'BASE TABLE'
        AND 
    table_schema='public'
ORDER BY
	table_name
)
, generate_schema_table_string AS (

	SELECT
		CONCAT('public.' || table_name) AS schema_table
	FROM 
		get_table_names_full
)

-- SELECT * FROM get_table_names_full
SELECT 
    COUNT(*)
FROM (
    SELECT 
        schema_table
    FROM
        generate_schema_table_string
    )


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


    create function mean(arr variadic numeric[])
  returns numeric
  immutable
  language plpgsql
as $body$
declare
  n int not null := 0;
  tot numeric := 0;
  v numeric;
begin
  foreach v in array arr loop
    continue when v is null;
    tot := tot + v;
    n := n + 1;
  end loop;
  return
    case n
      when 0 then null
      else        tot/n::numeric
    end;
end;
$body$;

    */

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####  



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### ####          TEST SCRIPTS END          #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                           
