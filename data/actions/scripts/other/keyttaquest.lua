-- Script para uma porta fechada que pode ser aberta com um item específico

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local portaID = 5098 -- Substitua pelo ID da porta que você deseja controlar
    local itemID = 2087 -- Substitua pelo ID do item que abrirá a porta

    if itemEx.itemid == portaID and item.itemid == itemID then
        -- Verifica se o jogador está usando o item correto na porta certa
        doTransformItem(itemEx.uid, portaID + 1) -- Abre a porta
        doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN) -- Efeito ao abrir a porta
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você abriu a porta com sucesso!")
        return true
    else
        doPlayerSendCancel(cid, "Você não pode abrir esta porta.")
        return false
    end
end