DECLARE
    resumo_value VARCHAR2(4000); -- Ou o tipo de dados adequado para o item P4_RESUMO
BEGIN
    -- Verifica se a validação passou e o item não é nulo
    IF :P4_RESUMO IS NOT NULL THEN
        -- Se a validação passou e o item não é nulo, execute o código
        INSERT INTO J7_CLIENTE_RESUMO (
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

        UPDATE J7_CLIENTE_AGENDAMENTO SET PRIMEIRO_CONTATO = :P4_PRIMEIRO_CONTATO WHERE 
        ID_CLIENTE = :P4_ID_CLIENTE;

    ELSE
        -- Caso contrário, exibe a mensagem de erro
        htp.p('O Resumo do cliente não pode ficar sem preencher!!!');
    END IF;
END;

