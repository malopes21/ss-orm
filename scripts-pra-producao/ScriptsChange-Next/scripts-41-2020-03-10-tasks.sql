
-- Task

alter table Task add column assignedTo_id bigint; 

alter table Task add column currentQueue_id bigint;

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


-- com.blazon.humantasks.autoescalation.jobs.FindTasksReadyToCancelationJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.humantasks.autoescalation.jobs.FindTasksReadyToCancelationJob', 
'Find Tasks Ready To Cancelation Job.', 'Find Tasks Ready To Cancelation Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Find Tasks Ready To Cancelation Job' as name, 
	'[{\"name\":\"tasksQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Find Tasks Ready To Cancelation Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.humantasks.autoescalation.jobs.FindTasksReadyToCancelationJob';


-- com.blazon.humantasks.autoescalation.jobs.FindTasksToWaitingEscalationJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.humantasks.autoescalation.jobs.FindTasksToWaitingEscalationJob', 
'Find Tasks To Waiting Escalation Job.', 'Find Tasks To Waiting Escalation Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Find Tasks To Waiting Escalation Job' as name, 
	'[{\"name\":\"tasksQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Find Tasks To Waiting Escalation Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.humantasks.autoescalation.jobs.FindTasksToWaitingEscalationJob';


-- com.blazon.humantasks.autoescalation.jobs.ResolveTasksInWaitingEscalationJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.humantasks.autoescalation.jobs.ResolveTasksInWaitingEscalationJob', 
'Resolve Tasks In Waiting Escalation Job.', 'Resolve Tasks In Waiting Escalation Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Resolve Tasks In Waiting Escalation Job' as name, 
	'[{\"name\":\"tasksQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Resolve Tasks In Waiting Escalation Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.humantasks.autoescalation.jobs.ResolveTasksInWaitingEscalationJob';


-- TaskQueueAssignHistory

create table TaskQueueAssignHistory (
	id bigint not null auto_increment,
	assign_date datetime,
	from_id bigint,
	task_id bigint,
	to_id bigint,
	primary key (id)
) ENGINE=InnoDB;

