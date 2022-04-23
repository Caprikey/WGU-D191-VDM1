CREATE TRIGGER insert_customer_watch_history
    AFTER INSERT
    ON public.rental
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_insert_customer_watch_history();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER update_customer_category
	AFTER INSERT 
    ON marketing.customer_watch_history_detailed
	FOR EACH ROW
	EXECUTE FUNCTION marketing.t_f_update_customer_category();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER new_rental_update_category_popularity
    AFTER INSERT 
    ON marketing.customer_watch_history_detailed
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_category_popularity();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER update_film_category_popularity
	AFTER INSERT 
    ON marketing.customer_watch_history_detailed
	FOR EACH ROW
	EXECUTE FUNCTION marketing.t_f_update_film_category_popularity();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER update_inventory_maintenance
	AFTER INSERT 
	ON marketing.customer_watch_history_detailed
	FOR EACH ROW
	EXECUTE FUNCTION marketing.t_f_update_inventory_maintenance();

-- #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### 


