
-- update BlazonMultipleRequestFinalizeInExecutionJob

UPDATE JobInstance set 
name = 'Blazon Multiple Request Finalize In Execution Job',
description = 'Blazon Multiple Request Finalize In Execution Job.',
externalJobDetailId = 'Blazon Multiple Request Finalize In Execution Job'
where job_id in ( select id from Job where className like '%BlazonMultipleRequestFinalizeInExecutionJob');

update Job 
set className = 'com.blazon.requests.engine.jobs.BlazonMultipleRequestFinalizeInExecutionJob',
description = 'Blazon Multiple Request Finalize In Execution Job.',
displayName = 'Blazon Multiple Request Finalize In Execution Job'
where className like '%BlazonMultipleRequestFinalizeInExecutionJob';


-- update BlazonRequestExecutionQueueJob

UPDATE JobInstance set 
name = 'Blazon Request Execution Queue Job',
description = 'Blazon Request Execution Queue Job.',
externalJobDetailId = 'Blazon Request Execution Queue Job'
where job_id in ( select id from Job where className like '%BlazonRequestExecutionQueueJob');

update Job 
set className = 'com.blazon.requests.engine.jobs.BlazonRequestExecutionQueueJob',
description = 'Blazon Request Execution Queue Job.',
displayName = 'Blazon Request Execution Queue Job'
where className like '%BlazonRequestExecutionQueueJob';


-- update BlazonRequestNewVerifierJob

UPDATE JobInstance set 
name = 'Blazon Request New Verifier Job',
description = 'Blazon Request New Verifier Job.',
externalJobDetailId = 'Blazon Request New Verifier Job'
where job_id in ( select id from Job where className like '%BlazonRequestNewVerifierJob');

update Job 
set className = 'com.blazon.requests.engine.jobs.BlazonRequestNewVerifierJob',
description = 'Blazon Request New Verifier Job.',
displayName = 'Blazon Request New Verifier Job'
where className like '%BlazonRequestNewVerifierJob';


-- update BlazonRequestQueueJob

UPDATE JobInstance set 
name = 'Blazon Request Queue Job',
description = 'Blazon Request Queue Job.',
externalJobDetailId = 'Blazon Request Queue Job'
where job_id in ( select id from Job where className like '%BlazonRequestQueueJob');

update Job 
set className = 'com.blazon.requests.engine.jobs.BlazonRequestQueueJob',
description = 'Blazon Request Queue Job.',
displayName = 'Blazon Request Queue Job'
where className like '%BlazonRequestQueueJob';


-- update BlazonRequestWaitingDependenciesVerifierJob

UPDATE JobInstance set 
name = 'Blazon Request Waiting Dependencies Verifier Job',
description = 'Blazon Request Waiting Dependencies Verifier Job.',
externalJobDetailId = 'Blazon Request Waiting Dependencies Verifier Job'
where job_id in ( select id from Job where className like '%BlazonRequestWaitingDependenciesVerifierJob');

update Job 
set className = 'com.blazon.requests.engine.jobs.BlazonRequestWaitingDependenciesVerifierJob',
description = 'Blazon Request Waiting Dependencies Verifier Job.',
displayName = 'Blazon Request Waiting Dependencies Verifier Job'
where className like '%BlazonRequestWaitingDependenciesVerifierJob';


-- update BlazonRequestWaitingResolvingEntryDependenciesFunctionJob

UPDATE JobInstance set 
name = 'Blazon Request Waiting Resolving Entry Dependencies Function Job',
description = 'Blazon Request Waiting Resolving Entry Dependencies Function Job.',
externalJobDetailId = 'Blazon Request Waiting Resolving Entry Dependencies Function Job'
where job_id in ( select id from Job where className like '%BlazonRequestWaitingResolvingEntryDependenciesFunctionJob');

update Job 
set className = 'com.blazon.requests.engine.jobs.BlazonRequestWaitingResolvingEntryDependenciesFunctionJob',
description = 'Blazon Request Waiting Resolving Entry Dependencies Function Job.',
displayName = 'Blazon Request Waiting Resolving Entry Dependencies Function Job'
where className like '%BlazonRequestWaitingResolvingEntryDependenciesFunctionJob';


-- com.blazon.authentication.module.securechannel.jobs.SecureChannelSendTokenJob

UPDATE JobInstance set 
name = 'Secure Channel Send Token Job',
description = 'Secure Channel Send Token Job.',
externalJobDetailId = 'Secure Channel Send Token Job'
where job_id in ( select id from Job where className like '%SecureChannelSendTokenJob');

update Job 
set className = 'com.blazon.authentication.module.securechannel.jobs.SecureChannelSendTokenJob',
description = 'Secure Channel Send Token Job.',
displayName = 'Secure Channel Send Token Job'
where className like '%SecureChannelSendTokenJob';


-- com.blazon.accountmanagement.jobs.FindAccountReadyToRemove

UPDATE JobInstance set 
name = 'Find Account Ready To Remove',
description = 'Find Account Ready To Remove.',
externalJobDetailId = 'Find Account Ready To Remove'
where job_id in ( select id from Job where className like '%FindAccountReadyToRemove');

update Job 
set className = 'com.blazon.accountmanagement.jobs.FindAccountReadyToRemove',
description = 'Find Account Ready To Remove.',
displayName = 'Find Account Ready To Remove'
where className like '%FindAccountReadyToRemove';


-- com.blazon.accountmanagement.temporaryaccounts.jobs.RevokeExpiredTemporaryAccountsJob

