
-- inserts para InternalPermissionGroup_InternalPermission de ChangeApplicationOwner

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_VISUALIZE' and ip.name = 'LIST_CHANGE_APPLICATION_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_MANAGE' and ip.name = 'LIST_CHANGE_APPLICATION_OWNER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_MANAGE' and ip.name = 'RESOLVE_CHANGE_APPLICATION_OWNER_ENTRY';


-- inserts para InternalPermissionGroup_InternalPermission de ChangeAccountPassword

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_VISUALIZE' and ip.name = 'LIST_CHANGE_PASSWORD_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_MANAGE' and ip.name = 'LIST_CHANGE_PASSWORD_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_MANAGE' and ip.name = 'RESOLVE_CHANGE_PASSWORD_ENTRY';


-- inserts para InternalPermissionGroup_InternalPermission de RemoveSharedAccountMember

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_VISUALIZE' and ip.name = 'LIST_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_MANAGE' and ip.name = 'LIST_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY';

insert into InternalPermissionGroup_InternalPermission (internalPermissionGroups_id, internalPermissions_id) 
select ipg.id as internalPermissionGroups_id, ip.id as internalPermissions_id from InternalPermissionGroup ipg, InternalPermission ip 
where ipg.name = 'ACCOUNT_MANAGE' and ip.name = 'RESOLVE_REMOVE_SHARED_ACCOUNT_MEMBER_ENTRY';


-- inserts para InternalPermissionGroup_InternalPermission de Approval RoleRight Entries


-- pra Role, o grupo ROLE_MANAGE já atende






