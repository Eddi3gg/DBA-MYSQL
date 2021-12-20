SELECT * FROM sakila.payment;
/* relatorio total de compras e clientes por agrupamento order by*/ 
select 
cus.customer_id, 
cus.first_name as nome,
cus.last_name as sobrenome,
sum(amount) as total, 
count(amount) as compras


from payment pay
join customer cus using(customer_id)
group by customer_id
having total >= 150 and compras >= 35
order by total desc 


