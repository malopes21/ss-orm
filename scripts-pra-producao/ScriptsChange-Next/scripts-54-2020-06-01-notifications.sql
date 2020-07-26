
-- NotificationSettings

alter table NotificationSettings add column broadcast boolean default false;

alter table NotificationSettings add column groupId bigint;

update NotificationSettings set type = 'SENDOTPTOKEN_AUTHENTICATIONMETHODS_NOTIFICATION' where id = 5;


-- drop certification tables

drop table CampaignExecutionInstance_CertificationEntry;

drop table CertificationPolicy_CertificationEntry;

drop table MicroCertificationExecutionInstance_CertificationEntry;

drop table SelectorExecutionInstance_CertificationEntry;


-- CampaignDefinition

alter table CampaignDefinition add column lockNumber bigint;

alter table CampaignDefinition add column lockDate datetime;

alter table CampaignExecutionInstance add column lockNumber bigint;

alter table CampaignExecutionInstance add column lockDate datetime;


-- CertificationEntry

alter table CertificationEntry add column executionInstanceId varchar(255); 



