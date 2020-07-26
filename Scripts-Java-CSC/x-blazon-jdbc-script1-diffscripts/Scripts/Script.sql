select * from ReconciliationEntry recEntry
join SituationDef sit on sit.id = recEntry.situation_id

select * from Entry

select * from ReconciliationEntryRole r

select * from ReconciliationDirectoryEntry r

SELECT req.id FROM BlazonRequest req 
join BlazonRequestMembershipEntitlement internalMembership on internalMembership.id = req.requestInternalEntry_id
join BlazonRequestDirectoryEntry internalAccount on internalAccount.id = internalMembership.account_id
join BlazonRequestDirectoryEntry internalEntitlement on internalEntitlement.id = internalMembership.entitlement_id
join BlazonRequestDirectoryEntry internalBeneficiary on internalBeneficiary.id = req.beneficiary_id
WHERE req.id <> 1
and internalAccount.directoryIdentifier = 3
and internalEntitlement.directoryIdentifier = 4
and internalBeneficiary.directoryIdentifier = 5
and req.type = 'REMOVE_USER' 
and ( req.status = 'NEW'  
or req.status = 'IN_EXECUTION' 
or req.status = 'WAITING_RESOLVE_ENTRY_DEPENDENCIES');

select * from BlazonRequest b

select * from BlazonRequestDirectoryEntry


desc BlazonRequestMembershipEntitlement

SELECT req.id FROM BlazonRequest req 
join BlazonRequestDirectoryEntry internalRole on internalRole.id = req.requestInternalEntry_id
join BlazonRequestDirectoryEntry internalBeneficiary on internalBeneficiary.id = req.beneficiary_id
WHERE req.id <> 1
and internalRole.directoryIdentifier = 3
and internalBeneficiary.directoryIdentifier = 5
and req.type = 'REMOVE_USER' 
and ( req.status = 'NEW'  
or req.status = 'IN_EXECUTION' 
or req.status = 'WAITING_RESOLVE_ENTRY_DEPENDENCIES');

show tables;

-- accountId, entitlementId, roleId, resourceId, beneficiary_id, requester_id, membershipId

create table BlazonRequestTemp (
	request_id bigint,
	accountId bigint,
	entitlementId bigint,
	membershipId bigint,
	roleId bigint,
	resourceId bigint,
	beneficiary_id bigint,
	requester_id bigint,
	primary key (request_id)
)

desc BlazonRequestTemp;

drop table BlazonRequestTemp;

select id, accountId, entitlementId, membershipId, roleId, resourceId, beneficiary_id, requester_id from BlazonRequest order by id;

insert into BlazonRequestTemp (request_id, accountId, entitlementId, membershipId, roleId, resourceId, beneficiary_id, requester_id)
select id, accountId, entitlementId, membershipId, roleId, resourceId, beneficiary_id, requester_id
from BlazonRequest;

select * from BlazonRequestTemp;

ALTER TABLE BlazonRequestTransitionState
  DROP FOREIGN KEY `FKmahlggwuo8v5moybi6ajxpef`;
 
ALTER TABLE BlazonRequest
  DROP FOREIGN KEY FKjf6m674x51u9mwbxilfjoaubh;
 
 select * from blazon.Account ;

SELECT entry.id as entryId, entry.`type` as entryType, role.id as roleId, user.id as userId  
FROM Entry entry  
JOIN ManagedBy managedBy ON entry.managedBy_id = managedBy.id  
JOIN MembershipRole membershipR ON entry.id = membershipR.id  
JOIN Role role on role.id = membershipR.role_id  
JOIN User user on user.id = membershipR.user_id  
JOIN Entry userEntry on user.id = userEntry.id   
WHERE userEntry.state = 'ACTIVE'  
and entry.type = 'MEMBERSHIP_ROLE'
and (managedBy.type = 'MANUAL' or managedBy.type = 'RECONCILIATION')  
and entry.risk = 'LOW'
ORDER BY entry.id ASC  limit 120  

 
show tables like 'BlazonRequest%'


desc BlazonRequestDirectoryEntry

insert into BlazonRequestDirectoryEntry (directoryIdentifier, type)
values (1, 'ACCOUNT')

select id, username, displayName from User where id = 1


desc BlazonRequestUser

update BlazonRequest set beneficiary_id = ? where id = ?
 
 
select id, type, accountId, roleId, resourceId, entitlementId, beneficiary_id, requester_id, status, membershipId from BlazonRequest where type = 'ASSIGN_ENTITLEMENT';

desc BlazonRequestTemp

select * from BlazonRequestDirectoryEntry where TYPE = 'ACCOUNT'

select * from BlazonRequestAccount

select * from BlazonRequestEntitlement

select * from BlazonRequestTemp

select id, requester_id, beneficiary_id, requestInternalEntry_id, `type` from BlazonRequest

select * from BlazonRequestDirectoryEntry

select * from BlazonRequestUser;

select * from BlazonRequestResource;



SELECT date                                   AS date,
       certificationsDetailsFacts.averageTime AS average_time
FROM ((SELECT DATE(date) AS date,
              averageTime
       FROM ANALYTICS_CERTIFICATION_CAMPAIGN_DETAIL_FACT
       GROUP BY DATE(date), averageTime
       HAVING MAX(date)
      )
      UNION ALL
      (SELECT DATE(date) AS date,
              averageTime
       FROM ANALYTICS_CERTIFICATION_MICRO_DETAIL_FACT
       GROUP BY DATE(date), averageTime
       HAVING MAX(date)
      )
      UNION ALL
      (SELECT DATE(date) AS DATE,
              averageTime
       FROM ANALYTICS_CERTIFICATION_CAMPAIGN_DETAIL_FACT
       GROUP BY DATE(date), averageTime
       HAVING MAX(date)
      )
     ) AS certificationsDetailsFacts
WHERE certificationsDetailsFacts.date
          BETWEEN '2019-12-10' AND '2019-12-20';

         
select sodEntry from SodEntry as sodEntry 
inner join sodEntry.sodInternalEntry as sodAccount 
inner join sodEntry.sodInternalEntry as sodEntitlement 
where 
	( ( sodAccount.resourceId=1L ) and ( sodEntry.sodInternalEntry.type='ACCOUNT' ) ) 
	or 
	( ( sodEntitlement.account.resourceId=1L ) and ( sodEntry.sodInternalEntry.type='MEMBERSHIP_ENTITLEMENT' ) ) 
order by sodEntry.id asc

select * from SodDirectoryEntry s

select  * from SodEntryAccount s


select generatedAlias0 from SodEntry as generatedAlias0 
inner join generatedAlias0.sodInternalEntry as generatedAlias1 
left join generatedAlias0.sodInternalEntry as generatedAlias2 
where 
( ( generatedAlias1.resourceId=1L ) and ( generatedAlias0.sodInternalEntry.type=:param0 ) ) 
or 
( ( generatedAlias2.account.resourceId=1L ) and ( generatedAlias0.sodInternalEntry.type=:param1 ) ) order by generatedAlias0.id asc


SELECT
	*
from SodEntry sodEntry
left join SodEntryAccount entryAccount on entryAccount.id = sodEntry.sodInternalEntry_id
left join SodEntryMembershipEntitlement entryMembership on entryMembership.id = sodEntry.sodInternalEntry_id;


