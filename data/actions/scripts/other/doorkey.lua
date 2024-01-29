function onUse(cid, item, frompos, item2, topos)
    portafechada = 5105 -- coloque aqui o id da porta fechada
    portaaberta = 5106 -- coloque aqui o id da porta aberta
    idkey = 2087 -- coloque aqui o id da key

    if item.itemid == idkey then
        if item2.itemid == portafechada then
            addEvent(doTransformItem, 2000, item2.uid, portaaberta) -- Aguarda 2000 milissegundos (2 segundos) antes de transformar a porta
        elseif item2.itemid == portaaberta then
            addEvent(doTransformItem, 2000, item2.uid, portafechada) -- Aguarda 2000 milissegundos (2 segundos) antes de transformar a porta
        else
            doPlayerSendTextMessage(cid, 22, "Sorry, not possible.")
        end
    end

    return 1
end
