
-- MfaBlazonOtpQueueJob.java para : SecureChannelSendTokenJob

UPDATE JobInstance set 
name = 'Secure Channel Send Token Job',
description = 'Secure Channel Send Token Job.',
externalJobDetailId = 'Secure Channel Send Token Job'
where job_id in ( select id from Job where className like '%MfaBlazonOtpQueueJob');

update Job 
set className = 'com.blazon.authentication.securechannel.jobs.SecureChannelSendTokenJob',
description = 'Secure Channel Send Token Job.',
displayName = 'Secure Channel Send Token Job'
where className like '%MfaBlazonOtpQueueJob';


-- MfaBlazonOtpRemoveQueueJob.java: SecureChannelClearTokensQueueJob

UPDATE JobInstance set 
name = 'Secure Channel Clear Tokens Queue Job',
description = 'Secure Channel Clear Tokens Queue Job.',
externalJobDetailId = 'Secure Channel Clear Tokens Queue Job'
where job_id in ( select id from Job where className like '%MfaBlazonOtpRemoveQueueJob');

update Job 
set className = 'com.blazon.authentication.securechannel.jobs.SecureChannelSendTokenJob',
description = 'Secure Channel Clear Tokens Queue Job.',
displayName = 'Secure Channel Clear Tokens Queue Job'
where className like '%MfaBlazonOtpRemoveQueueJob';








