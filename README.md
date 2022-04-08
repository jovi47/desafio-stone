## Primeira Etapa | Exercícios: Banco de Dados

<!--ts-->
   * [DER](#DER)
   * [Regras aplicadas](#regras-aplicadas)
   * [Banco de Dados](#banco-de-dados)
<!--te-->

Com as informações que foram dadas, segue o DER(Diagrama Entidade Relacional)

<img id="DER" src="./Primeira Etapa - Banco de Dados\Diagrama.png" alt="" />
<p align="center">
    Utilizando PostgreSQL
</p>

## Regras aplicadas 

* Para efetuar transações, deve-se ter uma conta vinculada a uma entidade (obrigatoriamente).
* O campo documento representa qualquer um dos seguintes documentos: RG,CPF, CNPJ.
* Para transações de depósitos ou transferência é obrigatoriamente necessário que o campo destination_account_id seja preenchido, mesmo que o destinatário seja a própria conta.
* Foi definido que o banco irá realizar somente transações internas, não precisando de outras tabelas ou campos adicionais como código de outros bancos, etc… 
* O saldo das contas é ajustado por uma trigger function.

## <a id="banco-de-dados" href="./Primeira Etapa - Banco de Dados\">Banco de Dados</a>

* Cópia da base de dados é o arquivo dump.sql, com dados mock. 
* O arquivo schema, representa somente o schema sem mock datas.
* O arquivo script, contém a consulta para retornar as entradas e saídas 
de todos os meses que possuírem transações naquele ano. 



