
-- CertificationEntry

alter table CertificationEntry
drop column uncertifiedEntryAction;


-- CertificationSelector

alter table CertificationSelector
drop column uncertifiedAccountAction;

alter table CertificationSelector
drop column uncertifiedMembershipEntitlementAction;

alter table CertificationSelector
drop column uncertifiedMembershipRoleAction;


-- MicroCertificationExecutionInstance

alter table MicroCertificationExecutionInstance
drop column uncertifiedEntryAction;


-- CertificationPolicy

alter table CertificationPolicy
drop column uncertifiedEntryAction;
