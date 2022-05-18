CREATE DATABASE Odla;
USE Odla;

CREATE TABLE Administrador(
idAdministrador INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(60),
Email VARCHAR(60) UNIQUE,
Senha VARCHAR(30),
CNPJ CHAR(14) UNIQUE,
telefone CHAR(15) UNIQUE
);

CREATE TABLE Fazenda(
idFazenda INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(80),
Area INT,
Altura INT,
fkAdministrador INT,
FOREIGN KEY (fkAdministrador) REFERENCES Administrador(idAdministrador)
);

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
Email VARCHAR(60) UNIQUE,
Senha VARCHAR(30),
fkFazenda INT,
FOREIGN KEY (fkFazenda) REFERENCES Fazenda (idFazenda),
fkAdministrador INT,
FOREIGN KEY (fkAdministrador) REFERENCES Administrador (idAdministrador)
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