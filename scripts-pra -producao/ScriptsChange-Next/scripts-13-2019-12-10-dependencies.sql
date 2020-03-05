
----------------- BlazonRequest -------------------------------------------------------------------------------------------------------------------------

-- copiar os dados antes pra tabela BlazonRequestTemp: de accountId, entitlementId, roleId, resourceId, beneficiary_id, requester_id, membershipId;

create table BlazonRequestTemp ( 
  	request_id bigint, 
  	accountId bigint, 
  	entitlementId bigint, 
  	membershipId bigint, 
	roleId bigint, 
	resourceId bigint, 
	beneficiary_id bigint, 
	requester_id bigint, 
	requestType varchar(255) 
);

insert into BlazonRequestTemp (request_id, accountId, entitlementId, membershipId, roleId, resourceId, beneficiary_id, requester_id, requestType) 
select id, accountId, entitlementId, membershipId, roleId, resourceId, beneficiary_id, requester_id, type 
from BlazonRequest;

-- drop foreign keys

ALTER TABLE BlazonRequestTransitionState
  DROP FOREIGN KEY FKdpfb02nx61vcbdbqkd8739rqv;

ALTER TABLE BlazonRequest
  DROP FOREIGN KEY FKjf6m674x51u9mwbxilfjoaubh;

ALTER TABLE BlazonRequest
  DROP FOREIGN KEY FKmahlggwuo8v5moybi6ajxpef;

-- drop columns

ALTER TABLE BlazonRequestTransitionState
DROP COLUMN user_id;

ALTER TABLE BlazonRequest
DROP COLUMN accountId;

ALTER TABLE BlazonRequest
DROP COLUMN entitlementId;

ALTER TABLE BlazonRequest
DROP COLUMN roleId;

ALTER TABLE BlazonRequest
DROP COLUMN resourceId;

ALTER TABLE BlazonRequest
DROP COLUMN beneficiary_id;

ALTER TABLE BlazonRequest
DROP COLUMN requester_id;

-- add columns

ALTER TABLE BlazonRequest
ADD COLUMN beneficiary_id bigint;

ALTER TABLE BlazonRequest
ADD COLUMN requester_id bigint;

ALTER TABLE BlazonRequest
ADD COLUMN requestInternalEntry_id bigint;

-- create tables

create table BlazonRequestDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    name varchar(255),
    accountIdentifier varchar(255),
    resourceId bigint,
    resourceName varchar(255),
    accountId bigint,
    entitlementId bigint,
    entitlementName varchar(255),
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;


-- alter tables ???

-------------------- Task -------------------------------------------------------------------------------------------------------------------------

-- copiar os dados de recipient_id antes


-- drop foreign keys

ALTER TABLE Task
  DROP FOREIGN KEY FKtkw5n1qo3rv87d7cna2e4jamq;

ALTER TABLE Task
  DROP FOREIGN KEY FKb3ex1ogyn0oeq8sjdfmupm19p;

ALTER TABLE TaskComment
  DROP FOREIGN KEY FKssui2945je39ejwmn8ndeko4i;

ALTER TABLE TaskAssignHistory
  DROP FOREIGN KEY FKg8vh51ekgk3pg9d10dnrk4254;

ALTER TABLE TaskAssignHistory
  DROP FOREIGN KEY FKsskgpqdccr11yovasrrqlms6h;

ALTER TABLE TaskEscalation
  DROP FOREIGN KEY FKi3y6rc2qe7t884f5r0i647app;

ALTER TABLE TaskEscalation
  DROP FOREIGN KEY FKrw2htnr2qjihfb9hl0u1htu9u;

-- drop index `FKtkw5n1qo3rv87d7cna2e4jamq` on Task;

-- drop index `FKb3ex1ogyn0oeq8sjdfmupm19p` on Task;

-- drop columns

ALTER TABLE Task
DROP COLUMN userFrom;

