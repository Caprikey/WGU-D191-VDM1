CREATE OR REPLACE FUNCTION marketing.t_f_insert_failed_return()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $trigger_function_insert_failed_return$

    BEGIN 
    
    
        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        INSERT INTO marketing.failed_returns(
              customer_id
            , rental_id 
            , film_id
            , inventory_id
            , store_id
            , rental_date
            , expected_return_date
            , age 
        )

        SELECT
              a.customer_id 
            , a.rental_id
            , a.film_id
            , a.inventory_id
            , b.store_id
            , a.rental_date
            , marketing.calc_expected_return_date(a.film_id::int, a.rental_date::DATE) as expected_return_date
            , (SELECT AGE('2007-01-01', marketing.calc_expected_return_date(a.film_id::int, a.rental_date::DATE))) as age
        FROM 
            marketing.customer_watch_history_detailed AS a
                LEFT JOIN public.customer AS b
                    ON b.customer_id = a.customer_id 

        WHERE
            a.return_date IS NULL 
                AND 
            a.rental_id = NEW.rental_id;
        
        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 

        -- #### #### #### #### #### #### #### #### 

        -- #### #### #### #### 

        RETURN NEW;

    -- #### #### #### #### #### #### #### #### 

    END;
$trigger_function_insert_failed_return$;