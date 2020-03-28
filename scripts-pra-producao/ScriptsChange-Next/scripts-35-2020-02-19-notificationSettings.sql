
-- NotificationSettings

create table NotificationSettings (
    id bigint not null auto_increment,
    category varchar(255),
    enabled boolean default false,
    subject varchar(1000),
    template longtext,
    type varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- AccountNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('ACCOUNT',0,'Blazon Create Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATE_ACCOUNT_NOTIFICATION')
,('ACCOUNT',0,'Blazon Remove Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','REVOKE_ACCOUNT_NOTIFICATION')
,('ACCOUNT',0,'Blazon Activate Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','ACTIVATE_ACCOUNT_NOTIFICATION')
,('ACCOUNT',0,'Blazon Inactivate Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','INACTIVATE_ACCOUNT_NOTIFICATION');

-- AuthenticationMethodsNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('AUTHENTICATION_METHOD',0,'Blazon Send Otp Token Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SENDOTPTOKEN_AUTHENTICATIONMETHODS_NOTIFICATION');


-- BlazonRequestNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('REQUEST',0,'Blazon Success Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SUCCESS_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Error Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','ERROR_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Comment Task Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','COMMENT_TASK_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Resolved Task Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','RESOLVE_TASK_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Open Task Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','OPEN_TASK_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon SLA Reached Task Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SLAREACHED_TASK_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Disapproved Task Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','DISAPPROVED_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Comment Task SOD Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','COMMENT_TASK_SOD_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Resolved Task SOD Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','RESOLVE_TASK_SOD_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Open Task SOD Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','OPEN_TASK_SOD_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon SLA Reached Task SOD Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SLAREACHED_TASK_SOD_REQUEST_NOTIFICATION')
,('REQUEST',0,'Blazon Created Task Request Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATED_TASK_REQUEST_NOTIFICATION');

-- CertificationNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('CERTIFICATION',0,'Blazon Comment Task Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','COMMENT_TASK_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'Blazon Resolved Task Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','RESOLVE_TASK_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'Blazon Open Task Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','OPEN_TASK_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'Blazon Created Task Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','CREATED_TASK_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'Blazon SLA Reached Task Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','SLAREACHED_TASK_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'User Revoked Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','USER_REVOKED_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'Account Revoked Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','ACCOUNT_REVOKED_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'MembershipRole Revoked Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','MEMBERSHIP_ROLE_REVOKED_CERTIFICATION_NOTIFICATION')
,('CERTIFICATION',0,'MembershipEntitlement Revoked Certification Notification','<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
','MEMBERSHIP_ENTITLEMENT_REVOKED_CERTIFICATION_NOTIFICATION');


-- MembershipEntitlementNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('MEMBERSHIP_ENTITLEMENT',0,'Blazon Create MembershipEntitlement Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATE_MEMBERSHIP_ENTITLEMENT_NOTIFICATION')
,('MEMBERSHIP_ENTITLEMENT',0,'Blazon Remove MembershipEntitlement Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','REMOVE_MEMBERSHIP_ENTITLEMENT_NOTIFICATION')
;


-- MembershipRoleNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('MEMBERSHIP_ROLE',0,'Blazon Create MembershipRole Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATE_MEMBERSHIP_ROLE_NOTIFICATION')
,('MEMBERSHIP_ROLE',0,'Blazon Remove MembershipRole Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','REMOVE_MEMBERSHIP_ROLE_NOTIFICATION');


-- PasswordVaultNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('PASSWORD_VAULT',0,'Blazon Create PasswordVault Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATE_PASSWORDVAULT_NOTIFICATION');


-- ProvisioningNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('PROVISIONING',0,'Blazon Error Provisioning Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','ERROR_PROVISIONING_NOTIFICATION')
,('PROVISIONING',0,'Blazon Comment Task Provisioning Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','COMMENT_TASK_PROVISIONING_NOTIFICATION')
,('PROVISIONING',0,'Blazon Resolved Task Provisioning Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','RESOLVE_TASK_PROVISIONING_NOTIFICATION')
,('PROVISIONING',0,'Blazon Open Task Provisioning Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','OPEN_TASK_PROVISIONING_NOTIFICATION')
,('PROVISIONING',0,'Blazon SLA Reached Task Provisioning Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SLAREACHED_TASK_PROVISIONING_NOTIFICATION');

-- ReconciliationNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('RECONCILIATION',0,'Blazon Error Reconciliation Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','ERROR_RECONCILIATION_NOTIFICATION')
,('RECONCILIATION',0,'Blazon Waiting Resolution Reconciliation Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','WAITING_MANUAL_RESOLUTION_RECONCILIATION_NOTIFICATION');

-- RoleRightRevokeNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('ROLERIGHT_REVOKE',0,'Blazon Waiting Resolution RoleRightRevoke Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','WAITING_RESOLUTION_ROLERIGHTREVOKE_NOTIFICATION')
,('ROLERIGHT_REVOKE',0,'Blazon Comment Task RoleRightRevoke Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','COMMENT_TASK_ROLERIGHT_NOTIFICATION')
,('ROLERIGHT_REVOKE',0,'Blazon Open Task RoleRightRevoke Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','OPEN_TASK_ROLERIGHT_NOTIFICATION')
,('ROLERIGHT_REVOKE',0,'Blazon Resolved Task RoleRightRevoke Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','RESOLVE_TASK_ROLERIGHT_NOTIFICATION')
,('ROLERIGHT_REVOKE',0,'Blazon SLA Reached Task RoleRightRevoke Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SLAREACHED_TASK_ROLERIGHT_NOTIFICATION');


-- SodNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('SOD',0,'SOD Error Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','ERROR_SOD_NOTIFICATION')
,('SOD',0,'SOD Task Comment Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','COMMENT_TASK_SOD_NOTIFICATION')
,('SOD',0,'SOD Resolve Task Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','RESOLVE_TASK_SOD_NOTIFICATION')
,('SOD',0,'SOD Open Task Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','OPEN_TASK_SOD_NOTIFICATION')
,('SOD',0,'SOD SLA Reached Task Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','SLAREACHED_TASK_SOD_NOTIFICATION');


-- UserNotificationSettings

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('USER',0,'Blazon Activate User Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','ACTIVATE_USER_NOTIFICATION')
,('USER',0,'Change User Password Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CHANGE_PASSWORD_USER_NOTIFICATION')
,('USER',0,'Blazon Create User Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CREATE_USER_NOTIFICATION')
,('USER',0,'Blazon Inactivate User Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','INACTIVATE_USER_NOTIFICATION')
,('USER',0,'Blazon Lock User Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','LOCK_USER_NOTIFICATION')
,('USER',0,'Blazon Remove User Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','REMOVE_USER_NOTIFICATION')
,('USER',0,'Blazon Unlock User Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','UNLOCK_USER_NOTIFICATION');