ALTER TABLE Task
DROP COLUMN recipient_id;

-- add columns

ALTER TABLE Task
ADD COLUMN recipient_id bigint;

ALTER TABLE Task
ADD COLUMN requester_id bigint;

-- create tables

create table UserTask (
    id bigint not null auto_increment,
    displayName varchar(255),
    directoryIdentifier bigint,
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- alter tables ???


--------------- CertificationEntry -------------------------------------------------------------------------------------------------------------------------

-- drop constraints ???

ALTER TABLE CertificationEntryTransitionState
  DROP FOREIGN KEY FKcjb7dvdoudq3ls1qg7hk8cfl8;

-- drop columns

ALTER TABLE CertificationEntry
DROP COLUMN entitlementId;

ALTER TABLE CertificationEntry
DROP COLUMN resourceId;

ALTER TABLE CertificationEntry
DROP COLUMN roleId;

ALTER TABLE CertificationEntry
DROP COLUMN userId;

-- add columns

ALTER TABLE CertificationEntry
ADD COLUMN certificationInternalEntry_id bigint;

-- create tables

create table CertificationDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    name varchar(255),
    displayName varchar(255),
    roleId bigint,
    roleName varchar(255),
    userId bigint,
    username varchar(255),
    accountIdentifier varchar(255),
    resourceId bigint,
    resourceName varchar(255),
    accountId bigint,
    entitlementId bigint,
    entitlementName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- alter tables ????


--------------- ProvisioningEntry -------------------------------------------------------------------------------------------------------------------------

-- drop foreign keys

ALTER TABLE ProvisioningEntry
  DROP FOREIGN KEY FKbu8sbdbac44thjh9elco054ee;

ALTER TABLE ProvisioningEntry
  DROP FOREIGN KEY FKl646lyu11tms5be84ipftljab;

ALTER TABLE ProvisioningEntryTransitionState
  DROP FOREIGN KEY FKn28apg7cx7fn3g29bpgwyt2xg;

-- drop columns

ALTER TABLE ProvisioningEntry
DROP COLUMN accountId;

ALTER TABLE ProvisioningEntry
DROP COLUMN entitlementId;

ALTER TABLE ProvisioningEntry
DROP COLUMN roleId;

ALTER TABLE ProvisioningEntry
DROP COLUMN organizationId;

ALTER TABLE ProvisioningEntry
DROP COLUMN beneficiary_id;

ALTER TABLE ProvisioningEntry
DROP COLUMN resource_id;

-- add columns

ALTER TABLE ProvisioningEntry
ADD COLUMN beneficiary_id bigint;

ALTER TABLE ProvisioningEntry
ADD COLUMN resource_id bigint;

ALTER TABLE ProvisioningEntry
ADD COLUMN provisioningInternalEntry_id bigint;

-- create tables

create table ProvisioningDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    name varchar(255),
    accountId bigint,
    accountIdentifier varchar(255),
    entitlementId bigint,
    entitlementName varchar(255),
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;


-- alter tables ???

---------------- SodEntry -------------------------------------------------------------------------------------------------------------------------

-- drop foreign keys 

ALTER TABLE SodEntryTransitionState
  DROP FOREIGN KEY FKmbl9i755mkqc41uo0q4csb1xq;

-- drop columns

ALTER TABLE SodEntry
DROP COLUMN accountId;

ALTER TABLE SodEntry
DROP COLUMN entitlementId;

ALTER TABLE SodEntry
DROP COLUMN resourceId;

ALTER TABLE SodEntry
DROP COLUMN roleId;

ALTER TABLE SodEntry
DROP COLUMN userId;

-- add columns

ALTER TABLE SodEntry
ADD COLUMN beneficiary_id bigint;

ALTER TABLE SodEntry
ADD COLUMN sodInternalEntry_id bigint;

-- create tables

create table SodDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    username varchar(255),
    accountId bigint,
    accountIdentifier varchar(255),
    entitlementId bigint,
    entitlementName varchar(255),
    resourceId bigint,
    resourceName varchar(255),
    name varchar(255),
    roleId bigint,
    roleName varchar(255),
    userId bigint,
    primary key (id)
) ENGINE=InnoDB;

