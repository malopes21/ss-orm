-- JOBS de Analytics (do Deivisson)	

-- ProvisioningDetailFactJob

INSERT
	INTO
	Job (className,
	description,
	displayName,
	parameters)
VALUES ('com.blazon.analytics.etl.jobs.provisioning.ProvisioningDetailFactJob',
'Job responsible for calculating provisioning details fact',
'Provisioning Detail Fact Job',
NULL);

INSERT
	INTO
	JobInstance (name,
	description,
	params,
	job_id,
	activated,
	cronExpression,
	externalGroupId,
	externalJobDetailId)
SELECT
	job.displayName AS name,
	job.description AS description,
	NULL AS params,
	job.id AS job_id,
	FALSE AS activated,
	'0 0 0 * * ?' AS cronExpression,
	'Blazon Analytics Job' AS externalGroupId,
	job.displayName AS externalJobDetailId
FROM
	Job job
WHERE
	job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningDetailFactJob';


-- ProvisioningCreatedEntryFactJob

INSERT
	INTO
	Job (className,
	description,
	displayName,
	parameters)
VALUES ('com.blazon.analytics.etl.jobs.provisioning.ProvisioningCreatedEntryFactJob',
'Job responsible for calculating created provisioning entries by entry type fact',
'Provisioning Created Entry Fact Job',
NULL);

INSERT
	INTO
	JobInstance (name,
	description,
	params,
	job_id,
	activated,
	cronExpression,
	externalGroupId,
	externalJobDetailId)
SELECT
	job.displayName AS name,
	job.description AS description,
	NULL AS params,
	job.id AS job_id,
	FALSE AS activated,
	'0 0 0 * * ?' AS cronExpression,
	'Blazon Analytics Job' AS externalGroupId,
	job.displayName AS externalJobDetailId
FROM
	Job job
WHERE
	job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningCreatedEntryFactJob';


-- ProvisioningFinishedEntryFactJob

INSERT
	INTO
	Job (className,
	description,
	displayName,
	parameters)
VALUES ('com.blazon.analytics.etl.jobs.provisioning.ProvisioningFinishedEntryFactJob',
'Job responsible for calculating finished provisioning entries by entry type fact',
'Provisioning Finished Entry Fact Job',
NULL);

INSERT
	INTO
	JobInstance (name,
	description,
	params,
	job_id,
	activated,
	cronExpression,
	externalGroupId,
	externalJobDetailId)
SELECT
	job.displayName AS name,
	job.description AS description,
	NULL AS params,
	job.id AS job_id,
	FALSE AS activated,
	'0 0 0 * * ?' AS cronExpression,
	'Blazon Analytics Job' AS externalGroupId,
	job.displayName AS externalJobDetailId
FROM
	Job job
WHERE
	job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFinishedEntryFactJob';


-- ProvisioningTaskFactJob

INSERT
	INTO
	Job (className,
	description,
	displayName,
	parameters)
VALUES ('com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskFactJob',
'Job responsible for calculating provisioning task entries details fact',
'Provisioning Task Fact Job',
NULL);

INSERT
	INTO
	JobInstance (name,
	description,
	params,
	job_id,
	activated,
	cronExpression,
	externalGroupId,
	externalJobDetailId)
SELECT
	job.displayName AS name,
	job.description AS description,
	NULL AS params,
	job.id AS job_id,
	FALSE AS activated,
	'0 0 0 * * ?' AS cronExpression,
	'Blazon Analytics Job' AS externalGroupId,
	job.displayName AS externalJobDetailId
FROM
	Job job
WHERE
	job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskFactJob';


-- TaskQueueFactJob

INSERT
	INTO
	Job (className,
	description,
	displayName,
	parameters)
VALUES ('com.blazon.analytics.etl.jobs.task.TaskQueueFactJob',
'Job responsible for calculating the quantity of tasks by queue fact',
'Task Queue Fact Job',
NULL);

INSERT
	INTO
	JobInstance (name,
	description,
	params,
	job_id,
	activated,
	cronExpression,
	externalGroupId,
	externalJobDetailId)
SELECT
	job.displayName AS name,
	job.description AS description,
	NULL AS params,
	job.id AS job_id,
	FALSE AS activated,
	'0 0 0 * * ?' AS cronExpression,
	'Blazon Analytics Job' AS externalGroupId,
	job.displayName AS externalJobDetailId
