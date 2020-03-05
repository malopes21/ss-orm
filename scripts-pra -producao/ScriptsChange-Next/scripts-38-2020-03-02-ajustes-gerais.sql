
-- remove CertificationExecutorPolicyJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%CertificationExecutorPolicyJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%CertificationExecutorPolicyJob'
);

delete from Job	
where className like '%CertificationExecutorPolicyJob';