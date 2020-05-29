
-- ImportBatch

alter table ImportBatch add column finalizedAt datetime;


-- ImportEntry

alter table ImportEntry add column createdAt datetime;

alter table ImportEntry add column finalizedAt datetime;


-- SelfServiceCartInstanceItem

alter table SelfServiceCartInstanceItem add column needSelectAccount bit;

alter table SelfServiceCartInstanceItem add column needExpirationDate bit;

-- ImportBatch

alter table ImportBatch add column fileContentId bigint;

alter table ImportBatch add column lockNumber bigint;

