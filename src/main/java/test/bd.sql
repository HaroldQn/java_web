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

insert into usuarios (usuario, clave,nombre) values('hquispe','$2a$10$MNTtqGBlSGX2zkAFzW7WLeDV/A0lVUyNGqwoKealHKd47j96KKKce','Harold Quispe');

select * from usuarios;