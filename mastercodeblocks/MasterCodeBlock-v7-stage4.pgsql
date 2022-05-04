
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####    STAGE 4 BEGIN    #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #TODO STAGE 4 BEGIN


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- TABLE OF CONTENTS


--     #### #### #### ####
--         STAGE 4 BEGIN
--     #### #### #### ####

--             STORED PROCEDURES

--                  1. vdm1_etl.vdm1_stage4();
--                  2. vdm1_etl.vdm1_stage4a();
--                  3. vdm1_etl.vdm1_stage4b();
--                  4. vdm1_etl.vdm1_stage4c();
--                  5. vdm1_etl.vdm1_stage4c1();
--                  6. vdm1_etl.vdm1_stage4c1a();
--                  7. vdm1_etl.vdm1_stage4c1b();
--                  8. vdm1_etl.vdm1_stage4c2();
--                  9. vdm1_etl.vdm1_stage4c2a();
--                 10. vdm1_etl.vdm1_stage4c2b();
--                 11. vdm1_etl.vdm1_stage4c3();

--             FUNCTIONS

--                  1. vdm1_etl.f_vdm1_stage4_calc_update_category_popularity_count()
--                  2. vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_count()
--                  3. vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_row_number()
--                  4. vdm1_etl.f_vdm1_stage4_calc_update_film_category_popularity_row_number()
--                  5. vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_count()
--                  6. vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
--                  7. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_count_null_corrections()
--                  8. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_historical_count()
--                  9. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_average_count()
--                 10. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_halfaverage_count()
--                 11. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_historical()
--                 12. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_average()
--                 13. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage()
--                 14. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default()
--                 15. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order()
--                 16. vdm1_etl.f_vdm1_stage4_calc_update_customer_watch_history_row_number()
--                 17. vdm1_etl.f_vdm1_stage4_calc_insert_failed_returns_v2()
--                 18. vdm1_etl.f_vdm1_stage4_calc_insert_new_releases_v2()
--                 19. vdm1_etl.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat
--                 20. vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific()
--                 21. vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn()
--                 22. vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();
--                 23. vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();
--                 24. vdm1_etl.f_vdm1_stage4_transform_customer_full_name(p_first_name VARCHAR, p_last_name VARCHAR)
--                 25. vdm1_etl.f_vdm1_stage4_transform_filmlength_int2vchar(p_length INTEGER)
--                 26. vdm1_etl.f_vdm1_stage4_calc_expected_return_date(p_film_id INT, p_rental_date DATE)
--                 27. vdm1_etl.f_vdm1_stage4_transform_customer_phone_e164();
--                 28. vdm1_etl.f_vdm1_stage4_cleanup()


--     #### #### #### ####
--         STAGE 4 END
--     #### #### #### ####


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                     #### #### #### #### #### #### #### #### 
--                     #### ####  STORED PROCEDURES  #### #### 
--                     #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO STAGE 4 - STORED PROCEDURES

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4()
	LANGUAGE plpgsql
	AS $vdm1_stage4run$
	
	BEGIN 
	
    
		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_customer_watch_history_row_number();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_category_popularity_count();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_count();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_count();

		-- PERFORM vdm1_etl.f_vdm1_stage4_create_transform_function();

		-- PERFORM vdm1_etl.f_vdm1_stage4_transform_customer_full_name();

		-- PERFORM vdm1_etl.f_vdm1_stage4_transform_customer_phone_number();

		-- PERFORM vdm1_etl.f_vdm1_stage4_transform_film_length();
        

        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_count_null_corrections();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_historical_count();

    	PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_average_count();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_halfaverage_count();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_flag_inspection();

        
		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat();


		-- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_historical();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_average();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order();


        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_row_number();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_category_popularity_row_number();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_failed_returns_v2();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_new_releases_v2();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();		
		
		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_cleanup();

	END;
$vdm1_stage4run$;

-- #### #### #### #### #### #### #### #### 


CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4a()
	LANGUAGE plpgsql
	AS $vdm1_stage4a_run$

	
	BEGIN 
	
        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_customer_watch_history_row_number();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_category_popularity_count();

        -- #### #### #### #### 
        
        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_count();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_count();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_count_null_corrections();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_historical_count();

    	PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_average_count();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_halfaverage_count();


        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_flag_inspection();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_failed_returns_v2();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_new_releases_v2();

		-- PERFORM vdm1_etl.f_vdm1_stage4_create_transform_function();

		PERFORM vdm1_etl.f_vdm1_stage4_transform_customer_full_name();

		PERFORM vdm1_etl.f_vdm1_stage4_transform_customer_phone_number();

		PERFORM vdm1_etl.f_vdm1_stage4_transform_film_length();
        

	END;
$vdm1_stage4a_run$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4b()
	LANGUAGE plpgsql
	AS $vdm1_stage4b_run$

	
	BEGIN 


 -- #### #### #### ####      

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_historical();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_average();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order();


        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_row_number();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_film_category_popularity_row_number();


    END;
$vdm1_stage4b_run$;

-- #### #### #### #### #### #### #### #### 


CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c()
	LANGUAGE plpgsql
	AS $vdm1_stage4c_run$

	
	BEGIN 
        
        -- #### #### #### #### 


		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();

		-- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_cleanup();


    END;
$vdm1_stage4c_run$;


-- #### #### #### #### #### #### #### #### #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c1()
	LANGUAGE plpgsql
	AS $vdm1_stage4c1_run$

	
	BEGIN 
        
        -- #### #### #### #### 


		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific();

        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn();
        
        -- #### #### #### #### 

    END;
$vdm1_stage4c1_run$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c1a()
	LANGUAGE plpgsql
	AS $vdm1_stage4c1a_run$

	
	BEGIN 
        
        -- #### #### #### #### 


		PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific();
        
        -- #### #### #### #### 

    END;
$vdm1_stage4c1a_run$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c1b()
	LANGUAGE plpgsql
	AS $vdm1_stage4c1b_run$

	
	BEGIN 
        
        -- #### #### #### #### 


        PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn();
        
        -- #### #### #### #### 

    END;
$vdm1_stage4c1b_run$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c2()
	LANGUAGE plpgsql
	AS $vdm1_stage4c2_run$

	
	BEGIN 
        
        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();

        -- #### #### #### #### 

    END;
$vdm1_stage4c2_run$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c2a()
	LANGUAGE plpgsql
	AS $vdm1_stage4c2a_run$

	
	BEGIN 
        
        -- #### #### #### #### 

        PERFORM vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();

        -- #### #### #### #### 

    END;
$vdm1_stage4c2a_run$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c2b()
	LANGUAGE plpgsql
	AS $vdm1_stage4c2b_run$

	
	BEGIN 
        
        -- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();

        -- #### #### #### #### 

    END;
$vdm1_stage4c2b_run$;

-- #### #### #### #### #### #### #### #### 

CREATE OR REPLACE PROCEDURE vdm1_etl.vdm1_stage4c3()
	LANGUAGE plpgsql
	AS $vdm1_stage4c3_run$

	
	BEGIN 
        
        -- #### #### #### #### 

		PERFORM vdm1_etl.f_vdm1_stage4_cleanup();

        -- #### #### #### #### 

    END;
$vdm1_stage4c3_run$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

--                      #### #### #### #### #### #### #### #### 
--                      #### ####      FUNCTIONS      #### #### 
--                      #### #### #### #### #### #### #### #### 

-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #TODO STAGE 4 - FUNCTIONS

-- TABLE OF CONTENTS

