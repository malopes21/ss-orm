
-- ReconciliationBatchEntry

create table ReconciliationBatchEntry (
    batchId varchar(255) not null,
    amount bigint,
    finalizedDate datetime,
    profileId bigint,
    profileName varchar(255),
    startDate datetime,
    status varchar(255),
    primary key (batchId)
) ENGINE=InnoDB;

-- Job ReconciliationBatchEntryCertifierJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.reconciliation.jobs.ReconciliationBatchEntryCertifierJob', 
'Reconciliation Batch Entry Certifier Job.', 
'Reconciliation Batch Entry Certifier Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Reconciliation Batch Entry Certifier Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Reconciliation Batch Entry Certifier Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.reconciliation.jobs.ReconciliationBatchEntryCertifierJob';




