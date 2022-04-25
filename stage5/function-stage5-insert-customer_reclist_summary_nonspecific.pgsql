CREATE OR REPLACE FUNCTION staging.f_vdm1_stage5_insert_cx_reclist_summary_nonspecific()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage5_insert_customer_reclist_summary_nonspecific$
	
	BEGIN 
    
        INSERT INTO staging.vdm1_stage5_customer_reclist_summary_nonspecific (

				  customer_id
				, film_rec_order
				, film_id
				, category_id
        )


        WITH get_customer_reclist_summary_nonspecific AS (
			
			SELECT
				  customer_id
                , film_rec_order
				, film_id
				, category_id
			
			FROM
				staging.vdm1_stage5_customer_reclist_master_nonspecific	
			
            WHERE
                (customer_id = NEW.customer_id)
                    AND 
                (film_rec_order <= 10)

			ORDER BY
				customer_id, film_rec_order

		)

        SELECT
			  customer_id
            , film_rec_order
			, film_id
			, category_id
		FROM
            get_customer_reclist_summary_nonspecific;
	
	END;
$vdm1_stage5_insert_customer_reclist_summary_nonspecific$;