
-- CertificationEntry (eliminando os objetos de dependencia dos subtipos de certification no modelo OO

drop table MicroCertificationExecutionInstance_CertificationEntry;

drop table CampaignExecutionInstance_CertificationEntry;

drop table SelectorExecutionInstance_CertificationEntry;

drop table CertificationPolicy_CertificationEntry;

-- jobs de microcertification

-- MicroCertificationExecutionInstanceFinalizeJob

UPDATE JobInstance set 
name = 'Micro Certification Execution Instance Finalize Job',
description = 'Micro Certification Execution Instance Finalize Job.',
externalJobDetailId = 'Micro Certification Execution Instance Finalize Job'
where job_id in ( select id from Job where className like '%MicroCertificationExecutionInstanceFinalizeJob');

update Job 
set className = 'com.blazon.certification.types.micro.jobs.MicroCertificationExecutionInstanceFinalizeJob',
description = 'Micro Certification Execution Instance Finalize Job.',
displayName = 'Micro Certification Execution Instance Finalize Job'
where className like '%MicroCertificationExecutionInstanceFinalizeJob';


-- MicroCertificationExecutionInstanceStartJob

UPDATE JobInstance set 
name = 'Micro Certification Execution Instance Start Job',
description = 'Micro Certification Execution Instance Start Job.',
externalJobDetailId = 'Micro Certification Execution Instance Start Job'
where job_id in ( select id from Job where className like '%MicroCertificationExecutionInstanceStartJob');

update Job 
set className = 'com.blazon.certification.types.micro.jobs.MicroCertificationExecutionInstanceStartJob',
description = 'Micro Certification Execution Instance Start Job.',
displayName = 'Micro Certification Execution Instance Start Job'
where className like '%MicroCertificationExecutionInstanceStartJob';


-- MicroCertificationFinalizeWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Micro Certification Finalize With Deadline Reached Job',
description = 'Micro Certification Finalize With Deadline Reached Job.',
externalJobDetailId = 'Micro Certification Finalize With Deadline Reached Job'
where job_id in ( select id from Job where className like '%MicroCertificationFinalizeWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.micro.jobs.MicroCertificationFinalizeWithDeadlineReachedJob',
description = 'Micro Certification Finalize With Deadline Reached Job.',
displayName = 'Micro Certification Finalize With Deadline Reached Job'
where className like '%MicroCertificationFinalizeWithDeadlineReachedJob';


-- MicroCertificationSearchWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Micro Certification Search With Deadline Reached Job',
description = 'Micro Certification Search With Deadline Reached Job.',
externalJobDetailId = 'Micro Certification Search With Deadline Reached Job'
where job_id in ( select id from Job where className like '%MicroCertificationSearchWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.micro.jobs.MicroCertificationSearchWithDeadlineReachedJob',
description = 'Micro Certification Search With Deadline Reached Job.',
displayName = 'Micro Certification Search With Deadline Reached Job'
where className like '%MicroCertificationSearchWithDeadlineReachedJob';


-- jobs de certification campaign

-- CertificationCampaignExecutionInstanceJob

UPDATE JobInstance set 
name = 'Certification Campaign Execution Instance Job',
description = 'Certification Campaign Execution Instance Job.',
externalJobDetailId = 'Certification Campaign Execution Instance Job'
where job_id in ( select id from Job where className like '%CertificationCampaignExecutionInstanceJob');

update Job 
set className = 'com.blazon.certification.types.campaigns.jobs.CertificationCampaignExecutionInstanceJob',
description = 'Certification Campaign Execution Instance Job.',
displayName = 'Certification Campaign Execution Instance Job'
where className like '%CertificationCampaignExecutionInstanceJob';


-- CertificationCampaignFinalizeJob

UPDATE JobInstance set 
name = 'Certification Campaign Finalize Job',
description = 'Certification Campaign Finalize Job.',
externalJobDetailId = 'Certification Campaign Finalize Job'
where job_id in ( select id from Job where className like '%CertificationCampaignFinalizeJob');

update Job 
set className = 'com.blazon.certification.types.campaigns.jobs.CertificationCampaignFinalizeJob',
description = 'Certification Campaign Finalize Job.',
displayName = 'Certification Campaign Finalize Job'
where className like '%CertificationCampaignFinalizeJob';


-- CertificationCampaignFinalizeWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Certification Campaign Finalize With Deadline Reached Job',
description = 'Certification Campaign Finalize With Deadline Reached Job.',
externalJobDetailId = 'Certification Campaign Finalize With Deadline Reached Job'
where job_id in ( select id from Job where className like '%CertificationCampaignFinalizeWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.campaigns.jobs.CertificationCampaignFinalizeWithDeadlineReachedJob',
description = 'Certification Campaign Finalize With Deadline Reached Job.',
displayName = 'Certification Campaign Finalize With Deadline Reached Job'
where className like '%CertificationCampaignFinalizeWithDeadlineReachedJob';


-- CertificationCampaignSearchWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Certification Campaign Search With Deadline Reached Job',
description = 'Certification Campaign Search With Deadline Reached Job.',
externalJobDetailId = 'Certification Campaign Search With Deadline Reached Job'
where job_id in ( select id from Job where className like '%CertificationCampaignSearchWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.campaigns.jobs.CertificationCampaignSearchWithDeadlineReachedJob',
description = 'Certification Campaign Search With Deadline Reached Job.',
displayName = 'Certification Campaign Search With Deadline Reached Job'
where className like '%CertificationCampaignSearchWithDeadlineReachedJob';


-- CertificationCampaignStartJob

UPDATE JobInstance set 
name = 'Certification Campaign Start Job',
description = 'Certification Campaign Start Job.',
externalJobDetailId = 'Certification Campaign Start Job'
where job_id in ( select id from Job where className like '%CertificationCampaignStartJob');

update Job 
set className = 'com.blazon.certification.types.campaigns.jobs.CertificationCampaignStartJob',
description = 'Certification Campaign Start Job.',
displayName = 'Certification Campaign Start Job'
where className like '%CertificationCampaignStartJob';


-- jobs de certification policy periodicity

-- CertificationPolicyPeriodicityExecutorJob

UPDATE JobInstance set 
name = 'Certification Policy Periodicity Executor Job',
description = 'Certification Policy Periodicity Executor Job.',
externalJobDetailId = 'Certification Policy Periodicity Executor Job'
where job_id in ( select id from Job where className like '%CertificationPolicyPeriodicityExecutorJob');

update Job 
set className = 'com.blazon.certification.types.policies.periodicitybased.jobs.CertificationPolicyPeriodicityExecutorJob',
description = 'Certification Policy Periodicity Executor Job.',
displayName = 'Certification Policy Periodicity Executor Job'
where className like '%CertificationPolicyPeriodicityExecutorJob';


-- CertificationPolicyPeriodicityExecutorJob

UPDATE JobInstance set 
name = 'Certification Policy Periodicity Finalize With Deadline Reached Job',
description = 'Certification Policy Periodicity Finalize With Deadline Reached Job.',
externalJobDetailId = 'Certification Policy Periodicity Finalize With Deadline Reached Job'
where job_id in ( select id from Job where className like '%CertificationPolicyPeriodicityFinalizeWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.policies.periodicitybased.jobs.CertificationPolicyPeriodicityFinalizeWithDeadlineReachedJob',
description = 'Certification Policy Periodicity Finalize With Deadline Reached Job.',
displayName = 'Certification Policy Periodicity Finalize With Deadline Reached Job'
where className like '%CertificationPolicyPeriodicityFinalizeWithDeadlineReachedJob';


-- jobs de certification policy user change based

-- CertificationPolicyUserChangeExecutionInstanceFinalizeJob

UPDATE JobInstance set 
name = 'Certification Policy User Change Execution Instance Finalize Job',
description = 'Certification Policy User Change Execution Instance Finalize Job.',
externalJobDetailId = 'Certification Policy User Change Execution Instance Finalize Job'
where job_id in ( select id from Job where className like '%CertificationPolicyUserChangeExecutionInstanceFinalizeJob');

update Job 
set className = 'com.blazon.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeExecutionInstanceFinalizeJob',
description = 'Certification Policy User Change Execution Instance Finalize Job.',
displayName = 'Certification Policy User Change Execution Instance Finalize Job'
where className like '%CertificationPolicyUserChangeExecutionInstanceFinalizeJob';


-- CertificationPolicyUserChangeFinalizeWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Certification Policy User Change Finalize With Deadline Reached Job',
description = 'Certification Policy User Change Finalize With Deadline Reached Job.',
externalJobDetailId = 'Certification Policy User Change Finalize With Deadline Reached Job'
where job_id in ( select id from Job where className like '%CertificationPolicyUserChangeFinalizeWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeFinalizeWithDeadlineReachedJob',
description = 'Certification Policy User Change Finalize With Deadline Reached Job.',
displayName = 'Certification Policy User Change Finalize With Deadline Reached Job'
where className like '%CertificationPolicyUserChangeFinalizeWithDeadlineReachedJob';


-- CertificationPolicyUserChangeSearchWithDeadlineReachedJob

UPDATE JobInstance set 
name = 'Certification Policy User Change Search With Deadline Reached Job',
description = 'Certification Policy User Change Search With Deadline Reached Job.',
externalJobDetailId = 'Certification Policy User Change Search With Deadline Reached Job'
where job_id in ( select id from Job where className like '%CertificationPolicyUserChangeSearchWithDeadlineReachedJob');

update Job 
set className = 'com.blazon.certification.types.policies.userattributeschangebased.instance.jobs.CertificationPolicyUserChangeSearchWithDeadlineReachedJob',
description = 'Certification Policy User Change Search With Deadline Reached Job.',
displayName = 'Certification Policy User Change Search With Deadline Reached Job'
where className like '%CertificationPolicyUserChangeSearchWithDeadlineReachedJob';





