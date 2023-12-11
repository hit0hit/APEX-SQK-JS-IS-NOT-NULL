# APEX-SQK-JS-IS-NOT-NULL
# V1
Este trecho de código JavaScript verifica se o valor do item `P4_RESUMO` não é nulo ou vazio. Se o valor atender a essas condições, ele aciona um processo no servidor chamado `GET_MODAL_URL`. Caso contrário, se o valor for nulo ou vazio, você pode adicionar a lógica para exibir uma mensagem de erro ou tomar outras medidas apropriadas.

Aqui está uma breve explicação passo a passo do código:

1. **Recuperação do Item:**
   ```javascript
   var item = apex.item("P4_RESUMO");
   ```
   - O código obtém o objeto correspondente ao item `P4_RESUMO` no Oracle APEX.

2. **Verificação do Valor:**
   ```javascript
   if (item.getValue() !== null && item.getValue() !== "") {
   ```
   - Verifica se o valor do item não é nulo e não é uma string vazia.

3. **Ações em Caso de Valor Válido:**
   ```javascript
   apex.server.process('GET_MODAL_URL', {}, {
       dataType: 'text',
       success: function (pUrl) {
           eval(pUrl);
       }
   });
   ```
   - Se o valor for válido, aciona o processo `GET_MODAL_URL` no servidor.

4. **Ações em Caso de Valor Inválido:**
   ```javascript
   } else {
       // Código para lidar com valor nulo ou vazio
       // Exemplo: alert("O Resumo do cliente não pode ficar sem preencher!!!");
   }
   ```
   - Caso o valor seja nulo ou vazio, aqui você pode adicionar código para exibir uma mensagem de erro ou tomar outras medidas necessárias.
# V2
Este código JavaScript verifica se o valor do item `P2_DATA_DE_AGENDAMENTO` não é nulo ou vazio. Se o valor atender a essas condições, ele utiliza a função `$.sendMessage(6)`. Caso contrário, se o valor for nulo ou vazio, exibe um alerta indicando que é necessário agendar uma data para enviar a mensagem.

Aqui está uma explicação passo a passo do código:

```javascript
// Obtém o objeto correspondente ao item P2_DATA_DE_AGENDAMENTO
var item = apex.item("P2_DATA_DE_AGENDAMENTO");

// Verifica se o valor do item não é nulo e não é uma string vazia
if (item.getValue() !== null && item.getValue() !== "") {
    // Se o valor for válido, chama a função $.sendMessage(6)
    $.sendMessage(6);
} else {
    // Se o valor for nulo ou vazio, exibe um alerta
    apex.message.alert("Necessário agendar uma data para enviar esta mensagem.");
}
```

Este código é uma maneira de garantir que uma data de agendamento esteja preenchida antes de enviar uma mensagem. Se a data estiver preenchida, ele chama `$.sendMessage(6)`, o que pode ser uma função personalizada definida em outro lugar no seu aplicativo APEX. Caso contrário, exibe um alerta indicando que a data de agendamento é necessária.

Se tiver mais alguma dúvida ou precisar de ajustes, estou à disposição!
