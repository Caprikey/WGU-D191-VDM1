CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_customer_reclist_master_specific_default()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_reclist_master_specific_default$

	BEGIN


	-- TRUNCATE TABLE staging.vdm1_stage4_customer_reclist_master_specific;

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
				-- WHEN EXISTS (SELECT b.customer_id FROM staging.vdm1_stage4_customer_category b where b.customer_id = a.customer_id)
				-- 	THEN b.recommendation_order_customer_preference
				-- ELSE b.recommendation_order_historical
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
		-- , ROW_NUMBER() OVER (PARTITION BY customer_id, category_id ORDER BY cat_rec_order) as rental_rec_order_rn
    FROM combined_master_with_cxcat;



	END;

$vdm1_stage4_calc_insert_customer_reclist_master_specific_default$;