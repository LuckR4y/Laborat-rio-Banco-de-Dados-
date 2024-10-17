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
	
	/* Exemplo de declaração de um gatilho */
	CREATE OR REPLACE TRIGGER TESTE
	AFTER INSERT ON Aluno
	FOR EACH ROW
	BEGIN
	--instrução
	END;
			
