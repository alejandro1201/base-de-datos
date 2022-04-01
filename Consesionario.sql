SELECT * FROM `concesionario`.`usuario` LIMIT 1000;
SELECT * FROM `concesionario`.`empleado` LIMIT 1000;


create database concesionario;

use concesionario;
create table Usuario (cod_usuario int(20) not null primary key auto_increment, Nombre varchar(25) not null, Edad int not null, Correo varchar(40) not null);

insert into usuario values (not null, "Luis Diaz", "54", "luis@gmail.com");

insert into usuario values (not null, "Cristiano Ronaldo", "34", "crisronal@gmail.com");


create table Empleado (Id_empleado int(20) not null auto_increment primary key, Nombre varchar(25) not null, Telefono int(25) not null, Cedula int(15) not null);


insert into Empleado values (not null, "Carlota Palomita", "322614677", "1006521442");

insert into Empleado values (not null, "Ana Cruz", "322374677", "100987442");