--      1. vdm1_etl.f_vdm1_stage4_transform_customer_full_name();
--      2. vdm1_etl.f_vdm1_stage4_transform_customer_phone_number();
--      3. vdm1_etl.f_vdm1_stage4_transform_film_length();
--      4. vdm1_etl.f_vdm1_stage4_calc_update_category_popularity_count()
--      5. vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_count()
--      6. vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_row_number()
--      7. vdm1_etl.f_vdm1_stage4_calc_update_film_category_popularity_row_number()
--      8. vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_count()
--      9. vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
--     10. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_count_null_corrections()
--     11. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_historical_count()
--     12. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_average_count()
--     13. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_halfaverage_count()
--     14. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_historical()
--     15. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_average()
--     16. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage()
--     17. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default()
--     18. vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order()
--     19. vdm1_etl.f_vdm1_stage4_calc_update_customer_watch_history_row_number()
--     20. vdm1_etl.f_vdm1_stage4_calc_insert_failed_returns_v2()
--     21. vdm1_etl.f_vdm1_stage4_calc_insert_new_releases_v2()
--     22. vdm1_etl.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat
--     23. vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific()
--     24. vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn()
--     25. vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default();
--     26. vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn();
--     27. vdm1_etl.f_vdm1_stage4_transform_customer_full_name(p_first_name VARCHAR, p_last_name VARCHAR)
--     28. vdm1_etl.f_vdm1_stage4_transform_filmlength_int2vchar(p_length INTEGER)
--     29. vdm1_etl.f_vdm1_stage4_calc_expected_return_date(p_film_id INT, p_rental_date DATE)
--     30. vdm1_etl.f_vdm1_stage4_transform_customer_phone_e164(p_phone VARCHAR);
--     31. vdm1_etl.f_vdm1_stage4_cleanup()


-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####     1     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_transform_customer_full_name()
	RETURNS VOID 
	LANGUAGE plpgsql
	AS $vdm1_stage4_transform_update_customer_full_name$

	BEGIN

			WITH get_customer_details AS (
			SELECT 
				  customer_id
				, first_name
				, last_name
			FROM 
				staging.vdm1_stage4_customers
		)

	UPDATE staging.vdm1_stage4_customers AS a

	SET customer_full_name = vdm1_data.f_transform_customer_full_name(b.first_name :: VARCHAR, b.last_name :: VARCHAR)

	FROM get_customer_details AS b

	WHERE
		a.customer_id = b.customer_id;

	END;
$vdm1_stage4_transform_update_customer_full_name$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     2     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_transform_customer_phone_number()
	RETURNS VOID 
	LANGUAGE plpgsql
	AS $vdm1_stage4_transform_update_customer_phone_number$

	BEGIN

			WITH get_customer_details AS (
			SELECT 
				  customer_id
				, phone
			FROM 
				staging.vdm1_stage4_customers
		)

	UPDATE staging.vdm1_stage4_customers AS a

	SET phone = vdm1_data.f_transform_customer_phone_e164(b.phone)

	FROM get_customer_details AS b

	WHERE
		a.customer_id = b.customer_id;

	END;
$vdm1_stage4_transform_update_customer_phone_number$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### ####
-- ####     3     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_transform_film_length()
	RETURNS VOID 
	LANGUAGE plpgsql
	AS $vdm1_stage4_transform_update_film_length$

	BEGIN

			WITH get_film_details AS (
			SELECT 
				  film_id
				, length
			FROM 
				staging.vdm1_stage4_films
		)

	UPDATE staging.vdm1_stage4_films AS a

	SET length = vdm1_data.f_transform_filmlength_int2vchar(b.length :: INTEGER)

	FROM get_film_details AS b

	WHERE
		a.film_id = b.film_id;

	END;
$vdm1_stage4_transform_update_film_length$;

-- #### #### #### #### #### #### #### ####  


-- #### #### #### ####
-- ####     4     #### 
-- #### #### #### #### 


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_category_popularity_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_category_popularity_count$
	
	BEGIN

		WITH get_rentalcount_cat AS (
			SELECT 
				  category_id
				, count(category_id) AS rentalcount_total
			FROM staging.vdm1_stage4_rentals

			GROUP BY
				category_id
		)

		UPDATE staging.vdm1_stage4_category_popularity_count

		SET total_rentals = get_rentalcount_cat.rentalcount_total

		FROM get_rentalcount_cat
		
		WHERE 
			vdm1_stage4_category_popularity_count.category_id = get_rentalcount_cat.category_id;
			
	END;
$vdm1_stage4_calc_update_category_popularity_count$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     5     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_film_popularity_count$
	
	BEGIN
	
		WITH get_rentalcount_film AS (
			SELECT 
				  film_id
				, count(film_id) AS rentalcount_total
			FROM staging.vdm1_stage4_rentals

			GROUP BY
				film_id
		)


		UPDATE staging.vdm1_stage4_film_category_popularity

		SET total_rentals = get_rentalcount_film.rentalcount_total

		FROM get_rentalcount_film
		
		WHERE 
			vdm1_stage4_film_category_popularity.film_id = get_rentalcount_film.film_id;
			
	END;
