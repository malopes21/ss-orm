
-- SharedAccountMember

create table SharedAccountMembership (
    id bigint not null auto_increment,
    account_id bigint,
    user_id bigint,
    primary key (id)
) ENGINE=InnoDB;




