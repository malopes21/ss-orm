
-- remove FindEntitlementReadyToRemove

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%FindEntitlementReadyToRemove'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%FindEntitlementReadyToRemove'
);

delete from Job	
where className like '%FindEntitlementReadyToRemove';


-- remove FindRoleReadyToRemove

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%FindRoleReadyToRemove'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%FindRoleReadyToRemove'
);

delete from Job	
where className like '%FindRoleReadyToRemove';


