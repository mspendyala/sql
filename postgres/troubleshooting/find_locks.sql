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
