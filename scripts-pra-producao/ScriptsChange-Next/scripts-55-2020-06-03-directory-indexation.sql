
-- Entry

alter table Entry add column directoryIndexationSynchronized boolean default false;

alter table Resource add column directoryIndexationSynchronized boolean default false;


-- com.blazon.adminconsole.indexation.jobs.DirectoryEntitlementIndexationJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.adminconsole.indexation.jobs.DirectoryEntitlementIndexationJob', 
'Directory Entitlement Indexation Job.', 'Directory Entitlement Indexation Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Directory Entitlement Indexation Job' as name, 
	'[{\"name\":\"itemsQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Directory Entitlement Indexation Job' as externalGroupId,
	'Directory Entitlement Indexation Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.adminconsole.indexation.jobs.DirectoryEntitlementIndexationJob';	


-- com.blazon.adminconsole.indexation.jobs.DirectoryResourceIndexationJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.adminconsole.indexation.jobs.DirectoryResourceIndexationJob', 
'Directory Resource Indexation Job.', 'Directory Resource Indexation Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Directory Resource Indexation Job' as name, 
	'[{\"name\":\"itemsQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Directory Resource Indexation Job' as externalGroupId,
	'Directory Resource Indexation Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.adminconsole.indexation.jobs.DirectoryResourceIndexationJob';


-- com.blazon.adminconsole.indexation.jobs.DirectoryRoleIndexationJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.adminconsole.indexation.jobs.DirectoryRoleIndexationJob', 
'Directory Role Indexation Job.', 'Directory Role Indexation Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Directory Role Indexation Job' as name, 
	'[{\"name\":\"itemsQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Directory Role Indexation Job' as externalGroupId,
	'Directory Role Indexation Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.adminconsole.indexation.jobs.DirectoryRoleIndexationJob';


-- com.blazon.adminconsole.indexation.jobs.DirectoryUserIndexationJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.adminconsole.indexation.jobs.DirectoryUserIndexationJob', 
'Directory User Indexation Job.', 'Directory User Indexation Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Directory User Indexation Job' as name, 
	'[{\"name\":\"itemsQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Directory User Indexation Job' as externalGroupId,
	'Directory User Indexation Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.adminconsole.indexation.jobs.DirectoryUserIndexationJob';



