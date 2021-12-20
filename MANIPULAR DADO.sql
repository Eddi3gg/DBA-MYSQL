 alter table departamento modify cd_departamento INT NOT NULL auto_increment primary key;   
    alter table funcionario modify cd_funcionario INT NOT NULL auto_increment primary key;   
    /*Desta forma o campo deve ser sempre preenchido (NOT NULL), é numérico do tipo inteiro (INT) e deve auto-incrementar de acordo com o número de clientes que for incluído.*/
    /*para realizar uma auto-incremento, criar automaticamente o valor do campo de chave primária.*/
    /* alter table e modify, toda vez que for atualizar algum dado em uma tabela. */

    show keys from departamento where Key_name= 'PRIMARY'; 
    /* Show keys from, EM PORTUGUÊS = "mostrar chaves de", então estara nitido que mostrará a chave primaria, segue o exemplo. */
	show keys from funcionario where Key_name= 'PRIMARY';	
    
    insert into departamento (nm_departamento, vl_orcamento_departamento) VALUES (1, 'Desenvolvimento' , 10);
    /*insert into =  é usada para inserir novos registros em uma tabela.*/
    /* values = Especifica um conjunto de expressões de valores de linha a ser construído em uma tabela. */
    /* Segue o exemplo abaixo: */
    insert into funcionario (cd_funcionario, nm_funcionario, ds_email_funcionario, cd_cpf_funcionario, vl_salario_funcionario, idade_funcionario, cd_departamento)
    values ( '1' 'Eddie' , 'Eddie.99-@outlook.com' , '123456789' , '5000' , '22' , '1');
    
    alter table funcionario modify nm_funcionario VARCHAR (45) not null; 
    /* estou alterando uma tabela funcionario, modificando nome do funcionario, esse nome pode ser preenchido por 45 caracteres, NOT NULL garante que uma coluna não admite valores NULL. */
    
    insert into funcionario (cd_funcionario, nm_funcionario, ds_email_funcionario, cd_cpf_funcionario, vl_salario_funcionario, idade_funcionario, cd_departamento)
    values (2, NULL, 'karolina.99-@outlook.com' , '987654321' , 10000 , 20, '1');
    
    alter table departamento modify nm_departamento varchar (45) NOT NULL;  
/*NULL indica que o valor é desconhecido. Um valor nulo é diferente de um valor zero ou vazio.*/
  insert into departamento (cd_departamento, nm_departamento, vl_orcamento_departamento) values (2, null, 10);
  
    insert into funcionario (cd_funcionario, nm_funcionario, ds_email_funcionario, cd_cpf_funcionario, vl_salario_funcionario, idade_funcionario, cd_departamento)
    values (3, 'Douglas' , 'Douglas.99-@outlook.com' , '369214785' , '3500' , 30, '1' );
    
     insert into funcionario (cd_funcionario, nm_funcionario, ds_email_funcionario, cd_cpf_funcionario, vl_salario_funcionario, idade_funcionario, cd_departamento)
    values (4, 'Naiara' , 'naiara.99-@outlook.com' , '1561154785' , '4500' , 38, '1' );
    
       insert into funcionario (cd_funcionario, nm_funcionario, ds_email_funcionario, cd_cpf_funcionario, vl_salario_funcionario, idade_funcionario, cd_departamento)
    values (5, 'Giovana' , 'giovana.99-@outlook.com' , '1489535812' , '4500' , 23, '1' );
    
       insert into funcionario (cd_funcionario, nm_funcionario, ds_email_funcionario, cd_cpf_funcionario, vl_salario_funcionario, idade_funcionario, cd_departamento)
    values (6, 'Augusto' , 'augusto.99-@outlook.com' , '2827631248' , '4500' , 21, '1' );
    
    DESCRIBE funcionario;     /* descrever detelhadamente uma tabela */ 
    
    select * from funcionario where nm_funcionario = 'Eddie' ; /*WHERE fazer uma consulta em uma determinada tabela*/ 
     select * from funcionario where nm_funcionario = 'Giovana' and ds_email_funcionario = 'giovana.99-@outlook.com'  /* AND é utilizado para especificar pesquisar melhor o usuario*/
     
     /* o MYSQL possui um recurso de segurança para que deve ser desativado quando estamos modificando algumas informações na tabela (SQL_SAFR_UPDATES). */
	/* a ferramenta para desativa-lo a baixo */
    
    set sql_safe_updates = 0;
    UPDATE funcionario SET ds_email_funcionario = 'augustocarrara99-@outlook.com'    where nm_funcionario = 'Augusto';  /* um registro [e alterado da seguinte maneira, note ma coluna 36 e 37*/
    
    select * from funcionario where nm_funcionario  = 'Augusto'; /* para verificar se houve alteração no email do usuario */
    
    select * from departamento;
    select * from funcionario;
    
    
     insert into funcionario (cd_funcionario, nm_funcionario, ds_email_funcionario, cd_cpf_funcionario, vl_salario_funcionario, idade_funcionario, cd_departamento)
    values (8, 'KarolineTrakinas' , 'Trakinas.99-@outlook.com' , '282763124824' , '10000' , 23, '1' );
    
    /*Criar restrição baseada na regra de negócio utilizando a clasula CHECK*/
    
    alter table departamento add constraint Valor_orc CHECK (vl_orcamento_departamento > 0);  /*Constraints (restrições) mantém os dados do usuário restritos, e assim evitam que dados inválidos sejam inseridos no banco.*/
    
    /* Para validar se a restrição foi corretamente implementada, utilizando o exemplo abaixo: */
    
    insert into departamento (cd_departamento, nm_departamento, vl_departamento, vl_orcamento_departamento) VALUES (2, 'Testes' , 0);
    
    /*AO executar alter table e insert into 'departamento' acima, observe que houve  violação da restrição Valor_ORC e não permite que o registro seja armazenado em tabela*/
    
    
    
     
   

 insert into departamento ( nm_departamento, vl_orcamento_departamento)
 values ('Kabum' ,  '1520000' );
     
     
    
    
    