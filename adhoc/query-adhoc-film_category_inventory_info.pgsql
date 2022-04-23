SELECT
	  inventory_id
	, film_id
	, category_id
FROM 
	film_category
		INNER JOIN inventory USING (film_id)

WHERE 
	-- category_id = 9
	-- inventory_id = 3413
	 film_id = 767
	 
	 -- 469
	 -- 3505