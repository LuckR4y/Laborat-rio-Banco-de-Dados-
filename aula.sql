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
						

/* Aula LABORATORIO DE BANCO DE DADOS */
/* Dia 22/08 */

/* CRIAR NOVO USUARIO */ 
CREATE USER "5W_839832"
	IDENTIFIED BY "140895"
		DEFAULT TABLESPACE TBLS5W_839832 
			TEMPORARY TABLESPACE TEMP	
				PROFILE DEFAULT 
					ACCOUNT UNLOCK;
	
 /* DISC OU DISCONNECT */
 /* CONNOU CONNECT */
 
 CONN 5W_839832@GRAD;
 
 /*  ATRIBUIR DIREITOS PARA UM USUARIO */
 GRANT direito(s)/role  TO 5W_839832/ROLE [WITH OPTION ADMIN];
 
 /* RETIRAR DIREITOS DE UM USUARIO */
 REVOKE direito(s)/role  TO 5W_839832/ROLE;
 
 /* EXEMPLOS DE DIREITOS DE SISTEMA */
 CREATE TABLE
 CREATE SESSION 
 CREATE USER 
 
 /* EXEMPLOS DE DIREITOS DE OBJETOS */
 INSERT
 UPDATE
 DELETE
 
 /* ATRIBUIR DIREITOS PARA O USUARIO CRIADO */
 GRANT CREATE SESSION, SELECT ANY TABLE, CREATE TABLE, INSERT ANY TABLE, UPDATE ANY TABLE, DELETE ANY TABLE TO "5W_839832";
 
 
 DBA_USERS -- TABELA DO SISTEMA QUE ARMAZENA AS INFORMAÇÕES
 
 /* CONECTAR COM O USUARIO laboratorio */
 /* CRIAR UM NOVO USURARIO COM O NOME "EX_CODIGO' */
 
 CREATE USER "EX_839832"
	IDENTIFIED BY "140895"
		DEFAULT TABLESPACE TBLS5W_839832 
			TEMPORARY TABLESPACE TEMP	
				PROFILE DEFAULT 
					ACCOUNT UNLOCK;
					
/* ALTERAR USUARIO */
ALTER USER "EX_839832"[PARÂMTRO(S)];

/* ALTERAR SENHA DO USUARIO */
ALTER USER "EX_839832" IDENTIFIED BY "060605";

/* ALTERAR O STATUS DO USUARIO (BLOQUEALO) */
ALTER USER "EX_839832" ACCOUNT LOCK;

/* EXCLUIR UM USUARIO */
DROP USER "EX_839832" [TO CASCADE]; 

DROP USER EX_839832;

/* CONECTAR COM O USUARIO 5W_839832 */
/* VERIFICAR QUAL O NOME DO USUARIO  CONECTADO */
SHOW USER;

/*CRIAÇÃO DE TABLEAS */
/* CREATE TABLE "NOME DA TABELA" (
	ATRIIBUTO1 TIPO (TAMANHO) [UNIQUE |NOT NULL],
	ATRIBUTO2 TIPO (TAMANHO),
	ATRIBUTO3 TIPO (TAMANHO),
	CONSTRAINT "NOME" [PRIMARY KEY | FOREIGN KEY | CHECK] PARAMETROS); */
	
/* O tipo de dado autoincremento não existe no oracle 
   Essa situação é implementada por meio de uma sequence*/
   /* SINTAXE*/
   /*CREATE SEQUENCE "nome da sequencia"
		START WITH 	n (valor inicial da sequencia)
			INCREMENT BY n (valor da incrementação)
				MAXVALUE n (valor maximo da sequencia)
					MINVALUE n (valor minimo da sequencia)
						CACHE n (quantidade de valor em cache)
							CYCLE|NOCYCLE (se a sequencia sera ciclica ou nao) */

CURRVAL (current value) -- Mostra o valor atual da sequencia *SO PODE SER USADO APOS A SEQUENCIA TER SIDA INICIALIZADA*
NEXTVAL (next value) -- Incrimenta o valor da sequencia	

