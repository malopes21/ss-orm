
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


-- CertificationEntry

alter table CertificationEntry add column deadline datetime;


-- CampaignExecutionInstance

ALTER TABLE CampaignExecutionInstance drop foreign key FKtkbluunr5y46x411vhu6rmrx6;

alter table CampaignExecutionInstance drop column campaign_id;

alter table CampaignExecutionInstance drop column fileContentId;

alter table CampaignExecutionInstance add column campaignId bigint;

alter table CampaignExecutionInstance add column name varchar(255);

alter table CampaignExecutionInstance add column certificationWorkflowName varchar(255);


-- CampaignDefinition

alter table CampaignDefinition drop column fileContent;

alter table CampaignDefinition add column fileContentId bigint;

alter table CampaignDefinition add column name varchar(255);


-- CampaignDefinition_CertificationPolicy

drop table if exists CampaignDefinition_CertificationPolicy;


