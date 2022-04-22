CREATE OR REPLACE FUNCTION staging.f_stage3_failed_returns()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $stage3fairet$
	
	BEGIN 
	
	CREATE TABLE staging.stage3_failed_returns(
		  fr_id INTEGER NOT NULL 
		, customer_id INTEGER NOT NULL
		, rental_id INTEGER NOT NULL 
		, film_id INTEGER NOT NULL
		, inventory_id INTEGER NOT NULL
		, store_id INTEGER NOT NULL
		, rental_date DATE NOT NULL
	);
	END;
$stage3fairet$;