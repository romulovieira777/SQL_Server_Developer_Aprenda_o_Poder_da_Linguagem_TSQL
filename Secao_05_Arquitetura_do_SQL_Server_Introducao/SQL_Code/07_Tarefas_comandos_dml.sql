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
	Producao.Fornecedor
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
	Producao.Fornecedor
WHERE
	Cargo = 'Sales Representative'
GO