FROM
	Job job
WHERE
	job.className = 'com.blazon.analytics.etl.jobs.task.TaskQueueFactJob';


-- ReconciliationSituationFactJob

INSERT
	INTO
	Job (className,
	description,
	displayName,
	parameters)
VALUES ('com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob',
'Job responsible for calculating the quantity of reconciliation entries by schema and situation',
'Reconciliation Situation Fact Job',
NULL);

INSERT
	INTO
	JobInstance (name,
	description,
	params,
	job_id,
	activated,
	cronExpression,
	externalGroupId,
	externalJobDetailId)
SELECT
	job.displayName AS name,
	job.description AS description,
	NULL AS params,
	job.id AS job_id,
	FALSE AS activated,
	'0 0 0 * * ?' AS cronExpression,
	'Blazon Analytics Job' AS externalGroupId,
	job.displayName AS externalJobDetailId
FROM
	Job job
WHERE
	job.className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob';

	
-- Job de Analytics Directory

-- DirectoryManagementFactJob

INSERT
	INTO
	Job (className,
	description,
	displayName,
	parameters)
VALUES ('com.blazon.analytics.etl.jobs.directory.DirectoryManagementFactJob', 'Directory Management Fact Job', 'Directory Management Fact Job', NULL);

INSERT
	INTO
	JobInstance (name,
	description,
	params,
	job_id,
	activated,
	cronExpression,
	externalGroupId,
	externalJobDetailId)
SELECT
	job.displayName AS name,
	job.description AS description,
	NULL AS params,
	job.id AS job_id,
	FALSE AS activated,
	'0 0/1 0 * * ?' AS cronExpression,
	'Blazon Analytics Job' AS externalGroupId,
	job.displayName AS externalJobDetailId
FROM
	Job job
WHERE
	job.className = 'com.blazon.analytics.etl.jobs.directory.DirectoryManagementFactJob';
	

-- JOB UPDATE

UPDATE Job SET displayName = 'Certification Fact Job', className = 'com.blazon.analytics.etl.jobs.certification.CertificationFactJob' where id = 28;
UPDATE Job SET displayName = 'Directory Creation Details Fact Job', className = 'com.blazon.analytics.etl.jobs.directory.DirectoryCreationDetailFactJob' where id = 31;
UPDATE Job SET displayName = 'Directory Details Fact Job', className = 'com.blazon.analytics.etl.jobs.directory.DirectoryDetailsFactJob' where id = 32;
UPDATE Job SET displayName = 'Directory Fact Job', className = 'com.blazon.analytics.etl.jobs.directory.DirectoryFactJob' where id = 23;
UPDATE Job SET displayName = 'Directory Risk Fact Job', className = 'com.blazon.analytics.etl.jobs.directory.DirectoryRiskFactJob' where id = 33;
UPDATE Job SET displayName = 'Provisioning Fact Job', className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFactJob' where id = 29;
UPDATE Job SET displayName = 'Reconciliation Fact Job', className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationFactJob' where id = 27;
UPDATE Job SET displayName = 'Request Detail Fact Job', className = 'com.blazon.analytics.etl.jobs.request.RequestDetailFactJob' where id = 34;
UPDATE Job SET displayName = 'Request Fact Job', className = 'com.blazon.analytics.etl.jobs.request.RequestFactJob' where id = 26;
UPDATE Job SET displayName = 'Task Daily Fact Job', className = 'com.blazon.analytics.etl.jobs.task.TaskDailyFactJob' where id = 25;
UPDATE Job SET displayName = 'Task Deadline Fact Job', className = 'com.blazon.analytics.etl.jobs.task.TaskDeadlineFactJob' where id = 22;
UPDATE Job SET displayName = 'Task Fact Job', className = 'com.blazon.analytics.etl.jobs.task.TaskFactJob' where id = 24;

