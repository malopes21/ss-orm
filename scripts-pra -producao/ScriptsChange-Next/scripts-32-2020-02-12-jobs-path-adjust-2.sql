
-- Remover todos os jobs de analytics do banco

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%.analytics.%'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%.analytics.%'
);

delete from Job	
where className like '%.analytics.%';


-- Directory

-- DirectoryElasticsearchIndexationJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.DirectoryElasticsearchIndexationJob'
where className like '%DirectoryElasticsearchIndexationJob';

-- RemoveAccountsJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.RemoveAccountsJob'
where className like '%RemoveAccountsJob';

-- RemoveEntitlementsJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.RemoveEntitlementsJob'
where className like '%RemoveEntitlementsJob';

-- RemoveMembershipEntitlementsJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.RemoveMembershipEntitlementsJob'
where className like '%RemoveMembershipEntitlementsJob';

-- RemoveMembershipRolesJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.RemoveMembershipRolesJob'
where className like '%RemoveMembershipRolesJob';

-- RemoveRolesJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.RemoveRolesJob'
where className like '%RemoveRolesJob';

-- RemoveUserJob - com.blazon.directory.jobs

update Job 
set className = 'com.blazon.directory.jobs.RemoveUserJob'
where className like '%RemoveUserJob';


-- Provisioning

-- ProvisioningDispatchFailoverWorkflowExecutionJob - com.blazon.accessmanagement.provisioning.jobs

update Job 
set className = 'com.blazon.accessmanagement.provisioning.jobs.ProvisioningDispatchFailoverWorkflowExecutionJob'
where className like '%ProvisioningDispatchFailoverWorkflowExecutionJob';

-- ProvisioningDispatchToWaitingResourceAdapterPullingJob - com.blazon.accessmanagement.provisioning.jobs

update Job 
set className = 'com.blazon.accessmanagement.provisioning.jobs.ProvisioningDispatchToWaitingResourceAdapterPullingJob'
where className like '%ProvisioningDispatchToWaitingResourceAdapterPullingJob';

-- ProvisioningWaitingAssignToTaskQueueExecutionJob - com.blazon.accessmanagement.provisioning.jobs

update Job 
set className = 'com.blazon.accessmanagement.provisioning.jobs.ProvisioningWaitingAssignToTaskQueueExecutionJob'
where className like '%ProvisioningWaitingAssignToTaskQueueExecutionJob';

-- ProvisioningWaitingWorkflowExecutionJob - com.blazon.accessmanagement.provisioning.jobs

update Job 
set className = 'com.blazon.accessmanagement.provisioning.jobs.ProvisioningWaitingWorkflowExecutionJob'
where className like '%ProvisioningWaitingWorkflowExecutionJob';


-- Requests

-- BlazonRequestNewVerifierJob - com.blazon.accessmanagement.requests.jobs

update Job 
set className = 'com.blazon.accessmanagement.requests.jobs.BlazonRequestNewVerifierJob'
where className like '%BlazonRequestNewVerifierJob';

-- BlazonRequestWaitingDependenciesVerifierJob - com.blazon.accessmanagement.requests.jobs

update Job 
set className = 'com.blazon.accessmanagement.requests.jobs.BlazonRequestWaitingDependenciesVerifierJob'
where className like '%BlazonRequestWaitingDependenciesVerifierJob';

-- BlazonRequestWaitingResolvingEntryDependenciesFunctionJob - com.blazon.accessmanagement.requests.jobs

update Job 
set className = 'com.blazon.accessmanagement.requests.jobs.BlazonRequestWaitingResolvingEntryDependenciesFunctionJob'
where className like '%BlazonRequestWaitingResolvingEntryDependenciesFunctionJob';

-- BllazonMultipleRequestFinalizeInExecutionJob - com.blazon.accessmanagement.requests.jobs

update Job 
set className = 'com.blazon.accessmanagement.requests.jobs.BlazonMultipleRequestFinalizeInExecutionJob'
where className like '%BllazonMultipleRequestFinalizeInExecutionJob';

-- BllazonRequestExecutionQueueJob - com.blazon.accessmanagement.requests.jobs

update Job 
set className = 'com.blazon.accessmanagement.requests.jobs.BlazonRequestExecutionQueueJob'
where className like '%BllazonRequestExecutionQueueJob';

-- BllazonRequestQueueJob - com.blazon.accessmanagement.requests.jobs

update Job 
set className = 'com.blazon.accessmanagement.requests.jobs.BlazonRequestQueueJob'
where className like '%BllazonRequestQueueJob';


-- Accounts