-- alter tables ???


------------------- RoleRightRevokeEntry -----------------------------------------------------------------------------------------------------------------------

-- drop foreign keys

ALTER TABLE RoleRightRevokeEntry
  DROP FOREIGN KEY FKphdxpsr9f57rbn449bugd0i1f;

ALTER TABLE RoleRightRevokeEntry
  DROP FOREIGN KEY FKi3titmoxi1osh16n969y8pvh5;

-- drop columns

ALTER TABLE RoleRightRevokeEntry
DROP COLUMN role_id;

ALTER TABLE RoleRightRevokeEntry
DROP COLUMN user_id;

-- add columns

ALTER TABLE RoleRightRevokeEntry
ADD COLUMN role_id bigint;

ALTER TABLE RoleRightRevokeEntry
ADD COLUMN beneficiary_id bigint;

ALTER TABLE RoleRightRevokeEntry
ADD COLUMN roleRightRevokeInternalEntry_id bigint;

-- create tables

create table RoleRightRevokeDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    username varchar(255),
    name varchar(255),
    accountId bigint,
    accountIdentifier varchar(255),
    entitlementId bigint,
    entitlementName varchar(255),
    resourceId bigint,
    resourceName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- alter tables


------------------- RoleRightEntry -----------------------------------------------------------------------------------------------------------------------

-- drop foreign ????

-- drop columns

ALTER TABLE RoleRightEntry
DROP COLUMN roleId;

ALTER TABLE RoleRightEntry
DROP COLUMN requester_id;

-- add columns

ALTER TABLE RoleRightEntry
ADD COLUMN requester_id bigint;

ALTER TABLE RoleRightEntry
ADD COLUMN role_id bigint;

-- create tables

create table RoleRightDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    name varchar(255),
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- alter tables ???


------------------- AssignmentEntry ------------------------------------------------------------------------------------------------------------------------

-- drop foreign keys ????

-- drop columns

ALTER TABLE AssignmentEntry
DROP COLUMN roleId;

ALTER TABLE AssignmentEntry
DROP COLUMN userId;

-- add columns

ALTER TABLE AssignmentEntry
ADD COLUMN role_id bigint;

ALTER TABLE AssignmentEntry
ADD COLUMN beneficiary_id bigint;

-- create tables

create table AssignmentDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    name varchar(255),
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- alter tables ???

------------------ ReconciliationEntry ------------------------------------------------------------------------------------------------------------------------

-- drop foreign keys

ALTER TABLE ReconciliationEntry
  DROP FOREIGN KEY FK_RECONCILIATIONENTRY_RESOURCE;

ALTER TABLE ReconciliationEntryTransitionState
  DROP FOREIGN KEY FKh8cqfpa06p1w1oyuskjd5ad2x;

-- drop columns

ALTER TABLE ReconciliationEntry
DROP COLUMN resource_id;

ALTER TABLE ReconciliationEntry
DROP COLUMN reconciliationMatchedEntryId;

-- add columns

ALTER TABLE ReconciliationEntry
ADD COLUMN resource_id bigint;

ALTER TABLE ReconciliationEntry
ADD COLUMN reconciliationMatchedInternalEntry_id bigint;

-- create tables

create table ReconciliationDirectoryEntry (
    type varchar(31) not null,
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    roleId bigint,
    roleName varchar(255),
    userId bigint,
    username varchar(255),
    name varchar(255),
    accountIdentifier varchar(255),
    accountId bigint,
    entitlementId bigint,
    entitlementName varchar(255),
    primary key (id)
) ENGINE=InnoDB;


-- alter tables ???









