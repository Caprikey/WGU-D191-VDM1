with get_film_count as (
select 
film_id,count(film_id)
from
	staging.vdm1_stage4_rentals
group by 
	film_id
order by count desc),
set_rank as (
select 
dense_rank() over ( order by count desc) as rank, 
* 
from get_film_count
)

select
	*
FROM set_rank
where rank <=10