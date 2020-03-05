
-- Insert CertificationNotificationSettings


INSERT INTO CertificationNotificationSettings(id, enabled, subject, template, type) VALUES (6, 0, 'User Revoked Certification Notification', '<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
', 'USER_REVOKED_CERTIFICATION_NOTIFICATION');

INSERT INTO CertificationNotificationSettings(id, enabled, subject, template, type) VALUES (7, 0, 'Account Revoked Certification Notification', '<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
', 'ACCOUNT_REVOKED_CERTIFICATION_NOTIFICATION');

INSERT INTO CertificationNotificationSettings(id, enabled, subject, template, type) VALUES (8, 0, 'MembershipRole Revoked Certification Notification', '<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
', 'MEMBERSHIP_ROLE_REVOKED_CERTIFICATION_NOTIFICATION');

INSERT INTO CertificationNotificationSettings(id, enabled, subject, template, type) VALUES (9, 0, 'MembershipEntitlement Revoked Certification Notification', '<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
</head>
<body>

</body>
</html>
', 'MEMBERSHIP_ENTITLEMENT_REVOKED_CERTIFICATION_NOTIFICATION');
