use sakila;
insert into language -- inserir na tabela language--
values
 (default, 'spanish', '2021-02-15 05:02:1' ),
 (default, 'Polish', '2021-02-15 05:02:1' ) 
-- select * from sakila.language ; --

select * from sakila.city

insert into country values 	(default, 'Denmark' , '2021-02-15 04:44:00');

insert into city values (default, 'Odense', last_insert_id (),'2021-02-15 04:44:00' );

update payment 
set amount = 15.99
 where payment_id = 1 