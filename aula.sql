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
					
	/*PL/SQL 
		Bloco anonimo- aula pos prova- 10/10*/
	/* Estrutura de um probrama PL/SQL */
		--opcional
		DECLARE
		--seção de declaração de variaveis 
		--boa pratica: iniciar o nome de uma variavel com VALIDATE
		NOMEDAVARIVAL TIPODEDADO;
		
		--obrigatorio
		BEGIN
		--comandos DML e instruções PL/SQL (manipulação de variavel, estruturas de repetição, estruturas de condicionais, atribuição de valores, execeçõe, ...)
		
		--opcional
		EXCEPTION
		-- seção para o tratamento das execeções
		
		-- obigatorio
		END; 
		
		--mostrar mensagem
		DBMS_OUTPUT.PUT_LINE();
		
		-- alterar o valor da variavel SERVEROUTPUT para ON
		SET SERVEROUTPUT ON
		
		-- Atriuição de valor para uma variavel
		:= atribuição direta
		INTO atribuição quando o valor vira de uma instruição SQL
		
		-- exemplo
		-- Bloco anonimo para receber o codigo de um paciente e retronar o nome e a idade
		-- Declara~ção das variaveis
	SET SERVEROUTPUT ON;
	DECLARE 
    VIDADE NUMBER(3);
    VCODIGO NUMBER(5);
    VNOME VARCHAR2(35);
	BEGIN
    -- Instrução SQL
    SELECT NOM_PACIENTE, TRUNC(MONTHS_BETWEEN(SYSDATE, DTN_PACIENTE) / 12)
    INTO VNOME, VIDADE 
    FROM PACIENTE
    WHERE COD_PACIENTE = &VCODIGO;

    -- Mostrar valores recuperados
    DBMS_OUTPUT.PUT_LINE('Nome: ' || VNOME);
    DBMS_OUTPUT.PUT_LINE('Idade: ' || VIDADE);
    
	EXCEPTION
    -- Tratamento das exceções
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Finalizando sem concluir...');
	END;
	
	--Estrutura condicional
	IF...ELSIF...ELSE...END IF;
	
	/*sintaxe
	IF(CONDICÇÃO ) THEN 
	-- instrução para condição 1 verdadeira
	ELSIF (CONDIÇÃO 2) THEN
	-- instrução para condição 2 verdadeira
	ELSE
	-- instrução para condição1 e condição2 falsa
	END IF;
	*/
	--Exemplo
	/*Bloco anonimo para receber o codigo de um paciente e retornar o nome,
	a idade, e sua classificação < 12 anos criança, > 12 e <=18 adolescente e > 18 adulto*/
	
	SET SERVEROUTPUT ON;
	DECLARE 
    VIDADE NUMBER(3);
    VCODIGO NUMBER(5);
    VNOME VARCHAR2(35);
	VCLASSE VARCHAR2(15);
	BEGIN
    -- Instrução SQL
    SELECT NOM_PACIENTE, TRUNC(MONTHS_BETWEEN(SYSDATE, DTN_PACIENTE) / 12)
    INTO VNOME, VIDADE 
    FROM PACIENTE
    WHERE COD_PACIENTE = &VCODIGO;
	-- estrutura condicional 
	IF (VIDADE < 12) THEN
	VCLASSE := 'Criança';
	ELSIF (VIDADE >=12 AND VIDADE <= 18) THEN
	VCLASSE := 'Adolescente';
	ELSE 
		VCLASSE := 'Adulto';
	END IF;
    -- Mostrar valores recuperados
    DBMS_OUTPUT.PUT_LINE('Nome: ' || VNOME);
    DBMS_OUTPUT.PUT_LINE('Idade: ' || VIDADE);
	DBMS_OUTPUT.PUT_LINE('Classe: ' || VCLASSE);
    
	EXCEPTION
    -- Tratamento das exceções
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Finalizando sem concluir...');
	END;
	 
	 
	/* AULA 17/10/2024 */
	/* Estrutura de repetições
		FOR | WHILE (LOOP) 
	 -> NUMERO DETERMINADO DE REPETIÇÕES -> FOR
		SINTAXE: FOR <variavel> IN <valor inicial> .. <valor final>
				LOOP
				-- INSTRUÇÕES PL/SQL E SQL
				END LOOP; */
				
	/* -> NUMERO INDERTEMINADO DE REPETIÇÕES DEPENDE DE UMA INFROMAÇÃO
		  SINTAXE: LOOP 
				-- INSTRUÇÃO PL/SQL E SQL 
				EXIT WHEN <condição> 
				END LOOP; */
				
	CREATE TABLE ALUNO 
	(ID_ALUNO NUMBER(5),
	 NOM_ALUNO VARCHAR2(40),
	 DTN_ALUNO DATE,
	 CONSTRAINT PK_ALUNO PRIMARY KEY(ID_ALUNO));
	 
	 /* EXEMPLO 
		BLOCO ANONIMO UTILIZANDO ESTRUTURA DE REPETIÇÃO */
		
	DECLARE 
	VI NUMBER(3);
		BEGIN
			VI := 1;
				LOOP
					INSERT INTO ALUNO VALUES (VI, 'Aluno' || VI, SYSDATE);
						VI := VI +1;
							EXIT WHEN VI > 20;
								END LOOP;
									END;
									
	DECLARE 
	VI NUMBER(3);
		BEGIN
			VI := 21;
				LOOP
					INSERT INTO ALUNO VALUES (VI, 'Aluno' || VI, SYSDATE);
						VI := VI +1;
							EXIT WHEN VI > 40;
								END LOOP;
									END;
									
	SELECT * FROM ALUNO; 
	
	/* BLOCO ANONIMO UTILIZANDO ESTRUTURA DE REPETIÇÃO (FOR) */
	
	DECLARE 
		VI NUMBER(3);
			BEGIN
				FOR VI IN 41 .. 60
					LOOP 
						INSERT INTO ALUNO VALUES ( VI, 'Aluno Pós' || VI, SYSDATE);
							END LOOP;
							END; 
							
	/* Gatilhos (Triggers) 
	Os gatilhos são programas PL/SQL que são executados a partir da ocorrencia de um evento disparador
	SINTAXE:
			CREATE [OR REPLACE] TRIGGER "nome do gatilho"
			-- quando sera executado: BEFORE | AFTER
			-- EVENTO disparador: INSERT | UPDATE | DELETE
			-- idenificar o evento disparador (quando necessario): INSERTING | UPDATING | DELETING
			-- ON "nome da tabela" 
			-- execução linha | statemant: linha a instrução PL/SQL sera executada linha  alinha( FOR EACH ROW)
									statement: trata-se de uma unica execução
			*/
	BEGIN
	-- instruções PL/SQL
	END;
	
	/* 24/10- Exemplo de declaração de um gatilho */
	CREATE OR REPLACE TRIGGER TESTE
	AFTER INSERT ON Aluno
	FOR EACH ROW
	BEGIN
	--instrução
	END;
				
	/*Exemplo de gatilho 
		1) gatilho para gerenciar backup online*/
		
	CREATE TABLE ALUNOBKP
		AS SELECT * FROM ALUNO;
	
	CREATE OR REPLACE TRIGGER ALUNOBKP
	AFTER INSERT OR UPDATE OR DELETE ON ALUNO
	FOR EACH ROW 
	BEGIN 
	IF INSERTING THEN 
		INSERT INTO ALUNOBKP(ID_ALUNO, NOM_ALUNO, DTN_ALUNO) VALUES(:NEW.ID_ALUNO, :NEW.NOM_ALUNO, :NEW.DTN_ALUNO);
	ELSIF UPDATING THEN
	UPDATE ALUNOBKP SET ID_ALUNO = :NEW.ID_ALUNO, NOM_ALUNO = :NEW.NOM_ALUNO, DTN_ALUNO = :NEW.DTN_ALUNO
	WHERE ID_ALUNO = :OLD.ID_ALUNO;
	ELSE
		DELETE ALUNOBKP WHERE ID_ALUNO = :OLD.ID_ALUNO;
	END IF;
	END;
	
	
	-- SHOW ERRORS
	/*UTILIZADO QUANDO SE DESEJA IDENTIFICAR QUAIS POSSIVEIS ERROS QUANDO O GATILHO É CRIADO COM ERROS DE COMPILAÇÃO*/
	
	INSERT INTO ALUNO VALUES(61, 'Arthur Vital Fontana', TO_DATE('06/06/2005', 'DD/MM/YYYY'));
	
	SELECT * FROM ALUNO;
	
	SELECT * FROM ALUNOBKP;
	
	UPDATE ALUNO SET NOM_ALUNO = 'Leila Rafael Mele' WHERE ID_ALUNO = 6;
	DELETE ALUNO WHERE ID_ALUNO = 3;
	
	SELECT * FROM ALUNO ORDER BY ID_ALUNO;
	SELECT * FROM ALUNOBKP ORDER BY ID_ALUNO;
	
	/*2) Gatilho para gerenciar auditoria na tabela ALUNO*/
	CREATE TABLE AUDITORIA_ALUNO
	(ID_AUDITORIA_ALUNO NUMBER(5),
	N_ID NUMBER(5),
	N_NOM_ALUNO VARCHAR2(40),
	N_DTN_ALUNO DATE,
	V_ID_ALUNO NUMBER(5),
	V_NOM_ALUNO VARCHAR2(40),
	V_DTN_ALUNO DATE,
	CONSTRAINT PK_AUDITORIA_ALUNO PRIMARY KEY(ID_AUDITORIA_ALUNO));
	
	CREATE SEQUENCE ID_AUDITORIA_ALUNO
	START WITH 1
	INCREMENT BY 1;
	
	CREATE OR REPLACE TRIGGER AUDIT_ALUNO
	AFTER INSERT OR UPDATE OR DELETE ON ALUNO
	FOR EACH ROW
	BEGIN
	INSERT INTO AUDITORIA_ALUNO VALUES (ID_AUDITORIA_ALUNO.NEXTVAL,
										:NEW.ID_ALUNO,
										:NEW.NOM_ALUNO,
										:NEW.DTN_ALUNO,
										:OLD.ID_ALUNO,
										:OLD.NOM_ALUNO,
										:OLD.DTN_ALUNO);
	END;
	
	INSERT INTO ALUNO(ID_ALUNO, NOM_ALUNO, DTN_ALUNO) VALUES(63, 'Joao Henrique CIT', TO_DATE('20/11/2003', 'DD/MM/YYYY'));
	
	UPDATE ALUNO SET NOM_ALUNO = 'Joao Henrique do CIT' WHERE ID_ALUNO = 63;
	
	INSERT INTO ALUNO(ID_ALUNO, NOM_ALUNO, DTN_ALUNO) VALUES(64, 'FRAGA FRAGADOR DE FRAGA', TO_DATE('10/01/2005', 'DD/MM/YYYY'));
	DELETE FROM ALUNO WHERE ID_ALUNO = 63;
	
	SELECT * FROM AUDITORIA_ALUNO;
	
	/*3) gatilho para registrar o conceito a partir de uma nota*/
	CREATE TABLE CONCURSO
	(NUM_CONCURSO NUMBER(4),
	NUM_INSCRITO NUMBER(5),
	NOT_CONCURSO NUMBER(3,1),
	RES_CONCURSO VARCHAR2(10),
	CONSTRAINT PK_CONCURSO PRIMARY KEY (NUM_CONCURSO, NUM_INSCRITO));
	
	/*Regra de negocio 
	Para estar aprovado o candidato precisa ter nota >= 7 */
	
	CREATE OR REPLACE TRIGGER RES_CONCURSO
	BEFORE INSERT OR UPDATE ON CONCURSO 
	FOR EACH ROW 
	BEGIN
	IF (:NEW.NOT_CONCURSO >= 7) THEN 
		:NEW.RES_CONCURSO := 'Aprovado';
	ELSE 
		:NEW.RES_CONCURSO := 'Reprovado';
	END IF;
	END;
	
	INSERT INTO CONCURSO (NUM_CONCURSO, NUM_INSCRITO, NOT_CONCURSO) VALUES (1,1,1);
	INSERT INTO CONCURSO (NUM_CONCURSO, NUM_INSCRITO, NOT_CONCURSO) VALUES (1,2,5);
	INSERT INTO CONCURSO (NUM_CONCURSO, NUM_INSCRITO, NOT_CONCURSO) VALUES (1,3,7);
	INSERT INTO CONCURSO (NUM_CONCURSO, NUM_INSCRITO, NOT_CONCURSO, RES_CONCURSO) VALUES (1,4,3,'Aprovado');
	
	SELECT * FROM CONCURSO;
	
	COMMIT;
