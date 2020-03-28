

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




