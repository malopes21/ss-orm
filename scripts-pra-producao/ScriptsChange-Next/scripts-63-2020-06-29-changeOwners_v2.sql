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




