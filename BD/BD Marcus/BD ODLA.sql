CREATE DATABASE VerificaçaoHora;

USE VerificaçaoHora;

Create table VerificaçãoHora
(
idVerificaçãoHora int primary key,
DataHora datetime,
LUX int,
fkSensor int,
foreign key (fkSensor) references Sensor(idSensor)
);

Create table Sensor
(
idSensor int Primary key,
nmrColuna int,
fkFazendaVertical int,
foreign key (fkFazendaVertical) references fazendaVertical(idfazendaVertical)
);

Create table fazendaVertical
(
idfazendaVertical int primary key,
nome varchar(80),
area int,
altura int,
fkCliente int,
foreign key (fkCliente) references Cliente(idCliente)
);

create table Cliente
(
idCliente int primary key,
nome varchar(155),
CEP char(8),
email varchar(155),
senha varchar(155),
CNPJ char(14),
telefone char(15)
);

create table Usuario
(
idUsuario int,
email varchar(155),
fkFazendaVertical int,
foreign key (fkFazendaVertical) references fazendaVertical(idfazendaVertical),
Usuario_idUsuario int,
primary key(idUsuario, Usuario_idUsuario)
);

