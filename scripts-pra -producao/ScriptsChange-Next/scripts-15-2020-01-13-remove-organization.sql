
-- ANALYTICS_DIRECTORY_OBJECTS_DETAIL_FACT

ALTER TABLE ANALYTICS_DIRECTORY_OBJECTS_DETAIL_FACT 
DROP COLUMN averageUsersByOrganization;


-- ANALYTICS_DIRECTORY_OBJECTS_FACT

ALTER TABLE ANALYTICS_DIRECTORY_OBJECTS_FACT 
DROP COLUMN amountOrganizations;


-- ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT

ALTER TABLE ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT 
DROP COLUMN amountMembershipOrganizationByReconciliation;

ALTER TABLE ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT 
DROP COLUMN amountMembershipOrganizationByManual;

ALTER TABLE ANALYTICS_DIRECTORY_MANAGEMENT_DETAIL_FACT 
DROP COLUMN amountMembershipOrganizationByOrganizationRule;


-- MembershipOrganization

ALTER TABLE MembershipOrganization
DROP FOREIGN KEY FK4ttvmejb1ylo5l4muclsw29hn;

ALTER TABLE MembershipOrganization
DROP FOREIGN KEY FK1cdse9jmxa34ncw9cq2c6ksu1;

drop table MembershipOrganization;


-- Organization_User

ALTER TABLE Organization_User
DROP FOREIGN KEY FK2emtdx12o2x6n1ditg3lwn4uj;

ALTER TABLE Organization_User
DROP FOREIGN KEY FKnpxsmlwuy7pgbj0e6e0v9w708;

drop table Organization_User;


-- OrganizationProvisioningProfile

drop table OrganizationProvisioningProfile;


-- OrganizationRule

ALTER TABLE OrganizationRule
DROP FOREIGN KEY FKif4gw7kcwv9y05tyslq7xj95e;

drop table OrganizationRule;


-- OrganizationType

drop table OrganizationType;

-- Organization

ALTER TABLE Organization
DROP FOREIGN KEY FK35f0lmp4xv33i3wre6y0enkt7;

ALTER TABLE Organization
DROP FOREIGN KEY FKt5r8fl7xglrdfv4o1q0x0l5st;

ALTER TABLE Organization
DROP FOREIGN KEY FK5keih5lyko469bl9rsaxhji4i;

drop table Organization;


-- ProvisioningDirectoryEntry 

ALTER TABLE ProvisioningDirectoryEntry 
DROP COLUMN organizationId;

ALTER TABLE ProvisioningDirectoryEntry 
DROP COLUMN organizationName;


-- ReconciliationDirectoryEntry

ALTER TABLE ReconciliationDirectoryEntry 
DROP COLUMN organization_id;


-- SituationDef_entryTypes

delete from SituationDef_entryTypes where entryTypes like '%ORGANIZATION%';


-- SituationDef

delete from SituationDef where name like '%ORGANIZATION%';


-- EntryAttributeCategory

delete from EntryAttributeCategory where schemaa = 'ORGANIZATION';







