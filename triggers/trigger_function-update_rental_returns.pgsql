CREATE OR REPLACE FUNCTION marketing.t_f_update_rental_return()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_update_rental_return$

    BEGIN 
    
    
    -- #### #### #### #### #### #### #### #### 

    UPDATE marketing.customer_watch_history_detailed

    SET
        return_date = NEW.return_date

    WHERE
        rental_id = OLD.rental_id;

    -- #### #### #### #### #### #### #### #### 

    DELETE FROM marketing.failed_returns

    WHERE
        rental_id = OLD.rental_id;


    -- #### #### #### #### #### #### #### #### 

    -- #### #### #### #### #### #### #### #### 

    -- #### #### #### #### 

    RETURN NEW;

    -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_update_rental_return$;