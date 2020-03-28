
-- SecretQuestion

alter table SecretQuestion
add column beanshell boolean default false;

alter table SecretQuestion
modify column answer longtext;



