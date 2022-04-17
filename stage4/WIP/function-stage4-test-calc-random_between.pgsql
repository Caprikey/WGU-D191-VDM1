CREATE OR REPLACE FUNCTION staging.f_vdm1_stage4_test_random_between(low INT , high INT) 
   RETURNS INT AS
$$
BEGIN

   RETURN floor(random()* (high-low + 1) + low);
END;
$$ language 'plpgsql' STRICT;