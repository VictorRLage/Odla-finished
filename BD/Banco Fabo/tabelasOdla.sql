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
fkCliente int,
foreign key (fkCliente) references Cliente(idCliente));

create table Usuario(
idUsuario int primary key auto_increment,
email varchar(155) unique,
senha varchar(155),
fkFazendaVertical int,
foreign key (fkFazendaVertical) references fazendaVertical (idFazendaVertical)
)auto_increment = 101;

create table Sensor(
idSensor int primary key,
nmrColuna int,
fkFazendaVertical int,
foreign key (fkFazendaVertical) references fazendaVertical (idFazendaVertical));

create table VerificacaoHora(
idVerificacaoHora int primary key,
dataHora datetime,
lux int,
fkSensor int,
foreign key (fkSensor) references Sensor (idSensor));