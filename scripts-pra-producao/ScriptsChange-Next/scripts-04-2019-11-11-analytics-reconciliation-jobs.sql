
-- Job ReconciliationResumeFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.reconciliation.ReconciliationResumeFactJob', 
'Reconciliation Resume Fact Job.', 
'Reconciliation Resume Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Reconciliation Resume Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Reconciliation Resume Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationResumeFactJob';


-- Job ReconciliationSituationFactJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob', 
'Reconciliation Situation Fact Job.', 
'Reconciliation Situation Fact Job', null);

insert into JobInstance (name, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Reconciliation Situation Fact Job' as name, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Reconciliation Situation Fact Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob';



