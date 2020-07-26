
-- entitlement change owner

create table ChangeEntitlementOwnerEntitlement (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    entitlementName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ChangeEntitlementOwnerEntry (
    id bigint not null auto_increment,
    createdAt datetime,
    resolveNote varchar(1000),
    resolvedAt datetime,
    status varchar(255),
    currentOwner_id bigint,
    entitlement_id bigint,
    newOwner_id bigint,
    resolvedBy_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ChangeEntitlementOwnerEntry_actions (
    ChangeEntitlementOwnerEntry_id bigint not null,
    actions varchar(255)
) ENGINE=InnoDB;

create table ChangeEntitlementOwnerUser (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;


-- resource change owner

create table ChangeResourceOwnerEntry (
    id bigint not null auto_increment,
    createdAt datetime,
    resolveNote varchar(1000),
    resolvedAt datetime,
    status varchar(255),
    currentOwner_id bigint,
    newOwner_id bigint,
    resolvedBy_id bigint,
    resource_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ChangeResourceOwnerEntry_actions (
    ChangeResourceOwnerEntry_id bigint not null,
    actions varchar(255)
) ENGINE=InnoDB;

create table ChangeResourceOwnerResource (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    resourceId bigint,
    resourceName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ChangeResourceOwnerUser (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;


-- role change owner

create table ChangeRoleOwnerEntry (
    id bigint not null auto_increment,
    createdAt datetime,
    resolveNote varchar(1000),
    resolvedAt datetime,
    status varchar(255),
    currentOwner_id bigint,
    newOwner_id bigint,
    resolvedBy_id bigint,
    role_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ChangeRoleOwnerEntry_actions (
    ChangeRoleOwnerEntry_id bigint not null,
    actions varchar(255)
) ENGINE=InnoDB;

create table ChangeRoleOwnerRole (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    roleName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ChangeRoleOwnerUser (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;


-- SodPolicy

alter table SodPolicy drop column position;

alter table SodPolicy add column dutyName varchar(255);

alter table Duty add column name varchar(255);

alter table SodEntry add column sodPolicyName varchar(255);

alter table SodPolicy add column expirationDays integer;

alter table Entry add column sodVerifiedAt datetime;

alter table SodEntry add column newDirectoryEntry bit;

alter table BlazonRequest add column sodEntryId bigint;

create table SodPolicy (
    id bigint not null auto_increment,
    description varchar(255),
    dutyId bigint,
    dutyName varchar(255),
    dutyType varchar(255),
    enabled boolean default true,
    expirationDays integer,
    modifiedAt datetime,
    name varchar(255),
    rules longtext,
    whenSodMatchOperation varchar(255),
    workflow varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table Duty (
    id bigint not null auto_increment,
    dutyId bigint,
    name varchar(255),
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;


create table SodPolicy_Duty (
    SodPolicy_id bigint not null,
    conflictingDuties_id bigint not null,
    primary key (SodPolicy_id, conflictingDuties_id)
) ENGINE=InnoDB;

create table SodEntry (
    id bigint not null auto_increment,
    createdAt datetime,
    lockDate datetime,
    lockNumber bigint,
    processedAt datetime,
    result varchar(255),
    sodPolicyId bigint,
    sodPolicyName varchar(255),
    status varchar(255),
    type varchar(255),
    workflowId bigint,
    beneficiary_id bigint,
    sodInternalEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;


create table Entry (
    id bigint not null auto_increment,
    certifiable boolean default true,
    certificatedAt datetime,
    createdAt datetime,
    directoryIndexationSynchronized boolean default false,
    expireAt datetime,
    lastCertificationExecutionDate datetime,
    modifiedAt datetime,
    provisioningStatus varchar(255) not null,
    risk varchar(255),
    selfServiceSynchronized boolean default false,
    sodValidatedAt datetime,
    sodVerifiedAt datetime,
    state varchar(255) not null,
    type varchar(255),
    visibleToSelfService boolean default true,
    createdBy_id bigint,
    managedBy_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table BlazonRequest (
    id bigint not null auto_increment,
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
    finalizeDate datetime,
    generatedBySystem boolean default false,
    justification varchar(1000),
    lockDate datetime,
    lockNumber bigint,
    needApproval bit not null,
    payload longtext,
    payloadWithItemThatViolatesSodPolicy boolean default false,
    provisioningEntryId bigint,
    provisioningFinishedAt datetime,
    provisioningStartedAt datetime,
    sodEntryId bigint,
    sodFinishedAt datetime,
    sodProcess varchar(255),
    sodStartedAt datetime,
    sodWorkflowId bigint,
    status varchar(255),
    type varchar(255),
    beneficiary_id bigint,
    requestInternalEntry_id bigint,
    requester_id bigint,
    primary key (id)
) ENGINE=InnoDB;

alter table Resource add column accessClassification_id bigint;

alter table Role add column accessClassification_id bigint;

alter table Entitlement add column accessClassification_id bigint;

alter table SodApprovalTaskDetail drop column task_id;

alter table SodApprovalTaskDetail add column taskId bigint;

-- ---------------------------------------------------------------- InternalPermissions Change Entitlement Owner Entry

-- inserts para InternalPermissions 

insert into InternalPermission (category, description, label, name) values ('MANAGEMENT', 'Listar Entradas de Mudança de Proprietário de Direito.', 'Listar Entradas de Mudança de Proprietário de Direito.', 'LIST_CHANGE_ENTITLEMENT_OWNER_ENTRY');
insert into InternalPermission (category, description, label, name) values ('MANAGEMENT', 'Editar Entradas de Mudança de Proprietário de Direito.', 'Editar Entradas de Mudança de Proprietário de Direito.', 'EDIT_CHANGE_ENTITLEMENT_OWNER_ENTRY');

-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Mudanças de Proprietário de Direito.', 'Visualizar Mudanças de Proprietário de Direito.', 'CHANGE_ENTITLEMENT_OWNER_VISUALIZE');
insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Gerenciar Mudanças de Proprietário de Direito.', 'Gerenciar Mudanças de Proprietário de Direito.', 'CHANGE_ENTITLEMENT_OWNER_MANAGE');


-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_ENTITLEMENT_OWNER_VISUALIZE' and ip.name = 'LIST_CHANGE_ENTITLEMENT_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_ENTITLEMENT_OWNER_MANAGE' and ip.name = 'LIST_CHANGE_ENTITLEMENT_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_ENTITLEMENT_OWNER_MANAGE' and ip.name = 'EDIT_CHANGE_ENTITLEMENT_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_ENTITLEMENT_OWNER_VISUALIZE' and ip.name = 'LIST_USER';


-- ---------------------------------------------------------------- InternalPermissions Change Role Owner Entry

-- inserts para InternalPermissions 

insert into InternalPermission (category, description, label, name) values ('MANAGEMENT', 'Listar Entradas de Mudança de Proprietário de Papel.', 'Listar Entradas de Mudança de Proprietário de Papel.', 'LIST_CHANGE_ROLE_OWNER_ENTRY');
insert into InternalPermission (category, description, label, name) values ('MANAGEMENT', 'Editar Entradas de Mudança de Proprietário de Papel.', 'Editar Entradas de Mudança de Proprietário de Papel.', 'EDIT_CHANGE_ROLE_OWNER_ENTRY');

-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Mudanças de Proprietário de Papel.', 'Visualizar Mudanças de Proprietário de Papel.', 'CHANGE_ROLE_OWNER_VISUALIZE');
insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Gerenciar Mudanças de Proprietário de Papel.', 'Gerenciar Mudanças de Proprietário de Papel.', 'CHANGE_ROLE_OWNER_MANAGE');


-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_ROLE_OWNER_VISUALIZE' and ip.name = 'LIST_CHANGE_ROLE_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_ROLE_OWNER_MANAGE' and ip.name = 'LIST_CHANGE_ROLE_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_ROLE_OWNER_MANAGE' and ip.name = 'EDIT_CHANGE_ROLE_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_ROLE_OWNER_MANAGE' and ip.name = 'LIST_USER';


-- ---------------------------------------------------------------- InternalPermissions Change Resource Owner Entry

-- inserts para InternalPermissions 

insert into InternalPermission (category, description, label, name) values ('MANAGEMENT', 'Listar Entradas de Mudança de Proprietário de Recurso.', 'Listar Entradas de Mudança de Proprietário de Recurso.', 'LIST_CHANGE_RESOURCE_OWNER_ENTRY');
insert into InternalPermission (category, description, label, name) values ('MANAGEMENT', 'Editar Entradas de Mudança de Proprietário de Recurso.', 'Editar Entradas de Mudança de Proprietário de Recurso.', 'EDIT_CHANGE_RESOURCE_OWNER_ENTRY');

-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Mudanças de Proprietário de Recurso.', 'Visualizar Mudanças de Proprietário de Recurso.', 'CHANGE_RESOURCE_OWNER_VISUALIZE');
insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Gerenciar Mudanças de Proprietário de Recurso.', 'Gerenciar Mudanças de Proprietário de Recurso.', 'CHANGE_RESOURCE_OWNER_MANAGE');


-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_RESOURCE_OWNER_VISUALIZE' and ip.name = 'LIST_CHANGE_RESOURCE_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_RESOURCE_OWNER_MANAGE' and ip.name = 'LIST_CHANGE_RESOURCE_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_RESOURCE_OWNER_MANAGE' and ip.name = 'EDIT_CHANGE_RESOURCE_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_RESOURCE_OWNER_MANAGE' and ip.name = 'LIST_USER';



-- ---------------------------------------------------------------- InternalPermissions Audit Log

-- inserts para InternalPermissions 

insert into InternalPermission (category, description, label, name) values ('MANAGEMENT', 'Listar Logs de Auditoria.', 'Listar Logs de Auditoria.', 'LIST_AUDIT_LOG');

-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Logs de Auditoria.', 'Visualizar Logs de Auditoria.', 'AUDIT_LOG_VISUALIZE');

-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'AUDIT_LOG_VISUALIZE' and ip.name = 'LIST_AUDIT_LOG';



-- ---------------------------------------------------------------- InternalPermissions Access Classification

-- inserts para InternalPermissions 

insert into InternalPermission (category, description, label, name) values ('DIRECTORY', 'Listar Classificação de Acesso.', 'Listar Classificação de Acesso.', 'LIST_ACCESS_CLASSIFICATION');

insert into InternalPermission (category, description, label, name) values ('DIRECTORY', 'Editar Classificação de Acesso.', 'Editar Classificação de Acesso.', 'EDIT_ACCESS_CLASSIFICATION');


-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('DIRECTORY', 'Visualizar Classificação de Acesso.', 'Visualizar Classificação de Acesso.', 'ACCESS_CLASSIFICATION_VISUALIZE');

insert into InternalPermissionGroup (category, description, label, name) values ('DIRECTORY', 'Gerenciar Classificação de Acesso.', 'Gerenciar Classificação de Acesso.', 'ACCESS_CLASSIFICATION_MANAGE');

-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCESS_CLASSIFICATION_VISUALIZE' and ip.name = 'LIST_ACCESS_CLASSIFICATION';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCESS_CLASSIFICATION_MANAGE' and ip.name = 'LIST_ACCESS_CLASSIFICATION';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCESS_CLASSIFICATION_MANAGE' and ip.name = 'EDIT_ACCESS_CLASSIFICATION';




