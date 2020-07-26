-- script27.txt
	
alter table BlazonRequestApprovalTask 
    add constraint FK2m9hvmf89j85ylrxvnhsreet0 
    foreign key (request_id) 
    references BlazonRequest (id)
	on delete cascade;

alter table BlazonRequestApprovalTask 
    add constraint FK8r1k74nte48ahv791bloft256 
    foreign key (id) 
    references Task (id)
	on delete cascade;
	
alter table CertificationApprovalTask 
    add constraint FK770roj42rrvuscky5ehyklo32 
    foreign key (certificationEntry_id) 
    references CertificationEntry (id)
	on delete cascade;

alter table CertificationApprovalTask 
    add constraint FKmtkb4bfvbweehvx3wy2ya3x18 
    foreign key (id) 
    references Task (id)
	on delete cascade;
	
alter table SodApprovalTask 
    add constraint FKfcdv3o1yc83395u2gg987h6bo 
    foreign key (sodEntry_id) 
    references SodEntry (id)
	on delete cascade;

alter table SodApprovalTask 
    add constraint FKjll30k6tdo4l03abflf3l4h98 
    foreign key (id) 
    references Task (id)
	on delete cascade;
	
alter table ProvisioningTask 
    add constraint FKl1c2esbqnv2e2ma2pabljb5af 
    foreign key (provisioningEntry_id) 
    references ProvisioningEntry (id)
	on delete cascade;

alter table ProvisioningTask 
    add constraint FKgbr1gxk2wo4ng224c1bc7x3ld 
    foreign key (id) 
    references Task (id)
	on delete cascade;
	
alter table RoleRightApprovalTask 
    add constraint FKf0c54xnh40oviagv3er1ipf6e 
    foreign key (roleRightEntry_id) 
    references RoleRightEntry (id)
	on delete cascade;

alter table RoleRightApprovalTask 
    add constraint FK7f9ue47oixmr1a9dpsqqegtxv 
    foreign key (id) 
    references Task (id)
	on delete cascade;
	
alter table BlazonRequestSodApprovalTask 
    add constraint FK58jvihdng5v6oh44mt4k3sdl2 
    foreign key (request_id) 
    references BlazonRequest (id);

alter table BlazonRequestSodApprovalTask 
    add constraint FKaxsoqba6brt377y608jyceg6v 
    foreign key (id) 
    references Task (id);


	