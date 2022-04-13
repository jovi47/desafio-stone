# Buy Service

## Configurando

  * [Baixe o Elixir, clicando Aqui!](https://elixir-lang.org/install.html)
  * Conclua a instalação do elixir, e suas dependencias.
  * Baixe esse projeto
  * Entre na pasta buy_service
  * Abra algum terminal de uma prefêrencia(shell, prompt, git bash, vim, etc)
  * [Testando e executando](#testando-e-executando)

## Testando e Executando

### Digite os seguintes comandos na ordem recomendada 
```cmd
 mix deps.get
 mix compile 
```

### Para executar os testes utilize o segundo comando 

```cmd
 mix test
```
### Para executar o código
```cmd
 iex -S mix
 Digite/ Copie e cole esse comando: BuyService.apportion_payment_based_on_buys("./test/mocks/emails.json","./test/mocks/buys.json")
 Veja o retorno da função no seu terminal. :)
```

### Testes a implementar

 - [ ] Caso as chaves não existam no JSON
 - [ ] Caso o valor não seja inteiro
 - [ ] Caso o valor seja negativo