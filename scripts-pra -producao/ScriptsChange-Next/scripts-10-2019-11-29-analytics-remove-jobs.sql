-- jobs a serem deletados:

-- com.blazon.analytics.etl.jobs.certification.CertificationFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.certification.CertificationFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.certification.CertificationFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.certification.CertificationFactJob';


-- com.blazon.analytics.etl.jobs.provisioning.ProvisioningCreatedEntryFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningCreatedEntryFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningCreatedEntryFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningCreatedEntryFactJob';


-- com.blazon.analytics.etl.jobs.provisioning.ProvisioningDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningDetailFactJob';


-- com.blazon.analytics.etl.jobs.provisioning.ProvisioningFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFactJob';


-- com.blazon.analytics.etl.jobs.provisioning.ProvisioningFinishedEntryFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFinishedEntryFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFinishedEntryFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningFinishedEntryFactJob';


-- com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.provisioning.ProvisioningTaskFactJob';


-- com.blazon.analytics.etl.jobs.reconciliation.ReconciliationFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationFactJob';


-- com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob 

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.reconciliation.ReconciliationSituationFactJob';


-- com.blazon.analytics.etl.jobs.request.CreatedGeneralRequestsDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.CreatedGeneralRequestsDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.CreatedGeneralRequestsDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.CreatedGeneralRequestsDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.CreatedManualRequestsDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.CreatedManualRequestsDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.CreatedManualRequestsDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.CreatedManualRequestsDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.CreatedSystemRequestsDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.CreatedSystemRequestsDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.CreatedSystemRequestsDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.CreatedSystemRequestsDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.FinalizedGeneralRequestsDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.FinalizedGeneralRequestsDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.FinalizedGeneralRequestsDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.FinalizedGeneralRequestsDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.FinalizedManualRequestsDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.FinalizedManualRequestsDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.FinalizedManualRequestsDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.FinalizedManualRequestsDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.FinalizedSystemRequestsDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.FinalizedSystemRequestsDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.FinalizedSystemRequestsDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.FinalizedSystemRequestsDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.RequestApprovalDetailsJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.RequestApprovalDetailsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.RequestApprovalDetailsJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.RequestApprovalDetailsJob';


-- com.blazon.analytics.etl.jobs.request.RequestAverageFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.RequestAverageFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.RequestAverageFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.RequestAverageFactJob';


-- com.blazon.analytics.etl.jobs.request.RequestDetailFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.RequestDetailFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.RequestDetailFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.RequestDetailFactJob';


-- com.blazon.analytics.etl.jobs.request.RequestFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.request.RequestFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.request.RequestFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.request.RequestFactJob';


-- com.blazon.analytics.etl.jobs.task.TaskDailyFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.task.TaskDailyFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.task.TaskDailyFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.task.TaskDailyFactJob';


-- com.blazon.analytics.etl.jobs.task.TaskDeadlineFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.task.TaskDeadlineFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.task.TaskDeadlineFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.task.TaskDeadlineFactJob';


-- com.blazon.analytics.etl.jobs.task.TaskFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.task.TaskFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.task.TaskFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.task.TaskFactJob';


-- com.blazon.analytics.etl.jobs.task.TaskQueueFactJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.task.TaskQueueFactJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className = 'com.blazon.analytics.etl.jobs.task.TaskQueueFactJob'
);

delete from Job	
where className = 'com.blazon.analytics.etl.jobs.task.TaskQueueFactJob';



