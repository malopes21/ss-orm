
-- WebHook

create table WebHook (
    id bigint not null auto_increment,
    objectId varchar(255),
    objectType varchar(255),
    token varchar(1000),
    type varchar(255),
    url varchar(255),
    primary key (id)
) ENGINE=InnoDB;


-- inserts para InternalPermissions

insert into InternalPermission (category, description, label, name) values ('WEBHOOK', 'Listar web hooks.', 'List web hooks.', 'LIST_WEBHOOK');
insert into InternalPermission (category, description, label, name) values ('WEBHOOK', 'Editar web hook.', 'Edit web hook.', 'EDIT_WEBHOOK');
insert into InternalPermission (category, description, label, name) values ('WEBHOOK', 'Criar web hook.', 'Create web hook.', 'CREATE_WEBHOOK');
insert into InternalPermission (category, description, label, name) values ('WEBHOOK', 'Remover web hook.', 'Remove web hook.', 'REMOVE_WEBHOOK');


-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('DEVELOPMENT', 'Visualizar Web Hooks.', 'Visualizar Web Hooks', 'WEBHOOK_VISUALIZE');
insert into InternalPermissionGroup (category, description, label, name) values ('DEVELOPMENT', 'Gerenciar Web Hooks.', 'Gerenciar Web Hooks', 'WEBHOOK_MANAGE');


-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'WEBHOOK_VISUALIZE' and ip.name = 'LIST_WEBHOOK';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'WEBHOOK_MANAGE' and ip.name = 'LIST_WEBHOOK';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'WEBHOOK_MANAGE' and ip.name = 'EDIT_WEBHOOK';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'WEBHOOK_MANAGE' and ip.name = 'CREATE_WEBHOOK';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'WEBHOOK_MANAGE' and ip.name = 'REMOVE_WEBHOOK';


-- inserts para ManagerRole_InternalPermissionGroup (acho que será melhor setar na tela esses!)


