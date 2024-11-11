/*	Arthur Vital Fontana- 839832
	Trabalho Prova Final
	Laboratório de Banco de Dados*/
	

--Criando as tabeas

	CREATE TABLE CLIENTE(
		cod_cliente NUMERIC PRIMARY KEY,
		nom_cliente VARCHAR(35),
		dtn_cliente DATE
	);
	
	CREATE TABLE AGENTE(
		cod_agente NUMERIC PRIMARY KEY,
		nom_agente VARCHAR(35),
		dta_agente DATE
	);
	
	CREATE TABLE CIDADE(
		cod_cidade NUMERIC PRIMARY KEY,
		nom_cidade VARCHAR (40),
		uf_cidade CHAR (2)
		);
		
	CREATE TABLE CLASSIFIC_HOTEL(
		id_classific_hotel INTEGER PRIMARY KEY,
		dsc_classificacao VARCHAR(15)
		);
		
	CREATE TABLE TELEFONE(
		cod_cliente NUMERIC,
		num_telefone NUMERIC,
		ddd_telefone NUMERIC,
	CONSTRAINT TELEFONE_PK PRIMARY KEY (num_telefone, ddd_telefone),
	CONSTRAINT TELEFONE_FK FOREIGN KEY (cod_cliente)
		REFERENCES CLIENTE (cod_cliente)
	);
	
	CREATE TABLE HOTEL(
		cod_hotel INTEGER PRIMARY KEY,
		id_classific_hotel INTEGER,
		nom_hotel VARCHAR(30),
		CONSTRAINT HOTEL_FK FOREIGN KEY (id_classific_hotel)
			REFERENCES CLASSIFIC_HOTEL (id_classific_hotel)
	);
	
	CREATE TABLE PACOTE(
		num_pacote NUMERIC PRIMARY KEY,
		cod_hotel INTEGER,
		cod_cidadeorig NUMERIC,
		cod_cidadedest NUMERIC,
		dti_pacote DATE,
		dtf_pacote DATE,
		vlr_pacot NUMERIC(6,2),
		CONSTRAINT PACOTE_HOTEL_FK FOREIGN KEY (cod_hotel)
			REFERENCES HOTEL (cod_hotel),
		CONSTRAINT PACOTE_CIDADE1_FK FOREIGN KEY (cod_cidadeorig)
			REFERENCES CIDADE (cod_cidade),
		CONSTRAINT PACOTE_CIDADE2_FK FOREIGN KEY (cod_cidadedest)
			REFERENCES CIDADE (cod_cidade)
	);
	
	CREATE TABLE CONTRATO_VIAGEM(
		num_contrato NUMERIC PRIMARY KEY,
		num_pacote NUMERIC,
		cod_cliente NUMERIC,
		cod_agente NUMERIC,
		dta_contrato DATE,
		pag_contrato CHAR (3),
		CONSTRAINT CONTRATO_PACOTE_FK FOREIGN KEY (num_pacote)
			REFERENCES PACOTE (num_pacote),
		CONSTRAINT CONTRATO_CLIENTE_FK FOREIGN KEY (cod_cliente)
			REFERENCES CLIENTE (cod_cliente),
		CONSTRAINT CONTRATO_AGENTE_FK FOREIGN KEY (cod_agente)
			REFERENCES AGENTE (cod_agente)
		);
		
