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
INSERT INTO material(nombre,cantidad,idcategoria)values("SOL",10,1),("ACEROS AREQUIPA",50,2),("INKA",5,1),("LADRILLO",1000,3);

select 
	m.idmaterial,
    m.nombre,
    m.cantidad,
    c.idcategoria,
	c.nombre as 'categoria'
 from material m inner join categorias c on m.idcategoria = c.idcategoria order by idmaterial;
 
 Delete from material where idcategoria = 2;

