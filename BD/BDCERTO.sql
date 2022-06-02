CREATE DATABASE Odla;
USE Odla;

CREATE TABLE Perfil (
idPerfil INT PRIMARY KEY,
Permissao varchar(10)
);

CREATE TABLE Fazenda(
idFazenda INT PRIMARY KEY,
Nome VARCHAR(80),
Area INT,
Altura INT
);

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(60),
Email VARCHAR(60),
Senha VARCHAR(30),
CNPJ CHAR(15),
telefone CHAR(15),
fkFazenda INT,
FOREIGN KEY (fkFazenda) REFERENCES Fazenda (idFazenda),
fkPerfil INT,
FOREIGN KEY (fkPerfil) REFERENCES Perfil (idPerfil)
);

CREATE TABLE Sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nmrColuna INT,
fkFazenda INT,
FOREIGN KEY (fkFazenda) REFERENCES Fazenda (idFazenda)
);

CREATE TABLE VerificacaoHora(
idVerificacaoHora INT PRIMARY KEY AUTO_INCREMENT,
dataHora DATETIME,
Lux INT,
fkSensor INT,
FOREIGN KEY (fkSensor) REFERENCES Sensor (idSensor)
);


insert into Perfil values(1, 'ADM'),
						 (2, 'Usuario'),
                         (3, 'Dev');
insert into Usuario values(null,'Victor Roque Lage','victorlage3000@gmail.com', 'ODLA', null, null, null, 3),
						 (null,'Fabio Moledo','fabio.seabra@sptech.school', 'ODLA', null, null, null, 3),
						 (null,'Luan Meneguelli','luan.meneguelli@sptech.school', 'ODLA', null, null, null, 3),
						 (null,'Marco Campos','marco.camposjr@sptech.school', 'ODLA', null, null, null, 3),
						 (null,'Marcus Santos','marcus.santos@sptech.school', 'ODLA', null, null, null, 3);

SELECT * FROM Usuario;
SELECT * FROM Perfil;
SELECT * FROM fazenda;
