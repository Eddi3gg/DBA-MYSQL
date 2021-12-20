-- views--
-- para criar visualização de uma tabela renomeada, exemplo me puxa um relatorio vendas por clientes --


use sakila;
create view vendas_por_clientes as 
select 
cus.customer_id, 
cus.first_name,
 cus.last_name, 
 pay.amount 
 from customer cus
 join payment pay
 on cus.customer_id = pay.payment_id 
 
 -- EXIBINDO RELATÓRIO existente modificando DE QUEM  PAGA MAIS -- 
 create or replace view vendas_por_clientes as 
select 
cus.customer_id, 
cus.first_name,
 cus.last_name, 
 pay.amount 
 from customer cus
 join payment pay
 on cus.customer_id = pay.payment_id 
 order by pay.amount desc -- desc do maior para o menor--
 