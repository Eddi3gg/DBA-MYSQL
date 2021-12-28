-- USUARIOS --

use mysql;
select * from user 
select * from mysql.user    -- Visualizando banco de dados de usuários --

-- criando usuario --
create user Ethan identified by '6080' ; 
create user oliver@localhost   identified by '8060';           -- ausuario que terá acesso ao servidor--
create user maya@stefanini.com identified by '0408';            -- usuario tera acesso apenas com o dominio--

-- para visualizar o usuario --
select * from mysql.user 

-- remover usuarios -- 
-- drop user maya@stefanini.com;
-- select * from mysql.user --

-- recuperando senhas do usuario -- 
set password for oliver@localhost = '6080';
select * from mysql.user

-- aplicando previlegios a usuarios -- 
grant select, insert, update, delete
on sakila.*
to Ethan;

grant select, insert
on sakila.*
to oliver@localhost;

grant  update, delete
on sakila.*
to maya@stefanini.com;
select * from mysql.user


-- Adicionando um ADMIN --

GRANT ALL ON SAKILA.* TO Ethan;
show grants for Ethan;

-- para que seja admin de todo o banco de dados -- +
grant all on *.* to oliver@localhost;
show grants for oliver@localhost;

-- para retirar acesso de um usuario -- 
revoke update
on sakila.* from Ethan;


