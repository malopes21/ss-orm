
-- AssignmentRoleRevokeEntry

create table AssignmentRoleRevokeEntry (
	id bigint not null auto_increment,
	createdAt datetime,
	lockNumber bigint,
	processedAt datetime,
	resolveAction varchar(255),
	resolveNote varchar(1000),
	resolvedAt datetime,
	status varchar(255),
	resolvedBy_id bigint,
	role_id bigint,
	user_id bigint,
	primary key (id)
) ENGINE=InnoDB;
	
create table AssignmentRoleRevokeRole (
	id bigint not null auto_increment,
	directoryIdentifier bigint,
	name varchar(255),
	primary key (id)
) ENGINE=InnoDB;

create table AssignmentRoleRevokeUser (
	id bigint not null auto_increment,
	directoryIdentifier bigint,
	displayName varchar(255),
	username varchar(255),
	primary key (id)
) ENGINE=InnoDB;


-- AssignmentPolicy

alter table AssignmentPolicy drop column revokeType;


-- com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentRoleRevokeProcessorJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentRoleRevokeProcessorJob', 
'Assignment Role Revoke Processor Job.', 'Assignment Role Revoke Processor Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Assignment Role Revoke Processor Job' as name, 
	'[{\"name\":\"revokeRoleEntriesQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Assignment Role Revoke Processor Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentRoleRevokeProcessorJob';


-- com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentRoleKeepProcessorJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentRoleKeepProcessorJob', 
'Assignment Role Keep Processor Job.', 'Assignment Role Keep Processor Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Assignment Role Keep Processor Job' as name, 
	'[{\"name\":\"keepRoleEntriesQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Assignment Role Keep Processor Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentRoleKeepProcessorJob';
 