select * from SodEntry sodEntry
left join SodDirectoryEntry sodDirectoryEntry on sodDirectoryEntry.id = sodEntry.sodInternalEntry_id
left join SodEntryAccount sodEntryAccount1 on sodEntryAccount1.id = sodDirectoryEntry.id
left join SodEntryMembershipEntitlement sodEntryMembershipEntitlement on sodEntryMembershipEntitlement.id = sodDirectoryEntry.id
left join SodEntryAccount sodEntryAccount2 on sodEntryAccount2.id = sodEntryMembershipEntitlement.account_id
where 
	sodEntryAccount1.resourceId = 1 
or
	sodEntryAccount2.resourceId = 1

select * from SodDirectoryEntry directoryEntry;
left join SodEntryAccount accountEntry on accountEntry.id = directoryEntry.id
left join SodEntryMembershipEntitlement membershipEntry on membershipEntry.id = directoryEntry.id
where accountEntry.resourceId = 1 and directoryEntry.type = 'ACCOUNT'




-- sql gerado 

select * 
from SodEntry sodentry0_ 
inner join SodDirectoryEntry soddirecto1_ on sodentry0_.sodInternalEntry_id=soddirecto1_.id 
left outer join SodEntryMembershipEntitlement soddirecto1_1_ on soddirecto1_.id=soddirecto1_1_.id 
left outer join SodEntryEntitlement soddirecto1_2_ on soddirecto1_.id=soddirecto1_2_.id 
left outer join SodEntryUser soddirecto1_3_ on soddirecto1_.id=soddirecto1_3_.id 
left outer join SodEntryAccount soddirecto1_4_ on soddirecto1_.id=soddirecto1_4_.id 
left outer join SodEntryMembershipRole soddirecto1_5_ on soddirecto1_.id=soddirecto1_5_.id 
left outer join SodEntryRole soddirecto1_6_ on soddirecto1_.id=soddirecto1_6_.id 
left outer join SodDirectoryEntry soddirecto2_ on sodentry0_.sodInternalEntry_id=soddirecto2_.id 
left outer join SodEntryMembershipEntitlement soddirecto2_1_ on soddirecto2_.id=soddirecto2_1_.id 
left outer join SodEntryEntitlement soddirecto2_2_ on soddirecto2_.id=soddirecto2_2_.id 
left outer join SodEntryUser soddirecto2_3_ on soddirecto2_.id=soddirecto2_3_.id 
left outer join SodEntryAccount soddirecto2_4_ on soddirecto2_.id=soddirecto2_4_.id 
left outer join SodEntryMembershipRole soddirecto2_5_ on soddirecto2_.id=soddirecto2_5_.id 
left outer join SodEntryRole soddirecto2_6_ on soddirecto2_.id=soddirecto2_6_.id 
cross join SodEntryAccount sodentryac4_ 
inner join SodDirectoryEntry sodentryac4_1_ on sodentryac4_.id=sodentryac4_1_.id 
where 
	soddirecto2_1_.account_id=sodentryac4_.id 
		and 
	(soddirecto1_4_.resourceId=1 and soddirecto2_.type='ACCOUNT' or sodentryac4_.resourceId=1 and soddirecto2_.type='MEMBERSHIP_ENTITLEMENT') 
order by sodentry0_.id asc limit 10


-- mudando

select sodentry0_.id, sodentry0_.entryType, sodentry0_.entry_id
from SodEntry sodentry0_ 
inner join SodDirectoryEntry soddirecto1_ on sodentry0_.sodInternalEntry_id=soddirecto1_.id 
left outer join SodEntryMembershipEntitlement soddirecto1_1_ on soddirecto1_.id=soddirecto1_1_.id 
left outer join SodEntryEntitlement soddirecto1_2_ on soddirecto1_.id=soddirecto1_2_.id 
left outer join SodEntryUser soddirecto1_3_ on soddirecto1_.id=soddirecto1_3_.id 
left outer join SodEntryAccount soddirecto1_4_ on soddirecto1_.id=soddirecto1_4_.id 
left outer join SodEntryMembershipRole soddirecto1_5_ on soddirecto1_.id=soddirecto1_5_.id 
left outer join SodEntryRole soddirecto1_6_ on soddirecto1_.id=soddirecto1_6_.id 
left outer join SodDirectoryEntry soddirecto2_ on sodentry0_.sodInternalEntry_id=soddirecto2_.id 
left outer join SodEntryMembershipEntitlement soddirecto2_1_ on soddirecto2_.id=soddirecto2_1_.id 
left outer join SodEntryEntitlement soddirecto2_2_ on soddirecto2_.id=soddirecto2_2_.id 
left outer join SodEntryUser soddirecto2_3_ on soddirecto2_.id=soddirecto2_3_.id 
left outer join SodEntryAccount soddirecto2_4_ on soddirecto2_.id=soddirecto2_4_.id 
left outer join SodEntryMembershipRole soddirecto2_5_ on soddirecto2_.id=soddirecto2_5_.id 
left outer join SodEntryRole soddirecto2_6_ on soddirecto2_.id=soddirecto2_6_.id
cross join SodEntryAccount sodentryac4_ 
inner join SodDirectoryEntry sodentryac4_1_ on sodentryac4_.id=sodentryac4_1_.id
where 
	soddirecto2_1_.account_id=sodentryac4_.id 
		and 
	(soddirecto1_4_.resourceId=1 and soddirecto2_.type='ACCOUNT' or sodentryac4_.resourceId=1 and soddirecto2_.type='MEMBERSHIP_ENTITLEMENT') 
order by sodentry0_.id asc limit 10




SELECT userAverageTimeFacts.user_id,
       userAverageTimeFacts.display_name,
       userAverageTimeFacts.average_time
