use sakila;
-- para criar um backup --
create table payment_backup as select * from  payment 
-- apagando tabela--
drop table payment_backup
-- atualizando registro de um atributo de uma  tabela --
update payment set amount = 15.99 where payment_id = 1
delete from payment where payment_id = 16041

select