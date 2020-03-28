
-- remove RUN_ONLY_ONCE in CampaignDefinition

alter table CampaignDefinition 
drop column type;

-- delete job CertificationRunsOnceOnlyCampaignStartJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%CertificationRunsOnceOnlyCampaignStartJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%CertificationRunsOnceOnlyCampaignStartJob'
);

delete from Job	
where className like '%CertificationRunsOnceOnlyCampaignStartJob';


-- delete job CertificationCampaignStartJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%CertificationCampaignStartJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%CertificationCampaignStartJob'
);

delete from Job	
where className like '%CertificationCampaignStartJob';


-- rename JobInstance e Job (Recurrent)

update JobInstance set name = 'Certification Campaign Start Job', externalJobDetailId = 'Certification Campaign Start Job' where name like 'Certification Recurrent Campaign Start Job';

update Job set className = 'com.blazon.governance.certification.campaign.jobs.CertificationCampaignStartJob', 
description = 'Certification Recurrent Campaign Start Job.', displayName = 'Certification Recurrent Campaign Start Job' where className like '%CertificationRecurrentCampaignStartJob';