FROM (
         (
             SELECT USER_DIMENSION.userId      AS user_id,
                    USER_DIMENSION.displayname AS display_name,
                    EXECUTOR_FACT.averageTime  AS average_time
             FROM ANALYTICS_CERTIFICATION_EXECUTOR_FACT EXECUTOR_FACT
                      INNER JOIN ANALYTICS_CERTIFICATION_EXECUTOR_USER_DIMENSION USER_DIMENSION
                                 ON EXECUTOR_FACT.CERTIFICATION_EXECUTOR_USER_DIMENSION_ID = USER_DIMENSION.id
                      INNER JOIN ANALYTICS_CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION INSTANCE_DIMENSION
                                 ON EXECUTOR_FACT.CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION_ID = INSTANCE_DIMENSION.id
             WHERE INSTANCE_DIMENSION.instanceId = ?
               AND INSTANCE_DIMENSION.instanceType = 'CAMPAIGN'
             GROUP BY USER_DIMENSION.userId,
                      USER_DIMENSION.displayname,
                      EXECUTOR_FACT.averageTime,
                      EXECUTOR_FACT.date
             HAVING MAX(EXECUTOR_FACT.date)
         )
         UNION ALL
         (
             SELECT USER_DIMENSION.userId      AS user_id,
                    USER_DIMENSION.displayname AS display_name,
                    EXECUTOR_FACT.averageTime  AS average_time
             FROM ANALYTICS_CERTIFICATION_EXECUTOR_FACT EXECUTOR_FACT
                      INNER JOIN ANALYTICS_CERTIFICATION_EXECUTOR_USER_DIMENSION USER_DIMENSION
                                 ON EXECUTOR_FACT.CERTIFICATION_EXECUTOR_USER_DIMENSION_ID = USER_DIMENSION.id
                      INNER JOIN ANALYTICS_CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION INSTANCE_DIMENSION
                                 ON EXECUTOR_FACT.CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION_ID = INSTANCE_DIMENSION.id
             WHERE INSTANCE_DIMENSION.instanceId = ?
               AND INSTANCE_DIMENSION.instanceType = 'MICRO'
             GROUP BY USER_DIMENSION.userId,
                      USER_DIMENSION.displayname,
                      EXECUTOR_FACT.averageTime,
                      EXECUTOR_FACT.date
             HAVING MAX(EXECUTOR_FACT.date)
         )
         UNION ALL
         (
             SELECT USER_DIMENSION.userId      AS user_id,
                    USER_DIMENSION.displayname AS display_name,
                    EXECUTOR_FACT.averageTime  AS average_time
             FROM ANALYTICS_CERTIFICATION_EXECUTOR_FACT EXECUTOR_FACT
                      INNER JOIN ANALYTICS_CERTIFICATION_EXECUTOR_USER_DIMENSION USER_DIMENSION
                                 ON EXECUTOR_FACT.CERTIFICATION_EXECUTOR_USER_DIMENSION_ID = USER_DIMENSION.id
                      INNER JOIN ANALYTICS_CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION INSTANCE_DIMENSION
                                 ON EXECUTOR_FACT.CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION_ID = INSTANCE_DIMENSION.id
             WHERE INSTANCE_DIMENSION.instanceId = ?
               AND INSTANCE_DIMENSION.instanceType = 'SELECTOR'
             GROUP BY USER_DIMENSION.userId,
                      USER_DIMENSION.displayname,
                      EXECUTOR_FACT.averageTime,
                      EXECUTOR_FACT.date
             HAVING MAX(EXECUTOR_FACT.date)
         )
     ) AS userAverageTimeFacts
GROUP BY userAverageTimeFacts.user_id,
         userAverageTimeFacts.display_name,
         userAverageTimeFacts.average_time;
        
--     
        
        
SELECT USER_DIMENSION.userId      AS user_id,
       USER_DIMENSION.displayname AS display_name,
       EXECUTOR_FACT.averageTime  AS average_time
FROM ANALYTICS_CERTIFICATION_EXECUTOR_FACT EXECUTOR_FACT
         INNER JOIN ANALYTICS_CERTIFICATION_EXECUTOR_USER_DIMENSION USER_DIMENSION
                    ON EXECUTOR_FACT.CERTIFICATION_EXECUTOR_USER_DIMENSION_ID = USER_DIMENSION.id
         INNER JOIN ANALYTICS_CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION INSTANCE_DIMENSION
                    ON EXECUTOR_FACT.CERTIFICATION_EXECUTOR_INSTANCE_DIMENSION_ID = INSTANCE_DIMENSION.id
GROUP BY USER_DIMENSION.userId,
         USER_DIMENSION.displayname,
         EXECUTOR_FACT.averageTime,
         EXECUTOR_FACT.date
HAVING MAX(EXECUTOR_FACT.date)
ORDER BY EXECUTOR_FACT.averageTime DESC
LIMIT 10
        
        
desc Task;
desc UserTask;
desc ProvisioningTask;
desc ProvisioningEntryMembershipEntitlement;
        

SELECT pde.directoryIdentifier
FROM ProvisioningTask provisioningTask
JOIN Task t ON t.id = provisioningTask.id
JOIN TaskDefinition taskDefinition on t.definition_id = taskDefinition.id
JOIN ProvisioningEntry pe ON pe.id = provisioningTask.provisioningEntry_id 
JOIN TaskQueue_Task tt ON t.id = tt.tasks_id 
LEFT JOIN UserTask requester ON t.requester_id = requester.id 
LEFT JOIN UserTask recipient ON t.recipient_id = recipient.id 
LEFT JOIN ProvisioningEntryResource peResource ON peResource.id = pe.resource_id 
LEFT JOIN ProvisioningDirectoryEntry pde ON pde.id = pe.provisioningInternalEntry_id
LEFT JOIN ProvisioningEntryAccount peAccount ON peAccount.id = pde.id
LEFT JOIN ProvisioningEntryEntitlement peEntitlement ON peEntitlement.id = pde.id
LEFT JOIN ProvisioningEntryMembershipEntitlement peMembershipEntitlement ON peMembershipEntitlement.id = pde.id
LEFT JOIN ProvisioningEntryMembershipOrganization peMembershipOrganization ON peMembershipOrganization.id = pde.id
LEFT JOIN ProvisioningEntryMembershipRole peMembershipRole ON peMembershipRole.id = pde.id
LEFT JOIN ProvisioningEntryOrganization peOrganization ON peOrganization.id = pde.id
LEFT JOIN ProvisioningEntryRole peRole ON peRole.id = pde.id


desc ProvisioningEntryAccount

desc ProvisioningDirectoryEntry



SELECT * 
FROM ProvisioningTask provisioningTask
JOIN Task t ON t.id = provisioningTask.id
JOIN TaskDefinition taskDefinition on t.definition_id = taskDefinition.id
JOIN ProvisioningEntry pe ON pe.id = provisioningTask.provisioningEntry_id 
JOIN TaskQueue_Task tt ON t.id = tt.tasks_id 
LEFT JOIN UserTask requester ON t.requester_id = requester.id 
LEFT JOIN UserTask recipient ON t.recipient_id = recipient.id 
LEFT JOIN ProvisioningEntryResource peResource ON peResource.id = pe.resource_id 
LEFT JOIN ProvisioningDirectoryEntry pde ON pde.id = pe.provisioningInternalEntry_id

select peEntry.id, peEntry.type, peEntry.directoryIdentifier, peOrganization.name
from ProvisioningEntryOrganization peOrganization
JOIN ProvisioningDirectoryEntry peEntry ON peEntry.id = peOrganization.id
where peEntry.id = ?

desc ProvisioningEntryUser;



