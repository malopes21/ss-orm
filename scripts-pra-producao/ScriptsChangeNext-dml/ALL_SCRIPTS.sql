
-- ServerMailSetup

ALTER TABLE ServerMailSetup
MODIFY COLUMN needAuthentication varchar(255);

UPDATE ServerMailSetup
SET needAuthentication = IF(needAuthentication > 0, 'AUTHENTICATION_REQUIRED', 'AUTHENTICATION_NOT_REQUIRED')
WHERE needAuthentication IS NOT NULL;

-- SecretQuestion

alter table SecretQuestion
add column beanshell boolean default false;

alter table SecretQuestion
modify column answer longtext;




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




-- Job ReconciliationResumeFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.reconciliation.ReconciliationResumeFactJob', 
'Reconciliation Resume Fact Job.', 
'Reconciliation Resume Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Reconciliation Resume Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Reconciliation Resume Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationResumeFactJob';


-- Job ReconciliationSituationFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob', 
'Reconciliation Situation Fact Job.', 
'Reconciliation Situation Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Reconciliation Situation Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Reconciliation Situation Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob';




-- ReconciliationBatchEntry

create table ReconciliationBatchEntry (
    batchId varchar(255) not null,
    amount bigint,
    finalizedDate datetime,
    profileId bigint,
    profileName varchar(255),
    startDate datetime,
    status varchar(255),
    primary key (batchId)
) ENGINE=InnoDB;

-- Job ReconciliationBatchEntryCertifierJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.reconciliation.jobs.ReconciliationBatchEntryCertifierJob', 
'Reconciliation Batch Entry Certifier Job.', 
'Reconciliation Batch Entry Certifier Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Reconciliation Batch Entry Certifier Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Reconciliation Batch Entry Certifier Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.reconciliation.jobs.ReconciliationBatchEntryCertifierJob';





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




-- CampaignDefinition

