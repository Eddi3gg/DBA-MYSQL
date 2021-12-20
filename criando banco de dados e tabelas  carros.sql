create database carros;
use carros; 
create table marcas (
id int not null auto_increment,
nome_marca varchar (255) not null,
origem varchar (255)  not null, 
primary key (id) 
);

create table inventario (
id int not null auto_increment,
modelo varchar  (255) 	not null,
transmissão varchar (255) not null,
motor varchar (255) not null,
combustivel varchar (255) not null,
marcas_id int not null,
primary key (id),	 
foreign key (marcas_id) references marcas(id)

);

create table clientes (
id int not null auto_increment,
nome varchar  (255) 	not null,
sobrenome varchar (255) not null,
endereco varchar (255) not null,
PRIMARY KEY (id) 
);