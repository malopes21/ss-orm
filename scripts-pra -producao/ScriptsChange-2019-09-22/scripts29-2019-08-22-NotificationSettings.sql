-- 22/08/2019

-- UserNotificationSettings

create table UserNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;


insert into UserNotificationSettings (subject, type, template) values ('Blazon User Activate Notification', 'ACTIVATE_USER_NOTIFICATION', '<html><head></head><body></body></html>');

insert into UserNotificationSettings (subject, type, template) values ('Blazon Change User Password Notification', 'CHANGE_PASSWORD_USER_NOTIFICATION', '<html><head></head><body></body></html>');

insert into UserNotificationSettings (subject, type, template) values ('Blazon Create User Notification', 'CREATE_USER_NOTIFICATION', '<html><head></head><body></body></html>');

insert into UserNotificationSettings (subject, type, template) values ('Blazon Inactivate User Notification', 'INACTIVATE_USER_NOTIFICATION', '<html><head></head><body></body></html>');

insert into UserNotificationSettings (subject, type, template) values ('Blazon Lock User Notification', 'LOCK_USER_NOTIFICATION', '<html><head></head><body></body></html>');

insert into UserNotificationSettings (subject, type, template) values ('Blazon Remove User Notification', 'REMOVE_USER_NOTIFICATION', '<html><head></head><body></body></html>');

insert into UserNotificationSettings (subject, type, template) values ('Blazon Unlock User Notification', 'UNLOCK_USER_NOTIFICATION', '<html><head></head><body></body></html>');


-- BlazonRequestNotificationSettings

create table BlazonRequestNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

insert into BlazonRequestNotificationSettings (subject, type, template) values ('Blazon Success Request Notification', 'SUCCESS_REQUEST_NOTIFICATION', '<html><head></head><body></body></html>');

insert into BlazonRequestNotificationSettings (subject, type, template) values ('Blazon Error Request Notification', 'ERROR_REQUEST_NOTIFICATION', '<html><head></head><body></body></html>');

insert into BlazonRequestNotificationSettings (subject, type, template) values ('Blazon Comment Task Request Notification', 'COMMENT_TASK_REQUEST_NOTIFICATION', '<html><head></head><body></body></html>');

insert into BlazonRequestNotificationSettings (subject, type, template) values ('Blazon Resolved Task Request Notification', 'RESOLVE_TASK_REQUEST_NOTIFICATION', '<html><head></head><body></body></html>');

insert into BlazonRequestNotificationSettings (subject, type, template) values ('Blazon Open Task Request Notification', 'OPEN_TASK_REQUEST_NOTIFICATION', '<html><head></head><body></body></html>');

insert into BlazonRequestNotificationSettings (subject, type, template) values ('Blazon SLA Reached Task Request Notification', 'SLAREACHED_TASK_REQUEST_NOTIFICATION', '<html><head></head><body></body></html>');

insert into BlazonRequestNotificationSettings (subject, type, template) values ('Blazon Comment Task SOD Request Notification', 'COMMENT_TASK_SOD_REQUEST_NOTIFICATION', '<html><head></head><body></body></html>');

insert into BlazonRequestNotificationSettings (subject, type, template) values ('Blazon Resolved Task SOD Request Notification', 'RESOLVE_TASK_SOD_REQUEST_NOTIFICATION', '<html><head></head><body></body></html>');

insert into BlazonRequestNotificationSettings (subject, type, template) values ('Blazon Open Task SOD Request Notification', 'OPEN_TASK_SOD_REQUEST_NOTIFICATION', '<html><head></head><body></body></html>');

insert into BlazonRequestNotificationSettings (subject, type, template) values ('Blazon SLA Reached Task SOD Request Notification', 'SLAREACHED_TASK_SOD_REQUEST_NOTIFICATION', '<html><head></head><body></body></html>');


-- AccountNotificationSettings

create table AccountNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

insert into AccountNotificationSettings (subject, type, template) values ('Blazon Create Account Notification', 'CREATE_ACCOUNT_NOTIFICATION', '<html><head></head><body></body></html>');

