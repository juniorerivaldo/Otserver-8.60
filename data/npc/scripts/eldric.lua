local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local storage_1 = 45001

local function greetCallback(cid)
    local player = Player(cid)
    local storage = player:getStorageValue(storage_1)

    if storage < 0 then
        npcHandler:setMessage(MESSAGE_GREET, "Ola novato quer fazer uma {quest}? preciso de sua ajuda para recuperar um item...")
        return true
    elseif storage < 1 then
        npcHandler:setMessage(MESSAGE_GREET, "Ja encontrou minhas notas?")
        return true
    elseif storage == 1 then
        npcHandler:setMessage(MESSAGE_GREET, "Voce trouxe minhas notas {sim}?")
        return true
    elseif storage == 2 then
        npcHandler:setMessage(MESSAGE_GREET, "Bom dia caro aventureiro, como voce esta hoje?")
        return true
    end

end

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)
    local storage = player:getStorageValue(storage_1)

    -- starting quest
    if msgcontains(msg, "quest") and storage < 0 then
        npcHandler:say("Preciso que voce va até o subsolo da cidade para recuperar minhas notas, elas foram roubadas por algum mago! voce vai ? {sim}", cid)
        npcHandler.topic[cid] = 1

        -- starting quest yes/no reply from player
    elseif npcHandler.topic[cid] == 1 then
        if msgcontains(msg, "sim") then
            player:setStorageValue(storage_1, 0)
            npcHandler:say("Pegue essa chave para abrir a porta do covil, depois me devolva ela.", cid)
            player:addItem(2087,1)
            addEvent(function()
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Voce recebeu a chave do covil!'),1500)
        else
            npcHandler:say("Muito bem.", cid)
        end
        npcHandler.topic[cid] = 0

        -- if player has started but not finished quest yet
    elseif storage > 0 and storage < 3 then
        if msgcontains(msg, "sim") then
            if storage == 1 then
                player:addItem(2647, 1)
                player:addItem(2463, 1)
                player:setStorageValue(storage_1, 2)
                player:removeItem(2087,1)
                player:removeItem(1948,1)
                player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
                npcHandler:say("Voce merece essa recompensa", cid)
            elseif storage == 2 then
                npcHandler:say("Bom dia caro aventureiro, como voce esta hoje?", cid)
            end
        end

    end
    return true
end

local function onAddFocus(cid) npcHandler.topic[cid] = 0 end

local function onReleaseFocus(cid) npcHandler.topic[cid] = nil end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
