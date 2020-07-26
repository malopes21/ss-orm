
-- RoleRightGrantAndRevokeEntry

create table RoleRightGrantAndRevokeEntry (
    id bigint not null auto_increment,
    action varchar(255),
    createdAt datetime,
    entryId bigint,
    entryType varchar(255),
    lockDate datetime,
    lockNumber bigint,
    processedAt datetime,
    roleId bigint,
    status varchar(255),
    userId bigint,
    waitingDependenciesSince datetime,
    primary key (id)
) ENGINE=InnoDB;


-- com.blazon.rolemanagement.rolerights.grantandrevoke.jobs.FindRoleRightGrantAndRevokeEntriesNotProcessedJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.rolemanagement.rolerights.grantandrevoke.jobs.FindRoleRightGrantAndRevokeEntriesNotProcessedJob', 
'Find Role Right Grant And Revoke Entries Not Processed Job.', 'Find Role Right Grant And Revoke Entries Not Processed Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Find Role Right Grant And Revoke Entries Not Processed Job' as name, 
	'[{\"name\":\"entriesQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Find Role Right Grant And Revoke Entries Not Processed Job' as externalGroupId,
	'Find Role Right Grant And Revoke Entries Not Processed Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.rolemanagement.rolerights.grantandrevoke.jobs.FindRoleRightGrantAndRevokeEntriesNotProcessedJob';


-- com.blazon.rolemanagement.rolerights.grantandrevoke.jobs.FindRoleRightGrantAndRevokeEntriesInWaitingDependenciesJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.rolemanagement.rolerights.grantandrevoke.jobs.FindRoleRightGrantAndRevokeEntriesInWaitingDependenciesJob', 
'Find Role Right Grant And Revoke Entries In Waiting Dependencies Job.', 'Find Role Right Grant And Revoke Entries In Waiting Dependencies Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Find Role Right Grant And Revoke Entries In Waiting Dependencies Job' as name, 
	'[{\"name\":\"entriesQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Find Role Right Grant And Revoke Entries In Waiting Dependencies Job' as externalGroupId,
	'Find Role Right Grant And Revoke Entries In Waiting Dependencies Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.rolemanagement.rolerights.grantandrevoke.jobs.FindRoleRightGrantAndRevokeEntriesInWaitingDependenciesJob';





