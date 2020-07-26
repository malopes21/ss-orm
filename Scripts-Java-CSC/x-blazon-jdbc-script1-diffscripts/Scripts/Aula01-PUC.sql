select 
	sod.SalesOrderID as orderId, 
	sod.SalesOrderDetailID as orderDetailId, 
	sod.OrderQty as orderQty,
	sod.UnitPrice as unitPrice,
	sod.LineTotal as lineTotal,
	soh.TaxAmt as taxAmt,
	soh.Freight as freight,
	soh.OrderDate as orderDate,
	soh.AccountNumber as accountNumber,
	soh.SubTotal as subTotal,
	con.ContactID as clientCod,
	con.FirstName as clientFirstName,
	con.LastName as clientLastName,
	concat(con.FirstName,' ',con.LastName) as clientName,
	con.EmailAddress as clientEmail,
	sat.Name as country,
	sat.CountryRegionCode as region,
	sat.Group as continent,
	if(isnull(emp.LoginID), 'Sistema', emp.LoginID) as employeeLogin,
	if(isnull(cem.FirstName), 'Sistema', concat(cem.FirstName,' ',cem.LastName)) as employeeName,
	if(isnull(pro.Name), '-', pro.Name) as productName,
	if(isnull(pro.ProductNumber), '00000', pro.ProductNumber) as productNumber,
	if(isnull(pro.Size), '-', pro.Size) as productSize,
	if(isnull(pro.ProductLine), '-', pro.ProductLine) as productLine,
	if(isnull(pro.Color), '-', pro.Color) as productColor
from salesorderdetail sod
inner join salesorderheader soh on soh.SalesOrderID = sod.SalesOrderID
inner join contact con on con.ContactID = soh.ContactID
inner join salesterritory sat on sat.TerritoryID = soh.TerritoryID
inner join employee emp on emp.EmployeeID = soh.SalesPersonID
inner join contact cem on cem.ContactID = emp.ContactID
inner join product pro on pro.ProductID = sod.ProductID;


create DATABASE DS;

create DATABASE DW;

drop table dwLog;

CREATE TABLE DW.dwLog (
	Id_Log int primary key AUTO_INCREMENT,
	Data datetime,
	Passo varchar(50),
	SucessoFalha char(1),
	mensagem varchar(255)
);

select * from DW.dwLog;

drop table DS.TbImp_Vendas;

create table DS.TbImp_Vendas ( 
	orderId bigint, 
	orderDetailId bigint, 
	orderQty smallint(6),
	unitPrice double,
	lineTotal double,
	taxAmt double,
	freight double,
	orderDate timestamp,
	accountNumber varchar(15),
	subTotal double,
	clientCod bigint,
	clientFirstName varchar(50),
	clientLastName varchar(50),
	clientName varchar(200),
	clientEmail varchar(50),
	country varchar(30),
	region varchar(30),
	continent varchar(30),
	employeeLogin varchar(30),
	employeeName varchar(200),
	productName varchar(100),
	productNumber varchar(25),
	productSize varchar(5),
	productLine varchar(2),
	productColor varchar(20)
);

LOAD DATA INFILE '/var/lib/mysql-files/mini-salesOrderTempData.csv'
INTO TABLE DS.TbImp_Vendas
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY 'n';



CREATE TABLE DS.D_Data(
	Data date Primary Key NOT NULL,
	Dia char(2) NOT NULL,
	Mes char(2) NOT NULL,
	Ano char(4) NOT NULL
);

truncate DS.TbImp_Vendas;

select orderDate, orderQty from DS.TbImp_Vendas;

