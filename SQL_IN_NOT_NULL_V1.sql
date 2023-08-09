var item = apex.item("P4_RESUMO");

if (item.getValue() !== null && item.getValue() !== "") {
    // A validação passou, o valor não é nulo ou vazio
    // Realize ações adicionais aqui, se necessário
    apex.server.process('GET_MODAL_URL', {}, {
    dataType:'text',
    success:function(pUrl) {
        eval(pUrl)
    }
})
} else {
    // A validação falhou, o valor é nulo ou vazio
    // Exiba a mensagem de erro ou tome outras medidas apropriadas
    //alert("O Resumo do cliente não pode ficar sem preencher!!!");
}
