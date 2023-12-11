# APEX-SQK-JS-IS-NOT-NULL
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
