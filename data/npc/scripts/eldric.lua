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

    if msgcontains(msg, 'mission') then
        if player:getStorageValue(PlayerStorageKeys.Quests.eldricNotes) == -1 then
            npcHandler:say({
                'Oh, obrigado deuses por encontrar esse aventureiro. ...',
                'preciso de sua ajuda para resgatar minhas notas que foram roubadas pelo mago!'
            }, cid)
            npcHandler.topic[cid] = 2
        elseif player:getStorageValue(PlayerStorageKeys.Quests.eldricNotes) == 1 then
            npcHandler:say(
                'va até o subsolo e encontre o covil do mago, e me traga a minha nota que esta escondida la.',
                cid)
        elseif player:getStorageValue(PlayerStorageKeys.Quests.eldricNotes) == 2 then
            local itemId = {2150, 2149, 2147, 2146}
            for i = 1, #itemId do player:addItem(itemId[i], 1) end
            player:setStorageValue(PlayerStorageKeys.Quests.eldricNotes, 3)
            npcHandler:say(
                'voce conseguiu achar minha nota, muito obrigado nobre aventureiro!',
                cid)
        else
            npcHandler:say('volte com minha nota o mais rapido possivel.', cid)
        end

        -- Move this block outside the condition
        player:addItem(2087, 1)
        player:setStorageValue(PlayerStorageKeys.Quests.eldricNotes, 1)
        npcHandler:say({
            'PEGUE esta chave para acessar os aposentos do mago.'
        }, cid)
        npcHandler.topic[cid] = 0

    else
        npcHandler:say(
            'Then the downfall of Carlin is inescapable. Please think about it. You know where to find me.',
            cid)
        npcHandler.topic[cid] = 0
    end

    return true
end

npcHandler:setMessage(MESSAGE_GREET,
                      "bem vindo aventureiro, gostaria de uma missao ? me responda com {{mission}} para saber mais.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Ate breve.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Ate breve.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
