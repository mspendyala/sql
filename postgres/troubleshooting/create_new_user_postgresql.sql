-- Create a new user in postgresql database with only read only access

-- Step 1: Connect to postgres database

-- Step 2: Create the user
CREATE USER abcd1234 WITH PASSWORD 'aiguru123';

-- Step 3: Grant access to the database
GRANT CONNECT ON DATABASE serviceguru TO abcd1234;

-- Step 4: Set search path (optional)
ALTER USER abcd1234 SET search_path TO public;

-- Step 5: Grant read-only access on all tables
-- Connect to actual user database 
GRANT USAGE ON SCHEMA public TO abcd1234;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO abcd1234;

-- Step 6: Grant access to future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO abcd1234;


-------
