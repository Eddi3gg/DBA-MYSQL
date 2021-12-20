INSERT INTO DepartamentoEmpresarial (nm_departamento, vl_orcamento_departamento) 
VALUES 
('Desenvolvimento', 100000), 
('Produto', 200000), 
('Serviços', 100000), 
('Diretoria', 500000); 

INSERT INTO FuncionarioEmpresarial  (nm_funcionario, ds_email_funcionario, cd_cpf_funcionario, vl_salario_funcionario, 
idade_funcionario, cd_departamento) 
VALUES 
('Mario', 'mario.quinello@docente.unip.br', 11111111111, '20000', 44, 1), 
('Fernando', 'fernando@fernando.com.br', 22222222222, '10000', 24, 3), 
('Otavio', 'otavio@otavio.com.br', 33333333333, '30000', 35, 4), 
('Lauro', 'lauro@lauro.com.br', 44444444444, '30000', 30, 4), 
('Gumercindo', 'Gumercindo@gumercindo.com.br', 55555555555, '20000', 50, 1);



 
 
 /*será utilizado para monitorar a inserção na tabela funcionário; utilize o script abaixo para criar 
esta trigger:*/
/Auditando registros na tabela funcionario - INSERT 
DELIMITER // 
CREATE TRIGGER auditoria_func_ins AFTER INSERT ON FuncionarioEmpresarial 
 /*CREATE TRIGGER permite criar um novo trigger que é acionado automaticamente sempre que um evento como INSERT, 
DELETE ou UPDATE ocorre em uma tabela. nesse caso tabela*/

FOR EACH ROW /*Um gatilho que está marcado FOR EACH ROW é chamado uma vez para cada linha que a operação modifica*/
BEGIN 
 INSERT INTO auditoria (dt_auditoria, usuario, mensagem) 
 VALUES (CURRENT_TIMESTAMP, CURRENT_USER(), 'Novo registro inserido na tabela funcionario!' ); 
 /*CURRENT_TIMESTAMP deriva esse valor do sistema operacional do computador no qual a instância do SQL Server é executada.*/
 /*CURRENT_USER retorna o nome do contexto de segurança atual.*/
 
END // 
DELIMITER ;

/* para testar a implementação segue o registro abaixo:*/
-- Testando a trigger auditoria_func_ins 
INSERT INTO funcionario 
(nm_funcionario, ds_email_funcionario, cd_cpf_funcionario, vl_salario_funcionario, idade_funcionario, 
cd_departamento) 
VALUES ('Humberto', 'humberto@humberto.unip.br', 55555555555, '20000', 42, 1);

select * from FuncionarioEmpresarial;
select * from AuditoriaEmpresarial;
 
 /*Agora vamos criar uma trigger para monitorar os registros removidos da tabela funcionários; neste caso vamos utilizar 
o conceito de OLD para armazenar a informação sobre qual registro foi removido:*/
 
-- Auditando registros na tabela funcionario - DELETE 
DELIMITER //      /*DELIMITER ; Esse procedimento tem por função fazer um select na tabela PRODUTOS, limitando a quantidade de registros pela quantidade recebida como parâmetro.*/
CREATE TRIGGER auditoria_func_del AFTER DELETE ON funcionario  /* depois apague em funcionario*/
FOR EACH ROW  /*Um gatilho que está marcado FOR EACH ROW é chamado uma vez para cada linha que a operação modifica*/
BEGIN 
 INSERT INTO auditoria (dt_auditoria, usuario, mensagem) 
 VALUES (CURRENT_TIMESTAMP, CURRENT_USER(), concat('O registro ', OLD.cd_funcionario, ' foi removido!' )); 
END // 

DELIMITER ; /*dIMITER ; Esse procedimento tem por função fazer um select na tabela PRODUTOS, limitando a quantidade de registros pela quantidade recebida como parâmetro.*/
/* TESTANDO TRIGGER, REMOVA O REGISTRO 6 */ 
DELETE FROM FuncionarioEmpresarial WHERE cd_funcionario = 6;


select * from AuditoriaEmpresarial;

-- Auditando registros na tabela funcionario - UPDATE 
DELIMITER // 
CREATE TRIGGER auditoria_sal_func BEFORE UPDATE ON funcionario /*antes atualize funcionario*/
FOR EACH ROW 
BEGIN 
 IF NEW.vl_salario_funcionario > (0.05 * (SELECT vl_orcamento_departamento FROM departamento 
 WHERE cd_departamento = OLD.cd_departamento)) THEN 
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O registro não foi gravado pois ultrapassa o orçamento previsto!'; 
END IF; 
END // 
DELIMITER ;

update FuncionarioEmpresarial SET vl_salario_funcionario = 25000 where cd_funcionario = 1;

select * from FuncionarioEmpresarial;


SELECT cd_funcionario 																																																									