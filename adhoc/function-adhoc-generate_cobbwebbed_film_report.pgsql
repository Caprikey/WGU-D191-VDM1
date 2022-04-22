CREATE OR REPLACE FUNCTION f_adhoc_generate_cobbwebbed_film_report()
    RETURNS TABLE(
        film_id INTEGER
    )
    LANGUAGE plpgsql
    AS $function_adhoc_generate_cobbwebbed_film_report$

    BEGIN

        SELECT
            a.film_id

        FROM 
            film a
        
        WHERE 
            NOT EXISTS (
                Select 
                    film_id 
                FROM 
                    inventory 
                    
                WHERE
                    film_id = a.film_id
            );

    END;
$function_adhoc_generate_cobbwebbed_film_report$;


-- REFERENCE LINKS:
-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-exists/
