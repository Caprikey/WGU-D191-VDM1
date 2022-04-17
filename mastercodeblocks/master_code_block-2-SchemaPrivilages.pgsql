


-- MASTER CODE BLOCK MODULES
--             2
--    SCHEMA PREVILAGES



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### ####  SCHEMA PRIVILAGES  #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### 


GRANT USAGE ON SCHEMA extensions TO public;
-- GRANT USAGE ON SCHEMA extensions TO staging;
-- GRANT USAGE ON SCHEMA extensions TO marketing;

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA extensions TO public;
-- GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA extensions TO staging;
-- GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA extensions TO marketing;

ALTER DEFAULT PRIVILEGES IN SCHEMA extensions
	GRANT EXECUTE ON FUNCTIONS TO public;
--	GRANT EXECUTE ON FUNCTIONS TO staging;
--	GRANT EXECUTE ON FUNCTIONS TO marketing;

ALTER DEFAULT PRIVILEGES IN SCHEMA extensions
	GRANT USAGE ON TYPES TO public;
--	GRANT USAGE ON TYPES TO staging;
--	GRANT USAGE ON TYPES TO marketing;


-- #### #### #### #### 

-- RESOURCE LINKS:
-- https://stackoverflow.com/questions/12986368/installing-postgresql-extension-to-all-schemas



-- #### #### #### #### #### #### #### #### 



-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
-- #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 