$vdm1_stage4_calc_update_film_popularity_count$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     6     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_film_popularity_row_number()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_film_popularity_row_number$
	
	BEGIN
	
	
		WITH get_film_popularity_row_number AS (
			SELECT 
				film_id,
				category_id,
				ROW_NUMBER() OVER (ORDER BY total_rentals DESC) as film_popularity_rental_order
			FROM staging.vdm1_stage4_film_category_popularity
		)

		UPDATE staging.vdm1_stage4_film_category_popularity a

		SET film_rank = get_film_popularity_row_number.film_popularity_rental_order

		FROM get_film_popularity_row_number

		WHERE
			a.film_id = get_film_popularity_row_number.film_id
				AND
			a.category_id = get_film_popularity_row_number.category_id;
			
	END;
$vdm1_stage4_calc_update_film_popularity_row_number$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     7     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_film_category_popularity_row_number()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_film_category_popularity_row_number$
	
	BEGIN
	
	
		WITH get_film_category_row_number AS (
			SELECT 
				film_id,
				category_id,
				ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY total_rentals DESC) as film_cat_rental_order
			FROM staging.vdm1_stage4_film_category_popularity
		)

		UPDATE staging.vdm1_stage4_film_category_popularity a

		SET film_category_rank = get_film_category_row_number.film_cat_rental_order

		FROM get_film_category_row_number

		WHERE
			a.film_id = get_film_category_row_number.film_id
				AND
			a.category_id = get_film_category_row_number.category_id;
			
	END;
$vdm1_stage4_calc_update_film_category_popularity_row_number$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### ####
-- ####     8     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_count()
    RETURNS VOID
    LANGUAGE plpgsql
    AS 
    $vdm1_stage4_calc_update_film_inventory_count$

    BEGIN

        WITH get_inventory_lifecycle AS (
            SELECT 
                  inventory_id
                , count(inventory_id) AS product_lifecycle
            FROM staging.vdm1_stage4_rentals
            GROUP BY
                inventory_id
            ORDER BY
                inventory_id        
        )


        UPDATE staging.vdm1_stage4_film_inventory

        SET life_cycle = get_inventory_lifecycle.product_lifecycle

        FROM get_inventory_lifecycle

        WHERE 
            vdm1_stage4_film_inventory.inventory_id = get_inventory_lifecycle.inventory_id;

    END;
$vdm1_stage4_calc_update_film_inventory_count$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####     9     #### 
-- #### #### #### #### 
 
CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_film_inventory_flag_inspection()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calcupdate_film_inventory_flag_inspection$

	BEGIN
	
		UPDATE staging.vdm1_stage4_film_inventory 

		SET inspect_flag = true
        
        
		WHERE 
            (life_cycle % 5) = 0
            AND
        maintenance_complete_flag = false;
	
	
	END;

$vdm1_stage4_calcupdate_film_inventory_flag_inspection$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    10     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_count_null_corrections()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_count_null_correction$
	
	BEGIN

		-- PRESETTING COUNT VALUES FOR HISTORICAL, AVERAGE, AND HALF AVERAGE TO ZERO
		-- USING CTE TO FIND NULLS HAS TO BE DONE INDIVIDUALLY FOR EACH COLUMN AND/OR IS MUCH SLOWER
		-- USING A CTE TO FIND ALL NULLS IN HISTORICAL THEN SETTING TO ZERO INSTEAD OF NULL TOOK 3 SECONDS 555 MSEC
		-- SETTING ALL VALUES TO ZERO FOR ALL THREE COLUMNS TOOK 69 MSEC
		
		UPDATE staging.vdm1_stage4_customer_category

		SET
			historical_rental_count = 0,
			average_rental_count = 0,
			halfaverage_rental_count = 0;


	END;
