
-- NotificationSettings 

delete from NotificationSettings;

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`,broadcast,groupId) VALUES 
('ACCOUNT',1,'Blazon Create Account Notification aaaa','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATE_ACCOUNT_NOTIFICATION',1,1)
,('ACCOUNT',1,'Blazon Remove Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','REVOKE_ACCOUNT_NOTIFICATION',0,NULL)
,('ACCOUNT',0,'Blazon Activate Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','ACTIVATE_ACCOUNT_NOTIFICATION',0,NULL)
,('ACCOUNT',0,'Blazon Inactivate Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','INACTIVATE_ACCOUNT_NOTIFICATION',0,NULL)
,('AUTHENTICATION_METHOD',1,'Blazon Send Otp Token Notification','<html>
  <head>
  </head>
  <body>
    	Blazon Send Otp Token Notification
  </body>
</html>','SENDOTPTOKEN_AUTHENTICATIONMETHODS_NOTIFICATION',0,NULL)
,('REQUEST',1,'Blazon Success Request Notification','<html>
  <head>
  </head>
  <body>
    Blazon Success Request Notification
  </body>
</html>','SUCCESS_REQUEST_NOTIFICATION',0,NULL)
,('REQUEST',1,'Blazon Error Request Notification','<html>
  <head>
  </head>
  <body>
    Blazon Error Request Notification
  </body>
</html>','ERROR_REQUEST_NOTIFICATION',0,NULL)
,('REQUEST',1,'Blazon Disapproved Task Request Notification','<html>
  <head>
  </head>
  <body>
    Blazon Disapproved Task Request Notification
  </body>
</html>','DISAPPROVED_REQUEST_NOTIFICATION',0,NULL)
,('CERTIFICATION',1,'Blazon Open Task Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>
Blazon Open Task Certification Notification
</body>
</html>
','OPEN_TASK_CERTIFICATION_NOTIFICATION',0,NULL)
,('CERTIFICATION',0,'Account Revoked Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','ACCOUNT_REVOKED_CERTIFICATION_NOTIFICATION',0,NULL)
;
INSERT INTO NotificationSettings (category,enabled,subject,template,`type`,broadcast,groupId) VALUES 
('CERTIFICATION',0,'MembershipRole Revoked Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','MEMBERSHIP_ROLE_REVOKED_CERTIFICATION_NOTIFICATION',0,NULL)
,('CERTIFICATION',0,'MembershipEntitlement Revoked Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','MEMBERSHIP_ENTITLEMENT_REVOKED_CERTIFICATION_NOTIFICATION',0,NULL)
,('MEMBERSHIP_ENTITLEMENT',1,'Blazon Create MembershipEntitlement Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATE_MEMBERSHIP_ENTITLEMENT_NOTIFICATION',0,NULL)
,('MEMBERSHIP_ENTITLEMENT',1,'Blazon Remove MembershipEntitlement Notification','<html>
  <head>
  </head>
  	Blazon Remove MembershipEntitlement Notification
  <body>
  </body>
</html>','REVOKE_MEMBERSHIP_ENTITLEMENT_NOTIFICATION',0,NULL)
,('MEMBERSHIP_ROLE',1,'Blazon Create MembershipRole Notification','<html>
  <head>
  </head>
  <body>
    Blazon Create MembershipRole Notification
  </body>
</html>','CREATE_MEMBERSHIP_ROLE_NOTIFICATION',0,NULL)
,('MEMBERSHIP_ROLE',1,'Blazon Remove MembershipRole Notification','<html>
  <head>
  </head>
  <body>
    Blazon Remove MembershipRole Notification
  </body>
</html>','REVOKE_MEMBERSHIP_ROLE_NOTIFICATION',0,NULL)
,('PASSWORD_VAULT',1,'Blazon Create PasswordVault Notification','<html>
  <head>
  </head>
  <body>
    aadasd
  </body>
</html>','CREATE_PASSWORDVAULT_NOTIFICATION',0,NULL)
,('PROVISIONING',1,'Blazon Error Provisioning Notification','<html>
  <head>
  </head>
  <body>
    zszsdzs
  </body>
</html>','ERROR_PROVISIONING_NOTIFICATION',0,NULL)
,('RECONCILIATION',1,'Blazon Error Reconciliation Notification','<html>
  <head>
  </head>
  <body>
    teste erros
  </body>
</html>','ERROR_RECONCILIATION_NOTIFICATION',0,NULL)
,('RECONCILIATION',1,'Blazon Waiting Resolution Reconciliation Notification','<html>
  <head>
  </head>
  <body>
    sdadadadasd
  </body>
</html>','WAITING_MANUAL_RESOLUTION_RECONCILIATION_NOTIFICATION',0,NULL)
;
INSERT INTO NotificationSettings (category,enabled,subject,template,`type`,broadcast,groupId) VALUES 
('ROLERIGHT_REVOKE',0,'Blazon Waiting Resolution RoleRightRevoke Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','WAITING_RESOLUTION_ROLERIGHTREVOKE_NOTIFICATION',0,NULL)
,('USER',1,'Blazon Activate User Notification','<html>
  <head>
  </head>
  <body>
    Blazon Activate User Notification
  </body>
</html>','ACTIVATE_USER_NOTIFICATION',0,NULL)
,('USER',1,'Change User Password Notification','<html>
  <head>
  </head>
  <body>
    Change User Password Notification
  </body>
</html>','CHANGE_PASSWORD_USER_NOTIFICATION',0,NULL)
,('USER',1,'Blazon Create User Notification','<html>
  <head>
  </head>
  <body>
    Blazon Create User Notification
  </body>
</html>','CREATE_USER_NOTIFICATION',0,NULL)
,('USER',1,'Blazon Inactivate User Notification','<html>
  <head>
  </head>
  <body>
    	Blazon Inactivate User Notification
  </body>
</html>','INACTIVATE_USER_NOTIFICATION',0,NULL)
,('USER',1,'Blazon Lock User Notification','<html>
  <head>
  </head>
  <body>
    Blazon Lock User Notification
  </body>
</html>','LOCK_USER_NOTIFICATION',0,NULL)
,('USER',0,'Blazon Remove User Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','REMOVE_USER_NOTIFICATION',0,NULL)
,('USER',1,'Blazon Unlock User Notification','<html>
  <head>
  </head>
  <body>
    Blazon Unlock User Notification
  </body>
</html>','UNLOCK_USER_NOTIFICATION',0,NULL)
,('ACCOUNT',0,'Blazon Change Application Account Owner Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CHANGE_APPLICATION_ACCOUNT_OWNER_NOTIFICATION',0,NULL)
,('ACCOUNT',0,'Blazon Change Password Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CHANGE_PASSWORD_ACCOUNT_NOTIFICATION',0,NULL)
;
INSERT INTO NotificationSettings (category,enabled,subject,template,`type`,broadcast,groupId) VALUES 
('ACCOUNT',0,'Blazon Remove Shared Account Membership Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','REMOVE_SHARED_ACCOUNT_MEMBERSHIP',0,NULL)
,('ROLERIGHT',1,'Blazon Waiting Resolution Unassignment Membership Role Notification','<html>
  <head>
  </head>
  <body>
    Blazon Waiting Resolution Unassignment Membership Role Notification
  </body>
</html>','WAITING_RESOLUTION_UNASSIGNMENT_MEMBERSHIP_ROLE_NOTFICATION',0,NULL)
,('ROLERIGHT',1,'Blazon Waiting Resolution Unassignment Account Notification','<html>
  <head>
  </head>
  <body>
    Blazon Waiting Resolution Unassignment Account Notification
  </body>
</html>','WAITING_RESOLUTION_UNASSIGNMENT_ACCOUNT_NOTFICATION',0,NULL)
,('ROLERIGHT',1,'Blazon Waiting Resolution Unassignment Membership Entitlement Notification','<html>
  <head>
  </head>
  <body>
    Blazon Waiting Resolution Unassignment Membership Entitlement Notification
  </body>
</html>','WAITING_RESOLUTION_UNASSIGNMENT_MEMBERSHIP_ENTITLEMENT_NOTFICATION',0,NULL)
,('ROLERIGHT',1,'Blazon Waiting Resolution Approval RoleRight Notification','<html>
  <head>
  </head>
  <body>
    Blazon Waiting Resolution Approval RoleRight Notification
  </body>
</html>','WAITING_RESOLUTION_APPROVAL_ROLERIGHT_NOTFICATION',0,NULL)
,('REQUEST',1,'Blazon Approved Request Notification','<html>
  <head>
  </head>
  <body>
    Blazon Approved Request Notification
  </body>
</html>','APPROVED_REQUEST_NOTIFICATION',0,NULL)
,('REQUEST',1,'Blazon Open Request Approval Task Notification','<html>
  <head>
  </head>
  <body>
    Blazon Open Request Approval Task Notification
  </body>
</html>','OPEN_APPROVAL_TASK_NOTIFICATION',0,NULL)
,('PASSWORD_VAULT',1,'Blazon Remove Password Vault Item Notification','<html>
  <head>
  </head>
  <body>
    Blazon Remove Password Vault Item Notification
  </body>
</html>','REMOVE_PASSWORDVAULT_NOTIFICATION',0,NULL)
,('IMPORTATION',1,'Blazon Import Batch Finalize Notification','<html>
  <head>
  </head>
  <body>
    Blazon Import Batch Finalize Notification
  </body>
</html>','IMPORT_BATCH_FINALIZE_NOTIFICATION',0,NULL)
,('TASK',0,'Blazon Comment Task Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','COMMENT_TASK_NOTIFICATION',0,NULL)
;
INSERT INTO NotificationSettings (category,enabled,subject,template,`type`,broadcast,groupId) VALUES 
('TASK',0,'Blazon Created Task Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATED_TASK_NOTIFICATION',0,NULL)
,('TASK',0,'Blazon Open Task Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','OPEN_TASK_NOTIFICATION',0,NULL)
;


-- delete JobInstance "Amount Open Tasks By Category (REQUEST_SOD_TASK) Monitoring Job"

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	where instance.name like 'Amount Open Tasks By Category (REQUEST_SOD_TASK) Monitoring Job'
);

delete from JobInstance where name like 'Amount Open Tasks By Category (REQUEST_SOD_TASK) Monitoring Job';


-- delete JobInstance "Amount Created Tasks By REQUEST_SOD_TASK Category Monitoring Job"

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	where instance.name like 'Amount Created Tasks By REQUEST_SOD_TASK Category Monitoring Job'
);

delete from JobInstance where name like 'Amount Created Tasks By REQUEST_SOD_TASK Category Monitoring Job';



-- delete JobInstance "Amount Resolved Tasks By Category (REQUEST_SOD_TASK) Monitoring Job"

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	where instance.name like 'Amount Resolved Tasks By Category (REQUEST_SOD_TASK) Monitoring Job'
);

delete from JobInstance where name like 'Amount Resolved Tasks By Category (REQUEST_SOD_TASK) Monitoring Job';