-- RevokeExpiredTemporaryAccountsJob - com.blazon.accessmanagement.account.temporaryaccounts.jobs

update Job 
set className = 'com.blazon.accessmanagement.account.temporaryaccounts.jobs.RevokeExpiredTemporaryAccountsJob'
where className like '%RevokeExpiredTemporaryAccountsJob';

-- FindAccountReadyToRemove - com.blazon.accessmanagement.account.jobs

update Job 
set className = 'com.blazon.accessmanagement.account.jobs.FindAccountReadyToRemove'
where className like '%FindAccountReadyToRemove';


-- Entitlements

-- FindEntitlementReadyToRemove - com.blazon.accessmanagement.entitlement.jobs

update Job 
set className = 'com.blazon.accessmanagement.entitlement.jobs.FindEntitlementReadyToRemove'
where className like '%FindEntitlementReadyToRemove';

-- FindMembershipEntitlementReadyToRemove - com.blazon.accessmanagement.entitlement.jobs

update Job 
set className = 'com.blazon.accessmanagement.entitlement.jobs.FindMembershipEntitlementReadyToRemove'
where className like '%FindMembershipEntitlementReadyToRemove';


-- Certification

-- CertificationCampaignFinalizeJob - com.blazon.governance.certification.campaign.jobs

update Job 
set className = 'com.blazon.governance.certification.campaign.jobs.CertificationCampaignFinalizeJob'
where className like '%CertificationCampaignFinalizeJob';

-- CertificationRecurrentCampaignStartJob - com.blazon.governance.certification.campaign.jobs

update Job 
set className = 'com.blazon.governance.certification.campaign.jobs.CertificationRecurrentCampaignStartJob'
where className like '%CertificationRecurrentCampaignStartJob';

-- CertificationRunsOnceOnlyCampaignStartJob - com.blazon.governance.certification.campaign.jobs

update Job 
set className = 'com.blazon.governance.certification.campaign.jobs.CertificationRunsOnceOnlyCampaignStartJob'
where className like '%CertificationRunsOnceOnlyCampaignStartJob';

-- RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob - com.blazon.governance.certification.campaign.jobs

update Job 
set className = 'com.blazon.governance.certification.campaign.jobs.RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob'
where className like '%RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob';

-- MicroCertificationExecutionInstanceFinalizeJob - com.blazon.governance.certification.micro.jobs

update Job 
set className = 'com.blazon.governance.certification.micro.jobs.MicroCertificationExecutionInstanceFinalizeJob'
where className like '%MicroCertificationExecutionInstanceFinalizeJob';

-- RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob - com.blazon.governance.certification.micro.jobs

update Job 
set className = 'com.blazon.governance.certification.micro.jobs.RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob'
where className like '%RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob';

-- CertificationExecutorPolicyJob - com.blazon.governance.certification.policy.jobs

update Job 
set className = 'com.blazon.governance.certification.policy.jobs.CertificationExecutorPolicyJob'
where className like '%CertificationExecutorPolicyJob';

-- CertificationQueueJob - com.blazon.governance.certification.policy.jobs

update Job 
set className = 'com.blazon.governance.certification.policy.jobs.CertificationQueueJob'
where className like '%CertificationQueueJob';

-- CertificationRevokeExecutionQueueJob - com.blazon.governance.certification.policy.jobs

update Job 
set className = 'com.blazon.governance.certification.policy.jobs.CertificationRevokeExecutionQueueJob'
where className like '%CertificationRevokeExecutionQueueJob';

-- CertificationSelectorExecutionInstanceFinalizeJob - com.blazon.governance.certification.selector.instance.jobs

update Job 
set className = 'com.blazon.governance.certification.selector.instance.jobs.CertificationSelectorExecutionInstanceFinalizeJob'
where className like '%CertificationSelectorExecutionInstanceFinalizeJob';

-- RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob - com.blazon.governance.certification.selector.instance.jobs

update Job 
set className = 'com.blazon.governance.certification.selector.instance.jobs.RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob'
where className like '%RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob';


-- Reconciliation

-- ReconciliationBatchEntryCertifierJob - com.blazon.governance.reconciliation.jobs

update Job 
set className = 'com.blazon.governance.reconciliation.jobs.ReconciliationBatchEntryCertifierJob'
where className like '%ReconciliationBatchEntryCertifierJob';

-- ReconciliationStep01_NotProcessedToAssociatingRulesJob - com.blazon.governance.reconciliation.jobs

update Job 
set className = 'com.blazon.governance.reconciliation.jobs.ReconciliationStep01_NotProcessedToAssociatingRulesJob'
where className like '%ReconciliationStep01_NotProcessedToAssociatingRulesJob';

