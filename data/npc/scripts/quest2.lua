-- data/npc/scripts/npcname.lua

local PlayerStorageKeys = {
    teste = 3940, -- Substitua 1000 pelo valor desejado
    -- Adicione outras chaves conforme necessário
}

function onCreatureAppear(cid)
    if isPlayer(cid) then
        doCreatureSay(cid, "Olá, acho que você pode me ajudar. Quer uma missão?", TALKTYPE_PRIVATE)
    end
end

function onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg)
    if isPlayer(cid) then
        if msg:lower() == 'yes' or msg:lower() == 'mission' then
            if getPlayerStorageValue(cid, PlayerStorageKeys.teste) == 0 then
                doCreatureSay(cid, "Ótimo! Aqui está sua missão. Traga-me o item especial.", TALKTYPE_PRIVATE)
                setPlayerStorageValue(cid, PlayerStorageKeys.teste, 1)
            elseif getPlayerStorageValue(cid, PlayerStorageKeys.teste) == 2 then
                local itemID = 2347 -- Substitua 1234 pelo ID do item necessário
                local itemCount = getPlayerItemCount(cid, itemID)
                
                if itemCount > 0 then
                    doPlayerRemoveItem(cid, itemID, itemCount)
                    doCreatureSay(cid, "Muito obrigado! Você conseguiu o item. Sua missão está completa.", TALKTYPE_PRIVATE)
                    setPlayerStorageValue(cid, PlayerStorageKeys.teste, 3)
                else
                    doCreatureSay(cid, "Você ainda não conseguiu o item. Continue procurando!", TALKTYPE_PRIVATE)
                end
            elseif getPlayerStorageValue(cid, PlayerStorageKeys.teste) == 3 then
                doCreatureSay(cid, "Você já completou sua missão. Muito obrigado!", TALKTYPE_PRIVATE)
            end
        else
            doCreatureSay(cid, "Ah, talvez outra hora então.", TALKTYPE_PRIVATE)
        end
    end
end

function onCreatureChangeOutfit(cid) end
function onThink() end