$vdm1_stage4_calc_update_customer_category_count_null_correction$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    11     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_historical_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_historical_count$
	
	BEGIN
	
		WITH get_customer_category_historical_count AS (
			SELECT
				  customer_id
				, category_id
				, COUNT(category_id) as historical_rental_count
			FROM staging.vdm1_stage4_customer_watch_history_details
			GROUP BY 
				customer_id, category_id
			ORDER BY 
				customer_id, category_id
		)

		UPDATE staging.vdm1_stage4_customer_category

		SET historical_rental_count = get_customer_category_historical_count.historical_rental_count

		FROM get_customer_category_historical_count

		WHERE 
			(vdm1_stage4_customer_category.customer_id = get_customer_category_historical_count.customer_id)
				AND
			(vdm1_stage4_customer_category.category_id = get_customer_category_historical_count.category_id);
	END;
$vdm1_stage4_calc_update_customer_category_historical_count$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    12     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_average_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_average_count$
	
	BEGIN
	
		WITH get_customer_category_average_count AS (
			SELECT
				  customer_id
				, category_id
				, COUNT(category_id) as average_rental_count
			FROM staging.vdm1_stage4_customer_watch_history_details

            WHERE customer_watch_history_desc_order <= 14
			GROUP BY 
				customer_id, category_id
			ORDER BY 
				customer_id, category_id
		)

		UPDATE staging.vdm1_stage4_customer_category

		SET average_rental_count = get_customer_category_average_count.average_rental_count

		FROM get_customer_category_average_count

		WHERE 
			(vdm1_stage4_customer_category.customer_id = get_customer_category_average_count.customer_id)
				AND
			(vdm1_stage4_customer_category.category_id = get_customer_category_average_count.category_id);
	END;
$vdm1_stage4_calc_update_customer_category_average_count$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    13     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_halfaverage_count()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_halfaverage_count$
	
	BEGIN
	
		WITH get_customer_category_halfaverage_count AS (
			SELECT
				  customer_id
				, category_id
				, COUNT(category_id) as halfaverage_rental_count
			FROM staging.vdm1_stage4_customer_watch_history_details

            WHERE customer_watch_history_desc_order <= 7
			GROUP BY 
				customer_id, category_id
			ORDER BY 
				customer_id, category_id
		)

		UPDATE staging.vdm1_stage4_customer_category

		SET halfaverage_rental_count = (get_customer_category_halfaverage_count.halfaverage_rental_count / 2)

		FROM get_customer_category_halfaverage_count

		WHERE 
			(vdm1_stage4_customer_category.customer_id = get_customer_category_halfaverage_count.customer_id)
				AND
			(vdm1_stage4_customer_category.category_id = get_customer_category_halfaverage_count.category_id);
	END;
$vdm1_stage4_calc_update_customer_category_halfaverage_count$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    14     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_historical()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_rec_order_historical$
	
	BEGIN
	
		WITH get_customer_category_rec_order_historical AS (
			SELECT 
				  customer_id
				, category_id
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY historical_rental_count DESC) as recommendation_order_historical
                
			FROM staging.vdm1_stage4_customer_category
		)

		UPDATE staging.vdm1_stage4_customer_category a

		SET 
            recommendation_order_historical = get_customer_category_rec_order_historical.recommendation_order_historical
            
		FROM get_customer_category_rec_order_historical 

		WHERE
			a.customer_id = get_customer_category_rec_order_historical.customer_id
				AND
			a.category_id = get_customer_category_rec_order_historical.category_id;
			
	END;
$vdm1_stage4_calc_update_customer_category_rec_order_historical$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    15     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_average()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_rec_order_average$
	
	BEGIN
	
		WITH get_customer_category_rec_order_average AS (
			SELECT 
				  customer_id
				, category_id
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY average_rental_count DESC) as recommendation_order_average
                
			FROM staging.vdm1_stage4_customer_category
		)

		UPDATE staging.vdm1_stage4_customer_category a

		SET 
            recommendation_order_average = get_customer_category_rec_order_average.recommendation_order_average
            
		FROM get_customer_category_rec_order_average

		WHERE
			a.customer_id = get_customer_category_rec_order_average.customer_id
				AND
			a.category_id = get_customer_category_rec_order_average.category_id;
			
	END;
$vdm1_stage4_calc_update_customer_category_rec_order_average$;


