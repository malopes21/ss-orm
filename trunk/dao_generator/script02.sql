create table Pessoa (
	id integer not null ,
	nome varchar ( 50 ) ,
	telefone varchar ( 50 ) ,
	primary key ( id )
) ;


create table departamento (
	num_dept integer not null ,
	nome_dept varchar ( 50 ) ,
	primary key ( num_dept )
) ;

create table empregado (
	cod_emp integer not null ,
	nome_emp varchar ( 50 ) ,
	end_emp varchar ( 50 ) ,
	sexo_emp varchar ( 50 ) ,
	data_nasc varchar ( 50 ) ,
	cod_gerente integer , 
	num_dept integer not null ,
	primary key ( cod_emp ) ,
	foreign key ( cod_gerente ) references empregado ( cod_emp ) ,
	foreign key ( num_dept ) references departamento ( num_dept )
) ;


create table gerencia (
	cod_emp integer not null ,
	num_dept integer not null ,
	data_emp date ,
	primary key ( cod_emp , num_dept ) ,
	foreign key ( cod_emp ) references empregado ( cod_emp ) ,
	foreign key ( num_dept ) references departamento ( num_dept )
) ;

create table dependente (
	cod_emp integer not null ,
	cod_depend integer not null ,
	nome_depend varchar ( 50 ) ,
	sexo_depend varchar ( 1 ) ,
	tipo_depend varchar ( 50 ) ,
	data_nasc date ,
	primary key ( cod_emp , cod_depend ) ,
	foreign key ( cod_emp ) references empregado ( cod_emp )
) ;

create table local (
	cod_local integer not null ,
	desc_local varchar ( 50 ) ,
	primary key ( cod_local )
) ;

create table projeto (
	num_proj integer not null ,
	cod_local integer not null ,
	num_dept integer ,
	desc_proj varchar ( 50 ) ,
	primary key ( num_proj ) , 
	foreign key ( cod_local ) references local ( cod_local ) ,
	foreign key ( num_dept ) references departamento ( num_dept )
) ;

create table local_dept (
	num_dept integer not null ,
	cod_local integer not null ,
	primary key ( num_dept , cod_local ) ,
	foreign key ( num_dept ) references departamento ( num_dept ) ,
	foreign key ( cod_local ) references local ( cod_local )
) ;

create table proj_emp (
	num_proj integer not null ,
	cod_emp integer not null ,
	quant_horas integer ,
	primary key ( num_proj , cod_emp ) ,
	foreign key ( num_proj ) references projeto ( num_proj ) ,
	foreign key ( cod_emp ) references empregado ( cod_emp )
) ;