insert into DS.TbImp_Vendas ( 
	orderId, 
	orderDetailId, 
	orderQty,
	unitPrice,
	lineTotal,
	taxAmt,
	freight,
	orderDate,
	accountNumber,
	subTotal,
	clientCod,
	clientFirstName,
	clientLastName,
	clientName,
	clientEmail,
	country,
	region,
	continent,
	employeeLogin,
	employeeName,
	productName,
	productNumber,
	productSize,
	productLine,
	productColor
) select 
	sod.SalesOrderID as orderId, 
	sod.SalesOrderDetailID as orderDetailId, 
	sod.OrderQty as orderQty,
	sod.UnitPrice as unitPrice,
	sod.LineTotal as lineTotal,
	soh.TaxAmt as taxAmt,
	soh.Freight as freight,
	soh.OrderDate as orderDate,
	soh.AccountNumber as accountNumber,
	soh.SubTotal as subTotal,
	con.ContactID as clientCod,
	con.FirstName as clientFirstName,
	con.LastName as clientLastName,
	concat(con.FirstName,' ',con.LastName) as clientName,
	con.EmailAddress as clientEmail,
	sat.Name as country,
	sat.CountryRegionCode as region,
	sat.Group as continent,
	if(isnull(emp.LoginID), 'Sistema', emp.LoginID) as employeeLogin,
	if(isnull(cem.FirstName), 'Sistema', concat(cem.FirstName,' ',cem.LastName)) as employeeName,
	if(isnull(pro.Name), '-', pro.Name) as productName,
	if(isnull(pro.ProductNumber), '00000', pro.ProductNumber) as productNumber,
	if(isnull(pro.Size), '-', pro.Size) as productSize,
	if(isnull(pro.ProductLine), '-', pro.ProductLine) as productLine,
	if(isnull(pro.Color), '-', pro.Color) as productColor
from salesorderdetail sod
inner join salesorderheader soh on soh.SalesOrderID = sod.SalesOrderID
inner join contact con on con.ContactID = soh.ContactID
inner join salesterritory sat on sat.TerritoryID = soh.TerritoryID
inner join employee emp on emp.EmployeeID = soh.SalesPersonID
inner join contact cem on cem.ContactID = emp.ContactID
inner join product pro on pro.ProductID = sod.ProductID;

-- Dimensão Data

desc DS.D_Data;

desc DW.D_Data;

truncate table DS.D_Data;

insert into DW.D_Data;
select DISTINCT
	orderDate as Data,
	Day(orderDate) as Dia,
	Month(orderDate)as Mes,
	Year(orderDate) as Ano
from DS.TbImp_Vendas;

insert into DW.D_Data
Select
ds.Data,
ds.Dia,
ds.Mes,
ds.Ano
from DS.D_Data as ds 
left join DW.D_Data as dw on ds.Data = dw.Data
where dw.Data is null;

select * from DW.D_Data;

select DISTINCT
	orderDate as DataCompleta,
	Day(orderDate) as Dia,
	Month(orderDate)as Mes,
	Year(orderDate) as Ano
from DS.TbImp_Vendas;

select * from DS.TbImp_Vendas tv

select * from DW.D_Data;



-- Dimensão Cliente

CREATE TABLE DS.D_Cliente(
	Cod_Cliente varchar(10) NOT NULL,
	Nome varchar(50) NOT NULL,
	Email varchar(50) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
);

drop table DW.D_Cliente;

CREATE TABLE DW.D_Cliente(
	Id_Cliente bigint primary key auto_increment,
	Cod_Cliente varchar(10) NOT NULL,
	Nome varchar(50) NOT NULL,
	Email varchar(50) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
);

desc DW.D_Cliente;

select * from DW.D_Cliente;


truncate DS.D_Cliente;

insert into DS.D_Cliente
Select Distinct
clientCod as Cod_Cliente,
clientName as Nome,
clientEmail as Email,
now() as LinData,
'Tabela Temp de Vendas' as LinOrig
from DS.TbImp_Vendas;

insert into DW.D_Cliente (
Cod_Cliente,
Nome,
Email,
LinData,
LinOrig )
Select
ds.Cod_Cliente,
ds.Nome,
ds.Email,
ds.LinData,
ds.LinOrig
from DS.D_Cliente as ds 
left join DW.D_Cliente as dw on ds.Cod_Cliente = dw.Cod_Cliente
where dw.Id_Cliente is null;

select * from DW.D_Cliente;


select * from view.produtos;


-- Dimensao Geografia

CREATE TABLE DS.D_GrupoGeografico
(
Nome varchar(50) NOT NULL,
LinData date NOT NULL,
LinOrig varchar(50) NOT NULL
);

CREATE TABLE DW.D_GrupoGeografico
(
Id_GrupoGeo bigint primary key auto_increment,
Nome varchar(50) NOT NULL,
LinData date NOT NULL,
LinOrig varchar(50) NOT NULL
);

-- 

