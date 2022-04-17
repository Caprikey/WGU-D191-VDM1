CREATE OR REPLACE FUNCTION staging.f_vmd1_stage2_customer_status_amend()
	RETURNS VOID
	LANGUAGE plpgsql
	AS $vdm1_stage2_cxstatamend$
	
	BEGIN
	
	UPDATE staging.vdm1_stage1_customer
	
	SET 
		activebool = FALSE
	
	FROM (
		SELECT
			customer_id
		FROM staging.vdm1_stage1_customer
	) AS a
	
	WHERE 
		(active = 0 AND activebool = true)
			OR
		(active = 1 AND activebool = false);
	
	END;
$vdm1_stage2_cxstatamend$;

