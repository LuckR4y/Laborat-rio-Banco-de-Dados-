/* Aula LABORATORIO DE BANCO DE DADOS */
/* Dia 15/08 */

/* Usuário: laboratorio@grad
   Host: grad
   Senha: unaerp */
   
   
  /* Criando tablespace */
  CREATE TABLESPACE tbls5w_839832 DATAFILE 'C:\app\oracle\oradata\grad\datafile\ tbls5w_839832.dbf' SIZE 10M;
  
  /* Listar o nome das tablespaces de um banco de dados */
  SELECT tbls5w_839832 FROM DBA_TABLESPACE;
  
  /* Redimensionar o tamanho de um tablespace alterando o datafile */
  /* sintaxe */
  ALTER DATABASE DATAFILE 'C:\app\oracle\oradata\grad\datafile\ tbls5w_839832.dbf' RESIZE 15M;
  
  ALTER TABLESPACE "TBLS5W_839832"
	ADD DATAFILE 'C:\app\oracle\oradata\grad\datafile\tbls5w_839832aux.dbf' 
		SIZE 5M;
		
/* Modificar o nome de um tablespace */ 
/*SINTAXE*/
/* ALTER TABLESPACE "NOME_TABLESPACE"
	RENAME TO "NOVO NOME_TABLESPACE"; */
	
/*Exemplo */
ALTER TABLESPACE "TBLS5W_839832"
	RENAME TO "5W_839832";
	
/* Remover um tablespace do banco de dados */
/* SINTAXE- DROP TABLESPACE "NOME_TABLESPACE"
[INCLUDING CONTENSTS AND DATAFILES]; */

/* Criação de usuários */
/* Sintaxe- CREATE USER "nome usuario" 
	IDENTIFIED BY "SENHA"
		 DEFAULT TABLESPACE "NOME DO TABLESPACE PADRÃO"
			TEMPORARY TABLESPACE "NOME DO TABLESPACE TEMPORARIO"
				ACOUNT [LOCK | UNLOCK]
					PROFILE "NOME DO PRIFILE" [DEFAULT]
						QUOTA ON [tamanho | UNLIMITED] */
					
CREATE USER "ARTHUR VITAL" 
	IDENTIFIED BY "lr060605"
		 DEFAULT TABLESPACE "NOME DO TABLESPACE PADRÃO"
			TEMPORARY TABLESPACE "NOME DO TABLESPACE TEMPORARIO"
				ACOUNT [LOCK | UNLOCK]
					PROFILE "NOME DO PRIFILE" [DEFAULT]
						QUOTA ON [tamanho | UNLIMITED];
