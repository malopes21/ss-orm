
-- CertificationEntry

ALTER TABLE CertificationEntry drop foreign key FK1x242ckfigtodvrmwt2s21i7h;

alter table CertificationEntry
drop column policy_id;

drop table CampaignDefinition_CertificationPolicy;

-- CertificationPolicy

create table CertificationPolicy_CertificationEntry (
    CertificationPolicy_id bigint,
    certificationEntries_id bigint not null,
    primary key (certificationEntries_id)
) ENGINE=InnoDB;

alter table CertificationPolicy_CertificationEntry 
    add constraint FK1qh9ig8lj4gkksk7e9jgxhqbj 
    foreign key (CertificationPolicy_id) 
    references CertificationPolicy (id)
	on delete cascade;

alter table CertificationPolicy_CertificationEntry 
    add constraint FK7t8xqbpon6snfy05aqrysef8g 
    foreign key (certificationEntries_id) 
    references CertificationEntry (id)
	on delete cascade;
	
-- drop column from CertitficationPolicy

alter table CertificationPolicy
drop column limitOfEntriesByExecution;

alter table CertificationPolicy
drop column selectExpiratedEntries;

alter table CertificationPolicy
drop column processedAt;

-- add column to CertitficationPolicy

alter table CertificationPolicy
add column enabled boolean default false;

alter table CertificationPolicy
add column isAutoRevoke boolean default false;

alter table CertificationPolicy
add column position integer;

alter table CertificationPolicy
add column sla integer;


-- com.blazon.governance.certification.types.policies.periodicitybased.jobs.CertificationPolicyExecutorJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.governance.certification.types.policies.periodicitybased.jobs.CertificationPolicyExecutorJob', 
'Certification Policy Executor Job.', 'Certification Policy Executor Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Policy Executor Job' as name, 
	'[{\"name\":\"certificationPolicyQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Policy Executor Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.governance.certification.types.policies.periodicitybased.jobs.CertificationPolicyExecutorJob';


-- CampaignDefinition

alter table CampaignDefinition
drop column enabled;

alter table CampaignDefinition
drop column sla;

alter table CampaignDefinition
drop column lastExecution;


alter table CampaignDefinition
add column deadline datetime;

alter table CampaignDefinition
add column fileContent longtext;

alter table CampaignDefinition
add column finalizedAt datetime;

alter table CampaignDefinition
add column startAt datetime;

alter table CampaignDefinition
add column startedAt datetime;

alter table CampaignDefinition
add column certificationWorkflowName varchar(255);

alter table CampaignDefinition
add column status varchar(255);

-- adicionar atributo lastCertificationExecutionDate na Entry

alter table Entry
add column lastCertificationExecutionDate datetime;


-- com.blazon.governance.certification.campaign.jobs.CertificationCampaignExecutionInstanceJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.governance.certification.campaign.jobs.CertificationCampaignExecutionInstanceJob', 
'Certification Campaign Execution Instance Job.', 'Certification Campaign Execution Instance Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Campaign Execution Instance Job' as name, 
	'[{\"name\":\"instanceQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Campaign Execution Instance Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.governance.certification.campaign.jobs.CertificationCampaignExecutionInstanceJob';


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
UPDATE JobInstance set 
name = 'Certification Campaign Finalize With Deadline Reached Job',
description = 'Certification Campaign Finalize With Deadline Reached Job.',
externalJobDetailId = 'Certification Campaign Finalize With Deadline Reached Job'
where job_id in ( select id from Job where className like '%RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignFinalizeWithDeadlineReachedJob',
description = 'Certification Campaign Finalize With Deadline Reached Job.',
displayName = 'Certification Campaign Finalize With Deadline Reached Job'
where className like '%RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob';

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


-- Remover a tabela CertificationSelector

alter table SelectorExecutionInstance drop foreign key FKrrbdlit9u6jlc2flnnl2krg7o;

alter table CertificationEntry drop foreign key FK5299i3hbcyb6cnhqkscp4lieq;

drop table CertificationSelector;


-- Renomear o atributo selector para policy em SelectorExecutionInstance

alter table SelectorExecutionInstance drop column selector_id;

alter table SelectorExecutionInstance add column policy_id bigint;


-- ajustar os campos de CertificationPolicy

alter table CertificationPolicy drop column certificationObjectType;

alter table CertificationPolicy drop column certificationWorkflowName;

alter table CertificationPolicy drop column criticity;

alter table CertificationPolicy drop column filterObjectType;

alter table CertificationPolicy drop column filterObjectTypeId;

alter table CertificationPolicy drop column numberOfDaysSinceLastCertification;

alter table CertificationPolicy drop column selectAllEntries;

alter table CertificationPolicy drop column selectNotCertifiableEntries;

alter table CertificationPolicy drop column userFilterRules;


alter table CertificationPolicy add column configuration longtext;

alter table CertificationPolicy add column type varchar(255);


-- alter em MicroCertificationExecutionInstance

ALTER TABLE MicroCertificationExecutionInstance
drop COLUMN date;

ALTER TABLE MicroCertificationExecutionInstance
drop COLUMN finalizeDate;

ALTER TABLE MicroCertificationExecutionInstance
add COLUMN createdAt datetime;

ALTER TABLE MicroCertificationExecutionInstance
add COLUMN finalizedAt datetime;

ALTER TABLE MicroCertificationExecutionInstance
add COLUMN startAt datetime;

ALTER TABLE MicroCertificationExecutionInstance
add COLUMN entriesIds varchar(2000);

