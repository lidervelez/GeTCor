create table institucion(
    id int not null,
    razonsocial varchar(255),
    ubicacion varchar(500),
    telefono int,
    primary key (id)
);

create table tramitador(
    id_td int not null auto_increment,
    nombre_td varchar(500)
    ci int(50);
    telefono int,
    codigo_tr int,
    primary key (id_td)
);
/*
insert into tramitador (nombre_td, telefono, codigo_tr)
values ('Juan Pérez',, 123456789, 100),
       ('María López', 987654321, 200);*/

create table tramite(
    id_tr varchar(50) not null default CONCAT(tipo,num_tr,gestion),
    num_tr int not null,
    gestion int not null,
    tipo ENUM('I', 'E', 'P') NOT NULL,
    referencia varchar(500),
    fecha DATETIME NOT NULL,
    estado ENUM('INI', 'PEN', 'FIN'),
    id_td int,
    primary key (id_tr),
    foreign key (id_td) references tramitador (id_td)
);

INSERT INTO tramite (num_tr, gestion, tipo, referencia, fecha, estado, id_td)
VALUES  (1, SUBSTRING(YEAR(NOW()), 3), 'I', 'Referencia 1', NOW(), 'INI', 1),
        (1, SUBSTRING(YEAR(NOW()), 3), 'E', 'Referencia 1', NOW(), 'INI', 1),
        (1, SUBSTRING(YEAR(NOW()), 3), 'P', 'Referencia 1', NOW(), 'INI', 1);






create table area(
    id_a int not null auto_increment,
    nombre_a varchar(500),
    descripcion varchar(500),
    id_a_p int,
    primary key (id_a),
    foreign key (id_a_p) references area (id_a) 
);


insert into area (nombre_a,descripcion)
values ("Admin", "area de administracion" );
insert into area (nombre_a,descripcion,id_a_p)
values ("usuarioA", "usuarios de tipo A", 1),
("usuarioB", "usuarios de tipo B", 1);




create table rol(
    id_r int not null auto_increment, 
    rol varchar(50),
    primary key (id_r)
);

insert into rol(rol)
values ("administrador"),("usuario");



create table usuario(
    id_u int not null auto_increment,
    uname varchar(20),
    upwd varchar(12),
    cargo varchar(120),
    
    id_a int,
    id_r int,
    primary key (id_u),
    foreign key (id_a) references area(id_a),
    foreign key (id_r) references rol(id_r)
);

insert into usuario(uname,upwd,cargo,id_a,id_r)
values ("admin","admin","admin",1,1),
        ("user","user","user",2,2);



create table funcionario(
    id_f int not null auto_increment,
    nombre varchar(255),
    apaterno varchar(255),
    amaterno varchar(255),
    id_u int,
    primary key (id_f),
    foreign key (id_u) references usuario (id_u) 
);

insert into funcionario(nombre,apaterno,amaterno,id_u)
values ("Lider","lider","lider",1),
        ("franz","franz","franz",2);


create table pertenece(
    id_tr varchar(50),
    id_u int,
    fecha date,
    instruccion varchar(525),
    foreign key (id_tr) references tramite (id_tr),
    foreign key (id_u) references usuario (id_u)
);

create table temp_tram_per(
    id_tr varchar(50),
    id_u int,
    fecha date,
    instruccion varchar(525)
);
create table histo_tram(
    id_tr varchar(50),
    id_u int,
    fecha_ini date,
    instruccion varchar(525),
    fecha_fin date
);

create table histo_tram_fin(
    id_tr varchar(50),
    id_u int,
    fecha_ini date,
    observacion varchar(525)
);

create table histo_usu_fun(
    id_u int,
    id_f int,
    fecha_c date
);