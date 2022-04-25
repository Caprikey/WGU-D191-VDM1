
-- TRUNCATE TABLE marketing.customer_reclist_master_specific;

    INSERT INTO marketing.customer_reclist_master_specific(

			  customer_id           -- customer id
		    , cat_rec_order         -- customer's category rec order     
		    , category_id           -- category id 
			, rental_rec_order
            , film_id               -- film id
		    , film_category_rank    -- film rank by category
		    , total_rentals         -- Film's Total Rentals
		)	

	WITH combined_master_with_cxcat AS (

		SELECT 
			a.customer_id
			, CASE
			  	WHEN EXISTS (SELECT b.customer_id FROM marketing.customer_category b where b.customer_id = a.customer_id)
			  		THEN b.recommendation_order_customer_preference
			  	ELSE b.recommendation_order_historical
			  END as cat_rec_order 
			, a.category_id
			, a.film_id
			, a.film_category_rank
			, a.total_rentals
		FROM 
			marketing.customer_reclist_master_nonspecific a
				LEFT JOIN 
					marketing.customer_category b
						ON b.customer_id = a.customer_id
						
		WHERE
			(b.customer_id = a.customer_id
				AND
			b.category_id = a.category_id)
				AND
			b.recommendation_order_historical IN (
				SELECT recommendation_order_historical
					FROM 
				marketing.customer_category)

		ORDER BY
			a.customer_id, 2, a.film_category_rank DESC
	), get_customer_reclist_master_specific_values AS (

			SELECT
				  customer_id
				, cat_rec_order
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
			FROM combined_master_with_cxcat
		),
		assign_row_number AS (

			SELECT
				  customer_id
				, cat_rec_order
				, category_id
				, film_id
				, film_category_rank
				, total_rentals
				, ROW_NUMBER() OVER(PARTITION BY customer_id, cat_rec_order ORDER BY cat_rec_order, film_category_rank) AS rental_rec_order
			FROM get_customer_reclist_master_specific_values
)

SELECT 
	  customer_id
	, cat_rec_order
	, category_id
	, rental_rec_order
	, film_id
	, film_category_rank
	, total_rentals
FROM 
	assign_row_number


-- 		UPDATE marketing.customer_reclist_master_specific a

-- 		SET rental_rec_order = b.rental_rec_order_rn

-- 		FROM assign_row_number as b

-- 		WHERE 
-- 			(a.customer_id = b.customer_id
-- 				AND
-- 			a.film_id = b.film_id);
			


