use sakila; 
SELECT * FROM sakila.payment;
/*  relatorio de valores, vendas*/
select 
max(amount) as maior,
min(amount) as menor,
AVG(amount) as  'media de valores', /* vai pegar todos os valores e dividir pel quantidade, dando o valor medio*/
sum(amount) as  'total de vendas',
count(amount) as 'numero de vendas'
 from payment 
 where staff_id = 2
 
