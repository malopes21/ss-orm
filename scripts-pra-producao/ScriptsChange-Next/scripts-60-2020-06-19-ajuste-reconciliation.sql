
-- ReconciliationEntryTransitionState

ALTER TABLE ReconciliationEntryTransitionState
  DROP FOREIGN KEY FKh8cqfpa06p1w1oyuskjd5ad2x;

-- ReconciliationActions

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction 
WHERE actionName = 'GrantMembershipEntitlementReconciliationActionHandler'), 'ENTITLEMENT');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction 
WHERE actionName = 'GrantRoleReconciliationActionHandler'), 'ROLE');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction 
WHERE actionName = 'RevokeRoleReconciliationActionHandler'), 'ROLE');

INSERT INTO ReconciliationAction (actionName, beanName) VALUES ('RevokeUserReconciliationActionHandler', 'RevokeUserReconciliationActionHandler');

INSERT INTO ReconciliationAction_entryTypes (ReconciliationAction_id, entryTypes) VALUES ((SELECT id FROM ReconciliationAction 
WHERE actionName = 'RevokeUserReconciliationActionHandler'), 'USER');


