-- data/npc/scripts/custom_npc.lua

-- Função chamada quando um jogador interage com o NPC
function onCreatureAppear(cid)
    doCreatureSay(cid, "Olá, aventureiro! Estou procurando ajuda. Você aceita uma missão?", TALKTYPE_SAY)
end

-- Função chamada quando um jogador responde ao NPC
function onCreatureSay(cid, type, msg)
    msg = string.lower(msg)

    if isInArray({"sim", "aceito", "quero", "ok"}, msg) then
        doCreatureSay(cid, "Ótimo! Aqui está sua missão: traga-me 5 cabeças de ratos!", TALKTYPE_SAY)
        setPlayerStorageValue(cid, 1009, 1) -- Define uma variável de armazenamento para acompanhar o progresso da missão
    elseif isInArray({"não", "recuso", "não quero", "cancelar"}, msg) then
        doCreatureSay(cid, "Ah, que pena. Se mudar de ideia, estarei aqui.", TALKTYPE_SAY)
    elseif getPlayerStorageValue(cid, 1009) == 1 and isInArray({"feito", "completei", "terminei"}, msg) then
        doCreatureSay(cid, "Ótimo trabalho! Você completou a missão. Volte sempre para mais desafios.", TALKTYPE_SAY)
        setPlayerStorageValue(cid, 1009, 2) -- Define a variável de armazenamento para indicar que a missão foi concluída
    end
end
