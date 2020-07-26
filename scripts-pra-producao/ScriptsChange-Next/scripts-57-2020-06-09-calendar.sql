
create table Calendar (
    id bigint not null auto_increment,
    description varchar(255),
    name varchar(255),
    saturdayIsWorkingDay boolean default true,
    sundayIsWorkingDay boolean default true,
    primary key (id)
) ENGINE=InnoDB;

create table Holiday (
    id bigint not null auto_increment,
    date date,
    description varchar(255),
    calendar_id bigint,
    primary key (id)
) ENGINE=InnoDB;

alter table Holiday 
    add constraint FK7kdv5n17b934jeh9bksktf1ph 
    foreign key (calendar_id) 
    references Calendar (id);


-- TaskEscalationDefinition

alter table TaskEscalationDefinition add column howManyDaysToEscalation integer;


-- TaskDefinition

alter table TaskDefinition add column calendar_id bigint;

alter table TaskDefinition add column cancelIfSlaReached boolean default false;


-- com.blazon.humantasks.tasks.jobs.FindTasksReadyToCancelationJob

UPDATE JobInstance set 
name = 'Find Tasks Ready To Cancelation Job',
description = 'Find Tasks Ready To Cancelation Job.',
externalJobDetailId = 'Find Tasks Ready To Cancelation Job'
where job_id in ( select id from Job where className like '%FindTasksReadyToCancelationJob');

update Job 
set className = 'com.blazon.humantasks.tasks.jobs.FindTasksReadyToCancelationJob',
description = 'Find Tasks Ready To Cancelation Job.',
displayName = 'Find Tasks Ready To Cancelation Job'
where className like '%FindTasksReadyToCancelationJob';


-- delete Job TaskEscalationPeriodicJob

delete from JobExecution 	
where instance_id IN
(
	select instance.id 
	from JobInstance instance 
	join Job job on job.id = instance.job_id
	where job.className like '%TaskEscalationPeriodicJob'
);

delete from JobInstance 
where job_id IN 
(
	select id from Job 
	where className like '%TaskEscalationPeriodicJob'
);

delete from Job	
where className like '%TaskEscalationPeriodicJob';


-- Task

alter table Task add column lockDate datetime;

alter table Task add column lockNumber bigint;

alter table Task add column lastAutoEscalationCheckDate datetime;

alter table Task add column lastPolicyEscalationCheckDate datetime;


-- TaskEscalation

alter table TaskEscalation add column queueTo_id bigint;

-- CertificationEntry

alter table CertificationEntry add column revokeIfDeadlineReached boolean default false;


-- Task

alter table Task add column cancelIfSlaReached boolean default false;





