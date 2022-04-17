CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_failed_returns()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_failed_returns$
	
	BEGIN 
	
	CREATE TABLE staging.vdm1_stage3_failed_returns(
		  fr_id INTEGER
		, customer_id INTEGER NOT NULL
		, rental_id INTEGER NOT NULL 
		, film_id INTEGER NOT NULL
		, inventory_id INTEGER NOT NULL
		, store_id INTEGER NOT NULL
		, rental_date DATE NOT NULL
        , expected_return_date DATE NOT NULL
		, age INTERVAL NOT NULL
	);
	END;
$vdm1_stage3_create_table_failed_returns$;