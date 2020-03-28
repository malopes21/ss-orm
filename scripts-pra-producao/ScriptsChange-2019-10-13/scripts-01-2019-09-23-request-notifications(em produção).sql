
insert into BlazonRequestNotificationSettings (subject, type, template) values ('Blazon Disapproved Task Request Notification', 'DISAPPROVED_REQUEST_NOTIFICATION', '<html><head></head><body></body></html>');

ALTER TABLE ReconciliationNotificationSettings ADD COLUMN managerRoleId bigint;

ALTER TABLE ProvisioningNotificationSettings ADD COLUMN managerRoleId bigint;

-- Ajustar as tabelas no script de create-db-mysql-all.sql
