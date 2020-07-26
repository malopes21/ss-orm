TABLE_NAME
ANALYTICS_CERTIFICATION_CAMPAIGN_DETAIL_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
CERTIFICATION_CAMPAIGN_DETAIL_POLICY_DIMENSION_ID	bigint(20)	YES		NULL	
CERTIFICATION_CAMPAIGN_RESUME_FACT_ID	bigint(20)	YES		NULL	
amountCanceled	bigint(20)	YES		NULL	
amountCertified	bigint(20)	YES		NULL	
amountError	bigint(20)	YES		NULL	
amountOpen	bigint(20)	YES		NULL	
amountRevoked	bigint(20)	YES		NULL	
averageTime	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
TABLE_NAME
ANALYTICS_CERTIFICATION_CAMPAIGN_POLICY_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
policyId	bigint(20)	YES		NULL	
policyName	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_CERTIFICATION_CAMPAIGN_RESUME_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
amountCertificationEntries	bigint(20)	YES		NULL	
creationDate	datetime	YES		NULL	
date	datetime	YES		NULL	
deadline	datetime	YES		NULL	
finalizeDate	datetime	YES		NULL	
instanceId	bigint(20)	YES		NULL	
lastDetailDiscovery	datetime	YES		NULL	
name	varchar(255)	YES		NULL	
slaReached	bit(1)	YES		NULL	
status	varchar(255)	YES		NULL	
amountOpenEntries	bigint(20)	YES		NULL	
amountOpenTasks	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_CERTIFICATION_EXECUTOR_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
CERTIFICATION_EXECUTOR_ENTRYTYPE_DIMENSION	varchar(255)	YES		NULL	
CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION_ID	bigint(20)	YES		NULL	
CERTIFICATION_EXECUTOR_USER_DIMENSION_ID	bigint(20)	YES		NULL	
amountCertified	bigint(20)	YES		NULL	
amountOpen	bigint(20)	YES		NULL	
amountRevoked	bigint(20)	YES		NULL	
averageTime	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
finalized	bigint(20)	YES		NULL	
slaReached	bigint(20)	YES		NULL	
slaUnreached	bigint(20)	YES		NULL	
amountTasks	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
instanceId	bigint(20)	YES		NULL	
instanceName	varchar(255)	YES		NULL	
instanceType	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_CERTIFICATION_EXECUTOR_USER_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
displayname	varchar(255)	YES		NULL	
userId	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_CERTIFICATION_MICRO_DETAIL_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
CERTIFICATION_MICRO_RESUME_FACT_ID	bigint(20)	YES		NULL	
amountCanceled	bigint(20)	YES		NULL	
amountCertified	bigint(20)	YES		NULL	
amountError	bigint(20)	YES		NULL	
amountOpen	bigint(20)	YES		NULL	
amountRevoked	bigint(20)	YES		NULL	
averageTime	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
TABLE_NAME
ANALYTICS_CERTIFICATION_MICRO_RESUME_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
CERTIFICATION_MICRO_ENTRYTYPE_DIMENSION	varchar(255)	YES		NULL	
amountCertificationEntries	bigint(20)	YES		NULL	
creationDate	datetime	YES		NULL	
date	datetime	YES		NULL	
deadline	datetime	YES		NULL	
finalizeDate	datetime	YES		NULL	
instanceId	bigint(20)	YES		NULL	
lastDetailDiscovery	datetime	YES		NULL	
name	varchar(255)	YES		NULL	
slaReached	bit(1)	YES		NULL	
status	varchar(255)	YES		NULL	
amountOpenEntries	bigint(20)	YES		NULL	
amountOpenTasks	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_CERTIFICATION_SELECTOR_DETAIL_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
CERTIFICATION_SELECTOR_ENTRYTYPE_DIMENSION	varchar(255)	YES		NULL	
CERTIFICATION_SELECTOR_RESUME_FACT_ID	bigint(20)	YES		NULL	
amountCanceled	bigint(20)	YES		NULL	
amountCertified	bigint(20)	YES		NULL	
amountError	bigint(20)	YES		NULL	
amountOpen	bigint(20)	YES		NULL	
amountRevoked	bigint(20)	YES		NULL	
averageTime	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
TABLE_NAME
ANALYTICS_CERTIFICATION_SELECTOR_RESUME_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
CERTIFICATION_SELECTOR_SELECTOR_DIMENSION_ID	bigint(20)	YES		NULL	
CERTIFICATION_SELECTOR_USER_DIMENSION_ID	bigint(20)	YES		NULL	
amountCertificationEntries	bigint(20)	YES		NULL	
creationDate	datetime	YES		NULL	
date	datetime	YES		NULL	
deadline	datetime	YES		NULL	
finalizeDate	datetime	YES		NULL	
instanceId	bigint(20)	YES		NULL	
lastDetailDiscovery	datetime	YES		NULL	
name	varchar(255)	YES		NULL	
slaReached	bit(1)	YES		NULL	
status	varchar(255)	YES		NULL	
amountOpenEntries	bigint(20)	YES		NULL	
amountOpenTasks	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_CERTIFICATION_SELECTOR_SELECTOR_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
selectorId	bigint(20)	YES		NULL	
selectorName	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_CERTIFICATION_SELECTOR_USER_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
displayName	varchar(255)	YES		NULL	
userId	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_CERTIFICATION_TASK_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
CERTIFICATION_TASK_ENTRYTYPE_DIMENSION	varchar(255)	YES		NULL	
CERTIFICATION_TASK_INSTANCE_DIMENSION_ID	bigint(20)	YES		NULL	
amountOpen	bigint(20)	YES		NULL	
averageTime	bigint(20)	YES		NULL	
certified	bigint(20)	YES		NULL	
created	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
revoked	bigint(20)	YES		NULL	
slaReached	bigint(20)	YES		NULL	
slaUnreached	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_CERTIFICATION_TASK_INSTANCE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
instanceId	bigint(20)	YES		NULL	
instanceType	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT
ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT
Field	Type	Null	Key	Default	Extra
dateCollect	datetime	NO	PRI	NULL	
amountAccountsByManual	bigint(20)	YES		NULL	
amountAccountsByReconciliation	bigint(20)	YES		NULL	
amountAccountsByRole	bigint(20)	YES		NULL	
amountMembershipEntitlementByManual	bigint(20)	YES		NULL	
amountMembershipEntitlementByReconciliation	bigint(20)	YES		NULL	
amountMembershipEntitlementByRole	bigint(20)	YES		NULL	
amountMembershipRoleByAssignmentPolicy	bigint(20)	YES		NULL	
amountMembershipRoleByReconciliation	bigint(20)	YES		NULL	
amountMembershipRoleByManual	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_DIRECTORY_OBJECTS_CREATION_DETAIL_FACT
ANALYTICS_DIRECTORY_OBJECTS_CREATION_DETAIL_FACT
Field	Type	Null	Key	Default	Extra
dateCollect	datetime	NO	PRI	NULL	
amountAccountsByReconciliation	bigint(20)	YES		NULL	
amountAccountsByRequest	bigint(20)	YES		NULL	
amountAccountsByRole	bigint(20)	YES		NULL	
amountEntitlementsByReconciliation	bigint(20)	YES		NULL	
amountEntitlementsByRequest	bigint(20)	YES		NULL	
amountEntitlementsByRole	bigint(20)	YES		NULL	
amountRolesByReconciliation	bigint(20)	YES		NULL	
amountRolesByRequest	bigint(20)	YES		NULL	
amountUsersByReconciliation	bigint(20)	YES		NULL	
amountUsersByRequest	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_DIRECTORY_OBJECTS_DETAIL_FACT
ANALYTICS_DIRECTORY_OBJECTS_DETAIL_FACT
Field	Type	Null	Key	Default	Extra
dateCollect	datetime	NO	PRI	NULL	
averageAccountsPerResource	bigint(20)	YES		NULL	
averageAccountsPerUser	bigint(20)	YES		NULL	
averageEntitlementsByResource	bigint(20)	YES		NULL	
averageEntitlementsByUser	bigint(20)	YES		NULL	
averageUsersByEntitlement	bigint(20)	YES		NULL	
averageUsersByRole	bigint(20)	YES		NULL	
averageRolesByUser	bigint(20)	YES		NULL	
totalUsersWithoutAccounts	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_DIRECTORY_OBJECTS_FACT
ANALYTICS_DIRECTORY_OBJECTS_FACT
Field	Type	Null	Key	Default	Extra
dateCollect	datetime	NO	PRI	NULL	
amountActiveUsers	bigint(20)	YES		NULL	
amountInactiveUsers	bigint(20)	YES		NULL	
amountResources	bigint(20)	YES		NULL	
amountRoles	bigint(20)	YES		NULL	
amountAccounts	bigint(20)	YES		NULL	
amountMembershipEntitlements	bigint(20)	YES		NULL	
amountRemovedUsers	bigint(20)	YES		NULL	
amountLockedUsers	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_DIRECTORY_RISK_DETAIL_FACT
ANALYTICS_DIRECTORY_RISK_DETAIL_FACT
Field	Type	Null	Key	Default	Extra
dateCollect	datetime	NO	PRI	NULL	
amountHighRiskEntitlements	bigint(20)	YES		NULL	
amountHighRiskResources	bigint(20)	YES		NULL	
amountHighRiskRoles	bigint(20)	YES		NULL	
amountLowRiskEntitlements	bigint(20)	YES		NULL	
amountLowRiskResources	bigint(20)	YES		NULL	
amountLowRiskRoles	bigint(20)	YES		NULL	
amountMediumRiskEntitlements	bigint(20)	YES		NULL	
amountMediumRiskResources	bigint(20)	YES		NULL	
amountMediumRiskRoles	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_ENTRY_ENTRY_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
entryId	bigint(20)	YES		NULL	
entryName	varchar(255)	YES		NULL	
entryType	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_ENTRY_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
PROVISIONING_ENTRY_ENTRY_DIMENSION_ID	bigint(20)	YES		NULL	
PROVISIONING_ENTRY_OPERATION_DIMENSION_ID	bigint(20)	YES		NULL	
PROVISIONING_ENTRY_TYPE_DIMENSION_ID	bigint(20)	YES		NULL	
averageTime	bigint(20)	YES		NULL	
created	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
errorFinalized	bigint(20)	YES		NULL	
open	bigint(20)	YES		NULL	
successFinalized	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_ENTRY_OPERATION_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
operation	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_ENTRY_TYPE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
type	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_TASK_ENTRY_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
entryId	bigint(20)	YES		NULL	
entryName	varchar(255)	YES		NULL	
entryType	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_TASK_EXECUTOR_ENTRY_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
entryId	bigint(20)	YES		NULL	
entryName	varchar(255)	YES		NULL	
entryType	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_TASK_EXECUTOR_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
PROVISIONING_TASK_EXECUTOR_ENTRY_DIMENSION_ID	bigint(20)	YES		NULL	
PROVISIONING_TASK_EXECUTOR_TYPE_DIMENSION_ID	bigint(20)	YES		NULL	
PROVISIONING_TASK_EXECUTOR_USER_DIMENSION_ID	bigint(20)	YES		NULL	
averageTime	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
finalized	bigint(20)	YES		NULL	
open	bigint(20)	YES		NULL	
slaReached	bigint(20)	YES		NULL	
slaUnreached	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_TASK_EXECUTOR_TYPE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
type	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_TASK_EXECUTOR_USER_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
displayName	varchar(255)	YES		NULL	
userId	bigint(20)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_TASK_FACT
ANALYTICS_PROVISIONING_TASK_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
PROVISIONING_TASK_ENTRY_DIMENSION_ID	bigint(20)	YES		NULL	
PROVISIONING_TASK_TYPE_DIMENSION_ID	bigint(20)	YES		NULL	
amountDone	bigint(20)	YES		NULL	
amountTodo	bigint(20)	YES		NULL	
amountWaitingAssign	bigint(20)	YES		NULL	
averageTime	bigint(20)	YES		NULL	
created	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
notProvisioned	bigint(20)	YES		NULL	
provisioned	bigint(20)	YES		NULL	
slaReached	bigint(20)	YES		NULL	
slaUnreached	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_TASK_QUEUE_ENTRY_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
entryId	bigint(20)	YES		NULL	
entryName	varchar(255)	YES		NULL	
entryType	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_TASK_QUEUE_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
PROVISIONING_TASK_QUEUE_ENTRY_DIMENSION_ID	bigint(20)	YES		NULL	
PROVISIONING_TASK_QUEUE_NAME_DIMENSION_ID	bigint(20)	YES		NULL	
PROVISIONING_TASK_QUEUE_TYPE_DIMENSION_ID	bigint(20)	YES		NULL	
amount	bigint(20)	YES		NULL	
averageTimeOnQueue	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
slaReached	bigint(20)	YES		NULL	
slaUnreached	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_TASK_QUEUE_NAME_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
queue	varchar(255)	YES		NULL	
queueId	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_TASK_QUEUE_TYPE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
type	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_PROVISIONING_TASK_TYPE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
type	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_RECONCILIATION_RESUME_BATCH_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
batch	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_RECONCILIATION_RESUME_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
RECONCILIATION_RESUME_BATCH_DIMENSION_ID	bigint(20)	YES		NULL	
RECONCILIATION_RESUME_PROFILE_DIMENSION_ID	bigint(20)	YES		NULL	
RECONCILIATION_RESUME_RESOURCE_DIMENSION_ID	bigint(20)	YES		NULL	
averageTime	bigint(20)	YES		NULL	
conflictResolved	bigint(20)	YES		NULL	
created	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
errorFinalized	bigint(20)	YES		NULL	
processedWithoutAction	bigint(20)	YES		NULL	
successFinalized	bigint(20)	YES		NULL	
waitingManualAction	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_RECONCILIATION_RESUME_PROFILE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
profileId	bigint(20)	YES		NULL	
profileName	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_RECONCILIATION_RESUME_RESOURCE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
resourceId	bigint(20)	YES		NULL	
resourceName	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_RECONCILIATION_SITUATION_BATCH_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
batch	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_RECONCILIATION_SITUATION_ENTRY_TYPE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
type	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_RECONCILIATION_SITUATION_FACT
ANALYTICS_RECONCILIATION_SITUATION_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
RECONCILIATION_SITUATION_BATCH_DIMENSION_ID	bigint(20)	YES		NULL	
RECONCILIATION_SITUATION_ENTRY_TYPE_DIMENSION_ID	bigint(20)	YES		NULL	
RECONCILIATION_SITUATION_PROFILE_DIMENSION_ID	bigint(20)	YES		NULL	
RECONCILIATION_SITUATION_RESOURCE_DIMENSION_ID	bigint(20)	YES		NULL	
amount	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
situation	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_RECONCILIATION_SITUATION_PROFILE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
profileId	bigint(20)	YES		NULL	
profileName	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_RECONCILIATION_SITUATION_RESOURCE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
resourceId	bigint(20)	YES		NULL	
resourceName	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_REQUEST_APPROVAL_TASK_ENTRY_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
entryId	bigint(20)	YES		NULL	
entryName	varchar(255)	YES		NULL	
entryType	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_ENTRY_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
entryId	bigint(20)	YES		NULL	
entryName	varchar(255)	YES		NULL	
entryType	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
REQUEST_APPROVAL_TASK_EXECUTOR_ENTRY_DIMENSION_ID	bigint(20)	YES		NULL	
REQUEST_APPROVAL_TASK_EXECUTOR_TYPE_DIMENSION_ID	bigint(20)	YES		NULL	
REQUEST_APPROVAL_TASK_EXECUTOR_USER_DIMENSION_ID	bigint(20)	YES		NULL	
averageTime	bigint(20)	YES		NULL	
created	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
finalized	bigint(20)	YES		NULL	
open	bigint(20)	YES		NULL	
slaReached	bigint(20)	YES		NULL	
slaUnreached	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_TYPE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
type	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_USER_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
displayName	varchar(255)	YES		NULL	
userId	bigint(20)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_REQUEST_APPROVAL_TASK_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
REQUEST_APPROVAL_TASK_ENTRY_DIMENSION_ID	bigint(20)	YES		NULL	
REQUEST_APPROVAL_TASK_TYPE_DIMENSION_ID	bigint(20)	YES		NULL	
approved	bigint(20)	YES		NULL	
averageTime	bigint(20)	YES		NULL	
created	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
disapproved	bigint(20)	YES		NULL	
open	bigint(20)	YES		NULL	
resolved	bigint(20)	YES		NULL	
slaReached	bigint(20)	YES		NULL	
slaUnreached	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_REQUEST_APPROVAL_TASK_TYPE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
type	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_REQUEST_RESUME_ENTRYTYPE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
entryId	bigint(20)	YES		NULL	
entryName	varchar(255)	YES		NULL	
entryType	varchar(255)	YES		NULL	
TABLE_NAME
ANALYTICS_REQUEST_RESUME_FACT
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
REQUEST_ENTRYTYPE_DIMENSION_ID	bigint(20)	YES		NULL	
REQUEST_TYPE_DIMENSION_ID	bigint(20)	YES		NULL	
approvalAverageTime	bigint(20)	YES		NULL	
approvalNotRequired	bigint(20)	YES		NULL	
approvalRequired	bigint(20)	YES		NULL	
approved	bigint(20)	YES		NULL	
averageTime	bigint(20)	YES		NULL	
canceled	bigint(20)	YES		NULL	
created	bigint(20)	YES		NULL	
date	datetime	YES		NULL	
disapproved	bigint(20)	YES		NULL	
error	bigint(20)	YES		NULL	
generatedBySystem	bigint(20)	YES		NULL	
manuallyCreated	bigint(20)	YES		NULL	
provisioningAverageTime	bigint(20)	YES		NULL	
sodAllowed	bigint(20)	YES		NULL	
sodAverageTime	bigint(20)	YES		NULL	
sodNotAllowed	bigint(20)	YES		NULL	
sodNotRequired	bigint(20)	YES		NULL	
sodRequired	bigint(20)	YES		NULL	
success	bigint(20)	YES		NULL	
validationError	bigint(20)	YES		NULL	
waitingApproval	bigint(20)	YES		NULL	
waitingProvisioning	bigint(20)	YES		NULL	
waitingSodResolution	bigint(20)	YES		NULL	
TABLE_NAME
ANALYTICS_REQUEST_RESUME_TYPE_DIMENSION
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
type	varchar(255)	YES		NULL	
TABLE_NAME
Account
Account
Field	Type	Null	Key	Default	Extra
accountIdentifier	varchar(255)	YES		NULL	
description	varchar(255)	YES		NULL	
lastPasswordModificationDate	datetime	YES		NULL	
name	varchar(255)	YES		NULL	
primaryy	bit(1)	YES		NULL	
id	bigint(20)	NO	PRI	NULL	
resource_id	bigint(20)	YES	MUL	NULL	
user_id	bigint(20)	YES		NULL	
TABLE_NAME
AccountNotificationSettings
AccountNotificationSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
enabled	tinyint(1)	YES		0	
subject	varchar(1000)	YES		NULL	
template	longtext	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
AccountPasswordVault
AccountPasswordVault
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
accountId	bigint(20)	YES		NULL	
passwordVaultId	bigint(20)	YES		NULL	
userId	bigint(20)	YES		NULL	
TABLE_NAME
ApprovalPolicy
ApprovalPolicy
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
autoApproved	bit(1)	YES		NULL	
description	varchar(255)	YES		NULL	
eligibility	varchar(3500)	YES		NULL	
enabled	bit(1)	YES		NULL	
name	varchar(255)	YES		NULL	
operator	varchar(255)	YES		NULL	
position	int(11)	YES		NULL	
sla	int(11)	YES		NULL	
type	varchar(255)	YES		NULL	
workflow	varchar(255)	YES		NULL	
TABLE_NAME
ApprovalTaskDetail
ApprovalTaskDetail
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
approvalDate	datetime	YES		NULL	
creation	datetime	YES		NULL	
levelName	varchar(255)	YES		NULL	
outcome	varchar(255)	YES		NULL	
request_id	bigint(20)	YES	MUL	NULL	
task_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
AssignmentDirectoryEntry
Field	Type	Null	Key	Default	Extra
type	varchar(31)	NO		NULL	
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
name	varchar(255)	YES		NULL	
displayName	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
AssignmentEntry
AssignmentEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
action	varchar(255)	YES		NULL	
assignmentPolicyId	bigint(20)	YES		NULL	
creationDate	datetime	YES		NULL	
executionDate	datetime	YES		NULL	
lockDate	datetime	YES		NULL	
lockNumber	bigint(20)	YES		NULL	
status	varchar(255)	YES		NULL	
beneficiary_id	bigint(20)	YES		NULL	
role_id	bigint(20)	YES		NULL	
TABLE_NAME
AssignmentPolicy
AssignmentPolicy
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
body	longtext	YES		NULL	
description	varchar(255)	YES		NULL	
enabled	bit(1)	YES		NULL	
modifiedAt	datetime	YES		NULL	
name	varchar(255)	YES		NULL	
position	int(11)	YES		NULL	
revokeType	varchar(255)	YES		NULL	
TABLE_NAME
AssignmentRoleRevokeEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
createdAt	datetime	YES		NULL	
lockNumber	bigint(20)	YES		NULL	
processedAt	datetime	YES		NULL	
resolveAction	varchar(255)	YES		NULL	
resolveNote	varchar(1000)	YES		NULL	
resolvedAt	datetime	YES		NULL	
status	varchar(255)	YES		NULL	
resolvedBy_id	bigint(20)	YES		NULL	
role_id	bigint(20)	YES		NULL	
user_id	bigint(20)	YES		NULL	
TABLE_NAME
AssignmentRoleRevokeRole
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
name	varchar(255)	YES		NULL	
TABLE_NAME
AssignmentRoleRevokeUser
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
displayName	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
AssociationRule
AssociationRule
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
payload	varchar(2000)	YES		NULL	
targetType	varchar(255)	YES		NULL	
type	varchar(255)	YES		NULL	
profile_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
AttributeMap
AttributeMap
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
beanshell	bit(1)	NO		NULL	
description	varchar(255)	YES		NULL	
field	varchar(255)	YES		NULL	
value	varchar(10000)	YES		NULL	
TABLE_NAME
AttributeMapping
AttributeMapping
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
TABLE_NAME
AttributeMapping_AttributeMap
AttributeMapping_AttributeMap
Field	Type	Null	Key	Default	Extra
attributeMapping_id	bigint(20)	NO	PRI	NULL	
attributeMap_id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
AuthenticationMethodsNotificationSettings
AuthenticationMethodsNotificationSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
enabled	tinyint(1)	YES		0	
subject	varchar(1000)	YES		NULL	
template	longtext	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
AuthenticationPolicy
AuthenticationPolicy
Field	Type	Null	Key	Default	Extra
uuid	varchar(255)	NO	PRI	NULL	
defaultt	bit(1)	YES		NULL	
description	varchar(255)	YES		NULL	
forceAuthentication	bit(1)	YES		NULL	
name	varchar(255)	YES		NULL	
sessionTimeToLive	bigint(20)	YES		NULL	
workflow	varchar(255)	YES		NULL	
published	tinyint(1)	YES		0	
lastPublication	datetime	YES		NULL	
allowSimultaneousLogin	tinyint(1)	YES		0	
riskDefinitions	longtext	YES		NULL	
factorOneDefinitions	longtext	YES		NULL	
factorTwoDefinitions	longtext	YES		NULL	
postAuthentication	longtext	YES		NULL	
TABLE_NAME
AuthenticationPolicyParameters
Field	Type	Null	Key	Default	Extra
auth_policy_id	varchar(255)	NO	MUL	NULL	
parameters_id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
AuthenticationSourceKerberos
AuthenticationSourceKerberos
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
keyTab	varchar(255)	YES		NULL	
realm	varchar(255)	YES		NULL	
servicePrincipal	varchar(255)	YES		NULL	
TABLE_NAME
AuthenticationSourceLDAP
AuthenticationSourceLDAP
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
connectionBindDN	varchar(255)	YES		NULL	
connectionBindPassword	varchar(255)	YES		NULL	
connectionHost	varchar(255)	YES		NULL	
connectionPort	int(11)	YES		NULL	
groupNameAttribute	varchar(255)	YES		NULL	
groupSearchBase	varchar(255)	YES		NULL	
groupSearchBaseFilter	varchar(255)	YES		NULL	
groupSearchMaxResults	int(11)	YES		NULL	
maxPoolSize	int(11)	YES		NULL	
minPoolSize	int(11)	YES		NULL	
userSearchBase	varchar(255)	YES		NULL	
userSearchBaseFilter	varchar(255)	YES		NULL	
userSearchMaxResults	int(11)	YES		NULL	
usernameAttribute	varchar(255)	YES		NULL	
waitResponseTimeout	int(11)	YES		NULL	
waitTimeout	int(11)	YES		NULL	
TABLE_NAME
AuthenticationSourceOpenId
AuthenticationSourceOpenId
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
accessTokenUrl	varchar(255)	YES		NULL	
authorizationUrl	varchar(255)	YES		NULL	
clientId	varchar(255)	YES		NULL	
clientSecret	varchar(255)	YES		NULL	
TABLE_NAME
AuthenticationSourceSaml
AuthenticationSourceSaml
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
entityId	varchar(255)	YES		NULL	
singleLogoutServiceLocation	varchar(255)	YES		NULL	
singleSignOnServiceLocation	varchar(255)	YES		NULL	
TABLE_NAME
BlazonAccessManagerSession
BlazonAccessManagerSession
Field	Type	Null	Key	Default	Extra
id	varchar(255)	NO	PRI	NULL	
browserName	varchar(255)	YES		NULL	
browserversion	varchar(255)	YES		NULL	
creation	datetime	YES		NULL	
engineName	varchar(255)	YES		NULL	
fingerprint	varchar(255)	YES		NULL	
lastAccess	datetime	YES		NULL	
latitude	varchar(255)	YES		NULL	
longitude	varchar(255)	YES		NULL	
manufacturer	varchar(255)	YES		NULL	
maxInactiveInterval	int(11)	YES		NULL	
network	varchar(255)	YES		NULL	
operatingSystemName	varchar(255)	YES		NULL	
status	varchar(255)	YES		NULL	
timeToLive	int(11)	YES		NULL	
userAgentType	varchar(255)	YES		NULL	
userIPaddress	varchar(255)	YES		NULL	
principalIdentifier	varchar(255)	YES		NULL	
TABLE_NAME
BlazonAccessManagerSessionAttributes
BlazonAccessManagerSessionAttributes
Field	Type	Null	Key	Default	Extra
name	varchar(255)	NO	PRI	NULL	
value	longtext	YES		NULL	
session_id	varchar(255)	YES	MUL	NULL	
TABLE_NAME
BlazonRequest
BlazonRequest
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
approvalFinishedAt	datetime	YES		NULL	
approvalPolicy_id	bigint(20)	YES		NULL	
approvalProcess	varchar(255)	YES		NULL	
approvalStartedAt	datetime	YES		NULL	
approvalWorkflowId	bigint(20)	YES		NULL	
createDate	datetime	YES		NULL	
createdBy	varchar(255)	YES		NULL	
createdByObjectId	varchar(255)	YES		NULL	
dependenciesVerifiedAt	datetime	YES		NULL	
effectiveDate	datetime	YES		NULL	
finalizeDate	datetime	YES		NULL	
generatedBySystem	tinyint(1)	YES		0	
justification	varchar(1000)	YES		NULL	
lockDate	datetime	YES		NULL	
lockNumber	bigint(20)	YES		NULL	
needApproval	bit(1)	NO		NULL	
payload	longtext	YES		NULL	
payloadWithItemThatViolatesSodPolicy	tinyint(1)	YES		0	
provisioningEntryId	bigint(20)	YES		NULL	
provisioningFinishedAt	datetime	YES		NULL	
provisioningStartedAt	datetime	YES		NULL	
sodFinishedAt	datetime	YES		NULL	
sodProcess	varchar(255)	YES		NULL	
sodStartedAt	datetime	YES		NULL	
sodWorkflowId	bigint(20)	YES		NULL	
status	varchar(255)	YES	MUL	NULL	
type	varchar(255)	YES		NULL	
beneficiary_id	bigint(20)	YES	MUL	NULL	
parent_id	bigint(20)	YES	MUL	NULL	
requestInternalEntry_id	bigint(20)	YES		NULL	
requester_id	bigint(20)	YES		NULL	
TABLE_NAME
BlazonRequestApprovalTask
BlazonRequestApprovalTask
Field	Type	Null	Key	Default	Extra
disapprovalJustification	varchar(1000)	YES		NULL	
id	bigint(20)	NO	PRI	NULL	
request_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
BlazonRequestDirectoryEntry
Field	Type	Null	Key	Default	Extra
type	varchar(31)	NO		NULL	
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
name	varchar(255)	YES		NULL	
accountIdentifier	varchar(255)	YES		NULL	
resourceId	bigint(20)	YES		NULL	
resourceName	varchar(255)	YES		NULL	
accountId	bigint(20)	YES		NULL	
entitlementId	bigint(20)	YES		NULL	
entitlementName	varchar(255)	YES		NULL	
displayName	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
BlazonRequestNotificationSettings
BlazonRequestNotificationSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
enabled	tinyint(1)	YES		0	
subject	varchar(1000)	YES		NULL	
template	longtext	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
BlazonRequestSodApprovalTask
BlazonRequestSodApprovalTask
Field	Type	Null	Key	Default	Extra
justification	varchar(1000)	YES		NULL	
id	bigint(20)	NO	PRI	NULL	
request_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
BlazonRequestTransitionState
BlazonRequestTransitionState
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
bySystem	bit(1)	YES		NULL	
date	datetime	YES		NULL	
description	longtext	YES		NULL	
detail	longtext	YES		NULL	
sourceState	varchar(255)	YES		NULL	
targetState	varchar(255)	YES		NULL	
request_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
BlazonRequest_dependsOnIds
BlazonRequest_dependsOnIds
Field	Type	Null	Key	Default	Extra
BlazonRequest_id	bigint(20)	NO	MUL	NULL	
dependsOnIds	bigint(20)	YES		NULL	
TABLE_NAME
BllazonImage
BllazonImage
Field	Type	Null	Key	Default	Extra
id	varchar(255)	NO	PRI	NULL	
description	varchar(255)	YES		NULL	
image	longtext	YES		NULL	
name	varchar(255)	YES		NULL	
TABLE_NAME
CampaignDefinition
CampaignDefinition
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
enabled	tinyint(1)	YES		0	
isAutoRevoke	tinyint(1)	YES		0	
lastExecution	datetime	YES		NULL	
name	varchar(255)	YES		NULL	
sla	int(11)	YES		NULL	
TABLE_NAME
CampaignDefinition_CertificationPolicy
CampaignDefinition_CertificationPolicy
Field	Type	Null	Key	Default	Extra
CampaignDefinition_id	bigint(20)	NO	MUL	NULL	
policies_id	bigint(20)	NO	MUL	NULL	
TABLE_NAME
CampaignExecutionInstance
CampaignExecutionInstance
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
date	datetime	YES		NULL	
deadline	datetime	YES		NULL	
finalizeDate	datetime	YES		NULL	
status	varchar(255)	YES		NULL	
campaign_id	bigint(20)	YES	MUL	NULL	
isAutoRevoke	tinyint(1)	YES		0	
TABLE_NAME
CampaignExecutionInstance_CertificationEntry
CampaignExecutionInstance_CertificationEntry
Field	Type	Null	Key	Default	Extra
CampaignExecutionInstance_id	bigint(20)	NO	MUL	NULL	
certificationEntries_id	bigint(20)	NO	MUL	NULL	
TABLE_NAME
CertificationApprovalTask
CertificationApprovalTask
Field	Type	Null	Key	Default	Extra
entryId	bigint(20)	YES		NULL	
entryType	varchar(255)	YES		NULL	
justification	varchar(1000)	YES		NULL	
revokedJustification	varchar(1000)	YES		NULL	
id	bigint(20)	NO	PRI	NULL	
certificationEntry_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
CertificationApprovalTaskDetail
CertificationApprovalTaskDetail
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
approvalDate	datetime	YES		NULL	
creation	datetime	YES		NULL	
levelName	varchar(255)	YES		NULL	
outcome	varchar(255)	YES		NULL	
certificationEntry_id	bigint(20)	YES	MUL	NULL	
task_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
CertificationDirectoryEntry
Field	Type	Null	Key	Default	Extra
type	varchar(31)	NO		NULL	
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
name	varchar(255)	YES		NULL	
displayName	varchar(255)	YES		NULL	
roleId	bigint(20)	YES		NULL	
roleName	varchar(255)	YES		NULL	
userId	bigint(20)	YES		NULL	
username	varchar(255)	YES		NULL	
accountIdentifier	varchar(255)	YES		NULL	
resourceId	bigint(20)	YES		NULL	
resourceName	varchar(255)	YES		NULL	
accountId	bigint(20)	YES		NULL	
entitlementId	bigint(20)	YES		NULL	
entitlementName	varchar(255)	YES		NULL	
TABLE_NAME
CertificationEntry
CertificationEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
createdBy	varchar(255)	YES		NULL	
createdByObjectId	varchar(255)	YES		NULL	
creationDate	datetime	YES		NULL	
entryId	bigint(20)	YES	MUL	NULL	
entryType	varchar(255)	YES		NULL	
lockDate	datetime	YES		NULL	
lockNumber	bigint(20)	YES		NULL	
processDate	datetime	YES		NULL	
status	varchar(255)	YES		NULL	
workflowCertificationId	bigint(20)	YES		NULL	
workflowCertificationName	varchar(255)	YES		NULL	
certificationInternalEntry_id	bigint(20)	YES		NULL	
policy_id	bigint(20)	YES	MUL	NULL	
selector_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
CertificationEntryTransitionState
CertificationEntryTransitionState
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
bySystem	bit(1)	YES		NULL	
date	datetime	YES		NULL	
description	longtext	YES		NULL	
detail	longtext	YES		NULL	
sourceState	varchar(255)	YES		NULL	
targetState	varchar(255)	YES		NULL	
certificationEntry_id	bigint(20)	YES	MUL	NULL	
user_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
CertificationNotificationSettings
CertificationNotificationSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
enabled	tinyint(1)	YES		0	
subject	varchar(1000)	YES		NULL	
template	longtext	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
CertificationPolicy
CertificationPolicy
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
certificationObjectType	varchar(255)	YES		NULL	
certificationWorkflowName	varchar(255)	YES		NULL	
criticity	varchar(255)	YES		NULL	
description	varchar(255)	YES		NULL	
enabled	tinyint(1)	YES		1	
filterObjectType	varchar(255)	YES		NULL	
filterObjectTypeId	bigint(20)	YES		NULL	
limitOfEntriesByExecution	int(11)	YES		NULL	
name	varchar(255)	YES		NULL	
numberOfDaysSinceLastCertification	int(11)	YES		NULL	
selectAllEntries	tinyint(1)	YES		0	
selectExpiratedEntries	bit(1)	NO		NULL	
selectNotCertifiableEntries	bit(1)	NO		NULL	
userFilterRules	longtext	YES		NULL	
TABLE_NAME
CertificationSelector
CertificationSelector
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
certificationAccountWorkflowName	varchar(255)	YES		NULL	
certificationMembershipEntitlementWorkflowName	varchar(255)	YES		NULL	
certificationMembershipRoleWorkflowName	varchar(255)	YES		NULL	
certifyAccounts	tinyint(1)	YES		0	
certifyMembershipEntitlements	tinyint(1)	YES		0	
certifyMembershipRoles	tinyint(1)	YES		0	
certifyUsers	tinyint(1)	YES		0	
description	varchar(255)	YES		NULL	
enabled	tinyint(1)	YES		1	
name	varchar(255)	YES		NULL	
position	int(11)	YES		NULL	
rules	longtext	YES		NULL	
sla	int(11)	YES		NULL	
type	varchar(255)	YES		NULL	
isAutoRevoke	tinyint(1)	YES		0	
TABLE_NAME
ChangeApplicationAccountOwnerAccount
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
accountIdentifier	varchar(255)	YES		NULL	
directoryIdentifier	bigint(20)	YES		NULL	
resourceId	bigint(20)	YES		NULL	
resourceName	varchar(255)	YES		NULL	
TABLE_NAME
ChangeApplicationAccountOwnerEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
createdAt	datetime	YES		NULL	
observations	varchar(1000)	YES		NULL	
resolvedAt	datetime	YES		NULL	
status	varchar(255)	YES		NULL	
account_id	bigint(20)	YES		NULL	
currentOwner_id	bigint(20)	YES		NULL	
newOnwer_id	bigint(20)	YES		NULL	
resolvedBy_id	bigint(20)	YES		NULL	
TABLE_NAME
ChangeApplicationAccountOwnerEntry_actions
Field	Type	Null	Key	Default	Extra
ChangeApplicationAccountOwnerEntry_id	bigint(20)	NO		NULL	
actions	varchar(255)	YES		NULL	
TABLE_NAME
ChangeApplicationAccountOwnerUser
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
displayName	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
ChangePasswordAccount
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
accountIdentifier	varchar(255)	YES		NULL	
directoryIdentifier	bigint(20)	YES		NULL	
TABLE_NAME
ChangePasswordAccountEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
createdAt	datetime	YES		NULL	
resetPassword	bit(1)	YES		NULL	
resolveNote	varchar(1000)	YES		NULL	
resolvedAt	datetime	YES		NULL	
status	varchar(255)	YES		NULL	
account_id	bigint(20)	YES		NULL	
resolvedBy_id	bigint(20)	YES		NULL	
resource_id	bigint(20)	YES		NULL	
TABLE_NAME
ChangePasswordResource
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
name	varchar(255)	YES		NULL	
TABLE_NAME
ChangePasswordUser
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
displayName	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
CheckinAdminAccountPasswordVault
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
accountId	bigint(20)	YES		NULL	
passwordVaultId	bigint(20)	YES		NULL	
userId	bigint(20)	YES		NULL	
TABLE_NAME
CreatedBy
CreatedBy
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
objectId	bigint(20)	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
Dictionary
Dictionary
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
name	varchar(255)	YES		NULL	
TABLE_NAME
DictionaryWord
DictionaryWord
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
word	varchar(255)	YES		NULL	
dictionary_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
Domain
Domain
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
domainName	varchar(255)	YES		NULL	
TABLE_NAME
EmailQueueEntry
EmailQueueEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
createdAt	datetime	YES		NULL	
fromm	varchar(255)	YES		NULL	
message	longtext	YES		NULL	
subject	varchar(255)	YES		NULL	
too	varchar(255)	YES		NULL	
lastErrorMessage	varchar(1000)	YES		NULL	
processed	datetime	YES		NULL	
retries	int(11)	NO		NULL	
status	varchar(255)	YES		NULL	
serverMailSetup_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
EmailQueueEntry_attachments
EmailQueueEntry_attachments
Field	Type	Null	Key	Default	Extra
EmailQueueEntry_id	bigint(20)	NO	MUL	NULL	
attachments	varchar(255)	YES		NULL	
TABLE_NAME
EmailQueueEntry_cc
EmailQueueEntry_cc
Field	Type	Null	Key	Default	Extra
EmailQueueEntry_id	bigint(20)	NO	MUL	NULL	
cc	varchar(255)	YES		NULL	
TABLE_NAME
Entitlement
Entitlement
Field	Type	Null	Key	Default	Extra
description	varchar(255)	YES		NULL	
name	varchar(255)	YES	MUL	NULL	
tags	varchar(255)	YES		NULL	
id	bigint(20)	NO	PRI	NULL	
resource_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
Entitlement_User
Entitlement_User
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
Entitlement_id	bigint(20)	YES	MUL	NULL	
owners_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
Entry
Entry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
certificatedAt	datetime	YES		NULL	
createdAt	datetime	YES		NULL	
expireAt	datetime	YES		NULL	
modifiedAt	datetime	YES		NULL	
risk	varchar(255)	YES	MUL	NULL	
state	varchar(255)	NO	MUL	NULL	
provisioningStatus	varchar(255)	NO		NULL	
type	varchar(255)	YES	MUL	NULL	
createdBy_id	bigint(20)	YES	MUL	NULL	
managedBy_id	bigint(20)	YES	MUL	NULL	
certifiable	tinyint(1)	YES		1	
visibleToSelfService	tinyint(1)	YES		1	
sodValidatedAt	datetime	YES		NULL	
selfServiceSynchronized	tinyint(1)	YES		0	
TABLE_NAME
EntryAttribute
EntryAttribute
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
defaultValue	varchar(255)	YES		NULL	
defaultt	bit(1)	NO		NULL	
description	varchar(255)	YES		NULL	
displayType	varchar(255)	YES		NULL	
encrypt	bit(1)	NO		NULL	
label	varchar(255)	YES		NULL	
listValueScript	varchar(10000)	YES		NULL	
managedBySystem	bit(1)	NO		NULL	
name	varchar(255)	YES		NULL	
position	int(11)	NO		NULL	
required	bit(1)	NO		NULL	
schemaa	varchar(255)	YES		NULL	
searchable	bit(1)	NO		NULL	
showAtRegistration	bit(1)	NO		NULL	
validationScript	varchar(4000)	YES		NULL	
visible	bit(1)	NO		NULL	
writable	bit(1)	NO		NULL	
category_id	bigint(20)	YES	MUL	NULL	
resource_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
EntryAttributeCategory
EntryAttributeCategory
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
position	int(11)	NO		NULL	
schemaa	varchar(255)	YES		NULL	
resource_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
EntryAttributeValue
EntryAttributeValue
Field	Type	Null	Key	Default	Extra
name	varchar(255)	NO	PRI	NULL	
value	varchar(255)	YES		NULL	
entry_id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
EventSetting
EventSetting
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
enabled	tinyint(1)	YES		0	
name	varchar(255)	YES		NULL	
TABLE_NAME
ExpirationOptions
ExpirationOptions
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
lifeTime	int(11)	YES		NULL	
notifyUserBeforeExpiration	int(11)	YES		NULL	
scaleLifeTime	varchar(255)	YES		NULL	
scaleNotifyUserBeforeExpiration	varchar(255)	YES		NULL	
TABLE_NAME
Groupp
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(500)	YES		NULL	
name	varchar(255)	YES		NULL	
TABLE_NAME
Groupp_InternalPermissionGroup
Field	Type	Null	Key	Default	Extra
groups_id	bigint(20)	NO	PRI	NULL	
internalPermissionGroups_id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
Groupp_User
Field	Type	Null	Key	Default	Extra
Group_id	bigint(20)	NO	PRI	NULL	
users_id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
ImportBatch
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
action	varchar(255)	YES		NULL	
csvHeader	longtext	YES		NULL	
importedAt	datetime	YES		NULL	
justification	varchar(1000)	YES		NULL	
provisioning	tinyint(1)	YES		0	
schemaa	varchar(255)	YES		NULL	
status	varchar(255)	YES		NULL	
importedBy_id	bigint(20)	YES		NULL	
TABLE_NAME
ImportBatchUser
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
displayName	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
ImportEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
errorMsg	longtext	YES		NULL	
lockNumber	bigint(20)	YES		NULL	
payload	longtext	YES		NULL	
status	varchar(255)	YES		NULL	
importBatch_id	bigint(20)	YES		NULL	
TABLE_NAME
InactiveUserAccountRuleConfiguration
InactiveUserAccountRuleConfiguration
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
enabled	tinyint(1)	YES		0	
resourceId	bigint(20)	YES		NULL	
token	varchar(255)	YES		NULL	
url	varchar(255)	YES		NULL	
TABLE_NAME
Inbox
Inbox
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
content	varchar(3000)	YES		NULL	
date	datetime	YES		NULL	
fromSystem	bit(1)	YES		NULL	
status	varchar(255)	YES		NULL	
subject	varchar(255)	YES		NULL	
USERFROM_ID	bigint(20)	YES	MUL	NULL	
USERTO_ID	bigint(20)	YES	MUL	NULL	
TABLE_NAME
InternalPermission
InternalPermission
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
category	varchar(255)	YES		NULL	
description	varchar(255)	YES		NULL	
label	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
TABLE_NAME
InternalPermissionGroup
InternalPermissionGroup
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
category	varchar(255)	YES		NULL	
description	varchar(255)	YES		NULL	
label	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
TABLE_NAME
InternalPermissionGroup_InternalPermission
InternalPermissionGroup_InternalPermission
Field	Type	Null	Key	Default	Extra
internalPermissionGroups_id	bigint(20)	NO	PRI	NULL	
internalPermissions_id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
Job
Job
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
className	varchar(255)	YES		NULL	
description	varchar(255)	YES		NULL	
displayName	varchar(255)	YES		NULL	
parameters	longtext	YES		NULL	
TABLE_NAME
JobExecution
JobExecution
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
details	longtext	YES		NULL	
end	datetime	YES	MUL	NULL	
start	datetime	YES	MUL	NULL	
status	varchar(255)	YES	MUL	NULL	
instance_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
JobInstance
JobInstance
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
activated	bit(1)	YES		NULL	
activatedAt	datetime	YES		NULL	
cronExpression	varchar(255)	YES		NULL	
description	varchar(255)	YES		NULL	
externalGroupId	varchar(255)	YES		NULL	
externalJobDetailId	varchar(255)	YES		NULL	
externalTriggerId	varchar(255)	YES		NULL	
lastErrorExecution	bigint(20)	YES		0	
lastSuccessExecution	bigint(20)	YES		0	
name	varchar(255)	YES		NULL	
params	varchar(3000)	YES		NULL	
timeOflastExecution	bigint(20)	YES		0	
job_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
LogginModuleSettings
LogginModuleSettings
Field	Type	Null	Key	Default	Extra
module	varchar(255)	NO	PRI	NULL	
activate	bit(1)	NO		NULL	
TABLE_NAME
ManagedBy
ManagedBy
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
type	varchar(255)	YES		NULL	
TABLE_NAME
ManagedBy_objectIds
ManagedBy_objectIds
Field	Type	Null	Key	Default	Extra
ManagedBy_id	bigint(20)	NO	MUL	NULL	
objectIds	bigint(20)	YES		NULL	
TABLE_NAME
MembershipEntitlement
MembershipEntitlement
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	
account_id	bigint(20)	YES	MUL	NULL	
entitlement_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
MembershipEntitlementNotificationSettings
MembershipEntitlementNotificationSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
enabled	tinyint(1)	YES		0	
subject	varchar(1000)	YES		NULL	
template	longtext	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
MembershipRole
MembershipRole
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	
role_id	bigint(20)	YES	MUL	NULL	
user_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
MembershipRoleNotificationSettings
MembershipRoleNotificationSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
enabled	tinyint(1)	YES		0	
subject	varchar(1000)	YES		NULL	
template	longtext	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
MfaSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
allowUserConfigGoogle	bit(1)	YES		NULL	
allowUserConfigSms	bit(1)	YES		NULL	
hasGoogleOtp	bit(1)	YES		NULL	
hasSecretQuestions	bit(1)	YES		NULL	
hasSms	bit(1)	YES		NULL	
TABLE_NAME
MicroCertificationExecutionInstance
MicroCertificationExecutionInstance
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
certificationObjectType	varchar(255)	YES		NULL	
date	datetime	YES		NULL	
deadline	datetime	YES		NULL	
description	varchar(255)	YES		NULL	
finalizeDate	datetime	YES		NULL	
name	varchar(255)	YES		NULL	
status	varchar(255)	YES		NULL	
userDisplayName	varchar(255)	YES		NULL	
userId	bigint(20)	YES		NULL	
username	varchar(255)	YES		NULL	
workflow	varchar(255)	YES		NULL	
isAutoRevoke	tinyint(1)	YES		0	
TABLE_NAME
MicroCertificationExecutionInstance_CertificationEntry
MicroCertificationExecutionInstance_CertificationEntry
Field	Type	Null	Key	Default	Extra
MicroCertificationExecutionInstance_id	bigint(20)	NO	MUL	NULL	
certificationEntries_id	bigint(20)	NO	MUL	NULL	
TABLE_NAME
NetworkConfig
NetworkConfig
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
address	varchar(255)	YES		NULL	
mask	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
TABLE_NAME
NotificationSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
category	varchar(255)	YES		NULL	
enabled	tinyint(1)	YES		0	
subject	varchar(1000)	YES		NULL	
template	longtext	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
OAuthAccessToken
OAuthAccessToken
Field	Type	Null	Key	Default	Extra
accessToken	varchar(255)	NO	PRI	NULL	
clientId	varchar(255)	YES		NULL	
createdAt	datetime	YES		NULL	
expirein	datetime	YES		NULL	
grantTypeGenerator	varchar(255)	YES		NULL	
idToken	varchar(255)	YES		NULL	
refreshToken	varchar(255)	YES		NULL	
scope	varchar(255)	YES		NULL	
status	varchar(255)	YES		NULL	
tokenType	varchar(255)	YES		NULL	
principal	varchar(255)	YES		NULL	
TABLE_NAME
OAuthApiClient
Field	Type	Null	Key	Default	Extra
uuid	varchar(255)	NO	PRI	NULL	
accessTokenValidity	bigint(20)	YES		NULL	
autoApprove	bit(1)	YES		NULL	
clientId	varchar(255)	YES		NULL	
clientSecret	varchar(255)	YES		NULL	
description	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
redirectUri	varchar(255)	YES		NULL	
refreshTokenValidity	bigint(20)	YES		NULL	
authPolicy_uuid	varchar(255)	YES	MUL	NULL	
TABLE_NAME
OAuthClient
OAuthClient
Field	Type	Null	Key	Default	Extra
uuid	varchar(255)	NO	PRI	NULL	
accessTokenValidity	bigint(20)	YES		NULL	
autoApprove	bit(1)	YES		NULL	
clientId	varchar(255)	YES		NULL	
clientSecret	varchar(255)	YES		NULL	
description	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
redirectUri	varchar(255)	YES		NULL	
refreshTokenValidity	bigint(20)	YES		NULL	
authPolicy_uuid	varchar(255)	YES	MUL	NULL	
TABLE_NAME
OAuthCode
OAuthCode
Field	Type	Null	Key	Default	Extra
code	varchar(255)	NO	PRI	NULL	
clientId	varchar(255)	YES		NULL	
codeValidity	bigint(20)	YES		NULL	
urlCallback	varchar(255)	YES		NULL	
user_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
OS_CURRENTSTEP
OS_CURRENTSTEP
Field	Type	Null	Key	Default	Extra
ID	bigint(20)	NO	PRI	NULL	auto_increment
ENTRY_ID	bigint(20)	YES	MUL	NULL	
STEP_ID	int(11)	YES		NULL	
ACTION_ID	int(11)	YES		NULL	
OWNER	varchar(35)	YES	MUL	NULL	
START_DATE	datetime	YES		NULL	
FINISH_DATE	datetime	YES		NULL	
DUE_DATE	datetime	YES		NULL	
STATUS	varchar(40)	YES		NULL	
CALLER	varchar(35)	YES	MUL	NULL	
TABLE_NAME
OS_CURRENTSTEP_PREV
Field	Type	Null	Key	Default	Extra
ID	bigint(20)	NO	PRI	NULL	auto_increment
PREVIOUS_ID	bigint(20)	NO	PRI	NULL	
TABLE_NAME
OS_GROUP
Field	Type	Null	Key	Default	Extra
GROUPNAME	varchar(20)	NO	PRI	NULL	
TABLE_NAME
OS_HISTORYSTEP
OS_HISTORYSTEP
Field	Type	Null	Key	Default	Extra
ID	bigint(20)	NO	PRI	NULL	auto_increment
ENTRY_ID	bigint(20)	YES	MUL	NULL	
STEP_ID	int(11)	YES		NULL	
ACTION_ID	int(11)	YES		NULL	
OWNER	varchar(35)	YES	MUL	NULL	
START_DATE	datetime	YES		NULL	
FINISH_DATE	datetime	YES		NULL	
DUE_DATE	datetime	YES		NULL	
STATUS	varchar(40)	YES		NULL	
CALLER	varchar(35)	YES	MUL	NULL	
TABLE_NAME
OS_HISTORYSTEP_PREV
Field	Type	Null	Key	Default	Extra
ID	bigint(20)	NO	PRI	NULL	auto_increment
PREVIOUS_ID	bigint(20)	NO	PRI	NULL	
TABLE_NAME
OS_MEMBERSHIP
Field	Type	Null	Key	Default	Extra
USERNAME	varchar(20)	NO	PRI	NULL	
GROUPNAME	varchar(20)	NO	PRI	NULL	
TABLE_NAME
OS_PROPERTYENTRY
Field	Type	Null	Key	Default	Extra
GLOBAL_KEY	varchar(250)	NO	PRI	NULL	
ITEM_KEY	varchar(250)	NO	PRI	NULL	
ITEM_TYPE	tinyint(4)	YES		NULL	
STRING_VALUE	varchar(255)	YES		NULL	
DATE_VALUE	datetime	YES		NULL	
DATA_VALUE	blob	YES		NULL	
FLOAT_VALUE	float	YES		NULL	
NUMBER_VALUE	decimal(10,0)	YES		NULL	
TABLE_NAME
OS_USER
Field	Type	Null	Key	Default	Extra
USERNAME	varchar(100)	NO	PRI	NULL	
PASSWORDHASH	mediumtext	YES		NULL	
TABLE_NAME
OS_WFENTRY
OS_WFENTRY
Field	Type	Null	Key	Default	Extra
ID	bigint(20)	NO	PRI	NULL	auto_increment
NAME	varchar(60)	YES		NULL	
STATE	int(11)	YES		NULL	
TABLE_NAME
OS_WORKFLOWDEFS
OS_WORKFLOWDEFS
Field	Type	Null	Key	Default	Extra
ID	bigint(20)	NO	PRI	NULL	auto_increment
WF_NAME	varchar(100)	YES	MUL	NULL	
WF_DESCRIPTION	varchar(255)	YES		NULL	
WF_DEFINITION	mediumblob	YES		NULL	
SCRIPT_DEFINITION	blob	YES		NULL	
DOMAINID	bigint(20)	YES		NULL	
TABLE_NAME
OtpTimeBasedConfiguration
OtpTimeBasedConfiguration
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
otherEmail	bit(1)	NO		NULL	
templateId	bigint(20)	YES		NULL	
TABLE_NAME
OtpTimeBasedUserKey
OtpTimeBasedUserKey
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
otpKey	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
Parameter
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
label	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
value	varchar(255)	YES		NULL	
TABLE_NAME
PasswordHistory
PasswordHistory
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
entryDate	datetime	YES		NULL	
password	varchar(255)	YES		NULL	
user_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
PasswordPolicy
PasswordPolicy
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(2000)	YES		NULL	
name	varchar(255)	YES		NULL	
passwordRepeatWindowLength	int(11)	YES		NULL	
rules	varchar(1500)	YES		NULL	
dictionary_id	bigint(20)	YES	MUL	NULL	
expirationOptions_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
PasswordPolicySettings
PasswordPolicySettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
domainPasswordPolicy_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
PasswordVaultEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
canBeShared	bit(1)	NO		NULL	
description	varchar(2000)	YES		NULL	
createdAt	datetime	YES		NULL	
createdBy_id	bigint(20)	YES		NULL	
expireAt	datetime	YES		NULL	
TABLE_NAME
PasswordVaultEntryAttribute
Field	Type	Null	Key	Default	Extra
name	varchar(255)	NO	PRI	NULL	
value	varchar(255)	YES		NULL	
entry_id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
PasswordVaultNotificationSettings
PasswordVaultNotificationSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
enabled	tinyint(1)	YES		0	
subject	varchar(1000)	YES		NULL	
template	longtext	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
PasswordVaultOwner
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
owner_id	bigint(20)	YES	MUL	NULL	
passwordVaultEntry_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
PasswordVaultShare
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
passwordVaultEntry_id	bigint(20)	YES	MUL	NULL	
user_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
PasswordVaultWebScript
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
script	varchar(4000)	YES		NULL	
TABLE_NAME
ProfileSituation
ProfileSituation
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
automatic	bit(1)	NO		NULL	
reconciliationActionBeanName	varchar(255)	YES		NULL	
profile_id	bigint(20)	YES	MUL	NULL	
situation_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
ProvisioningDirectoryEntry
Field	Type	Null	Key	Default	Extra
type	varchar(31)	NO		NULL	
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
displayName	varchar(255)	YES		NULL	
userId	bigint(20)	YES		NULL	
username	varchar(255)	YES		NULL	
accountId	bigint(20)	YES		NULL	
accountIdentifier	varchar(255)	YES		NULL	
entitlementId	bigint(20)	YES		NULL	
entitlementName	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
TABLE_NAME
ProvisioningEntry
ProvisioningEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
date	datetime	YES		NULL	
entryType	varchar(255)	YES		NULL	
lockDate	datetime	YES		NULL	
lockNumber	bigint(20)	YES		NULL	
payload	longtext	YES		NULL	
processDate	datetime	YES		NULL	
provisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
provisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
provisioningType	varchar(255)	YES		NULL	
provisioningTypeObjectId	varchar(255)	YES		NULL	
status	varchar(255)	YES	MUL	NULL	
targetId	bigint(20)	YES		NULL	
targetType	varchar(255)	YES		NULL	
workflowId	bigint(20)	YES		NULL	
beneficiary_id	bigint(20)	YES		NULL	
provisioningInternalEntry_id	bigint(20)	YES		NULL	
resource_id	bigint(20)	YES		NULL	
TABLE_NAME
ProvisioningEntryTransitionState
ProvisioningEntryTransitionState
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
bySystem	bit(1)	YES		NULL	
date	datetime	YES		NULL	
description	longtext	YES		NULL	
detail	longtext	YES		NULL	
sourceState	varchar(255)	YES		NULL	
targetState	varchar(255)	YES		NULL	
provisioningEntry_id	bigint(20)	YES	MUL	NULL	
user_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
ProvisioningNotificationSettings
ProvisioningNotificationSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
enabled	tinyint(1)	YES		0	
managerRoleId	bigint(20)	YES		NULL	
subject	varchar(1000)	YES		NULL	
template	longtext	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
ProvisioningParameters
ProvisioningParameters
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
content	varchar(255)	YES		NULL	
TABLE_NAME
ProvisioningTask
ProvisioningTask
Field	Type	Null	Key	Default	Extra
notProvisionedJustification	varchar(1000)	YES		NULL	
id	bigint(20)	NO	PRI	NULL	
provisioningEntry_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
ProvisioningTaskDetail
ProvisioningTaskDetail
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
approvalDate	datetime	YES		NULL	
creation	datetime	YES		NULL	
outcome	varchar(255)	YES		NULL	
taskId	bigint(20)	YES		NULL	
provisioningEntry_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
QRTZ_BLOB_TRIGGERS
Field	Type	Null	Key	Default	Extra
SCHED_NAME	varchar(120)	NO	PRI	NULL	
TRIGGER_NAME	varchar(200)	NO	PRI	NULL	
TRIGGER_GROUP	varchar(200)	NO	PRI	NULL	
BLOB_DATA	blob	YES		NULL	
TABLE_NAME
QRTZ_CALENDARS
Field	Type	Null	Key	Default	Extra
SCHED_NAME	varchar(120)	NO	PRI	NULL	
CALENDAR_NAME	varchar(200)	NO	PRI	NULL	
CALENDAR	blob	NO		NULL	
TABLE_NAME
QRTZ_CRON_TRIGGERS
Field	Type	Null	Key	Default	Extra
SCHED_NAME	varchar(120)	NO	PRI	NULL	
TRIGGER_NAME	varchar(200)	NO	PRI	NULL	
TRIGGER_GROUP	varchar(200)	NO	PRI	NULL	
CRON_EXPRESSION	varchar(120)	NO		NULL	
TIME_ZONE_ID	varchar(80)	YES		NULL	
TABLE_NAME
QRTZ_FIRED_TRIGGERS
Field	Type	Null	Key	Default	Extra
SCHED_NAME	varchar(120)	NO	PRI	NULL	
ENTRY_ID	varchar(95)	NO	PRI	NULL	
TRIGGER_NAME	varchar(200)	NO		NULL	
TRIGGER_GROUP	varchar(200)	NO		NULL	
INSTANCE_NAME	varchar(200)	NO		NULL	
FIRED_TIME	bigint(13)	NO		NULL	
PRIORITY	int(11)	NO		NULL	
STATE	varchar(16)	NO		NULL	
JOB_NAME	varchar(200)	YES		NULL	
JOB_GROUP	varchar(200)	YES		NULL	
IS_NONCONCURRENT	varchar(1)	YES		NULL	
REQUESTS_RECOVERY	varchar(1)	YES		NULL	
TABLE_NAME
QRTZ_JOB_DETAILS
Field	Type	Null	Key	Default	Extra
SCHED_NAME	varchar(120)	NO	PRI	NULL	
JOB_NAME	varchar(200)	NO	PRI	NULL	
JOB_GROUP	varchar(200)	NO	PRI	NULL	
DESCRIPTION	varchar(250)	YES		NULL	
JOB_CLASS_NAME	varchar(250)	NO		NULL	
IS_DURABLE	varchar(1)	NO		NULL	
IS_NONCONCURRENT	varchar(1)	NO		NULL	
IS_UPDATE_DATA	varchar(1)	NO		NULL	
REQUESTS_RECOVERY	varchar(1)	NO		NULL	
JOB_DATA	blob	YES		NULL	
TABLE_NAME
QRTZ_LOCKS
Field	Type	Null	Key	Default	Extra
SCHED_NAME	varchar(120)	NO	PRI	NULL	
LOCK_NAME	varchar(40)	NO	PRI	NULL	
TABLE_NAME
QRTZ_PAUSED_TRIGGER_GRPS
Field	Type	Null	Key	Default	Extra
SCHED_NAME	varchar(120)	NO	PRI	NULL	
TRIGGER_GROUP	varchar(200)	NO	PRI	NULL	
TABLE_NAME
QRTZ_SCHEDULER_STATE
Field	Type	Null	Key	Default	Extra
SCHED_NAME	varchar(120)	NO	PRI	NULL	
INSTANCE_NAME	varchar(200)	NO	PRI	NULL	
LAST_CHECKIN_TIME	bigint(13)	NO		NULL	
CHECKIN_INTERVAL	bigint(13)	NO		NULL	
TABLE_NAME
QRTZ_SIMPLE_TRIGGERS
Field	Type	Null	Key	Default	Extra
SCHED_NAME	varchar(120)	NO	PRI	NULL	
TRIGGER_NAME	varchar(200)	NO	PRI	NULL	
TRIGGER_GROUP	varchar(200)	NO	PRI	NULL	
REPEAT_COUNT	bigint(7)	NO		NULL	
REPEAT_INTERVAL	bigint(12)	NO		NULL	
TIMES_TRIGGERED	bigint(10)	NO		NULL	
TABLE_NAME
QRTZ_SIMPROP_TRIGGERS
Field	Type	Null	Key	Default	Extra
SCHED_NAME	varchar(120)	NO	PRI	NULL	
TRIGGER_NAME	varchar(200)	NO	PRI	NULL	
TRIGGER_GROUP	varchar(200)	NO	PRI	NULL	
STR_PROP_1	varchar(512)	YES		NULL	
STR_PROP_2	varchar(512)	YES		NULL	
STR_PROP_3	varchar(512)	YES		NULL	
INT_PROP_1	int(11)	YES		NULL	
INT_PROP_2	int(11)	YES		NULL	
LONG_PROP_1	bigint(20)	YES		NULL	
LONG_PROP_2	bigint(20)	YES		NULL	
DEC_PROP_1	decimal(13,4)	YES		NULL	
DEC_PROP_2	decimal(13,4)	YES		NULL	
BOOL_PROP_1	varchar(1)	YES		NULL	
BOOL_PROP_2	varchar(1)	YES		NULL	
TABLE_NAME
QRTZ_TRIGGERS
Field	Type	Null	Key	Default	Extra
SCHED_NAME	varchar(120)	NO	PRI	NULL	
TRIGGER_NAME	varchar(200)	NO	PRI	NULL	
TRIGGER_GROUP	varchar(200)	NO	PRI	NULL	
JOB_NAME	varchar(200)	NO		NULL	
JOB_GROUP	varchar(200)	NO		NULL	
DESCRIPTION	varchar(250)	YES		NULL	
NEXT_FIRE_TIME	bigint(13)	YES		NULL	
PREV_FIRE_TIME	bigint(13)	YES		NULL	
PRIORITY	int(11)	YES		NULL	
TRIGGER_STATE	varchar(16)	NO		NULL	
TRIGGER_TYPE	varchar(8)	NO		NULL	
START_TIME	bigint(13)	NO		NULL	
END_TIME	bigint(13)	YES		NULL	
CALENDAR_NAME	varchar(200)	YES		NULL	
MISFIRE_INSTR	smallint(2)	YES		NULL	
JOB_DATA	blob	YES		NULL	
TABLE_NAME
ReconciliationAction
ReconciliationAction
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
actionName	varchar(255)	YES		NULL	
beanName	varchar(255)	YES		NULL	
TABLE_NAME
ReconciliationAction_entryTypes
ReconciliationAction_entryTypes
Field	Type	Null	Key	Default	Extra
ReconciliationAction_id	bigint(20)	NO	MUL	NULL	
entryTypes	varchar(255)	YES		NULL	
TABLE_NAME
ReconciliationAction_situationNames
ReconciliationAction_situationNames
Field	Type	Null	Key	Default	Extra
ReconciliationAction_id	bigint(20)	NO	MUL	NULL	
situationNames	varchar(255)	YES		NULL	
TABLE_NAME
ReconciliationBatchEntry
Field	Type	Null	Key	Default	Extra
batchId	varchar(255)	NO	PRI	NULL	
amount	bigint(20)	YES		NULL	
finalizedDate	datetime	YES		NULL	
profileId	bigint(20)	YES		NULL	
profileName	varchar(255)	YES		NULL	
startDate	datetime	YES		NULL	
status	varchar(255)	YES		NULL	
TABLE_NAME
ReconciliationDirectoryEntry
Field	Type	Null	Key	Default	Extra
type	varchar(31)	NO		NULL	
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
name	varchar(255)	YES		NULL	
displayName	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
accountIdentifier	varchar(255)	YES		NULL	
account_id	bigint(20)	YES		NULL	
entitlement_id	bigint(20)	YES		NULL	
role_id	bigint(20)	YES		NULL	
user_id	bigint(20)	YES		NULL	
TABLE_NAME
ReconciliationEntry
ReconciliationEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
batchId	varchar(255)	YES	MUL	NULL	
data	longtext	YES		NULL	
date	datetime	YES		NULL	
effectiveDate	datetime	YES	MUL	NULL	
lockDate	datetime	YES		NULL	
lockNumber	bigint(20)	YES		NULL	
ownersType	varchar(255)	YES		NULL	
processDate	datetime	YES		NULL	
processedData	longtext	YES		NULL	
reconciliationActionBeanName	varchar(255)	YES		NULL	
resourceAdapterId	varchar(255)	YES		NULL	
schemaa	varchar(255)	YES		NULL	
status	varchar(255)	YES	MUL	NULL	
profile_id	bigint(20)	YES	MUL	NULL	
reconciliationMatchedInternalEntry_id	bigint(20)	YES		NULL	
resource_id	bigint(20)	YES	MUL	NULL	
situation_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
ReconciliationEntryTransitionState
ReconciliationEntryTransitionState
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
bySystem	bit(1)	YES		NULL	
date	datetime	YES		NULL	
description	longtext	YES		NULL	
detail	longtext	YES		NULL	
sourceState	varchar(255)	YES		NULL	
targetState	varchar(255)	YES		NULL	
reconciliationEntry_id	bigint(20)	YES	MUL	NULL	
user_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
ReconciliationEntry_matchedEntriesIds
ReconciliationEntry_matchedEntriesIds
Field	Type	Null	Key	Default	Extra
ReconciliationEntry_id	bigint(20)	NO	MUL	NULL	
matchedEntriesIds	bigint(20)	YES		NULL	
TABLE_NAME
ReconciliationEntry_matchedOwnersIds
ReconciliationEntry_matchedOwnersIds
Field	Type	Null	Key	Default	Extra
ReconciliationEntry_id	bigint(20)	NO	MUL	NULL	
matchedOwnersIds	bigint(20)	YES		NULL	
TABLE_NAME
ReconciliationNotificationSettings
ReconciliationNotificationSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
enabled	tinyint(1)	YES		0	
managerRoleId	bigint(20)	YES		NULL	
subject	varchar(1000)	YES		NULL	
template	longtext	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
ReconciliationProfile
ReconciliationProfile
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
incremental	tinyint(1)	YES		0	
name	varchar(255)	YES		NULL	
schemaa	varchar(255)	YES		NULL	
additionalMatchRule_id	bigint(20)	YES		NULL	
matchRule_id	bigint(20)	YES		NULL	
ownerRule_id	bigint(20)	YES		NULL	
resource_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
ReconciliationProfile_AttributeMap
ReconciliationProfile_AttributeMap
Field	Type	Null	Key	Default	Extra
ReconciliationProfile_id	bigint(20)	NO	PRI	NULL	
attributeMapping_id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
RemoveSharedAccountMembershipEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
createdAt	datetime	YES		NULL	
removeMembership	bit(1)	YES		NULL	
resolveNote	varchar(1000)	YES		NULL	
resolvedAt	datetime	YES		NULL	
status	varchar(255)	YES		NULL	
account_id	bigint(20)	YES		NULL	
member_id	bigint(20)	YES		NULL	
resolvedBy_id	bigint(20)	YES		NULL	
TABLE_NAME
Resource
Resource
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
certifiable	tinyint(1)	YES		1	
creationDate	date	YES		NULL	
description	varchar(255)	YES		NULL	
logoImageId	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
passwordVaultEnabled	tinyint(1)	YES		0	
provisioningEnabled	bit(1)	NO		NULL	
risk	varchar(255)	NO		NULL	
syncPassword	tinyint(1)	YES		0	
tags	varchar(255)	YES		NULL	
type	varchar(255)	YES		NULL	
uri	varchar(255)	YES		NULL	
visibleToSelfService	tinyint(1)	YES		1	
category_id	bigint(20)	YES	MUL	NULL	
creator_id	bigint(20)	YES	MUL	NULL	
selfServiceSynchronized	tinyint(1)	YES		0	
TABLE_NAME
ResourceAdapter
ResourceAdapter
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
uuid	varchar(255)	YES		NULL	
TABLE_NAME
ResourceAdapter_instances
ResourceAdapter_instances
Field	Type	Null	Key	Default	Extra
ResourceAdapter_id	bigint(20)	NO	MUL	NULL	
instances	varchar(255)	YES		NULL	
TABLE_NAME
ResourceCategory
ResourceCategory
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
TABLE_NAME
ResourceProvisioningProfile
ResourceProvisioningProfile
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
activateAccountProvisioningFailoverWorkflow	varchar(255)	YES		NULL	
activateAccountProvisioningMappingIdentifier	bigint(20)	YES		NULL	
activateAccountProvisioningObject	varchar(255)	YES		NULL	
activateAccountProvisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
activateAccountProvisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
activateAccountProvisioningType	varchar(255)	YES		NULL	
addMemberToEntitlementProvisioningFailoverWorkflow	varchar(255)	YES		NULL	
addMemberToEntitlementProvisioningMappingIdentifier	bigint(20)	YES		NULL	
addMemberToEntitlementProvisioningObject	varchar(255)	YES		NULL	
addMemberToEntitlementProvisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
addMemberToEntitlementProvisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
addMemberToEntitlementProvisioningType	varchar(255)	YES		NULL	
changePasswordProvisioningFailoverWorkflow	varchar(255)	YES		NULL	
changePasswordProvisioningMappingIdentifier	bigint(20)	YES		NULL	
changePasswordProvisioningObject	varchar(255)	YES		NULL	
changePasswordProvisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
changePasswordProvisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
changePasswordProvisioningType	varchar(255)	YES		NULL	
createAccountProvisioningFailoverWorkflow	varchar(255)	YES		NULL	
createAccountProvisioningMappingIdentifier	bigint(20)	YES		NULL	
createAccountProvisioningObject	varchar(255)	YES		NULL	
createAccountProvisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
createAccountProvisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
createAccountProvisioningType	varchar(255)	YES		NULL	
createEntitlementProvisioningFailoverWorkflow	varchar(255)	YES		NULL	
createEntitlementProvisioningMappingIdentifier	bigint(20)	YES		NULL	
createEntitlementProvisioningObject	varchar(255)	YES		NULL	
createEntitlementProvisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
createEntitlementProvisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
createEntitlementProvisioningType	varchar(255)	YES		NULL	
grantEntitlementProvisioningFailoverWorkflow	varchar(255)	YES		NULL	
grantEntitlementProvisioningMappingIdentifier	bigint(20)	YES		NULL	
grantEntitlementProvisioningMappingIdentifier2	bigint(20)	YES		NULL	
grantEntitlementProvisioningObject	varchar(255)	YES		NULL	
grantEntitlementProvisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
grantEntitlementProvisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
grantEntitlementProvisioningType	varchar(255)	YES		NULL	
inactivateAccountProvisioningFailoverWorkflow	varchar(255)	YES		NULL	
inactivateAccountProvisioningMappingIdentifier	bigint(20)	YES		NULL	
inactivateAccountProvisioningObject	varchar(255)	YES		NULL	
inactivateAccountProvisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
inactivateAccountProvisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
inactivateAccountProvisioningType	varchar(255)	YES		NULL	
removeEntitlementProvisioningFailoverWorkflow	varchar(255)	YES		NULL	
removeEntitlementProvisioningMappingIdentifier	bigint(20)	YES		NULL	
removeEntitlementProvisioningObject	varchar(255)	YES		NULL	
removeEntitlementProvisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
removeEntitlementProvisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
removeEntitlementProvisioningType	varchar(255)	YES		NULL	
removeMemberOfEntitlementProvisioningFailoverWorkflow	varchar(255)	YES		NULL	
removeMemberOfEntitlementProvisioningMappingIdentifier	bigint(20)	YES		NULL	
removeMemberOfEntitlementProvisioningObject	varchar(255)	YES		NULL	
removeMemberOfEntitlementProvisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
removeMemberOfEntitlementProvisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
removeMemberOfEntitlementProvisioningType	varchar(255)	YES		NULL	
resourceId	bigint(20)	YES		NULL	
revokeAccountProvisioningFailoverWorkflow	varchar(255)	YES		NULL	
revokeAccountProvisioningMappingIdentifier	bigint(20)	YES		NULL	
revokeAccountProvisioningObject	varchar(255)	YES		NULL	
revokeAccountProvisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
revokeAccountProvisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
revokeAccountProvisioningType	varchar(255)	YES		NULL	
revokeEntitlementProvisioningFailoverWorkflow	varchar(255)	YES		NULL	
revokeEntitlementProvisioningMappingIdentifier	bigint(20)	YES		NULL	
revokeEntitlementProvisioningMappingIdentifier2	bigint(20)	YES		NULL	
revokeEntitlementProvisioningObject	varchar(255)	YES		NULL	
revokeEntitlementProvisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
revokeEntitlementProvisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
revokeEntitlementProvisioningType	varchar(255)	YES		NULL	
updateAccountProvisioningFailoverWorkflow	varchar(255)	YES		NULL	
updateAccountProvisioningMappingIdentifier	bigint(20)	YES		NULL	
updateAccountProvisioningObject	varchar(255)	YES		NULL	
updateAccountProvisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
updateAccountProvisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
updateAccountProvisioningType	varchar(255)	YES		NULL	
updateEntitlementProvisioningFailoverWorkflow	varchar(255)	YES		NULL	
updateEntitlementProvisioningMappingIdentifier	bigint(20)	YES		NULL	
updateEntitlementProvisioningObject	varchar(255)	YES		NULL	
updateEntitlementProvisioningTaskDefinitionIdentifier	bigint(20)	YES		NULL	
updateEntitlementProvisioningTaskQueueIdentifier	bigint(20)	YES		NULL	
updateEntitlementProvisioningType	varchar(255)	YES		NULL	
TABLE_NAME
Resource_User
Resource_User
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
managedResources_id	bigint(20)	YES	MUL	NULL	
owners_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
Rightt
Rightt
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
resource_id	bigint(20)	YES	MUL	NULL	
rightsCertifiedAt	datetime	YES		NULL	
role_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
Rightt_Entitlement
Rightt_Entitlement
Field	Type	Null	Key	Default	Extra
Right_id	bigint(20)	NO	PRI	NULL	
entitlements_id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
Role
Role
Field	Type	Null	Key	Default	Extra
description	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
tags	varchar(255)	YES		NULL	
id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
RoleRightApprovalPolicy
RoleRightApprovalPolicy
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
autoApproved	bit(1)	YES		NULL	
description	varchar(255)	YES		NULL	
eligibility	varchar(3500)	YES		NULL	
enabled	bit(1)	YES		NULL	
name	varchar(255)	YES		NULL	
operator	varchar(255)	YES		NULL	
position	int(11)	YES		NULL	
workflow	varchar(255)	YES		NULL	
TABLE_NAME
RoleRightApprovalTask
RoleRightApprovalTask
Field	Type	Null	Key	Default	Extra
type	varchar(255)	YES		NULL	
id	bigint(20)	NO	PRI	NULL	
roleRightEntry_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
RoleRightApprovalTaskDetail
RoleRightApprovalTaskDetail
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
approvalDate	datetime	YES		NULL	
creation	datetime	YES		NULL	
levelName	varchar(255)	YES		NULL	
outcome	varchar(255)	YES		NULL	
roleRightEntry_id	bigint(20)	YES	MUL	NULL	
task_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
RoleRightDirectoryEntry
Field	Type	Null	Key	Default	Extra
type	varchar(31)	NO		NULL	
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
name	varchar(255)	YES		NULL	
displayName	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
RoleRightEntry
RoleRightEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
action	varchar(255)	YES		NULL	
approvalWorkflowId	bigint(20)	YES		NULL	
creationDate	datetime	YES		NULL	
executionDate	datetime	YES		NULL	
justification	varchar(1000)	YES		NULL	
lockDate	datetime	YES		NULL	
lockNumber	bigint(20)	YES		NULL	
roleRightPolicyId	bigint(20)	YES		NULL	
status	varchar(255)	YES		NULL	
requester_id	bigint(20)	YES		NULL	
role_id	bigint(20)	YES		NULL	
TABLE_NAME
RoleRightEntryItem
RoleRightEntryItem
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
approvalStatus	varchar(255)	YES		NULL	
entryDescription	varchar(255)	YES		NULL	
entryId	bigint(20)	YES		NULL	
entryName	varchar(255)	YES		NULL	
entryType	varchar(255)	YES		NULL	
TABLE_NAME
RoleRightEntry_RoleRightEntryItem
RoleRightEntry_RoleRightEntryItem
Field	Type	Null	Key	Default	Extra
RoleRightEntry_id	bigint(20)	NO	MUL	NULL	
items_id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
RoleRightRevokeDirectoryEntry
Field	Type	Null	Key	Default	Extra
type	varchar(31)	NO		NULL	
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
displayName	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
accountId	bigint(20)	YES		NULL	
accountIdentifier	varchar(255)	YES		NULL	
entitlementId	bigint(20)	YES		NULL	
entitlementName	varchar(255)	YES		NULL	
resourceId	bigint(20)	YES		NULL	
resourceName	varchar(255)	YES		NULL	
TABLE_NAME
RoleRightRevokeEntry
RoleRightRevokeEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
createdAt	datetime	YES		NULL	
finalizedAt	datetime	YES		NULL	
lockDate	datetime	YES		NULL	
lockNumber	bigint(20)	YES		NULL	
resolution	varchar(255)	YES		NULL	
status	varchar(255)	YES		NULL	
targetId	varchar(255)	YES		NULL	
targetType	varchar(255)	YES		NULL	
beneficiary_id	bigint(20)	YES		NULL	
role_id	bigint(20)	YES		NULL	
roleRightRevokeInternalEntry_id	bigint(20)	YES		NULL	
TABLE_NAME
RoleRightRevokeNotificationSettings
RoleRightRevokeNotificationSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
enabled	tinyint(1)	YES		0	
subject	varchar(1000)	YES		NULL	
template	longtext	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
Role_User
Role_User
Field	Type	Null	Key	Default	Extra
Role_id	bigint(20)	NO	MUL	NULL	
owners_id	bigint(20)	NO	MUL	NULL	
TABLE_NAME
SAMLSession
Field	Type	Null	Key	Default	Extra
id	varchar(255)	NO	PRI	NULL	
issuer	varchar(255)	YES		NULL	
samlSessionIndex	varchar(255)	YES		NULL	
sessionIndex	varchar(255)	YES		NULL	
TABLE_NAME
SamlAuthenticationClient
SamlAuthenticationClient
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
assertionConsumerServiceURL	varchar(255)	YES		NULL	
assertionEncryption	bit(1)	YES		NULL	
assertionEncryptionValue	varchar(255)	YES		NULL	
attributesProfile	bit(1)	YES		NULL	
issuer	varchar(255)	YES		NULL	
responseSigning	bit(1)	YES		NULL	
signatureValidation	bit(1)	YES		NULL	
singleLogout	bit(1)	YES		NULL	
singleLogoutURL	varchar(255)	YES		NULL	
authPolicy_uuid	varchar(255)	YES	MUL	NULL	
mappingIdentifier	bigint(20)	YES		NULL	
TABLE_NAME
SamlAuthenticationClient_attributes
SamlAuthenticationClient_attributes
Field	Type	Null	Key	Default	Extra
SamlAuthenticationClient_id	bigint(20)	NO	PRI	NULL	
attributes	varchar(500)	YES		NULL	
attributes_KEY	varchar(255)	NO	PRI	NULL	
TABLE_NAME
SecretQuestion
SecretQuestion
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
answer	longtext	YES		NULL	
beanshell	tinyint(1)	YES		0	
question	varchar(500)	YES		NULL	
TABLE_NAME
SecureChannelOtpConfiguration
SecureChannelOtpConfiguration
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
tokenLength	int(11)	NO		NULL	
ttl	int(11)	NO		NULL	
TABLE_NAME
SecureChannelToken
SecureChannelToken
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
channel	varchar(255)	YES		NULL	
createdAt	datetime	YES		NULL	
processed	datetime	YES		NULL	
status	varchar(255)	YES		NULL	
timeToLive	datetime	YES		NULL	
token	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
SelectorExecutionInstance
SelectorExecutionInstance
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
date	datetime	YES		NULL	
deadline	datetime	YES		NULL	
finalizeDate	datetime	YES		NULL	
status	varchar(255)	YES		NULL	
userDisplayName	varchar(255)	YES		NULL	
userId	bigint(20)	YES		NULL	
username	varchar(255)	YES		NULL	
selector_id	bigint(20)	YES	MUL	NULL	
isAutoRevoke	tinyint(1)	YES		0	
TABLE_NAME
SelectorExecutionInstance_CertificationEntry
SelectorExecutionInstance_CertificationEntry
Field	Type	Null	Key	Default	Extra
SelectorExecutionInstance_id	bigint(20)	NO	MUL	NULL	
certificationEntries_id	bigint(20)	NO	MUL	NULL	
TABLE_NAME
SelfServiceCart
SelfServiceCart
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
userId	varchar(255)	YES	UNI	NULL	
TABLE_NAME
SelfServiceCartInstanceItem
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
accountAlreadyExist	bit(1)	YES		NULL	
adminAccountLocked	bit(1)	YES		NULL	
alreadyRequestInProgress	bit(1)	YES		NULL	
membershipEntitlementAlreadyExist	bit(1)	YES		NULL	
membershipRoleAlreadyExist	bit(1)	YES		NULL	
payload	varchar(4000)	YES		NULL	
relatedAccountNotFound	bit(1)	YES		NULL	
relatedResourceNotFoundId	bigint(20)	YES		NULL	
relatedResourceNotFoundType	varchar(255)	YES		NULL	
relatedResourceNotFoundName	varchar(255)	YES		NULL	
schemaValidated	bit(1)	YES		NULL	
userId	varchar(255)	YES		NULL	
cartItem_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
SelfServiceCartItem
SelfServiceCartItem
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
assignType	varchar(255)	YES		NULL	
targetId	varchar(255)	YES		NULL	
targetType	varchar(255)	YES		NULL	
cart_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
ServerMailSetup
ServerMailSetup
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
needAuthentication	varchar(255)	YES		NULL	
needTLS	bit(1)	YES		NULL	
smtpHost	varchar(255)	YES		NULL	
smtpPassword	varchar(255)	YES		NULL	
smtpPort	varchar(255)	YES		NULL	
smtpUser	varchar(255)	YES		NULL	
TABLE_NAME
SharedAccountAccount
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
accountIdentifier	varchar(255)	YES		NULL	
directoryIdentifier	bigint(20)	YES		NULL	
resourceId	bigint(20)	YES		NULL	
resourceName	varchar(255)	YES		NULL	
TABLE_NAME
SharedAccountMembership
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
account_id	bigint(20)	YES		NULL	
user_id	bigint(20)	YES		NULL	
TABLE_NAME
SharedAccountUser
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
displayName	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
SituationDef
SituationDef
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
implementationClassName	varchar(255)	YES		NULL	
label	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
TABLE_NAME
SituationDef_entryTypes
SituationDef_entryTypes
Field	Type	Null	Key	Default	Extra
SituationDef_id	bigint(20)	NO	MUL	NULL	
entryTypes	varchar(255)	YES		NULL	
TABLE_NAME
SodApprovalTask
SodApprovalTask
Field	Type	Null	Key	Default	Extra
entryId	bigint(20)	YES		NULL	
entryType	varchar(255)	YES		NULL	
justification	varchar(1000)	YES		NULL	
id	bigint(20)	NO	PRI	NULL	
sodEntry_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
SodApprovalTaskDetail
SodApprovalTaskDetail
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
approvalDate	datetime	YES		NULL	
creation	datetime	YES		NULL	
levelName	varchar(255)	YES		NULL	
outcome	varchar(255)	YES		NULL	
sodEntry_id	bigint(20)	YES	MUL	NULL	
task_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
SodDirectoryEntry
Field	Type	Null	Key	Default	Extra
type	varchar(31)	NO		NULL	
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
displayName	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
accountId	bigint(20)	YES		NULL	
accountIdentifier	varchar(255)	YES		NULL	
entitlementId	bigint(20)	YES		NULL	
entitlementName	varchar(255)	YES		NULL	
resourceId	bigint(20)	YES		NULL	
resourceName	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
roleId	bigint(20)	YES		NULL	
roleName	varchar(255)	YES		NULL	
userId	bigint(20)	YES		NULL	
TABLE_NAME
SodEntry
SodEntry
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
createdAt	datetime	YES		NULL	
entry_id	bigint(20)	YES		NULL	
entryType	varchar(255)	YES		NULL	
lockDate	datetime	YES		NULL	
lockNumber	bigint(20)	YES		NULL	
processedAt	datetime	YES		NULL	
result	varchar(255)	YES		NULL	
sodPolicyId	bigint(20)	YES		NULL	
status	varchar(255)	YES		NULL	
workflowId	bigint(20)	YES		NULL	
beneficiary_id	bigint(20)	YES		NULL	
sodInternalEntry_id	bigint(20)	YES		NULL	
TABLE_NAME
SodEntryTransitionState
SodEntryTransitionState
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
bySystem	bit(1)	YES		NULL	
date	datetime	YES		NULL	
description	varchar(255)	YES		NULL	
detail	longtext	YES		NULL	
sourceState	varchar(255)	YES		NULL	
targetState	varchar(255)	YES		NULL	
entryInfo_id	bigint(20)	YES	MUL	NULL	
user_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
SodNotificationSettings
SodNotificationSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
enabled	tinyint(1)	YES		0	
subject	varchar(1000)	YES		NULL	
template	longtext	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
SodPolicy
SodPolicy
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
dutyId	bigint(20)	YES		NULL	
dutyType	varchar(255)	YES		NULL	
enabled	tinyint(1)	YES		1	
modifiedAt	datetime	YES		NULL	
name	varchar(255)	YES		NULL	
position	int(11)	NO		NULL	
rules	longtext	YES		NULL	
whenSodMatchOperation	varchar(255)	YES		NULL	
workflow	varchar(255)	YES		NULL	
TABLE_NAME
SodSettings
SodSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
combinationAlgorithm	varchar(255)	YES		NULL	
ifNoneApplicableAction	varchar(255)	YES		NULL	
TABLE_NAME
SodTaskDetail
SodTaskDetail
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
approvalDate	datetime	YES		NULL	
creation	datetime	YES		NULL	
levelName	varchar(255)	YES		NULL	
outcome	varchar(255)	YES		NULL	
request_id	bigint(20)	YES	MUL	NULL	
task_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
Task
Task
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
actionId	int(11)	YES		NULL	
category	varchar(255)	YES		NULL	
createdBy	varchar(255)	YES		NULL	
createdByObjectId	varchar(255)	YES		NULL	
createdDate	datetime	YES		NULL	
deadline	datetime	YES		NULL	
notificationCount	int(11)	YES		NULL	
priority	varchar(255)	YES		NULL	
resolvedDate	datetime	YES		NULL	
result	varchar(255)	YES		NULL	
status	varchar(255)	YES		NULL	
workflowId	bigint(20)	YES		NULL	
currentQueue_id	bigint(20)	YES		NULL	
definition_id	bigint(20)	YES	MUL	NULL	
recipient_id	bigint(20)	YES	MUL	NULL	
requester_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
TaskAssignHistory
TaskAssignHistory
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
assign_date	datetime	YES		NULL	
from_id	bigint(20)	YES	MUL	NULL	
task_id	bigint(20)	YES	MUL	NULL	
to_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
TaskComment
TaskComment
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
comment	varchar(1500)	YES		NULL	
date	datetime	YES		NULL	
task_id	bigint(20)	YES	MUL	NULL	
user_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
TaskDefinition
TaskDefinition
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(255)	YES		NULL	
name	varchar(255)	YES		NULL	
notificationTemplateId	bigint(20)	YES		NULL	
percentageForNotifyUser	int(11)	NO		NULL	
priority	varchar(255)	YES		NULL	
sla	int(11)	YES		NULL	
unit	varchar(255)	YES		NULL	
escalationDefinition_id	bigint(20)	YES		NULL	
TABLE_NAME
TaskEscalation
TaskEscalation
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
amountOfTime	int(11)	YES		NULL	
unit	varchar(255)	YES		NULL	
escalationWhen	varchar(255)	YES		NULL	
userFrom_id	bigint(20)	YES	MUL	NULL	
userTo_id	bigint(20)	YES	MUL	NULL	
TABLE_NAME
TaskEscalationDefinition
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
token	varchar(255)	YES		NULL	
url	varchar(255)	YES		NULL	
TABLE_NAME
TaskQueue
TaskQueue
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
description	varchar(500)	YES		NULL	
name	varchar(255)	YES		NULL	
TABLE_NAME
TaskQueueAssignHistory
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
assign_date	datetime	YES		NULL	
from_id	bigint(20)	YES		NULL	
task_id	bigint(20)	YES		NULL	
to_id	bigint(20)	YES		NULL	
TABLE_NAME
TaskQueue_Groupp
Field	Type	Null	Key	Default	Extra
TaskQueue_id	bigint(20)	NO	PRI	NULL	
groups_id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
TaskQueue_Task
TaskQueue_Task
Field	Type	Null	Key	Default	Extra
TaskQueue_id	bigint(20)	NO	PRI	NULL	
tasks_id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
User
User
Field	Type	Null	Key	Default	Extra
birthDate	date	YES		NULL	
displayName	varchar(255)	YES		NULL	
email	varchar(255)	YES		NULL	
firstName	varchar(255)	YES		NULL	
lastAccess	datetime	YES		NULL	
lastAssignmentExecutionDate	datetime	YES		NULL	
lastInactivatedAccountsVerifierExecutionDate	datetime	YES		NULL	
lastRoleRightsVerifierExecutionDate	datetime	YES		NULL	
lastName	varchar(255)	YES		NULL	
lastPasswordModificationDate	datetime	YES		NULL	
locked	tinyint(1)	YES		0	
middleName	varchar(255)	YES		NULL	
mobilePhone	varchar(255)	YES		NULL	
needChangePassword	bit(1)	YES		NULL	
password	varchar(255)	YES		NULL	
personalEmail	varchar(255)	YES		NULL	
photoImageId	varchar(255)	YES		NULL	
primaryPhone	varchar(255)	YES		NULL	
thumbImageId	varchar(255)	YES		NULL	
username	varchar(255)	YES	UNI	NULL	
id	bigint(20)	NO	PRI	NULL	
TABLE_NAME
UserAccessDetail
UserAccessDetail
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
latitude	bigint(20)	YES		NULL	
longitude	bigint(20)	YES		NULL	
time	datetime	YES		NULL	
userDevice	varchar(255)	YES		NULL	
userIdentifier	bigint(20)	YES		NULL	
TABLE_NAME
UserDevice
UserDevice
Field	Type	Null	Key	Default	Extra
fingerPrint	varchar(255)	NO	PRI	NULL	
browserName	varchar(255)	YES		NULL	
browserversion	varchar(255)	YES		NULL	
engineName	varchar(255)	YES		NULL	
manufacturer	varchar(255)	YES		NULL	
operatingSystemName	varchar(255)	YES		NULL	
type	varchar(255)	YES		NULL	
userAgentType	varchar(255)	YES		NULL	
userIdentifier	bigint(20)	YES		NULL	
TABLE_NAME
UserNotificationSettings
UserNotificationSettings
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
enabled	tinyint(1)	YES		0	
subject	varchar(1000)	YES		NULL	
template	longtext	YES		NULL	
type	varchar(255)	YES		NULL	
TABLE_NAME
UserTask
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
directoryIdentifier	bigint(20)	YES		NULL	
displayName	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
UsernamePasswordCredentialsVaultItem
UsernamePasswordCredentialsVaultItem
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
createdAt	datetime	YES		NULL	
description	varchar(255)	YES		NULL	
imageId	varchar(255)	YES		NULL	
modifiedAt	datetime	YES		NULL	
name	varchar(255)	YES		NULL	
ownerId	bigint(20)	YES	MUL	NULL	
password	varchar(255)	YES		NULL	
url	varchar(255)	YES		NULL	
username	varchar(255)	YES		NULL	
TABLE_NAME
UsernamePolicy
UsernamePolicy
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
action	varchar(255)	YES		NULL	
description	varchar(255)	YES		NULL	
enabled	bit(1)	YES		b'1'	
name	varchar(255)	YES		NULL	
position	int(11)	NO		NULL	
TABLE_NAME
VaultEntryPermission
VaultEntryPermission
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
credentialsVaultItemId	bigint(20)	YES		NULL	
modify	tinyint(1)	YES		0	
readd	tinyint(1)	YES		0	
share	tinyint(1)	YES		0	
userId	bigint(20)	YES		NULL	
TABLE_NAME
WebHook
WebHook
Field	Type	Null	Key	Default	Extra
id	bigint(20)	NO	PRI	NULL	auto_increment
objectId	varchar(255)	YES		NULL	
objectType	varchar(255)	YES		NULL	
token	varchar(1000)	YES		NULL	
type	varchar(255)	YES		NULL	
url	varchar(255)	YES		NULL	
