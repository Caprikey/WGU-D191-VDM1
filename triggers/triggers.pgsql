CREATE OR REPLACE TRIGGER new_rental_update_inventory
    AFTER INSERT ON rental
    FOR EACH ROW
    EXECUTE FUNCTION t_f_update_inventory_maintenance();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER new_rental_update_film_category_popularity
    AFTER INSERT ON rental
    FOR EACH ROW
    EXECUTE FUNCTION t_f_update_film_category_popularity();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER new_rental_update_category_popularity
    AFTER INSERT ON rental
    FOR EACH ROW
    EXECUTE FUNCTION t_f_update_category_popularity();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER new_rental_update_customer_category
    AFTER INSERT ON rental
    FOR EACH ROW
    EXECUTE FUNCTION t_f_update_customer_category();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER new_rental_insert_customer_watch_history
    AFTER INSERT ON rental
    FOR EACH ROW
    EXECUTE FUNCTION t_f_update_customer_watch_history();


-- #### #### #### #### #### #### #### #### 
