-- ANALYTICS2_PROVISIONING_ENTRY_FACT

desc ANALYTICS2_PROVISIONING_ENTRY_FACT;

-- Endpoint para entradas resolvidas (com sucesso e erro) (range de data)

select fact.date,  
	sum(created) as created, 
	avg(averageTime) as averageTime, 
	sum(errorFinalized) as errorFinalized, 
	sum(open) as open, 
	sum(successFinalized) as successFinalized
from ANALYTICS2_PROVISIONING_ENTRY_FACT fact
where fact.date >= '2019-11-20 12:32:00.0' 
	and fact.date <= '2019-11-20 17:35:00.0' 
group by fact.date;

select fact.date,  
	sum(created) as created, 
	avg(averageTime) as averageTime, 
	sum(errorFinalized) as errorFinalized, 
	sum(open) as open, 
	sum(successFinalized) as successFinalized
from ANALYTICS2_PROVISIONING_ENTRY_FACT fact
group by fact.date
order by fact.date desc
limit 1;

-- Endpoint para entradas criadas (por resource adapter e workflow) (range de data)

select fact.date,  
	sum(created) as created, 
	avg(averageTime) as averageTime, 
	sum(errorFinalized) as errorFinalized, 
	sum(open) as open, 
	sum(successFinalized) as successFinalized,
	type.`type`
from ANALYTICS2_PROVISIONING_ENTRY_FACT fact
join ANALYTICS2_PROVISIONING_ENTRY_TYPE_DIMENSION type on type.id = fact.PROVISIONING_ENTRY_TYPE_DIMENSION_ID
where fact.date >= '2019-11-20 12:32:00.0' 
	and fact.date <= '2019-11-20 17:35:00.0' 
	and (type.`type` = 'RESOURCE_ADAPTER' or type.`type` = 'WORKFLOW')
group by fact.date, type.`type`;


select fact.date,  
	sum(created) as created, 
	avg(averageTime) as averageTime, 
	sum(errorFinalized) as errorFinalized, 
	sum(open) as open, 
	sum(successFinalized) as successFinalized,
	type.type
from ANALYTICS2_PROVISIONING_ENTRY_FACT fact
join ANALYTICS2_PROVISIONING_ENTRY_TYPE_DIMENSION type on type.id = fact.PROVISIONING_ENTRY_TYPE_DIMENSION_ID
where type.type = 'WORKFLOW'
group by fact.date
order by fact.date desc
limit 1;

-- ProvisioningTaskFact

select fact.date,  
	sum(created) as created, 
	avg(averageTime) as averageTime, 
	sum(errorFinalized) as errorFinalized, 
	sum(open) as open, 
	sum(successFinalized) as successFinalized,
	sum(slaReached) as slaReached,
	sum(slaUnreached) as slaUnreached
	type.type
from ANALYTICS2_PROVISIONING_TASK_FACT fact
join ANALYTICS2_PROVISIONING_TASK_TYPE_DIMENSION type on type.id = fact.PROVISIONING_TASK_TYPE_DIMENSION_ID
where fact.date >= '2019-11-20 12:32:00.0' 
	and fact.date <= '2019-11-20 19:35:00.0' 
	and type.type = 'WORKFLOW'
group by fact.date
order by fact.date desc
limit 1;


select fact.date,  
	sum(created) as created, 
	avg(averageTime) as averageTime, 
	sum(errorFinalized) as errorFinalized, 
	sum(open) as open, 
	sum(successFinalized) as successFinalized,
	sum(slaReached) as slaReached,
	sum(slaUnreached) as slaUnreached
from ANALYTICS2_PROVISIONING_TASK_FACT fact
join ANALYTICS2_PROVISIONING_TASK_TYPE_DIMENSION type on type.id = fact.PROVISIONING_TASK_TYPE_DIMENSION_ID
where type.type = 'WORKFLOW'
group by fact.date
order by fact.date desc
limit 1;


-- ANALYTICS2_PROVISIONING_TASK_QUEUE_FACT
-- ANALYTICS2_PROVISIONING_TASK_QUEUE_NAME_DIMENSION
-- ANALYTICS2_PROVISIONING_TASK_QUEUE_TYPE_DIMENSION

-- Endpoint que traz a quantidade de tarefas por fila (ultimo registro) - NOVO
-- Endpoint que traz a quantidade de tarefas por fila (range de data)

desc ANALYTICS2_PROVISIONING_TASK_QUEUE_FACT;

desc ANALYTICS2_PROVISIONING_TASK_QUEUE_NAME_DIMENSION;

select fact.date
from ANALYTICS2_PROVISIONING_TASK_QUEUE_FACT fact
group by fact.date
order by fact.date desc 
limit 1;

select queue.queueId as queueId,
	queue.queue as queueName,
	fact.date, 
	sum(fact.amount) as amount, 
	avg(fact.averateTimeOnQueue) as averateTimeOnQueue, 
	sum(fact.slaReached) as slaReached,
	sum(fact.slaUnreached) as slaUnreached
from ANALYTICS2_PROVISIONING_TASK_QUEUE_FACT fact
join ANALYTICS2_PROVISIONING_TASK_QUEUE_NAME_DIMENSION queue on queue.id = fact.PROVISIONING_TASK_QUEUE_NAME_DIMENSION_ID
where fact.date = '2019-11-20 19:35:00.0'
group by queue.queueId, queue.queue, fact.date


select queue.queue as queue,
	fact.date, 
	sum(fact.amount) as amount, 
	avg(fact.averateTimeOnQueue) as averateTimeOnQueue, 
	sum(fact.slaReached) as slaReached,
	sum(fact.slaUnreached) as slaUnreached
