-- ajuste de paths de jobs

-- CAMPAIGN: com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignExecutionInstanceJob

update Job 
set className = 'com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignExecutionInstanceJob'
where className like '%CertificationCampaignExecutionInstanceJob';


-- CAMPAIGN: com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignFinalizeJob	

update Job 
set className = 'com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignFinalizeJob'
where className like '%CertificationCampaignFinalizeJob';


-- CAMPAIGN: com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignStartJob

update Job 
set className = 'com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignStartJob'
where className like '%CertificationCampaignStartJob';


-- CAMPAIGN: com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignFinalizeWithDeadlineReachedJob

update Job 
set className = 'com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignFinalizeWithDeadlineReachedJob',
description = 'Certification Campaign Finalize With Deadline Reached Job.',
displayName = 'Certification Campaign Finalize With Deadline Reached Job'
where className like '%RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob';

UPDATE JobInstance set 
name = 'Certification Campaign Finalize With Deadline Reached Job',
description = 'Certification Campaign Finalize With Deadline Reached Job.',
externalJobDetailId = 'Certification Campaign Finalize With Deadline Reached Job'
where job_id in ( select id from Job where className like '%RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob');


-- CAMPAIGN: com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignSearchWithDeadlineReachedJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignSearchWithDeadlineReachedJob', 
'Certification Campaign Search With Deadline Reached Job.', 'Certification Campaign Search With Deadline Reached Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Campaign Search With Deadline Reached Job' as name, 
	'[{\"name\":\"certificationQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Campaign Search With Deadline Reached Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignSearchWithDeadlineReachedJob';


-- POLICY_PERIODICITY: com.blazon.governance.certification.types.policies.periodicitybased.jobs.CertificationPolicyPeriodicityExecutorJob

UPDATE JobInstance set 
name = 'Certification Policy Periodicity Executor Job',
description = 'Certification Policy Periodicity Executor Job.',
externalJobDetailId = 'Certification Policy Periodicity Executor Job'
where job_id in ( select id from Job where className like '%CertificationPolicyExecutorJob');

update Job 
set className = 'com.blazon.governance.certification.types.policies.periodicitybased.jobs.CertificationPolicyPeriodicityExecutorJob',
description = 'Certification Policy Periodicity Executor Job.',
displayName = 'Certification Policy Periodicity Executor Job'
where className like '%CertificationPolicyExecutorJob';


-- POLICY_PERIODICITY: com.blazon.governance.certification.types.policies.periodicitybased.jobs.CertificationPolicyPeriodicityFinalizeWithDeadlineReachedJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.governance.certification.types.policies.periodicitybased.jobs.CertificationPolicyPeriodicityFinalizeWithDeadlineReachedJob', 
'Certification Policy Periodicity Finalize With Deadline Reached Job.', 'Certification Policy Periodicity Finalize With Deadline Reached Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Policy Periodicity Finalize With Deadline Reached Job' as name, 
	'[{\"name\":\"certificationQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Policy Periodicity Finalize With Deadline Reached Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.governance.certification.types.policies.periodicitybased.jobs.CertificationPolicyPeriodicityFinalizeWithDeadlineReachedJob';


-- POLICY_USER_CHANGE: com.blazon.governance.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeExecutionInstanceFinalizeJob

UPDATE JobInstance set 
name = 'Certification Policy User Change Execution Instance Finalize Job',
description = 'Certification Policy User Change Execution Instance Finalize Job.',
externalJobDetailId = 'Certification Policy User Change Execution Instance Finalize Job'
where job_id in ( select id from Job where className like '%CertificationSelectorExecutionInstanceFinalizeJob');

update Job 
set className = 'com.blazon.governance.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeExecutionInstanceFinalizeJob',
description = 'Certification Policy User Change Execution Instance Finalize Job.',
displayName = 'Certification Policy User Change Execution Instance Finalize Job'
where className like '%CertificationSelectorExecutionInstanceFinalizeJob';


