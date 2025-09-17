/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  efrai
 * Created: 3 set. 2025
 */

CREATE DATABASE bddnegocio;
use bddnegocio;

create TABLE usuarios(
	idusuario int primary key auto_increment,
	usuario varchar(50),
	clave varchar(60),
    nombre varchar(50)
)ENGINE=INNODB;

insert into usuarios (usuario, clave,nombre) values('hquispe','123456','Harold Quispe');
update usuarios set clave = "$2a$10$MNTtqGBlSGX2zkAFzW7WLeDV/A0lVUyNGqwoKealHKd47j96KKKce" where idusuario = 1;
select * from usuarios;

CREATE TABLE categorias(
	idcategoria INT primary key auto_increment,
    nombre varchar(45) not null unique
)ENGINE = INNODB;

INSERT INTO categorias(nombre) values("Cemento"),("Fierro"),("Agregados");
select * from categorias;

CREATE TABLE material(
idmaterial int primary key auto_increment,
nombre varchar(45) NOT NULL unique,
cantidad decimal(10,2) not null,
idcategoria int,
constraint fk_idcategoria foreign key (idcategoria) references categorias(idcategoria)
)ENGINE = INNODB;
INSERT INTO material(idmaterial,nombre,cantidad,idcategoria)values(5,"Rocas",1000,3);

select 
	c.nombre as 'Categoria',
    m.nombre as 'Nombre producto',
    m.cantidad
 from material m inner join categorias c on m.idcategoria = c.idcategoria;

SELECT * FROM categorias