from ANALYTICS2_PROVISIONING_TASK_QUEUE_FACT fact
join ANALYTICS2_PROVISIONING_TASK_QUEUE_NAME_DIMENSION queue on queue.id = fact.PROVISIONING_TASK_QUEUE_NAME_DIMENSION_ID
where fact.date >= '2019-11-20 19:35:00.0'
	and fact.date <= '2019-11-20 19:35:00.0'
group by queue.queue, fact.date


-- by type

select type.type as type,
	fact.date, 
	sum(fact.amount) as amount, 
	avg(fact.averateTimeOnQueue) as averateTimeOnQueue, 
	sum(fact.slaReached) as slaReached,
	sum(fact.slaUnreached) as slaUnreached
from ANALYTICS2_PROVISIONING_TASK_QUEUE_FACT fact
join ANALYTICS2_PROVISIONING_TASK_QUEUE_TYPE_DIMENSION type on type.id = fact.PROVISIONING_TASK_QUEUE_TYPE_DIMENSION_ID
where fact.date >= '2019-11-20 19:35:00.0'
	and fact.date <= '2019-11-20 19:35:00.0'
group by type.type, fact.date


desc ANALYTICS2_PROVISIONING_TASK_EXECUTOR_FACT;

-- 10 executores que mais resolveram tarefas

select 
	user.id as userId,
	user.username as username,
	user.displayName as displayName,
	sum(fact.finalized) as finalized,
	avg(fact.averageTime) as averageTime,
	sum(fact.slaReached) as slaReached,
	sum(fact.slaUnreached) as slaUnreached
from ANALYTICS2_PROVISIONING_TASK_EXECUTOR_FACT fact
join ANALYTICS2_PROVISIONING_TASK_EXECUTOR_USER_DIMENSION user on user.id = fact.PROVISIONING_TASK_EXECUTOR_USER_DIMENSION_ID
group by user.id, user.username, user.displayName
order by sum(fact.finalized) desc
limit 10;

-- 10 executores que menos resolveram tarefas

select 
	user.id as userId,
	user.username as username,
	user.displayName as displayName,
	sum(fact.finalized) as finalized,
	avg(fact.averageTime) as averageTime,
	sum(fact.slaReached) as slaReached,
	sum(fact.slaUnreached) as slaUnreached
from ANALYTICS2_PROVISIONING_TASK_EXECUTOR_FACT fact
join ANALYTICS2_PROVISIONING_TASK_EXECUTOR_USER_DIMENSION user on user.id = fact.PROVISIONING_TASK_EXECUTOR_USER_DIMENSION_ID
group by user.id, user.username, user.displayName
order by sum(fact.finalized) asc
limit 10;

select * from ANALYTICS2_PROVISIONING_TASK_TYPE_DIMENSION;

select * from ANALYTICS2_PROVISIONING_TASK_FACT;


-- Request Resume Facts

-- ANALYTICS2_REQUEST_RESUME_FACT
-- ANALYTICS2_REQUEST_RESUME_TYPE_DIMENSION

desc ANALYTICS2_REQUEST_RESUME_FACT;

desc ANALYTICS2_REQUEST_RESUME_TYPE_DIMENSION;

/*
| approvalAverageTime            | bigint(20) | YES  |     | NULL    |                |
| approvalNotRequired            | bigint(20) | YES  |     | NULL    |                |
| approvalRequired               | bigint(20) | YES  |     | NULL    |                |
| approved                       | bigint(20) | YES  |     | NULL    |                |
| averageTime                    | bigint(20) | YES  |     | NULL    |                |
| canceled                       | bigint(20) | YES  |     | NULL    |                |
| created                        | bigint(20) | YES  |     | NULL    |                |
| date                           | datetime   | YES  |     | NULL    |                |
| disapproved                    | bigint(20) | YES  |     | NULL    |                |
| error                          | bigint(20) | YES  |     | NULL    |                |
| generatedBySystem              | bigint(20) | YES  |     | NULL    |                |
| manuallyCreated                | bigint(20) | YES  |     | NULL    |                |
| provisioningAverageTime        | bigint(20) | YES  |     | NULL    |                |
| sodAllowed                     | bigint(20) | YES  |     | NULL    |                |
| sodAverageTime                 | bigint(20) | YES  |     | NULL    |                |
| sodNotAllowed                  | bigint(20) | YES  |     | NULL    |                |
| sodNotRequired                 | bigint(20) | YES  |     | NULL    |                |
| sodRequired                    | bigint(20) | YES  |     | NULL    |                |
| success                        | bigint(20) | YES  |     | NULL    |                |
| validationError                | bigint(20) | YES  |     | NULL    |                |
| waitingApproval                | bigint(20) | YES  |     | NULL    |                |
| waitingProvisioning            | bigint(20) | YES  |     | NULL    |                |
| waitingSodResolution           | bigint(20) | YES  |     | NULL    |                |

 */

desc ANALYTICS2_REQUEST_RESUME_FACT;

select fact.date as date,
	avg(fact.approvalAverageTime) as approvalAverageTime,
	sum(fact.approvalNotRequired) as approvalNotRequired,
	sum(fact.approvalRequired),
	sum(fact.approved) as approved,
	avg(fact.averageTime) as averageTime,
	sum(fact.canceled) as canceled,
	sum(fact.created) as created,
	sum(fact.disapproved) as disapproved,
	sum(fact.error) as error,
	sum(fact.generatedBySystem) as generatedBySystem,
	sum(fact.manuallyCreated) as manuallyCreated,
	avg(fact.provisioningAverageTime) as provisioningAverageTime,
	sum(fact.sodAllowed) as sodAllowed,
	avg(fact.sodAverageTime) as sodAverageTime,
	sum(fact.sodNotAllowed) as sodNotAllowed,
	sum(fact.sodNotRequired) as sodNotAllowed,
	sum(fact.sodRequired) as sodRequired,
	sum(fact.success) as success,
	sum(fact.validationError) as validationError,
	sum(fact.waitingApproval) as waitingApproval,
	sum(fact.waitingProvisioning) as waitingProvisioning,
	sum(fact.waitingSodResolution) as waitingSodResolution
