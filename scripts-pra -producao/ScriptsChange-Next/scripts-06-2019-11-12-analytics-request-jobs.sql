
-- Job RequestResumeFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.request.RequestResumeFactJob', 
'Request Resume Fact Job.', 
'Request Resume Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Request Resume Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Request Resume Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.request.RequestResumeFactJob';


-- Job RequestApprovalTaskFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.request.RequestApprovalTaskFactJob', 
'Request Approval Task Fact Job.', 
'Request Approval Task Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Request Approval Task Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Request Approval Task Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.request.RequestApprovalTaskFactJob';


-- Job RequestApprovalTaskExecutorFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.request.RequestApprovalTaskExecutorFactJob', 
'Request Approval Task Executor Fact Job.', 
'Request Approval Task Executor Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Request Approval Task Executor Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Request Approval Task Executor Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.request.RequestApprovalTaskExecutorFactJob';



