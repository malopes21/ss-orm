delete from ReconciliationAction_entryTypes;

delete from ReconciliationAction;

-- delete from ReconciliationAction_situationNames;


-- ACCOUNT

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(1, 'CreateAccountReconciliationActionHandler', 'createAccountReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(2, 'RemoveAccountOfDirectoryReconciliationActionHandler', 'removeAccountOfDirectoryReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(3, 'RevokeAccountReconciliationActionHandler', 'revokeAccountReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(4, 'SaveAccountOnDirectoryReconciliationActionHandler', 'saveAccountOnDirectoryReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(5, 'UpdateAccountOfDirectoryReconciliationActionHandler', 'updateAccountOfDirectoryReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(6, 'UpdateAccountReconciliationActionHandler', 'updateAccountReconciliationActionHandler');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(1, 'ACCOUNT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(2, 'ACCOUNT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(3, 'ACCOUNT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(4, 'ACCOUNT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(5, 'ACCOUNT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(6, 'ACCOUNT');


-- ENTITLEMENT

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(7, 'CreateEntitlementReconciliationActionHandler', 'createEntitlementReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(8, 'RemoveEntitlementOfDirectoryReconciliationActionHandler', 'removeEntitlementOfDirectoryReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(9, 'RemoveEntitlementReconciliationActionHandler', 'removeEntitlementReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(10, 'SaveEntitlementOnDirectoryReconciliationActionHandler', 'saveEntitlementOnDirectoryReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(11, 'UpdateEntitlementOnDirectoryReconciliationActionHandler', 'updateEntitlementOnDirectoryReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(12, 'UpdateEntitlementReconciliationActionBusinessHandler', 'updateEntitlementReconciliationActionBusinessHandler');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(7, 'ENTITLEMENT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(8, 'ENTITLEMENT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(9, 'ENTITLEMENT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(10, 'ENTITLEMENT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(11, 'ENTITLEMENT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(12, 'ENTITLEMENT');


-- MEMBERSHIP_ENTITLEMENT

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(13, 'GrantMembershipEntitlementReconciliationActionHandler', 'grantMembershipEntitlementReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(14, 'RemoveMembershipEntitlementReconciliationActionHandler', 'removeMembershipEntitlementReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(15, 'RevokeMembershipEntitlementReconciliationActionHandler', 'revokeMembershipEntitlementReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(16, 'SaveMembershipEntitlementOnDirectoryReconciliationActionHandler', 'saveMembershipEntitlementOnDirectoryReconciliationActionHandler');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(13, 'MEMBERSHIP_ENTITLEMENT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(14, 'MEMBERSHIP_ENTITLEMENT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(15, 'MEMBERSHIP_ENTITLEMENT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(16, 'MEMBERSHIP_ENTITLEMENT');


-- ROLE 

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(17, 'CreateRoleReconciliationActionHandler', 'createRoleReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(18, 'RemoveRoleReconciliationActionHandler', 'removeRoleReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(19, 'UpdateRoleReconciliationActionHandler', 'updateRoleReconciliationActionHandler');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(17, 'ROLE');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(18, 'ROLE');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(19, 'ROLE');


-- MEMBERSHIP_ROLE

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(20, 'GrantRoleReconciliationActionHandler', 'grantRoleReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(21, 'RevokeRoleReconciliationActionHandler', 'revokeRoleReconciliationActionHandler');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(20, 'MEMBERSHIP_ROLE');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(21, 'MEMBERSHIP_ROLE');


-- USER

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(22, 'CreateUserReconciliationActionHandler', 'createUserReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(23, 'RemoveUserReconciliationActionHandler', 'removeUserReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(24, 'RevokeUserReconciliationActionHandler', 'revokeUserReconciliationActionHandler');

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(25, 'UpdateUserReconciliationActionHandler', 'updateUserReconciliationActionHandler');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(22, 'USER');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(23, 'USER');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(24, 'USER');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(25, 'USER');


-- ALL

INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(26, 'EntryConflictReconciliationActionHandler', 'entryConflictReconciliationActionHandler');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(26, 'ACCOUNT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(26, 'ENTITLEMENT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(26, 'MEMBERSHIP_ENTITLEMENT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(26, 'MEMBERSHIP_ROLE');


INSERT INTO ReconciliationAction (id, actionName, beanName) VALUES(27, 'WaitingManualDispatchToAssociationRulesReconciliationActionHandler', 'waitingManualDispatchToAssociationRulesReconciliationActionHandler');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(27, 'ACCOUNT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(27, 'ENTITLEMENT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(27, 'MEMBERSHIP_ENTITLEMENT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(27, 'ROLE');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(27, 'MEMBERSHIP_ROLE');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES(27, 'USER');


