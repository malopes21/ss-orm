DROP DATABASE IF EXISTS blazon;

CREATE DATABASE IF NOT EXISTS blazon;

USE blazon;

-- blazon schema


-- create tables

create table Account (
    lastPasswordModificationDate datetime,
    password varchar(255),
    primaryy bit,
    username varchar(255),
    id bigint not null,
    resource_id bigint,
    user_id bigint,
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

create table ANALYTICS_CERTIFICATION_FACT (
    dateCollect datetime not null,
    averageCompletionTime bigint,
    amountWaitingApproval bigint,
    amountFinished bigint,
    amountCertified bigint,
    amountRevoked bigint,
    amountError bigint,
    approvalPercentage double,
    revokePercentage double,
    primary key (dateCollect)
) ENGINE=InnoDB;

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

create table ANALYTICS_DIRECTORY_OBJECTS_DETAIL_FACT (
    dateCollect datetime not null,
    averageAccountsPerResource bigint,
    averageAccountsPerUser bigint,
    averageEntitlementsByResource bigint,
    averageEntitlementsByUser bigint,
    averageUsersByEntitlement bigint,
    averageUsersByOrganization bigint,
    averageUsersByRole bigint,
    averageRolesByUser bigint,
    totalUsersWithoutAccounts bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

create table ANALYTICS_DIRECTORY_OBJECTS_FACT (
    dateCollect datetime not null,
    amountActiveUsers bigint,
    amountInactiveUsers bigint,
    amountOrganizations bigint,
    amountResources bigint,
    amountRoles bigint,
    amountAccounts bigint,
    amountMembershipEntitlements bigint,
    amountRemovedUsers bigint,
    amountLockedUsers bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

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

create table ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT (
    dateCollect datetime not null,
    amountAccountsByManual bigint,
    amountAccountsByReconciliation bigint,
    amountAccountsByRole bigint,
    amountMembershipEntitlementByManual bigint,
    amountMembershipEntitlementByReconciliation bigint,
    amountMembershipEntitlementByRole bigint,
    amountMembershipOrganizationByReconciliation bigint,
    amountMembershipOrganizationByManual bigint,
    amountMembershipOrganizationByOrganizationRule bigint,
    amountMembershipRoleByAssignmentPolicy bigint,
    amountMembershipRoleByReconciliation bigint,
    amountMembershipRoleByManual bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_FACT (
    dateCollect datetime not null,
    amountProvisioningCanceled bigint,
    amountProvisioningCreated bigint,
    amountProvisioningError bigint,
    amountProvisioningFinished bigint,
    amountProvisioningProcessNotFound bigint,
    amountProvisioningProcessed bigint,
    averageProvisioningCompletitionTime bigint,
    amountResourceAdapterType bigint,
    amountWorkflowType bigint,
    averageProvisioningTimeForWorkflowType bigint,
    averageProvisioningTimeForResourceAdapterType bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_FACT (
    dateCollect datetime not null,
    createdTasks bigint,
    resolvedTasks bigint,
    doneTasks bigint,
    todoTasks bigint,
    waitingAssignTasks bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_CREATED_ENTRY_FACT (
    dateCollect datetime not null,
    amountCreateAccountCreated bigint,
    amountUpdateAccountCreated bigint,
    amountRemoveAccountCreated bigint,
    amountActivateAccountCreated bigint,
    amountInactivateAccountCreated bigint,
    amountGrantEntitlementCreated bigint,
    amountRevokeEntitlementCreated bigint,
    amountCreateEntitlementCreated bigint,
    amountRemoveEntitlementCreated bigint,
    amountUpdateEntitlementCreated bigint,
    amountCreateOrganizationCreated bigint,
    amountUpdateOrganizationCreated bigint,
    amountRemoveOrganizationCreated bigint,
    amountAddMemberToOrganizationCreated bigint,
    amountRemoveMemberFromOrganizationCreated bigint,
    amountCreateRoleCreated bigint,
    amountUpdateRoleCreated bigint,
    amountRemoveRoleCreated bigint,
    amountAddMemberToRoleCreated bigint,
    amountRemoveMemberFromRoleCreated bigint,
    amountChangePasswordCreated bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_FINISHED_ENTRY_FACT (
    dateCollect datetime not null,
    amountCreateAccountFinished bigint,
    amountUpdateAccountFinished bigint,
    amountRemoveAccountFinished bigint,
    amountActivateAccountFinished bigint,
    amountInactivateAccountFinished bigint,
    amountGrantEntitlementFinished bigint,
    amountRevokeEntitlementFinished bigint,
    amountCreateEntitlementFinished bigint,
    amountRemoveEntitlementFinished bigint,
    amountUpdateEntitlementFinished bigint,
    amountCreateOrganizationFinished bigint,
    amountUpdateOrganizationFinished bigint,
    amountRemoveOrganizationFinished bigint,
    amountAddMemberToOrganizationFinished bigint,
    amountRemoveMemberFromOrganizationFinished bigint,
    amountCreateRoleFinished bigint,
    amountUpdateRoleFinished bigint,
    amountRemoveRoleFinished bigint,
    amountAddMemberToRoleFinished bigint,
    amountRemoveMemberFromRoleFinished bigint,
    amountChangePasswordFinished bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_FACT (
    dateCollect datetime not null,
    amountReconciliationsByPeriod bigint,
    averageReconciliationTime bigint,
    amountProcessedWithoutWorkflow bigint,
    amountNotProcessed bigint,
    amountProcessedWithError bigint,
    amountBatches bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_DETAIL_FACT (
    dateCollect datetime not null,
    amountApprovedRequests bigint,
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
    amountByMultipleRequestsType bigint,
    amountByNewUserType bigint,
    amountByRemoveAccountType bigint,
    amountByRemoveEntitlementFromAccountType bigint,
    amountByRemoveUserType bigint,
    amountByResetPasswordType bigint,
	amountByLockUserType bigint,
	amountByUnlockUserType bigint,
	amountByUpdateAccountType bigint,
	amountByActivateAccountType bigint,
	amountByInactivateAccountType bigint,
	amountByRemoveUserFromRoleType bigint,
    amountBySodNotAllowedStatus bigint,
    amountBySuccessStatus bigint,
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

create table ANALYTICS_REQUEST_FACT (
    date datetime not null,
    assignEntitlementAverage bigint,
    assignRoleAverage bigint,
    changeStatusUserAverage bigint,
    createAccountAverage bigint,
    multipleRequestsAverage bigint,
    newUserAverage bigint,
    removeAccountAverage bigint,
    removeEntitlementFromAccountAverage bigint,
    removeUserAverage bigint,
    resetPasswordAverage bigint,
    averageFinishingTime bigint,
    averageApprovingTime bigint,
    updateUserAverage bigint,
    primary key (date)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_FASTEST_APPROVERS (
    userId bigint not null,
    displayName varchar(255) not null,
    amount bigint not null,
    primary key (userId)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_SLOWEST_APPROVERS (
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

create table ANALYTICS_REQUEST_HIGH_AMOUNT_APPROVERS (
    userId bigint not null,
    displayName varchar(255) not null,
    amount bigint not null,
    primary key (userId)
) ENGINE=InnoDB;


create table ANALYTICS_TASK_DAILY_FACT (
    date datetime not null,
    resolvedAfterADayFromCreation bigint,
    resolvedOnSameDayOfCreation bigint,
    resolvedWithinADayAfterCreation bigint,
    totalCreatedTasks bigint,
    totalResolvedTasks bigint,
    primary key (date)
) ENGINE=InnoDB;

create table ANALYTICS_TASK_DEADLINE_FACT (
    date datetime not null,
    averageDelayedTimeBetweenFinishedDateAndDeadline bigint,
    totalFinishedTasksWithDelayedDeadline bigint,
    totalOpenedTasksWithDelayedDeadline bigint,
    primary key (date)
) ENGINE=InnoDB;

create table ANALYTICS_TASK_FACT (
    date datetime not null,
    averageTimeBetweenCreationAndResolution bigint,
    totalCriticalPriorityTasks bigint,
    totalCriticalPriorityTodoTasks bigint,
    totalCriticalPriorityWaitingAssignTasks bigint,
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
    totalApprovedTasks bigint,
    totalDisapprovedTasks bigint,
    primary key (date)
) ENGINE=InnoDB;

create table ANALYTICS_TASK_QUEUE_FACT (
    id bigint not null auto_increment,
    dateCollect datetime not null,
    queue varchar(255),
    amountTask bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_DETAIL_FACT (
    dateCollect datetime not null,
    amountCreated bigint,
    amountCreatedByResourceAdapter bigint,
    amountCreatedByWorkflow bigint,
    amountSuccessfullyFinished bigint,
    amountSuccessfullyFinishedByResourceAdapter bigint,
    amountSuccessfullyFinishedByWorkflow bigint,
    amountFailedFinished bigint,
    amountFailedFinishedByResourceAdapter bigint,
    amountFailedFinishedByWorkflow bigint,
    amountWaitingManualExecution bigint,
    primary key (dateCollect)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_SITUATION_DIMENSION (
    id bigint not null auto_increment,
    situationName varchar (255),
    schemaa varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_SITUATION_FACT (
    id bigint not null auto_increment,
    dateCollect datetime not null,
    situationDimension_id bigint,
    amount bigint,
    primary key (id),
    foreign key (situationDimension_id) references ANALYTICS_RECONCILIATION_SITUATION_DIMENSION (id)
) ENGINE=InnoDB;

create table ApprovalPolicy (
    id bigint not null auto_increment,
    autoApproved bit,
    description varchar(255),
    eligibility varchar(3500),
    enabled bit,
    name varchar(255),
    operator varchar(255),
    position integer,
    sla integer,
    type varchar(255),
    workflow varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ApprovalTaskDetail (
    id bigint not null auto_increment,
    approvalDate datetime,
    creation datetime,
    levelName varchar(255),
    outcome varchar(255),
    request_id bigint,
    task_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table AssignmentEntry (
    id bigint not null auto_increment,
    action varchar(255),
    assignmentPolicyId bigint,
    creationDate datetime,
    executionDate datetime,
    lockDate datetime,
    lockNumber bigint,
    roleId bigint,
    status varchar(255),
    userId bigint,
    primary key (id)
) ENGINE=InnoDB;

create table AssignmentPolicy (
    id bigint not null auto_increment,
    body longtext,
    description varchar(255),
    enabled bit,
    modifiedAt datetime,
    name varchar(255),
    position integer,
    revokeType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table AssociationRule (
    id bigint not null auto_increment,
    payload varchar(2000),
    targetType varchar(255),
    type varchar(255),
    profile_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table AttributeMap (
    id bigint not null auto_increment,
    beanshell bit not null,
    description varchar(255),
    field varchar(255),
    value varchar(2000),
    primary key (id)
) ENGINE=InnoDB;

create table AttributeMapping (
    id bigint not null auto_increment,
    description varchar(255),
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table AttributeMapping_AttributeMap (
    attributeMapping_id bigint not null,
    attributeMap_id bigint not null,
    primary key (attributeMapping_id, attributeMap_id)
) ENGINE=InnoDB;

create table AuthenticationPolicy (
    uuid varchar(255) not null,
    defaultt bit,
    description varchar(255),
    forceAuthentication bit,
    name varchar(255),
    sessionTimeToLive bigint,
    workflow varchar(255),
    published boolean default false,
    lastPublication datetime,
    allowSimultaneousLogin boolean default false,
    riskDefinitions longtext,
    factorOneDefinitions longtext,
    factorTwoDefinitions longtext,
    postAuthentication longtext,
    primary key (uuid)
) ENGINE=InnoDB;

create table AuthenticationPolicyParameters (
    auth_policy_id varchar(255) not null,
    parameters_id bigint not null
) ENGINE=InnoDB;


create table AuthenticationSourceKerberos (
    id bigint not null auto_increment,
    description varchar(255),
    name varchar(255),
    keyTab varchar(255),
    realm varchar(255),
    servicePrincipal varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table AuthenticationSourceLDAP (
    id bigint not null auto_increment,
    description varchar(255),
    name varchar(255),
    connectionBindDN varchar(255),
    connectionBindPassword varchar(255),
    connectionHost varchar(255),
    connectionPort integer,
    groupNameAttribute varchar(255),
    groupSearchBase varchar(255),
    groupSearchBaseFilter varchar(255),
    groupSearchMaxResults integer,
    maxPoolSize integer,
    minPoolSize integer,
    userSearchBase varchar(255),
    userSearchBaseFilter varchar(255),
    userSearchMaxResults integer,
    usernameAttribute varchar(255),
    waitResponseTimeout integer,
    waitTimeout integer,
    primary key (id)
) ENGINE=InnoDB;

create table AuthenticationSourceOpenId (
    id bigint not null auto_increment,
    description varchar(255),
    name varchar(255),
    accessTokenUrl varchar(255),
    authorizationUrl varchar(255),
    clientId varchar(255),
    clientSecret varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table AuthenticationSourceSaml (
    id bigint not null auto_increment,
    description varchar(255),
    name varchar(255),
    entityId varchar(255),
    singleLogoutServiceLocation varchar(255),
    singleSignOnServiceLocation varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table BlazonAccessManagerSession (
    id varchar(255) not null,
    browserName varchar(255),
    browserversion varchar(255),
    creation datetime,
    engineName varchar(255),
    fingerprint varchar(255),
    lastAccess datetime,
    latitude varchar(255),
    longitude varchar(255),
    manufacturer varchar(255),
    maxInactiveInterval integer,
    network varchar(255),
    operatingSystemName varchar(255),
    status varchar(255),
    timeToLive integer,
    userAgentType varchar(255),
    userIPaddress varchar(255),
    principalIdentifier varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table BlazonAccessManagerSessionAttributes (
    name varchar(255) not null,
    value longtext,
    session_id varchar(255),
    primary key (name)
) ENGINE=InnoDB;

create table BlazonRequest (
    id bigint not null auto_increment,
    accountId bigint,
    approvalFinishedAt datetime,
    approvalPolicy_id bigint,
    approvalProcess varchar(255),
    approvalStartedAt datetime,
    approvalWorkflowId bigint,
    createDate datetime,
    createdBy varchar(255),
    createdByObjectId varchar(255),
    dependenciesVerifiedAt datetime,
    effectiveDate datetime,
    entitlementId bigint,
    finalizeDate datetime,
    generatedBySystem boolean default false,
    justification varchar(1000),
    lockDate datetime,
    lockNumber bigint,
    membershipId bigint,
    needApproval bit not null,
    operationWorkflowId bigint,
    payload longtext,
    payloadWithItemThatViolatesSodPolicy boolean default false,
    provisioningEntryId bigint,
    provisioningFinishedAt datetime,
    provisioningStartedAt datetime,
    resourceId bigint,
    roleId bigint,
    sodFinishedAt datetime,
    sodProcess varchar(255),
    sodStartedAt datetime,
    sodWorkflowId bigint,
    status varchar(255),
    type varchar(255),
    beneficiary_id bigint,
    parent_id bigint,
    requester_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table BlazonRequestApprovalTask (
    disapprovalJustification varchar(1000),
    id bigint not null,
    request_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table BlazonRequestSodApprovalTask (
    justification varchar(1000),
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

create table BlazonRequest_dependsOnIds (
    BlazonRequest_id bigint not null,
    dependsOnIds bigint
) ENGINE=InnoDB;

create table BlazonRequestTransitionState (
    id bigint not null auto_increment,
    bySystem bit,
    date datetime,
    description longtext,
    detail longtext,
    sourceState varchar(255),
    targetState varchar(255),
    request_id bigint,
    user_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table BllazonImage (
    id varchar(255) not null,
    description varchar(255),
    image longtext,
    name varchar(255),
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

create table CertificationApprovalTaskDetail (
    id bigint not null auto_increment,
    approvalDate datetime,
    creation datetime,
    levelName varchar(255),
    outcome varchar(255),
    certificationEntry_id bigint,
    task_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table CertificationEntry (
    id bigint not null auto_increment,
    createdBy varchar(255),
    createdByObjectId varchar(255),
    creationDate datetime,
    entitlementId bigint,
    entryId bigint,
    entryType varchar(255),
    lockDate datetime,
    lockNumber bigint,
    processDate datetime,
    resourceId bigint,
    roleId bigint,
    status varchar(255),
    uncertifiedEntryAction varchar(255),
    userId bigint,
    workflowCertificationId bigint,
    workflowCertificationName varchar(255),
    policy_id bigint,
    selector_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table CertificationEntryTransitionState (
    id bigint not null auto_increment,
    bySystem bit,
    date datetime,
    description longtext,
    detail longtext,
    sourceState varchar(255),
    targetState varchar(255),
    certificationEntry_id bigint,
    user_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table CertificationNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table CertificationPolicy (
    id bigint not null auto_increment,
    certificationObjectType varchar(255),
    certificationWorkflowName varchar(255),
    criticity varchar(255),
    description varchar(255),
    enabled boolean default true,
    filterObjectType varchar(255),
    filterObjectTypeId bigint,
    limitOfEntriesByExecution integer,
    name varchar(255),
    numberOfDaysSinceLastCertification integer,
    selectAllEntries boolean default false,
    selectExpiratedEntries bit not null,
    selectNotCertifiableEntries bit not null,
    uncertifiedEntryAction varchar(255),
    userFilterRules longtext,
    primary key (id)
) ENGINE=InnoDB;

create table CertificationSelector (
    id bigint not null auto_increment,
    certificationAccountWorkflowName varchar(255),
    certificationMembershipEntitlementWorkflowName varchar(255),
    certificationMembershipRoleWorkflowName varchar(255),
    certifyAccounts boolean default false,
    certifyMembershipEntitlements boolean default false,
    certifyMembershipRoles boolean default false,
    certifyUsers boolean default false,
    description varchar(255),
    enabled boolean default true,
    name varchar(255),
    position integer,
    rules longtext,
    type varchar(255),
    uncertifiedAccountAction varchar(255),
    uncertifiedMembershipEntitlementAction varchar(255),
    uncertifiedMembershipRoleAction varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table CertificationSelectorEntries (
    id bigint not null auto_increment,
    certificationEntry bigint,
    certificationSelectorEntry bigint,
    primary key (id)
) ENGINE=InnoDB;

create table CertificationSelectorEntry (
    id bigint not null auto_increment,
    creationDate datetime,
    lockDate datetime,
    lockNumber bigint,
    processDate datetime,
    status varchar(255),
    userId bigint,
    primary key (id)
) ENGINE=InnoDB;

create table CreatedBy (
    id bigint not null auto_increment,
    objectId bigint,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table Dictionary (
    id bigint not null auto_increment,
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table DictionaryWord (
    id bigint not null auto_increment,
    word varchar(255),
    dictionary_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table Domain (
    id bigint not null auto_increment,
    description varchar(255),
    domainName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table EmailQueueEntry (
    id bigint not null auto_increment,
    createdAt datetime,
    fromm varchar(255),
    message longtext,
    subject varchar(255),
    too varchar(255),
    lastErrorMessage varchar(1000),
    processed datetime,
    retries integer not null,
    status varchar(255),
    serverMailSetup_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table EmailQueueEntry_attachments (
    EmailQueueEntry_id bigint not null,
    attachments varchar(255)
) ENGINE=InnoDB;

create table EmailQueueEntry_cc (
    EmailQueueEntry_id bigint not null,
    cc varchar(255)
) ENGINE=InnoDB;

create table Entitlement (
    description varchar(255),
    name varchar(255),
    tags varchar(255),
    id bigint not null,
    resource_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table Entitlement_User (
    id bigint not null auto_increment,
    Entitlement_id bigint,
    owners_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table EntitlementDependency (
    id bigint not null auto_increment,
    dependencyId bigint,
    dependencyType varchar(255),
    entitlement_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table Entry (
    id bigint not null auto_increment,
    certificatedAt datetime,
    createdAt datetime,
    expireAt datetime,
    modifiedAt datetime,
    risk varchar(255),
    state varchar(255) not null,
    provisioningStatus varchar(255) not null,
    type varchar(255),
    createdBy_id bigint,
    managedBy_id bigint,
    certifiable boolean default true,
    visibleToSelfService boolean default true,
    sodValidatedAt datetime,
    primary key (id)
) ENGINE=InnoDB;

create table EntryAttribute (
    id bigint not null auto_increment,
    defaultValue varchar(255),
    defaultt bit not null,
    description varchar(255),
    displayType varchar(255),
    encrypt bit not null,
    label varchar(255),
    listValueScript varchar(10000),
    managedBySystem bit not null,
    name varchar(255),
    position integer not null,
    required bit not null,
    schemaa varchar(255),
    searchable bit not null,
    showAtRegistration bit not null,
    validationScript varchar(4000),
    visible bit not null,
    writable bit not null,
    category_id bigint,
    resource_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table EntryAttributeCategory (
    id bigint not null auto_increment,
    description varchar(255),
    name varchar(255),
    position integer not null,
    schemaa varchar(255),
    resource_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table EntryAttributeValue (
    name varchar(255) not null,
    value varchar(255),
    entry_id bigint not null,
    primary key (entry_id, name)
) ENGINE=InnoDB;

create table EventSetting (
    id bigint not null auto_increment,
    description varchar(255),
    enabled boolean default false,
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ExpirationOptions (
    id bigint not null auto_increment,
    lifeTime integer,
    notifyUserBeforeExpiration integer,
    scaleLifeTime varchar(255),
    scaleNotifyUserBeforeExpiration varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table Inbox (
    id bigint not null auto_increment,
    content varchar(3000),
    date datetime,
    fromSystem bit,
    status varchar(255),
    subject varchar(255),
    USERFROM_ID bigint,
    USERTO_ID bigint,
    primary key (id)
) ENGINE=InnoDB;

create table InternalPermission (
    id bigint not null auto_increment,
    category varchar(255),
    description varchar(255),
    label varchar(255),
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table InternalPermissionGroup (
    id bigint not null auto_increment,
    category varchar(255),
    description varchar(255),
    label varchar(255),
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table InternalPermissionGroup_InternalPermission (
    internalPermissionGroups_id bigint not null,
    internalPermissions_id bigint not null,
    primary key (internalPermissionGroups_id, internalPermissions_id)
) ENGINE=InnoDB;

create table Job (
    id bigint not null auto_increment,
    className varchar(255),
    description varchar(255),
    displayName varchar(255),
    parameters longtext,
    primary key (id)
) ENGINE=InnoDB;

create table JobExecution (
    id bigint not null auto_increment,
    details longtext,
    end datetime,
    start datetime,
    status varchar(255),
    instance_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table JobInstance (
    id bigint not null auto_increment,
    activated bit,
    activatedAt datetime,
    cronExpression varchar(255),
    description varchar(255),
    externalGroupId varchar(255),
    externalJobDetailId varchar(255),
    externalTriggerId varchar(255),
    name varchar(255),
    params varchar(3000),
    timeOflastExecution bigint default '0',
    job_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table LogginModuleSettings (
        module varchar(255) not null,
        activate bit not null,
        primary key (module)
    ) ENGINE=InnoDB;

create table ManagedBy (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ManagedBy_objectIds (
    ManagedBy_id bigint not null,
    objectIds bigint
) ENGINE=InnoDB;

create table ManagerRole (
    id bigint not null auto_increment,
    description varchar(500),
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ManagerRole_InternalPermissionGroup (
    managerRoles_id bigint not null,
    internalPermissionGroups_id bigint not null,
    primary key (managerRoles_id, internalPermissionGroups_id)
) ENGINE=InnoDB;

create table ManagerRole_User (
    ManagerRole_id bigint not null,
    users_id bigint not null,
    primary key (ManagerRole_id, users_id)
) ENGINE=InnoDB;

create table MembershipEntitlement (
    id bigint not null,
    account_id bigint,
    entitlement_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table MembershipEntitlementNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table MembershipOrganization (
    id bigint not null auto_increment,
    assignedDate datetime,
    organization_id bigint,
    user_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table MembershipRole (
    id bigint not null,
    role_id bigint,
    user_id bigint,
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

create table SecureChannelOtpConfiguration (
    id bigint not null auto_increment,
    tokenLength integer not null,
    ttl integer not null,
    primary key (id)
) ENGINE=InnoDB;

create table SecureChannelToken (
    id bigint not null auto_increment,
    channel varchar(255),
    createdAt datetime,
    processed datetime,
    status varchar(255),
    timeToLive datetime,
    token varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table OtpTimeBasedUserKey (
    id bigint not null auto_increment,
    otpKey varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table OtpTimeBasedConfiguration (
    id bigint not null auto_increment,
    otherEmail bit not null,
    templateId bigint,
    primary key (id)
) ENGINE=InnoDB;

create table SecretQuestion (
    id bigint not null auto_increment,
    answer varchar(255),
    question varchar(500),
    primary key (id)
) ENGINE=InnoDB;

create table SecretQuestionConfiguration (
    id bigint not null auto_increment,
    minOfCorrectQuestions integer,
    primary key (id)
) ENGINE=InnoDB;

create table MfaSettings (
    id bigint not null auto_increment,
    allowUserConfigGoogle bit,
    allowUserConfigSms bit,
    hasGoogleOtp bit,
    hasSecretQuestions bit,
    hasSms bit,
    primary key (id)
) ENGINE=InnoDB;

create table NetworkConfig (
    id bigint not null auto_increment,
    address varchar(255),
    mask varchar(255),
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;


create table NotificationTemplate (
    id bigint not null auto_increment,
    body varchar(8000),
    description varchar(255),
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table OAuthAccessToken (
    accessToken varchar(255) not null,
    clientId varchar(255),
    createdAt datetime,
    expirein datetime,
    grantTypeGenerator varchar(255),
    idToken varchar(255),
    refreshToken varchar(255),
    scope varchar(255),
    status varchar(255),
    tokenType varchar(255),
    principal varchar(255),
    primary key (accessToken)
) ENGINE=InnoDB;

create table OAuthApiClient (
    uuid varchar(255) not null,
    accessTokenValidity bigint,
    autoApprove bit,
    clientId varchar(255),
    clientSecret varchar(255),
    description varchar(255),
    name varchar(255),
    redirectUri varchar(255),
    refreshTokenValidity bigint,
    authPolicy_uuid varchar(255),
    primary key (uuid)
) ENGINE=InnoDB;

create table OAuthClient (
    uuid varchar(255) not null,
    accessTokenValidity bigint,
    autoApprove bit,
    clientId varchar(255),
    clientSecret varchar(255),
    description varchar(255),
    name varchar(255),
    redirectUri varchar(255),
    refreshTokenValidity bigint,
    authPolicy_uuid varchar(255),
    primary key (uuid)
) ENGINE=InnoDB;

create table OAuthCode (
    code varchar(255) not null,
    clientId varchar(255),
    codeValidity bigint,
    urlCallback varchar(255),
    user_id bigint,
    primary key (code)
) ENGINE=InnoDB;

create table Organization (
    description varchar(255),
    name varchar(255),
    id bigint not null,
    organizationType_id bigint,
    parent_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table Organization_User (
    Organization_id bigint not null,
    owners_id bigint not null
) ENGINE=InnoDB;

create table OrganizationProvisioningProfile (
    id bigint not null auto_increment,
    addMemberToOrganizationProvisioningTaskDefinitionIdentifier bigint,
    addMemberToOrganizationProvisioningTaskQueueIdentifier bigint,
    addMemberToOrganizationProvisioningMappingIdentifier bigint,
    addMemberToOrganizationProvisioningMappingIdentifier2 bigint,
    addMemberToOrganizationProvisioningObject varchar(255),
    addMemberToOrganizationProvisioningType varchar(255),
    createOrganizationProvisioningTaskDefinitionIdentifier bigint,
    createOrganizationProvisioningTaskQueueIdentifier bigint,
    createOrganizationProvisioningMappingIdentifier bigint,
    createOrganizationProvisioningObject varchar(255),
    createOrganizationProvisioningType varchar(255),
    removeMemberOfOrganizationProvisioningTaskDefinitionIdentifier bigint,
    removeMemberOfOrganizationProvisioningTaskQueueIdentifier bigint,
    removeMemberOfOrganizationProvisioningMappingIdentifier bigint,
    removeMemberOfOrganizationProvisioningMappingIdentifier2 bigint,
    removeMemberOfOrganizationProvisioningObject varchar(255),
    removeMemberOfOrganizationProvisioningType varchar(255),
    removeOrganizationProvisioningTaskDefinitionIdentifier bigint,
    removeOrganizationProvisioningTaskQueueIdentifier bigint,
    removeOrganizationProvisioningMappingIdentifier bigint,
    removeOrganizationProvisioningObject varchar(255),
    removeOrganizationProvisioningType varchar(255),
    updateOrganizationProvisioningTaskDefinitionIdentifier bigint,
    updateOrganizationProvisioningTaskQueueIdentifier bigint,
    updateOrganizationProvisioningMappingIdentifier bigint,
    updateOrganizationProvisioningObject varchar(255),
    updateOrganizationProvisioningType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table OrganizationRule (
    id bigint not null auto_increment,
    body longtext,
    organization_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table OrganizationType (
    id bigint not null auto_increment,
    description varchar(255),
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table Parameter (
    id bigint not null auto_increment,
    label varchar(255),
    name varchar(255),
    value varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table PasswordHistory (
    id bigint not null auto_increment,
    entryDate datetime,
    password varchar(255),
    user_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table PasswordPolicy (
    id bigint not null auto_increment,
    description varchar(2000),
    name varchar(255),
    passwordRepeatWindowLength integer,
    rules varchar(1500),
    dictionary_id bigint,
    expirationOptions_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table PasswordPolicySettings (
    id bigint not null auto_increment,
    domainPasswordPolicy_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table PasswordVaultEntry (
    id bigint not null auto_increment,
    canBeShared bit not null,
    description varchar(2000),
    createdAt datetime,
    createdBy_id bigint,
    expireAt datetime,
    primary key (id)
) ENGINE=InnoDB;

create table PasswordVaultEntryAttribute (
    name varchar(255) not null,
    value varchar(255),
    entry_id bigint not null,
    primary key (name, entry_id)
) ENGINE=InnoDB;

create table PasswordVaultOwner (
    id bigint not null auto_increment,
    owner_id bigint,
    passwordVaultEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table PasswordVaultShare (
    id bigint not null auto_increment,
    passwordVaultEntry_id bigint,
    user_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table PasswordVaultWebScript (
    id bigint not null auto_increment,
    script varchar(4000),
    primary key (id)
) ENGINE=InnoDB;

create table ProfileSituation (
    id bigint not null auto_increment,
    automatic bit not null,
    reconciliationActionBeanName varchar(255),
    profile_id bigint,
    situation_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ProvisioningEntry (
    id bigint not null auto_increment,
    accountId bigint,
    date datetime,
    entitlementId bigint,
    entryType varchar(255),
    lockDate datetime,
    lockNumber bigint,
    organizationId bigint,
    payload longtext,
    processDate datetime,
    provisioningTaskDefinitionIdentifier bigint,
    provisioningTaskQueueIdentifier bigint,
    provisioningType varchar(255),
    provisioningTypeObjectId varchar(255),
    roleId bigint,
    status varchar(255),
    targetId bigint,
    targetType varchar(255),
    workflowId bigint,
    beneficiary_id bigint,
    resource_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ProvisioningNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    managerRoleId bigint,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ProvisioningEntryTransitionState (
    id bigint not null auto_increment,
    bySystem bit,
    date datetime,
    description longtext,
    detail longtext,
    sourceState varchar(255),
    targetState varchar(255),
    provisioningEntry_id bigint,
    user_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ProvisioningParameters (
    id bigint not null auto_increment,
    content varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ProvisioningTask (
    notProvisionedJustification varchar(1000),
    id bigint not null,
    provisioningEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ProvisioningTaskDetail (
    id bigint not null auto_increment,
    approvalDate datetime,
    creation datetime,
    outcome varchar(255),
    taskId bigint,
    provisioningEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ReconciliationAction (
    id bigint not null auto_increment,
    actionName varchar(255),
    beanName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ReconciliationNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    managerRoleId bigint,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ReconciliationAction_entryTypes (
    ReconciliationAction_id bigint not null,
    entryTypes varchar(255)
) ENGINE=InnoDB;

create table ReconciliationAction_situationNames (
    ReconciliationAction_id bigint not null,
    situationNames varchar(255)
) ENGINE=InnoDB;

create table ReconciliationEntry (
    id bigint not null auto_increment,
    batchId varchar(255),
    data longtext,
    date datetime,
    effectiveDate datetime,
    lockDate datetime,
    lockNumber bigint,
    ownersType varchar(255),
    processDate datetime,
    processedData longtext,
    reconciliationActionBeanName varchar(255),
    reconciliationMatchedEntryId bigint,
    schemaa varchar(255),
    status varchar(255),
    profile_id bigint,
    resource_id bigint,
    situation_id bigint,
	resourceAdapterId varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ReconciliationEntry_matchedEntriesIds (
    ReconciliationEntry_id bigint not null,
    matchedEntriesIds bigint
) ENGINE=InnoDB;

create table ReconciliationEntry_matchedOwnersIds (
    ReconciliationEntry_id bigint not null,
    matchedOwnersIds bigint
) ENGINE=InnoDB;

create table ReconciliationEntryTransitionState (
    id bigint not null auto_increment,
    bySystem bit,
    date datetime,
    description longtext,
    detail longtext,
    sourceState varchar(255),
    targetState varchar(255),
    reconciliationEntry_id bigint,
    user_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ReconciliationProfile (
    id bigint not null auto_increment,
    description varchar(255),
    incremental boolean default false,
    name varchar(255),
    schemaa varchar(255),
    additionalMatchRule_id bigint,
    matchRule_id bigint,
    ownerRule_id bigint,
    resource_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ReconciliationProfile_AttributeMap (
    ReconciliationProfile_id bigint not null,
    attributeMapping_id bigint not null,
    primary key (ReconciliationProfile_id, attributeMapping_id)
) ENGINE=InnoDB;

create table ResetPasswordFactor (
    id bigint not null auto_increment,
    description varchar(255),
    displayName varchar(255),
    enabled bit not null,
    name varchar(255),
    position integer not null,
    primary key (id)
) ENGINE=InnoDB;

create table ResetPasswordSettings (
    id bigint not null auto_increment,
    workflow varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table Resource (
    id bigint not null auto_increment,
    allowUserChangePasswordVaultCredentials bit not null,
    certifiable boolean default true,
    creationDate date,
    description varchar(255),
    logoImageId varchar(255),
    name varchar(255),
    passwordVaultEnabled boolean default false,
    provisioningEnabled bit not null,
    risk varchar(255) not null,
    syncPassword boolean default false,
    tags varchar(255),
    uri varchar(255),
    visibleToSelfService boolean default true,
    category_id bigint,
    creator_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table Resource_User (
    id bigint not null auto_increment,
    managedResources_id bigint,
    owners_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ResourceAdapter (
    id bigint not null auto_increment,
    description varchar(255),
    name varchar(255),
    uuid varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ResourceAdapter_instances (
    ResourceAdapter_id bigint not null,
    instances varchar(255)
) ENGINE=InnoDB;

create table ResourceCategory (
    id bigint not null auto_increment,
    description varchar(255),
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ResourceDependency (
    id bigint not null auto_increment,
    dependencyId bigint,
    dependencyType varchar(255),
    resource_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ResourceProvisioningProfile (
    id bigint not null auto_increment,
    activateAccountProvisioningTaskDefinitionIdentifier bigint,
    activateAccountProvisioningTaskQueueIdentifier bigint,
    activateAccountProvisioningMappingIdentifier bigint,
    activateAccountProvisioningObject varchar(255),
    activateAccountProvisioningType varchar(255),
    addMemberToEntitlementProvisioningTaskDefinitionIdentifier bigint,
    addMemberToEntitlementProvisioningTaskQueueIdentifier bigint,
    addMemberToEntitlementProvisioningMappingIdentifier bigint,
    addMemberToEntitlementProvisioningObject varchar(255),
    addMemberToEntitlementProvisioningType varchar(255),
    changePasswordProvisioningTaskDefinitionIdentifier bigint,
    changePasswordProvisioningTaskQueueIdentifier bigint,
    changePasswordProvisioningMappingIdentifier bigint,
    changePasswordProvisioningObject varchar(255),
    changePasswordProvisioningType varchar(255),
    createAccountProvisioningTaskDefinitionIdentifier bigint,
    createAccountProvisioningTaskQueueIdentifier bigint,
    createAccountProvisioningMappingIdentifier bigint,
    createAccountProvisioningObject varchar(255),
    createAccountProvisioningType varchar(255),
    createEntitlementProvisioningTaskDefinitionIdentifier bigint,
    createEntitlementProvisioningTaskQueueIdentifier bigint,
    createEntitlementProvisioningMappingIdentifier bigint,
    createEntitlementProvisioningObject varchar(255),
    createEntitlementProvisioningType varchar(255),
    grantEntitlementProvisioningTaskDefinitionIdentifier bigint,
    grantEntitlementProvisioningTaskQueueIdentifier bigint,
    grantEntitlementProvisioningMappingIdentifier bigint,
    grantEntitlementProvisioningMappingIdentifier2 bigint,
    grantEntitlementProvisioningObject varchar(255),
    grantEntitlementProvisioningType varchar(255),
    inactivateAccountProvisioningTaskDefinitionIdentifier bigint,
    inactivateAccountProvisioningTaskQueueIdentifier bigint,
    inactivateAccountProvisioningMappingIdentifier bigint,
    inactivateAccountProvisioningObject varchar(255),
    inactivateAccountProvisioningType varchar(255),
    removeAccountProvisioningTaskDefinitionIdentifier bigint,
    removeAccountProvisioningTaskQueueIdentifier bigint,
    removeAccountProvisioningMappingIdentifier bigint,
    removeAccountProvisioningObject varchar(255),
    removeAccountProvisioningType varchar(255),
    removeEntitlementProvisioningTaskDefinitionIdentifier bigint,
    removeEntitlementProvisioningTaskQueueIdentifier bigint,
    removeEntitlementProvisioningMappingIdentifier bigint,
    removeEntitlementProvisioningObject varchar(255),
    removeEntitlementProvisioningType varchar(255),
    removeMemberOfEntitlementProvisioningTaskDefinitionIdentifier bigint,
    removeMemberOfEntitlementProvisioningTaskQueueIdentifier bigint,
    removeMemberOfEntitlementProvisioningMappingIdentifier bigint,
    removeMemberOfEntitlementProvisioningObject varchar(255),
    removeMemberOfEntitlementProvisioningType varchar(255),
    resourceId bigint,
    revokeEntitlementProvisioningTaskDefinitionIdentifier bigint,
    revokeEntitlementProvisioningTaskQueueIdentifier bigint,
    revokeEntitlementProvisioningMappingIdentifier bigint,
    revokeEntitlementProvisioningMappingIdentifier2 bigint,
    revokeEntitlementProvisioningObject varchar(255),
    revokeEntitlementProvisioningType varchar(255),
    updateAccountProvisioningTaskDefinitionIdentifier bigint,
    updateAccountProvisioningTaskQueueIdentifier bigint,
    updateAccountProvisioningMappingIdentifier bigint,
    updateAccountProvisioningObject varchar(255),
    updateAccountProvisioningType varchar(255),
    updateEntitlementProvisioningTaskDefinitionIdentifier bigint,
    updateEntitlementProvisioningTaskQueueIdentifier bigint,
    updateEntitlementProvisioningMappingIdentifier bigint,
    updateEntitlementProvisioningObject varchar(255),
    updateEntitlementProvisioningType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table Rightt (
    id bigint not null auto_increment,
    resource_id bigint,
	rightsCertifiedAt datetime,
    role_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table Rightt_Entitlement (
    Right_id bigint not null,
    entitlements_id bigint not null
) ENGINE=InnoDB;

create table Role (
    description varchar(255),
    name varchar(255),
    tags varchar(255),
    id bigint not null,
    primary key (id)
) ENGINE=InnoDB;

create table RoleRightApprovalPolicy (
    id bigint not null auto_increment,
    autoApproved bit,
    description varchar(255),
    eligibility varchar(3500),
    enabled bit,
    name varchar(255),
    operator varchar(255),
    position integer,
    workflow varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table RoleRightApprovalTask (
    type varchar(255),
    id bigint not null,
    roleRightEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table RoleRightApprovalTaskDetail (
    id bigint not null auto_increment,
    approvalDate datetime,
    creation datetime,
    levelName varchar(255),
    outcome varchar(255),
    roleRightEntry_id bigint,
    task_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table RoleRightEntry (
    id bigint not null auto_increment,
    action varchar(255),
    approvalWorkflowId bigint,
    creationDate datetime,
    executionDate datetime,
    justification varchar(1000),
    lockDate datetime,
    lockNumber bigint,
    roleId bigint,
    roleRightPolicyId bigint,
    status varchar(255),
    requester_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table RoleRightEntry_RoleRightEntryItem (
    RoleRightEntry_id bigint not null,
    items_id bigint not null
) ENGINE=InnoDB;

create table RoleRightEntryItem (
    id bigint not null auto_increment,
    approvalStatus varchar(255),
    entryDescription varchar(255),
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table RoleRightRevokeEntry (
    id bigint not null auto_increment,
    createdAt datetime,
    finalizedAt datetime,
    lockDate datetime,
    lockNumber bigint,
    resolution varchar(255),
    status varchar(255),
    targetId varchar(255),
    targetType varchar(255),
    role_id bigint,
    user_id bigint,
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

create table Role_User (
    Role_id bigint not null,
    owners_id bigint not null
) ENGINE=InnoDB;

create table RoleProvisioningProfile (
    id bigint not null auto_increment,
    addMemberToRoleProvisioningTaskDefinitionIdentifier bigint,
    addMemberToRoleProvisioningTaskQueueIdentifier bigint,
    addMemberToRoleProvisioningMappingIdentifier bigint,
    addMemberToRoleProvisioningMappingIdentifier2 bigint,
    addMemberToRoleProvisioningObject varchar(255),
    addMemberToRoleProvisioningType varchar(255),
    createRoleProvisioningTaskDefinitionIdentifier bigint,
    createRoleProvisioningTaskQueueIdentifier bigint,
    createRoleProvisioningMappingIdentifier bigint,
    createRoleProvisioningObject varchar(255),
    createRoleProvisioningType varchar(255),
    removeMemberOfRoleProvisioningTaskDefinitionIdentifier bigint,
    removeMemberOfRoleProvisioningTaskQueueIdentifier bigint,
    removeMemberOfRoleProvisioningMappingIdentifier bigint,
    removeMemberOfRoleProvisioningMappingIdentifier2 bigint,
    removeMemberOfRoleProvisioningObject varchar(255),
    removeMemberOfRoleProvisioningType varchar(255),
    removeRoleProvisioningTaskDefinitionIdentifier bigint,
    removeRoleProvisioningTaskQueueIdentifier bigint,
    removeRoleProvisioningMappingIdentifier bigint,
    removeRoleProvisioningObject varchar(255),
    removeRoleProvisioningType varchar(255),
    updateRoleProvisioningTaskDefinitionIdentifier bigint,
    updateRoleProvisioningTaskQueueIdentifier bigint,
    updateRoleProvisioningMappingIdentifier bigint,
    updateRoleProvisioningObject varchar(255),
    updateRoleProvisioningType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table SamlAuthenticationClient (
    id bigint not null auto_increment,
    assertionConsumerServiceURL varchar(255),
    assertionEncryption bit,
    assertionEncryptionValue varchar(255),
    attributesProfile bit,
    issuer varchar(255),
    responseSigning bit,
    signatureValidation bit,
    singleLogout bit,
    singleLogoutURL varchar(255),
    authPolicy_uuid varchar(255),
    mappingIdentifier bigint,
    primary key (id)
) ENGINE=InnoDB;

create table SamlAuthenticationClient_attributes (
    SamlAuthenticationClient_id bigint not null,
    attributes varchar(500),
    attributes_KEY varchar(255) not null,
    primary key (SamlAuthenticationClient_id, attributes_KEY)
) ENGINE=InnoDB;

create table SAMLSession (
    id varchar(255) not null,
    issuer varchar(255),
    samlSessionIndex varchar(255),
    sessionIndex varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table SelfServiceCart (
    id bigint not null auto_increment,
    userId varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table SelfServiceCartItem (
	id bigint not null auto_increment,
	assignType varchar(255),
	catalogItemId varchar(255),
	cart_id bigint,
	primary key (id)
) ENGINE=InnoDB;

-- create table SelfServiceCartItem_dependsOnIds (
--    SelfServiceCartItem_id bigint not null,
--    dependsOnIds bigint
-- ) ENGINE=InnoDB;

-- create table SelfServiceCartItem_payloads (
--    SelfServiceCartItem_id bigint not null,
--    payload varchar(4000),
--    schemaValidated bit not null,
--    sodValidated bit not null,
--    userId varchar(255)
-- ) ENGINE=InnoDB;

create table SelfServiceSettings (
    id bigint not null auto_increment,
    sodOption varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ServerMailSetup (
    id bigint not null auto_increment,
    smtpHost varchar(255),
    smtpPassword varchar(255),
    smtpPort varchar(255),
    smtpUser varchar(255),
    needAuthentication bit,
    needTLS bit,
    primary key (id)
) ENGINE=InnoDB;

create table SituationDef (
    id bigint not null auto_increment,
    description varchar(255),
    implementationClassName varchar(255),
    label varchar(255),
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table SituationDef_entryTypes (
    SituationDef_id bigint not null,
    entryTypes varchar(255)
) ENGINE=InnoDB;

create table SodApprovalTask (
    entryId bigint,
    entryType varchar(255),
    justification varchar(1000),
    id bigint not null,
    sodEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table SodApprovalTaskDetail (
    id bigint not null auto_increment,
    approvalDate datetime,
    creation datetime,
    levelName varchar(255),
    outcome varchar(255),
    sodEntry_id bigint,
    task_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table SodEntry (
    id bigint not null auto_increment,
    accountId bigint,
    createdAt datetime,
    entitlementId bigint,
    entry_id bigint,
    entryType varchar(255),
    lockDate datetime,
    lockNumber bigint,
    processedAt datetime,
    resourceId bigint,
    result varchar(255),
    roleId bigint,
    sodPolicyId bigint,
    status varchar(255),
    userId bigint,
    workflowId bigint,
    primary key (id)
) ENGINE=InnoDB;

create table SodEntryTransitionState (
    id bigint not null auto_increment,
    bySystem bit,
    date datetime,
    description varchar(255),
    detail longtext,
    sourceState varchar(255),
    targetState varchar(255),
    entryInfo_id bigint,
    user_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table SodPolicy (
    id bigint not null auto_increment,
    description varchar(255),
    dutyId bigint,
    dutyType varchar(255),
    enabled boolean default true,
    modifiedAt datetime,
    name varchar(255),
    position integer not null,
    rules longtext,
    whenSodMatchOperation varchar(255),
    workflow varchar(255),
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

create table SodSettings (
    id bigint not null auto_increment,
    combinationAlgorithm varchar(255),
    ifNoneApplicableAction varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table SodTaskDetail (
    id bigint not null auto_increment,
    approvalDate datetime,
    creation datetime,
    levelName varchar(255),
    outcome varchar(255),
    request_id bigint,
    task_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table Task (
    id bigint not null auto_increment,
    actionId integer,
    category varchar(255),
    createdBy varchar(255),
    createdByObjectId varchar(255),
    createdDate datetime,
    deadline datetime,
    notificationCount integer,
    priority varchar(255),
    resolvedDate datetime,
    result varchar(255),
    status varchar(255),
    workflowId bigint,
    definition_id bigint,
    userFrom bigint,
    recipient_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table TaskAssignHistory (
    id bigint not null auto_increment,
    assign_date datetime,
    from_id bigint,
    task_id bigint,
    to_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table TaskComment (
    id bigint not null auto_increment,
    comment varchar(1500),
    date datetime,
    task_id bigint,
    user_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table TaskDefinition (
    id bigint not null auto_increment,
    description varchar(255),
    name varchar(255),
    notificationTemplateId bigint,
    percentageForNotifyUser integer not null,
    priority varchar(255),
    sla integer,
    unit varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table TaskEscalation (
    id bigint not null auto_increment,
    amountOfTime integer,
    unit varchar(255),
    escalationWhen varchar(255),
    queueTo_id bigint,
    userFrom_id bigint,
    userTo_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table TaskQueue (
    id bigint not null auto_increment,
    description varchar(500),
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table TaskQueue_ManagerRole (
    TaskQueue_id bigint not null,
    managerRoles_id bigint not null,
    primary key (TaskQueue_id, managerRoles_id)
) ENGINE=InnoDB;

create table TaskQueue_Task (
    TaskQueue_id bigint not null,
    tasks_id bigint not null,
    primary key (TaskQueue_id, tasks_id)
) ENGINE=InnoDB;

create table User (
    birthDate date,
    displayName varchar(255),
    email varchar(255),
    firstName varchar(255),
    lastAccess datetime,
    lastAssignmentExecutionDate datetime,
	lastInactivatedAccountsVerifierExecutionDate datetime,
	lastRoleRightsVerifierExecutionDate datetime,
    lastName varchar(255),
    lastPasswordModificationDate datetime,
    locked boolean default false,
    middleName varchar(255),
    mobilePhone varchar(255),
    needChangePassword bit,
    password varchar(255),
    personalEmail varchar(255),
    photoImageId varchar(255),
    primaryPhone varchar(255),
    thumbImageId varchar(255),
    username varchar(255),
    id bigint not null,
    primary key (id)
) ENGINE=InnoDB;

create table UserAccessDetail (
        id bigint not null auto_increment,
        latitude bigint,
        longitude bigint,
        time datetime,
        userDevice varchar(255),
        userIdentifier bigint,
        primary key (id)
) ENGINE=InnoDB;

create table UserDevice (
        fingerPrint varchar(255) not null,
        browserName varchar(255),
        browserversion varchar(255),
        engineName varchar(255),
        manufacturer varchar(255),
        operatingSystemName varchar(255),
        type varchar(255),
        userAgentType varchar(255),
        userIdentifier bigint,
        primary key (fingerPrint)
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

create table PasswordVaultNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table UserNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table UsernamePolicy (
    id bigint not null auto_increment,
    action varchar(255),
    description varchar(255),
    enabled bit default true,
    name varchar(255),
    position integer not null,
    primary key (id)
) ENGINE=InnoDB;

alter table UsernamePasswordCredentialsVaultItem
    add constraint FKt2e5o083lnm1vwj6p5pki8tns
    foreign key (ownerId)
    references User (id)
	on delete cascade;

alter table AuthenticationPolicyParameters
    add constraint UK_kmbompqow55fmro0mm7voog3l unique (parameters_id);

alter table SelfServiceCart
    add constraint UK_56r36i6m5i9wxhuyqwmby56q9 unique (userId);

alter table TaskQueue_Task
    add constraint UK_3nnrcqhf6jqww18ge2rjwdq3 unique (tasks_id);

alter table User
    add constraint USERNAME_UK unique (username);

alter table Account
    add constraint FK_ACCOUNT_RESOURCE
    foreign key (resource_id)
    references Resource (id);

alter table Account
    add constraint FK_ACCOUNT_USER
    foreign key (user_id)
    references User (id);

alter table Account
    add constraint FKhnxdcerdd7ccl887f0qmsgv2i
    foreign key (id)
    references Entry (id);

alter table ApprovalTaskDetail
    add constraint FK4kaq9fvhwtra3tl4kqp3idvbw
    foreign key (request_id)
    references BlazonRequest (id)
    on delete cascade;

alter table ApprovalTaskDetail
    add constraint FKop8ar5k550jfrm0pkjy96g2n0
    foreign key (task_id)
    references Task (id);

alter table AssociationRule
    add constraint FKqpven7dha73e9j4nrx6xtnccj
    foreign key (profile_id)
    references ReconciliationProfile (id)
    on delete cascade;

alter table AttributeMapping_AttributeMap
    add constraint FK1mw92gulddtu6seofkksunksd
    foreign key (attributeMap_id)
    references AttributeMap (id)
    on delete cascade;

alter table AttributeMapping_AttributeMap
    add constraint FKrib710184q9p51l6pqfy4cyao
    foreign key (attributeMapping_id)
    references AttributeMapping (id)
    on delete cascade;

alter table AuthenticationPolicyParameters
    add constraint FKqitho24f87h3mafyjwgskfn81
    foreign key (parameters_id)
    references Parameter (id);

alter table AuthenticationPolicyParameters
    add constraint FK3mlijnd3e56p1r6jaxr9wftqq
    foreign key (auth_policy_id)
    references AuthenticationPolicy (uuid);

alter table BlazonAccessManagerSessionAttributes
  add constraint FK4gkiu9xp2gq6f2rbdt3eg31wk
  foreign key (session_id)
  references BlazonAccessManagerSession (id);

alter table BlazonRequest
    add constraint FKmahlggwuo8v5moybi6ajxpef
    foreign key (beneficiary_id)
    references User (id);

alter table BlazonRequest_dependsOnIds
    add constraint FK73j0pl934t6ws8d2wck0h2dfb
    foreign key (BlazonRequest_id)
    references BlazonRequest (id)
	on delete cascade;

alter table BlazonRequest
    add constraint FKkp7y8qt5ar6vda6si9l70rdb5
    foreign key (parent_id)
    references BlazonRequest (id)
    on delete cascade;

alter table BlazonRequest
    add constraint FKjf6m674x51u9mwbxilfjoaubh
    foreign key (requester_id)
    references User (id);

alter table BlazonRequestTransitionState
    add constraint FKmykvq410jn7did3jsdxlmit07
    foreign key (request_id)
    references BlazonRequest (id)
    on delete cascade;

alter table BlazonRequestTransitionState
    add constraint FKdpfb02nx61vcbdbqkd8739rqv
    foreign key (user_id)
    references User (id);

alter table BlazonRequestApprovalTask
    add constraint FK2m9hvmf89j85ylrxvnhsreet0
    foreign key (request_id)
    references BlazonRequest (id)
	on delete cascade;

alter table BlazonRequestApprovalTask
    add constraint FK8r1k74nte48ahv791bloft256
    foreign key (id)
    references Task (id)
	on delete cascade;

alter table BlazonRequestSodApprovalTask
    add constraint FK58jvihdng5v6oh44mt4k3sdl2
    foreign key (request_id)
    references BlazonRequest (id)
	on delete cascade;

alter table BlazonRequestSodApprovalTask
    add constraint FKaxsoqba6brt377y608jyceg6v
    foreign key (id)
    references Task (id)
	on delete cascade;

alter table CertificationApprovalTaskDetail
    add constraint FKf6pkruwwv4u3bak5es6fva6hg
    foreign key (certificationEntry_id)
    references CertificationEntry (id)
	on delete cascade;

alter table CertificationApprovalTaskDetail
    add constraint FKgol6qjog5rsxykj1vdg2sbpp1
    foreign key (task_id)
    references Task (id)
	on delete cascade;

alter table CertificationApprovalTask
    add constraint FK770roj42rrvuscky5ehyklo32
    foreign key (certificationEntry_id)
    references CertificationEntry (id)
	on delete cascade;

alter table CertificationApprovalTask
    add constraint FKmtkb4bfvbweehvx3wy2ya3x18
    foreign key (id)
    references Task (id)
	on delete cascade;

alter table CertificationEntry
    add constraint FK1x242ckfigtodvrmwt2s21i7h
    foreign key (policy_id)
    references CertificationPolicy (id)
	on delete cascade;

alter table CertificationEntry
    add constraint FK5299i3hbcyb6cnhqkscp4lieq
    foreign key (selector_id)
    references CertificationSelector (id)
	on delete cascade;

alter table CertificationEntryTransitionState
    add constraint FKt4kgtoec0sw9p3sbfy1dyug8n
    foreign key (certificationEntry_id)
    references CertificationEntry (id)
    on delete cascade;

alter table CertificationEntryTransitionState
    add constraint FKcjb7dvdoudq3ls1qg7hk8cfl8
    foreign key (user_id)
    references User (id)
	on delete cascade;

alter table DictionaryWord
    add constraint FK23f7yf9cn4xyyxscb4vqxnacn
    foreign key (dictionary_id)
    references Dictionary (id);

alter table EmailQueueEntry
    add constraint FKhw95p9qrngjhhhbr553egp03n
    foreign key (serverMailSetup_id)
    references ServerMailSetup (id);

alter table EmailQueueEntry_attachments
    add constraint FKofj5hl1vl7kcokkmtmrd9uc8d
    foreign key (EmailQueueEntry_id)
    references EmailQueueEntry (id);

alter table EmailQueueEntry_cc
    add constraint FKcs393oojcw0csr9gvqtg10jnj
    foreign key (EmailQueueEntry_id)
    references EmailQueueEntry (id);

alter table Entitlement
    add constraint FKmwoe1cawuu7y6ekm6ltcj40lm
    foreign key (resource_id)
    references Resource (id);

alter table Entitlement
    add constraint FKf7tb4nvbmbs43bb03gob9e6yp
    foreign key (id)
    references Entry (id);

alter table Entitlement_User
    add constraint FKlmakav6u37y490mv8tjjab4fa
    foreign key (owners_id)
    references User (id);

alter table Entitlement_User
    add constraint FKjtguxii21rl2719d2fpq90tt8
    foreign key (Entitlement_id)
    references Entitlement (id);

alter table EntitlementDependency
    add constraint FK8c2hddr167gwl9wt912agbouk
    foreign key (entitlement_id)
    references Entitlement (id);

alter table Entry
    add constraint FKloubsw1ex2iaxdxx97u920goh
    foreign key (createdBy_id)
    references CreatedBy (id);

alter table Entry
    add constraint FK5s46cl52y7ytyiv3jkebq6ps2
    foreign key (managedBy_id)
    references ManagedBy (id);

alter table EntryAttribute
    add constraint FKq8arfeypunklujxll0t1prjg
    foreign key (category_id)
    references EntryAttributeCategory (id);

alter table EntryAttribute
    add constraint FK3b7nputdh6cwc0wh02kaylvyu
    foreign key (resource_id)
    references Resource (id)
    on delete cascade;

alter table EntryAttributeCategory
    add constraint FK7chapw0l8505id9df08xu1naw
    foreign key (resource_id)
    references Resource (id);

alter table EntryAttributeValue
    add constraint FKa1adth5rm60gbkc72e69g48s8
    foreign key (entry_id)
    references Entry (id);

alter table Inbox
    add constraint FKhtuwyhk1gu3i1yfijo1ck9vh8
    foreign key (USERFROM_ID)
    references User (id);

alter table Inbox
    add constraint FK79ibkw2xntoyxrpo5xf8vnry2
    foreign key (USERTO_ID)
    references User (id);

alter table InternalPermissionGroup_InternalPermission
    add constraint FKmfxoqatyvpht1jk0ht5ihpsop
    foreign key (internalPermissions_id)
    references InternalPermission (id)
    on delete cascade;

alter table InternalPermissionGroup_InternalPermission
    add constraint FK6o1cu90m5pr8lgbkgsstmffkf
    foreign key (internalPermissionGroups_id)
    references InternalPermissionGroup (id)
    on delete cascade;

alter table JobExecution
    add constraint FKsa4kylsjrst7ttylibiwcmod1
    foreign key (instance_id)
    references JobInstance (id);

alter table JobInstance
    add constraint FK7n1xbo3667vo9gqy6g0vfpq7b
    foreign key (job_id)
    references Job (id);

alter table ManagedBy_objectIds
    add constraint FKgeyisftt15k3e8giphb420p1f
    foreign key (ManagedBy_id)
    references ManagedBy (id)
    on delete cascade;

alter table ManagerRole_InternalPermissionGroup
    add constraint FK8kunso8pqqje7dt6k3e1ori5k
    foreign key (internalPermissionGroups_id)
    references InternalPermissionGroup (id)
    on delete cascade;

alter table ManagerRole_InternalPermissionGroup
    add constraint FKs8fwlbu485y58f38xr6v0b842
    foreign key (managerRoles_id)
    references ManagerRole (id)
    on delete cascade;

alter table ManagerRole_User
    add constraint FKsmer9iqc8f7ftct6jmflkrh9q
    foreign key (users_id)
    references User (id)
    on delete cascade;

alter table ManagerRole_User
    add constraint FKdpe8nuqqsio11ognp6jjwmaxp
    foreign key (ManagerRole_id)
    references ManagerRole (id)
    on delete cascade;

alter table MembershipEntitlement
    add constraint FK57kgsh61bk5m573qh5veyqna3
    foreign key (account_id)
    references Account (id);

alter table MembershipEntitlement
    add constraint FKjk87b8h545g62uf007xbokihu
    foreign key (entitlement_id)
    references Entitlement (id);

alter table MembershipEntitlement
    add constraint FKs4xlv4dskbrjr0cvrdlc6d9xb
    foreign key (id)
    references Entry (id);

alter table MembershipOrganization
    add constraint FK4ttvmejb1ylo5l4muclsw29hn
    foreign key (organization_id)
    references Organization (id);

alter table MembershipOrganization
    add constraint FK1cdse9jmxa34ncw9cq2c6ksu1
    foreign key (user_id)
    references User (id);

alter table MembershipRole
    add constraint FK1kqgj58gt2vo2jyugh46weeh2
    foreign key (role_id)
    references Role (id);

alter table MembershipRole
    add constraint FK7crxwkdmr98mq57rbksjs0anw
    foreign key (user_id)
    references User (id);

alter table MembershipRole
    add constraint FK6wipg5yddudefcs8n8ummgre1
    foreign key (id)
    references Entry (id);

alter table OAuthApiClient
    add constraint FKfkraxbw1lbuq151tpqw4vl48y
    foreign key (authPolicy_uuid)
    references AuthenticationPolicy (uuid);

alter table OAuthClient
    add constraint FK1necuourvsimksnm9wqa7kia7
    foreign key (authPolicy_uuid)
    references AuthenticationPolicy (uuid);

alter table OAuthCode
    add constraint FKmjbnqbqwu5p6vfxndgekr49e4
    foreign key (user_id)
    references User (id);


alter table Organization
    add constraint FK35f0lmp4xv33i3wre6y0enkt7
    foreign key (organizationType_id)
    references OrganizationType (id);

alter table Organization
    add constraint FKt5r8fl7xglrdfv4o1q0x0l5st
    foreign key (parent_id)
    references Organization (id);

alter table Organization
    add constraint FK5keih5lyko469bl9rsaxhji4i
    foreign key (id)
    references Entry (id);

alter table Organization_User
    add constraint FK2emtdx12o2x6n1ditg3lwn4uj
    foreign key (owners_id)
    references User (id);

alter table Organization_User
    add constraint FKnpxsmlwuy7pgbj0e6e0v9w708
    foreign key (Organization_id)
    references Organization (id);

alter table OrganizationRule
    add constraint FKif4gw7kcwv9y05tyslq7xj95e
    foreign key (organization_id)
    references Organization (id)
    on delete cascade;

alter table PasswordHistory
    add constraint FKsmxgx25eb1uot0g37s4xf2bd3
    foreign key (user_id)
    references User (id);

alter table PasswordPolicy
    add constraint FKsigxxewilnlgd9pgsn4c8967w
    foreign key (dictionary_id)
    references Dictionary (id);

alter table PasswordPolicy
    add constraint FKhd5lwhodrr358hvaq3cxpxk12
    foreign key (expirationOptions_id)
    references ExpirationOptions (id);

alter table PasswordPolicySettings
    add constraint FK9bpapsauh32en5ide28cog73c
    foreign key (domainPasswordPolicy_id)
    references PasswordPolicy (id);

alter table ProfileSituation
    add constraint FKhxsny03g8oxy2qgvk354j7gy3
    foreign key (profile_id)
    references ReconciliationProfile (id)
    on delete cascade;

alter table ProfileSituation
    add constraint FKh2whscqkmd26m8rpi6eyso6c7
    foreign key (situation_id)
    references SituationDef (id);

alter table ProvisioningEntry
    add constraint FKbu8sbdbac44thjh9elco054ee
    foreign key (beneficiary_id)
    references User (id)
    on delete cascade;

alter table ProvisioningEntry
    add constraint FKl646lyu11tms5be84ipftljab
    foreign key (resource_id)
    references Resource (id)
    on delete cascade;

alter table ProvisioningEntryTransitionState
    add constraint FKpjkxw2jp93b8xt6tlqklnnuc1
    foreign key (provisioningEntry_id)
    references ProvisioningEntry (id)
    on delete cascade;

alter table ProvisioningEntryTransitionState
    add constraint FKn28apg7cx7fn3g29bpgwyt2xg
    foreign key (user_id)
    references User (id)
    on delete cascade;

alter table ProvisioningTaskDetail
    add constraint FKhe491fsdmfugd3nhjtm33juhe
    foreign key (provisioningEntry_id)
    references ProvisioningEntry (id)
    on delete cascade;

alter table ProvisioningTask
    add constraint FKl1c2esbqnv2e2ma2pabljb5af
    foreign key (provisioningEntry_id)
    references ProvisioningEntry (id)
	on delete cascade;

alter table ProvisioningTask
    add constraint FKgbr1gxk2wo4ng224c1bc7x3ld
    foreign key (id)
    references Task (id)
	on delete cascade;

alter table ReconciliationAction_entryTypes
    add constraint FK8hd8t03g0j3726kcpdpgpppia
    foreign key (ReconciliationAction_id)
    references ReconciliationAction (id)
	on delete cascade;

alter table ReconciliationAction_situationNames
    add constraint FKe1lp7kfi3p7byjg0qv6q2l3s
    foreign key (ReconciliationAction_id)
    references ReconciliationAction (id)
	on delete cascade;

alter table ReconciliationEntry
    add constraint FK_RECONCILIATIONENTRY_RECONCILIATIONPROFILE
    foreign key (profile_id)
    references ReconciliationProfile (id)
    on delete cascade;

alter table ReconciliationEntry
    add constraint FK_RECONCILIATIONENTRY_RESOURCE
    foreign key (resource_id)
    references Resource (id)
    on delete cascade;

alter table ReconciliationEntry
    add constraint FK_RECONCILIATIONENTRY_SITUATIONDEF
    foreign key (situation_id)
    references SituationDef (id);

alter table ReconciliationEntry_matchedEntriesIds
    add constraint FKresl2yi3kvxttw0u50bd70e71
    foreign key (ReconciliationEntry_id)
    references ReconciliationEntry (id)
    on delete cascade;

alter table ReconciliationEntry_matchedOwnersIds
    add constraint FKs8ertogwn11c10ckgaxtiy3qd
    foreign key (ReconciliationEntry_id)
    references ReconciliationEntry (id)
    on delete cascade;

alter table ReconciliationEntryTransitionState
    add constraint FKrko8kutvdhraroxj1on5fmcoi
    foreign key (reconciliationEntry_id)
    references ReconciliationEntry (id)
    on delete cascade;

alter table ReconciliationEntryTransitionState
    add constraint FKh8cqfpa06p1w1oyuskjd5ad2x
    foreign key (user_id)
    references User (id)
    on delete cascade;

alter table ReconciliationProfile
    add constraint FKlbdegng4oikqcjku9d00ru98d
    foreign key (resource_id)
    references Resource (id)
    on delete cascade;

alter table ReconciliationProfile_AttributeMap
    add constraint FKlmocbuq7gnhvqsmvt7cshg4t3
    foreign key (attributeMapping_id)
    references AttributeMap (id)
	on delete cascade;

alter table ReconciliationProfile_AttributeMap
    add constraint FKh9cyg4dmvcxqwi29cu55ipa2k
    foreign key (ReconciliationProfile_id)
    references ReconciliationProfile (id)
	on delete cascade;

alter table PasswordVaultEntryAttribute
   add constraint FKd7n5grfag933kk3ltft3id9cf
   foreign key (entry_id)
   references PasswordVaultEntry (id)
   on delete cascade;

alter table PasswordVaultOwner
   add constraint FKqrjlk3xsf8bwjrrf9m803raoi
   foreign key (owner_id)
   references User (id);

alter table PasswordVaultOwner
   add constraint FKh49xg1y1y5r7op4nj8e0q7g04
   foreign key (passwordVaultEntry_id)
   references PasswordVaultEntry (id)
   on delete cascade;

alter table PasswordVaultShare
   add constraint FKiieobb8qu430x50d36cbfnaog
   foreign key (passwordVaultEntry_id)
   references PasswordVaultEntry (id)
   on delete cascade;

alter table PasswordVaultShare
   add constraint FKif3c3o95w28ukd677x213ru3f
   foreign key (user_id)
   references User (id)
   on delete cascade;

alter table Resource
    add constraint FK9j6rn5rckwy1oi751ouf1jl8
    foreign key (category_id)
    references ResourceCategory (id);

alter table Resource
    add constraint FKl4wxcsqgvwd66amtm5jdkpes
    foreign key (creator_id)
    references User (id);

alter table Resource_User
    add constraint FK2o72grfqsfqguovyhol9ikxta
    foreign key (managedResources_id)
    references Resource (id);

alter table Resource_User
    add constraint FK4tjqrflase8hnoafnb2ekwhnt
    foreign key (owners_id)
    references User (id);

alter table ResourceAdapter_instances
    add constraint FKjdnjhema870r2j5wdlnqaws2f
    foreign key (ResourceAdapter_id)
    references ResourceAdapter (id);

alter table ResourceDependency
    add constraint FKpb21bc0m1vlm0bjmvom37ly3h
    foreign key (resource_id)
    references Resource (id);

alter table Rightt
    add constraint FK993y51o9f8u1gnk35f7bwrj6b
    foreign key (resource_id)
    references Resource (id)
    on delete cascade;

alter table Rightt
    add constraint FK45dr7anbxuv9f3tiagnvt1bae
    foreign key (role_id)
    references Role (id)
    on delete cascade;

alter table Rightt_Entitlement
    add constraint FKr71ppuyc2d97m4kxaj5v5lhyr
    foreign key (entitlements_id)
    references Entitlement (id)
    on delete cascade;

alter table Rightt_Entitlement
    add constraint FKo3op7ecdoqvxdytwlcg0ifsg9
    foreign key (Right_id)
    references Rightt (id)
    on delete cascade;

alter table RoleRightApprovalTaskDetail
    add constraint FK6wx7r1qyextic94w2w2nkanr2
    foreign key (roleRightEntry_id)
    references RoleRightEntry (id)
	on delete cascade;

alter table RoleRightApprovalTaskDetail
    add constraint FKcvdiq2kvg7b6i3218ypqh5iq9
    foreign key (task_id)
    references Task (id)
	on delete cascade;

alter table RoleRightApprovalTask
    add constraint FKf0c54xnh40oviagv3er1ipf6e
    foreign key (roleRightEntry_id)
    references RoleRightEntry (id)
	on delete cascade;

alter table RoleRightApprovalTask
    add constraint FK7f9ue47oixmr1a9dpsqqegtxv
    foreign key (id)
    references Task (id)
	on delete cascade;

alter table RoleRightEntry_RoleRightEntryItem
    add constraint FKmk5jn4b3ux611o3lpvgyeck6q
    foreign key (items_id)
    references RoleRightEntryItem (id)
	on delete cascade;

alter table RoleRightEntry_RoleRightEntryItem
    add constraint FK599jtliel8jj62u4iymrtv26w
    foreign key (RoleRightEntry_id)
    references RoleRightEntry (id)
	on delete cascade;

alter table RoleRightEntry_RoleRightEntryItem
    add constraint UK_mbua7nvn8f43uytgy0ynu0rrs unique (items_id);

alter table RoleRightRevokeEntry
    add constraint FKphdxpsr9f57rbn449bugd0i1f
    foreign key (role_id)
    references Role (id)
	on delete cascade;

alter table RoleRightRevokeEntry
    add constraint FKi3titmoxi1osh16n969y8pvh5
    foreign key (user_id)
    references User (id)
	on delete cascade;

alter table Role
    add constraint FKk1ko0l4ojmjy7phe9as0q045i
    foreign key (id)
    references Entry (id);

alter table Role_User
    add constraint FK7ivunvm82msb5cyqca9d1f80h
    foreign key (owners_id)
    references User (id)
    on delete cascade;

alter table Role_User
    add constraint FKs3v3hpya7d60cgd0k0vr2u3ki
    foreign key (Role_id)
    references Role (id)
    on delete cascade;

alter table SamlAuthenticationClient
    add constraint FK2ky4xh8xrkoqf0ett85s9p0ew
    foreign key (authPolicy_uuid)
    references AuthenticationPolicy (uuid);

alter table SamlAuthenticationClient_attributes
    add constraint FKm0n55p3icngb16iagpqk63x86
    foreign key (SamlAuthenticationClient_id)
    references SamlAuthenticationClient (id);

alter table SelfServiceCartItem
    add constraint FKcgghe95a25cmvh2bo3ljepxl8
    foreign key (cart_id)
    references SelfServiceCart (id)
	on delete cascade;

alter table SelfServiceCartItem_dependsOnIds
    add constraint FK20yxx2aeq73tron1nm3ovakxe
    foreign key (SelfServiceCartItem_id)
    references SelfServiceCartItem (id)
    on delete cascade;

alter table SelfServiceCartItem_payloads
    add constraint FK8nngncmlf084r9dsgv3oyckre
    foreign key (SelfServiceCartItem_id)
    references SelfServiceCartItem (id)
	on delete cascade;

alter table SodEntryTransitionState
    add constraint FKo79ld8360dxfhed9nqo9u6k4j
    foreign key (entryInfo_id)
    references SodEntry (id)
    on delete cascade;

alter table SituationDef_entryTypes
    add constraint FK6h5vye2fhw5krxfkct1thnedd
    foreign key (SituationDef_id)
    references SituationDef (id)
	on delete cascade;

alter table SodApprovalTaskDetail
    add constraint FK7n0i7uwqqmkft3kpf28lcleyx
    foreign key (sodEntry_id)
    references SodEntry (id)
	on delete cascade;

alter table SodApprovalTaskDetail
    add constraint FK7fe8k0gwsjv27t3tsadhvbens
    foreign key (task_id)
    references Task (id)
	on delete cascade;

alter table SodApprovalTask
    add constraint FKfcdv3o1yc83395u2gg987h6bo
    foreign key (sodEntry_id)
    references SodEntry (id)
	on delete cascade;

alter table SodApprovalTask
    add constraint FKjll30k6tdo4l03abflf3l4h98
    foreign key (id)
    references Task (id)
	on delete cascade;

alter table SodEntryTransitionState
	add constraint FKmbl9i755mkqc41uo0q4csb1xq
	foreign key (user_id)
	references User (id)
        on delete cascade;

alter table SodTaskDetail
	add constraint FKps4aqwpo025x7y53oedenmavb
	foreign key (request_id)
	references BlazonRequest (id);

alter table SodTaskDetail
	add constraint FK1h5y78oacm9gousrecvtirqab
	foreign key (task_id)
	references Task (id);

alter table Task
    add constraint FKaubltkebi3cdm3971uvq1pigx
    foreign key (definition_id)
    references TaskDefinition (id);

alter table Task
    add constraint FKtkw5n1qo3rv87d7cna2e4jamq
    foreign key (userFrom)
    references User (id);

alter table Task
    add constraint FKb3ex1ogyn0oeq8sjdfmupm19p
    foreign key (recipient_id)
    references User (id);

alter table TaskAssignHistory
    add constraint FKsskgpqdccr11yovasrrqlms6h
    foreign key (from_id)
    references User (id);

alter table TaskAssignHistory
    add constraint FKsl5tjl77cxj70x4wnrt5vhwjo
    foreign key (task_id)
    references Task (id)
    on delete cascade;

alter table TaskAssignHistory
    add constraint FKg8vh51ekgk3pg9d10dnrk4254
    foreign key (to_id)
    references User (id);

alter table TaskComment
    add constraint FK35lc89ximr8orsxrbqn83hny9
    foreign key (task_id)
    references Task (id)
    on delete cascade;

alter table TaskComment
    add constraint FKssui2945je39ejwmn8ndeko4i
    foreign key (user_id)
    references User (id);

alter table TaskEscalation
    add constraint FKkdte59fkncpoap720176q476a
    foreign key (queueTo_id)
    references TaskQueue (id);

alter table TaskEscalation
    add constraint FKrw2htnr2qjihfb9hl0u1htu9u
    foreign key (userFrom_id)
    references User (id);

alter table TaskEscalation
    add constraint FKi3y6rc2qe7t884f5r0i647app
    foreign key (userTo_id)
    references User (id);

alter table TaskQueue_ManagerRole
    add constraint FKrd8be9kl9ei6298118yer8jl8
    foreign key (managerRoles_id)
    references ManagerRole (id);

alter table TaskQueue_ManagerRole
    add constraint FKhchhdrrqxvqpb0l3vvtmd4vn8
    foreign key (TaskQueue_id)
    references TaskQueue (id);

alter table TaskQueue_Task
    add constraint FKofsilg5g9ggc6saro25y3ybbx
    foreign key (tasks_id)
    references Task (id)
	on delete cascade;

alter table TaskQueue_Task
    add constraint FK2xh26bycu4ts8kqccdw35gj7y
    foreign key (TaskQueue_id)
    references TaskQueue (id);

alter table User
    add constraint FK2ccifh2cnvb0jguhwb4icdj4b
    foreign key (id)
    references Entry (id);

-- workflow schema


drop table if exists OS_WORKFLOWDEFS cascade;

CREATE TABLE OS_WORKFLOWDEFS
(   ID bigint NOT NULL AUTO_INCREMENT,
	WF_NAME        varchar(100),
	WF_DESCRIPTION varchar(255),
	WF_DEFINITION  mediumblob,
	SCRIPT_DEFINITION  blob,
	DOMAINID bigint,
	primary key (ID)
);

drop table if exists OS_PROPERTYENTRY cascade;
create table OS_PROPERTYENTRY
(
	GLOBAL_KEY varchar(250) NOT NULL,
	ITEM_KEY varchar(250) NOT NULL,
	ITEM_TYPE tinyint,
	STRING_VALUE varchar(255),
	DATE_VALUE datetime,
	DATA_VALUE blob,
	FLOAT_VALUE float,
	NUMBER_VALUE numeric,
	primary key (GLOBAL_KEY, ITEM_KEY)
);

-- Beginning of Default OSUser tables
drop table if exists OS_USER cascade;
create table OS_USER
(
    USERNAME varchar(100) NOT NULL,
    PASSWORDHASH mediumtext,
    primary key (USERNAME)
);


drop table if exists OS_GROUP cascade;
create table OS_GROUP
(
    GROUPNAME varchar(20) NOT NULL,
    primary key (GROUPNAME)
);

drop table if exists OS_MEMBERSHIP cascade;
create table OS_MEMBERSHIP
(
    USERNAME varchar(20) NOT NULL,
    GROUPNAME varchar(20) NOT NULL,
    primary key (USERNAME, GROUPNAME),

    foreign key (USERNAME) references OS_USER(USERNAME),
    foreign key (GROUPNAME) references OS_GROUP(GROUPNAME)
);

-- End of Default OSUser tables



drop table if exists OS_WFENTRY cascade;
create table OS_WFENTRY
(
    ID bigint NOT NULL AUTO_INCREMENT,
    NAME varchar(60),
    STATE integer,
    primary key (ID)
);


drop table if exists OS_CURRENTSTEP;
create table OS_CURRENTSTEP
(
    ID bigint NOT NULL AUTO_INCREMENT,
    ENTRY_ID bigint,
    STEP_ID integer,
    ACTION_ID integer,
    OWNER varchar(35),
    START_DATE datetime,
    FINISH_DATE datetime,
    DUE_DATE datetime,
    STATUS varchar(40),
  	CALLER varchar(35),

    primary key (ID),

    foreign key (ENTRY_ID) references OS_WFENTRY(ID),
    foreign key (OWNER) references OS_USER(USERNAME),
    foreign key (CALLER) references OS_USER(USERNAME)
);

drop table if exists OS_HISTORYSTEP;
create table OS_HISTORYSTEP
(
    ID bigint NOT NULL AUTO_INCREMENT,
    ENTRY_ID bigint,
    STEP_ID integer,
    ACTION_ID integer,
    OWNER varchar(35),
    START_DATE datetime,
    FINISH_DATE datetime,
    DUE_DATE datetime,
    STATUS varchar(40),
    CALLER varchar(35),

    primary key (ID),

    foreign key (ENTRY_ID) references OS_WFENTRY(ID),
    foreign key (OWNER) references OS_USER(USERNAME),
    foreign key (CALLER) references OS_USER(USERNAME)
);

drop table if exists OS_CURRENTSTEP_PREV;
create table OS_CURRENTSTEP_PREV
(
    ID bigint NOT NULL AUTO_INCREMENT,
    PREVIOUS_ID bigint NOT NULL,
    primary key (ID, PREVIOUS_ID),

    foreign key (ID) references OS_CURRENTSTEP(ID),

    foreign key (PREVIOUS_ID) references OS_HISTORYSTEP(ID)
);

drop table if exists OS_HISTORYSTEP_PREV;
create table OS_HISTORYSTEP_PREV
(
    ID bigint NOT NULL AUTO_INCREMENT,
    PREVIOUS_ID bigint NOT NULL,
    primary key (ID, PREVIOUS_ID),

    foreign key (ID) references OS_HISTORYSTEP(ID),

    foreign key (PREVIOUS_ID) references OS_HISTORYSTEP(ID)
);


-- quartz schema


DROP TABLE IF EXISTS QRTZ_FIRED_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_PAUSED_TRIGGER_GRPS;
DROP TABLE IF EXISTS QRTZ_SCHEDULER_STATE;
DROP TABLE IF EXISTS QRTZ_LOCKS;
DROP TABLE IF EXISTS QRTZ_SIMPLE_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_SIMPROP_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_CRON_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_BLOB_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_JOB_DETAILS;
DROP TABLE IF EXISTS QRTZ_CALENDARS;

CREATE TABLE QRTZ_JOB_DETAILS(
	SCHED_NAME VARCHAR(120) NOT NULL,
	JOB_NAME VARCHAR(200) NOT NULL,
	JOB_GROUP VARCHAR(200) NOT NULL,
	DESCRIPTION VARCHAR(250) NULL,
	JOB_CLASS_NAME VARCHAR(250) NOT NULL,
	IS_DURABLE VARCHAR(1) NOT NULL,
	IS_NONCONCURRENT VARCHAR(1) NOT NULL,
	IS_UPDATE_DATA VARCHAR(1) NOT NULL,
	REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
	JOB_DATA BLOB NULL,
	PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP))
	ENGINE=InnoDB;

CREATE TABLE QRTZ_TRIGGERS (
	SCHED_NAME VARCHAR(120) NOT NULL,
	TRIGGER_NAME VARCHAR(200) NOT NULL,
	TRIGGER_GROUP VARCHAR(200) NOT NULL,
	JOB_NAME VARCHAR(200) NOT NULL,
	JOB_GROUP VARCHAR(200) NOT NULL,
	DESCRIPTION VARCHAR(250) NULL,
	NEXT_FIRE_TIME BIGINT(13) NULL,
	PREV_FIRE_TIME BIGINT(13) NULL,
	PRIORITY INTEGER NULL,
	TRIGGER_STATE VARCHAR(16) NOT NULL,
	TRIGGER_TYPE VARCHAR(8) NOT NULL,
	START_TIME BIGINT(13) NOT NULL,
	END_TIME BIGINT(13) NULL,
	CALENDAR_NAME VARCHAR(200) NULL,
	MISFIRE_INSTR SMALLINT(2) NULL,
	JOB_DATA BLOB NULL,
	PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
	FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
	REFERENCES QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP))
	ENGINE=InnoDB;

CREATE TABLE QRTZ_SIMPLE_TRIGGERS (
	SCHED_NAME VARCHAR(120) NOT NULL,
	TRIGGER_NAME VARCHAR(200) NOT NULL,
	TRIGGER_GROUP VARCHAR(200) NOT NULL,
	REPEAT_COUNT BIGINT(7) NOT NULL,
	REPEAT_INTERVAL BIGINT(12) NOT NULL,
	TIMES_TRIGGERED BIGINT(10) NOT NULL,
	PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
	FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
	REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
	ENGINE=InnoDB;

CREATE TABLE QRTZ_CRON_TRIGGERS (
	SCHED_NAME VARCHAR(120) NOT NULL,
	TRIGGER_NAME VARCHAR(200) NOT NULL,
	TRIGGER_GROUP VARCHAR(200) NOT NULL,
	CRON_EXPRESSION VARCHAR(120) NOT NULL,
	TIME_ZONE_ID VARCHAR(80),
	PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
	FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
	REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
	ENGINE=InnoDB;

CREATE TABLE QRTZ_SIMPROP_TRIGGERS
	  (
	    SCHED_NAME VARCHAR(120) NOT NULL,
	    TRIGGER_NAME VARCHAR(200) NOT NULL,
	    TRIGGER_GROUP VARCHAR(200) NOT NULL,
	    STR_PROP_1 VARCHAR(512) NULL,
	    STR_PROP_2 VARCHAR(512) NULL,
	    STR_PROP_3 VARCHAR(512) NULL,
	    INT_PROP_1 INT NULL,
	    INT_PROP_2 INT NULL,
	    LONG_PROP_1 BIGINT NULL,
	    LONG_PROP_2 BIGINT NULL,
	    DEC_PROP_1 NUMERIC(13,4) NULL,
	    DEC_PROP_2 NUMERIC(13,4) NULL,
	    BOOL_PROP_1 VARCHAR(1) NULL,
	    BOOL_PROP_2 VARCHAR(1) NULL,
	    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
	    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
	    REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
	ENGINE=InnoDB;

CREATE TABLE QRTZ_BLOB_TRIGGERS (
	SCHED_NAME VARCHAR(120) NOT NULL,
	TRIGGER_NAME VARCHAR(200) NOT NULL,
	TRIGGER_GROUP VARCHAR(200) NOT NULL,
	BLOB_DATA BLOB NULL,
	PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
	INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
	FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
	REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
	ENGINE=InnoDB;

CREATE TABLE QRTZ_CALENDARS (
	SCHED_NAME VARCHAR(120) NOT NULL,
	CALENDAR_NAME VARCHAR(200) NOT NULL,
	CALENDAR BLOB NOT NULL,
	PRIMARY KEY (SCHED_NAME,CALENDAR_NAME))
	ENGINE=InnoDB;

CREATE TABLE QRTZ_PAUSED_TRIGGER_GRPS (
	SCHED_NAME VARCHAR(120) NOT NULL,
	TRIGGER_GROUP VARCHAR(200) NOT NULL,
	PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP))
	ENGINE=InnoDB;

CREATE TABLE QRTZ_FIRED_TRIGGERS (
	SCHED_NAME VARCHAR(120) NOT NULL,
	ENTRY_ID VARCHAR(95) NOT NULL,
	TRIGGER_NAME VARCHAR(200) NOT NULL,
	TRIGGER_GROUP VARCHAR(200) NOT NULL,
	INSTANCE_NAME VARCHAR(200) NOT NULL,
	FIRED_TIME BIGINT(13) NOT NULL,
	PRIORITY INTEGER NOT NULL,
	STATE VARCHAR(16) NOT NULL,
	JOB_NAME VARCHAR(200) NULL,
	JOB_GROUP VARCHAR(200) NULL,
	IS_NONCONCURRENT VARCHAR(1) NULL,
	REQUESTS_RECOVERY VARCHAR(1) NULL,
	PRIMARY KEY (SCHED_NAME,ENTRY_ID))
	ENGINE=InnoDB;

CREATE TABLE QRTZ_SCHEDULER_STATE (
	SCHED_NAME VARCHAR(120) NOT NULL,
	INSTANCE_NAME VARCHAR(200) NOT NULL,
	LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
	CHECKIN_INTERVAL BIGINT(13) NOT NULL,
	PRIMARY KEY (SCHED_NAME,INSTANCE_NAME))
	ENGINE=InnoDB;

CREATE TABLE QRTZ_LOCKS (
	SCHED_NAME VARCHAR(120) NOT NULL,
	LOCK_NAME VARCHAR(40) NOT NULL,
	PRIMARY KEY (SCHED_NAME,LOCK_NAME))
	ENGINE=InnoDB;

--  Quarts INDEX

CREATE INDEX IDX_QRTZ_J_REQ_RECOVERY ON QRTZ_JOB_DETAILS(SCHED_NAME,REQUESTS_RECOVERY);
CREATE INDEX IDX_QRTZ_J_GRP ON QRTZ_JOB_DETAILS(SCHED_NAME,JOB_GROUP);
create unique index MembershipRole_Unique on MembershipRole(role_id, user_id);
create unique index MembershipEntitlement_Unique on MembershipEntitlement(entitlement_id, account_id);
create unique index Rightt_Entitlement_Unique on Rightt_Entitlement(Right_id, entitlements_id);

CREATE INDEX IDX_QRTZ_T_J ON QRTZ_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_T_JG ON QRTZ_TRIGGERS(SCHED_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_T_C ON QRTZ_TRIGGERS(SCHED_NAME,CALENDAR_NAME);
CREATE INDEX IDX_QRTZ_T_G ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_GROUP);
CREATE INDEX IDX_QRTZ_T_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_N_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_N_G_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_GROUP,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_NEXT_FIRE_TIME ON QRTZ_TRIGGERS(SCHED_NAME,NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_ST ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_STATE,NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_MISFIRE ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_ST_MISFIRE ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_NFT_ST_MISFIRE_GRP ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_GROUP,TRIGGER_STATE);

CREATE INDEX IDX_QRTZ_FT_TRIG_INST_NAME ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME);
CREATE INDEX IDX_QRTZ_FT_INST_JOB_REQ_RCVRY ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME,REQUESTS_RECOVERY);
CREATE INDEX IDX_QRTZ_FT_J_G ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_FT_JG ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_FT_T_G ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
CREATE INDEX IDX_QRTZ_FT_TG ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_GROUP);

-- Provisioning INDEX_WF_DEFINITION_BY_NAME

CREATE INDEX search_provisioning_by_status_and_lock ON ProvisioningEntry (status, lockNumber);
CREATE INDEX search_provisioning_by_status ON ProvisioningEntry (status);
CREATE INDEX search_provisioning_by_id_and_status ON ProvisioningEntry (id, status);
CREATE INDEX search_provisioning_by_id ON ProvisioningEntry (id);
CREATE INDEX search_provisioning_by_status_and_provisioningTypeObjectId ON ProvisioningEntry (status, provisioningTypeObjectId);

-- CertificationEntry Indexes

CREATE INDEX search_certification_entry_by_entryId_and_entryType ON CertificationEntry (entryId, entryType, status);

CREATE INDEX search_certification_entry_by_entryId_and_entryType_and_status ON CertificationEntry (entryId, entryType, status);

-- Reconciliation INDEX
CREATE INDEX search_reconciliation_by_status_and_lock ON ReconciliationEntry (status, lockNumber);
CREATE INDEX search_reconciliation_by_status ON ReconciliationEntry (status);
CREATE INDEX search_reconciliation_by_id_and_status ON ReconciliationEntry (id, status);
CREATE INDEX search_reconciliation_by_id ON ReconciliationEntry (id);
CREATE INDEX search_reconciliation_by_id_and_situation_id ON ReconciliationEntry (id, situation_id);
CREATE INDEX search_reconciliation_by_id_and_profile_id ON ReconciliationEntry (id, profile_id);
CREATE INDEX search_reconciliation_by_id_and_resource_id ON ReconciliationEntry (id, resource_id);
CREATE INDEX search_reconciliation_by_profile_id ON ReconciliationEntry (profile_id);
CREATE INDEX search_reconciliation_by_resource_id ON ReconciliationEntry (resource_id);
CREATE INDEX search_reconciliation_by_situation_id ON ReconciliationEntry (situation_id);
CREATE INDEX search_reconciliation_by_batch_id ON ReconciliationEntry (batchid);
CREATE INDEX search_reconciliation_by_batch_id_date ON ReconciliationEntry (batchid, date);
CREATE INDEX search_reconciliation_by_effectiveDate_status_lockNumber ON ReconciliationEntry (effectiveDate, status, lockNumber);
CREATE INDEX search_reconciliation_by_effectiveDate_status_lockNumber_batchId ON ReconciliationEntry (effectiveDate, status, lockNumber, batchId);


-- JobExecution INDEX
CREATE INDEX search_job_execution_by_id ON JobExecution (id);
CREATE INDEX search_job_execution_by_status ON JobExecution (status);
CREATE INDEX search_job_execution_by_start_date ON JobExecution (start);
CREATE INDEX search_job_execution_by_end_date ON JobExecution (end);
CREATE INDEX search_job_execution_by_instance_id ON JobExecution (instance_id);
CREATE INDEX search_job_execution_by_id_instance_id ON JobExecution (id, instance_id);

-- JobInstance INDEX
CREATE INDEX search_job_instance_id ON JobInstance (id);


-- Request INDEX
CREATE INDEX search_blazon_request_by_id ON BlazonRequest (id);
CREATE INDEX search_blazon_request_by_status_and_lock ON BlazonRequest (status, lockNumber);
CREATE INDEX search_blazon_request_by_status_and_lock_and_effectivedate ON BlazonRequest (status, lockNumber, effectiveDate);
CREATE INDEX search_blazon_request_by_id_status_and_lock_and_effectivedate ON BlazonRequest (id, status, lockNumber, effectiveDate);
CREATE INDEX search_blazon_request_by_id_status_and_lock_and_parent_id ON BlazonRequest (id, status, lockNumber, parent_id);
CREATE INDEX search_blazon_request_by_status ON BlazonRequest (status);

CREATE INDEX search_blazon_request_assign_entitlment_validation ON BlazonRequest (id, beneficiary_id, entitlementId, resourceId, type, status);
CREATE INDEX search_blazon_request_assign_role_validation ON BlazonRequest (id, beneficiary_id, roleId, type, status);
CREATE INDEX search_blazon_request_revoke_account_validation ON BlazonRequest (id, accountId, type, status);
CREATE INDEX search_blazon_request_revoke_entitlement_validation ON BlazonRequest (id, accountId, entitlementId, type, status);
CREATE INDEX search_blazon_request_remove_user_validation ON BlazonRequest (id, beneficiary_id, type, status);

-- USER INDEX
CREATE INDEX search_user_by_id ON User (id);

-- ENTRY INDEX
CREATE INDEX search_entry_by_id ON Entry (id);

CREATE INDEX search_entry_by_state ON Entry (state);
CREATE INDEX search_entry_by_type ON Entry (type);
CREATE INDEX search_entry_by_risk ON Entry (risk);
CREATE INDEX search_entry_by_state_and_type_and_risk ON Entry (state, type, risk);


-- ENTITLEMENT INDEX
CREATE INDEX search_entitlement_by_name ON Entitlement (name);
CREATE INDEX search_entitlement_by_id ON Entitlement (id);

-- Sessoin INDEX

CREATE UNIQUE INDEX Blazon_Access_Manager_Session_ID ON BlazonAccessManagerSession (ID);


-- OS Workflow INDEX
CREATE INDEX INDEX_WF_DEFINITION_BY_NAME ON OS_WORKFLOWDEFS (WF_NAME);
CREATE INDEX INDEX_OS_CURRENTSTEP_BY_ENTRY_ID ON OS_CURRENTSTEP (ENTRY_ID);
CREATE INDEX INDEX_OS_PROPERTYENTRY_BY_GLOBAL_KEY ON OS_PROPERTYENTRY (GLOBAL_KEY);
CREATE INDEX INDEX_OS_PROPERTYENTRY_BY_ITEM_KEY ON OS_PROPERTYENTRY (ITEM_KEY);
CREATE INDEX INDEX_OS_PROPERTYENTRY_BY_ITEM_KEY_AND_GLOBAL_KEY ON OS_PROPERTYENTRY (ITEM_KEY, GLOBAL_KEY);
CREATE INDEX INDEX_OS_PROPERTYENTRY_BY_GLOBAL_KEY_AND_ITEM_KEY ON OS_PROPERTYENTRY(GLOBAL_KEY, ITEM_KEY);
CREATE INDEX INDEX_OS_PROPERTYENTRY_BY_OS_CURRENTSTEP_PREV ON OS_CURRENTSTEP_PREV (PREVIOUS_ID);

commit;