-- POLICY_USER_CHANGE: com.blazon.governance.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeFinalizeWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Certification Policy User Change Finalize With Deadline Reached Job',
description = 'Certification Policy User Change Finalize With Deadline Reached Job.',
externalJobDetailId = 'Certification Policy User Change Finalize With Deadline Reached Job',
params = '[{\"name\":\"certificationQueueLength\", \"value\":\"10\"}]'
where job_id in ( select id from Job where className like '%RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.governance.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeFinalizeWithDeadlineReachedJob',
description = 'Certification Policy User Change Finalize With Deadline Reached Job.',
displayName = 'Certification Policy User Change Finalize With Deadline Reached Job'
where className like '%RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob';


-- POLICY_USER_CHANGE: com.blazon.governance.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeSearchWithDeadlineReachedJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.governance.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeSearchWithDeadlineReachedJob', 
'Certification Policy User Change Search With Deadline Reached Job.', 'Certification Policy User Change Search With Deadline Reached Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Policy User Change Search With Deadline Reached Job' as name, 
	'[{\"name\":\"certificationQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Policy User Change Search With Deadline Reached Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.governance.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeSearchWithDeadlineReachedJob';


-- MICRO: com.blazon.governance.certification.types.micro.jobs.MicroCertificationExecutionInstanceFinalizeJob

UPDATE JobInstance set 
name = 'Micro Certification Execution Instance Finalize Job',
description = 'Micro Certification Execution Instance Finalize Job.',
externalJobDetailId = 'Micro Certification Execution Instance Finalize Job',
params = '[{\"name\":\"certificationQueueLength\", \"value\":\"10\"}]'
where job_id in ( select id from Job where className like '%MicroCertificationExecutionInstanceFinalizeJob');

update Job 
set className = 'com.blazon.governance.certification.types.micro.jobs.MicroCertificationExecutionInstanceFinalizeJob',
description = 'Micro Certification Execution Instance Finalize Job.',
displayName = 'Micro Certification Execution Instance Finalize Job'
where className like '%MicroCertificationExecutionInstanceFinalizeJob';


-- MICRO: com.blazon.governance.certification.types.micro.jobs.MicroCertificationFinalizeWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Micro Certification Finalize With Deadline Reached Job',
description = 'Micro Certification Finalize With Deadline Reached Job.',
externalJobDetailId = 'Micro Certification Finalize With Deadline Reached Job',
params = '[{\"name\":\"certificationQueueLength\", \"value\":\"10\"}]'
where job_id in ( select id from Job where className like '%RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.governance.certification.types.micro.jobs.MicroCertificationFinalizeWithDeadlineReachedJob',
description = 'Micro Certification Finalize With Deadline Reached Job.',
displayName = 'Micro Certification Finalize With Deadline Reached Job'
where className like '%RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob';


-- MICRO: com.blazon.governance.certification.types.micro.jobs.MicroCertificationExecutionInstanceStartJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.governance.certification.types.micro.jobs.MicroCertificationExecutionInstanceStartJob', 
'Micro Certification Execution Instance Start Job.', 'Micro Certification Execution Instance Start Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Micro Certification Execution Instance Start Job' as name, 
	'[{\"name\":\"certificationQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Micro Certification Execution Instance Start Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.governance.certification.types.micro.jobs.MicroCertificationExecutionInstanceStartJob';	


-- MICRO: com.blazon.governance.certification.types.micro.jobs.MicroCertificationSearchWithDeadlineReachedJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.governance.certification.types.micro.jobs.MicroCertificationSearchWithDeadlineReachedJob', 
'Micro Certification Search With Deadline Reached Job.', 'Micro Certification Search With Deadline Reached Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Micro Certification Search With Deadline Reached Job' as name, 
	'[{\"name\":\"certificationQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Micro Certification Search With Deadline Reached Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.governance.certification.types.micro.jobs.MicroCertificationSearchWithDeadlineReachedJob';	

-- CERTIFICATION_ENTRY: com.blazon.governance.certification.process.statemachine.jobs.CertificationQueueJob

update Job 
set className = 'com.blazon.governance.certification.process.statemachine.jobs.CertificationQueueJob'
where className like '%CertificationQueueJob';


-- CERTIFICATION_ENTRY: com.blazon.governance.certification.process.statemachine.jobs.CertificationRevokeExecutionQueueJob

update Job 
set className = 'com.blazon.governance.certification.process.statemachine.jobs.CertificationRevokeExecutionQueueJob'
where className like '%CertificationRevokeExecutionQueueJob';


-- CERTIFICATION_ENTRY: com.blazon.governance.certification.process.statemachine.jobs.CertificationCancelExecutionQueueJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.governance.certification.process.statemachine.jobs.CertificationCancelExecutionQueueJob', 
'Certification Cancel Execution Queue Job.', 'Certification Cancel Execution Queue Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Cancel Execution Queue Job' as name, 
	'[{\"name\":\"certificationQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Cancel Execution Queue Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.governance.certification.process.statemachine.jobs.CertificationCancelExecutionQueueJob';	

