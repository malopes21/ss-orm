# ATUALIZAR

# Account
UPDATE ReconciliationAction SET actionName='CreateAccountReconciliationActionHandler', beanName='createAccountReconciliationActionHandler'
WHERE beanName = 'CreateAccountReconciliationActionHandler';
UPDATE ReconciliationAction
SET actionName='RemoveAccountOfDirectoryReconciliationActionHandler', beanName='removeAccountOfDirectoryReconciliationActionHandler'
WHERE beanName = 'RemoveAccountReconciliationActionHandler';
UPDATE ReconciliationAction
SET actionName='UpdateAccountReconciliationActionHandler', beanName='updateAccountReconciliationActionHandler'
WHERE beanName = 'UpdateAccountReconciliationActionHandler';

# Entitlement and Membership Entitlement
UPDATE ReconciliationAction
SET actionName='CreateEntitlementReconciliationActionHandler', beanName='createEntitlementReconciliationActionHandler'
WHERE beanName = 'CreateEntitlementReconciliationActionHandler';
UPDATE ReconciliationAction
SET actionName='GrantMembershipEntitlementReconciliationActionHandler', beanName='grantMembershipEntitlementReconciliationActionHandler'
WHERE beanName = 'GrantEntitlementReconciliationActionHandler';
UPDATE ReconciliationAction
SET actionName='RevokeEntitlementReconciliationActionHandler', beanName='revokeEntitlementReconciliationActionHandler'
WHERE beanName = 'RemoveEntitlementReconciliationActionHandler';
UPDATE ReconciliationAction
SET actionName='RevokeMembershipEntitlementReconciliationActionHandler', beanName='revokeMembershipEntitlementReconciliationActionHandler'
WHERE beanName = 'RevokeEntitlementReconciliationActionHandler';
UPDATE ReconciliationAction
SET actionName='UpdateEntitlementReconciliationActionBusinessHandler', beanName='updateEntitlementReconciliationActionBusinessHandler'
WHERE beanName = 'UpdateEntitlementReconciliationActionHandler';


#  NOVOS

# ACCOUNT
INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('RevokeAccountReconciliationActionHandler', 'revokeAccountReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ACCOUNT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ACCOUNT_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ACCOUNT_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ACCOUNT_NOT_FOUND_AND_OWNER_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ACCOUNT_FOUND_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ENTRY_CONFLICT_OR_OWNER_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RevokeAccountReconciliationActionHandler'), 'ENTRY_FOUND');

INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('SaveAccountOnDirectoryReconciliationActionHandler', 'saveAccountOnDirectoryReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'), 'ACCOUNT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'),'ACCOUNT_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'),'ACCOUNT_NOT_FOUND_AND_OWNER_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'),'ACCOUNT_FOUND_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT_OR_OWNER_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveAccountOnDirectoryReconciliationActionHandler'),'ENTRY_FOUND');

INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('UpdateAccountOfDirectoryReconciliationActionHandler', 'updateAccountOfDirectoryReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'), 'ACCOUNT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'),'ACCOUNT_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'),'ACCOUNT_NOT_FOUND_AND_OWNER_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'),'ACCOUNT_FOUND_AND_OWNER_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT_OR_OWNER_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateAccountOfDirectoryReconciliationActionHandler'),'ENTRY_FOUND');

# ENTITLEMENT and MEMBERSHIP ENTITLEMENTS
INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('RemoveEntitlementOfDirectoryReconciliationActionHandler', 'removeEntitlementOfDirectoryReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'), 'ENTITLEMENT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'),'ACCOUNT_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'),'ACCOUNT_NOT_FOUND_AND_ENTITLEMENT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'),'ACCOUNT_FOUND_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'),'ENTRY_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveEntitlementOfDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT_OR_OWNER_CONFLICT');

INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('RemoveMembershipEntitlementReconciliationActionHandler', 'removeMembershipEntitlementReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'), 'ENTITLEMENT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'),'ACCOUNT_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'),'ACCOUNT_NOT_FOUND_AND_ENTITLEMENT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'),'ACCOUNT_FOUND_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'),'ENTRY_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'),'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'RemoveMembershipEntitlementReconciliationActionHandler'),'ENTRY_CONFLICT_OR_OWNER_CONFLICT');

INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('SaveEntitlementOnDirectoryReconciliationActionHandler', 'saveEntitlementOnDirectoryReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'), 'ENTITLEMENT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'),'ACCOUNT_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'),'ACCOUNT_NOT_FOUND_AND_ENTITLEMENT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'),'ACCOUNT_FOUND_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'),'ENTRY_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'SaveEntitlementOnDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT_OR_OWNER_CONFLICT');

INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('UpdateEntitlementOnDirectoryReconciliationActionHandler', 'UpdateEntitlementOnDirectoryReconciliationActionHandler');
INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'), 'ENTITLEMENT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'),'ACCOUNT_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'),'ACCOUNT_NOT_FOUND_AND_ENTITLEMENT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'),'ACCOUNT_FOUND_AND_ENTITLEMENT_NOT_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'),'ENTRY_FOUND');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT');
INSERT INTO ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) VALUES ((SELECT id FROM ReconciliationAction WHERE actionName = 'UpdateEntitlementOnDirectoryReconciliationActionHandler'),'ENTRY_CONFLICT_OR_OWNER_CONFLICT');

