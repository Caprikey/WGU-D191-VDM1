-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### ####         TEST SCRIPTS START         #### #### #### #### #### #### #### #### #### #### #### #### ####      
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
          'The Silience Of The Lambs'
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
		, 
		(
			CASE
				WHEN ((SELECT store_1_count FROM get_store_inventory_counts) > (SELECT store_2_count FROM get_store_inventory_counts)) THEN 2
				WHEN ((SELECT store_1_count FROM get_store_inventory_counts) < (SELECT store_2_count FROM get_store_inventory_counts)) THEN 1
				ELSE (SELECT floor(random() * 2 + 1)::int)
			END
		)
		
		
		1
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



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### ####          TEST SCRIPTS END          #### #### #### #### #### #### #### #### #### #### #### #### ####      
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####                           
