
-- directory

-- com.blazon.monitoring.directory.account.jobs.AccountsCreatedSinceLastExecutionMonitoringJob

UPDATE JobInstance set 
name = 'Accounts Created Since Last Execution Monitoring Job',
description = 'Accounts Created Since Last Execution Monitoring Job.',
externalJobDetailId = 'Accounts Created Since Last Execution Monitoring Job'
where job_id in ( select id from Job where className like '%AccountsCreatedSinceLastExecutionMonitoringJob');

update Job 
set className = 'com.blazon.monitoring.directory.account.jobs.AccountsCreatedSinceLastExecutionMonitoringJob',
description = 'Accounts Created Since Last Execution Monitoring Job.',
displayName = 'Accounts Created Since Last Execution Monitoring Job'
where className like '%AccountsCreatedSinceLastExecutionMonitoringJob';	


-- com.blazon.monitoring.directory.entitlement.jobs.MembershipEntitlementsCreatedSinceLastExecutionMonitoringJob

UPDATE JobInstance set 
name = 'Membership Entitlements Created Since Last Execution Monitoring Job',
description = 'Membership Entitlements Created Since Last Execution Monitoring Job.',
externalJobDetailId = 'Membership Entitlements Created Since Last Execution Monitoring Job'
where job_id in ( select id from Job where className like '%MembershipEntitlementsCreatedSinceLastExecutionMonitoringJob');

update Job 
set className = 'com.blazon.monitoring.directory.entitlement.jobs.MembershipEntitlementsCreatedSinceLastExecutionMonitoringJob',
description = 'Membership Entitlements Created Since Last Execution Monitoring Job.',
displayName = 'Membership Entitlements Created Since Last Execution Monitoring Job'
where className like '%MembershipEntitlementsCreatedSinceLastExecutionMonitoringJob';	


-- com.blazon.monitoring.directory.role.jobs.MembershipRolesCreatedSinceLastExecutionMonitoringJob

UPDATE JobInstance set 
name = 'Membership Roles Created Since Last Execution Monitoring Job',
description = 'Membership Roles Created Since Last Execution Monitoring Job.',
externalJobDetailId = 'Membership Roles Created Since Last Execution Monitoring Job'
where job_id in ( select id from Job where className like '%MembershipRolesCreatedSinceLastExecutionMonitoringJob');

update Job 
set className = 'com.blazon.monitoring.directory.role.jobs.MembershipRolesCreatedSinceLastExecutionMonitoringJob',
description = 'Membership Roles Created Since Last Execution Monitoring Job.',
displayName = 'Membership Roles Created Since Last Execution Monitoring Job'
where className like '%MembershipRolesCreatedSinceLastExecutionMonitoringJob';	


-- com.blazon.monitoring.directory.user.jobs.UsersCreatedSinceLastExecutionMonitoringJob

UPDATE JobInstance set 
name = 'Users Created Since Last Execution Monitoring Job',
description = 'Users Created Since Last Execution Monitoring Job.',
externalJobDetailId = 'Users Created Since Last Execution Monitoring Job'
where job_id in ( select id from Job where className like '%UsersCreatedSinceLastExecutionMonitoringJob');

update Job 
set className = 'com.blazon.monitoring.directory.user.jobs.UsersCreatedSinceLastExecutionMonitoringJob',
description = 'Users Created Since Last Execution Monitoring Job.',
displayName = 'Users Created Since Last Execution Monitoring Job'
where className like '%UsersCreatedSinceLastExecutionMonitoringJob';	


-- accountmanagement

-- com.blazon.monitoring.accountmanagement.jobs.HasOpenChangeApplicationAccountOwnerEntriesMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.accountmanagement.jobs.HasOpenChangeApplicationAccountOwnerEntriesMonitoringJob', 
'Has Open Change Application Account Owner Entries Monitoring Job.', 'Has Open Change Application Account Owner Entries Monitoring Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Has Open Change Application Account Owner Entries Monitoring Job' as name, 
	'[]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Has Open Change Application Account Owner Entries Monitoring Job' as externalGroupId,
	'Has Open Change Application Account Owner Entries Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.accountmanagement.jobs.HasOpenChangeApplicationAccountOwnerEntriesMonitoringJob';	


-- com.blazon.monitoring.accountmanagement.jobs.HasOpenChangePasswordAccountEntriesMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.accountmanagement.jobs.HasOpenChangePasswordAccountEntriesMonitoringJob', 
'Has Open Change Password Account Entries Monitoring Job.', 'Has Open Change Password Account Entries Monitoring Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Has Open Change Password Account Entries Monitoring Job' as name, 
	'[]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Has Open Change Password Account Entries Monitoring Job' as externalGroupId,
	'Has Open Change Password Account Entries Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.accountmanagement.jobs.HasOpenChangePasswordAccountEntriesMonitoringJob';	