insert into AccountNotificationSettings (subject, type, template) values ('Blazon Activate Account Notification', 'ACTIVATE_ACCOUNT_NOTIFICATION', '<html><head></head><body></body></html>');

insert into AccountNotificationSettings (subject, type, template) values ('Blazon Inactivate Account Notification', 'INACTIVATE_ACCOUNT_NOTIFICATION', '<html><head></head><body></body></html>');

insert into AccountNotificationSettings (subject, type, template) values ('Blazon Remove Account Notification', 'REMOVE_ACCOUNT_NOTIFICATION', '<html><head></head><body></body></html>');


-- MembershipRoleNotificationSettings

create table MembershipRoleNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

insert into MembershipRoleNotificationSettings (subject, type, template) values ('Blazon Create Membership Role Notification', 'CREATE_MEMBERSHIP_ROLE_NOTIFICATION', '<html><head></head><body></body></html>');

insert into MembershipRoleNotificationSettings (subject, type, template) values ('Blazon Remove Membership Role Notification', 'REMOVE_MEMBERSHIP_ROLE_NOTIFICATION', '<html><head></head><body></body></html>');


-- MembershipEntitlementNotificationSettings

create table MembershipEntitlementNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

insert into MembershipEntitlementNotificationSettings (subject, type, template) values ('Blazon Create Membership Entitlement Notification', 'CREATE_MEMBERSHIP_ENTITLEMENT_NOTIFICATION', '<html><head></head><body></body></html>');

insert into MembershipEntitlementNotificationSettings (subject, type, template) values ('Blazon Remove Membership Entitlement Notification', 'REMOVE_MEMBERSHIP_ENTITLEMENT_NOTIFICATION', '<html><head></head><body></body></html>');


-- ProvisioningNotificationSettings

create table ProvisioningNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

insert into ProvisioningNotificationSettings (subject, type, template) values ('Blazon Error Provisioning Notification', 'ERROR_PROVISIONING_NOTIFICATION', '<html><head></head><body></body></html>');

insert into ProvisioningNotificationSettings (subject, type, template) values ('Blazon Comment Task Provisioning Notification', 'COMMENT_TASK_PROVISIONING_NOTIFICATION', '<html><head></head><body></body></html>');

insert into ProvisioningNotificationSettings (subject, type, template) values ('Blazon Resolved Task Provisioning Notification', 'RESOLVE_TASK_PROVISIONING_NOTIFICATION', '<html><head></head><body></body></html>');

insert into ProvisioningNotificationSettings (subject, type, template) values ('Blazon Open Task Provisioning Notification', 'OPEN_TASK_PROVISIONING_NOTIFICATION', '<html><head></head><body></body></html>');

insert into ProvisioningNotificationSettings (subject, type, template) values ('Blazon SLA Reached Task Provisioning Notification', 'SLAREACHED_TASK_PROVISIONING_NOTIFICATION', '<html><head></head><body></body></html>');


-- ReconciliationNotificationSettings

create table ReconciliationNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

insert into ReconciliationNotificationSettings (subject, type, template) values ('Blazon Error Reconciliation Notification', 'ERROR_RECONCILIATION_NOTIFICATION', '<html><head></head><body></body></html>');

insert into ReconciliationNotificationSettings (subject, type, template) values ('Blazon Waiting Manual Reconciliation Resolution Notification', 'WAITING_MANUAL_RESOLUTION_RECONCILIATION_NOTIFICATION', '<html><head></head><body></body></html>');


-- RoleRightRevokeNotificationSettings

create table RoleRightRevokeNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;


insert into RoleRightRevokeNotificationSettings (subject, type, template) values ('Blazon Waiting RoleRightRevoke Resolution Notification', 'WAITING_RESOLUTION_ROLERIGHT_NOTIFICATION', '<html><head></head><body></body></html>');

insert into RoleRightRevokeNotificationSettings (subject, type, template) values ('Blazon Comment Task RoleRightRevoke Notification', 'COMMENT_TASK_ROLERIGHT_NOTIFICATION', '<html><head></head><body></body></html>');