-- ReconciliationStep02_RulesAssociatedToDiscoveringSituationJob - com.blazon.governance.reconciliation.jobs

update Job 
set className = 'com.blazon.governance.reconciliation.jobs.ReconciliationStep02_RulesAssociatedToDiscoveringSituationJob'
where className like '%ReconciliationStep02_RulesAssociatedToDiscoveringSituationJob';

-- ReconciliationStep03_SituationDiscoveredToAttributeMappingJob - com.blazon.governance.reconciliation.jobs

update Job 
set className = 'com.blazon.governance.reconciliation.jobs.ReconciliationStep03_SituationDiscoveredToAttributeMappingJob'
where className like '%ReconciliationStep03_SituationDiscoveredToAttributeMappingJob';

-- ReconciliationStep04_MappedAttributesToInvokingActionJob - com.blazon.governance.reconciliation.jobs

update Job 
set className = 'com.blazon.governance.reconciliation.jobs.ReconciliationStep04_MappedAttributesToInvokingActionJob'
where className like '%ReconciliationStep04_MappedAttributesToInvokingActionJob';

-- ReconciliationStepReadyToInvokeActionJob - com.blazon.governance.reconciliation.jobs

update Job 
set className = 'com.blazon.governance.reconciliation.jobs.ReconciliationStepReadyToInvokeActionJob'
where className like '%ReconciliationStepReadyToInvokeActionJob';


-- SoD

-- SodEntryInfoProcessorJob - com.blazon.governance.sod.jobs

update Job 
set className = 'com.blazon.governance.sod.jobs.SodEntryInfoProcessorJob'
where className like '%SodEntryInfoProcessorJob';

-- SodEntryToExecutionJob - com.blazon.governance.sod.jobs

update Job 
set className = 'com.blazon.governance.sod.jobs.SodEntryToExecutionJob'
where className like '%SodEntryToExecutionJob';

-- SodPolicyExecutorJob - com.blazon.governance.sod.jobs

update Job 
set className = 'com.blazon.governance.sod.jobs.SodPolicyExecutorJob'
where className like '%SodPolicyExecutorJob';


-- Human Tasks

-- TaskEscalationTimeBasedJob - com.blazon.humantasks.jobs

update Job 
set className = 'com.blazon.humantasks.jobs.TaskEscalationTimeBasedJob'
where className like '%TaskEscalationTimeBasedJob';

-- TaskSlaQueueJob - com.blazon.humantasks.jobs

update Job 
set className = 'com.blazon.humantasks.jobs.TaskSlaQueueJob'
where className like '%TaskSlaQueueJob';

-- TaskWillExpireSlaQueueJob - com.blazon.humantasks.jobs

update Job 
set className = 'com.blazon.humantasks.jobs.TaskWillExpireSlaQueueJob'
where className like '%TaskWillExpireSlaQueueJob';


-- Business Rules

-- FindMembershipRoleReadyToRemove - com.blazon.identitybusinessrules.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.jobs.FindMembershipRoleReadyToRemove'
where className like '%FindMembershipRoleReadyToRemove';

-- FindRoleReadyToRemove - com.blazon.identitybusinessrules.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.jobs.FindRoleReadyToRemove'
where className like '%FindRoleReadyToRemove';

-- RoleRightsUserVerifierJob - com.blazon.identitybusinessrules.rolerights.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.rolerights.jobs.RoleRightsUserVerifierJob'
where className like '%RoleRightsUserVerifierJob';

-- RoleRightEntryProcessorJob - com.blazon.identitybusinessrules.rolerights.process.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.rolerights.process.jobs.RoleRightEntryProcessorJob'
where className like '%RoleRightEntryProcessorJob';

-- RoleRightEntryToExecutionJob - com.blazon.identitybusinessrules.rolerights.process.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.rolerights.process.jobs.RoleRightEntryToExecutionJob'
where className like '%RoleRightEntryToExecutionJob';

-- RoleRightRevokeProcessorJob - com.blazon.identitybusinessrules.rolerights.revoke.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.rolerights.revoke.jobs.RoleRightRevokeProcessorJob'
where className like '%RoleRightRevokeProcessorJob';


-- Identity Management

-- CalculateUserRiskJob - com.blazon.identitymanagement.jobs

update Job 
set className = 'com.blazon.identitymanagement.jobs.CalculateUserRiskJob'
where className like '%CalculateUserRiskJob';

-- FindUserReadyToRemove - com.blazon.identitymanagement.jobs

update Job 
set className = 'com.blazon.identitymanagement.jobs.FindUserReadyToRemove'
where className like '%FindUserReadyToRemove';