UPDATE JobInstance set 
name = 'Revoke Expired Temporary Accounts Job',
description = 'Revoke Expired Temporary Accounts Job.',
externalJobDetailId = 'Revoke Expired Temporary Accounts Job'
where job_id in ( select id from Job where className like '%RevokeExpiredTemporaryAccountsJob');

update Job 
set className = 'com.blazon.accountmanagement.temporaryaccounts.jobs.RevokeExpiredTemporaryAccountsJob',
description = 'Revoke Expired Temporary Accounts Job.',
displayName = 'Revoke Expired Temporary Accounts Job'
where className like '%RevokeExpiredTemporaryAccountsJob';


-- com.blazon.certification.process.statemachine.jobs.CertificationCancelExecutionQueueJob

UPDATE JobInstance set 
name = 'Certification Cancel Execution Queue Job',
description = 'Certification Cancel Execution Queue Job.',
externalJobDetailId = 'Certification Cancel Execution Queue Job'
where job_id in ( select id from Job where className like '%CertificationCancelExecutionQueueJob');

update Job 
set className = 'com.blazon.certification.process.statemachine.jobs.CertificationCancelExecutionQueueJob',
description = 'Certification Cancel Execution Queue Job.',
displayName = 'Certification Cancel Execution Queue Job'
where className like '%CertificationCancelExecutionQueueJob';


-- com.blazon.certification.process.statemachine.jobs.CertificationQueueJob

UPDATE JobInstance set 
name = 'Certification Queue Job',
description = 'Certification Queue Job.',
externalJobDetailId = 'Certification Queue Job'
where job_id in ( select id from Job where className like '%CertificationQueueJob');

update Job 
set className = 'com.blazon.certification.process.statemachine.jobs.CertificationQueueJob',
description = 'Certification Queue Job.',
displayName = 'Certification Queue Job'
where className like '%CertificationQueueJob';


-- com.blazon.certification.process.statemachine.jobs.CertificationRevokeExecutionQueueJob

UPDATE JobInstance set 
name = 'Certification Revoke Execution Queue Job',
description = 'Certification Revoke Execution Queue Job.',
externalJobDetailId = 'Certification Revoke Execution Queue Job'
where job_id in ( select id from Job where className like '%CertificationRevokeExecutionQueueJob');

update Job 
set className = 'com.blazon.certification.process.statemachine.jobs.CertificationRevokeExecutionQueueJob',
description = 'Certification Revoke Execution Queue Job.',
displayName = 'Certification Revoke Execution Queue Job'
where className like '%CertificationRevokeExecutionQueueJob';


-- com.blazon.certification.types.campaigns.jobs.CertificationCampaignExecutionInstanceJob

UPDATE JobInstance set 
name = 'Certification Campaign Execution Instance Job',
description = 'Certification Campaign Execution Instance Job.',
externalJobDetailId = 'Certification Campaign Execution Instance Job'
where job_id in ( select id from Job where className like '%CertificationCampaignExecutionInstanceJob');

update Job 
set className = 'com.blazon.certification.types.campaigns.jobs.CertificationCampaignExecutionInstanceJob',
description = 'Certification Campaign Execution Instance Job.',
displayName = 'Certification Campaign Execution Instance Job'
where className like '%CertificationCampaignExecutionInstanceJob';


-- com.blazon.certification.types.campaigns.jobs.CertificationCampaignFinalizeJob

UPDATE JobInstance set 
name = 'Certification Campaign Finalize Job',
description = 'Certification Campaign Finalize Job.',
externalJobDetailId = 'Certification Campaign Finalize Job'
where job_id in ( select id from Job where className like '%CertificationCampaignFinalizeJob');

update Job 
set className = 'com.blazon.certification.types.campaigns.jobs.CertificationCampaignFinalizeJob',
description = 'Certification Campaign Finalize Job.',
displayName = 'Certification Campaign Finalize Job'
where className like '%CertificationCampaignFinalizeJob';


