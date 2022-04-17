CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_insert_customer_recommendation_list_summary()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_insert_customer_rec_list_customer_summary$

	BEGIN

	TRUNCATE TABLE staging.vdm1_stage4_customer_recommendation_list_summary;

    INSERT INTO staging.vdm1_stage4_customer_recommendation_list_summary(

			  customer_id
			, rec_order 
            , category_id
			, rec_order
			, film_id
			, film_rank 
			, film_category_rank
			, total_rentals
		)	

	WITH combined_master_with_cxcat AS (

		SELECT
			  a.customer_id
			, a.rec_order
			, b.recommendation_order_historical
			, b.recommendation_order_average
			, b.recommendation_order_halfaverage
			, b.recommendation_order_customer_preference
			, a.category_id
			, a.film_id
			, a.film_rank
			, a.film_category_rank
			, a.total_rentals
		FROM 
			staging.vdm1_stage4_customer_recommendation_list_master a 
				LEFT JOIN 
					staging.vdm1_stage4_customer_category b 
						ON b.customer_id = a.customer_id
		WHERE
			(b.customer_id = a.customer_id)
				AND 
			(b.category_id = a.category_id)
	)

    SELECT
    	  *
    	, ROW_NUMBER() OVER (PARTITION BY customer_id, category_id ORDER BY rec_order) as rec_order
    FROM combined_master_with_cxcat;


	END;
$vdm1_stage4_calc_insert_customer_rec_list_customer_summary$;