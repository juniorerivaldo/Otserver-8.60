local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end

    local player = Player(cid)

    npcHandler.topic[cid] = 1
    if msgcontains(msg, 'mission') then
        if player:getStorageValue(PlayerStorageKeys.TibiaTales.teste) == -1 then
            npcHandler:say({
                'Ótimo! Aqui está sua missão. Traga-me o item especial.'
            }, cid)
            npcHandler.topic[cid] = 2
        elseif player:getStorageValue(PlayerStorageKeys.TibiaTales.teste) == 1 then
            npcHandler:say(
                'Você ainda não conseguiu o item. Continue procurando!', cid)
        elseif player:getStorageValue(PlayerStorageKeys.TibiaTales.teste) == 2 then
            local itemID = 2347
            local itemCount = getPlayerItemCount(cid, itemID)

            if itemCount > 0 then
                doPlayerRemoveItem(cid, itemID, itemCount)
                player:setStorageValue(PlayerStorageKeys.TibiaTales.teste, 3)
                npcHandler:say('Você conseguiu o item. Obrigado.', cid)
            else
                npcHandler:say(
                    'Você não possui o item necessário. Continue procurando!',
                    cid)
            end
        else
            npcHandler:say(
                'Você não está atualmente em uma missão válida.', cid)
        end

        if npcHandler.topic[cid] == 1 then
            -- Descomente a linha abaixo se desejar adicionar um item
            -- player:addItem(8205, 1)
            player:setStorageValue(PlayerStorageKeys.TibiaTales.teste, 1)
            npcHandler:say({
                'Eu sabia que podia contar com você. Tome este veneno para pragas altamente intensificado. Na minha visão, vi uma espécie de \'poça\' de onde essas criaturas surgiam. ...',
                'Derrame o veneno na água para impedir o declínio de Carlin. Fale comigo sobre sua missão depois de cumprir sua tarefa.'
            }, cid)
        end
    end
end

npcHandler:setMessage(MESSAGE_GREET,
                      "Olá nobre, diga 'mission' para iniciar?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