create table CampaignDefinition (
    id bigint not null auto_increment,
    description varchar(255),
    enabled boolean default false,
    lastExecution datetime,
    name varchar(255),
    sla integer,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table CampaignDefinition_CertificationPolicy (
    CampaignDefinition_id bigint not null,
    policies_id bigint not null
) ENGINE=InnoDB;

alter table CampaignDefinition_CertificationPolicy 
    add constraint FKas66va1cvim2nfnk3ktlm5kj9 
    foreign key (policies_id) 
    references CertificationPolicy (id)
	on delete cascade;

alter table CampaignDefinition_CertificationPolicy 
    add constraint FKko0ibm9slpc7iifbxmistfd2y 
    foreign key (CampaignDefinition_id) 
    references CampaignDefinition (id)
	on delete cascade;

-- CampaignExecutionInstance

create table CampaignExecutionInstance (
    id bigint not null auto_increment,
    date datetime,
    deadline datetime,
    finalizeDate datetime,
    status varchar(255),
    campaign_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table CampaignExecutionInstance_CertificationEntry (
    CampaignExecutionInstance_id bigint not null,
    certificationEntries_id bigint not null
) ENGINE=InnoDB;

alter table CampaignExecutionInstance 
    add constraint FKtkbluunr5y46x411vhu6rmrx6 
    foreign key (campaign_id) 
    references CampaignDefinition (id)
	on delete cascade;

alter table CampaignExecutionInstance_CertificationEntry 
    add constraint FK2fr87upivbvhydyvk9p65efd4 
    foreign key (certificationEntries_id) 
    references CertificationEntry (id)
	on delete cascade;

alter table CampaignExecutionInstance_CertificationEntry 
    add constraint FKd58k3coi84soje4v4dmtjx0ew 
    foreign key (CampaignExecutionInstance_id) 
    references CampaignExecutionInstance (id)
	on delete cascade;

-- MicroCertificationExecutionInstance

create table MicroCertificationExecutionInstance (
    id bigint not null auto_increment,
    certificationObjectType varchar(255),
    date datetime,
    deadline datetime,
    description varchar(255),
    finalizeDate datetime,
    name varchar(255),
    status varchar(255),
    uncertifiedEntryAction varchar(255),
    userDisplayName varchar(255),
    userId bigint,
    username varchar(255),
    workflow varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table MicroCertificationExecutionInstance_CertificationEntry (
    MicroCertificationExecutionInstance_id bigint not null,
    certificationEntries_id bigint not null
) ENGINE=InnoDB;

alter table MicroCertificationExecutionInstance_CertificationEntry 
    add constraint FKjho3y20utbq766xmu17il5p6u 
    foreign key (certificationEntries_id) 
    references CertificationEntry (id)
	on delete cascade;

alter table MicroCertificationExecutionInstance_CertificationEntry 
    add constraint FKaoy8889nji3s0ql5dv1k35ydj 
    foreign key (MicroCertificationExecutionInstance_id) 
    references MicroCertificationExecutionInstance (id)
	on delete cascade;

-- SelectorExecutionInstance

create table SelectorExecutionInstance (
    id bigint not null auto_increment,
    date datetime,
    deadline datetime,
    finalizeDate datetime,
    status varchar(255),
    userDisplayName varchar(255),
    userId bigint,
    username varchar(255),
    selector_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table SelectorExecutionInstance_CertificationEntry (
    SelectorExecutionInstance_id bigint not null,
    certificationEntries_id bigint not null
) ENGINE=InnoDB;

alter table SelectorExecutionInstance 
    add constraint FKrrbdlit9u6jlc2flnnl2krg7o 
    foreign key (selector_id) 
    references CertificationSelector (id)
	on delete cascade;

alter table SelectorExecutionInstance_CertificationEntry 
    add constraint FKdiiyx2qaftrh6wpo8v1qvys2i 
    foreign key (certificationEntries_id) 
    references CertificationEntry (id)
	on delete cascade;

alter table SelectorExecutionInstance_CertificationEntry 
    add constraint FKrymnpcwvdj9mfjor2fx1hmgxh 
    foreign key (SelectorExecutionInstance_id) 
    references SelectorExecutionInstance (id)
	on delete cascade;

-- CertificationSelector

alter table CertificationSelector
	add column sla integer;

    
-- Job CertificationRecurrentCampaignStartJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.campaign.jobs.CertificationRecurrentCampaignStartJob', 
'Certification Recurrent Campaign Start Job.', 
'Certification Recurrent Campaign Start Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Recurrent Campaign Start Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Recurrent Campaign Start Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.campaign.jobs.CertificationRecurrentCampaignStartJob';


-- Job CertificationRunsOnceOnlyCampaignStartJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.campaign.jobs.CertificationRunsOnceOnlyCampaignStartJob', 
'Certification Runs Once Only Campaign Start Job.', 
'Certification Runs Once Only Campaign Start Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Runs Once Only Campaign Start Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Runs Once Only Campaign Start Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.campaign.jobs.CertificationRunsOnceOnlyCampaignStartJob';


-- Job CertificationCampaignFinalizeJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.campaign.jobs.CertificationCampaignFinalizeJob', 
'Certification Campaign Finalize Job.', 
'Certification Campaign Finalize Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Campaign Finalize Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Campaign Finalize Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.campaign.jobs.CertificationCampaignFinalizeJob';


-- Job CertificationSelectorExecutionInstanceFinalizeJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.selector.jobs.CertificationSelectorExecutionInstanceFinalizeJob', 
'Certification Selector Execution Instance Finalize Job.', 
'Certification Selector Execution Instance Finalize Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Certification Selector Execution Instance Finalize Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Certification Selector Execution Instance Finalize Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.selector.jobs.CertificationSelectorExecutionInstanceFinalizeJob';


-- Job MicroCertificationExecutionInstanceFinalizeJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.micro.jobs.MicroCertificationExecutionInstanceFinalizeJob', 
'Micro Certification Execution Instance Finalize Job.', 
'Micro Certification Execution Instance Finalize Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Micro Certification Execution Instance Finalize Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Micro Certification Execution Instance Finalize Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.micro.jobs.MicroCertificationExecutionInstanceFinalizeJob	';


-- CertificationPolicy

alter table CertificationPolicy
drop column enabled;




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




DROP TABLE ANALYTICS_CERTIFICATION_FACT;

DROP TABLE ANALYTICS_PROVISIONING_CREATED_ENTRY_FACT;

DROP TABLE ANALYTICS_PROVISIONING_DETAIL_FACT;

DROP TABLE ANALYTICS_PROVISIONING_FACT;

DROP TABLE ANALYTICS_PROVISIONING_FINISHED_ENTRY_FACT;

DROP TABLE ANALYTICS_PROVISIONING_TASK_FACT;

DROP TABLE ANALYTICS_RECONCILIATION_FACT;

DROP TABLE ANALYTICS_RECONCILIATION_SITUATION_DIMENSION;

DROP TABLE ANALYTICS_RECONCILIATION_SITUATION_FACT;

DROP TABLE ANALYTICS_REQUEST_APPROVAL_TASK_DETAIL_FACT;

DROP TABLE ANALYTICS_REQUEST_AVERAGE_FACT;

DROP TABLE ANALYTICS_REQUEST_DETAIL_CREATED_GENERAL_FACT;

DROP TABLE ANALYTICS_REQUEST_DETAIL_CREATED_MANUAL_FACT;

DROP TABLE ANALYTICS_REQUEST_DETAIL_CREATED_SYSTEM_FACT;

DROP TABLE ANALYTICS_REQUEST_DETAIL_FACT;

DROP TABLE ANALYTICS_REQUEST_DETAIL_FINALIZED_GENERAL_FACT;

DROP TABLE ANALYTICS_REQUEST_DETAIL_FINALIZED_MANUAL_FACT;

DROP TABLE ANALYTICS_REQUEST_DETAIL_FINALIZED_SYSTEM_FACT;

DROP TABLE ANALYTICS_REQUEST_FACT;

DROP TABLE ANALYTICS_REQUEST_FASTEST_APPROVERS;

DROP TABLE ANALYTICS_REQUEST_HIGH_AMOUNT_APPROVERS;

DROP TABLE ANALYTICS_REQUEST_LESS_AMOUNT_APPROVERS;

DROP TABLE ANALYTICS_REQUEST_SLOWEST_APPROVERS;

DROP TABLE ANALYTICS_TASK_DAILY_FACT;

DROP TABLE ANALYTICS_TASK_DEADLINE_FACT;

DROP TABLE ANALYTICS_TASK_FACT;

DROP TABLE ANALYTICS_TASK_QUEUE_FACT;


-- jobs a serem deletados:

-- com.blazon.analytics.etl.jobs.certification.CertificationFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.certification.CertificationFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.certification.CertificationFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.certification.CertificationFactJob';


-- com.blazon.analytics.etl.jobs.provisioning.ProvisioningCreatedEntryFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningCreatedEntryFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningCreatedEntryFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningCreatedEntryFactJob';


-- com.blazon.analytics.etl.jobs.provisioning.ProvisioningDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningDetailFactJob';


-- com.blazon.analytics.etl.jobs.provisioning.ProvisioningFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFactJob';


-- com.blazon.analytics.etl.jobs.provisioning.ProvisioningFinishedEntryFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFinishedEntryFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFinishedEntryFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFinishedEntryFactJob';


-- com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskFactJob';


-- com.blazon.analytics.etl.jobs.reconciliation.ReconciliationFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationFactJob';


-- com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob 

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob';


-- com.blazon.analytics.etl.jobs.request.CreatedGeneralRequestsDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.CreatedGeneralRequestsDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.CreatedGeneralRequestsDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.CreatedGeneralRequestsDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.CreatedManualRequestsDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.CreatedManualRequestsDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.CreatedManualRequestsDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.CreatedManualRequestsDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.CreatedSystemRequestsDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.CreatedSystemRequestsDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.CreatedSystemRequestsDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.CreatedSystemRequestsDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.FinalizedGeneralRequestsDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.FinalizedGeneralRequestsDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.FinalizedGeneralRequestsDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.FinalizedGeneralRequestsDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.FinalizedManualRequestsDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.FinalizedManualRequestsDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.FinalizedManualRequestsDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.FinalizedManualRequestsDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.FinalizedSystemRequestsDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.FinalizedSystemRequestsDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.FinalizedSystemRequestsDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.FinalizedSystemRequestsDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.RequestApprovalDetailsJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.RequestApprovalDetailsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.RequestApprovalDetailsJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.RequestApprovalDetailsJob';


-- com.blazon.analytics.etl.jobs.request.RequestAverageFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.RequestAverageFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.RequestAverageFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.RequestAverageFactJob';


-- com.blazon.analytics.etl.jobs.request.RequestDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.RequestDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.RequestDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.RequestDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.RequestFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.RequestFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.RequestFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.RequestFactJob';


-- com.blazon.analytics.etl.jobs.task.TaskDailyFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.task.TaskDailyFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.task.TaskDailyFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.task.TaskDailyFactJob';


-- com.blazon.analytics.etl.jobs.task.TaskDeadlineFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.task.TaskDeadlineFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.task.TaskDeadlineFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.task.TaskDeadlineFactJob';


-- com.blazon.analytics.etl.jobs.task.TaskFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.task.TaskFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.task.TaskFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.task.TaskFactJob';


-- com.blazon.analytics.etl.jobs.task.TaskQueueFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.task.TaskQueueFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.task.TaskQueueFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.task.TaskQueueFactJob';




-- create table ANALYTICS (version 2.0)

create table ANALYTICS_CERTIFICATION_CAMPAIGN_DETAIL_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_CAMPAIGN_DETAIL_POLICY_DIMENSION_ID bigint,
    CERTIFICATION_CAMPAIGN_RESUME_FACT_ID bigint,
    amountCanceled bigint,
    amountCertified bigint,
    amountError bigint,
    amountOpen bigint,
    amountRevoked bigint,
    averageTime bigint,
    date datetime,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_CAMPAIGN_POLICY_DIMENSION (
    id bigint not null auto_increment,
    policyId bigint,
    policyName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_CAMPAIGN_RESUME_FACT (
    id bigint not null auto_increment,
    amountCertificationEntries bigint,
    creationDate datetime,
    date datetime,
    deadline datetime,
    finalizeDate datetime,
    instanceId bigint,
    lastDetailDiscovery datetime,
    name varchar(255),
    slaReached bit,
    status varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_EXECUTOR_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_EXECUTOR_ENTRYTYPE_DIMENSION varchar(255),
    CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION_ID bigint,
    CERTIFICATION_EXECUTOR_USER_DIMENSION_ID bigint,
    amountCertified bigint,
    amountOpen bigint,
    amountRevoked bigint,
    averageTime bigint,
    date datetime,
    finalized bigint,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION (
    id bigint not null auto_increment,
    instanceId bigint,
    instanceName varchar(255),
    instanceType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_EXECUTOR_USER_DIMENSION (
    id bigint not null auto_increment,
    displayname varchar(255),
    userId bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_MICRO_DETAIL_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_MICRO_RESUME_FACT_ID bigint,
    amountCanceled bigint,
    amountCertified bigint,
    amountError bigint,
    amountOpen bigint,
    amountRevoked bigint,
    averageTime bigint,
    date datetime,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_MICRO_RESUME_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_MICRO_ENTRYTYPE_DIMENSION varchar(255),
    amountCertificationEntries bigint,
    creationDate datetime,
    date datetime,
    deadline datetime,
    finalizeDate datetime,
    instanceId bigint,
    lastDetailDiscovery datetime,
    name varchar(255),
    slaReached bit,
    status varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_SELECTOR_DETAIL_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_SELECTOR_ENTRYTYPE_DIMENSION varchar(255),
    CERTIFICATION_SELECTOR_RESUME_FACT_ID bigint,
    amountCanceled bigint,
    amountCertified bigint,
    amountError bigint,
    amountOpen bigint,
    amountRevoked bigint,
    averageTime bigint,
    date datetime,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_SELECTOR_RESUME_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_SELECTOR_SELECTOR_DIMENSION_ID bigint,
    CERTIFICATION_SELECTOR_USER_DIMENSION_ID bigint,
    amountCertificationEntries bigint,
    creationDate datetime,
    date datetime,
    deadline datetime,
    finalizeDate datetime,
    instanceId bigint,
    lastDetailDiscovery datetime,
    name varchar(255),
    slaReached bit,
    status varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_SELECTOR_SELECTOR_DIMENSION (
    id bigint not null auto_increment,
    selectorId bigint,
    selectorName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_SELECTOR_USER_DIMENSION (
    id bigint not null auto_increment,
    displayName varchar(255),
    userId bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_TASK_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_TASK_ENTRYTYPE_DIMENSION varchar(255),
    CERTIFICATION_TASK_INSTANCE_DIMENSION_ID bigint,
    amountOpen bigint,
    averageTime bigint,
    certified bigint,
    created bigint,
    date datetime,
    revoked bigint,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_TASK_INSTANCE_DIMENSION (
    id bigint not null auto_increment,
    instanceId bigint,
    instanceType varchar(255),
    primary key (id)
) ENGINE=InnoDB;


create table ANALYTICS_PROVISIONING_ENTRY_ENTRY_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_ENTRY_FACT (
    id bigint not null auto_increment,
    PROVISIONING_ENTRY_ENTRY_DIMENSION_ID bigint,
    PROVISIONING_ENTRY_OPERATION_DIMENSION_ID bigint,
    PROVISIONING_ENTRY_TYPE_DIMENSION_ID bigint,
    averageTime bigint,
    created bigint,
    date datetime,
    errorFinalized bigint,
    open bigint,
    successFinalized bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_ENTRY_OPERATION_DIMENSION (
    id bigint not null auto_increment,
    operation varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_ENTRY_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_ENTRY_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_EXECUTOR_ENTRY_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_EXECUTOR_FACT (
    id bigint not null auto_increment,
    PROVISIONING_TASK_EXECUTOR_ENTRY_DIMENSION_ID bigint,
    PROVISIONING_TASK_EXECUTOR_TYPE_DIMENSION_ID bigint,
    PROVISIONING_TASK_EXECUTOR_USER_DIMENSION_ID bigint,
    averageTime bigint,
    date datetime,
    finalized bigint,
    open bigint,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_EXECUTOR_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_EXECUTOR_USER_DIMENSION (
    id bigint not null auto_increment,
    displayName varchar(255),
    userId bigint,
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_FACT (
    id bigint not null auto_increment,
    PROVISIONING_TASK_ENTRY_DIMENSION_ID bigint,
    PROVISIONING_TASK_TYPE_DIMENSION_ID bigint,
    amountDone bigint,
    amountTodo bigint,
    amountWaitingAssign bigint,
    averageTime bigint,
    created bigint,
    date datetime,
    notProvisioned bigint,
    provisioned bigint,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_QUEUE_ENTRY_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_QUEUE_FACT (
    id bigint not null auto_increment,
    PROVISIONING_TASK_QUEUE_ENTRY_DIMENSION_ID bigint,
    PROVISIONING_TASK_QUEUE_NAME_DIMENSION_ID bigint,
    PROVISIONING_TASK_QUEUE_TYPE_DIMENSION_ID bigint,
    amount bigint,
    averageTimeOnQueue bigint,
    date datetime,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_QUEUE_NAME_DIMENSION (
    id bigint not null auto_increment,
    queue varchar(255),
    queueId bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_QUEUE_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_RESUME_BATCH_DIMENSION (
    id bigint not null auto_increment,
    batch varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_RESUME_FACT (
    id bigint not null auto_increment,
    RECONCILIATION_RESUME_BATCH_DIMENSION_ID bigint,
    RECONCILIATION_RESUME_PROFILE_DIMENSION_ID bigint,
    RECONCILIATION_RESUME_RESOURCE_DIMENSION_ID bigint,
    averageTime bigint,
    conflictResolved bigint,
    created bigint,
    date datetime,
    errorFinalized bigint,
    processedWithoutAction bigint,
    successFinalized bigint,
    waitingManualAction bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_RESUME_PROFILE_DIMENSION (
    id bigint not null auto_increment,
    profileId bigint,
    profileName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_RESUME_RESOURCE_DIMENSION (
    id bigint not null auto_increment,
    resourceId bigint,
    resourceName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_SITUATION_BATCH_DIMENSION (
    id bigint not null auto_increment,
    batch varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_SITUATION_ENTRY_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_SITUATION_FACT (
    id bigint not null auto_increment,
    RECONCILIATION_SITUATION_BATCH_DIMENSION_ID bigint,
    RECONCILIATION_SITUATION_ENTRY_TYPE_DIMENSION_ID bigint,
    RECONCILIATION_SITUATION_PROFILE_DIMENSION_ID bigint,
    RECONCILIATION_SITUATION_RESOURCE_DIMENSION_ID bigint,
    amount bigint,
    date datetime,
    situation varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_SITUATION_PROFILE_DIMENSION (
    id bigint not null auto_increment,
    profileId bigint,
    profileName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_SITUATION_RESOURCE_DIMENSION (
    id bigint not null auto_increment,
    resourceId bigint,
    resourceName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_ENTRY_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_ENTRY_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_FACT (
    id bigint not null auto_increment,
    REQUEST_APPROVAL_TASK_EXECUTOR_ENTRY_DIMENSION_ID bigint,
    REQUEST_APPROVAL_TASK_EXECUTOR_TYPE_DIMENSION_ID bigint,
    REQUEST_APPROVAL_TASK_EXECUTOR_USER_DIMENSION_ID bigint,
    averageTime bigint,
    created bigint,
    date datetime,
    finalized bigint,
    open bigint,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_USER_DIMENSION (
    id bigint not null auto_increment,
    displayName varchar(255),
    userId bigint,
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_FACT (
    id bigint not null auto_increment,
    REQUEST_APPROVAL_TASK_ENTRY_DIMENSION_ID bigint,
    REQUEST_APPROVAL_TASK_TYPE_DIMENSION_ID bigint,
    approved bigint,
    averageTime bigint,
    created bigint,
    date datetime,
    disapproved bigint,
    open bigint,
    resolved bigint,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_RESUME_ENTRYTYPE_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_RESUME_FACT (
    id bigint not null auto_increment,
    REQUEST_ENTRYTYPE_DIMENSION_ID bigint,
    REQUEST_TYPE_DIMENSION_ID bigint,
    approvalAverageTime bigint,
    approvalNotRequired bigint,
    approvalRequired bigint,
    approved bigint,
    averageTime bigint,
    canceled bigint,
    created bigint,
    date datetime,
    disapproved bigint,
    error bigint,
    generatedBySystem bigint,
    manuallyCreated bigint,
    provisioningAverageTime bigint,
    sodAllowed bigint,
    sodAverageTime bigint,
    sodNotAllowed bigint,
    sodNotRequired bigint,
    sodRequired bigint,
    success bigint,
    validationError bigint,
    waitingApproval bigint,
    waitingProvisioning bigint,
    waitingSodResolution bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_RESUME_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;


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







----------------- BlazonRequest -------------------------------------------------------------------------------------------------------------------------

-- copiar os dados antes pra tabela BlazonRequestTemp: de accountId, entitlementId, roleId, resourceId, beneficiary_id, requester_id, membershipId;

create table BlazonRequestTemp ( 
  	request_id bigint, 
  	accountId bigint, 
  	entitlementId bigint, 
  	membershipId bigint, 
	roleId bigint, 
	resourceId bigint, 
	beneficiary_id bigint, 
	requester_id bigint, 
	requestType varchar(255) 
);

insert into BlazonRequestTemp (request_id, accountId, entitlementId, membershipId, roleId, resourceId, beneficiary_id, requester_id, requestType) 
select id, accountId, entitlementId, membershipId, roleId, resourceId, beneficiary_id, requester_id, type 
from BlazonRequest;

-- drop foreign keys

ALTER TABLE BlazonRequestTransitionState
  DROP FOREIGN KEY FKdpfb02nx61vcbdbqkd8739rqv;

ALTER TABLE BlazonRequest
  DROP FOREIGN KEY FKjf6m674x51u9mwbxilfjoaubh;

ALTER TABLE BlazonRequest
  DROP FOREIGN KEY FKmahlggwuo8v5moybi6ajxpef;

-- drop columns

ALTER TABLE BlazonRequestTransitionState
DROP COLUMN user_id;

ALTER TABLE BlazonRequest
DROP COLUMN accountId;

ALTER TABLE BlazonRequest
DROP COLUMN entitlementId;

ALTER TABLE BlazonRequest
DROP COLUMN roleId;

ALTER TABLE BlazonRequest
DROP COLUMN resourceId;

ALTER TABLE BlazonRequest
DROP COLUMN beneficiary_id;

ALTER TABLE BlazonRequest
DROP COLUMN requester_id;

-- add columns

ALTER TABLE BlazonRequest
ADD COLUMN beneficiary_id bigint;

ALTER TABLE BlazonRequest
ADD COLUMN requester_id bigint;

ALTER TABLE BlazonRequest
ADD COLUMN requestInternalEntry_id bigint;

-- create tables

create table BlazonRequestDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    name varchar(255),
    accountIdentifier varchar(255),
    resourceId bigint,
    resourceName varchar(255),
    accountId bigint,
    entitlementId bigint,
    entitlementName varchar(255),
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;


-- alter tables ???

-------------------- Task -------------------------------------------------------------------------------------------------------------------------

-- copiar os dados de recipient_id antes


-- drop foreign keys

ALTER TABLE Task
  DROP FOREIGN KEY FKtkw5n1qo3rv87d7cna2e4jamq;

ALTER TABLE Task
  DROP FOREIGN KEY FKb3ex1ogyn0oeq8sjdfmupm19p;

ALTER TABLE TaskComment
  DROP FOREIGN KEY FKssui2945je39ejwmn8ndeko4i;

ALTER TABLE TaskAssignHistory
  DROP FOREIGN KEY FKg8vh51ekgk3pg9d10dnrk4254;

ALTER TABLE TaskAssignHistory
  DROP FOREIGN KEY FKsskgpqdccr11yovasrrqlms6h;

ALTER TABLE TaskEscalation
  DROP FOREIGN KEY FKi3y6rc2qe7t884f5r0i647app;

ALTER TABLE TaskEscalation
  DROP FOREIGN KEY FKrw2htnr2qjihfb9hl0u1htu9u;

-- drop index `FKtkw5n1qo3rv87d7cna2e4jamq` on Task;

-- drop index `FKb3ex1ogyn0oeq8sjdfmupm19p` on Task;

-- drop columns

ALTER TABLE Task
DROP COLUMN userFrom;

ALTER TABLE Task
DROP COLUMN recipient_id;

-- add columns

ALTER TABLE Task
ADD COLUMN recipient_id bigint;

ALTER TABLE Task
ADD COLUMN requester_id bigint;

-- create tables

create table UserTask (
    id bigint not null auto_increment,
    displayName varchar(255),
    directoryIdentifier bigint,
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- alter tables ???


--------------- CertificationEntry -------------------------------------------------------------------------------------------------------------------------

-- drop constraints ???

ALTER TABLE CertificationEntryTransitionState
  DROP FOREIGN KEY FKcjb7dvdoudq3ls1qg7hk8cfl8;

-- drop columns

ALTER TABLE CertificationEntry
DROP COLUMN entitlementId;

ALTER TABLE CertificationEntry
DROP COLUMN resourceId;

ALTER TABLE CertificationEntry
DROP COLUMN roleId;

ALTER TABLE CertificationEntry
DROP COLUMN userId;

-- add columns

ALTER TABLE CertificationEntry
ADD COLUMN certificationInternalEntry_id bigint;

-- create tables

create table CertificationDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    name varchar(255),
    displayName varchar(255),
    roleId bigint,
    roleName varchar(255),
    userId bigint,
    username varchar(255),
    accountIdentifier varchar(255),
    resourceId bigint,
    resourceName varchar(255),
    accountId bigint,
    entitlementId bigint,
    entitlementName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- alter tables ????


--------------- ProvisioningEntry -------------------------------------------------------------------------------------------------------------------------

-- drop foreign keys

ALTER TABLE ProvisioningEntry
  DROP FOREIGN KEY FKbu8sbdbac44thjh9elco054ee;

ALTER TABLE ProvisioningEntry
  DROP FOREIGN KEY FKl646lyu11tms5be84ipftljab;

ALTER TABLE ProvisioningEntryTransitionState
  DROP FOREIGN KEY FKn28apg7cx7fn3g29bpgwyt2xg;

-- drop columns

ALTER TABLE ProvisioningEntry
DROP COLUMN accountId;

ALTER TABLE ProvisioningEntry
DROP COLUMN entitlementId;

ALTER TABLE ProvisioningEntry
DROP COLUMN roleId;

ALTER TABLE ProvisioningEntry
DROP COLUMN organizationId;

ALTER TABLE ProvisioningEntry
DROP COLUMN beneficiary_id;

ALTER TABLE ProvisioningEntry
DROP COLUMN resource_id;

-- add columns

ALTER TABLE ProvisioningEntry
ADD COLUMN beneficiary_id bigint;

ALTER TABLE ProvisioningEntry
ADD COLUMN resource_id bigint;

ALTER TABLE ProvisioningEntry
ADD COLUMN provisioningInternalEntry_id bigint;

-- create tables

create table ProvisioningDirectoryEntry (
	type varchar(31) not null,
	id bigint not null auto_increment,
	directoryIdentifier bigint,
	displayName varchar(255),
	username varchar(255),
	name varchar(255),
	accountId bigint,
	accountIdentifier varchar(255),
	entitlementId bigint,
	entitlementName varchar(255),
	primary key (id)
) ENGINE=InnoDB;


-- alter tables ???

---------------- SodEntry -------------------------------------------------------------------------------------------------------------------------

-- drop foreign keys 

ALTER TABLE SodEntryTransitionState
  DROP FOREIGN KEY FKmbl9i755mkqc41uo0q4csb1xq;

-- drop columns

ALTER TABLE SodEntry
DROP COLUMN accountId;

ALTER TABLE SodEntry
DROP COLUMN entitlementId;

ALTER TABLE SodEntry
DROP COLUMN resourceId;

ALTER TABLE SodEntry
DROP COLUMN roleId;

ALTER TABLE SodEntry
DROP COLUMN userId;

-- add columns

ALTER TABLE SodEntry
ADD COLUMN beneficiary_id bigint;

ALTER TABLE SodEntry
ADD COLUMN sodInternalEntry_id bigint;

-- create tables

create table SodDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    username varchar(255),
    accountId bigint,
    accountIdentifier varchar(255),
    entitlementId bigint,
    entitlementName varchar(255),
    resourceId bigint,
    resourceName varchar(255),
    name varchar(255),
    roleId bigint,
    roleName varchar(255),
    userId bigint,
    primary key (id)
) ENGINE=InnoDB;

-- alter tables ???


------------------- RoleRightRevokeEntry -----------------------------------------------------------------------------------------------------------------------

-- drop foreign keys

ALTER TABLE RoleRightRevokeEntry
  DROP FOREIGN KEY FKphdxpsr9f57rbn449bugd0i1f;

ALTER TABLE RoleRightRevokeEntry
  DROP FOREIGN KEY FKi3titmoxi1osh16n969y8pvh5;

-- drop columns

ALTER TABLE RoleRightRevokeEntry
DROP COLUMN role_id;

ALTER TABLE RoleRightRevokeEntry
DROP COLUMN user_id;

-- add columns

ALTER TABLE RoleRightRevokeEntry
ADD COLUMN role_id bigint;

ALTER TABLE RoleRightRevokeEntry
ADD COLUMN beneficiary_id bigint;

ALTER TABLE RoleRightRevokeEntry
ADD COLUMN roleRightRevokeInternalEntry_id bigint;

-- create tables

create table RoleRightRevokeDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    username varchar(255),
    name varchar(255),
    accountId bigint,
    accountIdentifier varchar(255),
    entitlementId bigint,
    entitlementName varchar(255),
    resourceId bigint,
    resourceName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- alter tables


------------------- RoleRightEntry -----------------------------------------------------------------------------------------------------------------------

-- drop foreign ????

-- drop columns

ALTER TABLE RoleRightEntry
DROP COLUMN roleId;

ALTER TABLE RoleRightEntry
DROP COLUMN requester_id;

-- add columns

ALTER TABLE RoleRightEntry
ADD COLUMN requester_id bigint;

ALTER TABLE RoleRightEntry
ADD COLUMN role_id bigint;

-- create tables

create table RoleRightDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    name varchar(255),
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- alter tables ???


------------------- AssignmentEntry ------------------------------------------------------------------------------------------------------------------------

-- drop foreign keys ????

-- drop columns

ALTER TABLE AssignmentEntry
DROP COLUMN roleId;

ALTER TABLE AssignmentEntry
DROP COLUMN userId;

-- add columns

ALTER TABLE AssignmentEntry
ADD COLUMN role_id bigint;

ALTER TABLE AssignmentEntry
ADD COLUMN beneficiary_id bigint;

-- create tables

create table AssignmentDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    name varchar(255),
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- alter tables ???

------------------ ReconciliationEntry ------------------------------------------------------------------------------------------------------------------------

-- drop foreign keys

ALTER TABLE ReconciliationEntry
  DROP FOREIGN KEY FK_RECONCILIATIONENTRY_RESOURCE;

ALTER TABLE ReconciliationEntryTransitionState
  DROP FOREIGN KEY FKh8cqfpa06p1w1oyuskjd5ad2x;

-- drop columns

ALTER TABLE ReconciliationEntry
DROP COLUMN resource_id;

ALTER TABLE ReconciliationEntry
DROP COLUMN reconciliationMatchedEntryId;

-- add columns

ALTER TABLE ReconciliationEntry
ADD COLUMN resource_id bigint;

ALTER TABLE ReconciliationEntry
ADD COLUMN reconciliationMatchedInternalEntry_id bigint;

-- create tables

create table ReconciliationDirectoryEntry (
	type varchar(31) not null,
	id bigint not null auto_increment,
	directoryIdentifier bigint,
	name varchar(255),
	accountId bigint,
	accountIdentifier varchar(255),
	entitlementId bigint,
	entitlementName varchar(255),
	displayName varchar(255),
	roleId bigint,
	roleName varchar(255),
	userId bigint,
	username varchar(255),
	primary key (id)
) ENGINE=InnoDB;

-- alter tables ???










-- Resource

ALTER TABLE Resource
ADD COLUMN type varchar(255);



-- ANALYTICS_DIRECTORY_OBJECTS_DETAIL_FACT

ALTER TABLE ANALYTICS_DIRECTORY_OBJECTS_DETAIL_FACT 
DROP COLUMN averageUsersByOrganization;


-- ANALYTICS_DIRECTORY_OBJECTS_FACT

ALTER TABLE ANALYTICS_DIRECTORY_OBJECTS_FACT 
DROP COLUMN amountOrganizations;


-- ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT

ALTER TABLE ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT 
DROP COLUMN amountMembershipOrganizationByReconciliation;

ALTER TABLE ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT 
DROP COLUMN amountMembershipOrganizationByManual;

ALTER TABLE ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT 
DROP COLUMN amountMembershipOrganizationByOrganizationRule;


-- MembershipOrganization

ALTER TABLE MembershipOrganization
DROP FOREIGN KEY FK4ttvmejb1ylo5l4muclsw29hn;

ALTER TABLE MembershipOrganization
DROP FOREIGN KEY FK1cdse9jmxa34ncw9cq2c6ksu1;

drop table MembershipOrganization;


-- Organization_User

ALTER TABLE Organization_User
DROP FOREIGN KEY FK2emtdx12o2x6n1ditg3lwn4uj;

ALTER TABLE Organization_User
DROP FOREIGN KEY FKnpxsmlwuy7pgbj0e6e0v9w708;

drop table Organization_User;


-- OrganizationProvisioningProfile

drop table OrganizationProvisioningProfile;


-- OrganizationRule

ALTER TABLE OrganizationRule
DROP FOREIGN KEY FKif4gw7kcwv9y05tyslq7xj95e;

drop table OrganizationRule;


-- OrganizationType

drop table OrganizationType;

-- Organization

ALTER TABLE Organization
DROP FOREIGN KEY FK35f0lmp4xv33i3wre6y0enkt7;

ALTER TABLE Organization
DROP FOREIGN KEY FKt5r8fl7xglrdfv4o1q0x0l5st;

ALTER TABLE Organization
DROP FOREIGN KEY FK5keih5lyko469bl9rsaxhji4i;

drop table Organization;


-- ProvisioningDirectoryEntry 

-- ALTER TABLE ProvisioningDirectoryEntry 
-- DROP COLUMN organizationId;

-- ALTER TABLE ProvisioningDirectoryEntry 
-- DROP COLUMN organizationName;


-- ReconciliationDirectoryEntry

-- ALTER TABLE ReconciliationDirectoryEntry 
-- DROP COLUMN organization_id;


-- SituationDef_entryTypes

delete from SituationDef_entryTypes where entryTypes like '%ORGANIZATION%';


-- SituationDef

delete from SituationDef where name like '%ORGANIZATION%';


-- EntryAttributeCategory

delete from EntryAttributeCategory where schemaa = 'ORGANIZATION';








-- RoleProvisioningProfile

drop table RoleProvisioningProfile;


-- ProvisioningDirectoryEntry

ALTER TABLE ProvisioningDirectoryEntry 
DROP COLUMN roleId;

ALTER TABLE ProvisioningDirectoryEntry 
DROP COLUMN roleName;



-- SharedAccountMember

create table SharedAccountMembership (
    id bigint not null auto_increment,
    account_id bigint,
    user_id bigint,
    primary key (id)
) ENGINE=InnoDB;





-- ResourceDependency

drop table ResourceDependency;


-- EntitlementDependency

drop table EntitlementDependency;






-- amountTasks

ALTER TABLE ANALYTICS_CERTIFICATION_EXECUTOR_FACT
add amountTasks BIGINT;


-- amountOpenEntries

ALTER TABLE ANALYTICS_CERTIFICATION_CAMPAIGN_RESUME_FACT
    ADD COLUMN amountOpenEntries BIGINT;

alter table ANALYTICS_CERTIFICATION_MICRO_RESUME_FACT
   add amountOpenEntries BIGINT;

alter table ANALYTICS_CERTIFICATION_SELECTOR_RESUME_FACT
   add amountOpenEntries BIGINT;


-- amountOpenTasks

ALTER TABLE ANALYTICS_CERTIFICATION_CAMPAIGN_RESUME_FACT
    ADD COLUMN amountOpenTasks BIGINT;

ALTER TABLE ANALYTICS_CERTIFICATION_MICRO_RESUME_FACT
    ADD COLUMN amountOpenTasks BIGINT;

ALTER TABLE ANALYTICS_CERTIFICATION_SELECTOR_RESUME_FACT
    ADD COLUMN amountOpenTasks BIGINT;

-- SituationDef

update SituationDef set implementationClassName = 'AccountAndOwnerNotMatchSituation' where implementationClassName like '%AccountAndOwnerNotMatchSituation';

update SituationDef set implementationClassName = 'AccountNotMatchAndOwnerMatchSituation' where implementationClassName like '%AccountNotMatchAndOwnerMatchSituation';

update SituationDef set implementationClassName = 'AccountMatchAndOwnerNotMatchSituation' where implementationClassName like '%AccountMatchAndOwnerNotMatchSituation';

update SituationDef set implementationClassName = 'UserAndRoleNotMatchSituation' where implementationClassName like '%UserAndRoleNotMatchSituation';

update SituationDef set implementationClassName = 'UserNotMatchAndRoleMatchSituation' where implementationClassName like '%UserNotMatchAndRoleMatchSituation';


update SituationDef set implementationClassName = 'UserMatchAndRoleNotMatchSituation' where implementationClassName like '%UserMatchAndRoleNotMatchSituation';

update SituationDef set implementationClassName = 'AccountAndEntitlementNotMatchSituation' where implementationClassName like '%AccountAndEntitlementNotMatchSituation';

update SituationDef set implementationClassName = 'AccountNotMatchAndEntitlementMatchSituation' where implementationClassName like '%AccountNotMatchAndEntitlementMatchSituation';

update SituationDef set implementationClassName = 'AccountMatchAndEntitlementNotMatchSituation' where implementationClassName like '%AccountMatchAndEntitlementNotMatchSituation';


update SituationDef set implementationClassName = 'EntryConflictSituation' where implementationClassName like '%EntryConflictSituation';

update SituationDef set implementationClassName = 'MatchConflictSituation' where implementationClassName like '%MatchConflictSituation';

update SituationDef set implementationClassName = 'EntryFoundSituation' where implementationClassName like '%EntryFoundSituation';

update SituationDef set implementationClassName = 'EntryNotFoundSituation' where implementationClassName like '%EntryNotFoundSituation';



-- delete Job InactivateExpiredUsersJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%InactivateExpiredUsersJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%InactivateExpiredUsersJob'
);

delete from Job	
where className like '%InactivateExpiredUsersJob';


-- delete Job RemoveUsersFromExpiredRolesJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RemoveUsersFromExpiredRolesJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RemoveUsersFromExpiredRolesJob'
);

delete from Job	
where className like '%RemoveUsersFromExpiredRolesJob';


-- delete Job RevokeExpiredMembershipEntitlementsJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RevokeExpiredMembershipEntitlementsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RevokeExpiredMembershipEntitlementsJob'
);

delete from Job	
where className like '%RevokeExpiredMembershipEntitlementsJob';


-- update Job InactivateExpiredAccountsJob para RevokeExpiredTemporaryAccountsJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%InactivateExpiredAccountsJob'
);

update Job set className = 'com.blazon.identitymanagement.identitybusinessrules.jobs.RevokeExpiredTemporaryAccountsJob'
where className like '%InactivateExpiredAccountsJob';

/*
update JobInstance set externalJobDetailId = '59:Revoke Expired Accounts Job', name = 'Inactivate Expired Accounts Job' 
where id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.identitymanagement.identitybusinessrules.jobs.RevokeExpiredTemporaryAccountsJob'
);
*/

-- Jobs de Transição de Revoked para Removed

-- Job com.blazon.identitymanagement.identitybusinessrules.jobs.FindAccountReadyToRemove

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.identitybusinessrules.jobs.FindAccountReadyToRemove', 'Find Account Ready To Remove Job.', 'Find Account Ready To Remove Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Find Account Ready To Remove Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Find Account Ready To Remove Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.identitybusinessrules.jobs.FindAccountReadyToRemove';


-- Job com.blazon.identitymanagement.identitybusinessrules.jobs.FindEntitlementReadyToRemove

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.identitybusinessrules.jobs.FindEntitlementReadyToRemove', 'Find Entitlement Ready To Remove Job.', 'Find Entitlement Ready To Remove Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Find Entitlement Ready To Remove Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Find Entitlement Ready To Remove Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.identitybusinessrules.jobs.FindEntitlementReadyToRemove';


-- Job com.blazon.identitymanagement.identitybusinessrules.jobs.FindMembershipEntitlementReadyToRemove

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.identitybusinessrules.jobs.FindMembershipEntitlementReadyToRemove', 'Find MembershipEntitlement Ready To Remove Job.', 'Find MembershipEntitlement Ready To Remove Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Find MembershipEntitlement Ready To Remove Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Find MembershipEntitlement Ready To Remove Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.identitybusinessrules.jobs.FindMembershipEntitlementReadyToRemove';


-- Job com.blazon.identitymanagement.identitybusinessrules.jobs.FindMembershipRoleReadyToRemove

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.identitybusinessrules.jobs.FindMembershipRoleReadyToRemove', 'Find MembershipRole Ready To Remove Job.', 'Find MembershipRole Ready To Remove Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Find MembershipRole Ready To Remove Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Find MembershipRole Ready To Remove Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.identitybusinessrules.jobs.FindMembershipRoleReadyToRemove';


-- Job com.blazon.identitymanagement.identitybusinessrules.jobs.FindRoleReadyToRemove

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.identitybusinessrules.jobs.FindRoleReadyToRemove', 'Find Role Ready To Remove Job.', 'Find Role Ready To Remove Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Find Role Ready To Remove Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Find Role Ready To Remove Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.identitybusinessrules.jobs.FindRoleReadyToRemove';


-- Job com.blazon.identitymanagement.identitybusinessrules.jobs.FindUserReadyToRemove

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.identitybusinessrules.jobs.FindUserReadyToRemove', 'Find User Ready To Remove Job.', 'Find User Ready To Remove Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Find User Ready To Remove Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Find User Ready To Remove Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.identitybusinessrules.jobs.FindUserReadyToRemove';









# ATUALIZAR

# Account
UPDATE ReconciliationAction SET actionName='CreateAccountReconciliationActionHandler', beanName='createAccountReconciliationActionHandler'
WHERE beanName = 'CreateAccountReconciliationActionHandler';
UPDATE ReconciliationAction
SET actionName='RemoveAccountOfDirectoryReconciliationActionHandler', beanName='removeAccountOfDirectoryReconciliationActionHandler'
WHERE beanName = 'RemoveAccountReconciliationActionHandler';
UPDATE ReconciliationAction
SET actionName='UpdateAccountReconciliationActionHandler', beanName='updateAccountReconciliationActionHandler'
WHERE beanName = 'UpdateAccountReconciliationActionHandler';

# Entitlement and Membership Entitlement
UPDATE ReconciliationAction
SET actionName='CreateEntitlementReconciliationActionHandler', beanName='createEntitlementReconciliationActionHandler'
WHERE beanName = 'CreateEntitlementReconciliationActionHandler';
UPDATE ReconciliationAction
SET actionName='GrantMembershipEntitlementReconciliationActionHandler', beanName='grantMembershipEntitlementReconciliationActionHandler'
WHERE beanName = 'GrantEntitlementReconciliationActionHandler';
UPDATE ReconciliationAction
SET actionName='RevokeEntitlementReconciliationActionHandler', beanName='revokeEntitlementReconciliationActionHandler'
WHERE beanName = 'RemoveEntitlementReconciliationActionHandler';
UPDATE ReconciliationAction
SET actionName='RevokeMembershipEntitlementReconciliationActionHandler', beanName='revokeMembershipEntitlementReconciliationActionHandler'
WHERE beanName = 'RevokeEntitlementReconciliationActionHandler';
UPDATE ReconciliationAction
SET actionName='UpdateEntitlementReconciliationActionBusinessHandler', beanName='updateEntitlementReconciliationActionBusinessHandler'
WHERE beanName = 'UpdateEntitlementReconciliationActionHandler';


#  NOVOS

# ACCOUNT
INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('RevokeAccountReconciliationActionHandler', 'revokeAccountReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ACCOUNT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ACCOUNT_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ACCOUNT_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ACCOUNT_NOT_FOUND_AND_OWNER_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ACCOUNT_FOUND_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ENTRY_CONFLICT_OR_OWNER_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ENTRY_FOUND');

INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('SaveAccountOnDirectoryReconciliationActionHandler', 'saveAccountOnDirectoryReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'), 'ACCOUNT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'),'ACCOUNT_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'),'ACCOUNT_NOT_FOUND_AND_OWNER_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'),'ACCOUNT_FOUND_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT_OR_OWNER_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'),'ENTRY_FOUND');

INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('UpdateAccountOfDirectoryReconciliationActionHandler', 'updateAccountOfDirectoryReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'), 'ACCOUNT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'),'ACCOUNT_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'),'ACCOUNT_NOT_FOUND_AND_OWNER_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'),'ACCOUNT_FOUND_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT_OR_OWNER_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'),'ENTRY_FOUND');

# ENTITLEMENT and MEMBERSHIP ENTITLEMENTS
INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('RemoveEntitlementOfDirectoryReconciliationActionHandler', 'removeEntitlementOfDirectoryReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'), 'ENTITLEMENT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'),'ACCOUNT_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'),'ACCOUNT_NOT_FOUND_AND_ENTITLEMENT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'),'ACCOUNT_FOUND_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'),'ENTRY_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT_OR_OWNER_CONFLICT');

INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('RemoveMembershipEntitlementReconciliationActionHandler', 'removeMembershipEntitlementReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'), 'ENTITLEMENT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'),'ACCOUNT_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'),'ACCOUNT_NOT_FOUND_AND_ENTITLEMENT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'),'ACCOUNT_FOUND_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'),'ENTRY_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'),'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'),'ENTRY_CONFLICT_OR_OWNER_CONFLICT');

INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('SaveEntitlementOnDirectoryReconciliationActionHandler', 'saveEntitlementOnDirectoryReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'), 'ENTITLEMENT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'),'ACCOUNT_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'),'ACCOUNT_NOT_FOUND_AND_ENTITLEMENT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'),'ACCOUNT_FOUND_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'),'ENTRY_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT_OR_OWNER_CONFLICT');

INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('UpdateEntitlementOnDirectoryReconciliationActionHandler', 'UpdateEntitlementOnDirectoryReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'), 'ENTITLEMENT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'),'ACCOUNT_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'),'ACCOUNT_NOT_FOUND_AND_ENTITLEMENT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'),'ACCOUNT_FOUND_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'),'ENTRY_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT_OR_OWNER_CONFLICT');


update AccountNotificationSettings set type = 'REVOKE_ACCOUNT_NOTIFICATION' where type = 'REMOVE_ACCOUNT_NOTIFICATION';
ALTER TABLE ResourceProvisioningProfile
  CHANGE removeAccountProvisioningType revokeAccountProvisioningType VARCHAR(255) NULL;

ALTER TABLE ResourceProvisioningProfile
  CHANGE removeAccountProvisioningObject revokeAccountProvisioningObject VARCHAR(255) NULL;

ALTER TABLE ResourceProvisioningProfile
  CHANGE removeAccountProvisioningMappingIdentifier revokeAccountProvisioningMappingIdentifier BIGINT NULL;

ALTER TABLE ResourceProvisioningProfile
  CHANGE removeAccountProvisioningTaskQueueIdentifier revokeAccountProvisioningTaskQueueIdentifier BIGINT NULL;

ALTER TABLE ResourceProvisioningProfile
  CHANGE removeAccountProvisioningTaskDefinitionIdentifier revokeAccountProvisioningTaskDefinitionIdentifier BIGINT NULL;

