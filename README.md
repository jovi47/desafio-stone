# Primeira Etapa | Exercícios: Banco de Dados

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
* O arquivo schema, representa somente o schema, ou seja o script de criação de tabelas, triggers, etc... sem mock datas.
* O arquivo script, contém a consulta para retornar as entradas e saídas 
de todos os meses que possuírem transações naquele ano. 

<br>

# Segunda Etapa | Programação (buy_service) 

* [Regras aplicadas](#regras-aplicadas-no-desenvolvimento)


## Regras aplicadas no Desenvolvimento

* Utilizei a entrada de testes com 2 arquivos .json lidos pela minha função, onde 
um passa a lista de compras e o outro a lista de e-mails, assim já simulei uma espécie requisição HTTP, onde é um pequeno serviço que recebe um "request", retornando o map desejado.

### Tive várias dúvidas ao que realmente iria ser implementado, então vou levantar alguns pontos do meu pensamento

* Pensei em fazer uma API com todo o CRUD, entretanto não vi motivo de criar tantas coisas pra uma simples função. 
* Acredito que o peso/unidade/pacote do preço , afinal geralmente quando realizamos uma compra isso não importa muito já que compramos: 1 pacote de arroz, 3 bombons, 0.500 gramas de queijo, ja fica implicito na propria quantidade e na definição do preço, se tivessemos uma caixa de bombom, ela seria um Novo Item com seu próprio preço pelo pacote.
* O retorno da função está ocorrendo em centavos, mas facilmente poderia ser colocado em formato de BRL, ou qualquer Currency que fosse necessária, entretanto não parecia fazer sentido nesse caso específico.

## <a id="banco-de-dados" href="./buy_service\README.md">Como executar o código</a>
 * Configurações
 * Testando e Executando