CREATE TABLE DS.D_Pais
(
Id_GrupoGeo bigint primary key auto_increment,
Sigla char(2) NOT NULL,
LinData date NOT NULL,
LinOrig varchar(50) NOT NULL
);

CREATE TABLE dbo.D_RegiaoVendas
(
Id_Pais int NOT NULL,
Nome varchar(20) NOT NULL,
LinData date NOT NULL,
LinOrig varchar(50) NOT NULL
);

-- Apaga
truncate table DS.D_GrupoGeografico;
truncate table DS.D_Pais;
truncate table DS.D_RegiaoVendas;

-- Carregando grupo geográfico no DS

insert into DS.D_GrupoGeografico
Select Distinct
continent as Nome,
now() as LinData,
'Tabela Temp de Vendas' as LinOrig
from DS.TbImp_Vendas;

select * from DS.D_GrupoGeografico;

-- Carrega os dados no DW:

insert into DW.D_GrupoGeografico (Nome, LinData, LinOrig)
Select Distinct
ds.Nome,
ds.LinData,
ds.LinOrig
from DS.D_GrupoGeografico as ds 
left join DW.D_GrupoGeografico as dw on ds.Nome =dw.Nome
Where dw.Id_GrupoGeo is null;

select * from DW.D_GrupoGeografico;


-- país

drop table DS.D_Pais;

CREATE TABLE DS.D_Pais
(
	Id_GrupoGeo bigint NOT NULL,
	Sigla char(2) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
);

CREATE TABLE DW.D_Pais
(
	Id_Pais bigint primary key auto_increment,
	Id_GrupoGeo bigint NOT NULL,
	Sigla char(2) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
);


insert into DS.D_Pais
Select Distinct
dw.Id_GrupoGeo,
ds.region,
now() as LinData,
'Tabela Temp de Vendas' as LinOrig
from DS.TbImp_Vendas as ds 
inner join DW.D_GrupoGeografico as dw
on ds.continent = dw.Nome;

-- select * from DS.D_Pais;

-- Carrega os dados no DW:
insert into DW.D_Pais (Id_GrupoGeo, Sigla, LinData, LinOrig)
select
ds.Id_GrupoGeo,
ds.Sigla,
ds.LinData,
ds.LinOrig
from DS.D_Pais as ds 
left join DW.D_Pais as dw on ds.Id_GrupoGeo = dw.Id_GrupoGeo
and ds.Sigla = dw.Sigla
Where dw.Id_Pais is null;

select * from DW.D_Pais;


-- região

desc DS.D_RegiaoVendas;

CREATE TABLE DS.D_RegiaoVendas
(
	Id_Pais int NOT NULL,
	Nome varchar(20) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
);

CREATE TABLE DW.D_RegiaoVendas
(
	Id_RegiaoVendas bigint primary key auto_increment,
	Id_Pais int NOT NULL,
	Nome varchar(20) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
);

insert into DS.D_RegiaoVendas
select Distinct
dw.Id_Pais,
ds.country,
now() as LinData,
'Tabela Temp de Vendas' as LinOrig
from DS.TbImp_Vendas as ds 
inner join DW.D_Pais as dw on ds.region = dw.Sigla;

select * from DS.D_RegiaoVendas;

insert into DW.D_RegiaoVendas (Id_Pais, Nome, LinData, LinOrig)
Select
ds.Id_Pais,
ds.Nome,
ds.LinData,
ds.LinOrig
from DS.D_RegiaoVendas as ds 
left join DW.D_RegiaoVendas as dw on ds.Id_Pais = dw.Id_Pais
and ds.Nome = dw.Nome
where dw.Id_RegiaoVendas is null;

select * from DW.D_RegiaoVendas;

select
a.Nome as RegGeo,
b.Sigla as Pais,
c.Nome as RegVendas
from DW.D_GrupoGeografico as a 
inner join DW.D_Pais as b on a.Id_GrupoGeo = b.Id_GrupoGeo
inner join DW.D_RegiaoVendas as c on b.Id_Pais = c.Id_Pais;

-- Dimensão funcionário

drop table DS.D_Funcionario;

CREATE TABLE DS.D_Funcionario(
	Nome varchar(50) NOT NULL,
	Login varchar(50) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
);


CREATE TABLE DW.D_Funcionario(
	Id_Funcionario bigint primary key auto_increment,
	Nome varchar(50) NOT NULL,
	Login varchar(50) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
);

