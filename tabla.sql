create table venta(
    
    id int(11) auto_increment not null,
    fec_venta date not null,
    Producto varchar(30) not null,
    Descripcion text(40) not null,
    Precio decimal(20) not null
    constraint pk_venta primary key (id)
);