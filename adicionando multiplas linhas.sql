USE SAKILA;
---- para adicionar multiplas tabelas ----
-- tudo que eu tenho a minha esquerda left tudo que eu tenho a minha direita right ---
-- exemplo left join ou right join são filtros para mostrar todos os resultado, não importa se é nulo ou vazio--
--  exemplo left join address ou right join address --
select 
cus.customer_id,
cus.first_name,
cus.last_name,
adr.address,
pay.rental_id,
pay.amount
from customer cus 
join payment pay on cus.customer_id = pay.payment_id 
join address adr on cus.customer_id = adr.address_id	


-- UNION, ele vai unificar, vai juntar dois select dentro do mesmo resultado--

select 
cus.customer_id,
cus.first_name,
cus.last_name,
pay.amount,
'VIP' as status 


from customer cus 
join payment pay on cus.customer_id = pay.payment_id 
where pay.amount >= 10.99

UNION            -- UNION, ele vai unificar, vai juntar dois select dentro do mesmo resultado--

select 
cus.customer_id,
cus.first_name,
cus.last_name,
pay.amount,
'NONVIP' as status


from customer cus 
join payment pay on cus.customer_id = pay.payment_id 
where pay.amount <= 10.99;
