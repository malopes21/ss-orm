
-- CertificationCampaignResumeFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.certification.campaign.CertificationCampaignResumeFactJob', 
'Certification Campaign Resume Fact Job.', 
'Certification Campaign Resume Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Campaign Resume Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Campaign Resume Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.certification.campaign.CertificationCampaignResumeFactJob';


-- CertificationCampaignDetailFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.certification.campaign.CertificationCampaignDetailFactJob', 
'Certification Campaign Detail Fact Job.', 
'Certification Campaign Detail Fact Job', '[{\"name\":\"certificationInstanceQueueLenght\", \"value\":\"100\"}]');

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Campaign Detail Fact Job' as name, 
	'[{\"name\":\"certificationInstanceQueueLenght\", \"value\":\"100\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Campaign Detail Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.certification.campaign.CertificationCampaignDetailFactJob';


-- CertificationMicroResumeFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.certification.micro.CertificationMicroResumeFactJob', 
'Certification Micro Resume Fact Job.', 
'Certification Micro Resume Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Micro Resume Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Micro Resume Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.certification.micro.CertificationMicroResumeFactJob';


-- CertificationMicroDetailFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.certification.micro.CertificationMicroDetailFactJob', 
'Certification Micro Detail Fact Job.', 
'Certification Micro Detail Fact Job', '[{\"name\":\"certificationInstanceQueueLenght\", \"value\":\"100\"}]');

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Micro Detail Fact Job' as name, 
	'[{\"name\":\"certificationInstanceQueueLenght\", \"value\":\"100\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Micro Detail Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.certification.micro.CertificationMicroDetailFactJob';


-- CertificationSelectorResumeFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.certification.selector.CertificationSelectorResumeFactJob', 
'Certification Selector Resume Fact Job.', 
'Certification Selector Resume Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Selector Resume Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Selector Resume Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.certification.selector.CertificationSelectorResumeFactJob';


-- CertificationSelectorDetailFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.certification.selector.CertificationSelectorDetailFactJob', 
'Certification Selector Detail Fact Job.', 
'Certification Selector Detail Fact Job', '[{\"name\":\"certificationInstanceQueueLenght\", \"value\":\"100\"}]');

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Selector Detail Fact Job' as name, 
	'[{\"name\":\"certificationInstanceQueueLenght\", \"value\":\"100\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Selector Detail Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.certification.selector.CertificationSelectorDetailFactJob';


-- CertificationTaskFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.certification.task.CertificationTaskFactJob', 
'Certification Task Fact Job.', 
'Certification Task Fact Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Task Fact Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Task Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.certification.task.CertificationTaskFactJob';


-- CertificationExecutorFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.certification.executor.CertificationExecutorFactJob', 
'Certification Executor Fact Job.', 
'Certification Executor Fact Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Executor Fact Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Executor Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.certification.executor.CertificationExecutorFactJob';




