CREATE TABLE marketing.unavailable_films AS (
			SELECT
				  a.film_id
			FROM 
				film a
	
			WHERE 
				NOT EXISTS (
					SELECT
						film_id
					FROM
						inventory
					WHERE 
						film_id = a.film_id
				)

)