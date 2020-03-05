
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









