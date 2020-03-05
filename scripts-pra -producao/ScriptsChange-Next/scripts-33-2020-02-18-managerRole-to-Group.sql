
RENAME TABLE ManagerRole TO Groupp;

RENAME TABLE ManagerRole_InternalPermissionGroup TO Groupp_InternalPermissionGroup;

RENAME TABLE ManagerRole_User TO Groupp_User;

RENAME TABLE TaskQueue_ManagerRole TO TaskQueue_Groupp;



ALTER TABLE Groupp_InternalPermissionGroup CHANGE COLUMN managerRoles_id groups_id bigint not null;

ALTER TABLE Groupp_User CHANGE COLUMN ManagerRole_id Group_id bigint not null;

ALTER TABLE TaskQueue_Groupp CHANGE COLUMN managerRoles_id groups_id bigint not null;