from ANALYTICS2_REQUEST_RESUME_FACT fact
where fact.date >= '2019-11-20 19:35:00.0'
	and fact.date <= '2019-11-20 19:35:00.0'
group by fact.date;


-- request entries

select id, type from BlazonRequest b where b.type = 'CREATE_ACCOUNT';

-- created:

SELECT count(request.id) as total 
FROM BlazonRequest request 
WHERE request.createDate >= '2018-11-20 19:35:00.0'

-- created grouped

SELECT request.type, count(request.id) as total 
FROM BlazonRequest request 
WHERE request.createDate >= '2018-11-20 19:35:00.0'
group by request.type;

-- created para role:

SELECT request.type, count(request.id) as total, request.roleId 
FROM BlazonRequest request 
WHERE request.createDate >= '2018-11-20 19:35:00.0'
and request.roleId is not null
group by request.type, roleId;

-- created para resource:

SELECT request.type, count(request.id) as total, request.resourceId 
FROM BlazonRequest request 
WHERE request.createDate >= '2018-11-20 19:35:00.0'
and request.resourceId is not null
group by request.type, resourceId;

-- generatedBySystem:

SELECT request.type, count(request.id) as total 
FROM BlazonRequest request 
WHERE request.createDate >= '2018-11-20 19:35:00.0'
	and request.generatedBySystem = true
group by request.type;

-- manuallyCreated:

SELECT request.type, count(request.id) as total 
FROM BlazonRequest request 
WHERE request.createDate >= '2018-11-20 19:35:00.0'
	and request.generatedBySystem = true
group by request.type;


-- request facts

desc ANALYTICS2_REQUEST_CONCLUSION_FACT;

desc ANALYTICS2_REQUEST_CREATION_FACT;

desc ANALYTICS2_REQUEST_STATUS_FACT;

desc ANALYTICS2_REQUEST_TYPE_DIMENSION;


select fact.date,
	type.type as type,
	sum(fact.created) as created,
	sum(fact.generatedBySystem) as generatedBySystem,
	sum(fact.manuallyCreated) as manuallyCreated
from ANALYTICS2_REQUEST_CREATION_FACT fact
join ANALYTICS2_REQUEST_TYPE_DIMENSION type on type.id = fact.REQUEST_TYPE_DIMENSION_ID
where fact.date >= '2019-11-20 19:35:00.0'
	and fact.date <= '2019-11-20 19:35:00.0'
group by fact.date, type.type;

-- Request new model:

SELECT request.type, 
	count(request.id) as total, 
	request.resourceId as resourceId
FROM BlazonRequest request 
WHERE request.createDate >= '2019-11-20 19:35:00.0' 
	and request.type = 'CREATE_ACCOUNT'
group by request.resourceId;

select id, resourceId, TYPE
from BlazonRequest request
where request.type = 'CREATE_ACCOUNT';


SELECT request.resourceId as entryId, 
	'RESOURCE' as entryType,
	resource.name as entryName,
	ROUND(AVG(TIMESTAMPDIFF(SECOND,request.createDate,request.finalizeDate)),0) as total 
FROM BlazonRequest request 
join Resource resource on resource.id = request.resourceId
WHERE request.type = 'CREATE_ACCOUNT'
AND request.finalizeDate >= '2018-11-20 19:35:00.0' 
group by request.resourceId


SELECT request.entitlementId as entryId, 
	'ENTITLEMENT' as entryType,
	entitlement.name as entryName,
	ROUND(AVG(TIMESTAMPDIFF(SECOND,request.createDate,request.finalizeDate)),0) as total 
FROM BlazonRequest request 
join Entitlement entitlement on entitlement.id = request.entitlementId
WHERE request.type = 'CREATE_ACCOUNT'
AND request.finalizeDate >= '2018-11-20 19:35:00.0' 
group by request.entitlementId


SELECT request.roleId as entryId, 
	'ROLE' as entryType,
	role.name as entryName,
	ROUND(AVG(TIMESTAMPDIFF(SECOND,request.createDate,request.finalizeDate)),0) as total 
FROM BlazonRequest request 
join Role role on role.id = request.roleId
WHERE request.type = 'ASSIGN_ROLE'
AND request.finalizeDate >= '2018-11-20 19:35:00.0' 
group by request.roleId



SELECT 
	ROUND(AVG(TIMESTAMPDIFF(SECOND,request.createDate,request.finalizeDate)),0) as total 
FROM BlazonRequest request 
WHERE request.type = 'ASSIGN_ROLE'
AND request.finalizeDate >= '2018-11-20 19:35:00.0' 

-- Certification Campaign Resume
/*
CERTIFICATION_CAMPAIGN_RESUME_FACT
- id
- name
- creationDate
- finalizeDate (pra todos resume)
- deadline
- slaReached (boolean)
- amountCertificationEntries
- status
- lastDetailDiscovery
*/

