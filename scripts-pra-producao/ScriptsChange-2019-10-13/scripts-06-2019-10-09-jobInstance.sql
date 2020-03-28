
-- JobInstance

alter table JobInstance add column lastErrorExecution bigint default '0';

alter table JobInstance add column lastSuccessExecution bigint default '0';

