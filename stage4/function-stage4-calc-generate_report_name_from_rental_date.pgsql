CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_calc_generate_report_year_weeknumber_stamp(
		p_rental_date DATE
)
	RETURNS VARCHAR
	LANGUAGE plpgsql
	AS $vdm1_stage4_transform_rental_date_to_report_stamp$
	
	DECLARE
		
		vi_rental_date DATE;

		vo_report_name VARCHAR;
		-- vo_report_name TEXT;
		
	BEGIN
		
		vi_rental_date := $1;

    SELECT 
        CONCAT('rpt_y', (RIGHT((EXTRACT('year' FROM rental_date)::text),2)), 'wk', (EXTRACT('week' FROM rental_date)::text))
    INTO
        vo_report_name;

		RETURN vo_report_name;

	END;
$vdm1_stage4_transform_rental_date_to_report_stamp$;