SELECT provisioningEntry_id, pe.entryType, pe.targetId, pe.targetType, pe.resource_id, pdeResource.directoryIdentifier
FROM ProvisioningTask provisioningTask  
JOIN Task t ON t.id = provisioningTask.id  
JOIN TaskDefinition taskDefinition on t.definition_id = taskDefinition.id  
JOIN ProvisioningEntry pe ON pe.id = provisioningTask.provisioningEntry_id  
JOIN TaskQueue_Task tt ON t.id = tt.tasks_id  LEFT 
JOIN UserTask requester ON t.requester_id = requester.id  
LEFT JOIN UserTask recipient ON t.recipient_id = recipient.id  
LEFT JOIN ProvisioningEntryResource peResource ON peResource.id = pe.resource_id  
LEFT JOIN ProvisioningDirectoryEntry pdeResource ON pdeResource.id = peResource.id
LEFT JOIN ProvisioningDirectoryEntry pde ON pde.id = pe.provisioningInternalEntry_id  
LEFT JOIN ProvisioningEntryAccount peAccount ON peAccount.id = pde.id  
LEFT JOIN ProvisioningEntryEntitlement peEntitlement ON peEntitlement.id = pde.id  
LEFT JOIN ProvisioningEntryMembershipEntitlement peMembershipEntitlement ON peMembershipEntitlement.id = pde.id  
LEFT JOIN ProvisioningEntryMembershipOrganization peMembershipOrganization ON peMembershipOrganization.id = pde.id  
LEFT JOIN ProvisioningEntryMembershipRole peMembershipRole ON peMembershipRole.id = pde.id  
LEFT JOIN ProvisioningEntryOrganization peOrganization ON peOrganization.id = pde.id  
LEFT JOIN ProvisioningEntryRole peRole ON peRole.id = pde.id  
WHERE tt.TaskQueue_id = 1;










