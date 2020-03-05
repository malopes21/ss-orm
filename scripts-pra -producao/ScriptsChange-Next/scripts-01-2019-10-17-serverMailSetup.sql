
-- ServerMailSetup

ALTER TABLE ServerMailSetup
MODIFY COLUMN needAuthentication varchar(255);

UPDATE ServerMailSetup
SET needAuthentication = IF(needAuthentication > 0, 'AUTHENTICATION_REQUIRED', 'AUTHENTICATION_NOT_REQUIRED')
WHERE needAuthentication IS NOT NULL;
