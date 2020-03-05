
-- Insert BlazonRequestNotificationSettings

insert into BlazonRequestNotificationSettings (enabled, subject, template, type)
values (false, 'Blazon Created Task Request Notification', '<html><head></head><body></body></html>', 'CREATED_TASK_REQUEST_NOTIFICATION');

-- Insert CertificationNotificationSettings

insert into CertificationNotificationSettings (enabled, subject, template, type)
values (false, 'Blazon Created Task Certification Notification', '<html><head></head><body></body></html>', 'CREATED_TASK_CERTIFICATION_NOTIFICATION');

-- Job AmountCreatedTasksByCategoryMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.tasks.jobs.AmountCreatedTasksByCategoryMonitoringJob', 
'Amount Created Tasks By Category Monitoring Job.', 
'Amount Created Tasks By Category Monitoring Job', null);

-- JobInstances de AmountCreatedTasksByCategoryMonitoringJob

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Created Tasks By (APPROVAL_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"APPROVAL_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Created Tasks By (APPROVAL_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountCreatedTasksByCategoryMonitoringJob';

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Created Tasks By (CERTIFICATION_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"CERTIFICATION_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Created Tasks By (CERTIFICATION_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountCreatedTasksByCategoryMonitoringJob';






