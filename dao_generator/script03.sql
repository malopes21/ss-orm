-- linguagem : C_SHARP

create table cargo (
	id integer not null ,
	nome varchar ( 50 ) not null ,
 	primary key ( id ) 
) ;

create table funcionario (
	id integer not null ,
	nome varchar ( 50 ) not null ,
	matricula varchar ( 50 ) ,
	salario decimal ,
	id_cargo integer not null ,
 	primary key ( id ) ,
 	foreign key ( id_cargo ) references cargo ( id )
) ;

create table cliente (
	id integer not null ,
	nome varchar ( 50 ) not null ,
	endereco varchar ( 50 ) ,
	telefone varchar ( 50 ) ,
 	primary key ( id ) 
) ;

create table produto (
	id integer not null ,
	descricao varchar ( 50 ) ,
	preco decimal not null ,
	primary key ( id )
) ;

create table pedido (
	id integer not null ,
	id_cliente integer not null ,
	id_funcionario integer not null ,
	total decimal ,
 	primary key ( id ) ,
 	foreign key ( id_cliente ) references cliente ( id ) ,
 	foreign key ( id_funcionario ) references funcionario ( id )
) ;

create table item (
	id integer not null ,
	id_pedido integer not null ,
	id_produto integer not null ,
	quantidade decimal not null ,
 	primary key ( id ) ,
 	foreign key ( id_pedido ) references pedido ( id ) ,
 	foreign key ( id_produto ) references produto ( id ) 
) ;
