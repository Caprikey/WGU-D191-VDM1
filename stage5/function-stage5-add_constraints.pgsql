CREATE OR REPLACE FUNCTION vdm1_etl.vdm1_stage5_create_table_constraints
    RETURNS VOID
    LANGUAGE plpgsql
    AS $vdm1_stage5_add_table_constraints$

    BEGIN


        ALTER TABLE customer_category
            ADD PRIMARY KEY (customer_id, category_id),
            ADD CONSTRAINT fk_customer_id FOREGIN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category (category_id);

        ALTER TABLE failed_returns
            ADD PRIMARY KEY (customer_id, rental_id),
            ADD CONSTRAINT fk_customer_id FOREGIN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_rental_id FOREIGN KEY (rental_id) REFERENCES public.rental (rental_id);

        ALTER TABLE new_releases
            ADD PRIMARY KEY (film_id),
            ADD CONSTRAINT fk_film_id FOREGIN KEY (film_id) REFERENCES public.film (film_id);

        ALTER TABLE inventory_maintenance
            ADD PRIMARY KEY (inventory_id),
            ADD CONSTRAINT fk_inventory_id FOREGIN KEY (inventory_id) REFERENCES public.inventory (inventory_id);

        ALTER TABLE inventory_maintenance_summary
            ADD PRIMARY KEY (inventory_id),
            ADD CONSTRAINT fk_inventory_id FOREGIN KEY (inventory_id) REFERENCES public.inventory (inventory_id);

        ALTER TABLE customer_watch_history_detailed
            ADD PRIMARY KEY (customer_id, rental_id),
            ADD CONSTRAINT fk_customer_id FOREGIN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_rental_id FOREIGN KEY (rental_id) REFERENCES public.rental (rental_id),
            ALTER COLUMN rental_date SET NOT NULL;

        ALTER TABLE customer_reclist_master_nonspecific
            ADD PRIMARY KEY (customer_id, film_id),
            ADD CONSTRAINT fk_customer_id FOREGIN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES public.film (film_id);

        ALTER TABLE customer_reclist_master_specific
            ADD PRIMARY KEY (customer_id, film_id),
            ADD CONSTRAINT fk_customer_id FOREGIN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES public.film (film_id),
            ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category (category_id);

        ALTER TABLE customer_reclist_summary_nonspecific
            ADD PRIMARY KEY (customer_id, film_id),
            ADD CONSTRAINT fk_customer_id FOREGIN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES public.film (film_id);

        ALTER TABLE customer_reclist_summary_specific
            ADD PRIMARY KEY (customer_id, film_id),
            ADD CONSTRAINT fk_customer_id FOREGIN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES public.film (film_id),
            ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category (category_id);

        ALTER TABLE category_popularity
            ADD PRIMARY KEY (category_id),
            ADD CONSTRAINT fk_category_id FOREGIN KEY (category_id) REFERENCES public.category (category_id);

        ALTER TABLE film_category_popularity
            ADD PRIMARY KEY (film_id),
            ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES public.film (film_id),
            ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category (category_id);

        ALTER TABLE customer_rec_custom_preferences
            ADD PRIMARY KEY (customer_id, category_id),
            ADD CONSTRAINT fk_customer_id FOREGIN KEY (customer_id) REFERENCES public.customer (customer_id),
            ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category (category_id);

    END;
$vdm1_stage5_add_table_constraints$;