truncate table DS.D_Funcionario;

insert into DS.D_Funcionario
(Nome,Login,LinData,LinOrig)
Select Distinct
employeeName,
employeeLogin,
now() as LinData,
'Tabela Temp de Vendas' as LinOrig
from DS.TbImp_Vendas;

select * from DS.D_Funcionario;

insert into DW.D_Funcionario (Nome, Login, LinData, LinOrig)
Select
ds.Nome,
ds.Login,
ds.LinData,
ds.LinOrig
from DS.D_Funcionario as ds 
left join DW.D_Funcionario as dw on ds.Login = dw.Login
where dw.Id_Funcionario is null;

select * from DW.D_Funcionario;

-- Dimensão Produto

drop table DS.D_Produto;

CREATE TABLE DS.D_Produto(
	Cod_Produto varchar(20) NOT NULL,
	Nome varchar(50) NOT NULL,
	Tamanho varchar(5) NOT NULL,
	Cor varchar(20) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
);

CREATE TABLE DW.D_Produto(
	Cod_Produto varchar(20) NOT NULL,
	Nome varchar(50) NOT NULL,
	Tamanho varchar(5) NOT NULL,
	Cor varchar(20) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
);


insert into DS.D_Produto
Select Distinct
productNumber as Cod_Produto,
productName as Nome,
productSize as Tamanho,
productColor as Cor,
now() as LinData,
'Tabela Temp de Vendas' as LinOrig
from DS.TbImp_Vendas;


insert into DW.D_Produto
Select
ds.Cod_Produto,
ds.Nome,
ds.Tamanho,
ds.Cor,
ds.LinData,
ds.LinOrig
from DS.D_Produto as ds 
left join DW.D_Produto as dw on ds.Cod_Produto = dw.Cod_Produto
where dw.Cod_Produto is null;

select * from DW.D_Produto;

-- ajustes nas dimensões: 


Insert into DW.D_Cliente values (9999999, '9999999','Não Aplica', 'Não Aplica', now(), 'Registro padrão inserido manualmente');

Insert into DW.D_Data values ('1900/01/01', '01','01','1900');

Insert into DW.D_Funcionario values (9999999, 'Não Aplica','Não Aplica', now(), 'Registro padrão inserido manualmente');

Insert into DW.D_GrupoGeografico values (9999999, 'Não Aplica', now(), 'Registro padrão inserido manualmente');

Insert into DW.D_Pais values (9999999, (select Id_GrupoGeo from DW.D_GrupoGeografico where Nome = 'Não Aplica'), 'XX', now(), 'Registro padrão inserido manualmente');

Insert into DW.D_RegiaoVendas values (9999999, (select Id_Pais from DW.D_Pais where Sigla = 'XX'), 'Não Aplica', now(), 'Registro padrão inserido manualmente');

Insert into DW.D_Produto values ('9999999','Não Aplica','NA','NA', now(), 'Registro padrão inserido manualmente');


-- Fato Vendas:

drop table DS.F_Venda;

drop table DW.F_Venda;

CREATE TABLE DS.F_Venda(
	Data date NOT NULL,
	Nr_NF varchar(10) NOT NULL,
	Id_Cliente int NOT NULL,
	Id_Funcionario int NOT NULL,
	Id_RegiaoVendas int NOT NULL,
	Vlr_Imposto decimal(18, 2) NOT NULL,
	Vlr_Frete decimal(18, 2) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL,
	CONSTRAINT PK_F_Venda PRIMARY KEY 
	(Data, Nr_NF, Id_Cliente, Id_Funcionario, Id_RegiaoVendas)
);

CREATE TABLE DW.F_Venda(
	Data date NOT NULL,
	Nr_NF varchar(10) NOT NULL,
	Id_Cliente int NOT NULL,
	Id_Funcionario int NOT NULL,
	Id_RegiaoVendas int NOT NULL,
	Vlr_Imposto decimal(18, 2) NOT NULL,
	Vlr_Frete decimal(18, 2) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL,
	CONSTRAINT PK_F_Venda PRIMARY KEY 
	(Data, Nr_NF, Id_Cliente, Id_Funcionario, Id_RegiaoVendas)
);

TRUNCATE table DS.F_Venda;

