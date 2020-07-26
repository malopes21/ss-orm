insert into SodApprovalTask (id, sodEntry_id) 
select 
	task.id as id, 
	task.createdByObjectId as sodEntry_id 
from Task task
where task.category = 'SOD_TASK';


eu preciso dar um update na tabela de task

para todos as tasks com id que esse select retorna

select task.id from RoleRightEntry roleRightEntry
inner join Task task on task.createdByObjectId = roleRightEntry.id;

precisamos dar um update na task e colocar category = 'ROLE_RIGHT_TASK'

se não não vai funcionar o script

blz?

update Task task
inner join RoleRightEntry roleRightEntry on task.createdByObjectId = roleRightEntry.id
set task.category = 'ROLE_RIGHT_TASK';



		job = new Job();
		job.setClassName("com.blazon.identitymanagement.enablers.email.job.SendEmailQueueJob");
		job.setDisplayName("Send Email Queue Job");
		job.setDescription("Send Email Queue Job.");
		job.setParameters("[{\"name\":\"sendEmailQueueLength\", \"value\":\"10\"}, {\"name\":\"maxSendEmailRetries\", \"value\":\"3\"}]");
		jobService.save(job);
		
		instance = new JobInstance();
		instance.setJob(job);
		instance.setName("Send Email Queue Job");
		instance.setActivated(true);
		instance.setCronExpression("0/30 * * * * ?");
		instance.setExternalGroupId("Group");
		instance.setExternalJobDetailId("JobInstance - " + instance.getId());
		jobService.save(instance);
		
		
insert into Job (className, description, displayName, parameters) values ('com.blazon.identitymanagement.enablers.email.job.SendEmailQueueJob', 
'Send Email Queue Job.', 'Send Email Queue Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Send Email Queue Job' as name, 
	null as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 0 * * ?' as cronExpression,
	'Send Email Queue Job' as externalGroupId,
	'Send Email Queue Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.identitymanagement.enablers.email.job.SendEmailQueueJob';



update Job set className = 'com.blazon.identitymanagement.directory.schemas.role.rights.rolerights.jobs.RoleRightEntryProcessorJob' where className = 'com.blazon.identitymanagement.rolerights.jobs.RoleRightEntryProcessorJob';



update Job set className = 'com.blazon.identitymanagement.directory.schemas.role.rights.rolerightsrevoke.jobs.RoleRightRevokeProcessorJob' 
where className = 'com.blazon.identitymanagement.rolerightsrevoke.jobs.RoleRightRevokeProcessorJob';


update Job set className = 'com.blazon.identitymanagement.directory.schemas.role.rights.rolerights.jobs.jobs.RoleRightEntryToExecutionJob' 
where className = 		   'com.blazon.identitymanagement.directory.schemas.role.rights.rolerights.jobs.RoleRightEntryToExecutionJob';


--------------------------------------

-- toda Task com categoria "APPROVAL_TASK" tem que atualizar o task.workflowId com o valor do campo request.approvalWorkflowId
-- buscado na BlazonRequest (request obtida com o task.createdByObjectId e com status WAITING_APPROVAL) 

update Task task
inner join BlazonRequest request on task.createdByObjectId = request.id
set task.category = 'ROLE_RIGHT_TASK';


UPDATE users AS U1, users AS U2 
SET U1.name_one = U2.name_colX
WHERE U2.user_id = U1.user_id



update Task as task, BlazonRequest request
set task.workflowId = request.approvalWorkflowId
where request.id = task.createdByObjectId
and request.status = 'TODO'
and task.createdBy = 'REQUEST';



update Task task
inner join CertificationEntry entry on entry.id = task.createdByObjectId
set task.workflowId = entry.workflowCertificationId
where 
task.status = 'TODO'
AND task.createdBy = 'CERTIFICATION';



update Task task
inner join ProvisioningEntry entry on entry.id = task.createdByObjectId
set task.workflowId = entry.workflowId
where 
task.status = 'TODO'
AND task.createdBy = 'PROVISIONING';






















