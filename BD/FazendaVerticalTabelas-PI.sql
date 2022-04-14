create database ODLA;

use ODLA;

create table Prateleira
(
idPrateleira int primary key,
NmrColuna int,
hortalica varchar(30),
fkSensor int,
foreign key (fkSensor) references Sensor(idSensor)
);

create table potenciaMedia
(
idPotenciaMédia int primary key,
DataDeVerificação date default current_timestamp,
PotMedDiurna char(4),
PotMedNoturna char(4),
fkSensor int
);

create table VerificacaoHora
(
idVrificacaoHora int primary key,
DataHora datetime default current_timestamp,
Potencia char(4),
fkSensor int
);

create table Sensor
(
idSensor int primary key
);

create table FazendaVertical
(
idFazendaVertical int primary key,
nome varchar(80),
dataProjeto date,
Logradouro varchar(155)
);

create table ConsumoEnergia
(
idConsumoEnergia int primary key,
conDiario int,
conMensal int,
conAnual int,
fkFazendaVertical int
);

create table Cadastro
(
idCadastro int primary key,
Nome varchar(155),
CEP char(8),
Email varchar(155),
Senha varchar(155),
CNPJ char(14),
Telefone char(11)
);