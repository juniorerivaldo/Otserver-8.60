function onUse(cid, item, frompos, item2, topos)

    portafechada = 5101 -- coloque aqui o id da porta fechada

    portaaberta = 5102 -- coloque aqui o id da porta aberta

    idkey = 2087 -- coloque aqui o id da key

    if item.itemid == idkey and item2.itemid == portafechada then

        doTransformItem(item2.uid, portaaberta)

    elseif item.itemid == idkey and item2.itemid == portaaberta then

        doTransformItem(item2.uid, portafechada)

    else

        doPlayerSendTextMessage(cid, 22, "Sorry, not possible.")

    end

    return 1

end