-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    16     #### 
-- #### #### #### #### 

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_halfaverage()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_rec_order_halfaverage$
	
	BEGIN
	
		WITH get_customer_category_rec_order_halfaverage AS (
			SELECT 
				  customer_id
				, category_id
                , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY halfaverage_rental_count DESC) as recommendation_order_halfaverage
                
			FROM staging.vdm1_stage4_customer_category
		)

		UPDATE staging.vdm1_stage4_customer_category a

		SET 
            recommendation_order_halfaverage = get_customer_category_rec_order_halfaverage.recommendation_order_halfaverage
            
		FROM get_customer_category_rec_order_halfaverage

		WHERE
			a.customer_id = get_customer_category_rec_order_halfaverage.customer_id
				AND
			a.category_id = get_customer_category_rec_order_halfaverage.category_id;
			
	END;
$vdm1_stage4_calc_update_customer_category_rec_order_halfaverage$;

-- #### #### #### #### #### #### #### ####

-- #### #### #### ####
-- ####    17     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_custom_set_default()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_recommendation_order_user_custom_set_defaults$
	
	BEGIN

		UPDATE staging.vdm1_stage4_customer_category a
		
		SET recommendation_order_customer_preference = b.recommendation_order_historical
		
		FROM 
			staging.vdm1_stage4_customer_category b
		WHERE  
			(b.customer_id = a.customer_id)
				AND
			(b.category_id = a.category_id);

	END;
$vdm1_stage4_calc_update_customer_category_recommendation_order_user_custom_set_defaults$;

 
-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    18     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cuscat_recorder_set_custom_order()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_category_recommendation_order_user_set_custom_pref$
	
	BEGIN

		WITH get_customer_custom_preferences AS (

			SELECT 
				  customer_id
				, category_id
				, customer_rec_custom_order
				, customer_rec_custom_amount
			FROM 
				staging.vdm1_stage4_customer_rec_custom_preferences
		)

		UPDATE staging.vdm1_stage4_customer_category
		
		SET recommendation_order_customer_preference = get_customer_custom_preferences.customer_rec_custom_order

		FROM get_customer_custom_preferences

		WHERE 
			(vdm1_stage4_customer_category.customer_id = get_customer_custom_preferences.customer_id)
				AND
			(vdm1_stage4_customer_category.category_id = get_customer_custom_preferences.category_id);

	END;
$vdm1_stage4_calc_update_customer_category_recommendation_order_user_set_custom_pref$;

 
-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    19     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_customer_watch_history_row_number()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_cx_wh_rn$
	
	BEGIN
		
		WITH get_init_cx_wh AS (

			SELECT
				*
			FROM staging.vdm1_stage4_customer_watch_history_details
		),
		assign_row_number AS (

			SELECT
				  ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY rental_id DESC) AS customer_watch_history_desc_order_row_number
				, *
			FROM get_init_cx_wh
		)


		UPDATE staging.vdm1_stage4_customer_watch_history_details a

		SET customer_watch_history_desc_order = assign_row_number.customer_watch_history_desc_order_row_number

		FROM assign_row_number 	  

		WHERE 
			a.customer_id = assign_row_number.customer_id
			AND
			a.rental_id = assign_row_number.rental_id;
			
	END;
$vdm1_stage4_calc_update_cx_wh_rn$;




