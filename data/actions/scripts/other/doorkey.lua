function onUse(cid, item, frompos, item2, topos)
    portafechada = 5105 -- coloque aqui o id da porta fechada
    portaaberta = 5106-- coloque aqui o id da porta aberta
    idkey = 2087 -- coloque aqui o id da key
    
    if item.itemid == idkey then
        if item2.itemid == portafechada then
            doTransformItem(item2.uid, portaaberta)
            addEvent(function() -- Adiciona um delay de 5 segundos (5000 milissegundos)
                doTransformItem(item2.uid, portafechada)
            end, 5000)
        elseif item2.itemid == portaaberta then
            doTransformItem(item2.uid, portafechada)
            addEvent(function() -- Adiciona um delay de 5 segundos (5000 milissegundos)
                doTransformItem(item2.uid, portaaberta)
            end, 5000)
        else
            doPlayerSendTextMessage(cid, 22, "Sorry, not possible.")
        end
    else
        doPlayerSendTextMessage(cid, 22, "Sorry, not possible.")
    end
    
    return 1
end
