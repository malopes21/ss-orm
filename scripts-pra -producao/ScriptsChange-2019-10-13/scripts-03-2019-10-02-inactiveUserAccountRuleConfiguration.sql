
-- InactiveUserAccountRuleConfiguration

create table InactiveUserAccountRuleConfiguration (
    id bigint not null auto_increment,
    enabled boolean default false,
    resourceId bigint,
    token varchar(255),
    url varchar(255),
    primary key (id)
) ENGINE=InnoDB;
