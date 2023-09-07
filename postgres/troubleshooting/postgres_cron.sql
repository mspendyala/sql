-- Helpful commands

select * from cron.job_run_details order by start_time desc

select jobid, jobname, schedule from cron.job 

UPDATE cron.job SET schedule = '0 0 1 1 *' WHERE jobid = 7;
