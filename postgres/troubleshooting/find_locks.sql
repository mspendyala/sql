-- Query to find locks:

select pid, 
       usename, 
       pg_blocking_pids(pid) as blocked_by, 
       query as blocked_query
from pg_stat_activity
where cardinality(pg_blocking_pids(pid)) > 0

-- Find information about a process with a pid 
  
SELECT query 
FROM pg_stat_activity 
WHERE pid = 11;

-- Terminate a SQL query with PID 10423
SELECT pg_terminate_backend('10423');


-- Find all Transactions holding locks on a table

SELECT
    pg_stat_activity.pid,
    pg_stat_activity.query,
    pg_stat_activity.state,
    pg_locks.locktype,
    pg_locks.mode,
    pg_locks.granted
FROM
    pg_stat_activity
JOIN
    pg_locks ON pg_stat_activity.pid = pg_locks.pid
WHERE
    pg_locks.relation = (
        SELECT oid FROM pg_class WHERE relname = 'tbl_name'
    )
    AND pg_locks.database = (
        SELECT oid FROM pg_database WHERE datname = 'db_name'
    );
    

-- Find Long running transactions:

SELECT
    pid,
    age(clock_timestamp(), query_start) AS age,
    query
FROM
    pg_stat_activity
WHERE
    state != 'idle'
ORDER BY
    age DESC;    