-- Exemplo
CREATE SEQUENCE SEQFORNECEDOR
	START WITH 1
		INCREMENT BY 1
			MAXVALUE  99999
				MINVALUE 1
					CACHE 10
						NOCYCLE;
						
	GRANT DBA TO "5W_839832"
	
	CREATE SEQUENCE SEQPRODUTO
		START WITH 1
			INCREMENT BY 1
				MAXVALUE 999
					MINVALUE 1
						CACHE 5
							NOCYCLE;
							
	USER_SEQUENCES -- tabela que armazena as sequencias de um USUARIO
		SELECT * FROM USER_SEQUENCES;
		
	/* INSERIR REGISTROS EM UMA TABEA 
	   SINTAXE*/
	   INSERT INTO NOMETABELA(atributo(s)) VALUES (valor(es))
	   
	   INSERT INTO PRODUTO(COD_PRODUTO, NOM_PRODUTO, DSC_PRODUTO)
			VALUES SEQPRODUTO.NEXTVAL, 'Notebook 15', 'Notebook 15 marca X'); 
			(*), TESTE: SELECT SEQPRODUTO.CURRVAL FROM DUAL;
			
			
		INSERT INTO FORNECEDOR(COD_FORNECEDOR, RAZ_SOCIAL_FORNECEDOR, CNPJ_FORNECEDOR, IE FORNECEDOR, EMAIL_FORNECEDOR)	
			VALUES (SEQFORNECEDOR.NEXTVAL, 'DELL computadores', '123456789900086', '1234567890', 'vendas@dell.com.br');
			
		COMMIT -- ratifica as transações no banco de DADOS
		ROLLBACK -- desfaz as transações que ainda n foram ratificados
		
	/* ALTERAR REGISTROS DE UMA TABELA
		SINTAXE */
	/*	UPDATE NOMETABELA SET ATRIBUTO = NOVOVALOR
		 [WHERE CONDIÇÃO] */
	/* exemplo */
		UPDATE PRODUTO SET NOM_PRODUTO = 'Notebook i5 top'
			WHERE COD_PRODUTO = 1;

	/* SINTAXE 
	SELECT atributo(s) FROM nome tabela 
	[WHERE condição(ões) | ORDER BY atributo(s) | GROUP BY atributo | HAVING]
	Funções agregadas 
	SUM() - somatoria
	AVG() - média
	MAX() - máximo - maior valor
	MIN() - mínimo - menor valor
	COUNT() - contagem */
	
	/*1) listar o nome dos medicos e seu respectivo salario */
	
	SELECT NOM_MEDICO || ' ' || SBN_MEDICO nome, SAL_MEDICO Salario FROM MEDICO;

	/*2) Listar o maior salário que um médico recebe */
	SELECT MAX(SAL_MEDICO) FROM MEDICO;
	
	/*3) Mostrar o nome do(s) médico(s) que recebe(m) o maior salario*/
	SELECT NOM_MEDICO || ' ' || SBN_MEDICO Nome FROM MEDICO 
		WHERE SAL_MEDICO = (SELECT MAX(SAL_MEDICO) FROM MEDICO);

	/*4) Mostrar a média salarial dos medicos*/
	SELECT AVG(SAL_MEDICO) Media_Salario FROM MEDICO;
	
	/*5) Mostrar a quantidade de pacientes cadastrados*/
	SELECT COUNT(*) QTD_PACIENTES FROM PACIENTE;
	
	/*6) Mostrar a quantidade de pacientes cadastrados que são do esdado de São Paulo*/
	SELECT COUNT(*) QTD_PACIENTES_SP FROM PACIENTE
		WHERE UPPER (UF_PACIENTE) = 'SP';
	
	/*7) Mostrar a quantidade de pacientes cadastrados por estado*/
	SELECT UF_PACIENTE UF, COUNT(*) QTD_PACIENTE
		FROM PACIENTE GROUP BY UF_PACIENTE;
	
	/*8) Listar o numero de exame, a data de ralização e o nome do paciente*/
	SELECT EL.NUM_EXAME, EL.DTA_EXAME, P.NOM_PACIENTE
		FROM EXAME_LABORATORIO EL, PACIENTE P
			WHERE EL.COD_PACIENTE = P.COD_PACIENTE;
	
	/*9) Listar o nome dos pacientes que fizeram exames no ano de 2020*/
	SELECT P.NOM_PACIENTE Nome
		FROM PACIENTE P, EXAME_LABORATORIO EX
			WHERE P.COD_PACIENTE = EX.COD_PACIENTE
				AND TO_CHAR (EX.DTA_EXAME, 'YYYY') = '2020';
				
	/*10) Listar o nome do exame que foi realizado por um paciente atendido em um UBDS do estado de Sâo Paulo*/
	SELECT E.NOM_EXAME Exame 	
		FROM EXAME_LABORATORIO EL, EXAME E, UBDS U
			WHERE U.COD_UBDS = EL.COD_UBDS
				AND EL.COD_EXAME = E.COD_EXAME
					AND UPPER(U.UF_UBDS) = 'SP';