-- InactivateAccountsFromInactivatedUsersJob - com.blazon.identitymanagement.jobs

update Job 
set className = 'com.blazon.identitymanagement.jobs.InactivateAccountsFromInactivatedUsersJob'
where className like '%InactivateAccountsFromInactivatedUsersJob';

-- PasswordPolicyValidationJob - com.blazon.identitymanagement.passwordpolicy.jobs 

update Job 
set className = 'com.blazon.identitymanagement.passwordpolicy.jobs.PasswordPolicyValidationJob'
where className like '%PasswordPolicyValidationJob';


-- Email

-- SendEmailQueueJob - com.blazon.infrastructure.email.job	

update Job 
set className = 'com.blazon.infrastructure.email.job.SendEmailQueueJob'
where className like '%SendEmailQueueJob';


-- Mfa (mudar o nome) 

-- MfaBllazonOtpRemoveQueueJob - com.blazon.identitymanagement.authentication.securechannel.jobs

update Job 
set className = 'com.blazon.identitymanagement.authentication.securechannel.jobs.MfaBlazonOtpRemoveQueueJob'
where className like '%MfaBllazonOtpRemoveQueueJob';

-- MfaBllazonOtpQueueJob - com.blazon.identitymanagement.authentication.securechannel.jobs

update Job 
set className = 'com.blazon.identitymanagement.authentication.securechannel.jobs.MfaBlazonOtpQueueJob'
where className like '%MfaBllazonOtpQueueJob';


-- Assignment

-- AssignmentProcessorPhaseOneJob - com.blazon.identitybusinessrules.assignmentpolicy.jobs 

update Job 
set className = 'com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentProcessorPhaseOneJob'
where className like '%AssignmentProcessorPhaseOneJob';

-- AssignmentProcessorPhaseTwoJob - com.blazon.identitybusinessrules.assignmentpolicy.jobs

update Job 
set className = 'com.blazon.identitybusinessrules.assignmentpolicy.jobs.AssignmentProcessorPhaseTwoJob'
where className like '%AssignmentProcessorPhaseTwoJob';


-- Remover esses Jobs

-- Remove permanentemente as RemoveMembershipOrganizationsJob do diretório

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RemoveMembershipOrganizationsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RemoveMembershipOrganizationsJob'
);

delete from Job	
where className like '%RemoveMembershipOrganizationsJob';

-- Remove permanentemente as organizações do diretório (com.blazon.identitymanagement.directory.jobs.RemoveOrganizationsJob)

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RemoveOrganizationsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RemoveOrganizationsJob'
);

delete from Job	
where className like '%RemoveOrganizationsJob';

-- Executa regras de membros de organização (com.blazon.identitymanagement.directory.schemas.organization.jobs.OrganizationRuleJob)

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%OrganizationRuleJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%OrganizationRuleJob'
);

delete from Job	
where className like '%OrganizationRuleJob';


-- Remove com.blazon.identitymanagement.policies.certificationpolicy.selector.jobs.CertificationSelectorEntryFinalizeJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%CertificationSelectorEntryFinalizeJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%CertificationSelectorEntryFinalizeJob'
);

delete from Job	
where className like '%CertificationSelectorEntryFinalizeJob';


-- Deletar RevokeExpiredMembershipEntitlementsJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RevokeExpiredMembershipEntitlementsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RevokeExpiredMembershipEntitlementsJob'
);

delete from Job	
where className like '%RevokeExpiredMembershipEntitlementsJob';


-- InactivateExpiredAccountsJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%InactivateExpiredAccountsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%InactivateExpiredAccountsJob'
);

delete from Job	
where className like '%InactivateExpiredAccountsJob';


-- InactivateExpiredUsersJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%InactivateExpiredUsersJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%InactivateExpiredUsersJob'
);

delete from Job	
where className like '%InactivateExpiredUsersJob';


-- RemoveUsersFromExpiredRolesJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RemoveUsersFromExpiredRolesJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RemoveUsersFromExpiredRolesJob'
);

delete from Job	
where className like '%RemoveUsersFromExpiredRolesJob';


-- RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob

update Job 
set className = 'com.blazon.identitybusinessrules.rolerights.revoke.notifications.jobs.RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob'
where className like '%RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob';


-- CertificationCampaignStartJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%CertificationCampaignStartJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%CertificationCampaignStartJob'
);

delete from Job	
where className like '%CertificationCampaignStartJob';


-- QRTZ_JOB_DETAILS

delete from QRTZ_CRON_TRIGGERS;

delete from QRTZ_TRIGGERS;

delete from QRTZ_JOB_DETAILS;