insert into DS.F_Venda
Select
	Data,
	Nr_NF,
	Id_Cliente,
	Id_Funcionario,
	Id_RegiaoVendas,
	sum(Vlr_Imposto),
	sum(Vlr_Frete),
	now() as LinData,
	'Tabela Temp de Vendas' as LinOrig
from(
Select Distinct
	if(isnull(a.orderDate),'1900/01/01', a.orderDate) as Data,
	if(isnull (a.orderId), '000000', a.orderId) as Nr_NF,
	if(isnull(c.Id_Cliente), 9999999, c.Id_Cliente) as Id_Cliente,
	if(isnull(d.Id_Funcionario), 9999999, d.Id_Funcionario) as Id_Funcionario,
	if(isnull(e.Id_RegiaoVendas), 9999999, e.Id_RegiaoVendas) as Id_RegiaoVendas,
	cast(taxAmt as decimal(18,2)) as Vlr_Imposto,
	cast(freight as decimal(18,2)) as Vlr_Frete
	from DS.TbImp_Vendas as a 
	Left join DW.D_Data as b on a.orderDate = b.Data
	left join DW.D_Cliente as c on a.clientCod = c.Cod_Cliente
	left join DW.D_Funcionario as d on a.employeeLogin = d.Login
	left join DW.D_RegiaoVendas as e on a.country = e.Nome) as x
group by
	Data,
	Nr_NF,
	Id_Cliente,
	Id_Funcionario,
	Id_RegiaoVendas;

select * from DS.F_Venda;


Select Distinct
	if(isnull(a.orderDate),'1900/01/01', a.orderDate) as Data,
	if(isnull (a.orderId), '000000', a.orderId) as Nr_NF,
	if(isnull(c.Id_Cliente), 9999999, c.Id_Cliente) as Id_Cliente,
	if(isnull(d.Id_Funcionario), 9999999, d.Id_Funcionario) as Id_Funcionario,
	if(isnull(e.Id_RegiaoVendas), 9999999, e.Id_RegiaoVendas) as Id_RegiaoVendas,
	cast(taxAmt as decimal(18,2)) as Vlr_Imposto,
	cast(freight as decimal(18,2)) as Vlr_Frete
	from DS.TbImp_Vendas as a 
	Left join DW.D_Data as b on a.orderDate = b.Data
	left join DW.D_Cliente as c on a.clientCod = c.Cod_Cliente
	left join DW.D_Funcionario as d on a.employeeLogin = d.Login
	left join DW.D_RegiaoVendas as e on a.country = e.Nome;
	


insert into DW.F_Venda 
Select
	ds.Data,
	ds.Nr_NF,
	ds.Id_Cliente,
	ds.Id_Funcionario,
	ds.Id_RegiaoVendas,
	ds.Vlr_Imposto,
	ds.Vlr_Frete,
	ds.LinData,
	ds.LinOrig
from DS.F_Venda as ds 
left join DW.F_Venda as dw on ds.Data = dw .Data
and ds.Nr_NF = dw.Nr_NF
and ds.Id_Cliente = dw.Id_Cliente
and ds.Id_Funcionario = dw.Id_Funcionario
and ds.Id_RegiaoVendas = dw.Id_RegiaoVendas
where dw.Data is null;

select count(*) from DW.F_Venda;
	

-- Detalhe de Venda:

drop table DS.F_VendaDetalhe;

CREATE TABLE DS.F_VendaDetalhe(
	Data date NOT NULL,
	Nr_NF varchar(10) NOT NULL,
	Id_Cliente int NOT NULL,
	Id_Funcionario int NOT NULL,
	Id_RegiaoVendas int NOT NULL,
	Id_Produto varchar(20) NOT NULL,
	Vlr_Unitario decimal(18, 2) NOT NULL,
	Qtd_Vendida int NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL,
	CONSTRAINT PK_F_VendaDetalhe PRIMARY KEY CLUSTERED
	(Data,Nr_NF,Id_Cliente,Id_Funcionario,Id_RegiaoVendas,Id_Produto)
);

desc DS.TbImp_Vendas;

select * from DS.TbImp_Vendas tv;

desc DW.D_Produto;

desc DW.D_RegiaoVendas;

select * from DW.D_RegiaoVendas;

