-- script23.txt

-- Job MembershipEntitlementsCreatedSinceLastExecutionMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.directory.jobs.MembershipEntitlementsCreatedSinceLastExecutionMonitoringJob', 'MembershipEntitlements Created Since Last Execution Monitoring Job.', 'MembershipEntitlements Created Since Last Execution Monitoring Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'MembershipEntitlements Created Since Last Execution Monitoring Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'MembershipEntitlements Created Since Last Execution Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.directory.jobs.MembershipEntitlementsCreatedSinceLastExecutionMonitoringJob';


-- Job AccountsCreatedSinceLastExecutionMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.directory.jobs.AccountsCreatedSinceLastExecutionMonitoringJob', 'Accounts Created Since Last Execution Monitoring Job.', 'Accounts Created Since Last Execution Monitoring Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Accounts Created Since Last Execution Monitoring Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Accounts Created Since Last Execution Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.directory.jobs.AccountsCreatedSinceLastExecutionMonitoringJob';


-- Job MembershipRolesCreatedSinceLastExecutionMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.directory.jobs.MembershipRolesCreatedSinceLastExecutionMonitoringJob', 'MembershipRoles Created Since Last Execution Monitoring Job.', 'MembershipRoles Created Since Last Execution Monitoring Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'MembershipRoles Created Since Last Execution Monitoring Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'MembershipRoles Created Since Last Execution Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.directory.jobs.MembershipRolesCreatedSinceLastExecutionMonitoringJob';


-- Job UsersCreatedSinceLastExecutionMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.directory.jobs.UsersCreatedSinceLastExecutionMonitoringJob', 'Users Created Since Last Execution Monitoring Job.', 'Users Created Since Last Execution Monitoring Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Users Created Since Last Execution Monitoring Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Users Created Since Last Execution Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.directory.jobs.UsersCreatedSinceLastExecutionMonitoringJob';


-- Job ReconciliationEntriesInWaitingManualDispatchMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.reconciliation.jobs.ReconciliationEntriesInWaitingManualDispatchMonitoringJob', 'Reconciliation Entries In Waiting Manual Dispatch Monitoring Job.', 'Reconciliation Entries In Waiting Manual Dispatch Monitoring Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Reconciliation Entries In Waiting Manual Dispatch Monitoring Job' as name, 
	NULL as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Reconciliation Entries In Waiting Manual Dispatch Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.reconciliation.jobs.ReconciliationEntriesInWaitingManualDispatchMonitoringJob';


-- Job ReconciliationEntriesInErrorSinceLastExecutionMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.reconciliation.jobs.ReconciliationEntriesInErrorSinceLastExecutionMonitoringJob', 'Reconciliation Entries In Error Since Last Execution Monitoring Job.', 'Reconciliation Entries In Error Since Last Execution Monitoring Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Reconciliation Entries In Error Since Last Execution Monitoring Job' as name, 
	NULL as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Reconciliation Entries In Error Since Last Execution Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.reconciliation.jobs.ReconciliationEntriesInErrorSinceLastExecutionMonitoringJob';


-- Job ProvisioningEntriesInErrorSinceLastExecutionMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.provisioning.jobs.ProvisioningEntriesInErrorSinceLastExecutionMonitoringJob', 'Provisioning Entries In Error Since Last Execution Monitoring Job.', 'Provisioning Entries In Error Since Last Execution Monitoring Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Provisioning Entries In Error Since Last Execution Monitoring Job' as name, 
	NULL as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Provisioning Entries In Error Since Last Execution Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.provisioning.jobs.ProvisioningEntriesInErrorSinceLastExecutionMonitoringJob';


-- AmountTasksSlaReachedByCategoryMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.tasks.jobs.AmountTasksSlaReachedByCategoryMonitoringJob', 'Amount Tasks Sla Reached By Category Monitoring Job.', 'Amount Tasks Sla Reached By Category Monitoring Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Tasks Sla Reached By Category Monitoring Job' as name, 
	NULL as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Tasks Sla Reached By Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountTasksSlaReachedByCategoryMonitoringJob';


-- AmountOpenTasksByCategoryMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob', 
'Amount Open Tasks By Category Monitoring Job.', 'Amount Open Tasks By Category Monitoring Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Open Tasks By (APPROVAL_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"APPROVAL_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Open Tasks By (APPROVAL_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob';


insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Open Tasks By (PROVISIONING_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"PROVISIONING_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Open Tasks By (PROVISIONING_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob';


insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Open Tasks By (CERTIFICATION_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"CERTIFICATION_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Open Tasks By (CERTIFICATION_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob';


insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Open Tasks By (SOD_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"SOD_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Open Tasks By (SOD_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob';


insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Open Tasks By (ROLE_RIGHT_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"ROLE_RIGHT_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Open Tasks By (ROLE_RIGHT_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob';


insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Open Tasks By (REQUEST_SOD_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"REQUEST_SOD_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Open Tasks By (REQUEST_SOD_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountOpenTasksByCategoryMonitoringJob';


-- AmountResolvedTasksByCategoryMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob', 
'Amount Resolved Tasks By Category Monitoring Job.', 'Amount Resolved Tasks By Category Monitoring Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Resolved Tasks By (APPROVAL_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"APPROVAL_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Resolved Tasks By (APPROVAL_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob';


insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Resolved Tasks By (PROVISIONING_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"PROVISIONING_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Resolved Tasks By (PROVISIONING_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob';


insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Resolved Tasks By (CERTIFICATION_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"CERTIFICATION_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Resolved Tasks By (CERTIFICATION_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob';


insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Resolved Tasks By (SOD_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"SOD_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Resolved Tasks By (SOD_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob';
		

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Resolved Tasks By (ROLE_RIGHT_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"ROLE_RIGHT_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Resolved Tasks By (ROLE_RIGHT_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob';
	

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Amount Resolved Tasks By (REQUEST_SOD_TASK) Category Monitoring Job' as name, 
	'[{\"name\":\"taskCategory\", \"value\":\"REQUEST_SOD_TASK\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Amount Resolved Tasks By (REQUEST_SOD_TASK) Category Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.tasks.jobs.AmountResolvedTasksByCategoryMonitoringJob';
	
		
		
