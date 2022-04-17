CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_expected_return_date(
		p_film_id INT,
		p_rental_date DATE)
	RETURNS DATE
	LANGUAGE plpgsql
	AS $vdm1_stage4_calc_expectedreturndate$
	
	DECLARE
		
		vi_film_id INTEGER;
		vlu_rental_duration INTEGER;
		vi_rental_date DATE;
		
		vo_expected_return_date DATE;
	
	BEGIN
		
		vi_film_id := $1;
		vi_rental_date := $2;
		
			SELECT 
				rental_duration INTO vlu_rental_duration
			FROM staging.vdm1_stage4_films a
			WHERE vi_film_id = a.film_id;

			vo_expected_return_date := vi_rental_date + vlu_rental_duration;

		RETURN vo_expected_return_date;
	END;
$vdm1_stage4_calc_expectedreturndate$;