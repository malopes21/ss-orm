
-- NotificationSettings - ACCOUNT

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('ACCOUNT',0,'Blazon Change Application Account Owner Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CHANGE_APPLICATION_ACCOUNT_OWNER_NOTIFICATION')
,('ACCOUNT',0,'Blazon Change Password Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','CHANGE_PASSWORD_ACCOUNT_NOTIFICATION')
,('ACCOUNT',0,'Blazon Remove Shared Account Membership Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','REMOVE_SHARED_ACCOUNT_MEMBERSHIP')
;



-- NotificationSettings - ROLERIGHT

INSERT INTO NotificationSettings (category,enabled,subject,template,`type`) VALUES 
('ROLERIGHT',0,'Blazon Waiting Resolution Unassignment Membership Role Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','WAITING_RESOLUTION_UNASSIGNMENT_MEMBERSHIP_ROLE_NOTFICATION')
,('ROLERIGHT',0,'Blazon Waiting Resolution Unassignment Account Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','WAITING_RESOLUTION_UNASSIGNMENT_ACCOUNT_NOTFICATION')
,('ROLERIGHT',0,'Blazon Waiting Resolution Unassignment Membership Entitlement Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','WAITING_RESOLUTION_UNASSIGNMENT_MEMBERSHIP_ENTITLEMENT_NOTFICATION')
,('ROLERIGHT',0,'Blazon Waiting Resolution Approval RoleRight Notification','<html>
  <head>
  </head>
  <body>
  </body>
</html>','WAITING_RESOLUTION_APPROVAL_ROLERIGHT_NOTFICATION')
;


-- com.blazon.monitoring.rolemanagement.jobs.HasOpenRoleRightEntriesMonitoringJob

insert into Job (className, description, displayName, parameters) values ('com.blazon.monitoring.rolemanagement.jobs.HasOpenRoleRightEntriesMonitoringJob', 
'Has Open RoleRight Entries Monitoring Job.', 'Has Open RoleRight Entries Monitoring Job', null);

insert into JobInstance (name, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId) 
select 'Has Open RoleRight Entries Monitoring Job' as name, 
	'[]' as params, 
	job.id as job_id, 
	false as activated, 
	'0 0/1 * * * ?' as cronExpression,
	'Has Open RoleRight Entries Monitoring Job' as externalGroupId,
	'Has Open RoleRight Entries Monitoring Job' as externalJobDetailId
from Job job
where job.className = 'com.blazon.monitoring.rolemanagement.jobs.HasOpenRoleRightEntriesMonitoringJob';	




