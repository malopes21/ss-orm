
-- ChangeApplicationAccountOwnerEntry etc

create table ChangeApplicationAccountOwnerAccount (
    id bigint not null auto_increment,
    accountIdentifier varchar(255),
    directoryIdentifier bigint,
    resourceId bigint,
    resourceName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ChangeApplicationAccountOwnerEntry (
    id bigint not null auto_increment,
    createdAt datetime,
    resolveNote varchar(1000),
    resolvedAt datetime,
    status varchar(255),
    account_id bigint,
    currentOwner_id bigint,
    newOwner_id bigint,
    resolvedBy_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ChangeApplicationAccountOwnerEntry_actions (
    ChangeApplicationAccountOwnerEntry_id bigint not null,
    actions varchar(255)
) ENGINE=InnoDB;

create table ChangeApplicationAccountOwnerUser (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;


-- inserts para InternalPermissions ChangeApplicationAccountOwnerEntry

insert into InternalPermission (category, description, label, name) values ('CHANGE_APPLICATION_OWNER', 'Listar entradas de troca de proprietário da conta.', 'Listar entradas de troca de proprietário da conta', 'LIST_CHANGE_APPLICATION_OWNER_ENTRY');
insert into InternalPermission (category, description, label, name) values ('CHANGE_APPLICATION_OWNER', 'Resolver entrada de troca de proprietário da conta.', 'Resolver entrada de troca de proprietário da conta.', 'RESOLVE_CHANGE_APPLICATION_OWNER_ENTRY');

-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Entradas de Troca de Proprietário de Conta.', 'Visualizar Entradas de Troca de Proprietário de Conta', 'CHANGE_APPLICATION_OWNER_ENTRY_VISUALIZE');
insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Gerenciar Entradas de Troca de Proprietário de Conta.', 'Gerenciar Entradas de Troca de Proprietário de Conta', 'CHANGE_APPLICATION_OWNER_ENTRY_MANAGE');


-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_VISUALIZE' and ip.name = 'LIST_CHANGE_APPLICATION_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_VISUALIZE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_VISUALIZE' and ip.name = 'LIST_ACCOUNT';


insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_MANAGE' and ip.name = 'LIST_CHANGE_APPLICATION_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_MANAGE' and ip.name = 'RESOLVE_CHANGE_APPLICATION_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_MANAGE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_APPLICATION_OWNER_ENTRY_MANAGE' and ip.name = 'LIST_ACCOUNT';


-- ChangePasswordAccountEntry etc

create table ChangePasswordAccount (
    id bigint not null auto_increment,
    accountIdentifier varchar(255),
    directoryIdentifier bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ChangePasswordAccountEntry (
    id bigint not null auto_increment,
    createdAt datetime,
    resetPassword bit,
    resolveNote varchar(1000),
    resolvedAt datetime,
    status varchar(255),
    account_id bigint,
    resolvedBy_id bigint,
    resource_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table ChangePasswordResource (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    name varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table ChangePasswordUser (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;



-- inserts para InternalPermissions ChangePasswordAccountEntry

insert into InternalPermission (category, description, label, name) values ('CHANGE_PASSSWORD_ACCOUNT', 'Listar entradas de troca de senha de conta.', 'Listar entradas de troca de senha de conta', 'LIST_CHANGE_PASSWORD_ENTRY');
insert into InternalPermission (category, description, label, name) values ('CHANGE_PASSSWORD_ACCOUNT', 'Resolver entrada de troca de senha de conta.', 'Resolver entrada de troca de senha de conta.', 'RESOLVE_CHANGE_PASSWORD_ENTRY');

-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Entradas de Troca de Senha de Conta.', 'Visualizar Entradas de Troca de Senha de Conta', 'CHANGE_PASSWORD_ENTRY_VISUALIZE');
insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Gerenciar Entradas de Troca de Senha de Conta.', 'Gerenciar Entradas de Troca de Senha de Conta', 'CHANGE_PASSWORD_ENTRY_MANAGE');


-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_VISUALIZE' and ip.name = 'LIST_CHANGE_PASSWORD_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_VISUALIZE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_VISUALIZE' and ip.name = 'LIST_ACCOUNT';


insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_MANAGE' and ip.name = 'LIST_CHANGE_PASSWORD_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_MANAGE' and ip.name = 'RESOLVE_CHANGE_PASSWORD_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_MANAGE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'CHANGE_PASSWORD_ENTRY_MANAGE' and ip.name = 'LIST_ACCOUNT';


-- SharedAccountMembership e etc

create table SharedAccountAccount (
    id bigint not null auto_increment,
    accountIdentifier varchar(255),
    directoryIdentifier bigint,
    resourceId bigint,
    resourceName varchar(255),
    primary key (id)
) ENGINE=InnoDB;

create table SharedAccountMembership (
    id bigint not null auto_increment,
    account_id bigint,
    user_id bigint,
    primary key (id)
) ENGINE=InnoDB;

create table SharedAccountUser (
    id bigint not null auto_increment,
    directoryIdentifier bigint,
    displayName varchar(255),
    username varchar(255),
    primary key (id)
) ENGINE=InnoDB;


-- inserts para InternalPermissions SharedAccountMembership

insert into InternalPermission (category, description, label, name) values ('SHARED_ACCOUNT', 'Listar membros de uma conta compartilhada.', 'Listar membros de uma conta compartilhada', 'LIST_SHARED_ACCOUNT_MEMBER');
insert into InternalPermission (category, description, label, name) values ('SHARED_ACCOUNT', 'Adicionar membro a uma conta compartilhada.', 'Adicionar membro a uma conta compartilhada.', 'SHARE_SHARED_ACCOUNT');
insert into InternalPermission (category, description, label, name) values ('SHARED_ACCOUNT', 'Remover membro a uma conta compartilhada.', 'Remover membro a uma conta compartilhada.', 'UNSHARE_SHARED_ACCOUNT');

-- inserts para InternalPermissionGroup

insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Contas Compartilhadas.', 'Visualizar Contas Compartilhadas', 'SHARED_ACCOUNT_VISUALIZE');
insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Gerenciar Contas Compartilhadas.', 'Gerenciar Contas Compartilhadas', 'SHARED_ACCOUNT_MANAGE');


-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_VISUALIZE' and ip.name = 'LIST_SHARED_ACCOUNT_MEMBER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_VISUALIZE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_VISUALIZE' and ip.name = 'LIST_ACCOUNT';


insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'LIST_SHARED_ACCOUNT_MEMBER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'SHARE_SHARED_ACCOUNT';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'UNSHARE_SHARED_ACCOUNT';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'LIST_USER';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'LIST_ACCOUNT';


-- Admin Accounts

alter table Account
drop FOREIGN KEY FK_ACCOUNT_USER;

create table AccountPasswordVault (
    id bigint not null auto_increment,
    accountId bigint,
    passwordVaultId bigint,
    userId bigint,
    primary key (id)
) ENGINE=InnoDB;

alter table AccountPasswordVault
add column userId bigint;

create table AdminAccountLock (
    accountId bigint not null,
    lockNumber bigint,
    version bigint,
    primary key (accountId)
) ENGINE=InnoDB;

create table AdminAccountPasswordVault (
    id bigint not null auto_increment,
    accountId bigint,
    passwordVaultId bigint,
    userId bigint,
    primary key (id)
) ENGINE=InnoDB;


-- RemoveSharedAccountMembershipEntry

create table RemoveSharedAccountMembershipEntry (
    id bigint not null auto_increment,
    createdAt datetime,
    removeMembership bit,
    resolveNote varchar(1000),
    resolvedAt datetime,
    status varchar(255),
    account_id bigint,
    member_id bigint,
    resolvedBy_id bigint,
    primary key (id)
) ENGINE=InnoDB;


-- Internal Permissions to RemoveSharedAccountMembershipEntry

insert into InternalPermission (category, description, label, name) values ('SHARED_ACCOUNT', 'Listar entrada de remoção de membros de uma conta compartilhada.', 'Listar entrada de remoção de membros de uma conta compartilhada', 'LIST_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY');
insert into InternalPermission (category, description, label, name) values ('SHARED_ACCOUNT', 'Resolver entrada de remoção de membro a uma conta compartilhada.', 'Resolver entrada de remoção de membro a uma conta compartilhada.', 'RESOLVE_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY');

-- inserts para InternalPermissionGroup (JÁ INSERIDOS!!!)

-- insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Visualizar Contas Compartilhadas.', 'Visualizar Contas Compartilhadas', 'SHARED_ACCOUNT_VISUALIZE');
-- insert into InternalPermissionGroup (category, description, label, name) values ('MANAGEMENT', 'Gerenciar Contas Compartilhadas.', 'Gerenciar Contas Compartilhadas', 'SHARED_ACCOUNT_MANAGE');

-- inserts para InternalPermissionGroup_InternalPermission

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_VISUALIZE' and ip.name = 'LIST_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY';


insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'LIST_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'SHARED_ACCOUNT_MANAGE' and ip.name = 'RESOLVE_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY';


-- Add name and description to Account

alter table Account
add column name varchar(255);

alter table Account
add column description varchar(255);


