SELECT 
    *
    , array_agg(a.*)
FROM 
    staging.vdm1_stage4_films a

group by
    film_id, title, category_id, release_year, language_id, length, rating, description, new_release,rental_duration, rental_rate, replacement_cost

order by
    film_id