Select Distinct
	if(isnull(a.orderDate),'1900/01/01', a.orderDate) as Data,
	if(isnull (a.orderId), '000000', a.orderId) as Nr_NF,
	if(isnull(c.Id_Cliente), 9999999, c.Id_Cliente) as Id_Cliente,
	if(isnull(d.Id_Funcionario), 9999999, d.Id_Funcionario) as Id_Funcionario,
	if(isnull(e.Id_RegiaoVendas), 9999999, e.Id_RegiaoVendas) as Id_RegiaoVendas,
	if(isnull(f.Cod_Produto), 9999999, f.Cod_Produto) as Id_Produto,
	if(isnull(a.unitPrice), 0, a.unitPrice) as Vlr_Unitario,
	if(isnull(a.orderQty),1, a.orderQty) as Qtd_Vendida,
	now() as LinData,
	'Tabela Temp de Vendas' as LinOrig
from DS.TbImp_Vendas as a Left join DW.D_Data as b on a.orderDate = b.Data
left join DW.D_Cliente as c on a.clientCod = c.Cod_Cliente
left join DW.D_Funcionario as d on a.employeeLogin = d.Login
left join DW.D_RegiaoVendas as e on a.country = e.Nome
left join DW.D_Produto as f on a.productNumber = f.Cod_Produto;


CREATE TABLE DW.F_VendaDetalhe(
	Data date NOT NULL,
	Nr_NF varchar(10) NOT NULL,
	Id_Cliente int NOT NULL,
	Id_Funcionario int NOT NULL,
	Id_RegiaoVendas int NOT NULL,
	Id_Produto varchar(20) NOT NULL,
	Vlr_Unitario decimal(18, 2) NOT NULL,
	Qtd_Vendida int NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL,
	CONSTRAINT PK_F_VendaDetalhe PRIMARY KEY CLUSTERED
	(Data,Nr_NF,Id_Cliente,Id_Funcionario,Id_RegiaoVendas,Id_Produto)
);

-- carga DS.F_VendaDetalhe

insert into DS.F_VendaDetalhe
Select
	Data,
	Nr_NF,
	Id_Cliente,
	Id_Funcionario,
	Id_RegiaoVendas,
	Id_Produto,
	sum(Vlr_Unitario),
	sum(Qtd_Vendida),
	now() as LinData,
	'Tabela Temp de Vendas' as LinOrig
from(
	Select Distinct
		if(isnull(a.orderDate),'1900/01/01', a.orderDate) as Data,
		if(isnull (a.orderId), '000000', a.orderId) as Nr_NF,
		if(isnull(c.Id_Cliente), 9999999, c.Id_Cliente) as Id_Cliente,
		if(isnull(d.Id_Funcionario), 9999999, d.Id_Funcionario) as Id_Funcionario,
		if(isnull(e.Id_RegiaoVendas), 9999999, e.Id_RegiaoVendas) as Id_RegiaoVendas,
		if(isnull(f.Cod_Produto), '9999999', f.Cod_Produto) as Id_Produto,
		if(isnull(a.unitPrice), 0, a.unitPrice) as Vlr_Unitario,
		if(isnull(a.orderQty),1, a.orderQty) as Qtd_Vendida,
		now() as LinData,
		'Tabela Temp de Vendas' as LinOrig
	from DS.TbImp_Vendas as a Left join DW.D_Data as b on a.orderDate = b.Data
	left join DW.D_Cliente as c on a.clientCod = c.Cod_Cliente
	left join DW.D_Funcionario as d on a.employeeLogin = d.Login
	left join DW.D_RegiaoVendas as e on a.country = e.Nome
	left join DW.D_Produto as f on a.productNumber = f.Cod_Produto
) as x
Group by
	Data,
	Nr_NF,
	Id_Cliente,
	Id_Funcionario,
	Id_RegiaoVendas,
	Id_Produto;

desc DW.D_Produto;

desc DS.D_Produto;

select * from DS.D_Produto dp;

select count(*) from DS.F_VendaDetalhe;

-- carga DW.F_VendaDetalhe

insert into DW.F_VendaDetalhe
Select
	ds.Data,
	ds.Nr_NF,
	ds.Id_Cliente,
	ds.Id_Funcionario,
	ds.Id_RegiaoVendas,
	ds.Id_Produto,
	ds.Vlr_Unitario,
	ds.Qtd_Vendida,
	ds.LinData,
	ds.LinOrig
