/*	Arthur Vital Fontana- 839832
	Trabalho Prova Parcial
	Laboratório de Banco de Dados*/

/*1. (0.25 ponto) Desenvolver um script para criar um usuário (o nome do usuário deve ser
EXERCICIOcódigo), definindo a tablespace default e a temporária e atribuir o direito
de administrador de banco de dados (DBA) ao usuário criado anteriormente. */

CREATE USER EXERCICIO839832 
  IDENTIFIED BY 'Senha' 
  	DEFAULT TABLESPACE TABELA_DEFAULT 
  		TEMPORARY TABLESPACE TEMP_DEFAULT 
  			PROFILE DEFAULT 
  				ACCOUNT UNLOCK;

GRANT DBA TO EXERCICIO839832

/*2. (0.50 ponto) Considerando o Modelo Entidade Relacionamento apresentado na Figura
1, baseado no Dicionário de Dados e no Modelo Entidade Relacionamento,
desenvolver os scripts para criar as tabelas, definindo chaves primárias e chaves
estrangeiras, a validação de atributos não nulos e as restrições possíveis.*/

CREATE TABLE CONDOMINIO ( 
    cod_condominio INTEGER PRIMARY KEY, 
    nom_condominio VARCHAR(40) NOT NULL, 
    cnpj_condominio VARCHAR(14) NOT NULL, 
    end_condominio VARCHAR(40), 
    bai_condominio VARCHAR(25), 
    cep_condominio VARCHAR (8), 
    cid_condominio VARCHAR(35), 
    uf_condominio CHAR(2) 
);

CREATE TABLE APARTAMENTO ( 
    num_apartamento NUMERIC(4), 
    cod_condominio INTEGER, 
    nom_respons_apartamento VARCHAR(40) NOT NULL,  
    rg_respons_aparmtamento VARCHAR(12) NOT NULL,  
    cpf_respons_apartamento VARCHAR(14) NOT NULL,  
    dtn_respons_apartamento DATE, 
    CONSTRAINT APARTAMENTO_PK PRIMARY KEY(num_apartamento, cod_condominio), 
    CONSTRAINT APARTAMENTO_FK FOREIGN KEY(cod_condominio) 
    	REFERENCES CONDOMINIO(cod_condominio) 
);

CREATE TABLE TELEFONE ( 
    ddd_telefone VARCHAR(2), 
    num_telefone VARCHAR(10), 
    cod_condominio INTEGER, 
    num_apartamento NUMERIC(4), 
    CONSTRAINT TELEFONE_PK PRIMARY KEY(ddd_telefone, num_telefone), 
    CONSTRAINT TELEFONE_FK FOREIGN KEY(cod_condominio,num_apartamento) 
    	REFERENCES APARTAMENTO(cod_condominio,num_apartamento) 
 
);

CREATE TABLE BANCO( 
    cod_banco INTEGER PRIMARY KEY, 
    nom_banco VARCHAR(30) NOT NULL 
);

CREATE TABLE CONTA_CORRENTE ( 
    num_cc VARCHAR(8), 
    num_agencia_cc VARCHAR(6), 
    nom_gerente_cc VARCHAR(35), 
    cod_banco INTEGER, 
    cod_condominio INTEGER, 
    CONSTRAINT CC_PK PRIMARY KEY (num_cc, num_agencia_cc), 
    CONSTRAINT CC_FK_BANCO FOREIGN KEY (cod_banco) 
        REFERENCES BANCO(cod_banco), 
    CONSTRAINT CC_FK_CONDOMINIO FOREIGN KEY (cod_condominio) 
        REFERENCES CONDOMINIO(cod_condominio) 
);

/*3. (0.25 ponto) Elaborar um script para alterar a tabela CONTA_CORRENTE
adicionando dois novos atributos, sendo eles dta_aberta_cc, que será do tipo date e
vlr_limite_cc, que será do tipo number(10,2).*/

ALTER TABLE CONTA_CORRENTE  
	ADD dta_aberta_cc DATE;

ALTER TABLE CONTA_CORRENTE  
	ADD vlr_limite_cc NUMBER(10,2);
	
/*4. (0.50 ponto) Desenvolver os scripts necessários para inserir 2 registros em cada
estruturas.*/

INSERT INTO CONDOMINIO (cod_condominio, nom_condominio, cnpj_condominio, end_condominio, bai_condominio, cep_condominio, cid_condominio,  uf_condominio) 
	VALUES(1, 'Condominio SRV', '51920277000173', 'Rua Tereza Rossetti Galão', 'Morumbi', '14270000', 'Santa Rosa de Viterbo', 'SP');

INSERT INTO CONDOMINIO (cod_condominio, nom_condominio, cnpj_condominio, end_condominio, bai_condominio, cep_condominio, cid_condominio,  uf_condominio) 
	VALUES(2, 'Condominio Batatais', '92340840000111', 'Rua Doutor Manoel Alves Pereira', 'Primavera', ' 1430201', 'Batatais', 'SP');

INSERT INTO CONDOMINIO (cod_condominio, nom_condominio, cnpj_condominio, end_condominio, bai_condominio, cep_condominio, cid_condominio,  uf_condominio) 
	VALUES(3, 'Condominio Spot', '69358772000104', 'Rua Alfredo Benzoni', 'Iguatemi', ' 1409152', 'Ribeirão Preto', 'SP');

SELECT * FROM CONDOMINIO;

INSERT INTO APARTAMENTO (num_apartamento, cod_condominio, nom_respons_apartamento, rg_respons_aparmtamento, cpf_respons_apartamento, dtn_respons_apartamento) 
    VALUES (101, 1, 'Arthur Vital Fontana', '213185660', '87492955006', TO_DATE('2005-06-06', 'YYYY-MM-DD'));

