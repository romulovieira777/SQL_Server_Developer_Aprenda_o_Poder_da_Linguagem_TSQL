-- Tarefas - Comandos DML

/*

1 - Média Aritmética.

Nas aulas dessa seção, vimos que somente com a instrução SELECT, é possível realizarmos operações matemáticas
simples e em alguns casos, e com o auxilio de outros comandos, algo mais complexo.

O seu desafio é: Com base nos 6 números apresentados abaixo, desenvolva uma instrução SELECT que apresente a 
média aritmética conforme resultado abaixo:


Com base nos números abaixo:
1, 2, 5, 6, 7, 9
Calcular a média aritmética 

Média
---------------------------------------
5.000000
*/
SELECT
	(1 + 2 + 5 + 6 + 7 + 9) / 6.0 AS Média
GO


/*

2 - Endereço Completo


Em certos processos de negócios, precisamos capturar o endereço de clientes e fornecedores para compor documentos
como nota fiscal, por exemplo.

Esse desafio consiste em você concatenar as informações separadas de um endereço contidas entre aspas simples abaixo
e apresentar em uma única informação conforme o resultado esperado.

Informações de um endereço:
'Rua'
'Conselheiro Furtado'
'No. 897'
'Ap 50 - Bloco A'
'Santa Efigênia'
'Capital'
'São Paulo'
'Cep: 01001-001'
 
Apresente os dados em um única informação.
 
Endereço
------------------------------------------------------------------------------------------------------
Rua Conselheiro Furtado, No. 897, Ap 50 - Bloco A - Santa Efigênia - Capital São Paulo- Cep: 01001-001

Obs: Se você conseguir apresentar os dados de endereço, sem alterar os conteúdos dos valores originais entre
aspas simples, você já apresentou um bom entendimento de concatenação.
*/
SELECT
	CONCAT(
		'Rua'
	  , ' '
	  , 'Conselheiro Furtado'
	  , ', '
	  , 'No. 897'
	  , ', '
	  , 'Ap 50 - Bloco A'
	  , ' - '
	  , 'Santa Efigênia'
	  , ' - '
	  , 'Capital'
	  , ' '
	  , 'São Paulo'
	  , ' - '
	  , 'Cep: 01001-001'
)
GO


/*

3 - Conhecendo os Fornecedores e os Produtos.

As próximas tarefas, vamos manipular dados a partir da tabela FORNECEDOR e PRODUTO dentro do esquema PRODUCAO.

Dados de fornecedores são importantes para a área de compras de uma empresa, para realizar os pedidos de produtos.
Monte uma instrução SELECT a partir da tabela FORNECEDOR e recupere os dados que permitem realizar a comunicação
com os fornecedores. Veja o resultado esperado.

Contato                        Telefone
------------------------------ ------------------------
Adolphi, Stephan               (171) 456-7890
Hance, Jim                     (100) 555-0111
Parovszky, Alfons              (313) 555-0109
...
Leoni, Alessandro              89.01.23.45
Teper, Jeff                    01.23.45.67
Walters, Rob                   (514) 567-890
 
(29 rows affected)

Obs: Os três pontos no meio do resultado significa que existem mais linhas entre as 3 linhas iniciais e as linhas
finais. Veja que o total de linhas apresentadas são 29;

*/
SELECT
	Contato
  , Telefone
FROM
	[FundamentosTSQL].[Producao].[Fornecedor]
GO


/*

4 - Agora a empresa deseja enviar formalmente para os fornecedores, os modelos de produtos que eles devem entregar.
Para isso a empresa deve enviar somente para os contatos dos fornecedores com o cargo Sales Representative
(Representante de Vendas). Para realizar esse envio, a empresa precisa de uma relação com o nome do contato e o 
endereço completo, conforme apresentado no resultado abaixo.

Destinatario                   Endereco
------------------------------ --------------------------------------------------------------------------------------------------------------
Parovszky, Alfons              1234 Oxford Rd., Ann Arbor USA - CEP:10026
Iallo, Lucio                   9012 King's Way, Manchester UK - CEP:10021
Keil, Kendall                  Viale Dante, 6789, Ravenna Italy - CEP:10015
Kleinerman, Christian          Brovallavägen 0123, Stockholm Sweden - CEP:10033
Clark, Molly                   6789 Prince Edward Parade Hunter's Hill, Sydney Australia - CEP:10030
Teper, Jeff                    Bat. B 2345, rue des Alpes, Annecy France - CEP:10010
 
(6 rows affected)
*/
SELECT
	Contato														AS Destinatario
  , CONCAT(Endereco, ', ', Cidade, ' ', Pais, ' - CEP:', Cep)	AS Endereco
