/* USANDO TRIGGERS SQL */
USE Empresa_LBPD;

CREATE TABLE DepartamentoEmpresarial ( 
 cd_departamento INT NOT NULL AUTO_INCREMENT, 
 nm_departamento VARCHAR(45) NULL, 
 vl_orcamento_departamento DECIMAL(10,2) NULL, 
 PRIMARY KEY (cd_departamento)); 
 
 
CREATE TABLE FuncionarioEmpresarial ( 
 cd_funcionario INT NOT NULL AUTO_INCREMENT, 
 nm_funcionario VARCHAR(45) NULL, 
 ds_email_funcionario VARCHAR(45) NULL, 
 cd_cpf_funcionario VARCHAR(45) NULL, 
 vl_salario_funcionario DECIMAL(10,2), 
 idade_funcionario INT NULL, 
 cd_departamento INT NULL, 
 PRIMARY KEY (cd_funcionario), 
 CONSTRAINT fk_funcionario_departamento 
 FOREIGN KEY (cd_departamento) 
 REFERENCES departamento (cd_departamento)); 
 
 
CREATE TABLE AuditoriaEmpresarial ( 
 cd_auditoria INT NOT NULL AUTO_INCREMENT, 
 dt_auditoria DATE, 
 usuario VARCHAR(40) NOT NULL, 
 mensagem VARCHAR(100) NULL, 
 PRIMARY KEY (cd_auditoria));
 
 /*existe uma "gambiarra" que você pode fazer, porém se há erro de constraint seus dados não ficarão íntegros em relação a chave estrangeira,
 mas para sanar seu problema e você pelo menos poder inserir seus dados, 
 desabilite a verificação de chave estrangeira no inicio do seu script e habilite novamente no final, dessa maneira. */
 
 
 SET FOREIGN_KEY_CHECKS = 0;
 SET FOREIGN_KEY_CHECKS = 1;
 
select * from DepartamentoEmpresarial;
select * from FuncionarioEmpresarial ;
select * from AuditoriaEmpresarial ;
               
               