-- CertificationEntry

alter table CertificationEntry
drop column uncertifiedEntryAction;


-- CertificationSelector

alter table CertificationSelector
drop column uncertifiedAccountAction;

alter table CertificationSelector
drop column uncertifiedMembershipEntitlementAction;

alter table CertificationSelector
drop column uncertifiedMembershipRoleAction;


-- MicroCertificationExecutionInstance

alter table MicroCertificationExecutionInstance
drop column uncertifiedEntryAction;


-- CertificationPolicy

alter table CertificationPolicy
drop column uncertifiedEntryAction;


drop table RoleProvisioningProfile;


-- ResourceProvisioningProfile

alter table ResourceProvisioningProfile
add column createAccountProvisioningFailoverWorkflow varchar(255);

alter table ResourceProvisioningProfile
add column updateAccountProvisioningFailoverWorkflow varchar(255);

alter table ResourceProvisioningProfile
add column revokeAccountProvisioningFailoverWorkflow varchar(255);

alter table ResourceProvisioningProfile
add column changePasswordProvisioningFailoverWorkflow varchar(255);

alter table ResourceProvisioningProfile
add column activateAccountProvisioningFailoverWorkflow varchar(255);

alter table ResourceProvisioningProfile
add column inactivateAccountProvisioningFailoverWorkflow varchar(255);

alter table ResourceProvisioningProfile
add column grantEntitlementProvisioningFailoverWorkflow varchar(255);

alter table ResourceProvisioningProfile
add column revokeEntitlementProvisioningFailoverWorkflow varchar(255);

alter table ResourceProvisioningProfile
add column createEntitlementProvisioningFailoverWorkflow varchar(255);

alter table ResourceProvisioningProfile
add column removeEntitlementProvisioningFailoverWorkflow varchar(255);

alter table ResourceProvisioningProfile
add column updateEntitlementProvisioningFailoverWorkflow varchar(255);

alter table ResourceProvisioningProfile
add column addMemberToEntitlementProvisioningFailoverWorkflow varchar(255);

alter table ResourceProvisioningProfile
add column removeMemberOfEntitlementProvisioningFailoverWorkflow varchar(255);


