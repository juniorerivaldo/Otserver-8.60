-- Collecting items and monster missions by Limos
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)  npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)  npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()  npcHandler:onThink() end

local missions = {
   [1] = {
     items = {
       {id = 5890, count = 12},
       {id = 5878, count = 20},
       {id = 5894, count = 8}
     },
     message = "Great, for your first mission you need to collect some items, I need",
     level = 15, -- minimum level voor this mission
     rewarditems = {
       {id = 2160, count = 1},
       {id = 2152, count = 1}
     },
     rewardexp = 15000
   },
   [2] = {
     monsters = {
       {name = "Rats", count = 20, storage = 21900},
       {name = "Rotworms", count = 26, storage = 21901}
     },
     message = "Thanks, for your next mission kill",
     level = 30,
     rewarditems = {
       {id = 2160, count = 5}
     },
     rewardexp = 40000
   },
   [3] = {
     items = {
       {id = 5920, count = 45},
       {id = 5877, count = 22}
     },
     message = "Awesome, now get",
     level = 50,
     rewarditems = {
       {id = 2160, count = 15}
     },
     rewardexp = 100000
   },
   [4] = {
     monsters = {
       {name = "Dragon Lords", count = 25, storage = 21902}
     },
     message = "Good job, now kill",
     level = 70,
     rewarditems = {
       {id = 2160, count = 25}
     },
     rewardexp = 200000
   },
   [5] = {
     items = {
       {id = 5906, count = 35},
       {id = 5882, count = 42},
       {id = 4850, count = 1}
     },
     message = "Good, now your final mission, there are a few more items you need to get,",
     level = 100,
     rewarditems = {
       {id = 2160, count = 50}
     },
     rewardexp = 450000
   }
}

local storage = 45551

local function getItemsMonstersFromTable(imtable)
     local text = ""
     for v = 1, #imtable do
         local ret = ", "
         if v == 1 then
             ret = ""
         elseif v == #imtable then
             ret = " and "
         end
         text = text .. ret
         count = imtable[v].count
         if imtable[v].id then
             info = ItemType(imtable[v].id)
             text = text .. (count > 1 and count or info:getArticle()).." "..(count > 1 and info:getPluralName() or info:getName())
         else
             text = text .. count .." "..imtable[v].name
         end
     end
     return text
end

function creatureSayCallback(cid, type, msg)
     if not npcHandler:isFocused(cid) then
         return false
     end

     local player = Player(cid)
     
     local x = missions[player:getStorageValue(storage)]

     if msgcontains(msg, 'task')  then
         if player:getStorageValue(storage) == -1 then
             selfSay("I have several missions for you, do you accept the challenge?", cid)
             npcHandler.topic[cid] = 1
         elseif x then
             if player:getLevel() >= x.level then
                 selfSay("Did you "..(x.items and "get "..getItemsMonstersFromTable(x.items) or "kill "..getItemsMonstersFromTable(x.monsters)).."?", cid)
                 npcHandler.topic[cid] = 1
             else
                 selfSay("The mission I gave you is for level "..x.level..", come back later.", cid)
             end
         else
             selfSay("You already did all the missions, great job though.", cid)
             npcHandler:releaseFocus(cid)
         end
     elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
         if player:getStorageValue(storage) == -1 then
             player:setStorageValue(storage, 1)
             local x = missions[player:getStorageValue(storage)]
             selfSay(x.message.." "..getItemsMonstersFromTable(x.items or x.monsters)..".", cid)
         elseif x then
             local imtable = x.items or x.monsters
             local amount = 0
             for it = 1, #imtable do
                 local check = x.items and player:getItemCount(imtable[it].id) or player:getStorageValue(imtable[it].storage)
                 if check >= imtable[it].count then
                     amount = amount + 1
                 end
             end
             if amount == #imtable then
                 if x.items then
                     for it = 1, #x.items do
                         player:removeItem(x.items[it].id, x.items[it].count)
                     end
                 end
                 if x.rewarditems then
                     for r = 1, #x.rewarditems do
                         player:addItem(x.rewarditems[r].id, x.rewarditems[r].count)
                     end
                     player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "You received "..getItemsMonstersFromTable(x.rewarditems)..".")
                 end
                 if x.rewardexp then
                     player:addExperience(x.rewardexp)
                     player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "You received "..x.rewardexp.." experience.")
                 end
                 player:setStorageValue(storage, player:getStorageValue(storage) + 1)
                 local x = missions[player:getStorageValue(storage)]
                 if x then
                     selfSay(x.message.." "..getItemsMonstersFromTable(x.items or x.monsters)..".", cid)
                 else
                     selfSay("Well done! You did a great job on all your missions.", cid)
                 end
             else
                 local n = 0
                 for i = 1, #imtable do
                     local check = x.items and player:getItemCount(imtable[i].id) or player:getStorageValue(imtable[i].storage)
                     if check < imtable[i].count then
                         n = n + 1
                     end
                 end
                 local text = ""
                 local c = 0
                 for v = 1, #imtable do
                     local check = x.items and player:getItemCount(imtable[v].id) or player:getStorageValue(imtable[v].storage)
                     if check < imtable[v].count then
                         c = c + 1
                         local ret = ", "
                         if c == 1 then
                             ret = ""
                         elseif c == n then
                             ret = " and "
                         end
                         text = text .. ret
                         if x.items then
                             local count, info = imtable[v].count - player:getItemCount(imtable[v].id), ItemType(imtable[v].id)
                             text = text .. (count > 1 and count or info:getArticle()).." "..(count > 1 and info:getPluralName() or info:getName())
                         else
                             local count = imtable[v].count - (player:getStorageValue(imtable[v].storage) + 1)
                             text = text .. count.." "..imtable[v].name
                         end
                     end
                 end
                 selfSay(x.items and "You don't have all items, you still need to get "..text.."." or "You didn't kill all monsters, you still need to kill "..text..".", cid)
             end
         end
         npcHandler.topic[cid] = 0
     elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
         selfSay("Oh well, I guess not then.", cid)
         npcHandler.topic[cid] = 0
     end
     return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, "Bye!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye, have a nice day!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())