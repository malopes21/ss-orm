
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