-- com.blazon.identitymanagement.provisioning.jobs.ProvisioningDispatchFailoverWorkflowExecutionJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.provisioning.jobs.ProvisioningDispatchFailoverWorkflowExecutionJob', 
'Provisioning Dispatch Failover Workflow Execution Job.', 'Provisioning Dispatch Failover Workflow Execution Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Provisioning Dispatch Failover Workflow Execution Job' as name, 
	'[{\"name\":\"provisioningEntriesQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Provisioning Dispatch Failover Workflow Execution Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.provisioning.jobs.ProvisioningDispatchFailoverWorkflowExecutionJob';





-- Insert CertificationNotificationSettings


INSERT INTO CertificationNotificationSettings(id, enabled, subject, template, type) VALUES (6, 0, 'User Revoked Certification Notification', '<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
', 'USER_REVOKED_CERTIFICATION_NOTIFICATION');

INSERT INTO CertificationNotificationSettings(id, enabled, subject, template, type) VALUES (7, 0, 'Account Revoked Certification Notification', '<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
', 'ACCOUNT_REVOKED_CERTIFICATION_NOTIFICATION');

INSERT INTO CertificationNotificationSettings(id, enabled, subject, template, type) VALUES (8, 0, 'MembershipRole Revoked Certification Notification', '<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
', 'MEMBERSHIP_ROLE_REVOKED_CERTIFICATION_NOTIFICATION');

INSERT INTO CertificationNotificationSettings(id, enabled, subject, template, type) VALUES (9, 0, 'MembershipEntitlement Revoked Certification Notification', '<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
', 'MEMBERSHIP_ENTITLEMENT_REVOKED_CERTIFICATION_NOTIFICATION');
## ENTITIES

# CampaignDefinition
ALTER TABLE CampaignDefinition
  ADD isAutoRevoke BOOLEAN DEFAULT FALSE NOT NULL;

# CertificationSelector
ALTER TABLE CertificationSelector
  ADD isAutoRevoke BOOLEAN DEFAULT FALSE NOT NULL;

## JOBS

# Certification Campaign revoke.
ALTER TABLE CampaignExecutionInstance
  ADD isAutoRevoke BOOLEAN DEFAULT FALSE NOT NULL;

INSERT
INTO Job (className, description, displayName, parameters)
VALUES ('com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.campaign.jobs.RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob',
        'Revoke entries from campaign that Deadline has reached.',
        'Revoke Entries From Campaign With Deadline Reached Job',
        NULL);

INSERT
INTO JobInstance (name, description, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId)
SELECT
  'Revoke Entries From Campaigns Certifications With Deadline Reached Job'  AS name,
  'Revoke entries from campaigns certifications that Deadline has reached.' AS description,
  '[{\"name\":\"provisioningEntriesQueueLength\", \"value\":\"10\"}]'       AS params,
  job.id                                                                    AS job_id,
  FALSE                                                                     AS activated,
  '0 0/1 * * * ?'                                                           AS cronExpression,
  'Blazon Jobs'                                                             AS externalGroupId,
  'Revoke Entries From Campaigns Certifications With Deadline Reached Job'  AS externalJobDetailId
FROM Job job
WHERE job.className =
      'com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.campaign.jobs.RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob';

# Micro certification revoke.
ALTER TABLE MicroCertificationExecutionInstance
  ADD isAutoRevoke BOOLEAN DEFAULT FALSE NOT NULL;

INSERT
INTO Job (className, description, displayName, parameters)
VALUES ('com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.micro.jobs.RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob',
        'Revoke entries from micro certifications that Deadline has reached.',
        'Revoke Entries From Micro Certifications With Deadline Reached Job',
        NULL);

INSERT
INTO JobInstance (name, description, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId)
SELECT
  'Revoke Entries From Micro Certifications With Deadline Reached Job'  AS name,
  'Revoke entries from micro certifications that Deadline has reached.' AS description,
  '[{\"name\":\"provisioningEntriesQueueLength\", \"value\":\"10\"}]'  AS params,
  job.id                                                               AS job_id,
  FALSE                                                                AS activated,
  '0 0/1 * * * ?'                                                      AS cronExpression,
  'Blazon Jobs'                                                        AS externalGroupId,
  'Revoke Entries From Micro Certifications With Deadline Reached Job' AS externalJobDetailId
FROM Job job
WHERE job.className =
      'com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.micro.jobs.RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob';

# Selector certification revoke.
ALTER TABLE SelectorExecutionInstance
  ADD isAutoRevoke BOOLEAN DEFAULT FALSE NOT NULL;

INSERT
INTO Job (className, description, displayName, parameters)
VALUES ('com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.selector.jobs.RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob',
        'Revoke entries from selectors certifications that Deadline has reached.',
        'Revoke Entries From Selectors Certifications With Deadline Reached Job',
        NULL);

INSERT
INTO JobInstance (name, description, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId)
SELECT
  'Revoke Entries From Selectors Certification With Deadline Reached Job'  AS name,
  'Revoke entries from selectors certification that Deadline has reached.' AS description,
  '[{\"name\":\"provisioningEntriesQueueLength\", \"value\":\"10\"}]'      AS params,
  job.id                                                                   AS job_id,
  FALSE                                                                    AS activated,
  '0 0/1 * * * ?'                                                          AS cronExpression,
  'Blazon Jobs'                                                            AS externalGroupId,
  'Revoke Entries From Selectors Certifications With Deadline Reached Job' AS externalJobDetailId
FROM Job job
WHERE job.className =
      'com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.selector.jobs.RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob';

-- RevokeExpiredTemporaryAccountsJob

update Job 
set className = 'com.blazon.identitymanagement.identitybusinessrules.account.temporaryaccounts.jobs.RevokeExpiredTemporaryAccountsJob',
description = 'Revoke Expired Temporary Accounts Job.',
displayName = 'Revoke Expired Temporary Accounts Job'
where className like '%RevokeExpiredTemporaryAccountsJob';

update JobInstance set 
name = 'Revoke Expired Temporary Accounts Job',
description = 'Revoke Expired Temporary Accounts Job.'
where job_id = (
	select id from Job where className like '%RevokeExpiredTemporaryAccountsJob');




-- ChangeApplicationAccountOwnerEntry etc

create table ChangeApplicationAccountOwnerAccount (
    id bigint not null auto_increment,
    accountIdentifier varchar(255),
    directoryIdentifier bigint,
    resourceId bigint,
    resourceName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ChangeApplicationAccountOwnerEntry (
    id bigint not null auto_increment,
    createdAt datetime,
    resolveNote varchar(1000),
    resolvedAt datetime,
    status varchar(255),
    account_id bigint,
    currentOwner_id bigint,
    newOwner_id bigint,
    resolvedBy_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ChangeApplicationAccountOwnerEntry_actions (
    ChangeApplicationAccountOwnerEntry_id bigint not null,
    actions varchar(255)
) ENGINE=InnoDB;

create table ChangeApplicationAccountOwnerUser (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;


-- inserts para InternalPermissions ChangeApplicationAccountOwnerEntry

insert into InternalPermission (category, description, label, name) values ('CHANGE_APPLICATION_OWNER', 'Listar entradas de troca de proprietário da conta.', 'Listar entradas de troca de proprietário da conta', 'LIST_CHANGE_APPLICATION_OWNER_ENTRY');
insert into InternalPermission (category, description, label, name) values ('CHANGE_APPLICATION_OWNER', 'Resolver entrada de troca de proprietário da conta.', 'Resolver entrada de troca de proprietário da conta.', 'RESOLVE_CHANGE_APPLICATION_OWNER_ENTRY');

-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Entradas de Troca de Proprietário de Conta.', 'Visualizar Entradas de Troca de Proprietário de Conta', 'CHANGE_APPLICATION_OWNER_ENTRY_VISUALIZE');
insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Gerenciar Entradas de Troca de Proprietário de Conta.', 'Gerenciar Entradas de Troca de Proprietário de Conta', 'CHANGE_APPLICATION_OWNER_ENTRY_MANAGE');


-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_VISUALIZE' and ip.name = 'LIST_CHANGE_APPLICATION_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_VISUALIZE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_VISUALIZE' and ip.name = 'LIST_ACCOUNT';


insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_MANAGE' and ip.name = 'LIST_CHANGE_APPLICATION_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_MANAGE' and ip.name = 'RESOLVE_CHANGE_APPLICATION_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_MANAGE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_MANAGE' and ip.name = 'LIST_ACCOUNT';


-- ChangePasswordAccountEntry etc

create table ChangePasswordAccount (
    id bigint not null auto_increment,
    accountIdentifier varchar(255),
    directoryIdentifier bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ChangePasswordAccountEntry (
    id bigint not null auto_increment,
    createdAt datetime,
    resetPassword bit,
    resolveNote varchar(1000),
    resolvedAt datetime,
    status varchar(255),
    account_id bigint,
    resolvedBy_id bigint,
    resource_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ChangePasswordResource (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ChangePasswordUser (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;



-- inserts para InternalPermissions ChangePasswordAccountEntry

insert into InternalPermission (category, description, label, name) values ('CHANGE_PASSSWORD_ACCOUNT', 'Listar entradas de troca de senha de conta.', 'Listar entradas de troca de senha de conta', 'LIST_CHANGE_PASSWORD_ENTRY');
insert into InternalPermission (category, description, label, name) values ('CHANGE_PASSSWORD_ACCOUNT', 'Resolver entrada de troca de senha de conta.', 'Resolver entrada de troca de senha de conta.', 'RESOLVE_CHANGE_PASSWORD_ENTRY');

-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Entradas de Troca de Senha de Conta.', 'Visualizar Entradas de Troca de Senha de Conta', 'CHANGE_PASSWORD_ENTRY_VISUALIZE');
insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Gerenciar Entradas de Troca de Senha de Conta.', 'Gerenciar Entradas de Troca de Senha de Conta', 'CHANGE_PASSWORD_ENTRY_MANAGE');


-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_VISUALIZE' and ip.name = 'LIST_CHANGE_PASSWORD_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_VISUALIZE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_VISUALIZE' and ip.name = 'LIST_ACCOUNT';


insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_MANAGE' and ip.name = 'LIST_CHANGE_PASSWORD_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_MANAGE' and ip.name = 'RESOLVE_CHANGE_PASSWORD_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_MANAGE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_MANAGE' and ip.name = 'LIST_ACCOUNT';


-- SharedAccountMembership e etc

create table SharedAccountAccount (
    id bigint not null auto_increment,
    accountIdentifier varchar(255),
    directoryIdentifier bigint,
    resourceId bigint,
    resourceName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table SharedAccountMembership (
    id bigint not null auto_increment,
    account_id bigint,
    user_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table SharedAccountUser (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;


-- inserts para InternalPermissions SharedAccountMembership

insert into InternalPermission (category, description, label, name) values ('SHARED_ACCOUNT', 'Listar membros de uma conta compartilhada.', 'Listar membros de uma conta compartilhada', 'LIST_SHARED_ACCOUNT_MEMBER');
insert into InternalPermission (category, description, label, name) values ('SHARED_ACCOUNT', 'Adicionar membro a uma conta compartilhada.', 'Adicionar membro a uma conta compartilhada.', 'SHARE_SHARED_ACCOUNT');
insert into InternalPermission (category, description, label, name) values ('SHARED_ACCOUNT', 'Remover membro a uma conta compartilhada.', 'Remover membro a uma conta compartilhada.', 'UNSHARE_SHARED_ACCOUNT');

-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Contas Compartilhadas.', 'Visualizar Contas Compartilhadas', 'SHARED_ACCOUNT_VISUALIZE');
insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Gerenciar Contas Compartilhadas.', 'Gerenciar Contas Compartilhadas', 'SHARED_ACCOUNT_MANAGE');


-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_VISUALIZE' and ip.name = 'LIST_SHARED_ACCOUNT_MEMBER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_VISUALIZE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_VISUALIZE' and ip.name = 'LIST_ACCOUNT';


insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'LIST_SHARED_ACCOUNT_MEMBER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'SHARE_SHARED_ACCOUNT';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'UNSHARE_SHARED_ACCOUNT';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'LIST_ACCOUNT';


-- Admin Accounts

alter table Account
drop FOREIGN KEY FK_ACCOUNT_USER;

create table AccountPasswordVault (
    id bigint not null auto_increment,
    accountId bigint,
    passwordVaultId bigint,
    primary key (id)
) ENGINE=InnoDB;


-- drop table AdminAccountPasswordVault;

create table CheckinAdminAccountPasswordVault (
    id bigint not null auto_increment,
    accountId bigint,
    passwordVaultId bigint,
    userId bigint,
    primary key (id)
) ENGINE=InnoDB;


-- RemoveSharedAccountMembershipEntry

create table RemoveSharedAccountMembershipEntry (
    id bigint not null auto_increment,
    createdAt datetime,
    removeMembership bit,
    resolveNote varchar(1000),
    resolvedAt datetime,
    status varchar(255),
    account_id bigint,
    member_id bigint,
    resolvedBy_id bigint,
    primary key (id)
) ENGINE=InnoDB;


-- Internal Permissions to RemoveSharedAccountMembershipEntry

insert into InternalPermission (category, description, label, name) values ('SHARED_ACCOUNT', 'Listar entrada de remoção de membros de uma conta compartilhada.', 'Listar entrada de remoção de membros de uma conta compartilhada', 'LIST_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY');
insert into InternalPermission (category, description, label, name) values ('SHARED_ACCOUNT', 'Resolver entrada de remoção de membro a uma conta compartilhada.', 'Resolver entrada de remoção de membro a uma conta compartilhada.', 'RESOLVE_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY');

-- inserts para InternalPermissionGroup (JÁ INSERIDOS!!!)

-- insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Contas Compartilhadas.', 'Visualizar Contas Compartilhadas', 'SHARED_ACCOUNT_VISUALIZE');
-- insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Gerenciar Contas Compartilhadas.', 'Gerenciar Contas Compartilhadas', 'SHARED_ACCOUNT_MANAGE');

-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_VISUALIZE' and ip.name = 'LIST_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY';


insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'LIST_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'RESOLVE_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY';


-- Add name and description to Account

alter table Account
add column name varchar(255);

alter table Account
add column description varchar(255);



-- Entry

alter table Entry 
add column selfServiceSynchronized boolean default false;


alter table Resource 
add column selfServiceSynchronized boolean default false;

drop table SelfServiceSettings;


-- com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogResourceSyncJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogResourceSyncJob', 
'Self Service Catalog Resource Sync Job.', 'Self Service Catalog Resource Sync Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Self Service Catalog Resource Sync Job' as name, 
	'[{\"name\":\"resourceQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Self Service Catalog Resource Sync Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogResourceSyncJob';


-- com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogRoleSyncJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogRoleSyncJob', 
'Self Service Catalog Role Sync Job.', 'Self Service Catalog Role Sync Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Self Service Catalog Role Sync Job' as name, 
	'[{\"name\":\"roleQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Self Service Catalog Role Sync Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogRoleSyncJob';


-- com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogEntitlementSyncJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogEntitlementSyncJob', 
'Self Service Catalog Entitlement Sync Job.', 'Self Service Catalog Entitlement Sync Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Self Service Catalog Entitlement Sync Job' as name, 
	'[{\"name\":\"entitlementQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Self Service Catalog Entitlement Sync Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogEntitlementSyncJob';


-- com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogAdminPasswordSyncJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogAdminPasswordSyncJob', 
'Self Service Catalog Admin Password Sync Job.', 'Self Service Catalog Admin Password Sync Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Self Service Catalog Admin Password Sync Job' as name, 
	'[{\"name\":\"adminPasswordQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Self Service Catalog Admin Password Sync Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogAdminPasswordSyncJob';


-- SelfServiceCartInstanceItem

drop table SelfServiceCartItem_dependsOnIds;

drop table SelfServiceCartItem_payloads;

drop table SelfServiceCartInstanceItem;

create table SelfServiceCartInstanceItem (
	id bigint not null auto_increment,
	accountAlreadyExist bit,
	adminAccountLocked bit,
	alreadyRequestInProgress bit,
	membershipEntitlementAlreadyExist bit,
	membershipRoleAlreadyExist bit,
	payload varchar(4000),
	relatedAccountNotFound bit,
	relatedCatalogItemId varchar(255),
	relatedCatalogItemName varchar(255),
	schemaValidated bit,
	userId varchar(255),
	cartItem_id bigint,
	primary key (id)
) ENGINE=InnoDB;

-- alter table SelfServiceCartInstanceItem add column adminAccountLocked bit;

-- SelfServiceCartItem

drop table SelfServiceCartItem;

create table SelfServiceCartItem (
    id bigint not null auto_increment,
    assignType varchar(255),
    catalogItemId varchar(255),
    cart_id bigint,
    primary key (id)
) ENGINE=InnoDB;


-- Ajuste no job 'Remove permanentemente as MembershipRoles do diretório'

update JobInstance set name = 'Remove permanentemente as MembershipRoles do diretório' where name like '%RemoveMembershipRolesJob%';




-- Remover todos os jobs de analytics do banco

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%.analytics.%'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%.analytics.%'
);

delete from Job	
where className like '%.analytics.%';


-- Directory

-- DirectoryElasticsearchIndexationJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.DirectoryElasticsearchIndexationJob'
where className like '%DirectoryElasticsearchIndexationJob';

-- RemoveAccountsJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.RemoveAccountsJob'
where className like '%RemoveAccountsJob';

-- RemoveEntitlementsJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.RemoveEntitlementsJob'
where className like '%RemoveEntitlementsJob';

-- RemoveMembershipEntitlementsJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.RemoveMembershipEntitlementsJob'
where className like '%RemoveMembershipEntitlementsJob';

-- RemoveMembershipRolesJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.RemoveMembershipRolesJob'
where className like '%RemoveMembershipRolesJob';

-- RemoveRolesJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.RemoveRolesJob'
where className like '%RemoveRolesJob';

-- RemoveUserJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.RemoveUserJob'
where className like '%RemoveUserJob';


-- Provisioning

-- ProvisioningDispatchFailoverWorkflowExecutionJob - com.blazon.accessmanagement.provisioning.jobs

update Job 
set className = 'com.blazon.accessmanagement.provisioning.jobs.ProvisioningDispatchFailoverWorkflowExecutionJob'
where className like '%ProvisioningDispatchFailoverWorkflowExecutionJob';

-- ProvisioningDispatchToWaitingResourceAdapterPullingJob - com.blazon.accessmanagement.provisioning.jobs

update Job 
set className = 'com.blazon.accessmanagement.provisioning.jobs.ProvisioningDispatchToWaitingResourceAdapterPullingJob'
where className like '%ProvisioningDispatchToWaitingResourceAdapterPullingJob';

-- ProvisioningWaitingAssignToTaskQueueExecutionJob - com.blazon.accessmanagement.provisioning.jobs

update Job 
set className = 'com.blazon.accessmanagement.provisioning.jobs.ProvisioningWaitingAssignToTaskQueueExecutionJob'
where className like '%ProvisioningWaitingAssignToTaskQueueExecutionJob';

-- ProvisioningWaitingWorkflowExecutionJob - com.blazon.accessmanagement.provisioning.jobs

update Job 
set className = 'com.blazon.accessmanagement.provisioning.jobs.ProvisioningWaitingWorkflowExecutionJob'
where className like '%ProvisioningWaitingWorkflowExecutionJob';


-- Requests

-- BlazonRequestNewVerifierJob - com.blazon.accessmanagement.requests.jobs

update Job 
set className = 'com.blazon.accessmanagement.requests.jobs.BlazonRequestNewVerifierJob'
where className like '%BlazonRequestNewVerifierJob';

-- BlazonRequestWaitingDependenciesVerifierJob - com.blazon.accessmanagement.requests.jobs

update Job 
set className = 'com.blazon.accessmanagement.requests.jobs.BlazonRequestWaitingDependenciesVerifierJob'
where className like '%BlazonRequestWaitingDependenciesVerifierJob';

-- BlazonRequestWaitingResolvingEntryDependenciesFunctionJob - com.blazon.accessmanagement.requests.jobs

update Job 
set className = 'com.blazon.accessmanagement.requests.jobs.BlazonRequestWaitingResolvingEntryDependenciesFunctionJob'
where className like '%BlazonRequestWaitingResolvingEntryDependenciesFunctionJob';

-- BllazonMultipleRequestFinalizeInExecutionJob - com.blazon.accessmanagement.requests.jobs

update Job 
set className = 'com.blazon.accessmanagement.requests.jobs.BlazonMultipleRequestFinalizeInExecutionJob'
where className like '%BllazonMultipleRequestFinalizeInExecutionJob';

-- BllazonRequestExecutionQueueJob - com.blazon.accessmanagement.requests.jobs

update Job 
set className = 'com.blazon.accessmanagement.requests.jobs.BlazonRequestExecutionQueueJob'
where className like '%BllazonRequestExecutionQueueJob';

-- BllazonRequestQueueJob - com.blazon.accessmanagement.requests.jobs

update Job 
set className = 'com.blazon.accessmanagement.requests.jobs.BlazonRequestQueueJob'
where className like '%BllazonRequestQueueJob';


-- Accounts

-- RevokeExpiredTemporaryAccountsJob - com.blazon.accessmanagement.account.temporaryaccounts.jobs

update Job 
set className = 'com.blazon.accessmanagement.account.temporaryaccounts.jobs.RevokeExpiredTemporaryAccountsJob'
where className like '%RevokeExpiredTemporaryAccountsJob';

-- FindAccountReadyToRemove - com.blazon.accessmanagement.account.jobs

update Job 
set className = 'com.blazon.accessmanagement.account.jobs.FindAccountReadyToRemove'
where className like '%FindAccountReadyToRemove';


-- Entitlements

-- FindEntitlementReadyToRemove - com.blazon.accessmanagement.entitlement.jobs

update Job 
set className = 'com.blazon.accessmanagement.entitlement.jobs.FindEntitlementReadyToRemove'
where className like '%FindEntitlementReadyToRemove';

-- FindMembershipEntitlementReadyToRemove - com.blazon.accessmanagement.entitlement.jobs

update Job 
set className = 'com.blazon.accessmanagement.entitlement.jobs.FindMembershipEntitlementReadyToRemove'
where className like '%FindMembershipEntitlementReadyToRemove';


-- Certification

-- CertificationCampaignFinalizeJob - com.blazon.governance.certification.campaign.jobs

update Job 
set className = 'com.blazon.governance.certification.campaign.jobs.CertificationCampaignFinalizeJob'
where className like '%CertificationCampaignFinalizeJob';

-- CertificationRecurrentCampaignStartJob - com.blazon.governance.certification.campaign.jobs

update Job 
set className = 'com.blazon.governance.certification.campaign.jobs.CertificationRecurrentCampaignStartJob'
where className like '%CertificationRecurrentCampaignStartJob';

-- CertificationRunsOnceOnlyCampaignStartJob - com.blazon.governance.certification.campaign.jobs

update Job 
set className = 'com.blazon.governance.certification.campaign.jobs.CertificationRunsOnceOnlyCampaignStartJob'
where className like '%CertificationRunsOnceOnlyCampaignStartJob';

-- RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob - com.blazon.governance.certification.campaign.jobs

update Job 
set className = 'com.blazon.governance.certification.campaign.jobs.RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob'
where className like '%RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob';

-- MicroCertificationExecutionInstanceFinalizeJob - com.blazon.governance.certification.micro.jobs

update Job 
set className = 'com.blazon.governance.certification.micro.jobs.MicroCertificationExecutionInstanceFinalizeJob'
where className like '%MicroCertificationExecutionInstanceFinalizeJob';

-- RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob - com.blazon.governance.certification.micro.jobs

update Job 
set className = 'com.blazon.governance.certification.micro.jobs.RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob'
where className like '%RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob';

-- CertificationExecutorPolicyJob - com.blazon.governance.certification.policy.jobs

update Job 
set className = 'com.blazon.governance.certification.policy.jobs.CertificationExecutorPolicyJob'
where className like '%CertificationExecutorPolicyJob';

-- CertificationQueueJob - com.blazon.governance.certification.policy.jobs

update Job 
set className = 'com.blazon.governance.certification.policy.jobs.CertificationQueueJob'
where className like '%CertificationQueueJob';

-- CertificationRevokeExecutionQueueJob - com.blazon.governance.certification.policy.jobs

update Job 
set className = 'com.blazon.governance.certification.policy.jobs.CertificationRevokeExecutionQueueJob'
where className like '%CertificationRevokeExecutionQueueJob';

-- CertificationSelectorExecutionInstanceFinalizeJob - com.blazon.governance.certification.selector.instance.jobs

update Job 
set className = 'com.blazon.governance.certification.selector.instance.jobs.CertificationSelectorExecutionInstanceFinalizeJob'
where className like '%CertificationSelectorExecutionInstanceFinalizeJob';

-- RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob - com.blazon.governance.certification.selector.instance.jobs

update Job 
set className = 'com.blazon.governance.certification.selector.instance.jobs.RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob'
where className like '%RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob';


-- Reconciliation

-- ReconciliationBatchEntryCertifierJob - com.blazon.governance.reconciliation.jobs

update Job 
set className = 'com.blazon.governance.reconciliation.jobs.ReconciliationBatchEntryCertifierJob'
where className like '%ReconciliationBatchEntryCertifierJob';

-- ReconciliationStep01_NotProcessedToAssociatingRulesJob - com.blazon.governance.reconciliation.jobs

update Job 
set className = 'com.blazon.governance.reconciliation.jobs.ReconciliationStep01_NotProcessedToAssociatingRulesJob'
where className like '%ReconciliationStep01_NotProcessedToAssociatingRulesJob';

-- ReconciliationStep02_RulesAssociatedToDiscoveringSituationJob - com.blazon.governance.reconciliation.jobs

update Job 
set className = 'com.blazon.governance.reconciliation.jobs.ReconciliationStep02_RulesAssociatedToDiscoveringSituationJob'
where className like '%ReconciliationStep02_RulesAssociatedToDiscoveringSituationJob';

-- ReconciliationStep03_SituationDiscoveredToAttributeMappingJob - com.blazon.governance.reconciliation.jobs

update Job 
set className = 'com.blazon.governance.reconciliation.jobs.ReconciliationStep03_SituationDiscoveredToAttributeMappingJob'
where className like '%ReconciliationStep03_SituationDiscoveredToAttributeMappingJob';

-- ReconciliationStep04_MappedAttributesToInvokingActionJob - com.blazon.governance.reconciliation.jobs

update Job 
set className = 'com.blazon.governance.reconciliation.jobs.ReconciliationStep04_MappedAttributesToInvokingActionJob'
where className like '%ReconciliationStep04_MappedAttributesToInvokingActionJob';

-- ReconciliationStepReadyToInvokeActionJob - com.blazon.governance.reconciliation.jobs

update Job 
set className = 'com.blazon.governance.reconciliation.jobs.ReconciliationStepReadyToInvokeActionJob'
where className like '%ReconciliationStepReadyToInvokeActionJob';


-- SoD

-- SodEntryInfoProcessorJob - com.blazon.governance.sod.jobs

update Job 
set className = 'com.blazon.governance.sod.jobs.SodEntryInfoProcessorJob'
where className like '%SodEntryInfoProcessorJob';

-- SodEntryToExecutionJob - com.blazon.governance.sod.jobs

update Job 
set className = 'com.blazon.governance.sod.jobs.SodEntryToExecutionJob'
where className like '%SodEntryToExecutionJob';

-- SodPolicyExecutorJob - com.blazon.governance.sod.jobs

update Job 
set className = 'com.blazon.governance.sod.jobs.SodPolicyExecutorJob'
where className like '%SodPolicyExecutorJob';


-- Human Tasks

-- TaskEscalationTimeBasedJob - com.blazon.humantasks.jobs

update Job 
set className = 'com.blazon.humantasks.jobs.TaskEscalationTimeBasedJob'
where className like '%TaskEscalationTimeBasedJob';

-- TaskSlaQueueJob - com.blazon.humantasks.jobs

update Job 
set className = 'com.blazon.humantasks.jobs.TaskSlaQueueJob'
where className like '%TaskSlaQueueJob';

-- TaskWillExpireSlaQueueJob - com.blazon.humantasks.jobs

update Job 
set className = 'com.blazon.humantasks.jobs.TaskWillExpireSlaQueueJob'
where className like '%TaskWillExpireSlaQueueJob';


-- Business Rules

-- FindMembershipRoleReadyToRemove - com.blazon.identitybusinessrules.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.jobs.FindMembershipRoleReadyToRemove'
where className like '%FindMembershipRoleReadyToRemove';

-- FindRoleReadyToRemove - com.blazon.identitybusinessrules.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.jobs.FindRoleReadyToRemove'
where className like '%FindRoleReadyToRemove';

-- RoleRightsUserVerifierJob - com.blazon.identitybusinessrules.rolerights.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.rolerights.jobs.RoleRightsUserVerifierJob'
where className like '%RoleRightsUserVerifierJob';

-- RoleRightEntryProcessorJob - com.blazon.identitybusinessrules.rolerights.process.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.rolerights.process.jobs.RoleRightEntryProcessorJob'
where className like '%RoleRightEntryProcessorJob';

-- RoleRightEntryToExecutionJob - com.blazon.identitybusinessrules.rolerights.process.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.rolerights.process.jobs.RoleRightEntryToExecutionJob'
where className like '%RoleRightEntryToExecutionJob';

-- RoleRightRevokeProcessorJob - com.blazon.identitybusinessrules.rolerights.revoke.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.rolerights.revoke.jobs.RoleRightRevokeProcessorJob'
where className like '%RoleRightRevokeProcessorJob';


-- Identity Management

-- CalculateUserRiskJob - com.blazon.identitymanagement.jobs

update Job 
set className = 'com.blazon.identitymanagement.jobs.CalculateUserRiskJob'
where className like '%CalculateUserRiskJob';

-- FindUserReadyToRemove - com.blazon.identitymanagement.jobs

update Job 
set className = 'com.blazon.identitymanagement.jobs.FindUserReadyToRemove'
where className like '%FindUserReadyToRemove';

-- InactivateAccountsFromInactivatedUsersJob - com.blazon.identitymanagement.jobs

update Job 
set className = 'com.blazon.identitymanagement.jobs.InactivateAccountsFromInactivatedUsersJob'
where className like '%InactivateAccountsFromInactivatedUsersJob';

-- PasswordPolicyValidationJob - com.blazon.identitymanagement.passwordpolicy.jobs 

update Job 
set className = 'com.blazon.identitymanagement.passwordpolicy.jobs.PasswordPolicyValidationJob'
where className like '%PasswordPolicyValidationJob';


-- Email

-- SendEmailQueueJob - com.blazon.infrastructure.email.job	

update Job 
set className = 'com.blazon.infrastructure.email.job.SendEmailQueueJob'
where className like '%SendEmailQueueJob';


-- Mfa (mudar o nome) 

-- MfaBllazonOtpRemoveQueueJob - com.blazon.identitymanagement.authentication.securechannel.jobs

update Job 
set className = 'com.blazon.identitymanagement.authentication.securechannel.jobs.MfaBlazonOtpRemoveQueueJob'
where className like '%MfaBllazonOtpRemoveQueueJob';

-- MfaBllazonOtpQueueJob - com.blazon.identitymanagement.authentication.securechannel.jobs

update Job 
set className = 'com.blazon.identitymanagement.authentication.securechannel.jobs.MfaBlazonOtpQueueJob'
where className like '%MfaBllazonOtpQueueJob';


-- Assignment

-- AssignmentProcessorPhaseOneJob - com.blazon.identitybusinessrules.assignmentpolicy.jobs 

update Job 
set className = 'com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentProcessorPhaseOneJob'
where className like '%AssignmentProcessorPhaseOneJob';

-- AssignmentProcessorPhaseTwoJob - com.blazon.identitybusinessrules.assignmentpolicy.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentProcessorPhaseTwoJob'
where className like '%AssignmentProcessorPhaseTwoJob';


-- Remover esses Jobs

-- Remove permanentemente as RemoveMembershipOrganizationsJob do diretório

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RemoveMembershipOrganizationsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RemoveMembershipOrganizationsJob'
);

delete from Job	
where className like '%RemoveMembershipOrganizationsJob';

-- Remove permanentemente as organizações do diretório (com.blazon.identitymanagement.directory.jobs.RemoveOrganizationsJob)

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RemoveOrganizationsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RemoveOrganizationsJob'
);

delete from Job	
where className like '%RemoveOrganizationsJob';

-- Executa regras de membros de organização (com.blazon.identitymanagement.directory.schemas.organization.jobs.OrganizationRuleJob)

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%OrganizationRuleJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%OrganizationRuleJob'
);

delete from Job	
where className like '%OrganizationRuleJob';


-- Remove com.blazon.identitymanagement.policies.certificationpolicy.selector.jobs.CertificationSelectorEntryFinalizeJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%CertificationSelectorEntryFinalizeJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%CertificationSelectorEntryFinalizeJob'
);

delete from Job	
where className like '%CertificationSelectorEntryFinalizeJob';


-- Deletar RevokeExpiredMembershipEntitlementsJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RevokeExpiredMembershipEntitlementsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RevokeExpiredMembershipEntitlementsJob'
);

delete from Job	
where className like '%RevokeExpiredMembershipEntitlementsJob';


-- InactivateExpiredAccountsJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%InactivateExpiredAccountsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%InactivateExpiredAccountsJob'
);

delete from Job	
where className like '%InactivateExpiredAccountsJob';


-- InactivateExpiredUsersJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%InactivateExpiredUsersJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%InactivateExpiredUsersJob'
);

delete from Job	
where className like '%InactivateExpiredUsersJob';


-- RemoveUsersFromExpiredRolesJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RemoveUsersFromExpiredRolesJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RemoveUsersFromExpiredRolesJob'
);

delete from Job	
where className like '%RemoveUsersFromExpiredRolesJob';


-- RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob

update Job 
set className = 'com.blazon.identitybusinessrules.rolerights.revoke.notifications.jobs.RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob'
where className like '%RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob';


-- CertificationCampaignStartJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%CertificationCampaignStartJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%CertificationCampaignStartJob'
);

delete from Job	
where className like '%CertificationCampaignStartJob';


-- QRTZ_JOB_DETAILS

delete from QRTZ_CRON_TRIGGERS;

delete from QRTZ_TRIGGERS;

delete from QRTZ_JOB_DETAILS;



RENAME TABLE ManagerRole TO Groupp;

RENAME TABLE ManagerRole_InternalPermissionGroup TO Groupp_InternalPermissionGroup;

RENAME TABLE ManagerRole_User TO Groupp_User;

RENAME TABLE TaskQueue_ManagerRole TO TaskQueue_Groupp;



ALTER TABLE Groupp_InternalPermissionGroup CHANGE COLUMN managerRoles_id groups_id bigint not null;

ALTER TABLE Groupp_User CHANGE COLUMN ManagerRole_id Group_id bigint not null;

ALTER TABLE TaskQueue_Groupp CHANGE COLUMN managerRoles_id groups_id bigint not null;

ALTER TABLE TaskQueue_Groupp drop foreign key FKrd8be9kl9ei6298118yer8jl8;







-- NotificationTemplate

drop table NotificationTemplate;


-- ServerMailSetup



-- NotificationSettings

create table NotificationSettings (
    id bigint not null auto_increment,
    category varchar(255),
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- AccountNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('ACCOUNT',0,'Blazon Create Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATE_ACCOUNT_NOTIFICATION')
,('ACCOUNT',0,'Blazon Remove Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','REVOKE_ACCOUNT_NOTIFICATION')
,('ACCOUNT',0,'Blazon Activate Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','ACTIVATE_ACCOUNT_NOTIFICATION')
,('ACCOUNT',0,'Blazon Inactivate Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','INACTIVATE_ACCOUNT_NOTIFICATION');

-- AuthenticationMethodsNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('AUTHENTICATION_METHOD',0,'Blazon Send Otp Token Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SENDOTPTOKEN_AUTHENTICATIONMETHODS_NOTIFICATION');


-- BlazonRequestNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('REQUEST',0,'Blazon Success Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SUCCESS_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Error Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','ERROR_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Comment Task Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','COMMENT_TASK_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Resolved Task Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','RESOLVE_TASK_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Open Task Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','OPEN_TASK_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon SLA Reached Task Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SLAREACHED_TASK_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Disapproved Task Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','DISAPPROVED_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Comment Task SOD Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','COMMENT_TASK_SOD_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Resolved Task SOD Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','RESOLVE_TASK_SOD_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Open Task SOD Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','OPEN_TASK_SOD_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon SLA Reached Task SOD Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SLAREACHED_TASK_SOD_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Created Task Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATED_TASK_REQUEST_NOTIFICATION');

-- CertificationNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('CERTIFICATION',0,'Blazon Comment Task Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','COMMENT_TASK_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'Blazon Resolved Task Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','RESOLVE_TASK_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'Blazon Open Task Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','OPEN_TASK_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'Blazon Created Task Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','CREATED_TASK_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'Blazon SLA Reached Task Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','SLAREACHED_TASK_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'User Revoked Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','USER_REVOKED_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'Account Revoked Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','ACCOUNT_REVOKED_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'MembershipRole Revoked Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','MEMBERSHIP_ROLE_REVOKED_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'MembershipEntitlement Revoked Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','MEMBERSHIP_ENTITLEMENT_REVOKED_CERTIFICATION_NOTIFICATION');


-- MembershipEntitlementNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('MEMBERSHIP_ENTITLEMENT',0,'Blazon Create MembershipEntitlement Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATE_MEMBERSHIP_ENTITLEMENT_NOTIFICATION')
,('MEMBERSHIP_ENTITLEMENT',0,'Blazon Remove MembershipEntitlement Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','REMOVE_MEMBERSHIP_ENTITLEMENT_NOTIFICATION')
;


-- MembershipRoleNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('MEMBERSHIP_ROLE',0,'Blazon Create MembershipRole Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATE_MEMBERSHIP_ROLE_NOTIFICATION')
,('MEMBERSHIP_ROLE',0,'Blazon Remove MembershipRole Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','REMOVE_MEMBERSHIP_ROLE_NOTIFICATION');


-- PasswordVaultNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('PASSWORD_VAULT',0,'Blazon Create PasswordVault Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATE_PASSWORDVAULT_NOTIFICATION');


-- ProvisioningNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('PROVISIONING',0,'Blazon Error Provisioning Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','ERROR_PROVISIONING_NOTIFICATION')
,('PROVISIONING',0,'Blazon Comment Task Provisioning Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','COMMENT_TASK_PROVISIONING_NOTIFICATION')
,('PROVISIONING',0,'Blazon Resolved Task Provisioning Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','RESOLVE_TASK_PROVISIONING_NOTIFICATION')
,('PROVISIONING',0,'Blazon Open Task Provisioning Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','OPEN_TASK_PROVISIONING_NOTIFICATION')
,('PROVISIONING',0,'Blazon SLA Reached Task Provisioning Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SLAREACHED_TASK_PROVISIONING_NOTIFICATION');

-- ReconciliationNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('RECONCILIATION',0,'Blazon Error Reconciliation Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','ERROR_RECONCILIATION_NOTIFICATION')
,('RECONCILIATION',0,'Blazon Waiting Resolution Reconciliation Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','WAITING_MANUAL_RESOLUTION_RECONCILIATION_NOTIFICATION');

-- RoleRightRevokeNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('ROLERIGHT_REVOKE',0,'Blazon Waiting Resolution RoleRightRevoke Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','WAITING_RESOLUTION_ROLERIGHTREVOKE_NOTIFICATION')
,('ROLERIGHT_REVOKE',0,'Blazon Comment Task RoleRightRevoke Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','COMMENT_TASK_ROLERIGHT_NOTIFICATION')
,('ROLERIGHT_REVOKE',0,'Blazon Open Task RoleRightRevoke Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','OPEN_TASK_ROLERIGHT_NOTIFICATION')
,('ROLERIGHT_REVOKE',0,'Blazon Resolved Task RoleRightRevoke Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','RESOLVE_TASK_ROLERIGHT_NOTIFICATION')
,('ROLERIGHT_REVOKE',0,'Blazon SLA Reached Task RoleRightRevoke Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SLAREACHED_TASK_ROLERIGHT_NOTIFICATION');


-- SodNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('SOD',0,'SOD Error Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','ERROR_SOD_NOTIFICATION')
,('SOD',0,'SOD Task Comment Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','COMMENT_TASK_SOD_NOTIFICATION')
,('SOD',0,'SOD Resolve Task Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','RESOLVE_TASK_SOD_NOTIFICATION')
,('SOD',0,'SOD Open Task Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','OPEN_TASK_SOD_NOTIFICATION')
,('SOD',0,'SOD SLA Reached Task Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SLAREACHED_TASK_SOD_NOTIFICATION');


-- UserNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('USER',0,'Blazon Activate User Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','ACTIVATE_USER_NOTIFICATION')
,('USER',0,'Change User Password Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CHANGE_PASSWORD_USER_NOTIFICATION')
,('USER',0,'Blazon Create User Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATE_USER_NOTIFICATION')
,('USER',0,'Blazon Inactivate User Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','INACTIVATE_USER_NOTIFICATION')
,('USER',0,'Blazon Lock User Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','LOCK_USER_NOTIFICATION')
,('USER',0,'Blazon Remove User Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','REMOVE_USER_NOTIFICATION')
,('USER',0,'Blazon Unlock User Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','UNLOCK_USER_NOTIFICATION');






-- inserts para InternalPermissionGroup_InternalPermission de ChangeApplicationOwner

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_VISUALIZE' and ip.name = 'LIST_CHANGE_APPLICATION_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_MANAGE' and ip.name = 'LIST_CHANGE_APPLICATION_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_MANAGE' and ip.name = 'RESOLVE_CHANGE_APPLICATION_OWNER_ENTRY';


-- inserts para InternalPermissionGroup_InternalPermission de ChangeAccountPassword

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_VISUALIZE' and ip.name = 'LIST_CHANGE_PASSWORD_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_MANAGE' and ip.name = 'LIST_CHANGE_PASSWORD_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_MANAGE' and ip.name = 'RESOLVE_CHANGE_PASSWORD_ENTRY';


-- inserts para InternalPermissionGroup_InternalPermission de RemoveSharedAccountMember

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_VISUALIZE' and ip.name = 'LIST_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_MANAGE' and ip.name = 'LIST_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_MANAGE' and ip.name = 'RESOLVE_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY';


-- inserts para InternalPermissionGroup_InternalPermission de Approval RoleRight Entries


-- pra Role, o grupo ROLE_MANAGE já atende







-- ImportEntry e ImportBatch

create table ImportBatch (
	id bigint not null auto_increment,
	action varchar(255),
	csvHeader longtext,
	importedAt datetime,
	justification varchar(1000),
	provisioning boolean default false,
	schemaa varchar(255),
	status varchar(255),
	importedBy_id bigint,
	primary key (id)
) ENGINE=InnoDB;

create table ImportBatchUser (
	id bigint not null auto_increment,
	directoryIdentifier bigint,
	displayName varchar(255),
	username varchar(255),
	primary key (id)
) ENGINE=InnoDB;

create table ImportEntry (
	id bigint not null auto_increment,
	errorMsg longtext,
	lockNumber bigint,
	payload longtext,
	status varchar(255),
	importBatch_id bigint,
	primary key (id)
) ENGINE=InnoDB;


-- com.blazon.importation.jobs.ImportJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.importation.jobs.ImportJob', 
'Import Job.', 'Import Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Import Job' as name, 
	'[{\"name\":\"importQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Import Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.importation.jobs.ImportJob';


-- com.blazon.importation.jobs.ImportFinalizeJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.importation.jobs.ImportFinalizeJob', 
'Import Finalize Job.', 'Import Finalize Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Import Finalize Job' as name, 
	'[{\"name\":\"importQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Import Finalize Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.importation.jobs.ImportFinalizeJob';


-- inserts para InternalPermissions Importation

insert into InternalPermission (category, description, label, name) values ('IMPORT', 'Listar Lotes de Importação.', 'Listar Lotes de Importação', 'LIST_IMPORT_BATCH');
insert into InternalPermission (category, description, label, name) values ('IMPORT', 'Criar Lotes de Importação.', 'Criar Lotes de Importação.', 'CREATE_IMPORT_BATCH');

-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Lotes de Importação.', 'Visualizar Lotes de Importação', 'IMPORT_VISUALIZE');
insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Gerenciar Lotes de Importação.', 'Gerenciar Lotes de Importação', 'IMPORT_MANAGE');


-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'IMPORT_VISUALIZE' and ip.name = 'LIST_IMPORT_BATCH';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'IMPORT_VISUALIZE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'IMPORT_MANAGE' and ip.name = 'LIST_IMPORT_BATCH';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'IMPORT_MANAGE' and ip.name = 'CREATE_IMPORT_BATCH';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'IMPORT_MANAGE' and ip.name = 'LIST_USER';



-- remove CertificationExecutorPolicyJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%CertificationExecutorPolicyJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%CertificationExecutorPolicyJob'
);

delete from Job	
where className like '%CertificationExecutorPolicyJob';
-- remove RUN_ONLY_ONCE in CampaignDefinition

alter table CampaignDefinition 
drop column type;

-- delete job CertificationRunsOnceOnlyCampaignStartJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%CertificationRunsOnceOnlyCampaignStartJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%CertificationRunsOnceOnlyCampaignStartJob'
);

delete from Job	
where className like '%CertificationRunsOnceOnlyCampaignStartJob';


-- delete job CertificationCampaignStartJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%CertificationCampaignStartJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%CertificationCampaignStartJob'
);

delete from Job	
where className like '%CertificationCampaignStartJob';


-- rename JobInstance e Job (Recurrent)

update JobInstance set name = 'Certification Campaign Start Job', externalJobDetailId = 'Certification Campaign Start Job' where name like 'Certification Recurrent Campaign Start Job';

update Job set className = 'com.blazon.governance.certification.campaign.jobs.CertificationCampaignStartJob', 
description = 'Certification Recurrent Campaign Start Job.', displayName = 'Certification Recurrent Campaign Start Job' where className like '%CertificationRecurrentCampaignStartJob';










-- AssignmentRoleRevokeEntry

create table AssignmentRoleRevokeEntry (
	id bigint not null auto_increment,
	createdAt datetime,
	lockNumber bigint,
	processedAt datetime,
	resolveAction varchar(255),
	resolveNote varchar(1000),
	resolvedAt datetime,
	status varchar(255),
	resolvedBy_id bigint,
	role_id bigint,
	user_id bigint,
	primary key (id)
) ENGINE=InnoDB;
	
create table AssignmentRoleRevokeRole (
	id bigint not null auto_increment,
	directoryIdentifier bigint,
	name varchar(255),
	primary key (id)
) ENGINE=InnoDB;

create table AssignmentRoleRevokeUser (
	id bigint not null auto_increment,
	directoryIdentifier bigint,
	displayName varchar(255),
	username varchar(255),
	primary key (id)
) ENGINE=InnoDB;


-- AssignmentPolicy

alter table AssignmentPolicy drop column revokeType;


-- com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentRoleRevokeProcessorJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentRoleRevokeProcessorJob', 
'Assignment Role Revoke Processor Job.', 'Assignment Role Revoke Processor Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Assignment Role Revoke Processor Job' as name, 
	'[{\"name\":\"revokeRoleEntriesQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Assignment Role Revoke Processor Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentRoleRevokeProcessorJob';


-- com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentRoleKeepProcessorJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentRoleKeepProcessorJob', 
'Assignment Role Keep Processor Job.', 'Assignment Role Keep Processor Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Assignment Role Keep Processor Job' as name, 
	'[{\"name\":\"keepRoleEntriesQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Assignment Role Keep Processor Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentRoleKeepProcessorJob';
 









-- Task

alter table Task add column currentQueue_id bigint;

-- com.blazon.humantasks.jobs.TaskEscalationPeriodicJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.humantasks.jobs.TaskEscalationPeriodicJob', 
'Task Escalation Periodic Job.', 'Task Escalation Periodic Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Task Escalation Periodic Job' as name, 
	'[{\"name\":\"tasksQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Task Escalation Periodic Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.humantasks.jobs.TaskEscalationPeriodicJob';


-- com.blazon.humantasks.autoescalation.jobs.FindTasksReadyToCancelationJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.humantasks.autoescalation.jobs.FindTasksReadyToCancelationJob', 
'Find Tasks Ready To Cancelation Job.', 'Find Tasks Ready To Cancelation Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Find Tasks Ready To Cancelation Job' as name, 
	'[{\"name\":\"tasksQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Find Tasks Ready To Cancelation Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.humantasks.autoescalation.jobs.FindTasksReadyToCancelationJob';


-- com.blazon.humantasks.autoescalation.jobs.FindTasksToWaitingEscalationJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.humantasks.autoescalation.jobs.FindTasksToWaitingEscalationJob', 
'Find Tasks To Waiting Escalation Job.', 'Find Tasks To Waiting Escalation Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Find Tasks To Waiting Escalation Job' as name, 
	'[{\"name\":\"tasksQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Find Tasks To Waiting Escalation Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.humantasks.autoescalation.jobs.FindTasksToWaitingEscalationJob';


-- com.blazon.humantasks.autoescalation.jobs.ResolveTasksInWaitingEscalationJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.humantasks.autoescalation.jobs.ResolveTasksInWaitingEscalationJob', 
'Resolve Tasks In Waiting Escalation Job.', 'Resolve Tasks In Waiting Escalation Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Resolve Tasks In Waiting Escalation Job' as name, 
	'[{\"name\":\"tasksQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Resolve Tasks In Waiting Escalation Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.humantasks.autoescalation.jobs.ResolveTasksInWaitingEscalationJob';


-- TaskQueueAssignHistory

create table TaskQueueAssignHistory (
	id bigint not null auto_increment,
	assign_date datetime,
	from_id bigint,
	task_id bigint,
	to_id bigint,
	primary key (id)
) ENGINE=InnoDB;


-- TaskEscalationDefinition

create table TaskEscalationDefinition (
    id bigint not null auto_increment,
    token varchar(255),
    url varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- TaskDefinition

alter table TaskDefinition add column escalationDefinition_id bigint;


-- com.blazon.humantasks.escalations.policy.jobs.TaskEscalationPeriodicJob

update Job set className = 'com.blazon.humantasks.escalations.policy.jobs.TaskEscalationPeriodicJob' where className like '%TaskEscalationPeriodicJob';


-- com.blazon.humantasks.escalations.policy.jobs.TaskEscalationTimeBasedJob

update Job set className = 'com.blazon.humantasks.escalations.policy.jobs.TaskEscalationTimeBasedJob' where className like '%TaskEscalationTimeBasedJob';


-- com.blazon.humantasks.queues.jobs.TaskSlaQueueJob

update Job set className = 'com.blazon.humantasks.queues.jobs.TaskSlaQueueJob' where className like '%TaskSlaQueueJob';


-- com.blazon.humantasks.queues.jobs.TaskWillExpireSlaQueueJob

update Job set className = 'com.blazon.humantasks.queues.jobs.TaskWillExpireSlaQueueJob' where className like '%TaskWillExpireSlaQueueJob';


-- com.blazon.humantasks.escalations.auto.jobs.FindTasksReadyToCancelationJob

update Job set className = 'com.blazon.humantasks.escalations.auto.jobs.FindTasksReadyToCancelationJob' where className like '%FindTasksReadyToCancelationJob';


-- com.blazon.humantasks.escalations.auto.jobs.FindTasksToWaitingEscalationJob

update Job set className = 'com.blazon.humantasks.escalations.auto.jobs.FindTasksToWaitingEscalationJob' where className like '%FindTasksToWaitingEscalationJob';


-- com.blazon.humantasks.escalations.auto.jobs.ResolveTasksInWaitingEscalationJob

update Job set className = 'com.blazon.humantasks.escalations.auto.jobs.ResolveTasksInWaitingEscalationJob' where className like '%ResolveTasksInWaitingEscalationJob';

