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