
-- Entry

alter table Entry 
add column selfServiceSynchronized boolean default false;


alter table Resource 
add column selfServiceSynchronized boolean default false;

drop table SelfServiceSettings;


-- com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogResourceSyncJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogResourceSyncJob', 
'Self Service Catalog Resource Sync Job.', 'Self Service Catalog Resource Sync Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Self Service Catalog Resource Sync Job' as name, 
	'[{\"name\":\"resourceQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Self Service Catalog Resource Sync Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogResourceSyncJob';


-- com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogRoleSyncJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogRoleSyncJob', 
'Self Service Catalog Role Sync Job.', 'Self Service Catalog Role Sync Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Self Service Catalog Role Sync Job' as name, 
	'[{\"name\":\"roleQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Self Service Catalog Role Sync Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogRoleSyncJob';


-- com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogEntitlementSyncJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogEntitlementSyncJob', 
'Self Service Catalog Entitlement Sync Job.', 'Self Service Catalog Entitlement Sync Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Self Service Catalog Entitlement Sync Job' as name, 
	'[{\"name\":\"entitlementQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Self Service Catalog Entitlement Sync Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogEntitlementSyncJob';


-- com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogAdminPasswordSyncJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogAdminPasswordSyncJob', 
'Self Service Catalog Admin Password Sync Job.', 'Self Service Catalog Admin Password Sync Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Self Service Catalog Admin Password Sync Job' as name, 
	'[{\"name\":\"adminPasswordQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Self Service Catalog Admin Password Sync Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.workspace.selfservice.applicationdomain.catalog.jobs.SelfServiceCatalogAdminPasswordSyncJob';


-- SelfServiceCartInstanceItem

drop table SelfServiceCartItem_dependsOnIds;

drop table SelfServiceCartItem_payloads;

drop table SelfServiceCartInstanceItem;

create table SelfServiceCartInstanceItem (
    id bigint not null auto_increment,
    accountAlreadyExist bit,
    adminAccountLocked bit,
    alreadyRequestInProgress bit,
    membershipEntitlementAlreadyExist bit,
    membershipRoleAlreadyExist bit,
    payload varchar(4000),
    relatedAccountNotFound bit,
    relatedCatalogItemId varchar(255),
    relatedCatalogItemName varchar(255),
    schemaValidated bit,
    userId varchar(255),
    cartItem_id bigint,
    primary key (id)
) ENGINE=InnoDB;

-- alter table SelfServiceCartInstanceItem add column adminAccountLocked bit;

-- SelfServiceCartItem

drop table SelfServiceCartItem;

create table SelfServiceCartItem (
    id bigint not null auto_increment,
    assignType varchar(255),
    catalogItemId varchar(255),
    cart_id bigint,
    primary key (id)
) ENGINE=InnoDB;



-- Ajuste no job 'Remove permanentemente as MembershipRoles do diretório'

update JobInstance set name = 'Remove permanentemente as MembershipRoles do diretório' where name like '%RemoveMembershipRolesJob%';