INSERT INTO APARTAMENTO (num_apartamento, cod_condominio, nom_respons_apartamento, rg_respons_aparmtamento, cpf_respons_apartamento, dtn_respons_apartamento) 
    VALUES (425, 2, 'Rafael Leila', '456228731', '54225603024', TO_DATE('2005-01-12', 'YYYY-MM-DD'));

INSERT INTO APARTAMENTO (num_apartamento, cod_condominio, nom_respons_apartamento, rg_respons_aparmtamento, cpf_respons_apartamento, dtn_respons_apartamento) 
    VALUES (003, 3, 'João CTI Henrique', '412066841', '33131220007', TO_DATE('2004-04-27', 'YYYY-MM-DD'));

SELECT * FROM APARTAMENTO;

INSERT INTO TELEFONE(ddd_telefone, num_telefone, cod_condominio, num_apartamento) 
	VALUES ('16', '1683837371', 1, 101);

INSERT INTO TELEFONE(ddd_telefone, num_telefone, cod_condominio, num_apartamento) 
	VALUES ('16', '4254602618', 2, 425);

INSERT INTO TELEFONE(ddd_telefone, num_telefone, cod_condominio, num_apartamento) 
	VALUES ('16', '8447118814', 3, 003);

SELECT * FROM TELEFONE;

INSERT INTO BANCO(cod_banco, nom_banco) 
	VALUES (1, 'NUBANK');

INSERT INTO BANCO(cod_banco, nom_banco) 
	VALUES (2, 'SANTANDER');

INSERT INTO BANCO(cod_banco, nom_banco) 
	VALUES (3, 'BABCO DO BRASIL');

SELECT * FROM BANCO;

INSERT INTO CONTA_CORRENTE(num_cc, num_agencia_cc, nom_gerente_cc, cod_banco, cod_condominio) 
	VALUES('123219-3', '1162', 'Zayah Fiorni', 1, 1 );

INSERT INTO CONTA_CORRENTE(num_cc, num_agencia_cc, nom_gerente_cc, cod_banco, cod_condominio) 
	VALUES('126975-4', '2360', 'Boris Mele Porto', 2, 2 );

INSERT INTO CONTA_CORRENTE(num_cc, num_agencia_cc, nom_gerente_cc, cod_banco, cod_condominio) 
	VALUES('124518-4', '1660', 'Bela Tavares', 3, 3 );

SELECT * FROM CONTA_CORRENTE;

/*5. (0.25 ponto) Script para alterar o nome do responsável para caixa alta de todos os
apartamentos que o nome do responsável contenha 'SILVA'.*/

UPDATE APARTAMENTO  
	SET nom_respons_apartamento = UPPER(nom_respons_apartamento) 
		WHERE nom_respons_apartamento LIKE '%SILVA%';
		
/*6. (0.25 ponto) - Recuperar os dados do apartamento (Número do apartamento, nome
responsável, cpf responsável) e um telefone de contato caso exista (DDD, número) para
um determinado condomínio informado por parâmetro.*/

SELECT A.num_apartamento, A.nom_respons_apartamento, A.cpf_respons_apartamento, N.ddd_telefone, N.num_telefone 
    FROM APARTAMENTO A 
		JOIN TELEFONE N ON A.cod_condominio = N.cod_condominio 
    		JOIN CONDOMINIO C ON A.cod_condominio = C.cod_condominio 
    			WHERE C.nom_condominio = 'Condominio SRV';

SELECT A.num_apartamento, A.nom_respons_apartamento, A.cpf_respons_apartamento, N.ddd_telefone, N.num_telefone 
    FROM APARTAMENTO A 
		JOIN TELEFONE N ON A.cod_condominio = N.cod_condominio 
    		JOIN CONDOMINIO C ON A.cod_condominio = C.cod_condominio 
    			WHERE C.nom_condominio = 'Condominio Batatais';

SELECT A.num_apartamento, A.nom_respons_apartamento, A.cpf_respons_apartamento, N.ddd_telefone, N.num_telefone 
    FROM APARTAMENTO A 
		JOIN TELEFONE N ON A.cod_condominio = N.cod_condominio 
    		JOIN CONDOMINIO C ON A.cod_condominio = C.cod_condominio 
    			WHERE C.nom_condominio = 'Condominio Spot';
				
/*7. (0.25 ponto) - Recuperar a quantidade de apartamentos por condomínio (Código do
condomínio, nome e quantidade de apartamentos).*/

SELECT C.cod_condominio, C.nom_condominio, COUNT(A.num_apartamento) AS quantidade_de_partamentos 
	FROM CONDOMINIO C 
		JOIN APARTAMENTO A ON C.cod_condominio = A.cod_condominio 
    		GROUP BY  C.cod_condominio, C.nom_condominio
    			ORDER BY 
    				C.cod_condominio;

/*8. (0.25 ponto) - Recuperar as informações dos 10 maiores condomínios (Código do
condomínio, nome, quantidade de apartamentos).*/

SELECT C.cod_condominio, C.nom_condominio, COUNT(A.num_apartamento) AS quantidade_de_partamentos 
	FROM CONDOMINIO C 
		JOIN APARTAMENTO A ON C.cod_condominio = A.cod_condominio 
			GROUP BY C.cod_condominio, C.nom_condominio 
				ORDER BY quantidade_de_partamentos DESC 
					FETCH FIRST 10 ROWS ONLY;

COMMIT;
