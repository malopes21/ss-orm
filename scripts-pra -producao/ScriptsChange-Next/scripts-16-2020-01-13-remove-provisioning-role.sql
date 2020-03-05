
-- RoleProvisioningProfile

drop table RoleProvisioningProfile;


-- ProvisioningDirectoryEntry

ALTER TABLE ProvisioningDirectoryEntry 
DROP COLUMN roleId;

ALTER TABLE ProvisioningDirectoryEntry 
DROP COLUMN roleName;


