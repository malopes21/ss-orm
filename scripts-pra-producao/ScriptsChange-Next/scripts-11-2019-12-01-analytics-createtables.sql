
-- create table ANALYTICS (version 2.0)

create table ANALYTICS_CERTIFICATION_CAMPAIGN_DETAIL_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_CAMPAIGN_DETAIL_POLICY_DIMENSION_ID bigint,
    CERTIFICATION_CAMPAIGN_RESUME_FACT_ID bigint,
    amountCanceled bigint,
    amountCertified bigint,
    amountError bigint,
    amountOpen bigint,
    amountRevoked bigint,
    averageTime bigint,
    date datetime,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_CAMPAIGN_POLICY_DIMENSION (
    id bigint not null auto_increment,
    policyId bigint,
    policyName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_CAMPAIGN_RESUME_FACT (
    id bigint not null auto_increment,
    amountCertificationEntries bigint,
    creationDate datetime,
    date datetime,
    deadline datetime,
    finalizeDate datetime,
    instanceId bigint,
    lastDetailDiscovery datetime,
    name varchar(255),
    slaReached bit,
    status varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_EXECUTOR_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_EXECUTOR_ENTRYTYPE_DIMENSION varchar(255),
    CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION_ID bigint,
    CERTIFICATION_EXECUTOR_USER_DIMENSION_ID bigint,
    amountCertified bigint,
    amountOpen bigint,
    amountRevoked bigint,
    averageTime bigint,
    date datetime,
    finalized bigint,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION (
    id bigint not null auto_increment,
    instanceId bigint,
    instanceName varchar(255),
    instanceType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_EXECUTOR_USER_DIMENSION (
    id bigint not null auto_increment,
    displayname varchar(255),
    userId bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_MICRO_DETAIL_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_MICRO_RESUME_FACT_ID bigint,
    amountCanceled bigint,
    amountCertified bigint,
    amountError bigint,
    amountOpen bigint,
    amountRevoked bigint,
    averageTime bigint,
    date datetime,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_MICRO_RESUME_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_MICRO_ENTRYTYPE_DIMENSION varchar(255),
    amountCertificationEntries bigint,
    creationDate datetime,
    date datetime,
    deadline datetime,
    finalizeDate datetime,
    instanceId bigint,
    lastDetailDiscovery datetime,
    name varchar(255),
    slaReached bit,
    status varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_SELECTOR_DETAIL_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_SELECTOR_ENTRYTYPE_DIMENSION varchar(255),
    CERTIFICATION_SELECTOR_RESUME_FACT_ID bigint,
    amountCanceled bigint,
    amountCertified bigint,
    amountError bigint,
    amountOpen bigint,
    amountRevoked bigint,
    averageTime bigint,
    date datetime,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_SELECTOR_RESUME_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_SELECTOR_SELECTOR_DIMENSION_ID bigint,
    CERTIFICATION_SELECTOR_USER_DIMENSION_ID bigint,
    amountCertificationEntries bigint,
    creationDate datetime,
    date datetime,
    deadline datetime,
    finalizeDate datetime,
    instanceId bigint,
    lastDetailDiscovery datetime,
    name varchar(255),
    slaReached bit,
    status varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_SELECTOR_SELECTOR_DIMENSION (
    id bigint not null auto_increment,
    selectorId bigint,
    selectorName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_SELECTOR_USER_DIMENSION (
    id bigint not null auto_increment,
    displayName varchar(255),
    userId bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_TASK_FACT (
    id bigint not null auto_increment,
    CERTIFICATION_TASK_ENTRYTYPE_DIMENSION varchar(255),
    CERTIFICATION_TASK_INSTANCE_DIMENSION_ID bigint,
    amountOpen bigint,
    averageTime bigint,
    certified bigint,
    created bigint,
    date datetime,
    revoked bigint,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_CERTIFICATION_TASK_INSTANCE_DIMENSION (
    id bigint not null auto_increment,
    instanceId bigint,
    instanceType varchar(255),
    primary key (id)
) ENGINE=InnoDB;


create table ANALYTICS_PROVISIONING_ENTRY_ENTRY_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_ENTRY_FACT (
    id bigint not null auto_increment,
    PROVISIONING_ENTRY_ENTRY_DIMENSION_ID bigint,
    PROVISIONING_ENTRY_OPERATION_DIMENSION_ID bigint,
    PROVISIONING_ENTRY_TYPE_DIMENSION_ID bigint,
    averageTime bigint,
    created bigint,
    date datetime,
    errorFinalized bigint,
    open bigint,
    successFinalized bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_ENTRY_OPERATION_DIMENSION (
    id bigint not null auto_increment,
    operation varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_ENTRY_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_ENTRY_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_EXECUTOR_ENTRY_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_EXECUTOR_FACT (
    id bigint not null auto_increment,
    PROVISIONING_TASK_EXECUTOR_ENTRY_DIMENSION_ID bigint,
    PROVISIONING_TASK_EXECUTOR_TYPE_DIMENSION_ID bigint,
    PROVISIONING_TASK_EXECUTOR_USER_DIMENSION_ID bigint,
    averageTime bigint,
    date datetime,
    finalized bigint,
    open bigint,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_EXECUTOR_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_EXECUTOR_USER_DIMENSION (
    id bigint not null auto_increment,
    displayName varchar(255),
    userId bigint,
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_FACT (
    id bigint not null auto_increment,
    PROVISIONING_TASK_ENTRY_DIMENSION_ID bigint,
    PROVISIONING_TASK_TYPE_DIMENSION_ID bigint,
    amountDone bigint,
    amountTodo bigint,
    amountWaitingAssign bigint,
    averageTime bigint,
    created bigint,
    date datetime,
    notProvisioned bigint,
    provisioned bigint,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_QUEUE_ENTRY_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_QUEUE_FACT (
    id bigint not null auto_increment,
    PROVISIONING_TASK_QUEUE_ENTRY_DIMENSION_ID bigint,
    PROVISIONING_TASK_QUEUE_NAME_DIMENSION_ID bigint,
    PROVISIONING_TASK_QUEUE_TYPE_DIMENSION_ID bigint,
    amount bigint,
    averageTimeOnQueue bigint,
    date datetime,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_QUEUE_NAME_DIMENSION (
    id bigint not null auto_increment,
    queue varchar(255),
    queueId bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_QUEUE_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_PROVISIONING_TASK_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_RESUME_BATCH_DIMENSION (
    id bigint not null auto_increment,
    batch varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_RESUME_FACT (
    id bigint not null auto_increment,
    RECONCILIATION_RESUME_BATCH_DIMENSION_ID bigint,
    RECONCILIATION_RESUME_PROFILE_DIMENSION_ID bigint,
    RECONCILIATION_RESUME_RESOURCE_DIMENSION_ID bigint,
    averageTime bigint,
    conflictResolved bigint,
    created bigint,
    date datetime,
    errorFinalized bigint,
    processedWithoutAction bigint,
    successFinalized bigint,
    waitingManualAction bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_RESUME_PROFILE_DIMENSION (
    id bigint not null auto_increment,
    profileId bigint,
    profileName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_RESUME_RESOURCE_DIMENSION (
    id bigint not null auto_increment,
    resourceId bigint,
    resourceName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_SITUATION_BATCH_DIMENSION (
    id bigint not null auto_increment,
    batch varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_SITUATION_ENTRY_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_SITUATION_FACT (
    id bigint not null auto_increment,
    RECONCILIATION_SITUATION_BATCH_DIMENSION_ID bigint,
    RECONCILIATION_SITUATION_ENTRY_TYPE_DIMENSION_ID bigint,
    RECONCILIATION_SITUATION_PROFILE_DIMENSION_ID bigint,
    RECONCILIATION_SITUATION_RESOURCE_DIMENSION_ID bigint,
    amount bigint,
    date datetime,
    situation varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_SITUATION_PROFILE_DIMENSION (
    id bigint not null auto_increment,
    profileId bigint,
    profileName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_RECONCILIATION_SITUATION_RESOURCE_DIMENSION (
    id bigint not null auto_increment,
    resourceId bigint,
    resourceName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_ENTRY_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_ENTRY_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_FACT (
    id bigint not null auto_increment,
    REQUEST_APPROVAL_TASK_EXECUTOR_ENTRY_DIMENSION_ID bigint,
    REQUEST_APPROVAL_TASK_EXECUTOR_TYPE_DIMENSION_ID bigint,
    REQUEST_APPROVAL_TASK_EXECUTOR_USER_DIMENSION_ID bigint,
    averageTime bigint,
    created bigint,
    date datetime,
    finalized bigint,
    open bigint,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_EXECUTOR_USER_DIMENSION (
    id bigint not null auto_increment,
    displayName varchar(255),
    userId bigint,
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_FACT (
    id bigint not null auto_increment,
    REQUEST_APPROVAL_TASK_ENTRY_DIMENSION_ID bigint,
    REQUEST_APPROVAL_TASK_TYPE_DIMENSION_ID bigint,
    approved bigint,
    averageTime bigint,
    created bigint,
    date datetime,
    disapproved bigint,
    open bigint,
    resolved bigint,
    slaReached bigint,
    slaUnreached bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_APPROVAL_TASK_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_RESUME_ENTRYTYPE_DIMENSION (
    id bigint not null auto_increment,
    entryId bigint,
    entryName varchar(255),
    entryType varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_RESUME_FACT (
    id bigint not null auto_increment,
    REQUEST_ENTRYTYPE_DIMENSION_ID bigint,
    REQUEST_TYPE_DIMENSION_ID bigint,
    approvalAverageTime bigint,
    approvalNotRequired bigint,
    approvalRequired bigint,
    approved bigint,
    averageTime bigint,
    canceled bigint,
    created bigint,
    date datetime,
    disapproved bigint,
    error bigint,
    generatedBySystem bigint,
    manuallyCreated bigint,
    provisioningAverageTime bigint,
    sodAllowed bigint,
    sodAverageTime bigint,
    sodNotAllowed bigint,
    sodNotRequired bigint,
    sodRequired bigint,
    success bigint,
    validationError bigint,
    waitingApproval bigint,
    waitingProvisioning bigint,
    waitingSodResolution bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ANALYTICS_REQUEST_RESUME_TYPE_DIMENSION (
    id bigint not null auto_increment,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