-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    20     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_insert_failed_returns_v2()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_failed_returns$
	
	BEGIN  
            
		INSERT INTO staging.vdm1_stage4_failed_returns(

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
			, rental_id
			, a.film_id
			, inventory_id
			, store_id
			, rental_date
			, vdm1_data.f_calc_expected_return_date(a.film_id::int, rental_date::DATE) as expected_return_date
            , (SELECT AGE('2007-01-01', vdm1_data.f_calc_expected_return_date(a.film_id::int, rental_date::DATE))) as age
		FROM staging.vdm1_stage4_rentals a
			INNER JOIN staging.vdm1_stage4_customers b
				ON b.customer_id = a.customer_id
			INNER JOIN staging.vdm1_stage4_films c
                ON c.film_id = a.film_id
	                
		WHERE a.return_date IS NULL;

	END;
$vdm1_stage4_calc_insert_failed_returns$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    21     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_insert_new_releases_v2()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_new_releases$
	
	BEGIN 


		INSERT INTO staging.vdm1_stage4_new_releases(
			  film_id
		)		
		
		SELECT
			  film_id
		FROM staging.vdm1_stage4_films
		
		WHERE new_release = true;
		
	END;
$vdm1_stage4_calc_insert_new_releases$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    22     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_delete_cx_history_from_cx_filmcat()
    RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_delete_customer_film_category$

	BEGIN 

		WITH get_customer_watch_history AS (

			SELECT 
				  customer_id
				, film_id
				, category_id 
			FROM staging.vdm1_stage4_customer_watch_history_details
		),
		historyfromrecommended as (
			(SELECT * FROM staging.vdm1_stage4_customer_film_category)
				INTERSECT  
			(SELECT * FROM get_customer_watch_history)
		)

		DELETE FROM staging.vdm1_stage4_customer_film_category a

		WHERE EXISTS  (
			SELECT * FROM historyfromrecommended b
			where b.customer_id = a.customer_id AND b.film_id = a.film_id);

		
	END;
$vdm1_stage4_calc_delete_customer_film_category$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    23     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_nonspecific()
    RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_reclist_master_nonspecific$

	BEGIN 


    INSERT INTO staging.vdm1_stage4_customer_reclist_master_nonspecific(

			  customer_id
			, film_rank
            , category_id
			, film_id
			, film_category_rank
			, total_rentals
		)	
    
	WITH get_customer_film_cat_x_film_cat_pop AS (

		SELECT
			  a.customer_id
			, b.film_rank
			, a.category_id
			, a.film_id
			, b.film_category_rank
			, b.total_rentals
		FROM staging.vdm1_stage4_customer_film_category a
			LEFT JOIN 
				staging.vdm1_stage4_film_category_popularity b
					ON b.film_id = a.film_id 

		ORDER BY 
			a.customer_id, a.film_id	
	)
    
    SELECT
	      customer_id
	    , film_rank
	    , category_id
        , film_id
		, film_category_rank
	    , total_rentals
    FROM get_customer_film_cat_x_film_cat_pop;


    
	END;
$vdm1_stage4_calc_insert_customer_reclist_master_nonspecific$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### ####
-- ####    24     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_nonspecific_rn()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_reclist_master_nonspecific_row_number$
	
	
	BEGIN
		
		WITH get_customer_reclist_master_nonspecific_values AS (

			SELECT
				  customer_id
				, film_rank
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
			FROM staging.vdm1_stage4_customer_reclist_master_nonspecific
		),
		assign_row_number AS (

			SELECT
				  customer_id
				, film_rank
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
				, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY film_rank) as rental_rec_order_rn
			FROM get_customer_reclist_master_nonspecific_values
		)


		UPDATE staging.vdm1_stage4_customer_reclist_master_nonspecific a

		SET film_rec_order = assign_row_number.rental_rec_order_rn

		FROM assign_row_number 	  

		WHERE 
			(a.customer_id = assign_row_number.customer_id
				AND
			a.film_id = assign_row_number.film_id);
			
	END;

$vdm1_stage4_calc_update_customer_reclist_master_nonspecific_row_number$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    25     #### 
-- #### #### #### ####


CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_insert_cx_reclist_master_specific_default()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_reclist_master_specific_default$

	BEGIN


    INSERT INTO staging.vdm1_stage4_customer_reclist_master_specific(

			  customer_id           -- customer id
		    , cat_rec_order         -- customer's category rec order     
		    , category_id           -- category id 
            , film_id               -- film id
		    , film_category_rank    -- film rank by category
		    , total_rentals         -- Film's Total Rentals
		)	

	WITH combined_master_with_cxcat AS (

		SELECT 
			a.customer_id
			, CASE
			  	WHEN EXISTS (SELECT b.customer_id FROM staging.vdm1_stage4_customer_category b where b.customer_id = a.customer_id)
			  		THEN b.recommendation_order_customer_preference
			  	ELSE b.recommendation_order_historical
			  END as cat_rec_order 
			, a.category_id
			, a.film_id
			, a.film_category_rank
			, a.total_rentals
		FROM 
			staging.vdm1_stage4_customer_reclist_master_nonspecific a
				LEFT JOIN 
					staging.vdm1_stage4_customer_category b
						ON b.customer_id = a.customer_id
						
		WHERE
			(b.customer_id = a.customer_id
				AND
			b.category_id = a.category_id)
				AND
			b.recommendation_order_historical IN (
				SELECT recommendation_order_historical
					FROM 
				staging.vdm1_stage4_customer_category)

		ORDER BY
			a.customer_id, 2, a.film_category_rank DESC
	)

    SELECT
		  customer_id
		, cat_rec_order
		, category_id 
		, film_id
		, film_category_rank
		, total_rentals
    FROM combined_master_with_cxcat;



	END;

