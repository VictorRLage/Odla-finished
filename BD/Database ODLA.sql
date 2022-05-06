CREATE DATABASE ODLA;

USE ODLA;

create table Cliente
(
idCliente int primary key,
nome varchar(155),
email varchar(155),
senha varchar(155),
CNPJ char(15),
telefone char(15)
);

insert into Cliente values
(1001, 'Vinicius', 'Vinicius001@gmail.com', 'meunome0123', '12345678/901234', '(11) 97373-8987'),
(1002, 'tonini', 'tonini002@gmail.com', 'meunome3210', '10293483/710428', '(11) 96372-8786'),
(1003, 'fabio', 'fabio003@gmail.com', 'meunome1023', '29183728/394039', '(11) 97283-7389'),
(1004, 'Victor', 'vitor004@gmail.com', 'meunome1203', '01729364/090273', '(11) 96253-8901'),
(1005, 'Marco', 'Marco005@gmail.com', 'meunome1230', '01019203/849532', '(11) 95241-7891'),
(1006, 'Luan', 'Luan006@gmail.com', 'meunome0132', '02001968/930483', '(11) 97265-7289');



Create table fazendaVertical
(
idfazendaVertical int primary key,
nome varchar(80),
area int,
altura int,
fkCliente int,
foreign key (fkCliente) references Cliente(idCliente)
);

insert into fazendaVertical values(101, 'AeroFarms', 800, 700, 1001),
                                  (102, 'GP', 300, 900, 1002),
                                  (103, 'Plenty', 700, 500, 1003),
                                  (104, 'ODLAfarm', 450, 600, 1004),
                                  (105, 'BrightFarms', 200, 800, 1005),
                                  (106, 'PinkFarm', 600, 500, 1006);
                                  

Create table Sensor
(
idSensor int Primary key,
nmrColuna int,
fkFazendaVertical int,
foreign key (fkFazendaVertical) references fazendaVertical(idfazendaVertical)
);

insert into Sensor values (0, 1, 104),
						  (1, 1, 104),
                          (2, 2, 104),
                          (3, 2, 104),
                          (4, 3, 104),
                          (5, 3, 104);
                          

Create table VerificacaoHora
(
idVerificacoHora int primary key,
DataHora datetime default current_timestamp,
LUX int,
fkSensor int,
foreign key (fkSensor) references Sensor(idSensor)
);

insert into VerificacaoHora values (11, null, 48989, 0),
                                   (12, null, 49949, 0),
                                   (13, null, 42349, 0),
                                   (14, null, 40389, 0);
                                   

create table Usuario
(
idUsuario int,
email varchar(155),
fkFazendaVertical int,
foreign key (fkFazendaVertical) references fazendaVertical(idfazendaVertical),
Usuario_idUsuario int,
primary key(idUsuario, Usuario_idUsuario)
);

-- drop database ODLA;
