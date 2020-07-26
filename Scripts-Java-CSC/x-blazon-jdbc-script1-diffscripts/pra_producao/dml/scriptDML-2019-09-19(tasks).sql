-- Tasks

-- BlazonRequestApprovalTask

insert into BlazonRequestApprovalTask (id, request_id) 
select 
	task.id as id, 
	task.createdByObjectId as request_id 
from Task task
where task.category = 'APPROVAL_TASK';


-- ProvisioningTask

insert into ProvisioningTask (id, provisioningEntry_id) 
select 
	task.id as id, 
	task.createdByObjectId as provisioningEntry_id 
from Task task
where task.category = 'PROVISIONING_TASK';


-- CertificationApprovalTask

insert into CertificationApprovalTask (id, entryId, entryType, certificationEntry_id) 
select 
	task.id as id, 
	certEntry.entryId as entryId,
	certEntry.entryType as entryType,
	task.createdByObjectId as certificationEntry_id 
from Task task
inner join CertificationEntry certEntry on task.createdByObjectId = certEntry.id
where task.category = 'CERTIFICATION_TASK';


-- RoleRightApprovalTask

insert into RoleRightApprovalTask (id, roleRightEntry_id) 
select 
	task.id as id, 
	task.createdByObjectId as roleRightEntry_id 
from Task task
where task.category = 'ROLE_RIGHT_TASK';


-- BlazonRequestSodApprovalTask

insert into BlazonRequestSodApprovalTask (id, request_id) 
select 
	task.id as id, 
	task.createdByObjectId as request_id 
from Task task
where task.category = 'REQUEST_SOD_TASK';


-- SodApprovalTask

insert into SodApprovalTask (id, sodEntry_id) 
select 
	task.id as id, 
	task.createdByObjectId as sodEntry_id 
from Task task
where task.category = 'SOD_TASK';