-- com.blazon.monitoring.accountmanagement.jobs.HasOpenRemoveSharedAccountMembershipEntriesMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.accountmanagement.jobs.HasOpenRemoveSharedAccountMembershipEntriesMonitoringJob', 
'Has Open Remove Shared Account Membership Entries Monitoring Job.', 'Has Open Change Password Account Entries Monitoring Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Has Open Remove Shared Account Membership Entries Monitoring Job' as name, 
	'[]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Has Open Remove Shared Account Membership Entries Monitoring Job' as externalGroupId,
	'Has Open Remove Shared Account Membership Entries Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.accountmanagement.jobs.HasOpenRemoveSharedAccountMembershipEntriesMonitoringJob';	


-- rolemanagement

-- com.blazon.monitoring.rolemanagement.jobs.HasOpenAssignmentRoleRevokeEntriesMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.rolemanagement.jobs.HasOpenAssignmentRoleRevokeEntriesMonitoringJob', 
'Has Open Assignment Role Revoke Entries Monitoring Job.', 'Has Open Assignment Role Revoke Entries Monitoring Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Has Open Assignment Role Revoke Entries Monitoring Job' as name, 
	'[]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Has Open Assignment Role Revoke Entries Monitoring Job' as externalGroupId,
	'Has Open Assignment Role Revoke Entries Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.rolemanagement.jobs.HasOpenAssignmentRoleRevokeEntriesMonitoringJob';	


-- com.blazon.monitoring.rolemanagement.jobs.HasOpenAccountRoleRightRevokeEntriesMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.rolemanagement.jobs.HasOpenAccountRoleRightRevokeEntriesMonitoringJob', 
'Has Open Account RoleRight Revoke Entries Monitoring Job.', 'Has Open Account RoleRight Revoke Entries Monitoring Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Has Open Account RoleRight Revoke Entries Monitoring Job' as name, 
	'[]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Has Open Account RoleRight Revoke Entries Monitoring Job' as externalGroupId,
	'Has Open Account RoleRight Revoke Entries Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.rolemanagement.jobs.HasOpenAccountRoleRightRevokeEntriesMonitoringJob';	


-- com.blazon.monitoring.rolemanagement.jobs.HasOpenMembershipEntitlementRoleRightRevokeEntriesMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.rolemanagement.jobs.HasOpenMembershipEntitlementRoleRightRevokeEntriesMonitoringJob', 
'Has Open Membership Entitlement RoleRight Revoke Entries Monitoring Job.', 'Has Open Membership Entitlement RoleRight Revoke Entries Monitoring Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Has Open Membership Entitlement RoleRight Revoke Entries Monitoring Job' as name, 
	'[]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Has Open Membership Entitlement RoleRight Revoke Entries Monitoring Job' as externalGroupId,
	'Has Open Membership Entitlement RoleRight Revoke Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.rolemanagement.jobs.HasOpenMembershipEntitlementRoleRightRevokeEntriesMonitoringJob';	


-- AmountOpenTasksByCategoryMonitoringJob

update JobInstance set params = '[{\"name\":\"taskCategory\", \"value\":\"APPROVAL_TASK\"}]'
where name = 'Amount Open Tasks By Category (APPROVAL_TASK) Monitoring Job';

update JobInstance set params = '[{\"name\":\"taskCategory\", \"value\":\"CERTIFICATION_TASK\"}]'
where name = 'Amount Open Tasks By Category (CERTIFICATION_TASK) Monitoring Job';

update JobInstance set params = '[{\"name\":\"taskCategory\", \"value\":\"ROLE_RIGHT_TASK\"}]'
where name = 'Amount Open Tasks By Category (ROLE_RIGHT_TASK) Monitoring Job';

update JobInstance set params = '[{\"name\":\"taskCategory\", \"value\":\"PROVISIONING_TASK\"}]'
where name = 'Amount Open Tasks By Category (PROVISIONING_TASK) Monitoring Job';

update JobInstance set params = '[{\"name\":\"taskCategory\", \"value\":\"SOD_TASK\"}]'
where name = 'Amount Open Tasks By Category (SOD_TASK) Monitoring Job';

update JobInstance set params = '[{\"name\":\"taskCategory\", \"value\":\"REQUEST_SOD_TASK\"}]'
where name = 'Amount Open Tasks By Category (REQUEST_SOD_TASK) Monitoring Job';









