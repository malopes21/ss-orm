create table Cliente (
    id int not null ,
    nome varchar ( 50 ) not null ,
    endereco varchar ( 50 ) ,
    primary key ( id ) 
) ;

create table Telefone (
    id int not null ,
    id_cliente int not null ,
    numero varchar ( 40 ) ,
    primary key ( id ) ,
    foreign key ( id_cliente ) references Cliente ( id )  -- 1:1
) ;

-- alter table Cliente add constraint Cliente_PK primary key ( id ) ;

-- alter table Telefone add constraint Telefone_PK primary key ( id ) ; 
-- alter table Telefone add constraint Telefone_Cliente_FK foreign key ( id_cliente ) references Cliente ( id ) ;