insert into RoleRightRevokeNotificationSettings (subject, type, template) values ('Blazon Resolved Task RoleRightRevoke Notification', 'RESOLVE_TASK_ROLERIGHT_NOTIFICATION', '<html><head></head><body></body></html>');

insert into RoleRightRevokeNotificationSettings (subject, type, template) values ('Blazon Open Task RoleRightRevoke Notification', 'OPEN_TASK_ROLERIGHT_NOTIFICATION', '<html><head></head><body></body></html>');

insert into RoleRightRevokeNotificationSettings (subject, type, template) values ('Blazon SLA Reached Task RoleRightRevoke Notification', 'SLAREACHED_TASK_ROLERIGHT_NOTIFICATION', '<html><head></head><body></body></html>');


-- CertificationNotificationSettings

create table CertificationNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

insert into CertificationNotificationSettings (subject, type, template) values ('Blazon Error Certification Notification', 'ERROR_CERTIFICATION_NOTIFICATION', '<html><head></head><body></body></html>');

insert into CertificationNotificationSettings (subject, type, template) values ('Blazon Comment Task Certification Notification', 'COMMENT_TASK_CERTIFICATION_NOTIFICATION', '<html><head></head><body></body></html>');

insert into CertificationNotificationSettings (subject, type, template) values ('Blazon Resolved Task Certification Notification', 'RESOLVE_TASK_CERTIFICATION_NOTIFICATION', '<html><head></head><body></body></html>');

insert into CertificationNotificationSettings (subject, type, template) values ('Blazon Open Task Certification Notification', 'OPEN_TASK_CERTIFICATION_NOTIFICATION', '<html><head></head><body></body></html>');

insert into CertificationNotificationSettings (subject, type, template) values ('Blazon SLA Reached Task Certification Notification', 'SLAREACHED_TASK_CERTIFICATION_NOTIFICATION', '<html><head></head><body></body></html>');


-- SodNotificationSettings

create table SodNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

insert into SodNotificationSettings (subject, type, template) values ('Blazon Error SOD Notification', 'ERROR_SOD_NOTIFICATION', '<html><head></head><body></body></html>');

insert into SodNotificationSettings (subject, type, template) values ('Blazon Comment Task SOD Notification', 'COMMENT_TASK_SOD_NOTIFICATION', '<html><head></head><body></body></html>');

insert into SodNotificationSettings (subject, type, template) values ('Blazon Resolved Task SOD Notification', 'RESOLVE_TASK_SOD_NOTIFICATION', '<html><head></head><body></body></html>');

insert into SodNotificationSettings (subject, type, template) values ('Blazon Open Task SOD Notification', 'OPEN_TASK_SOD_NOTIFICATION', '<html><head></head><body></body></html>');

insert into SodNotificationSettings (subject, type, template) values ('Blazon SLA Reached Task SOD Notification', 'SLAREACHED_TASK_SOD_NOTIFICATION', '<html><head></head><body></body></html>');


-- Job RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.directory.schemas.role.rights.rolerightsrevoke.notifications.jobs.RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob', 'RoleRight Entry Waiting Resolution Since Last Execution Notification Job.', 'RoleRight Entry Waiting Resolution Since Last Execution Notification Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'RoleRight Entry Waiting Resolution Since Last Execution Notification Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Blazon Notification Job' as externalGroupId,
	'RoleRight Entry Waiting Resolution Since Last Execution Notification Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.rolerightsrevoke.notifications.jobs.RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob';


-- 27/08/2019
 
-- Ajustes nos jobs por causa do refactoring de move do rolerights e rolerightsrevoke

update Job set className = 'com.blazon.identitymanagement.directory.schemas.role.rights.rolerights.jobs.RoleRightEntryProcessorJob' where className = 'com.blazon.identitymanagement.rolerights.jobs.RoleRightEntryProcessorJob';

update Job set className = 'com.blazon.identitymanagement.directory.schemas.role.rights.rolerights.jobs.RoleRightEntryToExecutionJob' where className = 'com.blazon.identitymanagement.rolerights.jobs.RoleRightEntryToExecutionJob';

