-- Script do NPC

function onCreatureAppear(cid) -- Chamado quando o jogador se aproxima do NPC
    -- Verifica se o jogador tem o storageid 1000 igual a 0 (ainda não iniciou a conversa)
    if getPlayerStorageValue(cid, 1000) == 0 then
        doPlayerSetStorageValue(cid, 1000, 1) -- Define o storageid 1000 para 1
        doCreatureSay(cid, "Bem-vindo! Seu storageid foi definido para 1.", TALKTYPE_SAY)
    else
        doCreatureSay(cid, "Olá novamente! Seu storageid já foi iniciado.", TALKTYPE_SAY)
    end
end

function onCreatureDisappear(cid) -- Chamado quando o jogador se afasta do NPC
    -- Pode ser utilizado para realizar ações quando o jogador se afasta, se necessário
end

function onCreatureSay(cid, type, msg) -- Chamado quando o jogador fala com o NPC
    if msg == "finalizar" then
        doPlayerSetStorageValue(cid, 1000, 2) -- Define o storageid 1000 para 2
        doCreatureSay(cid, "Conversa finalizada. Seu storageid foi alterado para 2.", TALKTYPE_SAY)
    elseif msg == "adeus" then
        doPlayerSetStorageValue(cid, 1000, 3) -- Define o storageid 1000 para 3
        doCreatureSay(cid, "Até logo! Seu storageid foi alterado para 3.", TALKTYPE_SAY)
    end
end

function onCreatureChangeOutfit(cid) -- Chamado quando o jogador muda de aparência
    -- Pode ser utilizado para realizar ações quando o jogador muda de aparência, se necessário
end
