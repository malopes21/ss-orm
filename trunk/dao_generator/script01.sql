create table Cliente (
    id int not null ,
    nome varchar ( 50 ) not null ,
    endereco varchar ( 50 ) ,
    primary key ( id , nome ) ,
    foreign key ( id_teste , bla ) references Teste ( id , rf )
) ;

create table Telefone (
    id int not null ,
    id_cliente int not null ,
    numero varchar ( 40 ) ,
    primary key ( id )
) ;

alter table Cliente add constraint Cliente_PK primary key ( id ) ;

alter table Telefone add constraint Telefone_PK primary key ( id ) ; 
alter table Telefone add constraint Telefone_Cliente_FK foreign key ( id_cliente ) references Cliente ( id ) ;
