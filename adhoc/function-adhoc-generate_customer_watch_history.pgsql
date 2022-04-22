CREATE OR REPLACE FUNCTION f_get_watch_history_test(
          p_cxid INTEGER DEFAULT NULL
        , p_gid INTEGER DEFAULT NULL
        , p_rentdate TIMESTAMP WITHOUT TIME ZONE DEFAULT NULL
        , p_returndate TIMESTAMP WITHOUT TIME ZONE DEFAULT NULL
    )
    RETURNS TABLE(
          r_customer_id smallint
        , r_rental_history_order_desc bigint
        , r_film_id smallint
        , r_category_id smallint
        , r_rental_date timestamp without time zone
        , r_return_date timestamp without time zone
    )

    LANGUAGE plpgsql
    AS $$

    DECLARE 


	BEGIN
        RETURN QUERY
    
        SELECT 
              a.customer_id
            , ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY rental_date DESC) AS watch_history_order_desc
            , b.film_id
            , c.category_id
            , a.rental_date
            , a.return_date
        FROM rental a 
            INNER JOIN inventory b
                ON b.inventory_id = a.inventory_id
                INNER JOIN film_category c
                    ON c.film_id = b.film_id

        
        WHERE 
            ($1 is NULL or a.customer_id = $1)
                AND 
            ($2 is null or c.category_id = $2)
                AND 
            ($3 is null or date_trunc('day', a.rental_date) >= $3::timestamp)
                AND 
            ($4 is null or date_trunc('day', a.return_date) <= $4::timestamp);
            
            
	END;
$$;