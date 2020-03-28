
-- RevokeExpiredTemporaryAccountsJob

update Job 
set className = 'com.blazon.identitymanagement.identitybusinessrules.account.temporaryaccounts.jobs.RevokeExpiredTemporaryAccountsJob',
description = 'Revoke Expired Temporary Accounts Job.',
displayName = 'Revoke Expired Temporary Accounts Job'
where className like '%RevokeExpiredTemporaryAccountsJob';

update JobInstance set 
name = 'Revoke Expired Temporary Accounts Job',
description = 'Revoke Expired Temporary Accounts Job.'
where job_id = (
	select id from Job where className like '%RevokeExpiredTemporaryAccountsJob');



