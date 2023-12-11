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

# V3
Esse bloco PL/SQL parece lidar com a inserção de dados em uma tabela chamada `CLIENTE_RESUMO` e a atualização de uma coluna na tabela `CLIENTE_AGENDAMENTO`. Vamos analisar as principais partes do código:

1. **Declaração de Variável:**
   ```plsql
   resumo_value VARCHAR2(4000); -- Ou o tipo de dados adequado para o item P4_RESUMO
   ```
   Declaração de uma variável chamada `resumo_value`. O tipo de dados é VARCHAR2, com um tamanho máximo de 4000 caracteres (ou o tamanho adequado para o item `P4_RESUMO`). No entanto, a variável não é usada no restante do código.

2. **Bloco PL/SQL Principal:**
   ```plsql
   BEGIN
       IF :P4_RESUMO IS NOT NULL THEN
           -- Código executado se o item P4_RESUMO não for nulo
           INSERT INTO CLIENTE_RESUMO (
               ID_CLIENTE,
               RESUMO,
               USER_NAME,
               DATA
           ) VALUES (
               :P4_ID_CLIENTE,
               :P4_RESUMO,
               :APP_USER,
               SYSDATE
           );

           UPDATE CLIENTE_AGENDAMENTO SET PRIMEIRO_CONTATO = :P4_PRIMEIRO_CONTATO WHERE 
           ID_CLIENTE = :P4_ID_CLIENTE;
       ELSE
           -- Exibe uma mensagem se o item P4_RESUMO for nulo
           htp.p('O Resumo do cliente não pode ficar sem preencher!!!');
       END IF;
   END;
   ```
   - O código verifica se o valor do item `P4_RESUMO` não é nulo.
   - Se o valor não for nulo, ele executa uma inserção na tabela `CLIENTE_RESUMO`, utilizando valores dos itens `:P4_ID_CLIENTE`, `:P4_RESUMO`, `:APP_USER` e a data atual (`SYSDATE`).
   - Em seguida, realiza uma atualização na tabela `CLIENTE_AGENDAMENTO`, definindo o valor de `PRIMEIRO_CONTATO` com o valor de `:P4_PRIMEIRO_CONTATO`, onde o `ID_CLIENTE` é igual a `:P4_ID_CLIENTE`.
   - Se o valor do item `P4_RESUMO` for nulo, exibe uma mensagem indicando que o resumo do cliente não pode ficar sem preencher.

Lembre-se de adaptar o código conforme necessário para atender aos requisitos específicos do seu aplicativo APEX.