select *
from CampaignExecutionInstance instance 
join CampaignDefinition definition on definition.id = instance.campaign_id
join CampaignExecutionInstance_CertificationEntry ceice on ceice.CampaignExecutionInstance_id = instance.id
join CampaignExecutionInstance_CertificationEntry ceice on ceice.certificationEntries_id 
where instance.date >= '2018-11-20 19:35:00.0'

select count(*) as amountCertificationEntries, 
	instance.id as instanceId, 
	instance.date as creationDate, 
	instance.finalizeDate as finalizeDate, 
	instance.deadline as deadline, 
	instance.status as status,
	definition.name as name,
	definition.sla as sla
from CampaignExecutionInstance_CertificationEntry ceice
join CampaignExecutionInstance instance on instance.id = ceice.CampaignExecutionInstance_id
join CampaignDefinition definition on definition.id = instance.campaign_id
join CertificationEntry entry on entry.id = ceice.certificationEntries_id
where instance.date >= '2018-11-20 19:35:00.0'
group by instance.id;

-- esse:

select count(*) as amountCertificationEntries, 
	instance.id as instanceId, 
	instance.date as creationDate, 
	instance.finalizeDate as finalizeDate, 
	instance.deadline as deadline, 
	instance.status as status
from CampaignExecutionInstance_CertificationEntry ceice
join CampaignExecutionInstance instance on instance.id = ceice.CampaignExecutionInstance_id
join CertificationEntry entry on entry.id = ceice.certificationEntries_id
where instance.date >= '2018-11-20 19:35:00.0'
group by instance.id;


/*
	private Date date;

	private Long amountRevoked;

	private Long amountCertified;

	private Long amountOpen;

	private Long averageTime;

	private Long amountCanceled;

	private Long amountError;

	private Long CERTIFICATION_CAMPAIGN_RESUME_FACT_ID;

	private Long CERTIFICATION_CAMPAIGN_DETAIL_POLICY_DIMENSION_ID;
 */

-- amountRevoked;

select count(*) as total, 
	instance.id as instanceId,
	policy.id as policyId,
	policy.name as policyName
from CampaignExecutionInstance_CertificationEntry ceice
join CampaignExecutionInstance instance on instance.id = ceice.CampaignExecutionInstance_id
join CertificationEntry entry on entry.id = ceice.certificationEntries_id
join CertificationPolicy policy on policy.id = entry.policy_id
where instance.date >= '2018-11-20 19:35:00.0'
and instance.id = 46
and entry.processDate is not null
group by instance.id, policy.id;



select ROUND(AVG(TIMESTAMPDIFF(SECOND,entry.creationDate,entry.processDate)),0) as total, 
	instance.id as instanceId,
	policy.id as policyId,
	policy.name as policyName
from CampaignExecutionInstance_CertificationEntry ceice
join CampaignExecutionInstance instance on instance.id = ceice.CampaignExecutionInstance_id
join CertificationEntry entry on entry.id = ceice.certificationEntries_id
join CertificationPolicy policy on policy.id = entry.policy_id
where instance.date >= '2018-11-20 19:35:00.0'
and instance.id = 46
and entry.processDate is not null
group by instance.id, policy.id;



select ROUND(AVG(TIMESTAMPDIFF(SECOND,entry.creationDate,entry.processDate)),0) as total, 
				instance.id as instanceId, 
				policy.id as policyId, 
				policy.name as policyName 
				from CampaignExecutionInstance_CertificationEntry ceice 
				join CampaignExecutionInstance instance on instance.id = ceice.CampaignExecutionInstance_id 
				join CertificationEntry entry on entry.id = ceice.certificationEntries_id 
				join CertificationPolicy policy on policy.id = entry.policy_id 
				where instance.date >= '2018-11-20 19:35:00.0'
				and instance.id = 46
				and entry.processDate is not null 
				group by instance.id, policy.id 

-- MicroCertificationResume

select count(*) as amountCertificationEntries, 
	instance.id as instanceId, 
	instance.date as creationDate, 
	instance.finalizeDate as finalizeDate, 
	instance.deadline as deadline, 
	instance.status as status,
	instance.name as name, 
	instance.certificationObjectType as entryType 
from MicroCertificationExecutionInstance_CertificationEntry mceice 
join MicroCertificationExecutionInstance instance on instance.id = mceice.MicroCertificationExecutionInstance_id 
join CertificationEntry entry on entry.id = mceice.certificationEntries_id
where instance.date >= '2018-11-20 19:35:00.0'
group by instance.id;


-- 

select 
	instance.id as instanceId,
	entry.entryType as entryType
from MicroCertificationExecutionInstance_CertificationEntry mceice 
join MicroCertificationExecutionInstance instance on instance.id = mceice.MicroCertificationExecutionInstance_id 
join CertificationEntry entry on entry.id = mceice.certificationEntries_id 
where instance.date >=  '2018-11-20 19:35:00.0'
	and instance.id = 8
	and entry.status = 'NEW' 

	
	
select count(*) as total, 
	instance.id as instanceId,
	entry.entryType as entryType
from MicroCertificationExecutionInstance_CertificationEntry mceice 
join MicroCertificationExecutionInstance instance on instance.id = mceice.MicroCertificationExecutionInstance_id 
join CertificationEntry entry on entry.id = mceice.certificationEntries_id 
where instance.date >=  '2018-11-20 19:35:00.0'
	and instance.id = 8
	and entry.status = 'NEW' 
group by entry.entryType

