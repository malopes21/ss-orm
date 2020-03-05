## ENTITIES

# CampaignDefinition
ALTER TABLE CampaignDefinition
  ADD isAutoRevoke BOOLEAN DEFAULT FALSE NOT NULL;

# CertificationSelector
ALTER TABLE CertificationSelector
  ADD isAutoRevoke BOOLEAN DEFAULT FALSE NOT NULL;

## JOBS

# Certification Campaign revoke.
ALTER TABLE CampaignExecutionInstance
  ADD isAutoRevoke BOOLEAN DEFAULT FALSE NOT NULL;

INSERT
INTO Job (className, description, displayName, parameters)
VALUES ('com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.campaign.jobs.RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob',
        'Revoke entries from campaign that Deadline has reached.',
        'Revoke Entries From Campaign With Deadline Reached Job',
        NULL);

INSERT
INTO JobInstance (name, description, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId)
SELECT
  'Revoke Entries From Campaigns Certifications With Deadline Reached Job'  AS name,
  'Revoke entries from campaigns certifications that Deadline has reached.' AS description,
  '[{\"name\":\"provisioningEntriesQueueLength\", \"value\":\"10\"}]'       AS params,
  job.id                                                                    AS job_id,
  FALSE                                                                     AS activated,
  '0 0/1 * * * ?'                                                           AS cronExpression,
  'Blazon Jobs'                                                             AS externalGroupId,
  'Revoke Entries From Campaigns Certifications With Deadline Reached Job'  AS externalJobDetailId
FROM Job job
WHERE job.className =
      'com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.campaign.jobs.RevokeEntriesFromCampaignsCertificationsWithDeadlineReachedJob';

# Micro certification revoke.
ALTER TABLE MicroCertificationExecutionInstance
  ADD isAutoRevoke BOOLEAN DEFAULT FALSE NOT NULL;

INSERT
INTO Job (className, description, displayName, parameters)
VALUES ('com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.micro.jobs.RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob',
        'Revoke entries from micro certifications that Deadline has reached.',
        'Revoke Entries From Micro Certifications With Deadline Reached Job',
        NULL);

INSERT
INTO JobInstance (name, description, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId)
SELECT
  'Revoke Entries From Micro Certifications With Deadline Reached Job'  AS name,
  'Revoke entries from micro certifications that Deadline has reached.' AS description,
  '[{\"name\":\"provisioningEntriesQueueLength\", \"value\":\"10\"}]'  AS params,
  job.id                                                               AS job_id,
  FALSE                                                                AS activated,
  '0 0/1 * * * ?'                                                      AS cronExpression,
  'Blazon Jobs'                                                        AS externalGroupId,
  'Revoke Entries From Micro Certifications With Deadline Reached Job' AS externalJobDetailId
FROM Job job
WHERE job.className =
      'com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.micro.jobs.RevokeEntriesFromMicroCertificationsWithDeadlineReachedJob';

# Selector certification revoke.
ALTER TABLE SelectorExecutionInstance
  ADD isAutoRevoke BOOLEAN DEFAULT FALSE NOT NULL;

INSERT
INTO Job (className, description, displayName, parameters)
VALUES ('com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.selector.jobs.RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob',
        'Revoke entries from selectors certifications that Deadline has reached.',
        'Revoke Entries From Selectors Certifications With Deadline Reached Job',
        NULL);

INSERT
INTO JobInstance (name, description, params, job_id, activated, cronExpression, externalGroupId, externalJobDetailId)
SELECT
  'Revoke Entries From Selectors Certification With Deadline Reached Job'  AS name,
  'Revoke entries from selectors certification that Deadline has reached.' AS description,
  '[{\"name\":\"provisioningEntriesQueueLength\", \"value\":\"10\"}]'      AS params,
  job.id                                                                   AS job_id,
  FALSE                                                                    AS activated,
  '0 0/1 * * * ?'                                                          AS cronExpression,
  'Blazon Jobs'                                                            AS externalGroupId,
  'Revoke Entries From Selectors Certifications With Deadline Reached Job' AS externalJobDetailId
FROM Job job
WHERE job.className =
      'com.blazon.identitymanagement.policies.certificationpolicy.executioninstance.selector.jobs.RevokeEntriesFromSelectorsCertificationsWithDeadlineReachedJob';
