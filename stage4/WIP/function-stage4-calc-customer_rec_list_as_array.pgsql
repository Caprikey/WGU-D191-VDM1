CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_get_customer_rec_as_array()


CREATE TABLE staging.vdm1_stage4_test_customerwatchrecarray AS 

	SELECT 
		  b.customer_id
		, ARRAY_AGG(a.film_id)
	FROM staging.vdm1_stage4_films a
		CROSS JOIN staging.vdm1_stage4_customers b

	WHERE a.film_id != ALL (
		SELECT
			UNNEST(cxfilmlist)
		FROM staging.vdm1_stage4_test_customerwatchhistoryarray
			WHERE customer_id = b.customer_id
	)

	GROUP BY
		b.customer_id
	ORDER BY 
		b.customer_id;

