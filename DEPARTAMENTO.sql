USE Empresa_LBPD;

create table departamento ( 
	cd_departamento INT,       /* O tipo de dados int é o tipo de dados inteiros primário do SQL Server */
	nm_departamento VARCHAR(45),
    vl_orcamento_departamento DECIMAL (10,2)) ; /* é um tipo numérico que permite casas decimais com exatidão, então pode ser usado para valor monetário  */
    
    create table funcionario (
    cd_funcionario INT,      /* O tipo de dados int é o tipo de dados inteiros primário do SQL Server */    
     nm_funcionario VARCHAR (45),
    ds_email_funcionario VARCHAR (45), /*Um campo de caracter variável ou variável é um conjunto de dados de caracteres de comprimento indeterminado.*/
    cd_cpf_funcionario VARCHAR (45),  
    vl_salario_funcionario DECIMAL (10,2), /* é um tipo numérico que permite casas decimais com exatidão, então pode ser usado para valor monetário  */
    idade_funcionario INT,
    cd_departamento INT);   /* O tipo de dados int é o tipo de dados inteiros primário do SQL Server */
    

    
 select * from departamento;

select * from funcionario ;

  


    
  
    

    

    
    
    
    
    

    
    
    
    

    