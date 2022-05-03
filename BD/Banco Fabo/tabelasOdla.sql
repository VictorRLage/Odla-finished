create database odla;
use odla;

create table Cliente(
idCliente int primary key,
nome varchar(155),
email varchar(155) unique,
senha varchar(155),
CNPJ char(14) unique,
telefone char(15));

create table fazendaVertical(
idFazendaVertical int primary key,
nome varchar(80),
area int,
altura int,
fkCliente int);

create table Usuario(
idUsuario int,
fkUsuarioFazenda int,
primary key (idUsuario, fkUsuarioFazenda),
email varchar(155) unique,
senha varchar(155));

create table Sensor(
idSensor int primary key,
nmrColuna int,
fkFazendaVertical int);

create table VerificacaoHora(
idVerificacaoHora int,
dataHora datetime,
lux int,
fkSensor int);