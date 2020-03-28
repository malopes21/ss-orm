
-- 02-09-2019

drop table ANALYTICS_CERTIFICATION_HISTOGRAM;

create table ANALYTICS_CERTIFICATION_HISTOGRAM (
    dateCollect datetime not null,
    amountCertified bigint,
    amountError bigint,
    amountFinished bigint,
    amountRevoked bigint,
    amountWaitingApproval bigint,
    approvalPercentage double precision,
    averageCompletionTime bigint,
    revokePercentage double precision,
    primary key (dateCollect)
) ENGINE=InnoDB;
