USE Agenda
GO

INSERT INTO
	Contato
VALUES
	(1,'Jose da Silva', '(11) 2222-9999','1990-10-01','M')

SELECT
	* 
FROM
	Contato

INSERT INTO
	Contato (Numero, Nome, Telefone, Aniversario, Sexo) 
VALUES
	(2,'Maria da Silva', '(11) 3333-8888','1997-08-15', 'F')

SELECT * 
FROM Contato

INSERT INTO
	Contato (Telefone, Aniversario, Nome, Numero, Sexo) 
VALUES
	('(11) 4444-7777','1992-12-27' , 'Manuel da Silva', 3 , 'M')

SELECT
	* 
FROM
	Contato
