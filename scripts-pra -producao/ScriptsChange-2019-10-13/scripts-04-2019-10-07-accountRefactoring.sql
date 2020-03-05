
ALTER TABLE Account CHANGE username accountIdentifier varchar(255);

ALTER TABLE Account DROP COLUMN password;

