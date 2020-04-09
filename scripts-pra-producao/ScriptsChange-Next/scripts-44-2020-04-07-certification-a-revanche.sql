
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
drop column uncertifiedEntryAction;

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


-- com.blazon.governance.certification.policy.jobs.CertificationPolicyExecutorJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.governance.certification.policy.jobs.CertificationPolicyExecutorJob', 
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
where job.className = 'com.blazon.governance.certification.policy.jobs.CertificationPolicyExecutorJob';


-- CampaignDefinition

alter table CampaignDefinition
drop column enabled;

alter table CampaignDefinition
drop column sla;


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

-- adicionar atributo lastCertificationExecutionDate na Entry

alter table Entry
add column lastCertificationExecutionDate datetime;



