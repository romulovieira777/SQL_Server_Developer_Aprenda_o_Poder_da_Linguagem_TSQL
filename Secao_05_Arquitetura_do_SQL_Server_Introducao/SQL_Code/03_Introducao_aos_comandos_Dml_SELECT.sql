/*

SELECT - Recupera dados de uma tabela, 
         permite realizar tratamentos dos dados e retorna a informações 

*/


SELECT 1 

SELECT 1 + 2

SELECT 5 + 4 AS Resultado

SELECT 'Jose da Silva' AS Nome

SELECT 'Jose' + ' da ' + 'Silva' AS Nome

SELECT
	40
  , 'Jose da Silva ' 
  , '2017-08-09'

SELECT
	40					AS Idade
  , 'Jose da Silva '	AS Nome
  , '2017-08-09'		AS DataAtual

SELECT 10 + ' Jose '

SELECT 10 + ' 40'

SELECT Jose + 10

SELECT 10 + 5 * 2  AS Resultado

SELECT (10 + 5) * 2 AS Resultado



-- Forma mais simples do SELECT com pesquisa em tabelas.

USE FundamentosTSQL
GO

SELECT
	*
FROM
	Vendas.Cliente

-- Selecionando as colunas

SELECT
	RazaoSocial
  , Endereco
  , CEP
FROM
	Vendas.Cliente

SELECT
	CEP
  , Endereco
  , RazaoSocial 
FROM
	Vendas.Cliente

-- Incluir alias ou apelido no nome das colunas 

SELECT
	RazaoSocial AS Empresa
  , Endereco	AS Local
  , CEP			AS CodigoPostal 
FROM
	Vendas.Cliente

-- Realizar operações de concatenação ou matemáticas

SELECT
	RazaoSocial
  , Endereco + ', ' + Cidade + ', ' + CEP AS Endereco 
FROM
	Vendas.Cliente

SELECT
	PrimeiroNome + ' ' + UltimoNome AS Nome
  , Cargo
  , Salario / 12 * 3				AS SalarioMensal 
FROM
	Rh.Empregado

-- Organizando o código para uma melhor leitura. 

SELECT
	RazaoSocial AS Empresa
  , Endereco	AS Local
  , CEP			AS CodigoPostal 
FROM
	Vendas.Cliente

/*
Filtrando linhas 
*/

-- Apresentado apenas um cliente
SELECT
	* 
FROM
	Vendas.Cliente
 WHERE
	iIDCliente = 1

-- Apresentando os clientes do Pais Brazil.

SELECT
	* 
FROM
	Vendas.Cliente
WHERE
	Pais = 'Brazil' 

-- Monstrando os Empregados com salario menor que 50.000 anual 

SELECT
	*
FROM
	rh.Empregado
WHERE
	Salario < 50000

-- Apresentando os Clientes do Pais Brazil e do estado do Rio de Janeiro 

SELECT
	* 
FROM
	Vendas.Cliente
WHERE
	Pais = 'Brazil' 
AND
	Cidade = 'Rio de Janeiro'

-- Mostrar todos os pedidos solicitado em 2006!!

SELECT
	*
FROM
	Vendas.Pedido
WHERE
	DataPedido >= '2006-01-01' 
AND
	DataPedido <= '2007-01-01'

-- Mostrar os Pedidos enviados para o Rio de Janeiro e Sao Paulo.

SELECT
	*
FROM
	Vendas.Pedido
WHERE
	shipCidade = 'Rio de Janeiro' 
OR
	shipCidade = 'Sao Paulo'

-- Ordernar os resultados

SELECT
	RazaoSocial
  , Contato
  , Pais
  , Cidade 
FROM
	Vendas.Cliente
ORDER BY
	Pais

SELECT
	RazaoSocial
  , Contato
  , Pais
  , Cidade 
FROM
	Vendas.Cliente
ORDER BY
	Pais
  , Cidade 

SELECT
	PrimeiroNome + ' '+  UltimoNome AS Nome
  , Cargo
  , DataAdmissao 
FROM
	rh.Empregado
ORDER BY
	PrimeiroNome

SELECT
	PrimeiroNome + ' ' + UltimoNome AS Nome
  , Cargo
  , DataAdmissao 
FROM
	rh.Empregado
ORDER BY
	Nome

SELECT
	PrimeiroNome + ' '+ UltimoNome AS Nome
  , Cargo
  , DataAdmissao 
FROM
	rh.Empregado
ORDER BY
	1

 -- Selecionando dados Distintos e Agrupando os dados e gerando novos valores.

SELECT
	Cidade  
FROM
	Vendas.Cliente

 SELECT
	DISTINCT Cidade  
FROM
	Vendas.Cliente

SELECT
	Cidade
  , COUNT(*) AS TotalClientes
FROM
	Vendas.Cliente
GROUP BY
	Cidade 

SELECT
	Cidade
  , COUNT(*) AS TotalClientes
FROM
	Vendas.Cliente
GROUP BY
	Cidade 
ORDER BY
	TotalClientes DESC

SELECT
	Cidade
  , COUNT(*) AS TotalClientes
FROM
	Vendas.Cliente
GROUP BY
	Cidade 
HAVING
	COUNT(*) >= 2
ORDER BY
	TotalClientes DESC