UPDATE JobInstance SET name = 'Certification Fact Job' WHERE id = 28;
UPDATE JobInstance SET name = 'Directory Creation Details Fact Job' WHERE id = 31;
UPDATE JobInstance SET name = 'Directory Details Fact Job' WHERE id = 32;
UPDATE JobInstance SET name = 'Directory Fact Job' WHERE id = 23;
UPDATE JobInstance SET name = 'Directory Risk Fact Job' WHERE id = 33;
UPDATE JobInstance SET name = 'Provisioning Fact Job' WHERE id = 29;
UPDATE JobInstance SET name = 'Reconciliation Fact Job' WHERE id = 27;
UPDATE JobInstance SET name = 'Request Detail Fact Job' WHERE id = 34;
UPDATE JobInstance SET name = 'Request Fact Job' WHERE id = 26;
UPDATE JobInstance SET name = 'Task Daily Fact Job' WHERE id = 25;
UPDATE JobInstance SET name = 'Task Deadline Fact Job' WHERE id = 22;
UPDATE JobInstance SET name = 'Task Fact Job' WHERE id = 24;

-- Jobs de Analytics de Request (script30...txt)

-- CreatedGeneralRequestsDetailFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.request.CreatedGeneralRequestsDetailFactJob', 'Created General Requests Detail Fact Job.', 'Created General Requests Detail Fact Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Created General Requests Detail Fact Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Created General Requests Detail Fact Job' as externalGroupId,
	'Created General Requests Detail Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.request.CreatedGeneralRequestsDetailFactJob';


-- CreatedManualRequestsDetailFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.request.CreatedManualRequestsDetailFactJob', 'Created Manual Requests Detail Fact Job.', 'Created Manual Requests Detail Fact Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Created Manual Requests Detail Fact Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Created Manual Requests Detail Fact Job' as externalGroupId,
	'Created Manual Requests Detail Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.request.CreatedManualRequestsDetailFactJob';


-- CreatedSystemRequestsDetailFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.request.CreatedSystemRequestsDetailFactJob', 'Created System Requests Detail Fact Job.', 'Created System Requests Detail Fact Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Created System Requests Detail Fact Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Created System Requests Detail Fact Job' as externalGroupId,
	'Created System Requests Detail Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.request.CreatedSystemRequestsDetailFactJob';


-- FinalizedGeneralRequestsDetailFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.request.FinalizedGeneralRequestsDetailFactJob', 'Finalized General Requests Detail Fact Job.', 'Finalized General Requests Detail Fact Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Finalized General Requests Detail Fact Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Finalized General Requests Detail Fact Job' as externalGroupId,
	'Finalized General Requests Detail Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.request.FinalizedGeneralRequestsDetailFactJob';


-- FinalizedManualRequestsDetailFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.request.FinalizedManualRequestsDetailFactJob', 'Finalized Manual Requests Detail Fact Job.', 'Finalized Manual Requests Detail Fact Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Finalized Manual Requests Detail Fact Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Finalized Manual Requests Detail Fact Job' as externalGroupId,
	'Finalized Manual Requests Detail Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.request.FinalizedManualRequestsDetailFactJob';


-- FinalizedSystemRequestsDetailFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.request.FinalizedSystemRequestsDetailFactJob', 'Finalized System Requests Detail Fact Job.', 'Finalized System Requests Detail Fact Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Finalized System Requests Detail Fact Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Finalized System Requests Detail Fact Job' as externalGroupId,
	'Finalized System Requests Detail Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.request.FinalizedSystemRequestsDetailFactJob';


-- RequestAverageFactJob

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


-- Ajustes nos jobs de analytics de Request

update Job set className = 'com.blazon.analytics.etl.jobs.request.RequestApprovalDetailsJob' where className = 'com.blazon.analytics.request.job.RequestApprovalDetailsJob';

update Job set className = 'com.blazon.analytics.etl.jobs.request.RequestDetailFactJob' where className = 'com.blazon.analytics.request.job.RequestDetailFactJob';

update Job set className = 'com.blazon.analytics.etl.jobs.request.RequestFactJob' where className = 'com.blazon.analytics.request.RequestFactJob';


-- Jobs de Analytics de Reconciliation

update Job set className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationFactJob' where className = 'com.blazon.analytics.reconciliation.job.ReconciliationFactJob';


-- Inserts em ANALYTICS_RECONCILIATION_SITUATION_DIMENSION

insert into ANALYTICS_RECONCILIATION_SITUATION_DIMENSION (schemaa, situationName) 
select 
	sitSchema.entryTypes as schemaa, 
	sitDef.name as situationName
from SituationDef_entryTypes sitSchema
inner join SituationDef sitDef on sitDef.id = sitSchema.SituationDef_id
order by sitSchema.entryTypes;






