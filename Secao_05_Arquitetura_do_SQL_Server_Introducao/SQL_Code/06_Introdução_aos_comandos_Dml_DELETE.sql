USE
	Agenda
GO


SELECT
	*
FROM
	Contato
GO


INSERT INTO Contato (
	Numero, Nome, Telefone
)
VALUES (
	5, 'F$%%$$$', '(ab) 999999'
)
GO


SELECT
	*
FROM
	Contato
GO


DELETE FROM
	Contato
WHERE
	Numero = 5
GO


SELECT
	*
FROM
	Contato
GO


-- Cuidado sempre use o delete com a clausula WHERE

DELETE FROM
	Contato
GO


SELECT
	*
FROM
	Contato
GO