-- com.blazon.certification.types.campaigns.jobs.CertificationCampaignFinalizeWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Certification Campaign Finalize With Deadline Reached Job',
description = 'Certification Campaign Finalize With Deadline Reached Job.',
externalJobDetailId = 'Certification Campaign Finalize With Deadline Reached Job'
where job_id in ( select id from Job where className like '%CertificationCampaignFinalizeWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.campaigns.jobs.CertificationCampaignFinalizeWithDeadlineReachedJob',
description = 'Certification Campaign Finalize With Deadline Reached Job.',
displayName = 'Certification Campaign Finalize With Deadline Reached Job'
where className like '%CertificationCampaignFinalizeWithDeadlineReachedJob';


-- com.blazon.certification.types.campaigns.jobs.CertificationCampaignSearchWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Certification Campaign Search With Deadline Reached Job',
description = 'Certification Campaign Search With Deadline Reached Job.',
externalJobDetailId = 'Certification Campaign Search With Deadline Reached Job'
where job_id in ( select id from Job where className like '%CertificationCampaignSearchWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.campaigns.jobs.CertificationCampaignSearchWithDeadlineReachedJob',
description = 'Certification Campaign Search With Deadline Reached Job.',
displayName = 'Certification Campaign Search With Deadline Reached Job'
where className like '%CertificationCampaignSearchWithDeadlineReachedJob';


-- com.blazon.certification.types.campaigns.jobs.CertificationCampaignStartJob

UPDATE JobInstance set 
name = 'Certification Campaign Start Job',
description = 'Certification Campaign Start Job.',
externalJobDetailId = 'Certification Campaign Start Job'
where job_id in ( select id from Job where className like '%CertificationCampaignStartJob');

update Job 
set className = 'com.blazon.certification.types.campaigns.jobs.CertificationCampaignStartJob',
description = 'Certification Campaign Start Job.',
displayName = 'Certification Campaign Start Job'
where className like '%CertificationCampaignStartJob';


-- com.blazon.certification.types.micro.jobs.MicroCertificationExecutionInstanceFinalizeJob

UPDATE JobInstance set 
name = 'Micro Certification Execution Instance Finalize Job',
description = 'Micro Certification Execution Instance Finalize Job.',
externalJobDetailId = 'Micro Certification Execution Instance Finalize Job'
where job_id in ( select id from Job where className like '%MicroCertificationExecutionInstanceFinalizeJob');

update Job 
set className = 'com.blazon.certification.types.micro.jobs.MicroCertificationExecutionInstanceFinalizeJob',
description = 'Micro Certification Execution Instance Finalize Job.',
displayName = 'Micro Certification Execution Instance Finalize Job'
where className like '%MicroCertificationExecutionInstanceFinalizeJob';


-- com.blazon.certification.types.micro.jobs.MicroCertificationExecutionInstanceStartJob

UPDATE JobInstance set 
name = 'Micro Certification Execution Instance Start Job',
description = 'Micro Certification Execution Instance Start Job.',
externalJobDetailId = 'Micro Certification Execution Instance Start Job'
where job_id in ( select id from Job where className like '%MicroCertificationExecutionInstanceStartJob');

update Job 
set className = 'com.blazon.certification.types.micro.jobs.MicroCertificationExecutionInstanceStartJob',
description = 'Micro Certification Execution Instance Start Job.',
displayName = 'Micro Certification Execution Instance Start Job'
where className like '%MicroCertificationExecutionInstanceStartJob';


-- com.blazon.certification.types.micro.jobs.MicroCertificationFinalizeWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Micro Certification Finalize With Deadline Reached Job',
description = 'Micro Certification Finalize With Deadline Reached Job.',
externalJobDetailId = 'Micro Certification Finalize With Deadline Reached Job'
where job_id in ( select id from Job where className like '%MicroCertificationFinalizeWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.micro.jobs.MicroCertificationFinalizeWithDeadlineReachedJob',
description = 'Micro Certification Finalize With Deadline Reached Job.',
displayName = 'Micro Certification Finalize With Deadline Reached Job'
where className like '%MicroCertificationFinalizeWithDeadlineReachedJob';


-- com.blazon.certification.types.micro.jobs.MicroCertificationSearchWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Micro Certification Search With Deadline Reached Job',
description = 'Micro Certification Search With Deadline Reached Job.',
externalJobDetailId = 'Micro Certification Search With Deadline Reached Job'
where job_id in ( select id from Job where className like '%MicroCertificationSearchWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.micro.jobs.MicroCertificationSearchWithDeadlineReachedJob',
description = 'Micro Certification Search With Deadline Reached Job.',
displayName = 'Micro Certification Search With Deadline Reached Job'
where className like '%MicroCertificationSearchWithDeadlineReachedJob';


-- com.blazon.certification.types.policies.periodicitybased.jobs.CertificationPolicyPeriodicityExecutorJob

UPDATE JobInstance set 
name = 'Certification Policy Periodicity Executor Job',
description = 'Certification Policy Periodicity Executor Job.',
externalJobDetailId = 'Certification Policy Periodicity Executor Job'
where job_id in ( select id from Job where className like '%CertificationPolicyPeriodicityExecutorJob');

update Job 
set className = 'com.blazon.certification.types.policies.periodicitybased.jobs.CertificationPolicyPeriodicityExecutorJob',
description = 'Certification Policy Periodicity Executor Job.',
displayName = 'Certification Policy Periodicity Executor Job'
where className like '%CertificationPolicyPeriodicityExecutorJob';


-- com.blazon.certification.types.policies.periodicitybased.jobs.CertificationPolicyPeriodicityFinalizeWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Certification Policy Periodicity Finalize With Deadline Reached Job',
description = 'Certification Policy Periodicity Finalize With Deadline Reached Job.',
externalJobDetailId = 'Certification Policy Periodicity Finalize With Deadline Reached Job'
where job_id in ( select id from Job where className like '%CertificationPolicyPeriodicityFinalizeWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.policies.periodicitybased.jobs.CertificationPolicyPeriodicityFinalizeWithDeadlineReachedJob',
description = 'Certification Policy Periodicity Finalize With Deadline Reached Job.',
displayName = 'Certification Policy Periodicity Finalize With Deadline Reached Job'
where className like '%CertificationPolicyPeriodicityFinalizeWithDeadlineReachedJob';


-- com.blazon.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeExecutionInstanceFinalizeJob

UPDATE JobInstance set 
name = 'Certification Policy User Change Execution Instance Finalize Job',
description = 'Certification Policy User Change Execution Instance Finalize Job.',
externalJobDetailId = 'Certification Policy User Change Execution Instance Finalize Job'
where job_id in ( select id from Job where className like '%CertificationPolicyUserChangeExecutionInstanceFinalizeJob');

update Job 
set className = 'com.blazon.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeExecutionInstanceFinalizeJob',
description = 'Certification Policy User Change Execution Instance Finalize Job.',
displayName = 'Certification Policy User Change Execution Instance Finalize Job'
where className like '%CertificationPolicyUserChangeExecutionInstanceFinalizeJob';


-- com.blazon.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeFinalizeWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Certification Policy User Change Finalize With Deadline Reached Job',
description = 'Certification Policy User Change Finalize With Deadline Reached Job.',
externalJobDetailId = 'Certification Policy User Change Finalize With Deadline Reached Job'
where job_id in ( select id from Job where className like '%CertificationPolicyUserChangeFinalizeWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeFinalizeWithDeadlineReachedJob',
description = 'Certification Policy User Change Finalize With Deadline Reached Job.',
displayName = 'Certification Policy User Change Finalize With Deadline Reached Job'
where className like '%CertificationPolicyUserChangeFinalizeWithDeadlineReachedJob';


-- com.blazon.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeSearchWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Certification Policy User Change Search With Deadline Reached Job',
description = 'Certification Policy User Change Search With Deadline Reached Job.',
externalJobDetailId = 'Certification Policy User Change Search With Deadline Reached Job'
where job_id in ( select id from Job where className like '%CertificationPolicyUserChangeSearchWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeSearchWithDeadlineReachedJob',
description = 'Certification Policy User Change Search With Deadline Reached Job.',
displayName = 'Certification Policy User Change Search With Deadline Reached Job'
where className like '%CertificationPolicyUserChangeSearchWithDeadlineReachedJob';


-- com.blazon.email.job.SendEmailQueueJob

UPDATE JobInstance set 
name = 'Send Email Queue Job',
description = 'Send Email Queue Job.',
externalJobDetailId = 'Send Email Queue Job'
where job_id in ( select id from Job where className like '%SendEmailQueueJob');

update Job 
set className = 'com.blazon.email.job.SendEmailQueueJob',
description = 'Send Email Queue Job.',
displayName = 'Send Email Queue Job'
where className like '%SendEmailQueueJob';


-- com.blazon.entitlementmanagement.jobs.FindMembershipEntitlementReadyToRemove

UPDATE JobInstance set 
name = 'Find Membership Entitlement Ready To Remove',
description = 'Find Membership Entitlement Ready To Remove.',
externalJobDetailId = 'Find Membership Entitlement Ready To Remove'
where job_id in ( select id from Job where className like '%FindMembershipEntitlementReadyToRemove');

update Job 
set className = 'com.blazon.entitlementmanagement.jobs.FindMembershipEntitlementReadyToRemove',
description = 'Find Membership Entitlement Ready To Remove.',
displayName = 'Find Membership Entitlement Ready To Remove'
where className like '%FindMembershipEntitlementReadyToRemove';

-- com.blazon.passwordpolicy.jobs.PasswordPolicyValidationJob

UPDATE JobInstance set 
name = 'Password Policy Validation Job',
description = 'Password Policy Validation Job.',
externalJobDetailId = 'Password Policy Validation Job'
where job_id in ( select id from Job where className like '%PasswordPolicyValidationJob');

update Job 
set className = 'com.blazon.passwordpolicy.jobs.PasswordPolicyValidationJob',
description = 'Password Policy Validation Job.',
displayName = 'Password Policy Validation Job'
where className like '%PasswordPolicyValidationJob';	

-- com.blazon.humantasks.escalations.policy.jobs.TaskEscalationPeriodicJob

UPDATE JobInstance set 
name = 'Task Escalation Periodic Job',
description = 'Task Escalation Periodic Job.',
externalJobDetailId = 'Task Escalation Periodic Job'
where job_id in ( select id from Job where className like '%TaskEscalationPeriodicJob');

update Job 
set className = 'com.blazon.humantasks.escalations.policy.jobs.TaskEscalationPeriodicJob',
description = 'Task Escalation Periodic Job.',
displayName = 'Task Escalation Periodic Job'
where className like '%TaskEscalationPeriodicJob';	

-- com.blazon.humantasks.escalations.policy.jobs.TaskEscalationTimeBasedJob

UPDATE JobInstance set 
name = 'Task Escalation Time Based Job',
description = 'Task Escalation Time Based Job.',
externalJobDetailId = 'Task Escalation Time Based Job'
where job_id in ( select id from Job where className like '%TaskEscalationTimeBasedJob');

update Job 
set className = 'com.blazon.humantasks.escalations.policy.jobs.TaskEscalationTimeBasedJob',
description = 'Task Escalation Time Based Job.',
displayName = 'Task Escalation Time Based Job'
where className like '%TaskEscalationTimeBasedJob';	

-- com.blazon.humantasks.escalations.auto.jobs.FindTasksReadyToCancelationJob

UPDATE JobInstance set 
name = 'Find Tasks Ready To Cancelation Job',
description = 'Find Tasks Ready To Cancelation Job.',
externalJobDetailId = 'Find Tasks Ready To Cancelation Job'
where job_id in ( select id from Job where className like '%FindTasksReadyToCancelationJob');

update Job 
set className = 'com.blazon.humantasks.escalations.auto.jobs.FindTasksReadyToCancelationJob',
description = 'Find Tasks Ready To Cancelation Job.',
displayName = 'Find Tasks Ready To Cancelation Job'
where className like '%FindTasksReadyToCancelationJob';	

-- com.blazon.humantasks.escalations.auto.jobs.FindTasksToWaitingEscalationJob

UPDATE JobInstance set 
name = 'Find Tasks To Waiting Escalation Job',
description = 'Find Tasks To Waiting Escalation Job.',
externalJobDetailId = 'Find Tasks To Waiting Escalation Job'
where job_id in ( select id from Job where className like '%FindTasksToWaitingEscalationJob');

update Job 
set className = 'com.blazon.humantasks.escalations.auto.jobs.FindTasksToWaitingEscalationJob',
description = 'Find Tasks To Waiting Escalation Job.',
displayName = 'Find Tasks To Waiting Escalation Job'
where className like '%FindTasksToWaitingEscalationJob';	

-- com.blazon.humantasks.escalations.auto.jobs.ResolveTasksInWaitingEscalationJob

UPDATE JobInstance set 
name = 'Resolve Tasks In Waiting Escalation Job',
description = 'Resolve Tasks In Waiting Escalation Job.',
externalJobDetailId = 'Resolve Tasks In Waiting Escalation Job'
where job_id in ( select id from Job where className like '%ResolveTasksInWaitingEscalationJob');

update Job 
set className = 'com.blazon.humantasks.escalations.auto.jobs.ResolveTasksInWaitingEscalationJob',
description = 'Resolve Tasks In Waiting Escalation Job.',
displayName = 'Resolve Tasks In Waiting Escalation Job'
where className like '%ResolveTasksInWaitingEscalationJob';	

-- com.blazon.provisioning.engine.jobs.ProvisioningDispatchFailoverWorkflowExecutionJob

UPDATE JobInstance set 
name = 'Provisioning Dispatch Failover Workflow Execution Job',
description = 'Provisioning Dispatch Failover Workflow Execution Job.',
externalJobDetailId = 'Provisioning Dispatch Failover Workflow Execution Job'
where job_id in ( select id from Job where className like '%ProvisioningDispatchFailoverWorkflowExecutionJob');

update Job 
set className = 'com.blazon.provisioning.engine.jobs.ProvisioningDispatchFailoverWorkflowExecutionJob',
description = 'Provisioning Dispatch Failover Workflow Execution Job.',
displayName = 'Provisioning Dispatch Failover Workflow Execution Job'
where className like '%ProvisioningDispatchFailoverWorkflowExecutionJob';


-- com.blazon.provisioning.engine.jobs.ProvisioningDispatchToWaitingResourceAdapterPullingJob

UPDATE JobInstance set 
name = 'Provisioning Dispatch To Waiting Resource Adapter Pulling Job',
description = 'Provisioning Dispatch To Waiting Resource Adapter Pulling Job.',
externalJobDetailId = 'Provisioning Dispatch To Waiting Resource Adapter Pulling Job'
where job_id in ( select id from Job where className like '%ProvisioningDispatchToWaitingResourceAdapterPullingJob');

update Job 
set className = 'com.blazon.provisioning.engine.jobs.ProvisioningDispatchToWaitingResourceAdapterPullingJob',
description = 'Provisioning Dispatch To Waiting Resource Adapter Pulling Job.',
displayName = 'Provisioning Dispatch To Waiting Resource Adapter Pulling Job'
where className like '%ProvisioningDispatchToWaitingResourceAdapterPullingJob';


-- com.blazon.provisioning.engine.jobs.ProvisioningWaitingAssignToTaskQueueExecutionJob

UPDATE JobInstance set 
name = 'Provisioning Waiting Assign To Task Queue Execution Job',
description = 'Provisioning Waiting Assign To Task Queue Execution Job.',
externalJobDetailId = 'Provisioning Waiting Assign To Task Queue Execution Job'
where job_id in ( select id from Job where className like '%ProvisioningWaitingAssignToTaskQueueExecutionJob');

update Job 
set className = 'com.blazon.provisioning.engine.jobs.ProvisioningWaitingAssignToTaskQueueExecutionJob',
description = 'Provisioning Waiting Assign To Task Queue Execution Job.',
displayName = 'Provisioning Waiting Assign To Task Queue Execution Job'
where className like '%ProvisioningWaitingAssignToTaskQueueExecutionJob';


-- com.blazon.provisioning.engine.jobs.ProvisioningWaitingWorkflowExecutionJob

UPDATE JobInstance set 
name = 'Provisioning Waiting Workflow Execution Job',
description = 'Provisioning Waiting Workflow Execution Job.',
externalJobDetailId = 'Provisioning Waiting Workflow Execution Job'
where job_id in ( select id from Job where className like '%ProvisioningWaitingWorkflowExecutionJob');

update Job 
set className = 'com.blazon.provisioning.engine.jobs.ProvisioningWaitingWorkflowExecutionJob',
description = 'Provisioning Waiting Workflow Execution Job.',
displayName = 'Provisioning Waiting Workflow Execution Job'
where className like '%ProvisioningWaitingWorkflowExecutionJob';


-- com.blazon.reconciliation.engine.jobs.ReconciliationBatchEntryCertifierJob

UPDATE JobInstance set 
name = 'Reconciliation Batch Entry Certifier Job',
description = 'Reconciliation Batch Entry Certifier Job.',
externalJobDetailId = 'Reconciliation Batch Entry Certifier Job'
where job_id in ( select id from Job where className like '%ReconciliationBatchEntryCertifierJob');

update Job 
set className = 'com.blazon.reconciliation.engine.jobs.ReconciliationBatchEntryCertifierJob',
description = 'Reconciliation Batch Entry Certifier Job.',
displayName = 'Reconciliation Batch Entry Certifier Job'
where className like '%ReconciliationBatchEntryCertifierJob';


-- com.blazon.reconciliation.engine.jobs.ReconciliationStep01_NotProcessedToAssociatingRulesJob

UPDATE JobInstance set 
name = 'Reconciliation Step01 Not Processed To Associating Rules Job',
description = 'Reconciliation Step01 Not Processed To Associating Rules Job.',
externalJobDetailId = 'Reconciliation Batch Entry Certifier Job'
where job_id in ( select id from Job where className like '%ReconciliationStep01_NotProcessedToAssociatingRulesJob');

update Job 
set className = 'com.blazon.reconciliation.engine.jobs.ReconciliationStep01_NotProcessedToAssociatingRulesJob',
description = 'Reconciliation Batch Entry Certifier Job.',
displayName = 'Reconciliation Batch Entry Certifier Job'
where className like '%ReconciliationStep01_NotProcessedToAssociatingRulesJob';


-- com.blazon.reconciliation.engine.jobs.ReconciliationStep02_RulesAssociatedToDiscoveringSituationJob

UPDATE JobInstance set 
name = 'Reconciliation Step02 Rules Associated To Discovering Situation Job',
description = 'Reconciliation Step02 Rules Associated To Discovering Situation Job.',
externalJobDetailId = 'Reconciliation Step02 Rules Associated To Discovering Situation Job'
where job_id in ( select id from Job where className like '%ReconciliationStep02_RulesAssociatedToDiscoveringSituationJob');

update Job 
set className = 'com.blazon.reconciliation.engine.jobs.ReconciliationStep02_RulesAssociatedToDiscoveringSituationJob',
description = 'Reconciliation Step02 Rules Associated To Discovering Situation Job.',
displayName = 'Reconciliation Step02 Rules Associated To Discovering Situation Job'
where className like '%ReconciliationStep02_RulesAssociatedToDiscoveringSituationJob';


-- com.blazon.reconciliation.engine.jobs.ReconciliationStep03_SituationDiscoveredToAttributeMappingJob

UPDATE JobInstance set 
name = 'Reconciliation Step03 Situation Discovered To Attribute Mapping Job',
description = 'Reconciliation Step03 Situation Discovered To Attribute Mapping Job.',
externalJobDetailId = 'Reconciliation Step03 Situation Discovered To Attribute Mapping Job'
where job_id in ( select id from Job where className like '%ReconciliationStep03_SituationDiscoveredToAttributeMappingJob');

update Job 
set className = 'com.blazon.reconciliation.engine.jobs.ReconciliationStep03_SituationDiscoveredToAttributeMappingJob',
description = 'Reconciliation Step03 Situation Discovered To Attribute Mapping Job.',
displayName = 'Reconciliation Step03 Situation Discovered To Attribute Mapping Job'
where className like '%ReconciliationStep03_SituationDiscoveredToAttributeMappingJob';


-- com.blazon.reconciliation.engine.jobs.ReconciliationStep04_MappedAttributesToInvokingActionJob

UPDATE JobInstance set 
name = 'Reconciliation Step04 Mapped Attributes To Invoking Action Job',
description = 'Reconciliation Step04 Mapped Attributes To Invoking Action Job.',
externalJobDetailId = 'Reconciliation Step04 Mapped Attributes To Invoking Action Job'
where job_id in ( select id from Job where className like '%ReconciliationStep04_MappedAttributesToInvokingActionJob');

update Job 
set className = 'com.blazon.reconciliation.engine.jobs.ReconciliationStep04_MappedAttributesToInvokingActionJob',
description = 'Reconciliation Step04 Mapped Attributes To Invoking Action Job.',
displayName = 'Reconciliation Step04 Mapped Attributes To Invoking Action Job'
where className like '%ReconciliationStep04_MappedAttributesToInvokingActionJob';


-- com.blazon.reconciliation.engine.jobs.ReconciliationStepReadyToInvokeActionJob

UPDATE JobInstance set 
name = 'Reconciliation Step Ready To Invoke Action Job',
description = 'Reconciliation Step Ready To Invoke Action Job.',
externalJobDetailId = 'Reconciliation Step Ready To Invoke Action Job'
where job_id in ( select id from Job where className like '%ReconciliationStepReadyToInvokeActionJob');

update Job 
set className = 'com.blazon.reconciliation.engine.jobs.ReconciliationStepReadyToInvokeActionJob',
description = 'Reconciliation Step Ready To Invoke Action Job.',
displayName = 'Reconciliation Step Ready To Invoke Action Job'
where className like '%ReconciliationStepReadyToInvokeActionJob';


-- com.blazon.rolemanagement.role.jobs.FindMembershipRoleReadyToRemove

UPDATE JobInstance set 
name = 'Find Membership Role Ready To Remove',
description = 'Find Membership Role Ready To Remove.',
externalJobDetailId = 'Find Membership Role Ready To Remove'
where job_id in ( select id from Job where className like '%FindMembershipRoleReadyToRemove');

update Job 
set className = 'com.blazon.rolemanagement.role.jobs.FindMembershipRoleReadyToRemove',
description = 'Find Membership Role Ready To Remove.',
displayName = 'Find Membership Role Ready To Remove'
where className like '%FindMembershipRoleReadyToRemove';


-- com.blazon.rolemanagement.rolerights.jobs.RoleRightsUserVerifierJob

UPDATE JobInstance set 
name = 'Role Rights User Verifier Job',
description = 'Role Rights User Verifier Job.',
externalJobDetailId = 'Role Rights User Verifier Job'
where job_id in ( select id from Job where className like '%RoleRightsUserVerifierJob');

update Job 
set className = 'com.blazon.rolemanagement.rolerights.jobs.RoleRightsUserVerifierJob',
description = 'Role Rights User Verifier Job.',
displayName = 'Role Rights User Verifier Job'
where className like '%RoleRightsUserVerifierJob';


-- com.blazon.rolemanagement.rolerights.process.jobs.RoleRightEntryProcessorJob

UPDATE JobInstance set 
name = 'Role Right Entry Processor Job',
description = 'Role Right Entry Processor Job.',
externalJobDetailId = 'Role Right Entry Processor Job'
where job_id in ( select id from Job where className like '%RoleRightEntryProcessorJob');

update Job 
set className = 'com.blazon.rolemanagement.rolerights.process.jobs.RoleRightEntryProcessorJob',
description = 'Role Right Entry Processor Job.',
displayName = 'Role Right Entry Processor Jobs'
where className like '%RoleRightEntryProcessorJob';


-- com.blazon.rolemanagement.rolerights.process.jobs.RoleRightEntryToExecutionJob

UPDATE JobInstance set 
name = 'Role Right Entry To Execution Job',
description = 'Role Right Entry To Execution Job.',
externalJobDetailId = 'Role Right Entry To Execution Job'
where job_id in ( select id from Job where className like '%RoleRightEntryToExecutionJob');

update Job 
set className = 'com.blazon.rolemanagement.rolerights.process.jobs.RoleRightEntryToExecutionJob',
description = 'Role Right Entry To Execution Job.',
displayName = 'Role Right Entry To Execution Jobs'
where className like '%RoleRightEntryToExecutionJob';


-- com.blazon.rolemanagement.rolerights.revoke.jobs.RoleRightRevokeProcessorJob

UPDATE JobInstance set 
name = 'Role Right Revoke Processor Job',
description = 'Role Right Revoke Processor Job.',
externalJobDetailId = 'Role Right Revoke Processor Job'
where job_id in ( select id from Job where className like '%RoleRightRevokeProcessorJob');

update Job 
set className = 'com.blazon.rolemanagement.rolerights.revoke.jobs.RoleRightRevokeProcessorJob',
description = 'Role Right Revoke Processor Job.',
displayName = 'Role Right Revoke Processor Job'
where className like '%RoleRightRevokeProcessorJob';


-- com.blazon.rolemanagement.rolerights.revoke.notifications.jobs.RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob

UPDATE JobInstance set 
name = 'Role Right Entry Waiting Resolution Since Last Execution Notification Job',
description = 'Role Right Entry Waiting Resolution Since Last Execution Notification Job.',
externalJobDetailId = 'Role Right Entry Waiting Resolution Since Last Execution Notification Job'
where job_id in ( select id from Job where className like '%RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob');

update Job 
set className = 'com.blazon.rolemanagement.rolerights.revoke.notifications.jobs.RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob',
description = 'Role Right Entry Waiting Resolution Since Last Execution Notification Job.',
displayName = 'Role Right Entry Waiting Resolution Since Last Execution Notification Job'
where className like '%RoleRightEntryWaitingResolutionSinceLastExecutionNotificationJob';



-- com.blazon.rolemanagement.assignmentpolicy.jobs.AssignmentProcessorPhaseOneJob

UPDATE JobInstance set 
name = 'Role Right Assignment Processor Phase One Job',
description = 'Role Right Assignment Processor Phase One Job.',
externalJobDetailId = 'Role Right Assignment Processor Phase One Job'
where job_id in ( select id from Job where className like '%AssignmentProcessorPhaseOneJob');

update Job 
set className = 'com.blazon.rolemanagement.assignmentpolicy.jobs.AssignmentProcessorPhaseOneJob',
description = 'Role Right Assignment Processor Phase One Job.',
displayName = 'Role Right Assignment Processor Phase One Job'
where className like '%AssignmentProcessorPhaseOneJob';


-- com.blazon.rolemanagement.assignmentpolicy.jobs.AssignmentProcessorPhaseTwoJob

UPDATE JobInstance set 
name = 'Role Right Assignment Processor Phase Two Job',
description = 'Role Right Assignment Processor Phase Two Job.',
externalJobDetailId = 'Role Right Assignment Processor Phase Two Job'
where job_id in ( select id from Job where className like '%AssignmentProcessorPhaseTwoJob');

update Job 
set className = 'com.blazon.rolemanagement.assignmentpolicy.jobs.AssignmentProcessorPhaseTwoJob',
description = 'Role Right Assignment Processor Phase Two Job.',
displayName = 'Role Right Assignment Processor Phase Two Job'
where className like '%AssignmentProcessorPhaseTwoJob';


-- com.blazon.rolemanagement.assignmentpolicy.jobs.AssignmentRoleKeepProcessorJob

UPDATE JobInstance set 
name = 'Role Right Assignment Role Keep Processor Job',
description = 'Role Right Assignment Role Keep Processor Job.',
externalJobDetailId = 'Role Right Assignment Role Keep Processor Job'
where job_id in ( select id from Job where className like '%AssignmentRoleKeepProcessorJob');

update Job 
set className = 'com.blazon.rolemanagement.assignmentpolicy.jobs.AssignmentRoleKeepProcessorJob',
description = 'Role Right Assignment Role Keep Processor Job.',
displayName = 'Role Right Assignment Role Keep Processor Job'
where className like '%AssignmentRoleKeepProcessorJob';


-- com.blazon.rolemanagement.assignmentpolicy.jobs.AssignmentRoleRevokeProcessorJob

UPDATE JobInstance set 
name = 'Role Right Assignment Role Revoke Processor Job',
description = 'Role Right Assignment Role Revoke Processor Job.',
externalJobDetailId = 'Role Right Assignment Role Revoke Processor Job'
where job_id in ( select id from Job where className like '%AssignmentRoleRevokeProcessorJob');

update Job 
set className = 'com.blazon.rolemanagement.assignmentpolicy.jobs.AssignmentRoleRevokeProcessorJob',
description = 'Role Right Assignment Role Revoke Processor Job.',
displayName = 'Role Right Assignment Role Revoke Processor Job'
where className like '%AssignmentRoleRevokeProcessorJob';


-- com.blazon.sod.engine.discovery.jobs.SodPolicyExecutorJob

UPDATE JobInstance set 
name = 'Sod Policy Executor Job',
description = 'Sod Policy Executor Job.',
externalJobDetailId = 'Sod Policy Executor Job'
where job_id in ( select id from Job where className like '%SodPolicyExecutorJob');

update Job 
set className = 'com.blazon.sod.engine.discovery.jobs.SodPolicyExecutorJob',
description = 'Sod Policy Executor Job.',
displayName = 'Sod Policy Executor Job'
where className like '%SodPolicyExecutorJob';


-- com.blazon.sod.engine.statemachine.jobs.SodEntryInfoProcessorJob

UPDATE JobInstance set 
name = 'Sod Entry Info Processor Job',
description = 'Sod Entry Info Processor Job.',
externalJobDetailId = 'Sod Entry Info Processor Job'
where job_id in ( select id from Job where className like '%SodEntryInfoProcessorJob');

update Job 
set className = 'com.blazon.sod.engine.statemachine.jobs.SodEntryInfoProcessorJob',
description = 'Sod Entry Info Processor Job.',
displayName = 'Sod Entry Info Processor Job'
where className like '%SodEntryInfoProcessorJob';


-- com.blazon.sod.engine.statemachine.jobs.SodEntryToExecutionJob

UPDATE JobInstance set 
name = 'Sod Entry To Execution Processor Job',
description = 'Sod Entry To Execution Processor Job.',
externalJobDetailId = 'Sod Entry To Execution Processor Job'
where job_id in ( select id from Job where className like '%SodEntryToExecutionJob');

update Job 
set className = 'com.blazon.sod.engine.statemachine.jobs.SodEntryToExecutionJob',
description = 'Sod Entry To Execution Processor Job.',
displayName = 'Sod Entry To Execution Processor Job'
where className like '%SodEntryToExecutionJob';


-- com.blazon.usermanagement.jobs.CalculateUserRiskJob

UPDATE JobInstance set 
name = 'Calculate User Risk Job',
description = 'Calculate User Risk Job.',
externalJobDetailId = 'Calculate User Risk Job'
where job_id in ( select id from Job where className like '%CalculateUserRiskJob');

update Job 
set className = 'com.blazon.usermanagement.jobs.CalculateUserRiskJob',
description = 'Calculate User Risk Job.',
displayName = 'Calculate User Risk Job'
where className like '%CalculateUserRiskJob';


-- com.blazon.usermanagement.jobs.FindUserReadyToRemove

UPDATE JobInstance set 
name = 'Find User Ready To Remove',
description = 'Find User Ready To Remove.',
externalJobDetailId = 'Find User Ready To Remove'
where job_id in ( select id from Job where className like '%FindUserReadyToRemove');

update Job 
set className = 'com.blazon.usermanagement.jobs.FindUserReadyToRemove',
description = 'Find User Ready To Remove.',
displayName = 'Find User Ready To Remove'
where className like '%FindUserReadyToRemove';


-- com.blazon.usermanagement.jobs.InactivateAccountsFromInactivatedUsersJob

UPDATE JobInstance set 
name = 'Inactivate Accounts From Inactivated Users Job',
description = 'Inactivate Accounts From Inactivated Users Job.',
externalJobDetailId = 'Inactivate Accounts From Inactivated Users Job'
where job_id in ( select id from Job where className like '%InactivateAccountsFromInactivatedUsersJob');

update Job 
set className = 'com.blazon.usermanagement.jobs.InactivateAccountsFromInactivatedUsersJob',
description = 'Inactivate Accounts From Inactivated Users Job.',
displayName = 'Inactivate Accounts From Inactivated Users Job'
where className like '%InactivateAccountsFromInactivatedUsersJob';


-- remove RevokeAccountsJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RevokeAccountsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RevokeAccountsJob'
);

delete from Job	
where className like '%RevokeAccountsJob';


-- remove RevokeEntitlementsJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RevokeEntitlementsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RevokeEntitlementsJob'
);

delete from Job	
where className like '%RevokeEntitlementsJob';


-- remove RevokeMembershipEntitlementsJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RevokeMembershipEntitlementsJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RevokeMembershipEntitlementsJob'
);

delete from Job	
where className like '%RevokeMembershipEntitlementsJob';


-- remove RevokeMembershipRolesJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RevokeMembershipRolesJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RevokeMembershipRolesJob'
);

delete from Job	
where className like '%RevokeMembershipRolesJob';


-- remove RevokeRolesJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RevokeRolesJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RevokeRolesJob'
);

delete from Job	
where className like '%RevokeRolesJob';


-- remove RevokeUsersJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%RevokeUsersJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%RevokeUsersJob'
);

delete from Job	
where className like '%RevokeUsersJob';