--Inserindo os dados
		
	--Tabela AGENTE
	INSERT INTO AGENTE (cod_agente, nom_agente, dta_agente) 
	VALUES (1, 'Agente Edilson', TO_DATE('1988-01-01', 'YYYY-MM-DD'));
	
	INSERT INTO AGENTE (cod_agente, nom_agente, dta_agente) 
	VALUES (2, 'Agente Danilo', TO_DATE('1985-02-15', 'YYYY-MM-DD'));
	
	INSERT INTO AGENTE (cod_agente, nom_agente, dta_agente) 
	VALUES (3, 'Agente Carlos', TO_DATE('1990-03-10', 'YYYY-MM-DD'));
	
	--Tabela CLIENTE
	INSERT INTO CLIENTE (cod_cliente, nom_cliente, dtn_cliente) 
	VALUES (1, 'Arthur Vital Fontana', TO_DATE('2005-06-06', 'YYYY-MM-DD'));
	
	INSERT INTO CLIENTE (cod_cliente, nom_cliente, dtn_cliente) 
	VALUES (2, 'Rafael Mele Porto', TO_DATE('2005-01-12', 'YYYY-MM-DD'));
	
	INSERT INTO CLIENTE (cod_cliente, nom_cliente, dtn_cliente) 
	VALUES (3, 'João Henrique Nazar', TO_DATE('2004-04-27', 'YYYY-MM-DD'));
	
	--Tabela TELEFONE
	INSERT INTO TELEFONE (cod_cliente, num_telefone, ddd_telefone) 
	VALUES (1, 971206512, 16);
	
	INSERT INTO TELEFONE (cod_cliente, num_telefone, ddd_telefone) 
	VALUES (2, 976350142, 11);
	
	INSERT INTO TELEFONE (cod_cliente, num_telefone, ddd_telefone) 
	VALUES (3, 995364177, 16);	
	
	--Tabela CIDADE
	INSERT INTO CIDADE (cod_cidade, nom_cidade, uf_cidade) 
	VALUES (1, 'São Paulo', 'SP');
	
	INSERT INTO CIDADE (cod_cidade, nom_cidade, uf_cidade) 
	VALUES (2, 'Rio de Janeiro', 'RJ');
	
	INSERT INTO CIDADE (cod_cidade, nom_cidade, uf_cidade) 
	VALUES (3, 'Belo Horizonte', 'MG');
	
	--Tabela CLASSIFIC_HOTEL
	INSERT INTO CLASSIFIC_HOTEL (id_classific_hotel, dsc_classificacao)
	VALUES (1, '5 Estrelas');
	
	INSERT INTO CLASSIFIC_HOTEL (id_classific_hotel, dsc_classificacao)
	VALUES (2, '4 Estrelas');
	
	INSERT INTO CLASSIFIC_HOTEL (id_classific_hotel, dsc_classificacao)
	VALUES (3, '3 Estrelas');
	
	INSERT INTO CLASSIFIC_HOTEL (id_classific_hotel, dsc_classificacao)
	VALUES (4, '2 Estrelas');
	
	INSERT INTO CLASSIFIC_HOTEL (id_classific_hotel, dsc_classificacao)
	VALUES (5, '1 Estrelas');
	
	--Tabela HOTEL
	INSERT INTO HOTEL (cod_hotel, id_classific_hotel, nom_hotel)
	VALUES (1, 3, 'Hotel Santa Rosa');
	
	INSERT INTO HOTEL (cod_hotel, id_classific_hotel, nom_hotel) 
	VALUES (2, 1, 'Hotel Ribeirão Preto');
	
	INSERT INTO HOTEL (cod_hotel, id_classific_hotel, nom_hotel) 
	VALUES (3, 2, 'Hotel Batatais');
	
	--Tabela PACOTE
	INSERT INTO PACOTE (num_pacote, cod_hotel, cod_cidadeorig, cod_cidadedest, dti_pacote, dtf_pacote, vlr_pacot) 
	VALUES (1, 1, 1, 2, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-10', 'YYYY-MM-DD'), 5000.00);
	
	INSERT INTO PACOTE (num_pacote, cod_hotel, cod_cidadeorig, cod_cidadedest, dti_pacote, dtf_pacote, vlr_pacot) 
	VALUES (2, 2, 2, 3, TO_DATE('2025-06-06', 'YYYY-MM-DD'), TO_DATE('2025-06-25', 'YYYY-MM-DD'), 3000.00);
	
	INSERT INTO PACOTE (num_pacote, cod_hotel, cod_cidadeorig, cod_cidadedest, dti_pacote, dtf_pacote, vlr_pacot) 
	VALUES (3, 3, 3, 1, TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_DATE('2025-01-05', 'YYYY-MM-DD'), 7000.00);
	
	--Tabela CONTRATO_VIAGEM
	INSERT INTO CONTRATO_VIAGEM (num_contrato, num_pacote, cod_cliente, cod_agente, dta_contrato, pag_contrato) 
	VALUES (1, 1, 1, 1, TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'Deb');
	
	INSERT INTO CONTRATO_VIAGEM (num_contrato, num_pacote, cod_cliente, cod_agente, dta_contrato, pag_contrato) 
	VALUES (2, 2, 2, 2, TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'Cre');
	
	INSERT INTO CONTRATO_VIAGEM (num_contrato, num_pacote, cod_cliente, cod_agente, dta_contrato, pag_contrato) 
	VALUES (3, 3, 3, 3, TO_DATE('2024-07-01', 'YYYY-MM-DD'), 'Din');
	
	--Conferindo Tabelas 
	SELECT * FROM AGENTE;
	SELECT * FROM CLIENTE;
	SELECT * FROM TELEFONE;
	SELECT * FROM CIDADE;
	SELECT * FROM CLASSIFIC_HOTEL;
	SELECT * FROM HOTEL;
	SELECT * FROM PACOTE;
	SELECT * FROM CONTRATO_VIAGEM;
	
/* 1) (0.5 pontos) Construir um trigger de INSERT e UPDATE que não permita o registro de
um pacote de viagem em que a dtf_pacote seja menor que dti_pacote e exiba
retorne a mensagem de erro: “A data de encerramento deve ser maior ou igual à data
de início do pacote”. */

	CREATE OR REPLACE TRIGGER EXER1
	AFTER INSERT OR UPDATE ON PACOTE
	FOR EACH ROW 
	BEGIN 
	IF :NEW.dtf_pacote < :NEW.dti_pacote THEN
		RAISE_APPLICATION_ERROR(-20001, 'A data de encerramento deve ser maior ou igual à data de início do pacote');
	END IF;
	END;
	/
	
	--Testando o trigger
	INSERT INTO PACOTE (num_pacote, cod_hotel, cod_cidadeorig, cod_cidadedest, dti_pacote, dtf_pacote, vlr_pacot)
	VALUES (4, 1, 1, 2, TO_DATE('2024-11-14', 'YYYY-MM-DD'), TO_DATE('2024-11-10', 'YYYY-MM-DD'), 1500.00);
	
/* 2) (0.5 pontos) Criar uma function getQtdDias que receba duas datas (início e fim) e
retorne a quantidade de dias que represente o intervalo entre elas. Caso a data de
fim seja menor que a data de início retornar -1.*/

	CREATE OR REPLACE FUNCTION getQtdDias (Pdti_pacote in PACOTE.dti_pacote%TYPE, Pdtf_pacote in PACOTE.dtf_pacote%TYPE)
	RETURN NUMBER 
	IS
	QTD_DIAS NUMBER;
	BEGIN 
	IF
	Pdtf_pacote < Pdti_pacote THEN
	RETURN -1;
	ELSE 
	QTD_DIAS := Pdtf_pacote - Pdti_pacote;
	RETURN QTD_DIAS;
	END IF;
	END;
	/
	
	--Testando a function
	SELECT num_pacote, dti_pacote, dtf_pacote, getQtdDias(dti_pacote, dtf_pacote) AS QTD_DIAS from PACOTE;
	
/*3) (1.0 pontos) Construir um bloco anônimo que receba como parâmetro o código de
hotel e um código de cidade, retorne no console uma lista de pacotes considerando

o hotel passado como parâmetro e a cidade passada como parâmetro sendo cidade
de destino. Os dados a serem retornados são:
Número do Pacote
Nome do Hotel
Data Início
Data Fim
Qtd de dias
Valor
Nome da Cidade de Origem
Nome da Cidade de Destino*/

	SET SERVEROUTPUT ON;
	DECLARE 
		v_cod_hotel PACOTE.cod_hotel%TYPE := &COD_HOTEL;
		v_cod_cidade PACOTE.cod_cidadedest%TYPE := &COD_CIDADE;
	BEGIN
	FOR rec 
	IN (
	SELECT 
	P.num_pacote,
	H.nom_hotel,
	P.dti_pacote,
	P.dtf_pacote,
	(P.dtf_pacote - P.dti_pacote) AS QTD_DIAS,
	P.vlr_pacot,
	C.nom_cidade AS CIDADE_ORIGEM,
	CD.nom_cidade AS CIDADE_DESTINO
	FROM PACOTE P
	JOIN HOTEL H ON P.cod_hotel = H.cod_hotel
	JOIN CIDADE C ON P.cod_cidadeorig = C.cod_cidade
	JOIN CIDADE CD ON P.cod_cidadedest = CD.cod_cidade
	WHERE P.cod_hotel = v_cod_hotel
	AND P.cod_cidadedest = v_cod_cidade
	)
	LOOP
		DBMS_OUTPUT.PUT_LINE('===============================================================================');
		DBMS_OUTPUT.PUT_LINE('Número do Pacote: ' || rec.num_pacote);
		DBMS_OUTPUT.PUT_LINE('Nome do Hotel: ' || rec.nom_hotel);
		DBMS_OUTPUT.PUT_LINE('Data Início: ' || TO_CHAR(rec.dti_pacote, 'DD-MM-YYYY'));
		DBMS_OUTPUT.PUT_LINE('Data Fim: ' || TO_CHAR(rec.dtf_pacote, 'DD-MM-YYYY'));
		DBMS_OUTPUT.PUT_LINE('Quantidade de Dias: ' || rec.qtd_dias);
		DBMS_OUTPUT.PUT_LINE('Valor: ' || rec.vlr_pacot);
		DBMS_OUTPUT.PUT_LINE('Cidade Origem: ' || rec.CIDADE_ORIGEM);
		DBMS_OUTPUT.PUT_LINE('Cidade Destino: ' || rec.CIDADE_DESTINO);
		DBMS_OUTPUT.PUT_LINE('===============================================================================');
	END LOOP;
	END;
	/
	
	--Exemplo de entredas 
--	Informe o valor para cod_hotel: 1
--	Informe o valor para cod_cidade: 2
	
--	Informe o valor para cod_hotel: 2
--	Informe o valor para cod_cidade: 3
	
--	Informe o valor para cod_hotel: 3
--	Informe o valor para cod_cidade: 1
	
/*4) (0.5 pontos) Construir uma procedure updatePacote, que receba o código do
pacote e o percentual de reajuste. A rotina deverá efetuar a atualização do valor do
pacote obedecendo o percentual passado como parâmetro.*/

	CREATE OR REPLACE PROCEDURE updatePacote(
		p_cod_pacote IN PACOTE.num_pacote%TYPE,
		p_reajuste IN NUMBER
	) AS 
	BEGIN
	UPDATE PACOTE
	SET vlr_pacot = vlr_pacot *(1+ (p_reajuste / 100))
	WHERE num_pacote = p_cod_pacote;
	COMMIT;
	END;
	/
	
--Testando 
	EXEC updatePacote(1, 20);
	SELECT * FROM PACOTE;
--	Antigo: 5000
--	Novo: 6000
	
	EXEC updatePacote(2, 40);
	SELECT * FROM PACOTE;
--	Antigo: 3000
--	Novo: 4200

	EXEC updatePacote(3, 5);
	SELECT * FROM PACOTE;
--	Antigo: 7000
--	Novo: 7350

COMMIT;







	
	