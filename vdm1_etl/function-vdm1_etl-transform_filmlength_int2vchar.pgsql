CREATE OR REPLACE FUNCTION vdm1_etl.f_transform_filmlength_int2vchar(
	p_length INTEGER
)
	RETURNS VARCHAR
	LANGUAGE plpgsql
	AS $vmd1_etl_transform_filmlength_int2vchar$
	
	DECLARE
		-- IN Variable
		vi_len_int INTEGER;
		-- OUT Variable
		vo_len_varchar VARCHAR;
	
	BEGIN 
		-- Clearing the variables
		vo_len_varchar := '';
		vi_len_int := 0;
		-- Setting the variable to input integer
		vi_len_int := $1;
		
		-- Mathing
		CASE
			WHEN ((vi_len_int / 60 > 0) AND (vi_len_int % 60) = 0) THEN 
				vo_len_varchar := (
					(vi_len_int / 60) || ' hrs'
				);
			WHEN (vi_len_int / 60 > 0) THEN 
				vo_len_varchar := (
					(vi_len_int / 60) || ' hrs ' || (vi_len_int % 60) || ' min'
				);
			ELSE
				vo_len_varchar := (
					(vi_len_int % 60) || ' min'
				);
		END CASE;
			
		RETURN vo_len_varchar;
	
	END;
$vmd1_etl_transform_filmlength_int2vchar$;
