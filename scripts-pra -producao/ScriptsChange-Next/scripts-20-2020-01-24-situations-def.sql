
-- SituationDef

update SituationDef set implementationClassName = 'AccountAndOwnerNotMatchSituation' where implementationClassName like '%AccountAndOwnerNotMatchSituation';

update SituationDef set implementationClassName = 'AccountNotMatchAndOwnerMatchSituation' where implementationClassName like '%AccountNotMatchAndOwnerMatchSituation';

update SituationDef set implementationClassName = 'AccountMatchAndOwnerNotMatchSituation' where implementationClassName like '%AccountMatchAndOwnerNotMatchSituation';

update SituationDef set implementationClassName = 'UserAndRoleNotMatchSituation' where implementationClassName like '%UserAndRoleNotMatchSituation';

update SituationDef set implementationClassName = 'UserNotMatchAndRoleMatchSituation' where implementationClassName like '%UserNotMatchAndRoleMatchSituation';


update SituationDef set implementationClassName = 'UserMatchAndRoleNotMatchSituation' where implementationClassName like '%UserMatchAndRoleNotMatchSituation';

update SituationDef set implementationClassName = 'AccountAndEntitlementNotMatchSituation' where implementationClassName like '%AccountAndEntitlementNotMatchSituation';

update SituationDef set implementationClassName = 'AccountNotMatchAndEntitlementMatchSituation' where implementationClassName like '%AccountNotMatchAndEntitlementMatchSituation';

update SituationDef set implementationClassName = 'AccountMatchAndEntitlementNotMatchSituation' where implementationClassName like '%AccountMatchAndEntitlementNotMatchSituation';


update SituationDef set implementationClassName = 'EntryConflictSituation' where implementationClassName like '%EntryConflictSituation';

update SituationDef set implementationClassName = 'MatchConflictSituation' where implementationClassName like '%MatchConflictSituation';

update SituationDef set implementationClassName = 'EntryFoundSituation' where implementationClassName like '%EntryFoundSituation';

update SituationDef set implementationClassName = 'EntryNotFoundSituation' where implementationClassName like '%EntryNotFoundSituation';