select task0_.id as id1_208_0_, task0_.actionId as actionId2_208_0_, task0_.category as category3_208_0_, task0_.createdBy as createdB4_208_0_, task0_.createdByObjectId as createdB5_208_0_, task0_.createdDate as createdD6_208_0_, task0_.deadline as deadline7_208_0_, task0_.definition_id as definit14_208_0_, task0_.notificationCount as notifica8_208_0_, task0_.priority as priority9_208_0_, task0_.recipient_id as recipie15_208_0_, task0_.requester_id as request16_208_0_, task0_.resolvedDate as resolve10_208_0_, task0_.result as result11_208_0_, task0_.status as status12_208_0_, task0_.workflowId as workflo13_208_0_, task0_1_.certificationEntry_id as certific6_40_0_, task0_1_.entryId as entryId1_40_0_, task0_1_.entryType as entryTyp2_40_0_, task0_1_.justification as justific3_40_0_, task0_1_.revokedJustification as revokedJ4_40_0_, task0_2_.disapprovalJustification as disappro1_25_0_, task0_2_.request_id as request_3_25_0_, task0_3_.justification as justific1_32_0_, task0_3_.request_id as request_3_32_0_, task0_4_.notProvisionedJustification as notProvi1_126_0_, task0_4_.provisioningEntry_id as provisio3_126_0_, task0_5_.entryId as entryId1_193_0_, task0_5_.entryType as entryTyp2_193_0_, task0_5_.justification as justific3_193_0_, task0_5_.sodEntry_id as sodEntry5_193_0_, task0_6_.roleRightEntry_id as roleRigh3_162_0_, task0_6_.type as type1_162_0_, case when task0_1_.id is not null then 1 when task0_2_.id is not null then 2 when task0_3_.id is not null then 3 when task0_4_.id is not null then 4 when task0_5_.id is not null then 5 when task0_6_.id is not null then 6 when task0_.id is not null then 0 end as clazz_0_, assignhist1_.task_id as task_id4_209_1_, assignhist1_.id as id1_209_1_, assignhist1_.id as id1_209_2_, assignhist1_.assign_date as assign_d2_209_2_, assignhist1_.from_id as from_id3_209_2_, assignhist1_.task_id as task_id4_209_2_, assignhist1_.to_id as to_id5_209_2_, usertask2_.id as id1_222_3_, usertask2_.directoryIdentifier as director2_222_3_, usertask2_.displayName as displayN3_222_3_, usertask2_.username as username4_222_3_, usertask3_.id as id1_222_4_, usertask3_.directoryIdentifier as director2_222_4_, usertask3_.displayName as displayN3_222_4_, usertask3_.username as username4_222_4_, taskdefini4_.id as id1_211_5_, taskdefini4_.description as descript2_211_5_, taskdefini4_.name as name3_211_5_, taskdefini4_.notificationTemplateId as notifica4_211_5_, taskdefini4_.percentageForNotifyUser as percenta5_211_5_, taskdefini4_.priority as priority6_211_5_, taskdefini4_.sla as sla7_211_5_, taskdefini4_.unit as unit8_211_5_, usertask5_.id as id1_222_6_, usertask5_.directoryIdentifier as director2_222_6_, usertask5_.displayName as displayN3_222_6_, usertask5_.username as username4_222_6_, usertask6_.id as id1_222_7_, usertask6_.directoryIdentifier as director2_222_7_, usertask6_.displayName as displayN3_222_7_, usertask6_.username as username4_222_7_, taskcommen7_.task_id as task_id4_210_8_, taskcommen7_.id as id1_210_8_, taskcommen7_.id as id1_210_9_, taskcommen7_.comment as comment2_210_9_, taskcommen7_.date as date3_210_9_, taskcommen7_.task_id as task_id4_210_9_, taskcommen7_.user_id as user_id5_210_9_, usertask8_.id as id1_222_10_, usertask8_.directoryIdentifier as director2_222_10_, usertask8_.displayName as displayN3_222_10_, usertask8_.username as username4_222_10_, rolerighte9_.id as id1_165_11_, rolerighte9_.action as action2_165_11_, rolerighte9_.approvalWorkflowId as approval3_165_11_, rolerighte9_.creationDate as creation4_165_11_, rolerighte9_.executionDate as executio5_165_11_, rolerighte9_.justification as justific6_165_11_, rolerighte9_.lockDate as lockDate7_165_11_, rolerighte9_.lockNumber as lockNumb8_165_11_, rolerighte9_.requester_id as request11_165_11_, rolerighte9_.role_id as role_id12_165_11_, rolerighte9_.roleRightPolicyId as roleRigh9_165_11_, rolerighte9_.status as status10_165_11_, rolerighte10_.id as id1_164_12_, rolerighte10_1_.directoryIdentifier as director2_164_12_, rolerighte10_1_.type as type3_164_12_, rolerighte10_.displayName as displayN1_169_12_, rolerighte10_.username as username2_169_12_, rolerighte11_.id as id1_164_13_, rolerighte11_1_.directoryIdentifier as director2_164_13_, rolerighte11_1_.type as type3_164_13_, rolerighte11_.name as name1_168_13_, certificat12_.id as id1_43_14_, certificat12_.certificationInternalEntry_id as certifi14_43_14_, certificat12_.createdBy as createdB2_43_14_, certificat12_.createdByObjectId as createdB3_43_14_, certificat12_.creationDate as creation4_43_14_, certificat12_.entryId as entryId5_43_14_, certificat12_.entryType as entryTyp6_43_14_, certificat12_.lockDate as lockDate7_43_14_, certificat12_.lockNumber as lockNumb8_43_14_, certificat12_.policy_id as policy_15_43_14_, certificat12_.processDate as processD9_43_14_, certificat12_.selector_id as selecto16_43_14_, certificat12_.status as status10_43_14_, certificat12_.uncertifiedEntryAction as uncerti11_43_14_, certificat12_.workflowCertificationId as workflo12_43_14_, certificat12_.workflowCertificationName as workflo13_43_14_, certificat12_1_.SelectorExecutionInstance_id as Selector1_184_14_, certificat12_2_.MicroCertificationExecutionInstance_id as MicroCer1_90_14_, certificat12_3_.CampaignExecutionInstance_id as Campaign1_39_14_, certificat13_.id as id1_42_15_, certificat13_.directoryIdentifier as director2_42_15_, certificat13_.type as type3_42_15_, certificat13_1_.role_id as role_id2_47_15_, certificat13_1_.user_id as user_id3_47_15_, certificat13_2_.account_id as account_2_46_15_, certificat13_2_.entitlement_id as entitlem3_46_15_, certificat13_3_.name as name1_45_15_, certificat13_4_.name as name1_48_15_, certificat13_5_.accountIdentifier as accountI1_44_15_, certificat13_5_.displayName as displayN2_44_15_, certificat13_5_.resourceId as resource3_44_15_, certificat13_5_.resourceName as resource4_44_15_, certificat13_5_.userId as userId5_44_15_, certificat13_5_.username as username6_44_15_, certificat13_6_.displayName as displayN1_50_15_, certificat13_6_.username as username2_50_15_, case when certificat13_1_.id is not null then 1 when certificat13_2_.id is not null then 2 when certificat13_3_.id is not null then 3 when certificat13_4_.id is not null then 4 when certificat13_5_.id is not null then 5 when certificat13_6_.id is not null then 6 when certificat13_.id is not null then 0 end as clazz_15_, certificat14_.id as id1_52_16_, certificat14_.certificationObjectType as certific2_52_16_, certificat14_.certificationWorkflowName as certific3_52_16_, certificat14_.criticity as criticit4_52_16_, certificat14_.description as descript5_52_16_, certificat14_.filterObjectType as filterOb6_52_16_, certificat14_.filterObjectTypeId as filterOb7_52_16_, certificat14_.limitOfEntriesByExecution as limitOfE8_52_16_, certificat14_.name as name9_52_16_, certificat14_.numberOfDaysSinceLastCertification as numberO10_52_16_, certificat14_.selectAllEntries as selectA11_52_16_, certificat14_.selectExpiratedEntries as selectE12_52_16_, certificat14_.selectNotCertifiableEntries as selectN13_52_16_, certificat14_.uncertifiedEntryAction as uncerti14_52_16_, certificat14_.userFilterRules as userFil15_52_16_, certificat15_.id as id1_53_17_, certificat15_.certificationAccountWorkflowName as certific2_53_17_, certificat15_.certificationMembershipEntitlementWorkflowName as certific3_53_17_, certificat15_.certificationMembershipRoleWorkflowName as certific4_53_17_, certificat15_.certifyAccounts as certifyA5_53_17_, certificat15_.certifyMembershipEntitlements as certifyM6_53_17_, certificat15_.certifyMembershipRoles as certifyM7_53_17_, certificat15_.certifyUsers as certifyU8_53_17_, certificat15_.description as descript9_53_17_, certificat15_.enabled as enabled10_53_17_, certificat15_.name as name11_53_17_, certificat15_.position as positio12_53_17_, certificat15_.rules as rules13_53_17_, certificat15_.sla as sla14_53_17_, certificat15_.type as type15_53_17_, certificat15_.uncertifiedAccountAction as uncerti16_53_17_, certificat15_.uncertifiedMembershipEntitlementAction as uncerti17_53_17_, certificat15_.uncertifiedMembershipRoleAction as uncerti18_53_17_, provisioni16_.id as id1_113_18_, provisioni16_.beneficiary_id as benefic16_113_18_, provisioni16_.date as date2_113_18_, provisioni16_.entryType as entryTyp3_113_18_, provisioni16_.lockDate as lockDate4_113_18_, provisioni16_.lockNumber as lockNumb5_113_18_, provisioni16_.payload as payload6_113_18_, provisioni16_.processDate as processD7_113_18_, provisioni16_.provisioningInternalEntry_id as provisi17_113_18_, provisioni16_.provisioningTaskDefinitionIdentifier as provisio8_113_18_, provisioni16_.provisioningTaskQueueIdentifier as provisio9_113_18_, provisioni16_.provisioningType as provisi10_113_18_, provisioni16_.provisioningTypeObjectId as provisi11_113_18_, provisioni16_.resource_id as resourc18_113_18_, provisioni16_.status as status12_113_18_, provisioni16_.targetId as targetI13_113_18_, provisioni16_.targetType as targetT14_113_18_, provisioni16_.workflowId as workflo15_113_18_, provisioni17_.id as id1_112_19_, provisioni17_1_.directoryIdentifier as director2_112_19_, provisioni17_1_.type as type3_112_19_, provisioni17_.displayName as displayN1_123_19_, provisioni17_.username as username2_123_19_, provisioni18_.id as id1_112_20_, provisioni18_1_.directoryIdentifier as director2_112_20_, provisioni18_1_.type as type3_112_20_, provisioni18_.name as name1_120_20_, blazonrequ19_.id as id1_22_21_, blazonrequ19_.approvalFinishedAt as approval2_22_21_, blazonrequ19_.approvalPolicy_id as approval3_22_21_, blazonrequ19_.approvalProcess as approval4_22_21_, blazonrequ19_.approvalStartedAt as approval5_22_21_, blazonrequ19_.approvalWorkflowId as approval6_22_21_, blazonrequ19_.beneficiary_id as benefic29_22_21_, blazonrequ19_.createDate as createDa7_22_21_, blazonrequ19_.createdBy as createdB8_22_21_, blazonrequ19_.createdByObjectId as createdB9_22_21_, blazonrequ19_.dependenciesVerifiedAt as depende10_22_21_, blazonrequ19_.effectiveDate as effecti11_22_21_, blazonrequ19_.finalizeDate as finaliz12_22_21_, blazonrequ19_.generatedBySystem as generat13_22_21_, blazonrequ19_.justification as justifi14_22_21_, blazonrequ19_.lockDate as lockDat15_22_21_, blazonrequ19_.lockNumber as lockNum16_22_21_, blazonrequ19_.needApproval as needApp17_22_21_, blazonrequ19_.parent_id as parent_30_22_21_, blazonrequ19_.payload as payload18_22_21_, blazonrequ19_.payloadWithItemThatViolatesSodPolicy as payload19_22_21_, blazonrequ19_.provisioningEntryId as provisi20_22_21_, blazonrequ19_.provisioningFinishedAt as provisi21_22_21_, blazonrequ19_.provisioningStartedAt as provisi22_22_21_, blazonrequ19_.requestInternalEntry_id as request31_22_21_, blazonrequ19_.requester_id as request32_22_21_, blazonrequ19_.sodFinishedAt as sodFini23_22_21_, blazonrequ19_.sodProcess as sodProc24_22_21_, blazonrequ19_.sodStartedAt as sodStar25_22_21_, blazonrequ19_.sodWorkflowId as sodWork26_22_21_, blazonrequ19_.status as status27_22_21_, blazonrequ19_.type as type28_22_21_, approvalde20_.request_id as request_6_4_22_, approvalde20_.id as id1_4_22_, approvalde20_.id as id1_4_23_, approvalde20_.approvalDate as approval2_4_23_, approvalde20_.creation as creation3_4_23_, approvalde20_.levelName as levelNam4_4_23_, approvalde20_.outcome as outcome5_4_23_, approvalde20_.request_id as request_6_4_23_, approvalde20_.task_id as task_id7_4_23_, blazonrequ21_.id as id1_26_24_, blazonrequ21_1_.directoryIdentifier as director2_26_24_, blazonrequ21_1_.type as type3_26_24_, blazonrequ21_.displayName as displayN1_34_24_, blazonrequ21_.username as username2_34_24_, dependsoni22_.BlazonRequest_id as BlazonRe1_23_25_, dependsoni22_.dependsOnIds as dependsO2_23_25_, blazonrequ23_.id as id1_22_26_, blazonrequ23_.approvalFinishedAt as approval2_22_26_, blazonrequ23_.approvalPolicy_id as approval3_22_26_, blazonrequ23_.approvalProcess as approval4_22_26_, blazonrequ23_.approvalStartedAt as approval5_22_26_, blazonrequ23_.approvalWorkflowId as approval6_22_26_, blazonrequ23_.beneficiary_id as benefic29_22_26_, blazonrequ23_.createDate as createDa7_22_26_, blazonrequ23_.createdBy as createdB8_22_26_, blazonrequ23_.createdByObjectId as createdB9_22_26_, blazonrequ23_.dependenciesVerifiedAt as depende10_22_26_, blazonrequ23_.effectiveDate as effecti11_22_26_, blazonrequ23_.finalizeDate as finaliz12_22_26_, blazonrequ23_.generatedBySystem as generat13_22_26_, blazonrequ23_.justification as justifi14_22_26_, blazonrequ23_.lockDate as lockDat15_22_26_, blazonrequ23_.lockNumber as lockNum16_22_26_, blazonrequ23_.needApproval as needApp17_22_26_, blazonrequ23_.parent_id as parent_30_22_26_, blazonrequ23_.payload as payload18_22_26_, blazonrequ23_.payloadWithItemThatViolatesSodPolicy as payload19_22_26_, blazonrequ23_.provisioningEntryId as provisi20_22_26_, blazonrequ23_.provisioningFinishedAt as provisi21_22_26_, blazonrequ23_.provisioningStartedAt as provisi22_22_26_, blazonrequ23_.requestInternalEntry_id as request31_22_26_, blazonrequ23_.requester_id as request32_22_26_, blazonrequ23_.sodFinishedAt as sodFini23_22_26_, blazonrequ23_.sodProcess as sodProc24_22_26_, blazonrequ23_.sodStartedAt as sodStar25_22_26_, blazonrequ23_.sodWorkflowId as sodWork26_22_26_, blazonrequ23_.status as status27_22_26_, blazonrequ23_.type as type28_22_26_, blazonrequ24_.id as id1_26_27_, blazonrequ24_.directoryIdentifier as director2_26_27_, blazonrequ24_.type as type3_26_27_, blazonrequ24_1_.name as name1_30_27_, blazonrequ24_2_.name as name1_27_27_, blazonrequ24_3_.name as name1_31_27_, blazonrequ24_4_.account_id as account_2_28_27_, blazonrequ24_4_.entitlement_id as entitlem3_28_27_, blazonrequ24_5_.accountIdentifier as accountI1_24_27_, blazonrequ24_5_.resourceId as resource2_24_27_, blazonrequ24_5_.resourceName as resource3_24_27_, blazonrequ24_6_.displayName as displayN1_34_27_, blazonrequ24_6_.username as username2_34_27_, case when blazonrequ24_1_.id is not null then 1 when blazonrequ24_2_.id is not null then 2 when blazonrequ24_3_.id is not null then 3 when blazonrequ24_4_.id is not null then 4 when blazonrequ24_5_.id is not null then 5 when blazonrequ24_6_.id is not null then 6 when blazonrequ24_.id is not null then 0 end as clazz_27_, blazonrequ25_.id as id1_26_28_, blazonrequ25_1_.directoryIdentifier as director2_26_28_, blazonrequ25_1_.type as type3_26_28_, blazonrequ25_.displayName as displayN1_34_28_, blazonrequ25_.username as username2_34_28_, soddetails26_.request_id as request_6_207_29_, soddetails26_.id as id1_207_29_, soddetails26_.id as id1_207_30_, soddetails26_.approvalDate as approval2_207_30_, soddetails26_.creation as creation3_207_30_, soddetails26_.levelName as levelNam4_207_30_, soddetails26_.outcome as outcome5_207_30_, soddetails26_.request_id as request_6_207_30_, soddetails26_.task_id as task_id7_207_30_, sodentry27_.id as id1_196_31_, sodentry27_.beneficiary_id as benefic12_196_31_, sodentry27_.createdAt as createdA2_196_31_, sodentry27_.entry_id as entry_id3_196_31_, sodentry27_.entryType as entryTyp4_196_31_, sodentry27_.lockDate as lockDate5_196_31_, sodentry27_.lockNumber as lockNumb6_196_31_, sodentry27_.processedAt as processe7_196_31_, sodentry27_.result as result8_196_31_, sodentry27_.sodInternalEntry_id as sodInte13_196_31_, sodentry27_.sodPolicyId as sodPolic9_196_31_, sodentry27_.status as status10_196_31_, sodentry27_.workflowId as workflo11_196_31_, sodentryus28_.id as id1_195_32_, sodentryus28_1_.directoryIdentifier as director2_195_32_, sodentryus28_1_.type as type3_195_32_, sodentryus28_.displayName as displayN1_203_32_, sodentryus28_.username as username2_203_32_, soddirecto29_.id as id1_195_33_, soddirecto29_.directoryIdentifier as director2_195_33_, soddirecto29_.type as type3_195_33_, soddirecto29_1_.account_id as account_2_199_33_, soddirecto29_1_.entitlement_id as entitlem3_199_33_, soddirecto29_2_.name as name1_198_33_, soddirecto29_3_.displayName as displayN1_203_33_, soddirecto29_3_.username as username2_203_33_, soddirecto29_4_.accountIdentifier as accountI1_197_33_, soddirecto29_4_.resourceId as resource2_197_33_, soddirecto29_4_.resourceName as resource3_197_33_, soddirecto29_5_.role_id as role_id2_200_33_, soddirecto29_5_.user_id as user_id3_200_33_, soddirecto29_6_.name as name1_201_33_, case when soddirecto29_1_.id is not null then 1 when soddirecto29_2_.id is not null then 2 when soddirecto29_3_.id is not null then 3 when soddirecto29_4_.id is not null then 4 when soddirecto29_5_.id is not null then 5 when soddirecto29_6_.id is not null then 6 when soddirecto29_.id is not null then 0 end as clazz_33_ 
from Task task0_ 
left outer join CertificationApprovalTask task0_1_ on task0_.id=task0_1_.id 
left outer join BlazonRequestApprovalTask task0_2_ on task0_.id=task0_2_.id 
left outer join BlazonRequestSodApprovalTask task0_3_ on task0_.id=task0_3_.id 
left outer join ProvisioningTask task0_4_ on task0_.id=task0_4_.id 
left outer join SodApprovalTask task0_5_ on task0_.id=task0_5_.id 
left outer join RoleRightApprovalTask task0_6_ on task0_.id=task0_6_.id 
left outer join TaskAssignHistory assignhist1_ on task0_.id=assignhist1_.task_id 
left outer join UserTask usertask2_ on assignhist1_.from_id=usertask2_.id 
left outer join UserTask usertask3_ on assignhist1_.to_id=usertask3_.id 
left outer join TaskDefinition taskdefini4_ on task0_.definition_id=taskdefini4_.id 
left outer join UserTask usertask5_ on task0_.recipient_id=usertask5_.id 
left outer join UserTask usertask6_ on task0_.requester_id=usertask6_.id 
left outer join TaskComment taskcommen7_ on task0_.id=taskcommen7_.task_id 
left outer join UserTask usertask8_ on taskcommen7_.user_id=usertask8_.id 
left outer join RoleRightEntry rolerighte9_ on task0_6_.roleRightEntry_id=rolerighte9_.id 
left outer join RoleRightEntryUser rolerighte10_ on rolerighte9_.requester_id=rolerighte10_.id 
left outer join RoleRightDirectoryEntry rolerighte10_1_ on rolerighte10_.id=rolerighte10_1_.id 
left outer join RoleRightEntryRole rolerighte11_ on rolerighte9_.role_id=rolerighte11_.id 
left outer join RoleRightDirectoryEntry rolerighte11_1_ on rolerighte11_.id=rolerighte11_1_.id 
left outer join CertificationEntry certificat12_ on task0_1_.certificationEntry_id=certificat12_.id 
left outer join SelectorExecutionInstance_CertificationEntry certificat12_1_ on certificat12_.id=certificat12_1_.certificationEntries_id 
left outer join MicroCertificationExecutionInstance_CertificationEntry certificat12_2_ on certificat12_.id=certificat12_2_.certificationEntries_id 
left outer join CampaignExecutionInstance_CertificationEntry certificat12_3_ on certificat12_.id=certificat12_3_.certificationEntries_id 
left outer join CertificationDirectoryEntry certificat13_ on certificat12_.certificationInternalEntry_id=certificat13_.id 
left outer join CertificationEntryMembershipRole certificat13_1_ on certificat13_.id=certificat13_1_.id 
left outer join CertificationEntryMembershipEntitlement certificat13_2_ on certificat13_.id=certificat13_2_.id 
left outer join CertificationEntryEntitlement certificat13_3_ on certificat13_.id=certificat13_3_.id 
left outer join CertificationEntryRole certificat13_4_ on certificat13_.id=certificat13_4_.id 
left outer join CertificationEntryAccount certificat13_5_ on certificat13_.id=certificat13_5_.id 
left outer join CertificationEntryUser certificat13_6_ on certificat13_.id=certificat13_6_.id 
left outer join CertificationPolicy certificat14_ on certificat12_.policy_id=certificat14_.id 
left outer join CertificationSelector certificat15_ on certificat12_.selector_id=certificat15_.id 
left outer join ProvisioningEntry provisioni16_ on task0_4_.provisioningEntry_id=provisioni16_.id 
left outer join ProvisioningEntryUser provisioni17_ on provisioni16_.beneficiary_id=provisioni17_.id 
left outer join ProvisioningDirectoryEntry provisioni17_1_ on provisioni17_.id=provisioni17_1_.id 
left outer join ProvisioningEntryResource provisioni18_ on provisioni16_.resource_id=provisioni18_.id 
left outer join ProvisioningDirectoryEntry provisioni18_1_ on provisioni18_.id=provisioni18_1_.id 
left outer join BlazonRequest blazonrequ19_ on task0_2_.request_id=blazonrequ19_.id 
left outer join ApprovalTaskDetail approvalde20_ on blazonrequ19_.id=approvalde20_.request_id 
left outer join BlazonRequestUser blazonrequ21_ on blazonrequ19_.beneficiary_id=blazonrequ21_.id 
left outer join BlazonRequestDirectoryEntry blazonrequ21_1_ on blazonrequ21_.id=blazonrequ21_1_.id 
left outer join BlazonRequest_dependsOnIds dependsoni22_ on blazonrequ19_.id=dependsoni22_.BlazonRequest_id 
left outer join BlazonRequest blazonrequ23_ on blazonrequ19_.parent_id=blazonrequ23_.id 
left outer join BlazonRequestDirectoryEntry blazonrequ24_ on blazonrequ19_.requestInternalEntry_id=blazonrequ24_.id 
left outer join BlazonRequestResource blazonrequ24_1_ on blazonrequ24_.id=blazonrequ24_1_.id 
left outer join BlazonRequestEntitlement blazonrequ24_2_ on blazonrequ24_.id=blazonrequ24_2_.id 
left outer join BlazonRequestRole blazonrequ24_3_ on blazonrequ24_.id=blazonrequ24_3_.id 
left outer join BlazonRequestMembershipEntitlement blazonrequ24_4_ on blazonrequ24_.id=blazonrequ24_4_.id 
left outer join BlazonRequestAccount blazonrequ24_5_ on blazonrequ24_.id=blazonrequ24_5_.id 
left outer join BlazonRequestUser blazonrequ24_6_ on blazonrequ24_.id=blazonrequ24_6_.id 
left outer join BlazonRequestUser blazonrequ25_ on blazonrequ19_.requester_id=blazonrequ25_.id 
left outer join BlazonRequestDirectoryEntry blazonrequ25_1_ on blazonrequ25_.id=blazonrequ25_1_.id 
left outer join SodTaskDetail soddetails26_ on blazonrequ19_.id=soddetails26_.request_id 
left outer join SodEntry sodentry27_ on task0_5_.sodEntry_id=sodentry27_.id 
left outer join SodEntryUser sodentryus28_ on sodentry27_.beneficiary_id=sodentryus28_.id 
left outer join SodDirectoryEntry sodentryus28_1_ on sodentryus28_.id=sodentryus28_1_.id 
left outer join SodDirectoryEntry soddirecto29_ on sodentry27_.sodInternalEntry_id=soddirecto29_.id 
left outer join SodEntryMembershipEntitlement soddirecto29_1_ on soddirecto29_.id=soddirecto29_1_.id 
left outer join SodEntryEntitlement soddirecto29_2_ on soddirecto29_.id=soddirecto29_2_.id 
left outer join SodEntryUser soddirecto29_3_ on soddirecto29_.id=soddirecto29_3_.id 
left outer join SodEntryAccount soddirecto29_4_ on soddirecto29_.id=soddirecto29_4_.id 
left outer join SodEntryMembershipRole soddirecto29_5_ on soddirecto29_.id=soddirecto29_5_.id 
left outer join SodEntryRole soddirecto29_6_ on soddirecto29_.id=soddirecto29_6_.id 
where task0_.id=?