FROM
	[FundamentosTSQL].[Producao].[Fornecedor]
WHERE
	Cargo = 'Sales Representative'
GO


/*
5 - A empresa mantém contatos com vários fornecedores.
Principalmente com os fornecedores do velho continente. Agora você precisa gerar um relatório para reunião da diretoria,
a relação de fornecedores da Germany e France (Alemanha e França). A apresentação do relatório deve ser igual ao resultado
abaixo.

RazaoSocial                              Contato                        Pais            Telefone
---------------------------------------- ------------------------------ --------------- ------------------------
Supplier ZPYVS                           Jain, Mukesh                   Germany         (010) 3456789
Supplier SVIYA                           Regev, Barak                   Germany         (069) 234567
Supplier TEGSC                           Brehm, Peter                   Germany         (04721) 1234
Supplier LVJUA                           Canel, Fabrice                 France          (1) 90.12.34.56
Supplier ZRYDZ                           Leoni, Alessandro              France          89.01.23.45
Supplier OAVQT                           Teper, Jeff                    France          01.23.45.67
 
(6 rows affected)
*/
SELECT
	RazaoSocial
  , Contato
  , Pais
  , Telefone
FROM
	[FundamentosTSQL].[Producao].[Fornecedor]
WHERE
	Pais IN ('Germany', 'France')
GO


/*
6 - A área de compras da empresa precisa saber a relação de Produtos do fornecedor Supplier VHQZD. Você deve montar uma
relação que apresente o nome dos produtos ativos, o preço atual do produto e o preço com 10% de desconto, conforme a
listagem abaixo.

NomeProduto                              PrecoUnitario         PrecoDesconto
---------------------------------------- --------------------- ---------------------------------------
Product KSBRM                            22,00                 19.800000
Product XYWBZ                            21,05                 18.945000
Product LQMGN                            17,00                 15.300000
 
(3 rows affected)
*/
SELECT
	NomeProduto
  , PrecoUnitario
  , PrecoUnitario - (PrecoUnitario * 0.10) AS PrecoDesconto
FROM
	[FundamentosTSQL].[Producao].[Produto]
WHERE
	iIDFornecedor = 2
AND
	Desativado = 0






/*
7 - Agora a empresa precisa cadastrar um novo Fornecedor. E para esse fornecedor, você terá que cadastrar um novo
Produto. Abaixo segue os dados do Fornecedor:

RazaoSocial                              Contato                        Cargo                          Endereco                                                     Cidade          Regiao          CEP        Pais            Telefone                 fax
---------------------------------------- ------------------------------ ------------------------------ ------------------------------------------------------------ --------------- --------------- ---------- --------------- ------------------------ ------------------------
Supplier ABCDE                           da Silva, Jose                 Purchasing Manager             01 Avenue Paulista                                           São Paulo       São Paulo       1000       BR              (11) 2788-0001           NULL
 
E os dados de Produto:

NomeProduto     iIDFornecedor iIDCategoria PrecoUnitario         Desativado
--------------- ------------- ------------ --------------------- ----------
Product ABCDE                 1            33,00                 0

Veja nos dados acima de Produto, que não tem a identificação do Fornecedor. Esse dado somente existirá após a inclusão
dos dados do Fornecedor.

Você precisa criar os comandos de INSERT para cada um dos conjuntos de dados acima e inseri-lós nas tabelas FORNECEDOR
e PRODUTO respectivamente.
*/
INSERT INTO [FundamentosTSQL].[Producao].[Fornecedor]
(
	RazaoSocial
  , Contato
  , Cargo
  , Endereco
  , Cidade
  , Regiao
  , Cep
  , Pais
  , Telefone
  , fax
)
VALUES
(
	'Supplier ABCDE'
  , 'da Silva, Jose'
  , 'Purchasing Manager'
  , '01 Avenue Paulista'
  , 'São Paulo'
  , 'São Paulo'
  , '1000'
  , 'BR'
  , '(11) 2788-0001'
  , NULL
)
GO


SELECT
	iIDFornecedor
FROM
	[FundamentosTSQL].[Producao].[Fornecedor]
WHERE
	RazaoSocial = 'Supplier ABCDE'
GO


