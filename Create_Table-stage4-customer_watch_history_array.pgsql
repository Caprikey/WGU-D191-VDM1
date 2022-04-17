CREATE TABLE staging.vdm1_stage4_test_customerwatchhistoryarray AS 

	SELECT 
		  customer_id
		, ARRAY_AGG(DISTINCT film_id) AS cxfilmlist
	FROM staging.vdm1_stage4_rentals
	
	GROUP BY
		customer_id
	ORDER BY 
		cxfilmlist
