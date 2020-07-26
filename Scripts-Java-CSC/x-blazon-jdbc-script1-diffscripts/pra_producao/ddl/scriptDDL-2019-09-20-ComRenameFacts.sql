
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


create table AccountNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

ALTER TABLE BlazonRequest ADD COLUMN approvalProcess  varchar(255);

ALTER TABLE BlazonRequest ADD COLUMN provisioningFinishedAt  datetime;

ALTER TABLE BlazonRequest ADD COLUMN provisioningStartedAt  datetime;

ALTER TABLE BlazonRequest ADD COLUMN sodProcess  varchar(255);

ALTER TABLE BlazonRequest DROP COLUMN dependsOnId;

create table BlazonRequestApprovalTask (
    disapprovalJustification varchar(1000),
    id bigint not null,
    request_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table BlazonRequestNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table BlazonRequestSodApprovalTask (
    justification varchar(1000),
    id bigint not null,
    request_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table CertificationApprovalTask (
    entryId bigint,
    entryType varchar(255),
    justification varchar(1000),
    revokedJustification varchar(1000),
    id bigint not null,
    certificationEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;

ALTER TABLE CertificationEntry ADD COLUMN uncertifiedEntryAction  varchar(255);

ALTER TABLE CertificationEntry DROP COLUMN revokeUncertifiedEntry;

create table CertificationNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

ALTER TABLE CertificationPolicy ADD COLUMN limitOfEntriesByExecution  integer;

ALTER TABLE CertificationPolicy ADD COLUMN uncertifiedEntryAction  varchar(255);

ALTER TABLE CertificationPolicy ADD COLUMN userFilterRules  longtext;

ALTER TABLE CertificationPolicy DROP COLUMN revokeUncertifiedEntry;


ALTER TABLE CertificationSelector ADD COLUMN uncertifiedAccountAction  varchar(255);

ALTER TABLE CertificationSelector ADD COLUMN uncertifiedMembershipEntitlementAction  varchar(255);

ALTER TABLE CertificationSelector ADD COLUMN uncertifiedMembershipRoleAction  varchar(255);

ALTER TABLE CertificationSelector DROP COLUMN certificationUserWorkflowName;

ALTER TABLE CertificationSelector DROP COLUMN revokeUncertifiedAccount;

ALTER TABLE CertificationSelector DROP COLUMN revokeUncertifiedMembershipEntitlement;

ALTER TABLE CertificationSelector DROP COLUMN revokeUncertifiedMembershipRole;

ALTER TABLE CertificationSelector DROP COLUMN revokeUncertifiedUser;

create table MembershipEntitlementNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table MembershipRoleNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

ALTER TABLE NotificationListenerInstance DROP COLUMN bean;


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

create table PasswordVaultNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

ALTER TABLE ProvisioningEntry ADD COLUMN provisioningTaskDefinitionIdentifier bigint;

ALTER TABLE ProvisioningEntry ADD COLUMN provisioningTaskQueueIdentifier bigint;

create table ProvisioningNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ProvisioningTask (
    notProvisionedJustification varchar(1000),
    id bigint not null,
    provisioningEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ReconciliationNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

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

create table RoleRightApprovalTask (
    type varchar(255),
    id bigint not null,
    roleRightEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table RoleRightRevokeNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

ALTER TABLE SelfServiceCartItem DROP COLUMN dependsOnId;

create table SodApprovalTask (
    entryId bigint,
    entryType varchar(255),
    justification varchar(1000),
    id bigint not null,
    sodEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table SodNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

ALTER TABLE Task ADD COLUMN actionId integer;

ALTER TABLE Task DROP COLUMN description;

ALTER TABLE Task DROP COLUMN generatedBySystem;

ALTER TABLE Task DROP COLUMN subject;

ALTER TABLE Task DROP COLUMN workflow;


ALTER TABLE TaskDefinition DROP COLUMN keepNotifyingUser;

ALTER TABLE TaskDefinition DROP COLUMN sendNotificationIfComments;

ALTER TABLE TaskDefinition DROP COLUMN subject;

ALTER TABLE TaskDefinition DROP COLUMN templateUrl;

ALTER TABLE TaskDefinition DROP COLUMN workflow;


ALTER TABLE User ADD COLUMN lastInactivatedAccountsVerifierExecutionDate datetime;

create table UserNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

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

create table VaultEntryPermission (
    id bigint not null auto_increment,
    credentialsVaultItemId bigint,
    modify boolean default false,
    readd boolean default false,
    share boolean default false,
    userId bigint,
    primary key (id)
) ENGINE=InnoDB;

RENAME table ANALYTICS_CERTIFICATION_HISTOGRAM to ANALYTICS_CERTIFICATION_FACT;

RENAME table ANALYTICS_DIRECTORY_OBJECTS_CREATION_DETAIL_HISTOGRAM to ANALYTICS_DIRECTORY_OBJECTS_CREATION_DETAIL_FACT;

RENAME table ANALYTICS_DIRECTORY_OBJECTS_DETAIL_HISTOGRAM to ANALYTICS_DIRECTORY_OBJECTS_DETAIL_FACT;

RENAME table ANALYTICS_DIRECTORY_OBJECTS_HISTOGRAM to ANALYTICS_DIRECTORY_OBJECTS_FACT;

RENAME table ANALYTICS_DIRECTORY_RISK_DETAIL_HISTOGRAM to ANALYTICS_DIRECTORY_RISK_DETAIL_FACT;

RENAME table ANALYTICS_PROVISIONING_HISTOGRAM to ANALYTICS_PROVISIONING_FACT;

RENAME table ANALYTICS_RECONCILIATION_HISTOGRAM to ANALYTICS_RECONCILIATION_FACT;

RENAME table ANALYTICS_REQUEST_DETAIL_HISTOGRAM to ANALYTICS_REQUEST_DETAIL_FACT;

RENAME table ANALYTICS_REQUEST_HISTOGRAM to ANALYTICS_REQUEST_FACT;

RENAME table ANALYTICS_TASK_DAILY_HISTOGRAM to ANALYTICS_TASK_DAILY_FACT;

RENAME table ANALYTICS_TASK_DEADLINE_HISTOGRAM to ANALYTICS_TASK_DEADLINE_FACT;

RENAME table ANALYTICS_TASK_HISTOGRAM to ANALYTICS_TASK_FACT;

drop table TaskData;