/*
		return " select count(*) as total, " + 
				"	instance.id as instanceId, " + 
				"	policy.id as policyId, " + 
				"   policy.name as policyName " +
				" from CampaignExecutionInstance_CertificationEntry ceice " + 
				" join CampaignExecutionInstance instance on instance.id = ceice.CampaignExecutionInstance_id " + 
				" join CertificationEntry entry on entry.id = ceice.certificationEntries_id " + 
				" join CertificationPolicy policy on policy.id = entry.policy_id " + 
				" where instance.id = " + instanceId + " " +
				" and entry.processDate is null " + 
				" group by instance.id, policy.id ";
*/	
			
select count(*) as total, 
	instance.id as instanceId,
	entry.entryType as entryType
from MicroCertificationExecutionInstance_CertificationEntry mceice 
join MicroCertificationExecutionInstance instance on instance.id = mceice.MicroCertificationExecutionInstance_id 
join CertificationEntry entry on entry.id = mceice.certificationEntries_id 
where instance.id = 8
	and entry.processDate is null 
group by entry.entryType		


select finalizeDate from CampaignExecutionInstance where id = 46;

-- Selector

select count(*) as amountCertificationEntries, 
	instance.id as instanceId, 
	selector.id as selectorId,
	selector.name as selectorName,
	instance.userId as userId,
	instance.userDisplayName as userDisplayName,
	instance.date as creationDate, 
	instance.finalizeDate as finalizeDate, 
	instance.deadline as deadline, 
	instance.status as status
from SelectorExecutionInstance_CertificationEntry seice 
join SelectorExecutionInstance instance on instance.id = seice.SelectorExecutionInstance_id
join CertificationEntry entry on entry.id = seice.certificationEntries_id 
join CertificationSelector selector on selector.id = instance.selector_id
where instance.date >= '2018-11-20 19:35:00.0'
group by instance.id


select count(*) as total, 
	instance.id as instanceId,
	entry.entryType as entryType
from SelectorExecutionInstance_CertificationEntry seice 
join SelectorExecutionInstance instance on instance.id = seice.SelectorExecutionInstance_id
join CertificationEntry entry on entry.id = seice.certificationEntries_id 
join CertificationSelector selector on selector.id = instance.selector_id
where instance.id = 12
	and entry.processDate is null  
group by instance.id, entry.entryType



select 
	count(task.id) as total,
	instance.id as instanceId,
	entry.entryType as entryType
from Task task 
join CertificationApprovalTask approvalTask on approvalTask.id = task.id  
join CertificationEntry entry on entry.id = approvalTask.certificationEntry_id 
join SelectorExecutionInstance instance on instance.selector_id = entry.selector_id
where 
	task.createdDate >= '2018-11-20 19:35:00.0' 
group by instance.id, entry.entryType

select 
	count(task.id) as total,
	instance.id as instanceId,
	entry.entryType as entryType
from Task task 
join CertificationApprovalTask approvalTask on approvalTask.id = task.id  
join CertificationEntry entry on entry.id = approvalTask.certificationEntry_id 
join SelectorExecutionInstance instance on instance.selector_id = entry.selector_id
where 
	task.resolvedDate >= '2018-11-20 19:35:00.0' 
	and task.result = 'CERTIFIED'
group by instance.id, entry.entryType



select 
	count(task.id) as total,
	instance.id as instanceId,
	entry.entryType as entryType
from Task task 
join CertificationApprovalTask approvalTask on approvalTask.id = task.id  
join CertificationEntry entry on entry.id = approvalTask.certificationEntry_id 
join SelectorExecutionInstance instance on instance.selector_id = entry.selector_id
where (task.status = 'TODO' or task.status = 'WAITING_ASSIGN') 
	and task.deadline <= '2018-11-20 19:35:00.0' 
group by instance.id, entry.entryType



/*


		return "SELECT COUNT(task.id) AS total " + 
				" FROM Task task " + 
				" JOIN BlazonRequestApprovalTask approvalTask ON approvalTask.id = task.id  " + 
				" JOIN BlazonRequest request ON request.id = approvalTask.request_id  " + 
				" WHERE request.type = '" + TYPE + "' " + 
				" and (task.status = 'TODO' or task.status = 'WAITING_ASSIGN') " +
				" and task.deadline <= '" + new Timestamp(lastExecution.getTime()) + "' ";

*/

-- micro

desc MicroCertificationExecutionInstance_CertificationEntry;

select 
	count(task.id) as total,
	instance.id as instanceId,
	entry.entryType as entryType
from Task task 
join CertificationApprovalTask approvalTask on approvalTask.id = task.id 
join CertificationEntry entry on entry.id = approvalTask.certificationEntry_id 
join MicroCertificationExecutionInstance_CertificationEntry mceice on mceice.certificationEntries_id = entry.id 
join MicroCertificationExecutionInstance instance on instance.id = mceice.MicroCertificationExecutionInstance_id 
where (task.status = 'TODO' or task.status = 'WAITING_ASSIGN') 
	and task.deadline <= '2018-11-20 19:35:00.0' 
group by instance.id, entry.entryType


-- campaign

desc CampaignExecutionInstance_CertificationEntry;

select 
	count(task.id) as total,
	instance.id as instanceId,
	entry.entryType as entryType
from Task task 
join CertificationApprovalTask approvalTask on approvalTask.id = task.id 
join CertificationEntry entry on entry.id = approvalTask.certificationEntry_id 
join CampaignExecutionInstance_CertificationEntry mceice on mceice.certificationEntries_id = entry.id 
join CampaignExecutionInstance instance on instance.id = mceice.CampaignExecutionInstance_id 
where (task.status = 'TODO' or task.status = 'WAITING_ASSIGN') 
	and task.deadline <= '2018-11-20 19:35:00.0' 
group by instance.id, entry.entryType

-- selector

desc SelectorExecutionInstance_CertificationEntry;

