
-- TaskData

create table TaskData (
    id bigint not null,
    value varchar(255),
    name varchar(255) not null,
    primary key (id, name)
) ENGINE=InnoDB;
