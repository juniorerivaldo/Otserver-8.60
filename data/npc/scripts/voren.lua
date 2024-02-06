local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local voices = { {text = "Flechas | Bolts Spears e muito mais aqui diga {trade}!"} }
npcHandler:addModule(VoiceModule:new(voices))

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

keywordHandler:addKeyword({'stuff'}, StdModule.say, {npcHandler = npcHandler, text = 'Flechas | Bolts Spears e muito mais aqui diga {trade}!'})
keywordHandler:addAliasKeyword({'wares'})
keywordHandler:addAliasKeyword({'offer'})

shopModule:addBuyableItem({'arrow'}, 2544, 3, 1,'arrow')
shopModule:addBuyableItem({'assassin star'}, 7368, 100, 1,'assassin star')
shopModule:addBuyableItem({'bolt'}, 2543, 4, 1,'bolt')
shopModule:addBuyableItem({'bow'}, 2456, 400, 1,'bow')
shopModule:addBuyableItem({'crossbow'}, 2455, 500, 1,'crossbow')
shopModule:addBuyableItem({'spear'}, 2389, 9, 1,'spear')
shopModule:addBuyableItem({'royal spear'}, 7378, 15, 1,'royal spear')
shopModule:addBuyableItem({'earth arrow'}, 7850, 5, 1,'earth arrow')
shopModule:addBuyableItem({'flaming arrow'}, 7840, 5, 1,'flaming arrow')
shopModule:addBuyableItem({'flash arrow'}, 7838, 5, 1,'flash arrow')
shopModule:addBuyableItem({'onyx arrow'}, 7365, 7, 1,'onyx arrow')
shopModule:addBuyableItem({'piercing bolt'}, 7363, 5, 1,'piercing bolt')
shopModule:addBuyableItem({'power bolt'}, 2547, 7, 1,'power bolt')
shopModule:addBuyableItem({'shiver arrow'}, 7839, 5, 1,'shiver arrow')
shopModule:addBuyableItem({'sniper arrow'}, 7364, 5, 1,'sniper arrow')
shopModule:addBuyableItem({'throwing knife'}, 2410, 25, 1,'throwing knife')
shopModule:addBuyableItem({'throwing star'}, 2399, 42, 1,'throwning star')

shopModule:addSellableItem({'bow'}, 2456, 100, 1,'bow')
shopModule:addSellableItem({'chain bolter'}, 8850, 40000, 1,'chain bolter')
shopModule:addSellableItem({'composite hornbow'}, 8855, 25000, 1,'composite hornbow')
shopModule:addSellableItem({'crossbow'}, 2455, 120, 1,'crossbow')
shopModule:addSellableItem({'hunting spear'}, 3965, 25, 1,'hunting spear')
shopModule:addSellableItem({'spear'}, 2389, 3, 1,'spear')
shopModule:addSellableItem({'throwing knife'}, 2410, 2, 1,'throwing knife')




function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
