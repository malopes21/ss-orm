-- 22/08/2019

create table ANALYTICS_REQUEST_AVERAGE_HISTOGRAM (
    date datetime not null,
    averageActivateAccountRequestTime bigint,
    averageApprovalRequestTime bigint,
    averageAssignEntitlementRequestTime bigint,
    averageAssignRoleRequestsTime bigint,
    averageChangeStatusUserRequestTime bigint,
    averageCreateAccountRequestTime bigint,
    averageGeneralRequestTime bigint,
    averageInactivateAccountRequestTime bigint,
    averageLockUserRequestTime bigint,
    averageNewUserRequestTime bigint,
    averageProvisioningRequestTime bigint,
    averageRemoveAccountRequestTime bigint,
    averageRemoveEntitlementFromAccountRequestTime bigint,
    averageRemoveUserFromRoleRequestTime bigint,
    averageRemoveUserRequestTime bigint,
    averageResetPasswordRequestTime bigint,
    averageSodRequestTime bigint,
    averageUnlockUserRequestTime bigint,
    averageUpdateAccountRequestTime bigint,
    averageUpdateUserRequestTime bigint,
    primary key (date)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_DETAIL_CREATED_GENERAL_HISTOGRAM (
    dateCollect datetime not null,
    amountActivateAccountRequests bigint,
    amountAssignEntitlementRequests bigint,
    amountAssignRoleRequests bigint,
    amountChangeStatusUserRequests bigint,
    amountCreateAccountRequests bigint,
    amountInactivateAccountRequests bigint,
    amountLockUserRequests bigint,
    amountNewUserRequests bigint,
    amountRemoveAccountRequests bigint,
    amountRemoveEntitlementFromAccountRequests bigint,
    amountRemoveUserFromRoleRequests bigint,
    amountRemoveUserRequests bigint,
    amountRequests bigint,
    amountResetPasswordRequests bigint,
    amountUnlockUserRequests bigint,
    amountUpdateAccountRequests bigint,
    amountUpdateUserRequests bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_DETAIL_CREATED_MANUAL_HISTOGRAM (
    dateCollect datetime not null,
    amountActivateAccountRequests bigint,
    amountAssignEntitlementRequests bigint,
    amountAssignRoleRequests bigint,
    amountChangeStatusUserRequests bigint,
    amountCreateAccountRequests bigint,
    amountInactivateAccountRequests bigint,
    amountLockUserRequests bigint,
    amountNewUserRequests bigint,
    amountRemoveAccountRequests bigint,
    amountRemoveEntitlementFromAccountRequests bigint,
    amountRemoveUserFromRoleRequests bigint,
    amountRemoveUserRequests bigint,
    amountRequests bigint,
    amountResetPasswordRequests bigint,
    amountUnlockUserRequests bigint,
    amountUpdateAccountRequests bigint,
    amountUpdateUserRequests bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_DETAIL_CREATED_SYSTEM_HISTOGRAM (
    dateCollect datetime not null,
    amountActivateAccountRequests bigint,
    amountAssignEntitlementRequests bigint,
    amountAssignRoleRequests bigint,
    amountChangeStatusUserRequests bigint,
    amountCreateAccountRequests bigint,
    amountInactivateAccountRequests bigint,
    amountLockUserRequests bigint,
    amountNewUserRequests bigint,
    amountRemoveAccountRequests bigint,
    amountRemoveEntitlementFromAccountRequests bigint,
    amountRemoveUserFromRoleRequests bigint,
    amountRemoveUserRequests bigint,
    amountRequests bigint,
    amountResetPasswordRequests bigint,
    amountUnlockUserRequests bigint,
    amountUpdateAccountRequests bigint,
    amountUpdateUserRequests bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_DETAIL_FINALIZED_GENERAL_HISTOGRAM (
    dateCollect datetime not null,
    amountActivateAccountRequests bigint,
    amountAssignEntitlementRequests bigint,
    amountAssignRoleRequests bigint,
    amountChangeStatusUserRequests bigint,
    amountCreateAccountRequests bigint,
    amountInactivateAccountRequests bigint,
    amountLockUserRequests bigint,
    amountNewUserRequests bigint,
    amountRemoveAccountRequests bigint,
    amountRemoveEntitlementFromAccountRequests bigint,
    amountRemoveUserFromRoleRequests bigint,
    amountRemoveUserRequests bigint,
    amountRequests bigint,
    amountResetPasswordRequests bigint,
    amountUnlockUserRequests bigint,
    amountUpdateAccountRequests bigint,
    amountUpdateUserRequests bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_DETAIL_FINALIZED_MANUAL_HISTOGRAM (
    dateCollect datetime not null,
    amountActivateAccountRequests bigint,
    amountAssignEntitlementRequests bigint,
    amountAssignRoleRequests bigint,
    amountChangeStatusUserRequests bigint,
    amountCreateAccountRequests bigint,
    amountInactivateAccountRequests bigint,
    amountLockUserRequests bigint,
    amountNewUserRequests bigint,
    amountRemoveAccountRequests bigint,
    amountRemoveEntitlementFromAccountRequests bigint,
    amountRemoveUserFromRoleRequests bigint,
    amountRemoveUserRequests bigint,
    amountRequests bigint,
    amountResetPasswordRequests bigint,
    amountUnlockUserRequests bigint,
    amountUpdateAccountRequests bigint,
    amountUpdateUserRequests bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_DETAIL_FINALIZED_SYSTEM_HISTOGRAM (
    dateCollect datetime not null,
    amountActivateAccountRequests bigint,
    amountAssignEntitlementRequests bigint,
    amountAssignRoleRequests bigint,
    amountChangeStatusUserRequests bigint,
    amountCreateAccountRequests bigint,
    amountInactivateAccountRequests bigint,
    amountLockUserRequests bigint,
    amountNewUserRequests bigint,
    amountRemoveAccountRequests bigint,
    amountRemoveEntitlementFromAccountRequests bigint,
    amountRemoveUserFromRoleRequests bigint,
    amountRemoveUserRequests bigint,
    amountRequests bigint,
    amountResetPasswordRequests bigint,
    amountUnlockUserRequests bigint,
    amountUpdateAccountRequests bigint,
    amountUpdateUserRequests bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;


-- ANALYTICS_REQUEST_DETAIL_HISTOGRAM add:

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountByValidationErrorStatus bigint;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountBySodNotAllowedStatus bigint;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountApprovedRequests bigint;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountNotApprovedRequests bigint;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountNotNeededApprovalRequests bigint;


-- Analytics Request

create table ANALYTICS_REQUEST_LESS_AMOUNT_APPROVERS (
    userId bigint not null,
    displayName varchar(255) not null,
    amount bigint not null,
    primary key (userId)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_HIGH_AMOUNT_APPROVERS (
    userId bigint not null,
    displayName varchar(255) not null,
    amount bigint not null,
    primary key (userId)
) ENGINE=InnoDB;

ALTER TABLE ANALYTICS_REQUEST_FASTEST_APPROVERS
DROP COLUMN averageApprovalTime;

ALTER TABLE ANALYTICS_REQUEST_SLOWEST_APPROVERS
DROP COLUMN averageApprovalTime;

ALTER TABLE ANALYTICS_REQUEST_FASTEST_APPROVERS
ADD COLUMN amount bigint;

ALTER TABLE ANALYTICS_REQUEST_SLOWEST_APPROVERS
ADD COLUMN amount bigint;

-- Jobs

-- CreatedGeneralRequestsDetailHistogramJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.request.job.CreatedGeneralRequestsDetailHistogramJob', 'Created General Requests Detail Histogram Job.', 'Created General Requests Detail Histogram Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Created General Requests Detail Histogram Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Created General Requests Detail Histogram Job' as externalGroupId,
	'Created General Requests Detail Histogram Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.request.job.CreatedGeneralRequestsDetailHistogramJob';


-- CreatedManualRequestsDetailHistogramJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.request.job.CreatedManualRequestsDetailHistogramJob', 'Created Manual Requests Detail Histogram Job.', 'Created Manual Requests Detail Histogram Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Created Manual Requests Detail Histogram Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Created Manual Requests Detail Histogram Job' as externalGroupId,
	'Created Manual Requests Detail Histogram Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.request.job.CreatedManualRequestsDetailHistogramJob';


-- CreatedSystemRequestsDetailHistogramJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.request.job.CreatedSystemRequestsDetailHistogramJob', 'Created System Requests Detail Histogram Job.', 'Created System Requests Detail Histogram Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Created System Requests Detail Histogram Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Created System Requests Detail Histogram Job' as externalGroupId,
	'Created System Requests Detail Histogram Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.request.job.CreatedSystemRequestsDetailHistogramJob';


-- FinalizedGeneralRequestsDetailHistogramJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.request.job.FinalizedGeneralRequestsDetailHistogramJob', 'Finalized General Requests Detail Histogram Job.', 'Finalized General Requests Detail Histogram Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Finalized General Requests Detail Histogram Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Finalized General Requests Detail Histogram Job' as externalGroupId,
	'Finalized General Requests Detail Histogram Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.request.job.FinalizedGeneralRequestsDetailHistogramJob';


-- FinalizedManualRequestsDetailHistogramJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.request.job.FinalizedManualRequestsDetailHistogramJob', 'Finalized Manual Requests Detail Histogram Job.', 'Finalized Manual Requests Detail Histogram Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Finalized Manual Requests Detail Histogram Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Finalized Manual Requests Detail Histogram Job' as externalGroupId,
	'Finalized Manual Requests Detail Histogram Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.request.job.FinalizedManualRequestsDetailHistogramJob';


-- FinalizedSystemRequestsDetailHistogramJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.request.job.FinalizedSystemRequestsDetailHistogramJob', 'Finalized System Requests Detail Histogram Job.', 'Finalized System Requests Detail Histogram Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Finalized System Requests Detail Histogram Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Finalized System Requests Detail Histogram Job' as externalGroupId,
	'Finalized System Requests Detail Histogram Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.request.job.FinalizedSystemRequestsDetailHistogramJob';


-- RequestAverageHistogramJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.request.RequestAverageFactJob', 'Request Average Fact Job.', 'Request Average Fact Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Request Average Fact Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Request Average Fact Job' as externalGroupId,
	'Request Average Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.request.RequestAverageFactJob';


-- ANALYTICS_REQUEST_APPROVAL_TASK_DETAIL_HISTOGRAM

create table ANALYTICS_REQUEST_APPROVAL_TASK_DETAIL_HISTOGRAM (
    dateCollect datetime not null,
    amountOpenApprovalAssignEntitlementTasksByPeriod bigint,
    amountOpenApprovalAssignRoleTasksByPeriod bigint,
    amountOpenApprovalCreateAccountTasksByPeriod bigint,
    amountOpenApprovalTaskByPeriod bigint,
    amountResolvedApprovalAssignEntitlementTasksByPeriod bigint,
    amountResolvedApprovalAssignRoleTasksByPeriod bigint,
    amountResolvedApprovalCreateAccountTasksByPeriod bigint,
    amountResolvedApprovalTasksByPeriod bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;


-- ANALYTICS_REQUEST_DETAIL_HISTOGRAM add:

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountByValidationErrorStatus bigint;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountBySodNotAllowedStatus bigint;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountApprovedRequests bigint;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountNotApprovedRequests bigint;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountNotNeededApprovalRequests bigint;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountNeededApprovalRequests bigint;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountNeededSodRequests bigint;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountNotNeededSodRequests bigint;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountSodAllowedRequests bigint;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM
ADD COLUMN amountSodNotAllowedRequests bigint;

