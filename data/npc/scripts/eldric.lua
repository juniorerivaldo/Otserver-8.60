local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandlernCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandlernCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandlernCreatureSay(cid, type, msg)    end
function onThink()                          npcHandlernThink()                        end

local storage_1 = PlayerStorageKeys.Quests.notasDeEldric

local function greetCallback(cid)
    local player = Player(cid)
    local storage = player:getStorageValue(storage_1)
    if storage < 0 then
        npcHandler:setMessage(MESSAGE_GREET, "Pode me ajudar com uma {quest}?")
        return true
    elseif storage < 5 then
        npcHandler:setMessage(MESSAGE_GREET, "Have you found her?")
        return true
    elseif storage == 5 then
        npcHandler:setMessage(MESSAGE_GREET, "Thank you for finding Rihanna!")
        return true
    end
    npcHandler:setMessage(MESSAGE_GREET, "Hello! How can I help you?") -- should never see this message, based on how your npc is setup
    return true
end

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end
  
    local player = Player(cid)
    local storage = player:getStorageValue(storage_1)

    -- starting quest
    if msgcontains(msg, "quest") and storage < 0 then
        npcHandler:say("colete o item na caverna {yes}", cid)
        npcHandler.topic[cid] = 1
      
    -- starting quest yes/no reply from player
    elseif npcHandler.topic[cid] == 1 then
        if msgcontains(msg, "yes") then
            player:setStorageValue(storage_1, 0)
            npcHandler:say("I will be waiting for you! I hope you can find her..", cid)
        else
            npcHandler:say("Very well then.", cid)
        end
        npcHandler.topic[cid] = 0
      
    -- if player has started but not finished quest yet
    elseif storage > 0 and storage < 3 then
        if msgcontains(msg, "yes") then
            if storage == 1 then
                player:addItem(2647, 1)
                player:addItem(2463, 1)
                player:setStorageValue(storage_1, 2)
                player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
                npcHandler:say("Thank you for finding her! Now I need to put my moves in.. Here, take this a reward!", cid)
            else               
                npcHandler:say("It doesn't seem like you've found her? Please continue your quest to find her..!", cid)
            end
        else
            npcHandler:say("Please continue your quest to find her! I will be so grateful..", cid)
        end

    end
    return true
end

local function onAddFocus(cid)
    npcHandler.topic[cid] = 0
end

local function onReleaseFocus(cid)
    npcHandler.topic[cid] = nil
end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())