select 
	count(task.id) as total,
	instance.id as instanceId,
	entry.entryType as entryType
from Task task 
join CertificationApprovalTask approvalTask on approvalTask.id = task.id 
join CertificationEntry entry on entry.id = approvalTask.certificationEntry_id 
join SelectorExecutionInstance_CertificationEntry mceice on mceice.certificationEntries_id = entry.id 
join SelectorExecutionInstance instance on instance.id = mceice.SelectorExecutionInstance_id  
where (task.status = 'TODO' or task.status = 'WAITING_ASSIGN') 
	and task.deadline <= '2018-11-20 19:35:00.0' 
group by instance.id, entry.entryType


-- finalized

select 
	count(task.id) as total,
	instance.id as instanceId,
	user.id as userId,
	user.displayName as userDisplayName,
	entry.entryType as entryType
from Task task 
join CertificationApprovalTask approvalTask ON approvalTask.id = task.id 
join CertificationEntry entry ON entry.id = approvalTask.certificationEntry_id  
join SelectorExecutionInstance_CertificationEntry mceice on mceice.certificationEntries_id = entry.id 
join SelectorExecutionInstance instance on instance.id = mceice.SelectorExecutionInstance_id  
join User user ON user.id = task.recipient_id 
where 
	task.resolvedDate >= '2018-11-20 19:35:00.0' 
group by task.recipient_id, instance.id, entry.entryType
					
-- amountRevoked

select 
	count(task.id) as total,
	instance.id as instanceId
from Task task 
join CertificationApprovalTask approvalTask ON approvalTask.id = task.id 
join CertificationEntry entry ON entry.id = approvalTask.certificationEntry_id  
join SelectorExecutionInstance_CertificationEntry mceice on mceice.certificationEntries_id = entry.id 
join SelectorExecutionInstance instance on instance.id = mceice.SelectorExecutionInstance_id  
join User user ON user.id = task.recipient_id 
where 
	task.resolvedDate >= '2018-11-20 19:35:00.0' 
	and task.result = 'REVOKED'
group by task.recipient_id, instance.id
					
					

-- finalized

select 
	count(task.id) as total,
	instance.id as instanceId,
	user.id as userId,
	user.displayName as userDisplayName,
	entry.entryType as entryType
from Task task 
join CertificationApprovalTask approvalTask ON approvalTask.id = task.id 
join CertificationEntry entry ON entry.id = approvalTask.certificationEntry_id  
join SelectorExecutionInstance_CertificationEntry mceice on mceice.certificationEntries_id = entry.id 
join SelectorExecutionInstance instance on instance.id = mceice.SelectorExecutionInstance_id  
join User user ON user.id = task.recipient_id 
where 
	task.resolvedDate >= '2018-11-20 19:35:00.0' 
group by task.recipient_id, instance.id, entry.entryType

-- request approvals

SELECT COUNT(task.id) AS total,
	entitlement.id as entryId,
	entitlement.name as entryName,
	'RESOURCE' as entryType
FROM Task task 
JOIN BlazonRequestApprovalTask approvalTask ON approvalTask.id = task.id  
JOIN BlazonRequest request ON request.id = approvalTask.request_id  
join Entitlement entitlement on entitlement.id = request.entitlementId
WHERE request.type = 'ASSIGN_ENTITLEMENT' 
and task.createdDate >= '2018-11-20 19:35:00.0'  
group by request.entitlementId


-- ajuste em provisioning

SELECT COUNT(entry.id) AS total,
	resource.id as entryId,
	resource.name as entryName,
	'RESOURCE' as entryType,
	'WORKFLOW' as type,
	'ACTIVATE_ACCOUNT' as operation
FROM ProvisioningEntry entry 
join Resource resource on resource.id = entry.resource_id
WHERE entry.entryType = 'ACTIVATE_ACCOUNT'
AND entry.provisioningType = 'WORKFLOW'
AND entry.date >= '2018-11-20 19:35:00.0'  
group by entry.resource_id
			


SELECT COUNT(entry.id) AS total,
	role.id as entryId,
	role.name as entryName,
	'ROLE' as entryType,
	'WORKFLOW' as type,
	'UPDATE_ROLE' as operation
FROM ProvisioningEntry entry 
join Role role on role.id = entry.roleId
WHERE entry.entryType = 'UPDATE_ROLE'
AND entry.provisioningType = 'WORKFLOW'
AND entry.date >= '2018-11-20 19:35:00.0'  
group by entry.roleId
			


SELECT COUNT(entry.id) AS total,
	entitlement.id as entryId,
	entitlement.name as entryName,
	'ENTITLEMENT' as entryType,
	'WORKFLOW' as type,
	'ACTIVATE_ACCOUNT' as operation
FROM ProvisioningEntry entry 
join Entitlement entitlement on entitlement.id = entry.entitlementId
WHERE entry.entryType = 'ACTIVATE_ACCOUNT'
AND entry.provisioningType = 'WORKFLOW'
AND entry.date >= '2018-11-20 19:35:00.0'  
group by entry.entitlementId



SELECT COUNT(entry.id) AS total,
	organization.id as entryId,
	organization.name as entryName,
	'ENTITLEMENT' as entryType,
	'WORKFLOW' as type,
	'ACTIVATE_ACCOUNT' as operation
FROM ProvisioningEntry entry 
join Organization organization on organization.id = entry.organizationId
WHERE entry.entryType = 'ACTIVATE_ACCOUNT'
AND entry.provisioningType = 'WORKFLOW'
AND entry.date >= '2018-11-20 19:35:00.0'  
group by entry.organizationId

