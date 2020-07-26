
-- ImportBatch

alter table ImportBatch add column finalizedAt datetime;


-- ImportEntry

alter table ImportEntry add column createdAt datetime;

alter table ImportEntry add column finalizedAt datetime;


-- SelfServiceCartInstanceItem

alter table SelfServiceCartInstanceItem add column needSelectAccount bit;

alter table SelfServiceCartInstanceItem add column needExpirationDate bit;

-- ImportBatch

alter table ImportBatch add column fileContentId bigint;

alter table ImportBatch add column lockNumber bigint;

-- com.blazon.importation.jobs.ImportBatchJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.importation.jobs.ImportBatchJob', 
'Import Batch Job.', 'Import Batch Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Import Batch Job' as name, 
	'[{\"name\":\"batchQueueLength\", \"value\":\"1\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Import Batch Job' as externalGroupId,
	'Import Batch Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.importation.jobs.ImportBatchJob';


