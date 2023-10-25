-- Tarefas - Comandos DML - Respostas.
1.

Select (1+2+5+6+7+9)/6.0 as Média 

2.

Select 'Rua'+
       ' Conselheiro Furtado' +
       ', No. 897'+
       ', Ap 50 - Bloco A'+
       ' - Santa Efigênia'+
       ' - Capital'+
       ' São Paulo'+
       '- Cep: 01001-001' as Endereço
3.

Select Contato, Telefone From Producao.Fornecedor

4.

Select Contato as Destinatario, 
       Endereco+', '+Cidade+' '+Pais+' - CEP:'+ Cep as Endereco
  From Producao.Fornecedor
 Where Cargo = 'Sales Representative'

5.

Select RazaoSocial, 
       Contato, 
       Pais, 
       Telefone 
  From Producao.Fornecedor 
 Where Pais in ('Germany','France')

6.

Select NomeProduto, 
       PrecoUnitario , 
	   PrecoUnitario - (  PrecoUnitario*0.10) as PrecoDesconto 
  From Producao.Produto 
 Where iIDFornecedor = 2 and Desativado = 0 

7.

Insert into Producao.Fornecedor
(RazaoSocial,Contato,Cargo,Endereco,Cidade,Regiao,Cep,Pais,Telefone)
Values
('Supplier ABCDE','da Silva, Jose','Purchasing Manager','01 Avenue Paulista','São Paulo','São Paulo','1000','BR','(11) 2788-0001')
Para incluir o produto, você deve ter o iIDFornecedor do fornecedor que foi incluído.

Select iIDFornecedor 
  From Producao.Fornecedor 
 Where RazaoSocial = 'Supplier ABCDE'
 
iIDFornecedor
-------------
30
Insert Into Producao.Produto
(NomeProduto,iIDFornecedor,iIDCategoria,PrecoUnitario,Desativado)
Values
('Product ABCDE',30,1,33,0)

8.

Update Producao.Fornecedor 
   Set Contato = 'da Silva, Maria' 
 Where RazaoSocial = 'Supplier ABCDE'
GO
 
Update Producao.Produto
   Set PrecoUnitario = 23
 Where NomeProduto = 'Product ABCDE'
GO

9.

Delete Producao.Produto
 Where NomeProduto = 'Product ABCDE'
GO
 
Delete Producao.Fornecedor 
 Where RazaoSocial = 'Supplier ABCDE'
GO

/*
Se você tentou fazer a exclusão primeiro do Fornecedor, você deve ter recebido um mensagem igual a essa:

The DELETE statement conflicted with the REFERENCE constraint "FK_Produto_Fornecedor". The conflict occurred in database "FundamentosTSQL", 
table "Producao.Produto", column 'iIDFornecedor'.
*/
10.

Select iIDPedido, 
       DataPedido, 
	   year(DataPedido) as AnoPedido, 
	   Shipname , 
	   Shipaddress 
  From Vendas.Pedido
 Where year(datapedido) = 2007