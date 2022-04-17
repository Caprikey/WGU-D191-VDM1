CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_transform_customer_full_name(
		p_first_name VARCHAR,
		p_last_name VARCHAR)
	RETURNS VARCHAR
	LANGUAGE plpgsql
	AS $vdm1_stage4_transform_customer_full_name$
	
	DECLARE
		
		vi_first_name VARCHAR;
		vi_last_name VARCHAR;
		
		vo_full_name VARCHAR;
		
		-- bicapitalization_list varchar[]; 
		bicapitalization_list_2l varchar[]; 
		bicapitalization_list_3l varchar[]; 
		bicapitalization_list_4l varchar[]; 

	BEGIN
		
		vi_first_name := $1;
		vi_last_name := $2;
		
		-- bicapitalization_list := array['mc', 'le', 'la', 'o''', 'da', 'de' ];
		bicapitalization_list_2l := array['mc', 'o'''];
		bicapitalization_list_3l := array['mac'];
		bicapitalization_list_4l := array['von ', 'fitz'];

		
		CASE 
			-- WHEN (LOWER(LEFT($2,4)) = 'von ') THEN
			--	vi_last_name := (UPPER(LEFT($2,1))) || (LOWER(SUBSTRING($2,2,2))) || ' ' || (UPPER(SUBSTRING($2,5,1))) || (LOWER(SUBSTRING($2,5,length($2))));			
			-- WHEN (LOWER(LEFT($2,4)) = 'fitz') THEN
			--	vi_last_name := (UPPER(LEFT($2,1))) || (LOWER(SUBSTRING($2,2,3))) || (UPPER(SUBSTRING($2,4,1))) || (LOWER(SUBSTRING($2,5,length($2))));
			-- WHEN (LOWER(LEFT($2,3)) = 'mac') THEN
			--	vi_last_name := (UPPER(LEFT($2,1))) || (LOWER(SUBSTRING($2,2,2))) || (UPPER(SUBSTRING($2,3,1))) || (LOWER(SUBSTRING($2,4,length($2))));
				
			WHEN (LOWER(LEFT($2,4)) = ANY(bicapitalization_list_4l)) THEN
				vi_last_name := (UPPER(LEFT($2,1))) || (LOWER(SUBSTRING($2,2,3))) || (UPPER(SUBSTRING($2,4,1))) || (LOWER(SUBSTRING($2,5,length($2))));
			WHEN (LOWER(LEFT($2,3)) = ANY(bicapitalization_list_3l)) THEN
				vi_last_name := (UPPER(LEFT($2,1))) || (LOWER(SUBSTRING($2,2,2))) || (UPPER(SUBSTRING($2,4,1))) || (LOWER(SUBSTRING($2,5,length($2))));
			WHEN (LOWER(LEFT($2,2)) = ANY(bicapitalization_list_2l)) THEN 
				vi_last_name := (UPPER(LEFT($2,1))) || (LOWER(SUBSTRING($2,2,1))) || (UPPER(SUBSTRING($2,3,1))) || (LOWER(SUBSTRING($2,4,length($2))));
			ELSE 
				vi_last_name := $2;
		END CASE;

		SELECT 
			CONCAT_WS( 
				' ',
				vi_first_name, 
				vi_last_name)
		INTO vo_full_name;

		RETURN vo_full_name;
	END;
$vdm1_stage4_transform_customer_full_name$;