$vdm1_stage4_calc_insert_customer_reclist_master_specific_default$;

-- #### #### #### #### #### #### #### #### 


-- #### #### #### ####
-- ####    26     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_calc_update_cx_reclist_master_specific_rn()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_update_customer_reclist_master_specific_row_number$
	
	
	BEGIN
		
		WITH get_customer_reclist_master_specific_values AS (

			SELECT
				  customer_id
				, cat_rec_order
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
			FROM staging.vdm1_stage4_customer_reclist_master_specific
		),
		assign_row_number AS (

			SELECT
				  customer_id
				, cat_rec_order
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
				, ROW_NUMBER() OVER(PARTITION BY customer_id, cat_rec_order ORDER BY cat_rec_order, film_category_rank) AS rental_rec_order_rn
			FROM get_customer_reclist_master_specific_values
		)


		UPDATE staging.vdm1_stage4_customer_reclist_master_specific a

		SET rental_rec_order = assign_row_number.rental_rec_order_rn

		FROM assign_row_number 	  

		WHERE 
			(a.customer_id = assign_row_number.customer_id
				AND
			a.film_id = assign_row_number.film_id);
			
	END;

$vdm1_stage4_calc_update_customer_reclist_master_specific_row_number$;

-- #### #### #### #### #### #### #### #### 

-- #### #### #### ####
-- ####    27     #### 
-- #### #### #### ####

CREATE OR REPLACE FUNCTION vdm1_etl.f_vdm1_stage4_cleanup()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_cleanup$
	
	BEGIN
		

		-- #### #### #### ####
	
		DROP TABLE IF EXISTS staging.vdm1_stage4_rentals;
		
		DROP TABLE IF EXISTS staging.vdm1_stage4_customer_film_category;
		
		
		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage4_customers
			RENAME TO vdm1_stage5_dictkey_customer_details;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_stores
			RENAME TO vdm1_stage5_dictkey_store_details;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_films
			RENAME TO vdm1_stage5_dictkey_film_details;


        -- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_category
		    RENAME TO vdm1_stage5_dictkey_category;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_city
			RENAME TO vdm1_stage5_dictkey_city;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_country
			RENAME TO vdm1_stage5_dictkey_country;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_dictkey_language
			RENAME TO vdm1_stage5_dictkey_language;
			

        -- #### #### #### #### #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_category
			RENAME TO vdm1_stage5_customer_category;

		-- #### #### #### #### 
		
		ALTER TABLE IF EXISTS staging.vdm1_stage4_failed_returns
			RENAME TO vdm1_stage5_failed_returns;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_new_releases
			RENAME TO vdm1_stage5_new_releases;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_film_inventory
			RENAME TO vdm1_stage5_inventory_maintenance;

		-- #### #### #### #### 

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_watch_history_details
			RENAME TO vdm1_stage5_customer_watch_history_details;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_reclist_master_nonspecific
			RENAME TO vdm1_stage5_customer_reclist_master_nonspecific;

		ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_reclist_master_specific
			RENAME TO vdm1_stage5_customer_reclist_master_specific;

		-- #### #### #### #### 

        ALTER TABLE IF EXISTS staging.vdm1_stage4_category_popularity_count
            RENAME TO vdm1_stage5_category_popularity;

        ALTER TABLE IF EXISTS staging.vdm1_stage4_film_category_popularity
            RENAME TO vdm1_stage5_film_category_popularity;
			
        ALTER TABLE IF EXISTS staging.vdm1_stage4_customer_rec_custom_preferences
            RENAME TO vdm1_stage5_customer_rec_custom_preferences;

        -- #### #### #### #### 


	END;
$vdm1_stage4_cleanup$;

-- #### #### #### #### #### #### #### #### 


-- #TODO STAGE 4 END
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### ####     STAGE 4 END     #### #### #### #### #### #### #### #### #### #### #### #### #### ####
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 