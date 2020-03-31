
-- TaskEscalationDefinition

create table TaskEscalationDefinition (
    id bigint not null auto_increment,
    token varchar(255),
    url varchar(255),
    primary key (id)
) ENGINE=InnoDB;

-- TaskDefinition

alter table TaskDefinition add column escalationDefinition_id bigint;


-- com.blazon.humantasks.escalation.policy.jobs.TaskEscalationPeriodicJob

update Job set className = 'com.blazon.humantasks.escalations.policy.jobs.TaskEscalationPeriodicJob' where className like '%TaskEscalationPeriodicJob';


-- com.blazon.humantasks.escalation.policy.jobs.TaskEscalationTimeBasedJob

update Job set className = 'com.blazon.humantasks.escalations.policy.jobs.TaskEscalationTimeBasedJob' where className like '%TaskEscalationTimeBasedJob';


-- com.blazon.humantasks.queues.jobs.TaskSlaQueueJob

update Job set className = 'com.blazon.humantasks.queues.jobs.TaskSlaQueueJob' where className like '%TaskSlaQueueJob';


-- com.blazon.humantasks.queues.jobs.TaskWillExpireSlaQueueJob

update Job set className = 'com.blazon.humantasks.queues.jobs.TaskWillExpireSlaQueueJob' where className like '%TaskWillExpireSlaQueueJob';


-- com.blazon.humantasks.escalation.auto.jobs.FindTasksReadyToCancelationJob

update Job set className = 'com.blazon.humantasks.escalations.auto.jobs.FindTasksReadyToCancelationJob' where className like '%FindTasksReadyToCancelationJob';


-- com.blazon.humantasks.escalation.auto.jobs.FindTasksToWaitingEscalationJob

update Job set className = 'com.blazon.humantasks.escalations.auto.jobs.FindTasksToWaitingEscalationJob' where className like '%FindTasksToWaitingEscalationJob';


-- com.blazon.humantasks.escalation.auto.jobs.ResolveTasksInWaitingEscalationJob

update Job set className = 'com.blazon.humantasks.escalations.auto.jobs.ResolveTasksInWaitingEscalationJob' where className like '%ResolveTasksInWaitingEscalationJob';

