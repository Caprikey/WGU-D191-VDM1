-- Watch History From Average Rental Calculation With Legnth Calculation


WITH wh_length_calc as (
	select
		  customer_id
		, count(cx_wh_order) as total
		, ((count(cx_wh_order) - 14)+1) as count_from_total
	FROM
		staging.vdm1_stage4_customer_watch_history

	group by 1
	order by 1
)


SELECT
	  a.customer_id
	, a.category_id
	, COUNT(a.category_id) as category_count

FROM staging.vdm1_stage4_customer_watch_history a

	WHERE cx_wh_order >= (
		SELECT 
			count_from_total
		FROM
			wh_length_calc
		where customer_id = a.customer_id
		
			)
group by
	customer_id, category_id
order by
	customer_id, 3 desc