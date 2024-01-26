local storage = 20001

function creatureSayCallback(cid, type, msg)
     if not npcHandler:isFocused(cid) then
         return false
     end

     local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

     if msgcontains(msg, "mission") then
         if getPlayerStorageValue(cid, storage) == -1 then
             selfSay("My wife lost her ring while swimming in the town swimming area. Do you think you can help me find it?", cid)
             talkState[talkUser] = 1
         elseif getPlayerStorageValue(cid, storage) == 1 then
             selfSay("Did you find the ring?", cid)
             talkState[talkUser] = 1
         else
             selfSay("Thanks again for finding the ring.", cid)
         end
     elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
         if getPlayerStorageValue(cid, storage) == -1 then
             selfSay("Great! I saw a water vortex. Maybe you should check near that first.", cid)
             setPlayerStorageValue(cid, storage, 1)
         else
             if(doPlayerRemoveItem(cid, 24333, 1)) then
                 selfSay("That's great, my wife will be really happy, thanks.", cid)
                 doPlayerAddItem(cid, 2148, 300)
                 setPlayerStorageValue(cid, storage, 2)
             else
                 selfSay("You don't have it.", cid)
             end
         end
         talkState[talkUser] = 0
     elseif msgcontains(msg, "no") and talkState[talkUser] == 1 then
         selfSay("Ok then.", cid)
         talkState[talkUser] = 0
     end
     return true
end