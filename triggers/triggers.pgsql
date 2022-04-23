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


CREATE OR REPLACE TRIGGER t_f_update_customer_reclist_master_nonspecific
    AFTER INSERT
    ON marketing.customer_watch_history_detailed
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_customer_reclist_master_nonspecific();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER t_f_update_customer_reclist_master_specific
    AFTER INSERT
    ON marketing.customer_watch_history_detailed
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_customer_reclist_master_specific();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE update_customer_reclist_master_nonspecific
    AFTER INSERT
    ON marketing.customer_reclist_master_nonspecific
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_customer_reclist_summary_nonspecific

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE update_customer_reclist_master_specific
    AFTER INSERT
    ON marketing.customer_reclist_master_specific
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_customer_reclist_summary_specific

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER t_f_insert_new_customer
    AFTER INSERT
    ON public.customer
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_insert_new_customer();

-- #### #### #### #### #### #### #### #### 
-- ABOVE THIS LINE, TESTED AND WORKING
-- BELOW THIS LINE, NEED TO CREATE AND TEST

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER insert_new_category
    AFTER INSERT
    ON public.category
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_insert_new_category();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER insert_new_film
    AFTER INSERT
    ON public.film
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_insert_new_film();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER insert_new_inventory
    AFTER INSERT
    ON public.inventory
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_insert_new_inventory();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER update_rental_return
    AFTER UPDATE
    ON public.rental
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_failed_returns();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER update_customer_status
    AFTER UPDATE
    ON public.customer
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_customer_status();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER update_customer_rec_custom_preferences
    AFTER UPDATE
    ON marking.customer_rec_custom_preferences
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_update_customer_rec_custom_preferences();

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE TRIGGER insert_customer_rec_custom_preferences
    AFTER INSERT
    ON marking.customer_rec_custom_preferences
    FOR EACH ROW
    EXECUTE FUNCTION marketing.t_f_insert_customer_rec_custom_preferences();

-- #### #### #### #### #### #### #### #### 

