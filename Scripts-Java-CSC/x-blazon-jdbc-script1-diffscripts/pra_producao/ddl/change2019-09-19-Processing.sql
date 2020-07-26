/*
CREATE  ANALYTICS_CERTIFICATION_FACT
	CREATE  amountCertified  bigint(20)
	CREATE  amountError  bigint(20)
	CREATE  amountFinished  bigint(20)
	CREATE  amountRevoked  bigint(20)
	CREATE  amountWaitingApproval  bigint(20)
	CREATE  approvalPercentage  double
	CREATE  averageCompletionTime  bigint(20)
	CREATE  dateCollect  datetime
	CREATE  revokePercentage  double
*/
	
create table ANALYTICS_CERTIFICATION_FACT (
    dateCollect datetime not null,
    amountCertified bigint,
    amountError bigint,
    amountFinished bigint,
    amountRevoked bigint,
    amountWaitingApproval bigint,
    approvalPercentage double precision,
    averageCompletionTime bigint,
    revokePercentage double precision,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT
	CREATE  amountAccountsByManual  bigint(20)
	CREATE  amountAccountsByReconciliation  bigint(20)
	CREATE  amountAccountsByRole  bigint(20)
	CREATE  amountMembershipEntitlementByManual  bigint(20)
	CREATE  amountMembershipEntitlementByReconciliation  bigint(20)
	CREATE  amountMembershipEntitlementByRole  bigint(20)
	CREATE  amountMembershipOrganizationByManual  bigint(20)
	CREATE  amountMembershipOrganizationByOrganizationRule  bigint(20)
	CREATE  amountMembershipOrganizationByReconciliation  bigint(20)
	CREATE  amountMembershipRoleByAssignmentPolicy  bigint(20)
	CREATE  amountMembershipRoleByManual  bigint(20)
	CREATE  amountMembershipRoleByReconciliation  bigint(20)
	CREATE  dateCollect  datetime
*/
	
create table ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT (
    dateCollect datetime not null,
    amountAccountsByManual bigint,
    amountAccountsByReconciliation bigint,
    amountAccountsByRole bigint,
    amountMembershipEntitlementByManual bigint,
    amountMembershipEntitlementByReconciliation bigint,
    amountMembershipEntitlementByRole bigint,
    amountMembershipOrganizationByManual bigint,
    amountMembershipOrganizationByOrganizationRule bigint,
    amountMembershipOrganizationByReconciliation bigint,
    amountMembershipRoleByAssignmentPolicy bigint,
    amountMembershipRoleByManual bigint,
    amountMembershipRoleByReconciliation bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_DIRECTORY_OBJECTS_CREATION_DETAIL_FACT
	CREATE  amountAccountsByReconciliation  bigint(20)
	CREATE  amountAccountsByRequest  bigint(20)
	CREATE  amountAccountsByRole  bigint(20)
	CREATE  amountEntitlementsByReconciliation  bigint(20)
	CREATE  amountEntitlementsByRequest  bigint(20)
	CREATE  amountEntitlementsByRole  bigint(20)
	CREATE  amountRolesByReconciliation  bigint(20)
	CREATE  amountRolesByRequest  bigint(20)
	CREATE  amountUsersByReconciliation  bigint(20)
	CREATE  amountUsersByRequest  bigint(20)
	CREATE  dateCollect  datetime
*/
	
create table ANALYTICS_DIRECTORY_OBJECTS_CREATION_DETAIL_FACT (
    dateCollect datetime not null,
    amountAccountsByReconciliation bigint,
    amountAccountsByRequest bigint,
    amountAccountsByRole bigint,
    amountEntitlementsByReconciliation bigint,
    amountEntitlementsByRequest bigint,
    amountEntitlementsByRole bigint,
    amountRolesByReconciliation bigint,
    amountRolesByRequest bigint,
    amountUsersByReconciliation bigint,
    amountUsersByRequest bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_DIRECTORY_OBJECTS_DETAIL_FACT
	CREATE  averageAccountsPerResource  bigint(20)
	CREATE  averageAccountsPerUser  bigint(20)
	CREATE  averageEntitlementsByResource  bigint(20)
	CREATE  averageEntitlementsByUser  bigint(20)
	CREATE  averageRolesByUser  bigint(20)
	CREATE  averageUsersByEntitlement  bigint(20)
	CREATE  averageUsersByOrganization  bigint(20)
	CREATE  averageUsersByRole  bigint(20)
	CREATE  dateCollect  datetime
	CREATE  totalUsersWithoutAccounts  bigint(20)
*/	

create table ANALYTICS_DIRECTORY_OBJECTS_DETAIL_FACT (
    dateCollect datetime not null,
    averageAccountsPerResource bigint,
    averageAccountsPerUser bigint,
    averageEntitlementsByResource bigint,
    averageEntitlementsByUser bigint,
    averageRolesByUser bigint,
    averageUsersByEntitlement bigint,
    averageUsersByOrganization bigint,
    averageUsersByRole bigint,
    totalUsersWithoutAccounts bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;
	
/*
CREATE  ANALYTICS_DIRECTORY_OBJECTS_FACT
	CREATE  amountAccounts  bigint(20)
	CREATE  amountActiveUsers  bigint(20)
	CREATE  amountInactiveUsers  bigint(20)
	CREATE  amountLockedUsers  bigint(20)
	CREATE  amountMembershipEntitlements  bigint(20)
	CREATE  amountOrganizations  bigint(20)
	CREATE  amountRemovedUsers  bigint(20)
	CREATE  amountResources  bigint(20)
	CREATE  amountRoles  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_DIRECTORY_OBJECTS_FACT (
    dateCollect datetime not null,
    amountAccounts bigint,
    amountActiveUsers bigint,
    amountInactiveUsers bigint,
    amountLockedUsers bigint,
    amountMembershipEntitlements bigint,
    amountOrganizations bigint,
    amountRemovedUsers bigint,
    amountResources bigint,
    amountRoles bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_DIRECTORY_RISK_DETAIL_FACT
	CREATE  amountHighRiskEntitlements  bigint(20)
	CREATE  amountHighRiskResources  bigint(20)
	CREATE  amountHighRiskRoles  bigint(20)
	CREATE  amountLowRiskEntitlements  bigint(20)
	CREATE  amountLowRiskResources  bigint(20)
	CREATE  amountLowRiskRoles  bigint(20)
	CREATE  amountMediumRiskEntitlements  bigint(20)
	CREATE  amountMediumRiskResources  bigint(20)
	CREATE  amountMediumRiskRoles  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_DIRECTORY_RISK_DETAIL_FACT (
    dateCollect datetime not null,
    amountHighRiskEntitlements bigint,
    amountHighRiskResources bigint,
    amountHighRiskRoles bigint,
    amountLowRiskEntitlements bigint,
    amountLowRiskResources bigint,
    amountLowRiskRoles bigint,
    amountMediumRiskEntitlements bigint,
    amountMediumRiskResources bigint,
    amountMediumRiskRoles bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_PROVISIONING_CREATED_ENTRY_FACT
	CREATE  amountActivateAccountCreated  bigint(20)
	CREATE  amountAddMemberToOrganizationCreated  bigint(20)
	CREATE  amountAddMemberToRoleCreated  bigint(20)
	CREATE  amountChangePasswordCreated  bigint(20)
	CREATE  amountCreateAccountCreated  bigint(20)
	CREATE  amountCreateEntitlementCreated  bigint(20)
	CREATE  amountCreateOrganizationCreated  bigint(20)
	CREATE  amountCreateRoleCreated  bigint(20)
	CREATE  amountGrantEntitlementCreated  bigint(20)
	CREATE  amountInactivateAccountCreated  bigint(20)
	CREATE  amountRemoveAccountCreated  bigint(20)
	CREATE  amountRemoveEntitlementCreated  bigint(20)
	CREATE  amountRemoveMemberFromOrganizationCreated  bigint(20)
	CREATE  amountRemoveMemberFromRoleCreated  bigint(20)
	CREATE  amountRemoveOrganizationCreated  bigint(20)
	CREATE  amountRemoveRoleCreated  bigint(20)
	CREATE  amountRevokeEntitlementCreated  bigint(20)
	CREATE  amountUpdateAccountCreated  bigint(20)
	CREATE  amountUpdateEntitlementCreated  bigint(20)
	CREATE  amountUpdateOrganizationCreated  bigint(20)
	CREATE  amountUpdateRoleCreated  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_PROVISIONING_CREATED_ENTRY_FACT (
    dateCollect datetime not null,
    amountActivateAccountCreated bigint,
    amountAddMemberToOrganizationCreated bigint,
    amountAddMemberToRoleCreated bigint,
    amountChangePasswordCreated bigint,
    amountCreateAccountCreated bigint,
    amountCreateEntitlementCreated bigint,
    amountCreateOrganizationCreated bigint,
    amountCreateRoleCreated bigint,
    amountGrantEntitlementCreated bigint,
    amountInactivateAccountCreated bigint,
    amountRemoveAccountCreated bigint,
    amountRemoveEntitlementCreated bigint,
    amountRemoveMemberFromOrganizationCreated bigint,
    amountRemoveMemberFromRoleCreated bigint,
    amountRemoveOrganizationCreated bigint,
    amountRemoveRoleCreated bigint,
    amountRevokeEntitlementCreated bigint,
    amountUpdateAccountCreated bigint,
    amountUpdateEntitlementCreated bigint,
    amountUpdateOrganizationCreated bigint,
    amountUpdateRoleCreated bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_PROVISIONING_DETAIL_FACT
	CREATE  amountCreated  bigint(20)
	CREATE  amountCreatedByResourceAdapter  bigint(20)
	CREATE  amountCreatedByWorkflow  bigint(20)
	CREATE  amountFailedFinished  bigint(20)
	CREATE  amountFailedFinishedByResourceAdapter  bigint(20)
	CREATE  amountFailedFinishedByWorkflow  bigint(20)
	CREATE  amountSuccessfullyFinished  bigint(20)
	CREATE  amountSuccessfullyFinishedByResourceAdapter  bigint(20)
	CREATE  amountSuccessfullyFinishedByWorkflow  bigint(20)
	CREATE  amountWaitingManualExecution  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_PROVISIONING_DETAIL_FACT (
    dateCollect datetime not null,
    amountCreated bigint,
    amountCreatedByResourceAdapter bigint,
    amountCreatedByWorkflow bigint,
    amountFailedFinished bigint,
    amountFailedFinishedByResourceAdapter bigint,
    amountFailedFinishedByWorkflow bigint,
    amountSuccessfullyFinished bigint,
    amountSuccessfullyFinishedByResourceAdapter bigint,
    amountSuccessfullyFinishedByWorkflow bigint,
    amountWaitingManualExecution bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_PROVISIONING_FACT
	CREATE  amountProvisioningCanceled  bigint(20)
	CREATE  amountProvisioningCreated  bigint(20)
	CREATE  amountProvisioningError  bigint(20)
	CREATE  amountProvisioningFinished  bigint(20)
	CREATE  amountProvisioningProcessNotFound  bigint(20)
	CREATE  amountProvisioningProcessed  bigint(20)
	CREATE  amountResourceAdapterType  bigint(20)
	CREATE  amountWorkflowType  bigint(20)
	CREATE  averageProvisioningCompletitionTime  bigint(20)
	CREATE  averageProvisioningTimeForResourceAdapterType  bigint(20)
	CREATE  averageProvisioningTimeForWorkflowType  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_PROVISIONING_FACT (
    dateCollect datetime not null,
    amountProvisioningCanceled bigint,
    amountProvisioningCreated bigint,
    amountProvisioningError bigint,
    amountProvisioningFinished bigint,
    amountProvisioningProcessNotFound bigint,
    amountProvisioningProcessed bigint,
    amountResourceAdapterType bigint,
    amountWorkflowType bigint,
    averageProvisioningCompletitionTime bigint,
    averageProvisioningTimeForResourceAdapterType bigint,
    averageProvisioningTimeForWorkflowType bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_PROVISIONING_FINISHED_ENTRY_FACT
	CREATE  amountActivateAccountFinished  bigint(20)
	CREATE  amountAddMemberToOrganizationFinished  bigint(20)
	CREATE  amountAddMemberToRoleFinished  bigint(20)
	CREATE  amountChangePasswordFinished  bigint(20)
	CREATE  amountCreateAccountFinished  bigint(20)
	CREATE  amountCreateEntitlementFinished  bigint(20)
	CREATE  amountCreateOrganizationFinished  bigint(20)
	CREATE  amountCreateRoleFinished  bigint(20)
	CREATE  amountGrantEntitlementFinished  bigint(20)
	CREATE  amountInactivateAccountFinished  bigint(20)
	CREATE  amountRemoveAccountFinished  bigint(20)
	CREATE  amountRemoveEntitlementFinished  bigint(20)
	CREATE  amountRemoveMemberFromOrganizationFinished  bigint(20)
	CREATE  amountRemoveMemberFromRoleFinished  bigint(20)
	CREATE  amountRemoveOrganizationFinished  bigint(20)
	CREATE  amountRemoveRoleFinished  bigint(20)
	CREATE  amountRevokeEntitlementFinished  bigint(20)
	CREATE  amountUpdateAccountFinished  bigint(20)
	CREATE  amountUpdateEntitlementFinished  bigint(20)
	CREATE  amountUpdateOrganizationFinished  bigint(20)
	CREATE  amountUpdateRoleFinished  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_PROVISIONING_FINISHED_ENTRY_FACT (
    dateCollect datetime not null,
    amountActivateAccountFinished bigint,
    amountAddMemberToOrganizationFinished bigint,
    amountAddMemberToRoleFinished bigint,
    amountChangePasswordFinished bigint,
    amountCreateAccountFinished bigint,
    amountCreateEntitlementFinished bigint,
    amountCreateOrganizationFinished bigint,
    amountCreateRoleFinished bigint,
    amountGrantEntitlementFinished bigint,
    amountInactivateAccountFinished bigint,
    amountRemoveAccountFinished bigint,
    amountRemoveEntitlementFinished bigint,
    amountRemoveMemberFromOrganizationFinished bigint,
    amountRemoveMemberFromRoleFinished bigint,
    amountRemoveOrganizationFinished bigint,
    amountRemoveRoleFinished bigint,
    amountRevokeEntitlementFinished bigint,
    amountUpdateAccountFinished bigint,
    amountUpdateEntitlementFinished bigint,
    amountUpdateOrganizationFinished bigint,
    amountUpdateRoleFinished bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_PROVISIONING_TASK_FACT
	CREATE  createdTasks  bigint(20)
	CREATE  dateCollect  datetime
	CREATE  doneTasks  bigint(20)
	CREATE  resolvedTasks  bigint(20)
	CREATE  todoTasks  bigint(20)
	CREATE  waitingAssignTasks  bigint(20)
*/

create table ANALYTICS_PROVISIONING_TASK_FACT (
    dateCollect datetime not null,
    createdTasks bigint,
    doneTasks bigint,
    resolvedTasks bigint,
    todoTasks bigint,
    waitingAssignTasks bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_RECONCILIATION_FACT
	CREATE  amountBatches  bigint(20)
	CREATE  amountNotProcessed  bigint(20)
	CREATE  amountProcessedWithError  bigint(20)
	CREATE  amountProcessedWithoutWorkflow  bigint(20)
	CREATE  amountReconciliationsByPeriod  bigint(20)
	CREATE  averageReconciliationTime  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_RECONCILIATION_FACT (
    dateCollect datetime not null,
    amountBatches bigint,
    amountNotProcessed bigint,
    amountProcessedWithError bigint,
    amountProcessedWithoutWorkflow bigint,
    amountReconciliationsByPeriod bigint,
    averageReconciliationTime bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;
    
/*
CREATE  ANALYTICS_RECONCILIATION_SITUATION_DIMENSION
	CREATE  id  bigint(20)
	CREATE  schemaa  varchar(255)
	CREATE  situationName  varchar(255)
*/

create table ANALYTICS_RECONCILIATION_SITUATION_DIMENSION (
    id bigint not null auto_increment,
    schemaa varchar(255),
    situationName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_RECONCILIATION_SITUATION_FACT
	CREATE  amount  bigint(20)
	CREATE  dateCollect  datetime
	CREATE  id  bigint(20)
	CREATE  situationDimension_id  bigint(20)
*/

create table ANALYTICS_RECONCILIATION_SITUATION_FACT (
    id bigint not null auto_increment,
    amount bigint,
    dateCollect datetime not null,
    situationDimension_id bigint not null,
    primary key (id)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_REQUEST_APPROVAL_TASK_DETAIL_FACT
	CREATE  amountOpenApprovalAssignEntitlementTasksByPeriod  bigint(20)
	CREATE  amountOpenApprovalAssignRoleTasksByPeriod  bigint(20)
	CREATE  amountOpenApprovalCreateAccountTasksByPeriod  bigint(20)
	CREATE  amountOpenApprovalTaskByPeriod  bigint(20)
	CREATE  amountResolvedApprovalAssignEntitlementTasksByPeriod  bigint(20)
	CREATE  amountResolvedApprovalAssignRoleTasksByPeriod  bigint(20)
	CREATE  amountResolvedApprovalCreateAccountTasksByPeriod  bigint(20)
	CREATE  amountResolvedApprovalTasksByPeriod  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_REQUEST_APPROVAL_TASK_DETAIL_FACT (
    dateCollect datetime not null,
    amountOpenApprovalAssignEntitlementTasksByPeriod bigint,
    amountOpenApprovalAssignRoleTasksByPeriod bigint,
    amountOpenApprovalCreateAccountTasksByPeriod bigint,
    amountOpenApprovalTaskByPeriod bigint,
    amountResolvedApprovalAssignEntitlementTasksByPeriod bigint,
    amountResolvedApprovalAssignRoleTasksByPeriod bigint,
    amountResolvedApprovalCreateAccountTasksByPeriod bigint,
    amountResolvedApprovalTasksByPeriod bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_REQUEST_AVERAGE_FACT
	CREATE  averageActivateAccountRequestTime  bigint(20)
	CREATE  averageApprovalRequestTime  bigint(20)
	CREATE  averageAssignEntitlementRequestTime  bigint(20)
	CREATE  averageAssignRoleRequestsTime  bigint(20)
	CREATE  averageChangeStatusUserRequestTime  bigint(20)
	CREATE  averageCreateAccountRequestTime  bigint(20)
	CREATE  averageGeneralRequestTime  bigint(20)
	CREATE  averageInactivateAccountRequestTime  bigint(20)
	CREATE  averageLockUserRequestTime  bigint(20)
	CREATE  averageNewUserRequestTime  bigint(20)
	CREATE  averageProvisioningRequestTime  bigint(20)
	CREATE  averageRemoveAccountRequestTime  bigint(20)
	CREATE  averageRemoveEntitlementFromAccountRequestTime  bigint(20)
	CREATE  averageRemoveUserFromRoleRequestTime  bigint(20)
	CREATE  averageRemoveUserRequestTime  bigint(20)
	CREATE  averageResetPasswordRequestTime  bigint(20)
	CREATE  averageSodRequestTime  bigint(20)
	CREATE  averageUnlockUserRequestTime  bigint(20)
	CREATE  averageUpdateAccountRequestTime  bigint(20)
	CREATE  averageUpdateUserRequestTime  bigint(20)
	CREATE  date  datetime
*/

create table ANALYTICS_REQUEST_AVERAGE_FACT (
    date datetime not null,
    averageActivateAccountRequestTime bigint,
    averageApprovalRequestTime bigint,
    averageAssignEntitlementRequestTime bigint,
    averageAssignRoleRequestsTime bigint,
    averageChangeStatusUserRequestTime bigint,
    averageCreateAccountRequestTime bigint,
    averageGeneralRequestTime bigint,
    averageInactivateAccountRequestTime bigint,
    averageLockUserRequestTime bigint,
    averageNewUserRequestTime bigint,
    averageProvisioningRequestTime bigint,
    averageRemoveAccountRequestTime bigint,
    averageRemoveEntitlementFromAccountRequestTime bigint,
    averageRemoveUserFromRoleRequestTime bigint,
    averageRemoveUserRequestTime bigint,
    averageResetPasswordRequestTime bigint,
    averageSodRequestTime bigint,
    averageUnlockUserRequestTime bigint,
    averageUpdateAccountRequestTime bigint,
    averageUpdateUserRequestTime bigint,
    primary key (date)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_REQUEST_DETAIL_CREATED_GENERAL_FACT
	CREATE  amountActivateAccountRequests  bigint(20)
	CREATE  amountAssignEntitlementRequests  bigint(20)
	CREATE  amountAssignRoleRequests  bigint(20)
	CREATE  amountChangeStatusUserRequests  bigint(20)
	CREATE  amountCreateAccountRequests  bigint(20)
	CREATE  amountInactivateAccountRequests  bigint(20)
	CREATE  amountLockUserRequests  bigint(20)
	CREATE  amountNewUserRequests  bigint(20)
	CREATE  amountRemoveAccountRequests  bigint(20)
	CREATE  amountRemoveEntitlementFromAccountRequests  bigint(20)
	CREATE  amountRemoveUserFromRoleRequests  bigint(20)
	CREATE  amountRemoveUserRequests  bigint(20)
	CREATE  amountRequests  bigint(20)
	CREATE  amountResetPasswordRequests  bigint(20)
	CREATE  amountUnlockUserRequests  bigint(20)
	CREATE  amountUpdateAccountRequests  bigint(20)
	CREATE  amountUpdateUserRequests  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_REQUEST_DETAIL_CREATED_GENERAL_FACT (
    dateCollect datetime not null,
    amountActivateAccountRequests bigint,
    amountAssignEntitlementRequests bigint,
    amountAssignRoleRequests bigint,
    amountChangeStatusUserRequests bigint,
    amountCreateAccountRequests bigint,
    amountInactivateAccountRequests bigint,
    amountLockUserRequests bigint,
    amountNewUserRequests bigint,
    amountRemoveAccountRequests bigint,
    amountRemoveEntitlementFromAccountRequests bigint,
    amountRemoveUserFromRoleRequests bigint,
    amountRemoveUserRequests bigint,
    amountRequests bigint,
    amountResetPasswordRequests bigint,
    amountUnlockUserRequests bigint,
    amountUpdateAccountRequests bigint,
    amountUpdateUserRequests bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_REQUEST_DETAIL_CREATED_MANUAL_FACT
	CREATE  amountActivateAccountRequests  bigint(20)
	CREATE  amountAssignEntitlementRequests  bigint(20)
	CREATE  amountAssignRoleRequests  bigint(20)
	CREATE  amountChangeStatusUserRequests  bigint(20)
	CREATE  amountCreateAccountRequests  bigint(20)
	CREATE  amountInactivateAccountRequests  bigint(20)
	CREATE  amountLockUserRequests  bigint(20)
	CREATE  amountNewUserRequests  bigint(20)
	CREATE  amountRemoveAccountRequests  bigint(20)
	CREATE  amountRemoveEntitlementFromAccountRequests  bigint(20)
	CREATE  amountRemoveUserFromRoleRequests  bigint(20)
	CREATE  amountRemoveUserRequests  bigint(20)
	CREATE  amountRequests  bigint(20)
	CREATE  amountResetPasswordRequests  bigint(20)
	CREATE  amountUnlockUserRequests  bigint(20)
	CREATE  amountUpdateAccountRequests  bigint(20)
	CREATE  amountUpdateUserRequests  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_REQUEST_DETAIL_CREATED_MANUAL_FACT (
    dateCollect datetime not null,
    amountActivateAccountRequests bigint,
    amountAssignEntitlementRequests bigint,
    amountAssignRoleRequests bigint,
    amountChangeStatusUserRequests bigint,
    amountCreateAccountRequests bigint,
    amountInactivateAccountRequests bigint,
    amountLockUserRequests bigint,
    amountNewUserRequests bigint,
    amountRemoveAccountRequests bigint,
    amountRemoveEntitlementFromAccountRequests bigint,
    amountRemoveUserFromRoleRequests bigint,
    amountRemoveUserRequests bigint,
    amountRequests bigint,
    amountResetPasswordRequests bigint,
    amountUnlockUserRequests bigint,
    amountUpdateAccountRequests bigint,
    amountUpdateUserRequests bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_REQUEST_DETAIL_CREATED_SYSTEM_FACT
	CREATE  amountActivateAccountRequests  bigint(20)
	CREATE  amountAssignEntitlementRequests  bigint(20)
	CREATE  amountAssignRoleRequests  bigint(20)
	CREATE  amountChangeStatusUserRequests  bigint(20)
	CREATE  amountCreateAccountRequests  bigint(20)
	CREATE  amountInactivateAccountRequests  bigint(20)
	CREATE  amountLockUserRequests  bigint(20)
	CREATE  amountNewUserRequests  bigint(20)
	CREATE  amountRemoveAccountRequests  bigint(20)
	CREATE  amountRemoveEntitlementFromAccountRequests  bigint(20)
	CREATE  amountRemoveUserFromRoleRequests  bigint(20)
	CREATE  amountRemoveUserRequests  bigint(20)
	CREATE  amountRequests  bigint(20)
	CREATE  amountResetPasswordRequests  bigint(20)
	CREATE  amountUnlockUserRequests  bigint(20)
	CREATE  amountUpdateAccountRequests  bigint(20)
	CREATE  amountUpdateUserRequests  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_REQUEST_DETAIL_CREATED_SYSTEM_FACT (
    dateCollect datetime not null,
    amountActivateAccountRequests bigint,
    amountAssignEntitlementRequests bigint,
    amountAssignRoleRequests bigint,
    amountChangeStatusUserRequests bigint,
    amountCreateAccountRequests bigint,
    amountInactivateAccountRequests bigint,
    amountLockUserRequests bigint,
    amountNewUserRequests bigint,
    amountRemoveAccountRequests bigint,
    amountRemoveEntitlementFromAccountRequests bigint,
    amountRemoveUserFromRoleRequests bigint,
    amountRemoveUserRequests bigint,
    amountRequests bigint,
    amountResetPasswordRequests bigint,
    amountUnlockUserRequests bigint,
    amountUpdateAccountRequests bigint,
    amountUpdateUserRequests bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_REQUEST_DETAIL_FACT
	CREATE  amountApprovedRequests  bigint(20)
	CREATE  amountByActivateAccountType  bigint(20)
	CREATE  amountByApprovedStatus  bigint(20)
	CREATE  amountByAssignEntitlementType  bigint(20)
	CREATE  amountByAssignRoleType  bigint(20)
	CREATE  amountByBusinessProcessNotFoundStatus  bigint(20)
	CREATE  amountByCanceledStatus  bigint(20)
	CREATE  amountByChangeStatusAccountType  bigint(20)
	CREATE  amountByChangeStatusUserType  bigint(20)
	CREATE  amountByCreateAccountType  bigint(20)
	CREATE  amountByDisapprovedStatus  bigint(20)
	CREATE  amountByErrorStatus  bigint(20)
	CREATE  amountByFinalizedStatus  bigint(20)
	CREATE  amountByInactivateAccountType  bigint(20)
	CREATE  amountByLockUserType  bigint(20)
	CREATE  amountByMultipleRequestsType  bigint(20)
	CREATE  amountByNewUserType  bigint(20)
	CREATE  amountByRemoveAccountType  bigint(20)
	CREATE  amountByRemoveEntitlementFromAccountType  bigint(20)
	CREATE  amountByRemoveUserFromRoleType  bigint(20)
	CREATE  amountByRemoveUserType  bigint(20)
	CREATE  amountByResetPasswordType  bigint(20)
	CREATE  amountBySodNotAllowedStatus  bigint(20)
	CREATE  amountBySuccessStatus  bigint(20)
	CREATE  amountByUnlockUserType  bigint(20)
	CREATE  amountByUpdateAccountType  bigint(20)
	CREATE  amountByUpdateUserType  bigint(20)
	CREATE  amountByValidationErrorStatus  bigint(20)
	CREATE  amountByWaitingApprovalStatus  bigint(20)
	CREATE  amountCreatedRequests  bigint(20)
	CREATE  amountEffectedRequests  bigint(20)
	CREATE  amountFinishedRequests  bigint(20)
	CREATE  amountGeneratedBySystem  bigint(20)
	CREATE  amountGeneratedByUser  bigint(20)
	CREATE  amountNeededApprovalRequests  bigint(20)
	CREATE  amountNeededSodRequests  bigint(20)
	CREATE  amountNotApprovedRequests  bigint(20)
	CREATE  amountNotNeededApprovalRequests  bigint(20)
	CREATE  amountNotNeededSodRequests  bigint(20)
	CREATE  amountSodAllowedRequests  bigint(20)
	CREATE  amountSodNotAllowedRequests  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_REQUEST_DETAIL_FACT (
    dateCollect datetime not null,
    amountApprovedRequests bigint,
    amountByActivateAccountType bigint,
    amountByApprovedStatus bigint,
    amountByAssignEntitlementType bigint,
    amountByAssignRoleType bigint,
    amountByBusinessProcessNotFoundStatus bigint,
    amountByCanceledStatus bigint,
    amountByChangeStatusUserType bigint,
    amountByCreateAccountType bigint,
    amountByDisapprovedStatus bigint,
    amountByErrorStatus bigint,
    amountByFinalizedStatus bigint,
    amountByInactivateAccountType bigint,
    amountByLockUserType bigint,
    amountByMultipleRequestsType bigint,
    amountByNewUserType bigint,
    amountByRemoveAccountType bigint,
    amountByRemoveEntitlementFromAccountType bigint,
    amountByRemoveUserFromRoleType bigint,
    amountByRemoveUserType bigint,
    amountByResetPasswordType bigint,
    amountBySodNotAllowedStatus bigint,
    amountBySuccessStatus bigint,
    amountByUnlockUserType bigint,
    amountByUpdateAccountType bigint,
    amountByUpdateUserType bigint,
    amountByValidationErrorStatus bigint,
    amountByWaitingApprovalStatus bigint,
    amountCreatedRequests bigint,
    amountEffectedRequests bigint,
    amountFinishedRequests bigint,
    amountGeneratedBySystem bigint,
    amountGeneratedByUser bigint,
    amountNeededApprovalRequests bigint,
    amountNeededSodRequests bigint,
    amountNotApprovedRequests bigint,
    amountNotNeededApprovalRequests bigint,
    amountNotNeededSodRequests bigint,
    amountSodAllowedRequests bigint,
    amountSodNotAllowedRequests bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_REQUEST_DETAIL_FINALIZED_GENERAL_FACT
	CREATE  amountActivateAccountRequests  bigint(20)
	CREATE  amountAssignEntitlementRequests  bigint(20)
	CREATE  amountAssignRoleRequests  bigint(20)
	CREATE  amountChangeStatusUserRequests  bigint(20)
	CREATE  amountCreateAccountRequests  bigint(20)
	CREATE  amountInactivateAccountRequests  bigint(20)
	CREATE  amountLockUserRequests  bigint(20)
	CREATE  amountNewUserRequests  bigint(20)
	CREATE  amountRemoveAccountRequests  bigint(20)
	CREATE  amountRemoveEntitlementFromAccountRequests  bigint(20)
	CREATE  amountRemoveUserFromRoleRequests  bigint(20)
	CREATE  amountRemoveUserRequests  bigint(20)
	CREATE  amountRequests  bigint(20)
	CREATE  amountResetPasswordRequests  bigint(20)
	CREATE  amountUnlockUserRequests  bigint(20)
	CREATE  amountUpdateAccountRequests  bigint(20)
	CREATE  amountUpdateUserRequests  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_REQUEST_DETAIL_FINALIZED_GENERAL_FACT (
    dateCollect datetime not null,
    amountActivateAccountRequests bigint,
    amountAssignEntitlementRequests bigint,
    amountAssignRoleRequests bigint,
    amountChangeStatusUserRequests bigint,
    amountCreateAccountRequests bigint,
    amountInactivateAccountRequests bigint,
    amountLockUserRequests bigint,
    amountNewUserRequests bigint,
    amountRemoveAccountRequests bigint,
    amountRemoveEntitlementFromAccountRequests bigint,
    amountRemoveUserFromRoleRequests bigint,
    amountRemoveUserRequests bigint,
    amountRequests bigint,
    amountResetPasswordRequests bigint,
    amountUnlockUserRequests bigint,
    amountUpdateAccountRequests bigint,
    amountUpdateUserRequests bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_REQUEST_DETAIL_FINALIZED_MANUAL_FACT
	CREATE  amountActivateAccountRequests  bigint(20)
	CREATE  amountAssignEntitlementRequests  bigint(20)
	CREATE  amountAssignRoleRequests  bigint(20)
	CREATE  amountChangeStatusUserRequests  bigint(20)
	CREATE  amountCreateAccountRequests  bigint(20)
	CREATE  amountInactivateAccountRequests  bigint(20)
	CREATE  amountLockUserRequests  bigint(20)
	CREATE  amountNewUserRequests  bigint(20)
	CREATE  amountRemoveAccountRequests  bigint(20)
	CREATE  amountRemoveEntitlementFromAccountRequests  bigint(20)
	CREATE  amountRemoveUserFromRoleRequests  bigint(20)
	CREATE  amountRemoveUserRequests  bigint(20)
	CREATE  amountRequests  bigint(20)
	CREATE  amountResetPasswordRequests  bigint(20)
	CREATE  amountUnlockUserRequests  bigint(20)
	CREATE  amountUpdateAccountRequests  bigint(20)
	CREATE  amountUpdateUserRequests  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_REQUEST_DETAIL_FINALIZED_MANUAL_FACT (
    dateCollect datetime not null,
    amountActivateAccountRequests bigint,
    amountAssignEntitlementRequests bigint,
    amountAssignRoleRequests bigint,
    amountChangeStatusUserRequests bigint,
    amountCreateAccountRequests bigint,
    amountInactivateAccountRequests bigint,
    amountLockUserRequests bigint,
    amountNewUserRequests bigint,
    amountRemoveAccountRequests bigint,
    amountRemoveEntitlementFromAccountRequests bigint,
    amountRemoveUserFromRoleRequests bigint,
    amountRemoveUserRequests bigint,
    amountRequests bigint,
    amountResetPasswordRequests bigint,
    amountUnlockUserRequests bigint,
    amountUpdateAccountRequests bigint,
    amountUpdateUserRequests bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_REQUEST_DETAIL_FINALIZED_SYSTEM_FACT
	CREATE  amountActivateAccountRequests  bigint(20)
	CREATE  amountAssignEntitlementRequests  bigint(20)
	CREATE  amountAssignRoleRequests  bigint(20)
	CREATE  amountChangeStatusUserRequests  bigint(20)
	CREATE  amountCreateAccountRequests  bigint(20)
	CREATE  amountInactivateAccountRequests  bigint(20)
	CREATE  amountLockUserRequests  bigint(20)
	CREATE  amountNewUserRequests  bigint(20)
	CREATE  amountRemoveAccountRequests  bigint(20)
	CREATE  amountRemoveEntitlementFromAccountRequests  bigint(20)
	CREATE  amountRemoveUserFromRoleRequests  bigint(20)
	CREATE  amountRemoveUserRequests  bigint(20)
	CREATE  amountRequests  bigint(20)
	CREATE  amountResetPasswordRequests  bigint(20)
	CREATE  amountUnlockUserRequests  bigint(20)
	CREATE  amountUpdateAccountRequests  bigint(20)
	CREATE  amountUpdateUserRequests  bigint(20)
	CREATE  dateCollect  datetime
*/

create table ANALYTICS_REQUEST_DETAIL_FINALIZED_SYSTEM_FACT (
    dateCollect datetime not null,
    amountActivateAccountRequests bigint,
    amountAssignEntitlementRequests bigint,
    amountAssignRoleRequests bigint,
    amountChangeStatusUserRequests bigint,
    amountCreateAccountRequests bigint,
    amountInactivateAccountRequests bigint,
    amountLockUserRequests bigint,
    amountNewUserRequests bigint,
    amountRemoveAccountRequests bigint,
    amountRemoveEntitlementFromAccountRequests bigint,
    amountRemoveUserFromRoleRequests bigint,
    amountRemoveUserRequests bigint,
    amountRequests bigint,
    amountResetPasswordRequests bigint,
    amountUnlockUserRequests bigint,
    amountUpdateAccountRequests bigint,
    amountUpdateUserRequests bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_REQUEST_FACT
	CREATE  assignEntitlementAverage  bigint(20)
	CREATE  assignRoleAverage  bigint(20)
	CREATE  averageApprovingTime  bigint(20)
	CREATE  averageFinishingTime  bigint(20)
	CREATE  changeStatusAccountAverage  bigint(20)
	CREATE  changeStatusUserAverage  bigint(20)
	CREATE  createAccountAverage  bigint(20)
	CREATE  date  datetime
	CREATE  multipleRequestsAverage  bigint(20)
	CREATE  newUserAverage  bigint(20)
	CREATE  removeAccountAverage  bigint(20)
	CREATE  removeEntitlementFromAccountAverage  bigint(20)
	CREATE  removeUserAverage  bigint(20)
	CREATE  resetPasswordAverage  bigint(20)
	CREATE  updateUserAverage  bigint(20)
*/

create table ANALYTICS_REQUEST_FACT (
    date datetime not null,
    assignEntitlementAverage bigint,
    assignRoleAverage bigint,
    averageApprovingTime bigint,
    averageFinishingTime bigint,
    changeStatusAccountAverage bigint,
    changeStatusUserAverage bigint,
    createAccountAverage bigint,
    multipleRequestsAverage bigint,
    newUserAverage bigint,
    removeAccountAverage bigint,
    removeEntitlementFromAccountAverage bigint,
    removeUserAverage bigint,
    resetPasswordAverage bigint,
    updateUserAverage bigint,
    primary key (date)
) ENGINE=InnoDB;

/*
UPDATE  ANALYTICS_REQUEST_FASTEST_APPROVERS
	CREATE  amount  bigint(20)
	REMOVE  averageApprovalTime  bigint(20)
*/

ALTER TABLE ANALYTICS_REQUEST_FASTEST_APPROVERS ADD COLUMN amount  bigint;

ALTER TABLE ANALYTICS_REQUEST_FASTEST_APPROVERS DROP COLUMN averageApprovalTime;

/*
CREATE  ANALYTICS_REQUEST_HIGH_AMOUNT_APPROVERS
	CREATE  amount  bigint(20)
	CREATE  displayName  varchar(255)
	CREATE  userId  bigint(20)
*/

create table ANALYTICS_REQUEST_HIGH_AMOUNT_APPROVERS (
    userId bigint not null,
    displayName varchar(255) not null,
    amount bigint not null,
    primary key (userId)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_REQUEST_LESS_AMOUNT_APPROVERS
	CREATE  amount  bigint(20)
	CREATE  displayName  varchar(255)
	CREATE  userId  bigint(20)
*/

create table ANALYTICS_REQUEST_LESS_AMOUNT_APPROVERS (
    userId bigint not null,
    displayName varchar(255) not null,
    amount bigint not null,
    primary key (userId)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_TASK_DAILY_FACT
	CREATE  date  datetime
	CREATE  resolvedAfterADayFromCreation  bigint(20)
	CREATE  resolvedOnSameDayOfCreation  bigint(20)
	CREATE  resolvedWithinADayAfterCreation  bigint(20)
	CREATE  totalCreatedTasks  bigint(20)
	CREATE  totalResolvedTasks  bigint(20)
*/

create table ANALYTICS_TASK_DAILY_FACT (
    date datetime not null,
    resolvedAfterADayFromCreation bigint,
    resolvedOnSameDayOfCreation bigint,
    resolvedWithinADayAfterCreation bigint,
    totalCreatedTasks bigint,
    totalResolvedTasks bigint,
    primary key (date)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_TASK_DEADLINE_FACT
	CREATE  averageDelayedTimeBetweenFinishedDateAndDeadline  bigint(20)
	CREATE  date  datetime
	CREATE  totalFinishedTasksWithDelayedDeadline  bigint(20)
	CREATE  totalOpenedTasksWithDelayedDeadline  bigint(20)
*/

create table ANALYTICS_TASK_DEADLINE_FACT (
    date datetime not null,
    averageDelayedTimeBetweenFinishedDateAndDeadline bigint,
    totalFinishedTasksWithDelayedDeadline bigint,
    totalOpenedTasksWithDelayedDeadline bigint,
    primary key (date)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_TASK_FACT
	CREATE  averageTimeBetweenCreationAndResolution  bigint(20)
	CREATE  date  datetime
	CREATE  totalApprovedTasks  bigint(20)
	CREATE  totalCriticalPriorityTasks  bigint(20)
	CREATE  totalCriticalPriorityTodoTasks  bigint(20)
	CREATE  totalCriticalPriorityWaitingAssignTasks  bigint(20)
	CREATE  totalDisapprovedTasks  bigint(20)
	CREATE  totalDoneTasks  bigint(20)
	CREATE  totalHighPriorityTasks  bigint(20)
	CREATE  totalHighPriorityTodoTasks  bigint(20)
	CREATE  totalHighPriorityWaitingAssignTasks  bigint(20)
	CREATE  totalLowPriorityTasks  bigint(20)
	CREATE  totalLowPriorityTodoTasks  bigint(20)
	CREATE  totalLowPriorityWaitingAssignTasks  bigint(20)
	CREATE  totalMediumPriorityTasks  bigint(20)
	CREATE  totalMediumPriorityTodoTasks  bigint(20)
	CREATE  totalMediumPriorityWaitingAssignTasks  bigint(20)
	CREATE  totalTodoTasks  bigint(20)
	CREATE  totalWaitingAssignTasks  bigint(20)
*/

create table ANALYTICS_TASK_FACT (
    date datetime not null,
    averageTimeBetweenCreationAndResolution bigint,
    totalApprovedTasks bigint,
    totalCriticalPriorityTasks bigint,
    totalCriticalPriorityTodoTasks bigint,
    totalCriticalPriorityWaitingAssignTasks bigint,
    totalDisapprovedTasks bigint,
    totalDoneTasks bigint,
    totalHighPriorityTasks bigint,
    totalHighPriorityTodoTasks bigint,
    totalHighPriorityWaitingAssignTasks bigint,
    totalLowPriorityTasks bigint,
    totalLowPriorityTodoTasks bigint,
    totalLowPriorityWaitingAssignTasks bigint,
    totalMediumPriorityTasks bigint,
    totalMediumPriorityTodoTasks bigint,
    totalMediumPriorityWaitingAssignTasks bigint,
    totalTodoTasks bigint,
    totalWaitingAssignTasks bigint,
    primary key (date)
) ENGINE=InnoDB;

/*
CREATE  ANALYTICS_TASK_QUEUE_FACT
	CREATE  amountTask  bigint(20)
	CREATE  dateCollect  datetime
	CREATE  id  bigint(20)
	CREATE  queue  varchar(255)
*/

create table ANALYTICS_TASK_QUEUE_FACT (
    id bigint not null auto_increment,
    amountTask bigint,
    dateCollect datetime,
    queue varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
CREATE  AccountNotificationSettings
	CREATE  enabled  tinyint(1)
	CREATE  id  bigint(20)
	CREATE  subject  varchar(1000)
	CREATE  template  longtext
	CREATE  type  varchar(255)
*/

create table AccountNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
UPDATE  BlazonRequest
	CREATE  approvalProcess  varchar(255)
	CREATE  provisioningFinishedAt  datetime
	CREATE  provisioningStartedAt  datetime
	CREATE  sodProcess  varchar(255)
	REMOVE  dependsOnId  bigint(20)
*/

ALTER TABLE BlazonRequest ADD COLUMN approvalProcess  varchar(255);

ALTER TABLE BlazonRequest ADD COLUMN provisioningFinishedAt  datetime;

ALTER TABLE BlazonRequest ADD COLUMN provisioningStartedAt  datetime;

ALTER TABLE BlazonRequest ADD COLUMN sodProcess  varchar(255);

ALTER TABLE BlazonRequest DROP COLUMN dependsOnId;

/*
CREATE  BlazonRequestApprovalTask
	CREATE  disapprovalJustification  varchar(1000)
	CREATE  entryId  bigint(20)
	CREATE  entryType  varchar(255)
	CREATE  id  bigint(20)
	CREATE  justification  varchar(1000)
	CREATE  request_id  bigint(20)
	CREATE  type  varchar(255)
*/

create table BlazonRequestApprovalTask (
    disapprovalJustification varchar(1000),
    id bigint not null,
    request_id bigint,
    primary key (id)
) ENGINE=InnoDB;

/*
CREATE  BlazonRequestNotificationSettings
	CREATE  enabled  tinyint(1)
	CREATE  id  bigint(20)
	CREATE  subject  varchar(1000)
	CREATE  template  longtext
	CREATE  type  varchar(255)
*/

create table BlazonRequestNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
CREATE  BlazonRequestSodApprovalTask
	CREATE  id  bigint(20)
	CREATE  justification  varchar(1000)
	CREATE  request_id  bigint(20)
*/

create table BlazonRequestSodApprovalTask (
    justification varchar(1000),
    id bigint not null,
    request_id bigint,
    primary key (id)
) ENGINE=InnoDB;

/*
CREATE  CertificationApprovalTask
	CREATE  certificationEntry_id  bigint(20)
	CREATE  entryId  bigint(20)
	CREATE  entryType  varchar(255)
	CREATE  id  bigint(20)
	CREATE  justification  varchar(1000)
	CREATE  revokedJustification  varchar(1000)
*/

create table CertificationApprovalTask (
    entryId bigint,
    entryType varchar(255),
    justification varchar(1000),
    revokedJustification varchar(1000),
    id bigint not null,
    certificationEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;

/*
UPDATE  CertificationEntry
	CREATE  uncertifiedEntryAction  varchar(255)
	REMOVE  revokeUncertifiedEntry  bit(1)
*/

ALTER TABLE CertificationEntry ADD COLUMN uncertifiedEntryAction  varchar(255);

ALTER TABLE CertificationEntry DROP COLUMN revokeUncertifiedEntry;

/*
CREATE  CertificationNotificationSettings
	CREATE  enabled  tinyint(1)
	CREATE  id  bigint(20)
	CREATE  subject  varchar(1000)
	CREATE  template  longtext
	CREATE  type  varchar(255)
*/

create table CertificationNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
UPDATE  CertificationPolicy
	CREATE  limitOfEntriesByExecution  int(11)
	CREATE  uncertifiedEntryAction  varchar(255)
	CREATE  userFilterRules  longtext
	REMOVE  revokeUncertifiedEntry  tinyint(1)
*/

ALTER TABLE CertificationPolicy ADD COLUMN limitOfEntriesByExecution  integer;

ALTER TABLE CertificationPolicy ADD COLUMN uncertifiedEntryAction  varchar(255);

ALTER TABLE CertificationPolicy ADD COLUMN userFilterRules  longtext;

ALTER TABLE CertificationPolicy DROP COLUMN revokeUncertifiedEntry;

/*
UPDATE  CertificationSelector
	CREATE  uncertifiedAccountAction  varchar(255)
	CREATE  uncertifiedMembershipEntitlementAction  varchar(255)
	CREATE  uncertifiedMembershipRoleAction  varchar(255)
	REMOVE  certificationUserWorkflowName  varchar(255)
	REMOVE  revokeUncertifiedAccount  tinyint(1)
	REMOVE  revokeUncertifiedMembershipEntitlement  tinyint(1)
	REMOVE  revokeUncertifiedMembershipRole  tinyint(1)
	REMOVE  revokeUncertifiedUser  tinyint(1)
*/

ALTER TABLE CertificationSelector ADD COLUMN uncertifiedAccountAction  varchar(255);

ALTER TABLE CertificationSelector ADD COLUMN uncertifiedMembershipEntitlementAction  varchar(255);

ALTER TABLE CertificationSelector ADD COLUMN uncertifiedMembershipRoleAction  varchar(255);

ALTER TABLE CertificationSelector DROP COLUMN certificationUserWorkflowName;

ALTER TABLE CertificationSelector DROP COLUMN revokeUncertifiedAccount;

ALTER TABLE CertificationSelector DROP COLUMN revokeUncertifiedMembershipEntitlement;

ALTER TABLE CertificationSelector DROP COLUMN revokeUncertifiedMembershipRole;

ALTER TABLE CertificationSelector DROP COLUMN revokeUncertifiedUser;

/*
CREATE  MembershipEntitlementNotificationSettings
	CREATE  enabled  tinyint(1)
	CREATE  id  bigint(20)
	CREATE  subject  varchar(1000)
	CREATE  template  longtext
	CREATE  type  varchar(255)
*/

create table MembershipEntitlementNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
CREATE  MembershipRoleNotificationSettings
	CREATE  enabled  tinyint(1)
	CREATE  id  bigint(20)
	CREATE  subject  varchar(1000)
	CREATE  template  longtext
	CREATE  type  varchar(255)
*/

create table MembershipRoleNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
UPDATE  NotificationListenerInstance
	REMOVE  bean  varchar(255)
*/

ALTER TABLE NotificationListenerInstance DROP COLUMN bean;

/*
UPDATE  OrganizationProvisioningProfile
	CREATE  addMemberToOrganizationProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  addMemberToOrganizationProvisioningTaskQueueIdentifier  bigint(20)
	CREATE  createOrganizationProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  createOrganizationProvisioningTaskQueueIdentifier  bigint(20)
	CREATE  removeMemberOfOrganizationProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  removeMemberOfOrganizationProvisioningTaskQueueIdentifier  bigint(20)
	CREATE  removeOrganizationProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  removeOrganizationProvisioningTaskQueueIdentifier  bigint(20)
	CREATE  updateOrganizationProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  updateOrganizationProvisioningTaskQueueIdentifier  bigint(20)
*/

ALTER TABLE OrganizationProvisioningProfile ADD COLUMN addMemberToOrganizationProvisioningTaskDefinitionIdentifier bigint;

ALTER TABLE OrganizationProvisioningProfile ADD COLUMN addMemberToOrganizationProvisioningTaskQueueIdentifier bigint;

ALTER TABLE OrganizationProvisioningProfile ADD COLUMN createOrganizationProvisioningTaskDefinitionIdentifier bigint;

ALTER TABLE OrganizationProvisioningProfile ADD COLUMN createOrganizationProvisioningTaskQueueIdentifier bigint;

ALTER TABLE OrganizationProvisioningProfile ADD COLUMN removeMemberOfOrganizationProvisioningTaskDefinitionIdentifier bigint;

ALTER TABLE OrganizationProvisioningProfile ADD COLUMN removeMemberOfOrganizationProvisioningTaskQueueIdentifier bigint;

ALTER TABLE OrganizationProvisioningProfile ADD COLUMN removeOrganizationProvisioningTaskDefinitionIdentifier bigint;

ALTER TABLE OrganizationProvisioningProfile ADD COLUMN removeOrganizationProvisioningTaskQueueIdentifier bigint;

ALTER TABLE OrganizationProvisioningProfile ADD COLUMN updateOrganizationProvisioningTaskDefinitionIdentifier bigint;

ALTER TABLE OrganizationProvisioningProfile ADD COLUMN updateOrganizationProvisioningTaskQueueIdentifier bigint;

/*
CREATE  PasswordVaultNotificationSettings
	CREATE  enabled  tinyint(1)
	CREATE  id  bigint(20)
	CREATE  subject  varchar(1000)
	CREATE  template  longtext
	CREATE  type  varchar(255)
*/

create table PasswordVaultNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
UPDATE  ProvisioningEntry
	CREATE  provisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  provisioningTaskQueueIdentifier  bigint(20)
*/

ALTER TABLE ProvisioningEntry ADD COLUMN provisioningTaskDefinitionIdentifier bigint;

ALTER TABLE ProvisioningEntry ADD COLUMN provisioningTaskQueueIdentifier bigint;

/*
CREATE  ProvisioningNotificationSettings
	CREATE  enabled  tinyint(1)
	CREATE  id  bigint(20)
	CREATE  subject  varchar(1000)
	CREATE  template  longtext
	CREATE  type  varchar(255)
*/

create table ProvisioningNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
CREATE  ProvisioningTask
	CREATE  entryId  bigint(20)
	CREATE  entryType  varchar(255)
	CREATE  id  bigint(20)
	CREATE  justification  varchar(1000)
	CREATE  notProvisionedJustification  varchar(1000)
	CREATE  provisioningEntry_id  bigint(20)
*/

create table ProvisioningTask (
    notProvisionedJustification varchar(1000),
    id bigint not null,
    provisioningEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;

/*
CREATE  ReconciliationNotificationSettings
	CREATE  enabled  tinyint(1)
	CREATE  id  bigint(20)
	CREATE  subject  varchar(1000)
	CREATE  template  longtext
	CREATE  type  varchar(255)
*/

create table ReconciliationNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
UPDATE  ResourceProvisioningProfile
	CREATE  activateAccountProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  activateAccountProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  addMemberToEntitlementProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  addMemberToEntitlementProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  changePasswordProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  changePasswordProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  createAccountProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  createAccountProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  createEntitlementProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  createEntitlementProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  grantEntitlementProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  grantEntitlementProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  inactivateAccountProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  inactivateAccountProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  removeAccountProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  removeAccountProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  removeEntitlementProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  removeEntitlementProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  removeMemberOfEntitlementProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  removeMemberOfEntitlementProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  revokeEntitlementProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  revokeEntitlementProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  updateAccountProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  updateAccountProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  updateEntitlementProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  updateEntitlementProvisioningTaskQueueIdentifier  bigint(20)
*/

ALTER TABLE ResourceProvisioningProfile ADD COLUMN activateAccountProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE ResourceProvisioningProfile ADD COLUMN activateAccountProvisioningTaskQueueIdentifier bigint;

ALTER TABLE ResourceProvisioningProfile ADD COLUMN addMemberToEntitlementProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE ResourceProvisioningProfile ADD COLUMN addMemberToEntitlementProvisioningTaskQueueIdentifier bigint;

ALTER TABLE ResourceProvisioningProfile ADD COLUMN changePasswordProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE ResourceProvisioningProfile ADD COLUMN changePasswordProvisioningTaskQueueIdentifier bigint;

ALTER TABLE ResourceProvisioningProfile ADD COLUMN createAccountProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE ResourceProvisioningProfile ADD COLUMN createAccountProvisioningTaskQueueIdentifier bigint;

ALTER TABLE ResourceProvisioningProfile ADD COLUMN createEntitlementProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE ResourceProvisioningProfile ADD COLUMN createEntitlementProvisioningTaskQueueIdentifier bigint;

ALTER TABLE ResourceProvisioningProfile ADD COLUMN grantEntitlementProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE ResourceProvisioningProfile ADD COLUMN grantEntitlementProvisioningTaskQueueIdentifier bigint;

ALTER TABLE ResourceProvisioningProfile ADD COLUMN inactivateAccountProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE ResourceProvisioningProfile ADD COLUMN inactivateAccountProvisioningTaskQueueIdentifier bigint;

ALTER TABLE ResourceProvisioningProfile ADD COLUMN removeAccountProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE ResourceProvisioningProfile ADD COLUMN removeAccountProvisioningTaskQueueIdentifier bigint;

ALTER TABLE ResourceProvisioningProfile ADD COLUMN removeEntitlementProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE ResourceProvisioningProfile ADD COLUMN removeEntitlementProvisioningTaskQueueIdentifier bigint;

ALTER TABLE ResourceProvisioningProfile ADD COLUMN removeMemberOfEntitlementProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE ResourceProvisioningProfile ADD COLUMN removeMemberOfEntitlementProvisioningTaskQueueIdentifier bigint;

ALTER TABLE ResourceProvisioningProfile ADD COLUMN revokeEntitlementProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE ResourceProvisioningProfile ADD COLUMN revokeEntitlementProvisioningTaskQueueIdentifier bigint;

ALTER TABLE ResourceProvisioningProfile ADD COLUMN updateAccountProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE ResourceProvisioningProfile ADD COLUMN updateAccountProvisioningTaskQueueIdentifier bigint;

ALTER TABLE ResourceProvisioningProfile ADD COLUMN updateEntitlementProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE ResourceProvisioningProfile ADD COLUMN updateEntitlementProvisioningTaskQueueIdentifier bigint;

/*
UPDATE  RoleProvisioningProfile
	CREATE  addMemberToRoleProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  addMemberToRoleProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  createRoleProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  createRoleProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  removeMemberOfRoleProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  removeMemberOfRoleProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  removeRoleProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  removeRoleProvisioningTaskQueueIdentifier  bigint(20)
	
	CREATE  updateRoleProvisioningTaskDefinitionIdentifier  bigint(20)
	CREATE  updateRoleProvisioningTaskQueueIdentifier  bigint(20)
*/

ALTER TABLE RoleProvisioningProfile ADD COLUMN addMemberToRoleProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE RoleProvisioningProfile ADD COLUMN addMemberToRoleProvisioningTaskQueueIdentifier bigint;

ALTER TABLE RoleProvisioningProfile ADD COLUMN createRoleProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE RoleProvisioningProfile ADD COLUMN createRoleProvisioningTaskQueueIdentifier bigint;

ALTER TABLE RoleProvisioningProfile ADD COLUMN removeMemberOfRoleProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE RoleProvisioningProfile ADD COLUMN removeMemberOfRoleProvisioningTaskQueueIdentifier bigint;

ALTER TABLE RoleProvisioningProfile ADD COLUMN removeRoleProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE RoleProvisioningProfile ADD COLUMN removeRoleProvisioningTaskQueueIdentifier bigint;

ALTER TABLE RoleProvisioningProfile ADD COLUMN updateRoleProvisioningTaskDefinitionIdentifier bigint;
ALTER TABLE RoleProvisioningProfile ADD COLUMN updateRoleProvisioningTaskQueueIdentifier bigint;

/*
CREATE  RoleRightApprovalTask
	CREATE  id  bigint(20)
	CREATE  justification  varchar(1000)
	CREATE  roleRightEntry_id  bigint(20)
	CREATE  type  varchar(255)
*/

create table RoleRightApprovalTask (
    justification varchar(1000),
    type varchar(255),
    id bigint not null,
    roleRightEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;

/*
CREATE  RoleRightRevokeNotificationSettings
	CREATE  enabled  tinyint(1)
	CREATE  id  bigint(20)
	CREATE  subject  varchar(1000)
	CREATE  template  longtext
	CREATE  type  varchar(255)
*/

create table RoleRightRevokeNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
UPDATE  SelfServiceCartItem
	REMOVE  dependsOnId  bigint(20)
*/

ALTER TABLE SelfServiceCartItem DROP COLUMN dependsOnId;

/*
CREATE  SodApprovalTask
	CREATE  entryId  bigint(20)
	CREATE  entryType  varchar(255)
	CREATE  id  bigint(20)
	CREATE  justification  varchar(1000)
	CREATE  sodEntry_id  bigint(20)
*/

create table SodApprovalTask (
    entryId bigint,
    entryType varchar(255),
    justification varchar(1000),
    id bigint not null,
    sodEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;

/*
CREATE  SodNotificationSettings
	CREATE  enabled  tinyint(1)
	CREATE  id  bigint(20)
	CREATE  subject  varchar(1000)
	CREATE  template  longtext
	CREATE  type  varchar(255)
*/

create table SodNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
UPDATE  Task
	CREATE  actionId  int(11)
	REMOVE  description  varchar(255)
	REMOVE  generatedBySystem  tinyint(1)
	REMOVE  subject  varchar(255)
	REMOVE  workflow  varchar(255)
*/

ALTER TABLE Task ADD COLUMN actionId integer;

ALTER TABLE Task DROP COLUMN description;

ALTER TABLE Task DROP COLUMN generatedBySystem;

ALTER TABLE Task DROP COLUMN subject;

ALTER TABLE Task DROP COLUMN workflow;

/*
UPDATE  TaskDefinition
	REMOVE  keepNotifyingUser  bit(1)
	REMOVE  sendNotificationIfComments  tinyint(1)
	REMOVE  subject  varchar(255)
	REMOVE  templateUrl  varchar(255)
	REMOVE  workflow  varchar(255)
*/

ALTER TABLE TaskDefinition DROP COLUMN keepNotifyingUser;

ALTER TABLE TaskDefinition DROP COLUMN sendNotificationIfComments;

ALTER TABLE TaskDefinition DROP COLUMN subject;

ALTER TABLE TaskDefinition DROP COLUMN templateUrl;

ALTER TABLE TaskDefinition DROP COLUMN workflow;

/*
CREATE  TaskNotificationSettings
	CREATE  enabled  tinyint(1)
	CREATE  id  bigint(20)
	CREATE  subject  varchar(1000)
	CREATE  template  longtext
	CREATE  type  varchar(255)
*/

create table TaskNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
UPDATE  User
	CREATE  lastInactivatedAccountsVerifierExecutionDate  datetime
*/

ALTER TABLE User ADD COLUMN lastInactivatedAccountsVerifierExecutionDate datetime;

/*
CREATE  UserNotificationSettings
	CREATE  enabled  tinyint(1)
	CREATE  id  bigint(20)
	CREATE  subject  varchar(1000)
	CREATE  template  longtext
	CREATE  type  varchar(255)
*/

create table UserNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
CREATE  UsernamePasswordCredentialsVaultItem
	CREATE  createdAt  datetime
	CREATE  description  varchar(255)
	CREATE  id  bigint(20)
	CREATE  imageId  varchar(255)
	CREATE  modifiedAt  datetime
	CREATE  name  varchar(255)
	CREATE  ownerId  bigint(20)
	CREATE  password  varchar(255)
	CREATE  url  varchar(255)
	CREATE  username  varchar(255)
*/

create table UsernamePasswordCredentialsVaultItem (
    id bigint not null auto_increment,
    createdAt datetime,
    description varchar(255),
    imageId varchar(255),
    modifiedAt datetime,
    name varchar(255),
    ownerId bigint,
    password varchar(255),
    url varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;

/*
CREATE  VaultEntryPermission
	CREATE  credentialsVaultItemId  bigint(20)
	CREATE  id  bigint(20)
	CREATE  modify  tinyint(1)
	CREATE  readd  tinyint(1)
	CREATE  share  tinyint(1)
	CREATE  userId  bigint(20)
*/

create table VaultEntryPermission (
    id bigint not null auto_increment,
    credentialsVaultItemId bigint,
    modify boolean default false,
    readd boolean default false,
    share boolean default false,
    userId bigint,
    primary key (id)
) ENGINE=InnoDB;

/*
REMOVE  ANALYTICS_CERTIFICATION_HISTOGRAM

REMOVE  ANALYTICS_DIRECTORY_OBJECTS_CREATION_DETAIL_HISTOGRAM

REMOVE  ANALYTICS_DIRECTORY_OBJECTS_DETAIL_HISTOGRAM

REMOVE  ANALYTICS_DIRECTORY_OBJECTS_HISTOGRAM

REMOVE  ANALYTICS_DIRECTORY_RISK_DETAIL_HISTOGRAM

REMOVE  ANALYTICS_PROVISIONING_HISTOGRAM

REMOVE  ANALYTICS_RECONCILIATION_HISTOGRAM

REMOVE  ANALYTICS_REQUEST_DETAIL_HISTOGRAM

REMOVE  ANALYTICS_REQUEST_HISTOGRAM

REMOVE  ANALYTICS_TASK_DAILY_HISTOGRAM

REMOVE  ANALYTICS_TASK_DEADLINE_HISTOGRAM

REMOVE  ANALYTICS_TASK_HISTOGRAM

REMOVE  TaskData
*/

drop table ANALYTICS_CERTIFICATION_HISTOGRAM;

drop table ANALYTICS_DIRECTORY_OBJECTS_CREATION_DETAIL_HISTOGRAM;

drop table ANALYTICS_DIRECTORY_OBJECTS_DETAIL_HISTOGRAM;

drop table ANALYTICS_DIRECTORY_OBJECTS_HISTOGRAM;

drop table ANALYTICS_DIRECTORY_RISK_DETAIL_HISTOGRAM;

drop table ANALYTICS_PROVISIONING_HISTOGRAM;

drop table ANALYTICS_RECONCILIATION_HISTOGRAM;

drop table ANALYTICS_REQUEST_DETAIL_HISTOGRAM;

drop table ANALYTICS_REQUEST_HISTOGRAM;

drop table ANALYTICS_TASK_DAILY_HISTOGRAM;

drop table ANALYTICS_TASK_DEADLINE_HISTOGRAM;

drop table ANALYTICS_TASK_HISTOGRAM;

drop table TaskData;
