local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return true
    end
    local player = Player(cid)
 -- mission
    if msgcontains(msg, "enter the club") and player:getStorageValue(223344) == -1 then -- checking if the quest hasnt been done
        npcHandler:say("If you are trying to enter this club you have to do me a {favor}.", cid) -- require to enter
        npcHandler.topic[cid] = 1 --
    elseif msgcontains(msg, "favor") and npcHandler.topic[cid] == 1 then -- asking for favor
        npcHandler:say("I need you to go to the bandit cave and get back that golden amulet they took from me. Can you do that?", cid) -- instruction
    elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then -- quest approval
        npcHandler:say("Alright, bring it back to me and say {golden amulet}. Be careful.. They are a group of rebellions. While you facing the thief that stole my amulet there will be a lot of bad guys on you. You must gather a team to get this quest done. Their camp is located on the south side outside the City. Good luck..", cid)
        player:setStorageValue(223344, 1) -- quest started storage value
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have unlocked the Bandict Cave Bridge pass.")
    elseif  msgcontains(msg, "no") and npcHandler.topic[cid] == 1 then
        npcHandler:say("Alright.", cid) 
                -- amulet checking and exchange           
    elseif msgcontains(msg, "enter the club") and player:getStorageValue(223344) == 1 then -- elseif player has started the quest then ask him if he has the amulet.
        npcHandler:say("You have my amulet? just say {golden amulet}.", cid)
        npcHandler.topic[cid] = 2
        if msgcontains(msg, "golden amulet") and npcHandler.topic[cid] == 2 and player:getItemCount(2130) >= 1 then
            player:removeItem(2130, 1)
            npcHandler:say("Thank you, Welcome to the club brother!", cid)
            player:setStorageValue(223344, 2) -- quest done storage value
        else
            npcHandler:say("Come back when you get the amulet please.", cid) -- if not then this
        end
    else
        npcHandler:say("You are already Welcome!.", cid) -- if player done the quest message.
    end
    return true
end

npcHandler:setMessage(MESSAGE_GREET, "Heyyyyy!!! whats up you want to {enter the club}? |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Always be on guard, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "This ungraceful haste is most suspicious!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())