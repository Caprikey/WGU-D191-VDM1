CREATE OR REPLACE FUNCTION staging.f_vdm1_stage3_create_table_customer_rec_custom_preferences()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage3_create_table_customer_rec_custom_preferences$
	
	BEGIN 

        CREATE TABLE staging.vdm1_stage3_customer_rec_custom_preferences (

              customer_id INT DEFAULT NULL
            , category_id INT DEFAULT NULL
            , customer_rec_custom_order INT NULL
            , customer_rec_custom_amount INT NULL

        );

    END;
$vdm1_stage3_create_table_customer_rec_custom_preferences$;
