CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_customer_watch_history_array()
	RETURNS VOID
	LANGUAGE plpgsql
	AS
    $vdm1_stage3_create_table_cxwatchhistory_array$
	
	BEGIN 
	
CREATE TABLE staging.vdm1_stage3_customer_watch_history_array AS (

	SELECT 
		  customer_id
        , ARRAY_AGG(DISTINCT film_id) as customer_watch_history_distinct_film_array
		
	FROM staging.vdm1_stage3_customer_watch_history_details
	 
	GROUP BY
		customer_id
	ORDER BY 
		customer_id

);

	
	END;
$vdm1_stage3_create_table_cxwatchhistory_array$;