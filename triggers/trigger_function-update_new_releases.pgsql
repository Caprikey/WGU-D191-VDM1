CREATE OR REPLACE FUNCTION marketing.t_f_update_new_release()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_update_new_releases$

    BEGIN 
    
    
    -- #### #### #### #### #### #### #### #### 

    UPDATE marketing.film_category_popularity

    SET
        new_release = false

    WHERE
        film_id = OLD.film_id;

    -- #### #### #### #### #### #### #### #### 

    DELETE FROM marketing.new_releases

    WHERE
        film_id = OLD.film_id;


    -- #### #### #### #### #### #### #### #### 

    -- #### #### #### #### #### #### #### #### 

    -- #### #### #### #### 

    RETURN NEW;

    -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_update_new_releases$;