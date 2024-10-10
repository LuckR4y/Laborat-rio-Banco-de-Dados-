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
