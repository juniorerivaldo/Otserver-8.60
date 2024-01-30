local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                npcHandler:onThink()                    end

-- QUEST --
function Task1(cid, message, keywords, parameters, node)

local stor1 = 3939 -- this is the same STOR1 from quests.xml

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if getPlayerStorageValue(cid,stor1) < 0 then
                npcHandler:say('Pegue esta chave para abrir o covil, ele se encontra abaixo da cidade no bueiro!',cid)
            doPlayerAddItem(cid, 2087, 1)
            doPlayerSetStorageValue(cid, stor1, 0)
    elseif getPlayerStorageValue(cid, stor1) == 0 then
                npcHandler:say('Estou aguardando minhas notas, apresse-se.',cid)
    elseif getPlayerStorageValue(cid, stor1) == 1 then
                npcHandler:say('Obrigado por recuperar minhas notas. tome esse dinheiro como recompensa.',cid)
            doPlayerAddItem(cid, 2152, 25)
            doPlayerSetStorageValue(cid, stor1, 2)
                 doSendMagicEffect(getCreaturePosition(cid), 13)
    elseif getPlayerStorageValue(cid, stor1) == 2 then
                npcHandler:say('No momento nao tenho mais missoes para voce!',cid)
    end
end

local node1 = keywordHandler:addKeyword({'ajudar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'O mago branco roubou minhas notas, preciso de sua ajuda para recupera-las, pode me ajudar {sim}?'})
      node1:addChildKeyword({'sim'}, Task1, {})
    node1:addChildKeyword({'nao'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'ok, alguem ira me ajudar.', reset = true})

npcHandler:addModule(FocusModule:new())