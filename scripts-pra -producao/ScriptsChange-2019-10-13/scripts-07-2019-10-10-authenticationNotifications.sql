
-- AuthenticationMethodsNotificationSettings

create table AuthenticationMethodsNotificationSettings (
    id bigint not null auto_increment,
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

insert into AuthenticationMethodsNotificationSettings (subject, type, template) values ('Blazon Send Otp Token Notification', 'SENDOTPTOKEN_AUTHENTICATIONMETHODS_NOTIFICATION', '<html><head></head><body></body></html>');


-- inserts para InternalPermissions para AuthenticationMethodsNotificationSettings

insert into InternalPermission (category, description, label, name) values ('AUTHENTICATION_METHODS', 'Listar Configurações de Notificação.', 'List notification settings.', 'LIST_AUTHENTICATIONMETHODS_NOTIFICATION_SETTINGS');

insert into InternalPermission (category, description, label, name) values ('AUTHENTICATION_METHODS', 'Editar Configurações de Notificação.', 'Edit notification settings.', 'EDIT_AUTHENTICATIONMETHODS_NOTIFICATION_SETTINGS');

-- inserts para InternalPermissionGroup (não tem aqui porque vai usar os grupos AUTHENTICATION_METHOD_MANAGE, AUTHENTICATION_METHOD_VISUALIZE


-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'AUTHENTICATION_METHOD_MANAGE' and ip.name = 'LIST_AUTHENTICATIONMETHODS_NOTIFICATION_SETTINGS';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'AUTHENTICATION_METHOD_MANAGE' and ip.name = 'EDIT_AUTHENTICATIONMETHODS_NOTIFICATION_SETTINGS';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'AUTHENTICATION_METHOD_VISUALIZE' and ip.name = 'LIST_AUTHENTICATIONMETHODS_NOTIFICATION_SETTINGS';


-- inserts para InternalPermissions para PasswordVaultNotificationSettings

-- inserts para InternalPermissions

insert into InternalPermission (category, description, label, name) values ('PASSWORD_VAULT', 'Listar configurações de notificação de cofre de senhas.', 'List password vault notification settings', 'LIST_PASSWORDVAULT_NOTIFICATION_SETTINGS');

insert into InternalPermission (category, description, label, name) values ('PASSWORD_VAULT', 'Editar configurações de notificação de cofre de senhas.', 'Edit password vault notification settings', 'EDIT_PASSWORDVAULT_NOTIFICATION_SETTINGS');

-- inserts para InternalPermissionGroup 

insert into InternalPermissionGroup (category, description, label, name) values ('SETTINGS', 'Visualizar Configurações de Cofre de Senhas.', 'Visualizar Configurações de Cofre de Senhas', 'PASSWORDVAULT_VISUALIZE');

insert into InternalPermissionGroup (category, description, label, name) values ('SETTINGS', 'Gerenciar Configurações de Cofre de Senhas.', 'Gerenciar Configurações de Cofre de Senhas', 'PASSWORDVAULT_MANAGE');

-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'PASSWORDVAULT_VISUALIZE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'PASSWORDVAULT_VISUALIZE' and ip.name = 'LIST_PASSWORDVAULT_NOTIFICATION_SETTINGS';


insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'PASSWORDVAULT_MANAGE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'PASSWORDVAULT_MANAGE' and ip.name = 'LIST_PASSWORDVAULT_NOTIFICATION_SETTINGS';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'PASSWORDVAULT_MANAGE' and ip.name = 'EDIT_PASSWORDVAULT_NOTIFICATION_SETTINGS';

-- usar a tela http://localhost:8080/provisionmanager/domain.html#/managerRoles/1 pra setar a permissão para o usuário no ambiente de produção






