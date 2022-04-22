CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_customer_reclist_master_nonspecific()
    RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_reclist_master_nonspecific$

	BEGIN 

    -- TRUNCATE TABLE staging.vdm1_stage4_customer_reclist_master_nonspecific;

    INSERT INTO staging.vdm1_stage4_customer_reclist_master_nonspecific(

			  customer_id
			, film_rank
            , category_id
			-- , film_rec_order
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
        -- , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY film_rank) as rental_rec_order_rn
        , film_id
		, film_category_rank
	    , total_rentals
    FROM get_customer_film_cat_x_film_cat_pop;


    
	END;
$vdm1_stage4_calc_insert_customer_reclist_master_nonspecific$;