-- 

 SELECT count(task.id) as total, 
	task.recipient_id as userId, 
	user.username as username, 
	user.displayName as displayName, 
	resource.id as entryId, 
	resource.name as entryName, 
	'RESOURCE' as entryType 
 FROM Task task 
 JOIN ProvisioningTask ptask ON ptask.id = task.id 
 JOIN ProvisioningEntry entry ON entry.id = ptask.provisioningEntry_id 
 JOIN Resource resource on resource.id = entry.resource_id 
 JOIN User user ON user.id = task.recipient_id 
 WHERE entry.entryType = 'UPDATE_ROLE' 
 	and task.resolvedDate >= '2018-11-20 19:35:00.0' 
 group by task.recipient_id, resource.id 
				
			
 select id, resource_id, entryType from ProvisioningEntry p
				
 select id, resolvedDate from Task p
 
 update ProvisioningEntry set resource_id = 1;

				
				
 SELECT entry.resource_id
 FROM Task task 
 JOIN ProvisioningTask ptask ON ptask.id = task.id 
 JOIN ProvisioningEntry entry ON entry.id = ptask.provisioningEntry_id 
 
 
 
 SELECT count(task.id) as total, 
	task.recipient_id as userId, 
	user.username as username, 
	user.displayName as displayName, 
	resource.id as entryId, 
	resource.name as entryName 
 FROM Task task 
 JOIN ProvisioningTask ptask ON ptask.id = task.id 
 JOIN ProvisioningEntry entry ON entry.id = ptask.provisioningEntry_id 
 JOIN Resource resource on resource.id = entry.resource_id 
 JOIN User user ON user.id = task.recipient_id 
 WHERE entry.entryType = 'UPDATE_ROLE' 
 	and task.resolvedDate >= '2018-11-20 19:35:00.0' 
 group by task.recipient_id, resource.id 
 
 SELECT count(task.id) as total, 
	task.recipient_id as userId, 
	user.username as username, 
	user.displayName as displayName, 
	entitlement.id as entryId, 
	entitlement.name as entryName 
 FROM Task task 
 JOIN ProvisioningTask ptask ON ptask.id = task.id 
 JOIN ProvisioningEntry entry ON entry.id = ptask.provisioningEntry_id 
 JOIN Entitlement entitlement on entitlement.id = entry.entitlementId 
 JOIN User user ON user.id = task.recipient_id 
 WHERE entry.entryType = 'UPDATE_ROLE' 
 	and task.resolvedDate >= '2018-11-20 19:35:00.0' 
 group by task.recipient_id, entitlement.id 
 
 SELECT count(task.id) as total, 
	task.recipient_id as userId, 
	user.username as username, 
	user.displayName as displayName, 
	organization.id as entryId, 
	organization.name as entryName 
 FROM Task task 
 JOIN ProvisioningTask ptask ON ptask.id = task.id 
 JOIN ProvisioningEntry entry ON entry.id = ptask.provisioningEntry_id 
 JOIN Organization organization on organization.id = entry.organizationId 
 JOIN User user ON user.id = task.recipient_id 
 WHERE entry.entryType = 'UPDATE_ROLE' 
 	and task.resolvedDate >= '2018-11-20 19:35:00.0' 
 group by task.recipient_id, organization.id 

 
 -- queue
 
 SELECT count(task.id) as total, 
 	queue.id as queueId, 
 	queue.name as queueName,
 	resource.id as entryId,
 	resource.name as entryName
 FROM Task task 
 JOIN TaskQueue_Task tqtask ON task.id = tqtask.tasks_id 
 JOIN TaskQueue queue ON tqtask.TaskQueue_id = queue.id  
 JOIN ProvisioningTask pTask ON pTask.id = task.id 
 JOIN ProvisioningEntry pEntry ON pEntry.id = pTask.provisioningEntry_id  
 JOIN Resource resource ON resource.id = pEntry.resource_id
 WHERE pEntry.entryType = 'UPDATE_ACCOUNT' 
 group by queue.id, resource.id
					
					
 SELECT count(task.id) as total, 
 	queue.id as queueId, 
 	queue.name as queueName,
 	entitlement.id as entryId,
 	entitlement.name as entryName
 FROM Task task 
 JOIN TaskQueue_Task tqtask ON task.id = tqtask.tasks_id 
 JOIN TaskQueue queue ON tqtask.TaskQueue_id = queue.id  
 JOIN ProvisioningTask pTask ON pTask.id = task.id 
 JOIN ProvisioningEntry pEntry ON pEntry.id = pTask.provisioningEntry_id  
 JOIN Entitlement entitlement ON entitlement.id = pEntry.entitlementId
 WHERE pEntry.entryType = 'UPDATE_ACCOUNT' 
 group by queue.id, entitlement.id
 
 
-- task

 SELECT COUNT(task.id) AS total, 
 	resource.id as entryId,
 	resource.name as entryName
 FROM Task task 
 JOIN ProvisioningTask pTask ON pTask.id = task.id 
 JOIN ProvisioningEntry pEntry ON pEntry.id = pTask.provisioningEntry_id 
 JOIN Resource resource ON resource.id = pEntry.resource_id
 WHERE pEntry.entryType = 'CREATE_ACCOUNT' 
 and task.createdDate >= '2018-11-20 19:35:00.0' 
 group by resource.id
 
 
select * from ANALYTICS2_PROVISIONING_TASK_FACT;

select * from ANALYTICS2_PROVISIONING_TASK_TYPE_DIMENSION

select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className = 'com.blazon.analytics.etl.jobs.certification.CertificationFactJob'

select * 
from JobExecution execution 
where execution.instance_id = 52;

-- delete jobExecution, jobInstance e job

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

