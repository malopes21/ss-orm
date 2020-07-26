RENAME TABLE ANALYTICS_CERTIFICATION_HISTOGRAM TO ANALYTICS_CERTIFICATION_FACT;

ALTER TABLE ANALYTICS_CERTIFICATION_FACT ADD COLUMN amountCertified bigint(20);
ALTER TABLE ANALYTICS_CERTIFICATION_FACT ADD COLUMN amountError bigint(20);
ALTER TABLE ANALYTICS_CERTIFICATION_FACT ADD COLUMN amountFinished bigint(20);
ALTER TABLE ANALYTICS_CERTIFICATION_FACT ADD COLUMN amountRevoked bigint(20);
ALTER TABLE ANALYTICS_CERTIFICATION_FACT ADD COLUMN amountWaitingApproval bigint(20);
ALTER TABLE ANALYTICS_CERTIFICATION_FACT ADD COLUMN approvalPercentage double;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT ADD COLUMN averageCompletionTime bigint(20);
ALTER TABLE ANALYTICS_CERTIFICATION_FACT ADD COLUMN revokePercentage double;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountAccountCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountCanceledAccountCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountCanceledEntitlementsAccountCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountCanceledMembershipGroupCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountCanceledUserCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountCertifiedAccountCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountCertifiedEntitlementsAccountCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountCertifiedMembershipGroupCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountCertifiedUserCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountEntitlementsAccountCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountErrorAccountCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountErrorEntitlementsAccountCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountErrorMembershipGroupCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountErrorUserCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountMembershipGroupCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountOpenedCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountRevokedAccountCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountRevokedEntitlementsAccountCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountRevokedMembershipGroupCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountRevokedUserCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN amountUserCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN averageCompletionTimeAccountCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN averageCompletionTimeEntitlementsAccountCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN averageCompletionTimeMembershipGroupCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN averageCompletionTimeUserCertifications;
ALTER TABLE ANALYTICS_CERTIFICATION_FACT DROP COLUMN averageTotalCompletionTime;


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


RENAME TABLE ANALYTICS_DIRECTORY_OBJECTS_CREATION_DETAIL_HISTOGRAM TO ANALYTICS_DIRECTORY_OBJECTS_CREATION_DETAIL_FACT;

ALTER TABLE ANALYTICS_DIRECTORY_OBJECTS_CREATION_DETAIL_FACT DROP COLUMN amountRolesByAssignmentPolicy;


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


create table ANALYTICS_PROVISIONING_TASK_FACT (
    dateCollect datetime not null,
    createdTasks bigint,
    doneTasks bigint,
    resolvedTasks bigint,
    todoTasks bigint,
    waitingAssignTasks bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;


RENAME TABLE ANALYTICS_RECONCILIATION_HISTOGRAM TO ANALYTICS_RECONCILIATION_FACT;

ALTER TABLE ANALYTICS_RECONCILIATION_FACT ADD COLUMN amountBatches bigint(20);
ALTER TABLE ANALYTICS_RECONCILIATION_FACT ADD COLUMN amountNotProcessed bigint(20);
ALTER TABLE ANALYTICS_RECONCILIATION_FACT ADD COLUMN amountProcessedWithError bigint(20);
ALTER TABLE ANALYTICS_RECONCILIATION_FACT ADD COLUMN amountProcessedWithoutWorkflow bigint(20);
ALTER TABLE ANALYTICS_RECONCILIATION_FACT ADD COLUMN amountReconciliationsByPeriod bigint(20);


create table ANALYTICS_RECONCILIATION_SITUATION_DIMENSION (
    id bigint not null auto_increment,
    schemaa varchar(255),
    situationName varchar(255),
    primary key (id)
) ENGINE=InnoDB;


create table ANALYTICS_RECONCILIATION_SITUATION_FACT (
    id bigint not null auto_increment,
    amount bigint,
    dateCollect datetime not null,
    situationDimension_id bigint not null,
    primary key (id)
) ENGINE=InnoDB;


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


RENAME TABLE ANALYTICS_REQUEST_DETAIL_HISTOGRAM TO ANALYTICS_REQUEST_DETAIL_FACT;

ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountApprovedRequests bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountByActivateAccountType bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountByInactivateAccountType bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountByLockUserType bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountByRemoveUserFromRoleType bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountBySodNotAllowedStatus bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountByUnlockUserType bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountByUpdateAccountType bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountByValidationErrorStatus bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountByWaitingApprovalStatus bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountNeededApprovalRequests bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountNeededSodRequests bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountNotApprovedRequests bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountNotNeededApprovalRequests bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountNotNeededSodRequests bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountSodAllowedRequests bigint(20);
ALTER TABLE ANALYTICS_REQUEST_DETAIL_FACT ADD COLUMN amountSodNotAllowedRequests bigint(20);


ALTER TABLE ANALYTICS_REQUEST_FASTEST_APPROVERS ADD COLUMN amount bigint(20);
ALTER TABLE ANALYTICS_REQUEST_FASTEST_APPROVERS DROP COLUMN averageApprovalTime;

create table ANALYTICS_REQUEST_HIGH_AMOUNT_APPROVERS (
    userId bigint not null,
    displayName varchar(255) not null,
    amount bigint not null,
    primary key (userId)
) ENGINE=InnoDB;


create table ANALYTICS_REQUEST_LESS_AMOUNT_APPROVERS (
    userId bigint not null,
    displayName varchar(255) not null,
    amount bigint not null,
    primary key (userId)
) ENGINE=InnoDB;


create table ANALYTICS_TASK_QUEUE_FACT (
    id bigint not null auto_increment,
    amountTask bigint,
    dateCollect datetime,
    queue varchar(255),
    primary key (id)
) ENGINE=InnoDB;