from DS.F_VendaDetalhe as ds 
left join DW.F_VendaDetalhe as dw on ds.Data = dw .Data
and ds.Nr_NF = dw.Nr_NF
and ds.Id_Cliente = dw.Id_Cliente
and ds.Id_Funcionario = dw.Id_Funcionario
and ds.Id_RegiaoVendas = dw.Id_RegiaoVendas
and ds.Id_Produto = dw.Id_Produto
where dw.Data is null;

select count(*)
from DW.F_VendaDetalhe as ds; 

desc DW.F_VendaDetalhe;

-- exercicios


select * from 
DS.TbImp_Vendas tv
where productNumber <> 'BK-M82B-42'


DELIMITER //
 
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT *  FROM product;
END //
 
DELIMITER ;


 
CREATE PROCEDURE GetAllLocations21()
BEGIN
    SELECT *  FROM product;
END

call GetAllLocations();

desc DW.F_Venda;

desc DS.F_VendaDetalhe;

desc DW.D_Cliente;

desc DW.D_Funcionario;

-- a)

select
count(*) totalVendas
from DW.F_Venda fv;

-- b)

select
	YEAR(fv.`Data`),
	count(*) totalVendas
from DW.F_Venda fv
group by YEAR(fv.`Data`);

-- c)

select
	YEAR(fv.`Data`),
	MONTH(fv.`Data`),
	count(*) totalVendas
from DW.F_Venda fv
group by 
	YEAR(fv.`Data`),
	MONTH(fv.`Data`)
order by YEAR(fv.`Data`) desc, MONTH(fv.`Data`) desc;


-- d)

select 
	COUNT(venda.Id_Funcionario) contagemVendas,
	fun.Nome,
	fun.Login
from DW.F_Venda venda
inner join DW.D_Funcionario fun on fun.Id_Funcionario = venda.Id_Funcionario
group BY
	venda.Id_Funcionario
order by contagemVendas desc
limit 10;

-- e)

select 
	cast(dat.ano as UNSIGNED),
	cast(dat.Mes as UNSIGNED),
	sum(venda.Vlr_Imposto) totalImpostos,
	sum(venda.Vlr_Frete)
from DW.F_Venda venda
inner join DW.D_Data dat on dat.Mes = month(venda.Data)
where dat.ano > 1901
group by 
	dat.ano,
	dat.Mes
order by cast(dat.ano as UNSIGNED) asc, cast(dat.Mes as UNSIGNED) asc;

-- f)

desc DW.F_Venda;

select * from DW.F_Venda fv;

select * from DW.F_VendaDetalhe;

desc DW.F_VendaDetalhe;

desc DW.F_Venda;

	
select 
	count(v.Nr_NF),
	sum(fv.Vlr_Unitario * fv.Qtd_Vendida),
	YEAR(v.`Data`),
	MONTH(v.`Data`)
from DW.F_VendaDetalhe fv
	inner join DW.F_Venda v on v.Nr_NF = fv.Nr_NF
where 
	YEAR(v.`Data`) = 2003
group BY
	YEAR(v.`Data`),
	MONTH(v.`Data`);

select 
	count(*)
from DW.F_VendaDetalhe fv
	inner join DW.F_Venda v on v.Nr_NF = fv.Nr_NF
group BY
	v.Nr_NF;


select 
	count(*)
from DW.F_Venda fv
	inner join DW.F_VendaDetalhe v on v.Nr_NF = fv.Nr_NF
group BY
	v.Nr_NF;


select * from DW.D_RegiaoVendas regiao;

select * from DW.D_Pais pais;

select * from DW.D_GrupoGeografico continente;

desc DW.F_Venda;


-- SPs

CREATE PROCEDURE PopulaDimensaoData()
BEGIN
    truncate table DS.D_Data;

	insert into DS.D_Data
	select DISTINCT
		orderDate as Data,
		Day(orderDate) as Dia,
		Month(orderDate)as Mes,
		Year(orderDate) as Ano
	from DS.TbImp_Vendas;
	
	insert into DW.D_Data
	Select
	ds.Data,
	ds.Dia,
	ds.Mes,
	ds.Ano
	from DS.D_Data as ds 
	left join DW.D_Data as dw on ds.Data = dw.Data
	where dw.Data is null;
END

call PopulaDimensaoData();



