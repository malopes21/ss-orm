
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
add column processedAt datetime;

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

-- com.blazon.governance.certification.types.policies.periodicitybased.jobs.CertificationPolicyExecutorJob

update Job 
set className = 'com.blazon.governance.certification.types.policies.periodicitybased.jobs.CertificationPolicyExecutorJob'
where className like '%CertificationPolicyExecutorJob';


-- com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignExecutionInstanceJob

update Job 
set className = 'com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignExecutionInstanceJob'
where className like '%CertificationCampaignExecutionInstanceJob';


-- com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignFinalizeJob	

update Job 
set className = 'com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignFinalizeJob'
where className like '%CertificationCampaignFinalizeJob';


-- com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignStartJob

update Job 
set className = 'com.blazon.governance.certification.types.campaigns.jobs.CertificationCampaignStartJob'
where className like '%CertificationCampaignStartJob';


-- com.blazon.governance.certification.types.campaigns.jobs.RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob

update Job 
set className = 'com.blazon.governance.certification.types.campaigns.jobs.RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob'
where className like '%RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob';


-- com.blazon.governance.certification.types.policies.jobs.CertificationPolicyExecutorJob

update Job 
set className = 'com.blazon.governance.certification.types.policies.jobs.CertificationPolicyExecutorJob'
where className like '%CertificationPolicyExecutorJob';


-- com.blazon.governance.certification.process.statemachine.jobs.CertificationQueueJob

update Job 
set className = 'com.blazon.governance.certification.process.statemachine.jobs.CertificationQueueJob'
where className like '%CertificationQueueJob';


-- com.blazon.governance.certification.process.statemachine.jobs.CertificationRevokeExecutionQueueJob

update Job 
set className = 'com.blazon.governance.certification.process.statemachine.jobs.CertificationRevokeExecutionQueueJob'
where className like '%CertificationRevokeExecutionQueueJob';


-- com.blazon.governance.certification.types.policies.userattributeschangebased.instance.jobs.CertificationSelectorExecutionInstanceFinalizeJob

update Job 
set className = 'com.blazon.governance.certification.types.policies.userattributeschangebased.instance.jobs.CertificationSelectorExecutionInstanceFinalizeJob'
where className like '%CertificationSelectorExecutionInstanceFinalizeJob';


-- com.blazon.governance.certification.types.policies.userattributeschangebased.instance.jobs.RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob

update Job 
set className = 'com.blazon.governance.certification.types.policies.userattributeschangebased.instance.jobs.RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob'
where className like '%RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob';


-- com.blazon.governance.certification.types.micro.jobs.MicroCertificationExecutionInstanceFinalizeJob

update Job 
set className = 'com.blazon.governance.certification.types.micro.jobs.MicroCertificationExecutionInstanceFinalizeJob'
where className like '%MicroCertificationExecutionInstanceFinalizeJob';


-- com.blazon.governance.certification.types.micro.jobs.RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob

update Job 
set className = 'com.blazon.governance.certification.types.micro.jobs.RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob'
where className like '%RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob';


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



