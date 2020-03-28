
-- ImportEntry e ImportBatch

create table ImportBatch (
	id bigint not null auto_increment,
	action varchar(255),
	csvHeader longtext,
	importedAt datetime,
	justification varchar(1000),
	provisioning boolean default false,
	schemaa varchar(255),
	status varchar(255),
	importedBy_id bigint,
	primary key (id)
) ENGINE=InnoDB;

create table ImportBatchUser (
	id bigint not null auto_increment,
	directoryIdentifier bigint,
	displayName varchar(255),
	username varchar(255),
	primary key (id)
) ENGINE=InnoDB;

create table ImportEntry (
	id bigint not null auto_increment,
	errorMsg longtext,
	lockNumber bigint,
	payload longtext,
	status varchar(255),
	importBatch_id bigint,
	primary key (id)
) ENGINE=InnoDB;


-- com.blazon.importation.jobs.ImportJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.importation.jobs.ImportJob', 
'Import Job.', 'Import Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Import Job' as name, 
	'[{\"name\":\"importQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Import Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.importation.jobs.ImportJob';


-- com.blazon.importation.jobs.ImportFinalizeJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.importation.jobs.ImportFinalizeJob', 
'Import Finalize Job.', 'Import Finalize Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Import Finalize Job' as name, 
	'[{\"name\":\"importQueueLength\", \"value\":\"10\"}]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Blazon Jobs' as externalGroupId,
	'Import Finalize Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.importation.jobs.ImportFinalizeJob';


-- inserts para InternalPermissions Importation

insert into InternalPermission (category, description, label, name) values ('IMPORT', 'Listar Lotes de Importação.', 'Listar Lotes de Importação', 'LIST_IMPORT_BATCH');
insert into InternalPermission (category, description, label, name) values ('IMPORT', 'Criar Lotes de Importação.', 'Criar Lotes de Importação.', 'CREATE_IMPORT_BATCH');

-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Lotes de Importação.', 'Visualizar Lotes de Importação', 'IMPORT_VISUALIZE');
insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Gerenciar Lotes de Importação.', 'Gerenciar Lotes de Importação', 'IMPORT_MANAGE');


-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'IMPORT_VISUALIZE' and ip.name = 'LIST_IMPORT_BATCH';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'IMPORT_VISUALIZE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'IMPORT_MANAGE' and ip.name = 'LIST_IMPORT_BATCH';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'IMPORT_MANAGE' and ip.name = 'CREATE_IMPORT_BATCH';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'IMPORT_MANAGE' and ip.name = 'LIST_USER';


