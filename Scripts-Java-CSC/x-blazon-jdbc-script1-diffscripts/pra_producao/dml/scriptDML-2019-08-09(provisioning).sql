-- script26.txt

-- ProvisioningWaitingAssignToTaskQueueExecutionJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.provisioning.jobs.ProvisioningWaitingAssignToTaskQueueExecutionJob', 'Provisioning Waiting Assign To TaskQueue Execution Job.', 'Provisioning Waiting Assign To TaskQueue Execution Job', '[{\"name\":\"provisioningEntriesQueueLength\", \"value\":\"10\"}]');

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Provisioning Waiting Assign To TaskQueue Execution Job' as name, 
	'[{\"name\":\"provisioningEntriesQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Provisioning Waiting Assign To TaskQueue Execution Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.provisioning.jobs.ProvisioningWaitingAssignToTaskQueueExecutionJob';

