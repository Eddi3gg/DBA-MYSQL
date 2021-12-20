-- SubQueries para puxar todo relatorio de pagamento que forem maior que o valor medio > avg --
-- criando uma subquery --
use sakila;
-- select * from payment where amount >avg -- primeira query
-- select avg(amount) from payment -- subquery

-- para fazer junção das query siga a estrutura a baixo -- 
select * from payment where amount > (select avg(amount) from payment)


/* trabalhando com o MAX subquery */ 
-- para filtrar todas as compras do cliente, max(amount) serve para pegar o valor maximo de um cliente -- 
select max(amount) from payment where customer_id = 1
-- para que eue possa pegar dados de um determinado resultado --

select * from payment where amount = ( 
select max(amount) 
 from payment
 where customer_id = 2)

/* trabalhando com o IN */
/* me mostre uma tabela de clientes que fizeram mais compras em having e group by*/
select *
 from customer 
 where customer_id in (                          /* me mostre a tabela de customer completa * que esta dentro da select "in count" */
SELECT customer_id	                /*com essa subquery eu filtrei todos os customer`s "clientes" por grupo que tem mais de 35 compras realizadas*/
from payment                                                       
group by customer_id 
having count(*) > 35 ) 


/* CHEGANDO AO MESMO RESULTADO UTILIZANDO OPERADORES DIFERENTES, DESSA VEZ COM ANY 	= QUALQUER COISA  */ 

select *
 from customer 
 where customer_id = ANY (                          /* me mostre a tabela de customer completa * que esta dentro da select "ANY = QUALQUER COISA */
SELECT customer_id	                /*com essa subquery eu filtrei todos os customer`s "clientes" por grupo que tem mais de 35 compras realizadas*/
from payment                                                       
group by customer_id 
having count(*) > 35 ) 