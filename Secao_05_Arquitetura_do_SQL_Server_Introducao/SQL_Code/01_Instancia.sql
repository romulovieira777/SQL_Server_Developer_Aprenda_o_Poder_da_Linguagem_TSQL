/*
Assunto : Instancia 

- Uma instalacao do executavel do mecanismo de banco de dados que e executado como servico no sistema operacional.

- Um servidor pode ter uma instancia ou varias instancias.

- Cada instancia trabalha de forma isolada, com seus banco de dados.

- Conexces sao feitas na instancias - Logon

- Para conectar e preciso:
  IP, 
  Porta, 
  Login/Senha ou Autenticacao Integrada.

- Gerenciamento e realizado pelo Configuration Manager

*/

Select @@servername , @@servicename 