select cartitem0_.id as id1_2_, cartitem0_.article_id as article_2_2_ 
from cart_item cartitem0_ 
inner join article article1_ on cartitem0_.article_id=article1_.id 
inner join article article2_ on cartitem0_.article_id=article2_.id


select orderitem0_.id as id1_3_, orderitem0_.item_id as item_id2_3_ 
from order_item orderitem0_ 
inner join cart_item cartitem1_ on orderitem0_.item_id=cartitem1_.id 
inner join article article2_ on cartitem1_.article_id=article2_.id 
inner join article article3_ on cartitem1_.article_id=article3_.id 
left outer join book article3_1_ on article3_.id=article3_1_.id 
where article3_1_.title=?


select orderItem.id, orderItem.item_id 
from order_item orderItem 
inner join cart_item cartItem on orderItem.item_id=cartItem.id 
inner join article article1 on cartItem.article_id=article1.id 
inner join article article2 on cartItem.article_id=article2.id 
left outer join book book on article2.id=book.id 
where book.title='teste';




SELECT * 
FROM ProvisioningTask provisioningTask 
JOIN Task t ON t.id = provisioningTask.id 
JOIN TaskDefinition taskDefinition on t.definition_id = taskDefinition.id 
JOIN ProvisioningEntry pe ON pe.id = provisioningTask.provisioningEntry_id 
JOIN TaskQueue_Task tt ON t.id = tt.tasks_id 
LEFT JOIN UserTask requester ON t.requester_id = requester.id 
LEFT JOIN UserTask recipient ON t.recipient_id = recipient.id 
LEFT JOIN ProvisioningDirectoryEntry peResource ON peResource.id = pe.resource_id 
LEFT JOIN ProvisioningDirectoryEntry pde ON pde.id = pe.provisioningInternalEntry_id 
WHERE tt.TaskQueue_id = 1;

