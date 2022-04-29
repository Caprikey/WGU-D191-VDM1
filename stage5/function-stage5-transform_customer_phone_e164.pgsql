CREATE OR REPLACE FUNCTION vdm1_data.f_transform_customer_phone_e164(
		p_phone VARCHAR)
	RETURNS VARCHAR
	LANGUAGE plpgsql
	AS $vdm1_stage5_transform_customer_phone_e164$
	
	DECLARE
		
		vi_phone VARCHAR;
		
		vo_phone VARCHAR;

    BEGIN 

    	vi_phone := $1;

SELECT
	CONCAT_WS(
          ' '
        , '+'
        , LEFT(vi_phone, (LENGTH(vi_phone)-10))
		, SUBSTRING(vi_phone, (LENGTH(vi_phone)-10)+1, 2)
		, SUBSTRING(vi_phone, ((LENGTH(vi_phone)-8)+1), 4)
		, RIGHT(vi_phone,4)
    )
    INTO
        vo_phone;

    RETURN vo_phone;


	END;
$vdm1_stage5_transform_customer_phone_e164$;