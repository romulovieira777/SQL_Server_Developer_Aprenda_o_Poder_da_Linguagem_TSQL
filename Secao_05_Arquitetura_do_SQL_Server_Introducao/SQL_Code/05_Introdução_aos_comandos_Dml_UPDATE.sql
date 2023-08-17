USE
	Agenda
GO


SELECT
	*
FROM
	Contato
GO


INSERT INTO Contato (
	Numero, Nome, Telefone, Aniversario, Sexo
)
VALUES(
	40, 'eDDDUARDO', '(AB) 5555-8', '1097-01-31', 'X'
)


SELECT
	*
FROM
	Contato
GO


UPDATE
	Contato
SET
	Nome = 'Eduardo'
WHERE
	Numero = 40
GO


SELECT
	*
FROM
	Contato
GO


UPDATE
	Contato
SET
	Telefone = '(11) 5555-6666'
  , Aniversario = '1997-01-31'
WHERE
	Numero = 40
GO


/*
Cuidado nunca use o update sem o where
*/

UPDATE
	Contato
SET
	Sexo = 'M'
GO