select * from ProvisioningDirectoryEntry

desc ProvisioningDirectoryEntry;



select count(*) as amountCertificationEntries, 
instance.id as instanceId, 
instance.date as creationDate, 
instance.finalizeDate as finalizeDate, 
instance.deadline as deadline, 
instance.status as status, 
definition.name as name, 
definition.sla as sla 
from CampaignExecutionInstance_CertificationEntry ceice 
join CampaignExecutionInstance instance on instance.id = ceice.CampaignExecutionInstance_id 
join CampaignDefinition definition on definition.id = instance.campaign_id 
join CertificationEntry entry on entry.id = ceice.certificationEntries_id 
where instance.date >= '2000-01-08 16:20:52.0'
group by instance.id;
					
select now();
					
SELECT * from ANALYTICS_CERTIFICATION_CAMPAIGN_RESUME_FACT;		

select * from ANALYTICS_CERTIFICATION_CAMPAIGN_DETAIL_FACT;

update JobInstance set lastSuccessExecution = 0, timeOflastExecution = 0 where id = 14;

update JobInstance set lastSuccessExecution = 0, timeOflastExecution = 0 where id = 15;

delete from JobExecution where instance_id = 14;

delete from JobExecution where instance_id = 15;

 select count(*) as total, 	instance.id as instanceId, 	policy.id as policyId,    policy.name as policyName  from CampaignExecutionInstance_CertificationEntry ceice  
 join CampaignExecutionInstance instance on instance.id = ceice.CampaignExecutionInstance_id  
 join CertificationEntry entry on entry.id = ceice.certificationEntries_id  
 join CertificationPolicy policy on policy.id = entry.policy_id  
 where instance.date >= '1969-12-31 21:00:00.0'  
 and instance.id = 1  and entry.status = 'REVOKED'  
 group by instance.id, policy.id;

