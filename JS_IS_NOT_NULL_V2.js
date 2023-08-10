javascript: var item = apex.item("P2_DATA_DE_AGENDAMENTO");
if (item.getValue() !== null && item.getValue() !== "") 
{ $.sendMessage(6) } 
else
{    apex.message.alert("Necessário agendar uma data para enviar esta mensagem."); }
