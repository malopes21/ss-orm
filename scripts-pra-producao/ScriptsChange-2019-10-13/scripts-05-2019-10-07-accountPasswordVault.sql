
-- AccountPasswordVault

create table AccountPasswordVault (
    id bigint not null auto_increment,
    accountId bigint,
    passwordVaultId bigint,
    primary key (id)
) ENGINE=InnoDB;


-- Resource

alter table Resource drop column allowUserChangePasswordVaultCredentials;


-- EntryAttribute

delete from EntryAttribute where name = 'password' and schemaa = 'USER';
