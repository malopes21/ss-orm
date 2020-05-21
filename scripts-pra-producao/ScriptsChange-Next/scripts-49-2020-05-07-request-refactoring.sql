
-- SodTaskDetail

alter table SodTaskDetail drop foreign key FK1h5y78oacm9gousrecvtirqab;

alter table SodTaskDetail drop column task_id;

alter table SodTaskDetail add column taskId bigint;


-- ApprovalTaskDetail

alter table ApprovalTaskDetail drop foreign key FKop8ar5k550jfrm0pkjy96g2n0;

alter table ApprovalTaskDetail drop column task_id;

alter table ApprovalTaskDetail add column taskId bigint;


-- update BlazonMultipleRequestFinalizeInExecutionJob

UPDATE JobInstance set 
name = 'Blazon Multiple Request Finalize In Execution Job',
description = 'Blazon Multiple Request Finalize In Execution Job.',
externalJobDetailId = 'Blazon Multiple Request Finalize In Execution Job'
where job_id in ( select id from Job where className like '%BlazonMultipleRequestFinalizeInExecutionJob');

update Job 
set className = 'com.blazon.requests.engine.jobs.BlazonMultipleRequestFinalizeInExecutionJob',
description = 'Blazon Multiple Request Finalize In Execution Job.',
displayName = 'Blazon Multiple Request Finalize In Execution Job'
where className like '%BlazonMultipleRequestFinalizeInExecutionJob';


-- update BlazonRequestExecutionQueueJob

UPDATE JobInstance set 
name = 'Blazon Request Execution Queue Job',
description = 'Blazon Request Execution Queue Job.',
externalJobDetailId = 'Blazon Request Execution Queue Job'
where job_id in ( select id from Job where className like '%BlazonRequestExecutionQueueJob');

update Job 
set className = 'com.blazon.requests.engine.jobs.BlazonRequestExecutionQueueJob',
description = 'Blazon Request Execution Queue Job.',
displayName = 'Blazon Request Execution Queue Job'
where className like '%BlazonRequestExecutionQueueJob';


-- update BlazonRequestNewVerifierJob

UPDATE JobInstance set 
name = 'Blazon Request New Verifier Job',
description = 'Blazon Request New Verifier Job.',
externalJobDetailId = 'Blazon Request New Verifier Job'
where job_id in ( select id from Job where className like '%BlazonRequestNewVerifierJob');

update Job 
set className = 'com.blazon.requests.engine.jobs.BlazonRequestNewVerifierJob',
description = 'Blazon Request New Verifier Job.',
displayName = 'Blazon Request New Verifier Job'
where className like '%BlazonRequestNewVerifierJob';


-- update BlazonRequestQueueJob

UPDATE JobInstance set 
name = 'Blazon Request Queue Job',
description = 'Blazon Request Queue Job.',
externalJobDetailId = 'Blazon Request Queue Job'
where job_id in ( select id from Job where className like '%BlazonRequestQueueJob');

update Job 
set className = 'com.blazon.requests.engine.jobs.BlazonRequestQueueJob',
description = 'Blazon Request Queue Job.',
displayName = 'Blazon Request Queue Job'
where className like '%BlazonRequestQueueJob';


-- update BlazonRequestWaitingDependenciesVerifierJob

UPDATE JobInstance set 
name = 'Blazon Request Waiting Dependencies Verifier Job',
description = 'Blazon Request Waiting Dependencies Verifier Job.',
externalJobDetailId = 'Blazon Request Waiting Dependencies Verifier Job'
where job_id in ( select id from Job where className like '%BlazonRequestWaitingDependenciesVerifierJob');

update Job 
set className = 'com.blazon.requests.engine.jobs.BlazonRequestWaitingDependenciesVerifierJob',
description = 'Blazon Request Waiting Dependencies Verifier Job.',
displayName = 'Blazon Request Waiting Dependencies Verifier Job'
where className like '%BlazonRequestWaitingDependenciesVerifierJob';


-- update BlazonRequestWaitingResolvingEntryDependenciesFunctionJob

UPDATE JobInstance set 
name = 'Blazon Request Waiting Resolving Entry Dependencies Function Job',
description = 'Blazon Request Waiting Resolving Entry Dependencies Function Job.',
externalJobDetailId = 'Blazon Request Waiting Resolving Entry Dependencies Function Job'
where job_id in ( select id from Job where className like '%BlazonRequestWaitingResolvingEntryDependenciesFunctionJob');

update Job 
set className = 'com.blazon.requests.engine.jobs.BlazonRequestWaitingResolvingEntryDependenciesFunctionJob',
description = 'Blazon Request Waiting Resolving Entry Dependencies Function Job.',
displayName = 'Blazon Request Waiting Resolving Entry Dependencies Function Job'
where className like '%BlazonRequestWaitingResolvingEntryDependenciesFunctionJob';


-- BlazonRequest (removendo o multiple request)

alter table BlazonRequest drop column parent_id;

drop table BlazonRequest_dependsOnIds;

-- deletar job com.blazon.requests.engine.jobs.BlazonMultipleRequestFinalizeInExecutionJob 

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%BlazonMultipleRequestFinalizeInExecutionJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%BlazonMultipleRequestFinalizeInExecutionJob'
);

delete from Job	
where className like '%BlazonMultipleRequestFinalizeInExecutionJob';





