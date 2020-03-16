
-- TaskQueue

-- a tabela TaskQueue não foi alterada de nome!

-- Task

-- alter table Task add column 

-- com.blazon.humantasks.jobs.TaskEscalationPeriodicJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.humantasks.jobs.TaskEscalationPeriodicJob', 
'Task Escalation Periodic Job.', 'Task Escalation Periodic Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Task Escalation Periodic Job' as name, 
	'[{\"name\":\"tasksQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Task Escalation Periodic Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.humantasks.jobs.TaskEscalationPeriodicJob';