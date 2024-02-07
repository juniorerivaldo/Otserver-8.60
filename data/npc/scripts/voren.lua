local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local voices = {
    {text = "Flechas | Bolts Spears e muito mais aqui diga {trade}!"}
}
npcHandler:addModule(VoiceModule:new(voices))

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

keywordHandler:addKeyword({'stuff'}, StdModule.say, {
    npcHandler = npcHandler,
    text = 'Flechas | Bolts Spears e muito mais aqui diga {trade}!'
})
keywordHandler:addAliasKeyword({'wares'})
keywordHandler:addAliasKeyword({'offer'})

shopModule:addBuyableItem({'arrow'}, 2544, 7, 1, 'arrow')
shopModule:addBuyableItem({'assassin star'}, 7368, 150, 1, 'assassin star')
shopModule:addBuyableItem({'bolt'}, 2543, 10, 1, 'bolt')
shopModule:addBuyableItem({'bow'}, 2456, 40, 1, 'bow')
shopModule:addBuyableItem({'crossbow'}, 2455, 70, 1, 'crossbow')
shopModule:addBuyableItem({'spear'}, 2389, 10, 1, 'spear')
shopModule:addBuyableItem({'royal spear'}, 7378, 75, 1, 'royal spear')
shopModule:addBuyableItem({'earth arrow'}, 7850, 40, 1, 'earth arrow')
shopModule:addBuyableItem({'flaming arrow'}, 7840, 40, 1, 'flaming arrow')
shopModule:addBuyableItem({'flash arrow'}, 7838, 40, 1, 'flash arrow')
shopModule:addBuyableItem({'onyx arrow'}, 7365, 40, 1, 'onyx arrow')
shopModule:addBuyableItem({'piercing bolt'}, 7363, 40, 1, 'piercing bolt')
shopModule:addBuyableItem({'power bolt'}, 2547, 40, 1, 'power bolt')
shopModule:addBuyableItem({'shiver arrow'}, 7839, 40, 1, 'shiver arrow')
shopModule:addBuyableItem({'sniper arrow'}, 7364, 40, 1, 'sniper arrow')
shopModule:addBuyableItem({'throwing knife'}, 2410, 50, 1, 'throwing knife')
shopModule:addBuyableItem({'throwing star'}, 2399, 50, 1, 'throwning star')

shopModule:addSellableItem({'arrow'}, 2544, 15, 'arrow')
shopModule:addSellableItem({'assassin star'}, 7368, 250, 'assassin star')
shopModule:addSellableItem({'bolt'}, 2543, 25, 'bolt')
shopModule:addSellableItem({'bow'}, 2456, 400, 'bow')
shopModule:addSellableItem({'crossbow'}, 2455, 700, 'crossbow')
shopModule:addSellableItem({'spear'}, 2389, 25, 'spear')
shopModule:addSellableItem({'royal spear'}, 7378, 150, 'royal spear')
shopModule:addSellableItem({'earth arrow'}, 7850, 85, 'earth arrow')
shopModule:addSellableItem({'flaming arrow'}, 7840, 85, 'flaming arrow')
shopModule:addSellableItem({'flash arrow'}, 7838, 85, 'flash arrow')
shopModule:addSellableItem({'onyx arrow'}, 7365, 85, 'onyx arrow')
shopModule:addSellableItem({'piercing bolt'}, 7363, 85, 'piercing bolt')
shopModule:addSellableItem({'power bolt'}, 2547, 85, 'power bolt')
shopModule:addSellableItem({'shiver arrow'}, 7839, 85, 'shiver arrow')
shopModule:addSellableItem({'sniper arrow'}, 7364, 85, 'sniper arrow')
shopModule:addSellableItem({'throwing knife'}, 2410, 105, 'throwing knife')
shopModule:addSellableItem({'throwing star'}, 2399, 105, 'throwning star')



function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
