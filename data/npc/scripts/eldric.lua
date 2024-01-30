local storage = 45001

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local function greetCallback(cid)
    npcHandler.topic[cid] = 0
    return true
end

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end
  
    local player = Player(cid)

    if msgcontains(msg, "quest") then
        local storageValue = player:getStorageValue(PlayerStorageKeys.Quests.notasDeEldric)
        print('valor tem q ser negativo',storageValue)
        if storageValue < 0 then
            npcHandler:say("Would you like to start this quest?", cid)
            npcHandler.topic[cid] = 1
            return true
        elseif storageValue == 0 then
            npcHandler:say("Would you like to complete this quest?", cid)
            npcHandler.topic[cid] = 1
            return true
        else
            npcHandler:say("I have no more quests for you.", cid)
            npcHandler.topic[cid] = 0
            return true
        end
      
    elseif npcHandler.topic[cid] == 1 then
        if not msgcontains(msg, "yes") then
            npcHandler:say("Another time then.", cid)
            npcHandler.topic[cid] = 0
            return true
        end
        if player:getStorageValue(storageValue) < 0 then
            player:setStorageValue(storage, 0)
            print('valor tem q ser zero',storageValue)
            npcHandler:say("Cool. You have started the quest.", cid)
            player:addItem(2087,1)
            npcHandler.topic[cid] = 0
            return true
        end
        player:setStorageValue(storage, 2)
        npcHandler:say("Awesome. You have finished the quest.", cid)
        npcHandler.topic[cid] = 0
        return true
      
    end
    return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())