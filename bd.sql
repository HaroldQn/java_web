CREATE DATABASE bddnegocio;
use bddnegocio;

create TABLE usuarios(
	idusuario int primary key auto_increment,
	usuario varchar(50),
	clave varchar(20),
    nombre varchar(50)
)ENGINE=INNODB;

insert into usuarios (usuario, clave,nombre) values('hquispe','123456','Harold Quispe');

select * from usuarios;