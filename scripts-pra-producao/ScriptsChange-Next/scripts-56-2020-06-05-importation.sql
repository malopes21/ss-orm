
-- ImportBatch

alter table ImportBatch add column fileName varchar(255);

alter table ImportBatch add column fileHash varchar(255);


-- ImportEntry

alter table ImportEntry add column lineNumber bigint;


-- CampaignDefinition

alter table CampaignDefinition add column fileName varchar(255);

alter table CampaignDefinition add column fileHash varchar(255);


-- BlazonFileContent

alter table BlazonFileContent add column hash varchar(255);