update Job set className = 'com.blazon.identitymanagement.directory.schemas.role.rights.rolerightsrevoke.jobs.RoleRightRevokeProcessorJob' where className = 'com.blazon.identitymanagement.rolerightsrevoke.jobs.RoleRightRevokeProcessorJob';

update Job set className = 'com.blazon.identitymanagement.directory.schemas.role.rights.rolerightsrevoke.notifications.jobs.RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob' where className = 'com.blazon.identitymanagement.rolerightsrevoke.notifications.jobs.RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob';


-- AmountOpenTasksByCategoryMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob', 'Amount Open Tasks By Category Monitoring Job.', 'Amount Open Tasks By Category Monitoring Job', '[{\"name\":\"taskCategory\", \"value\":\"APPROVAL_TASK\"}]');

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Open Tasks By Category (APPROVAL_TASK) Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"APPROVAL_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Blazon Monitoring Jobs' as externalGroupId,
	'Amount Open Tasks By Category (APPROVAL_TASK) Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob';

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Open Tasks By Category (PROVISIONING_TASK) Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"PROVISIONING_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Blazon Monitoring Jobs' as externalGroupId,
	'Amount Open Tasks By Category (PROVISIONING_TASK) Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob';

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Open Tasks By Category (CERTIFICATION_TASK) Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"CERTIFICATION_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Blazon Monitoring Jobs' as externalGroupId,
	'Amount Open Tasks By Category (CERTIFICATION_TASK) Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob';

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Open Tasks By Category (SOD_TASK) Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"SOD_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Blazon Monitoring Jobs' as externalGroupId,
	'Amount Open Tasks By Category (SOD_TASK) Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob';

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Open Tasks By Category (ROLE_RIGHT_TASK) Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"ROLE_RIGHT_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Blazon Monitoring Jobs' as externalGroupId,
	'Amount Open Tasks By Category (ROLE_RIGHT_TASK) Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob';

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Open Tasks By Category (REQUEST_SOD_TASK) Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"REQUEST_SOD_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Blazon Monitoring Jobs' as externalGroupId,
	'Amount Open Tasks By Category (REQUEST_SOD_TASK) Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob';


-- AmountResolvedTasksByCategoryMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob', 'Amount Resolved Tasks By Category Monitoring Job.', 'Amount Resolved Tasks By Category Monitoring Job', '[{\"name\":\"taskCategory\", \"value\":\"APPROVAL_TASK\"}]');

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Resolved Tasks By Category (APPROVAL_TASK) Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"APPROVAL_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Blazon Monitoring Jobs' as externalGroupId,
	'Amount Open Tasks By Category (APPROVAL_TASK) Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob';

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Resolved Tasks By Category (PROVISIONING_TASK) Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"PROVISIONING_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Blazon Monitoring Jobs' as externalGroupId,
	'Amount Open Tasks By Category (PROVISIONING_TASK) Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob';

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Resolved Tasks By Category (CERTIFICATION_TASK) Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"CERTIFICATION_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Blazon Monitoring Jobs' as externalGroupId,
	'Amount Open Tasks By Category (CERTIFICATION_TASK) Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob';

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Resolved Tasks By Category (SOD_TASK) Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"SOD_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Blazon Monitoring Jobs' as externalGroupId,
	'Amount Open Tasks By Category (SOD_TASK) Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob';

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Resolved Tasks By Category (ROLE_RIGHT_TASK) Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"ROLE_RIGHT_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Blazon Monitoring Jobs' as externalGroupId,
	'Amount Open Tasks By Category (ROLE_RIGHT_TASK) Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob';

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Resolved Tasks By Category (REQUEST_SOD_TASK) Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"REQUEST_SOD_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Blazon Monitoring Jobs' as externalGroupId,
	'Amount Open Tasks By Category (REQUEST_SOD_TASK) Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob';


-- BlazonRequest

ALTER TABLE BlazonRequest
ADD COLUMN approvalProcess varchar(255);

ALTER TABLE BlazonRequest
ADD COLUMN sodProcess varchar(255);

ALTER TABLE BlazonRequest
ADD COLUMN provisioningStartedAt datetime;

ALTER TABLE BlazonRequest
ADD COLUMN provisioningFinishedAt datetime;

