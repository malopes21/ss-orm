
-- scripts-01-2020-04-03

-- BlazonRequestTemp

create table BlazonRequestTemp (  
	request_id bigint, 
	accountId bigint,  
	entitlementId bigint,  
	membershipId bigint,  
	roleId bigint,  
	resourceId bigint,  
	beneficiary_id bigint,  
	requester_id bigint,  
	requestType varchar(255)  
);

insert into BlazonRequestTemp (request_id, accountId, entitlementId, membershipId, roleId, resourceId, beneficiary_id, requester_id, requestType) 
select id, accountId, entitlementId, membershipId, roleId, resourceId, beneficiary_id, requester_id, type 
from BlazonRequest;

ALTER TABLE BlazonRequestTransitionState 
DROP FOREIGN KEY FKdpfb02nx61vcbdbqkd8739rqv; 

ALTER TABLE BlazonRequest 
DROP FOREIGN KEY FKjf6m674x51u9mwbxilfjoaubh; 

ALTER TABLE BlazonRequest 
DROP FOREIGN KEY FKmahlggwuo8v5moybi6ajxpef;



ALTER TABLE BlazonRequest 
DROP COLUMN accountId; 

ALTER TABLE BlazonRequest 
DROP COLUMN entitlementId;

ALTER TABLE BlazonRequest 
DROP COLUMN roleId; 

ALTER TABLE BlazonRequest 
DROP COLUMN resourceId; 

ALTER TABLE BlazonRequest 
DROP COLUMN beneficiary_id;

ALTER TABLE BlazonRequest 
DROP COLUMN requester_id;

ALTER TABLE BlazonRequestTransitionState 
DROP COLUMN user_id;



ALTER TABLE BlazonRequest 
ADD COLUMN beneficiary_id bigint; 

ALTER TABLE BlazonRequest 
ADD COLUMN requester_id bigint; 

ALTER TABLE BlazonRequest 
ADD COLUMN requestInternalEntry_id bigint;







