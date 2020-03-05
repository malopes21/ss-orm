
-- 10-09-2019

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

insert into PasswordVaultNotificationSettings (subject, type, template) values ('Blazon Create PasswordVault Notification', 'CREATE_PASSWORDVAULT_NOTIFICATION', '<html><head></head><body></body></html>');


-- montar o alter table da ProvisioningTask

create table ProvisioningTask (
    notProvisionedJustification varchar(1000),
    id bigint not null,
    provisioningEntry_id bigint,
    primary key (id)
) ENGINE=InnoDB;