select sum(amountCanceled), sum(amountCertified), sum(amountError), sum(amountOpen), sum(amountRevoked), avg(averageTime), CERTIFICATION_CAMPAIGN_RESUME_FACT_ID
from ANALYTICS_CERTIFICATION_CAMPAIGN_DETAIL_FACT
group by CERTIFICATION_CAMPAIGN_RESUME_FACT_ID, date;

select sum(amountCanceled), sum(amountCertified), sum(amountError), sum(amountOpen), sum(amountRevoked), avg(averageTime), date
from ANALYTICS_CERTIFICATION_CAMPAIGN_DETAIL_FACT
group by date
ORDER by date desc
limit 10

 select ROUND(AVG(TIMESTAMPDIFF(SECOND,entry.creationDate,entry.processDate)),0) as total, 	instance.id as instanceId, 	policy.id as policyId,    policy.name as policyName  
 from CampaignExecutionInstance_CertificationEntry ceice  
 join CampaignExecutionInstance instance on instance.id = ceice.CampaignExecutionInstance_id  
 join CertificationEntry entry on entry.id = ceice.certificationEntries_id  
 join CertificationPolicy policy on policy.id = entry.policy_id  
 where instance.date >= '1969-12-31 21:00:00.0'  
 and instance.id = 1  
 and entry.processDate is not null  group by instance.id, policy.id;


-- AssignmentRoleRevokeEntry

INSERT INTO blazon.AssignmentRoleRevokeUser
(directoryIdentifier, displayName, username)
VALUES(1, 'Marcos Silva', 'teste');

INSERT INTO blazon.AssignmentRoleRevokeRole
(directoryIdentifier, name)
VALUES(205, 'Porteiros');

INSERT INTO blazon.AssignmentRoleRevokeEntry
(createdAt, resolveAction, resolveNote, resolvedAt, status, resolvedBy_id, role_id, user_id)
VALUES('2020-03-05 08:00:00.0', null, null, null, 'WAITING_RESOLUTION', null, 1, 1);


--

select 
	id, actionId, category, createdBy, createdByObjectId,
	createdDate, deadline, notificationCount, priority, 
	resolvedDate, result, status, workflowId, definition_id,
	recipient_id, requester_id
from Task t 
where t.deadline < now()
	and (t.status = 'TODO' or t.status = 'WAITING_ASSIGN')
limit 500 offset 0; 

-- 

select * from ReconciliationEntry r;

select * from ReconciliationDirectoryEntry r;

-- Remover o managedy de todas as accounts e membershipEntitlements no qual o papel é o managedby;

desc Entry;

desc ManagedBy;

desc ManagedBy_objectIds;

select * from ManagedBy m 
where m.`type` = 'ROLE';

select * from Entry e
where e.managedBy_id in  
	(select m.id from ManagedBy m 
	where m.`type` = 'ROLE');

select e.id as entryId, 
	e.type as entryType, 
	m.id as managedById,
	mo.objectIds 
from ManagedBy_objectIds mo
join ManagedBy m on m.id = mo.ManagedBy_id
join Entry e on e.managedBy_id = m.id
where 1 = 1
	and m.type = 'ROLE'
	and (e.type = 'ACCOUNT' or e.type = 'MEMBERSHIP_ENTITLEMENT')
	and mo.objectIds = 107;

select * from Entry where id = 113;

select * from ManagedBy m where m.id = 72;

select * from ManagedBy_objectIds mo where mo.ManagedBy_id = 72;

select * from Entry where id = 12;


delete ManagedBy_objectIds
from ManagedBy_objectIds
join ManagedBy on ManagedBy.id = ManagedBy_objectIds.ManagedBy_id
join Entry on Entry.managedBy_id = ManagedBy.id
where ManagedBy.type = 'ROLE'
	and (Entry.type = 'ACCOUNT' or Entry.type = 'MEMBERSHIP_ENTITLEMENT')
	and ManagedBy_objectIds.objectIds = 12;



-- 



select * from Entry where state = 'REMOVED';

delete Entitlement from Entitlement 
join Entry entry on entry.id = Entitlement.id
where entry.state = 'REMOVED';