-- jobs

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%certification2%'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%certification2%'
);

delete from Job	
where className like '%certification2%';

-- 

insert into BlazonRequestNotificationSettings (enabled, subject, template, type)
values (false, 'Blazon Created Task Request Notification', '<html><head></head><body></body></html>', 'CREATED_TASK_REQUEST_NOTIFICATION');

insert into CertificationNotificationSettings (enabled, subject, template, type)
values (false, 'Blazon Open Task Certification Notification', '<html><head></head><body></body></html>', 'CREATED_TASK_CERTIFICATION_NOTIFICATION');


-- 

select * from AuthenticationPolicy;

select entry.id, role.id, user.id, userEntry.state, entry.state
from Entry entry
JOIN MembershipRole membershipR ON entry.id = membershipR.id 
JOIN Role role on role.id = membershipR.role_id 
JOIN User user on user.id = membershipR.user_id
JOIN Entry userEntry on user.id = userEntry.id

select id, state from Entry order by id;


update Entry set state = 'INACTIVE' where id = 30;




SELECT entry.id as entryId, accountEntry.id as accountId, accountEntry.state as accountState, entry.state as entryState
from Entry entry
JOIN ManagedBy managedBy ON entry.managedBy_id = managedBy.id 
JOIN MembershipEntitlement membershipE ON entry.id = membershipE.id
JOIN Entitlement entitlement ON membershipE.entitlement_id = entitlement.id
JOIN Account account ON membershipE.account_id = account.id
JOIN User user ON account.user_id = user.id 
JOIN Resource resource ON entitlement.resource_id = resource.id
JOIN Entry accountEntry on account.id = accountEntry.id 
order by entry.id



select entry.id, entry.type from Entry entry where entry.type = 'MEMBERSHIP_ENTITLEMENT'

SELECT entry.id as entryId, entry.type as entryType, role.id as roleId, user.id as userId  
FROM Entry entry  
JOIN ManagedBy managedBy ON entry.managedBy_id = managedBy.id  
JOIN MembershipRole membershipR ON entry.id = membershipR.id  
JOIN Role role on role.id = membershipR.role_id  
JOIN User user on user.id = membershipR.user_id  
JOIN Entry userEntry on user.id = userEntry.id   
WHERE userEntry.state = 'ACTIVE'  
and entry.type = 'MEMBERSHIP_ROLE'
and (managedBy.type = 'MANUAL' or managedBy.type = 'RECONCILIATION')  
and entry.risk = 'LOW'
ORDER BY entry.id ASC  limit 120  

select e.id, e.state, e.type, e.risk
from Entry e
JOIN ManagedBy managedBy ON e.managedBy_id = managedBy.id  
JOIN MembershipRole membershipR ON e.id = membershipR.id  
JOIN Role role on role.id = membershipR.role_id  
JOIN User user on user.id = membershipR.user_id  
JOIN Entry userEntry on user.id = userEntry.id   
where e.`type` = 'MEMBERSHIP_ROLE'

select * from MembershipRole m;



SELECT entry.id as entryId, entry.type as entryType, entitlement.id as entitlementId, resource.id as resourceId, user.id as userId, accountEntry.id as accountId, account.id
FROM Entry entry  
JOIN ManagedBy managedBy ON entry.managedBy_id = managedBy.id  
JOIN MembershipEntitlement membershipE ON entry.id = membershipE.id  
JOIN Entitlement entitlement ON membershipE.entitlement_id = entitlement.id  
JOIN Account account ON membershipE.account_id = account.id  
JOIN User user ON account.user_id = user.id  
JOIN Resource resource ON entitlement.resource_id = resource.id  
JOIN Entry accountEntry on account.id = accountEntry.id   
WHERE accountEntry.state = 'ACTIVE'
and entry.type = 'MEMBERSHIP_ENTITLEMENT' 
and (managedBy.type = 'MANUAL' or managedBy.type = 'RECONCILIATION')  
and entry.risk = 'LOW'
ORDER BY entry.id ASC  limit 123 

select id, state from Entry entry
where id = 6 or id = 13;

update Entry set state = 'INACTIVE' where id = 13;



select user.id as id, 
	user.displayName as displayName, 
	user.username as username, 
	user.email as email, 
	user.personalEmail as personalEmail,
	user.mobilePhone as mobilePhone,
	user.primaryPhone as primaryPhone,
	user.needChangePassword as needChangePassword,
	user.lastPasswordModificationDate as lastPasswordModificationDate,
	user.lastAccess as lastAccess,
	user.locked as locked,
	entry.state as state, 
	entry.createdAt as createdAt,
	entry.expireAt as expireAt, 
	entry.certificatedAt as certificatedAt, 
	entry.risk as risk,
	createdBy.type as createdBytype, 
	createdBy.objectId as createdByObjectId
from User user 
left join Entry entry on user.id = entry.id 
left join CreatedBy createdBy on createdBy.id = entry.createdBy_id 

					
select e.name as name,
	e.value as value
from EntryAttributeValue e 
where e.entry_id = 1
					
/*
 * 
 *   - Adicionar os campos abaixo:
    - personalEmail
    - mobilePhone
    - primaryPhone
    - needChangePassword
    - lastPasswordModificationDate
    - lastAccess
    - locked
    - risco
  - Adicionar os campos adicionais
 */
					
					
select * from InternalPermissionGroup_InternalPermission

desc InternalPermissionGroup_InternalPermission;

insert into InternalPermissionGroup_InternalPermission (internalPermissions_id, internalPermissionGroups_id)
values (?, ?)

SELECT * FROM ReconciliationEntry;