INSERT INTO [FundamentosTSQL].[Producao].[Produto]
(
	NomeProduto
  , iIDFornecedor
  , iIDCategoria
  , PrecoUnitario
  , Desativado
)
VALUES
(
	'Product ABCDE'
  , 30
  , 1
  , 33
  , 0
)
GO


/*
8 - Os dados do Fornecedor e do Produto foram incluídos incorretamente. O nome do contato do fornecedor é Maria da Silva
e o preço unitário do produto é R$ 23,00.

Crie os comandos UPDATE para realizar as alterações nas tabelas FORNECEDOR e PRODUTO respectivamente. No final, faça os
comandos SELECT para ver os dados estão corretos.
*/
SELECT
	*
FROM
	[FundamentosTSQL].[Producao].[Fornecedor]
GO



UPDATE
	[FundamentosTSQL].[Producao].[Fornecedor]
SET
	Contato = 'da Silva, Maria'
WHERE
	iIDFornecedor = 30
GO


SELECT
	*
FROM
	[FundamentosTSQL].[Producao].[Fornecedor]
GO


SELECT
	*
FROM
	[FundamentosTSQL].[Producao].[Produto]
GO


UPDATE
	[FundamentosTSQL].[Producao].[Produto]
SET
	PrecoUnitario = 23.00
WHERE
	NomeProduto = 'Product ABCDE'
GO


SELECT
	*
FROM
	[FundamentosTSQL].[Producao].[Produto]
GO


/*
9 - Por fim, a empresa decidiu excluir o fornecedor e o produto.
Você terá que criar os comandos para excluir o Fornecedor e o Produto
*/
DELETE
	[FundamentosTSQL].[Producao].[Fornecedor]
WHERE
	RazaoSocial = 'Supplier ABCDE'
GO


SELECT
	*
FROM
	[FundamentosTSQL].[Producao].[Fornecedor]
GO


DELETE
	[FundamentosTSQL].[Producao].[Produto]
WHERE
	NomeProduto = 'Product ABCDE'
GO


SELECT
	*
FROM
	[FundamentosTSQL].[Producao].[Produto]
GO


/*
10 - Agora vamos para um desafio. Vamos utilizar a tabela PEDIDO que está no esquema VENDAS. Um desenvolvedor criou
um relatório a partir da consulta abaixo e com o seguintes resultado:

Select iIDPedido, 
       DataPedido, 
       year(DataPedido) as AnoPedido, 
       Shipname , 
       Shipaddress 
From Vendas.Pedido
GO
 
Result:
 
iIDPedido   DataPedido AnoPedido   Shipname                                 Shipaddress
----------- ---------- ---------------------------------------- ------------------------------------------------------------
10248       2006-07-04 2006        Ship to 85-B                             6789 rue de l'Abbaye
10249       2006-07-05 2006        Ship to 79-C                             Luisenstr. 9012
10250       2006-07-08 2006        Destination SCQXA                        Rua do Paço, 7890
...
11075       2008-05-06 2008        Ship to 68-A                             Starenweg 6789
11076       2008-05-06 2008        Ship to 9-A                              8901, rue des Bouchers
11077       2008-05-06 2008        Ship to 65-A                             7890 Milton Dr.
 
(830 rows affected)

Mas a diretoria precisa somente da relação dos pedidos realizados no ano de 2007. Você deverá realizar a alteração na
consulta acima para atender a condição de ano do pedido igual a 2007.

O resultado esperado deve ser semelhantes a relação abaixo:

iIDPedido   DataPedido shipname                                 shipaddress
----------- ---------- ---------------------------------------- ------------------------------------------------------------
10400       2007-01-01 Destination BBMRT                        4567 King George
10401       2007-01-01 Ship to 65-A                             7890 Milton Dr.
10402       2007-01-02 Destination FFXKT                        Kirchgasse 0123
...
10805       2007-12-30 Ship to 77-A                             1234 Jefferson Way Suite 2
10806       2007-12-31 Ship to 84-C                             5678, rue du Commerce
10807       2007-12-31 Destination XNLFB                        Via Monte Bianco 5678
 
(408 rows affected)
*/
SELECT
	iIDPedido
  , DataPedido
  , YEAR(DataPedido) AS AnoPedido
  , Shipname
  , Shipaddress 
FROM
	[FundamentosTSQL].[Vendas].[Pedido]
GO


SELECT
	iIDPedido
  , DataPedido
  , YEAR(DataPedido) AS AnoPedido
  , Shipname
  , Shipaddress 
FROM
	[FundamentosTSQL].[Vendas].[Pedido]
WHERE
	YEAR(DataPedido) = '2007'
GO
