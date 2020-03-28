
-- Job ProvisioningEntryFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.provisioning.ProvisioningEntryFactJob', 
'Provisioning Entry Fact Job.', 
'Provisioning Entry Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Provisioning Entry Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Provisioning Entry Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningEntryFactJob';


-- Job ProvisioningTaskFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskFactJob', 
'Provisioning Task Fact Job.', 
'Provisioning Task Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Provisioning Task Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Provisioning Task Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskFactJob';

-- Job ProvisioningTaskExecutorFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskExecutorFactJob', 
'Provisioning Task Executor Fact Job.', 
'Provisioning Task Executor Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Provisioning Task Executor Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Provisioning Task Executor Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskExecutorFactJob';

-- Job ProvisioningTaskQueueFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskQueueFactJob', 
'Provisioning Task Queue Fact Job.', 
'Provisioning Task Queue Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Provisioning Task Queue Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Provisioning Task Queue Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskQueueFactJob';



