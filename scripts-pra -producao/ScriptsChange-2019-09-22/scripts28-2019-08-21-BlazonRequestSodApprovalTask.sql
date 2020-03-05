-- 21/08/2019

-- BlazonRequestSodApprovalTask

create table BlazonRequestSodApprovalTask (
    justification varchar(1000),
    id bigint not null,
    request_id bigint,
    primary key (id)
) ENGINE=InnoDB;


alter table BlazonRequestSodApprovalTask 
    add constraint FK58jvihdng5v6oh44mt4k3sdl2 
    foreign key (request_id) 
    references BlazonRequest (id);

alter table BlazonRequestSodApprovalTask 
    add constraint FKaxsoqba6brt377y608jyceg6v 
    foreign key (id) 
    references Task (id);

