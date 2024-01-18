local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local voices = { {text = "Runes, wands, rods, health and mana potions! Have a look!"} }
npcHandler:addModule(VoiceModule:new(voices))

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

keywordHandler:addKeyword({'stuff'}, StdModule.say, {npcHandler = npcHandler, text = 'Just ask me for a {trade} to see my offers.'})
keywordHandler:addAliasKeyword({'wares'})
keywordHandler:addAliasKeyword({'offer'})

shopModule:addBuyableItem({'baking tray'}, 2561, 20, 1,'baking tray')
shopModule:addBuyableItem({'cleaver'}, 2568, 15, 1,'cleaver') 
shopModule:addBuyableItem({'cup'}, 2013, 2, 1,'cup')
shopModule:addBuyableItem({'fork'}, 2564, 10, 1,'fork')
shopModule:addBuyableItem({'jug'}, 2014, 10, 1,'jug')
shopModule:addBuyableItem({'kitchen knife'}, 2566, 10, 1,'kitchen knife')
shopModule:addBuyableItem({'mug'}, 2012, 4, 1,'mug')
shopModule:addBuyableItem({'oven spatula'}, 2569, 12, 1,'oven spatula')
shopModule:addBuyableItem({'pan'}, 2563, 20, 1,'pan')
shopModule:addBuyableItem({'plate'}, 2035, 6, 1,'plate')
shopModule:addBuyableItem({'rolling pin'}, 2570, 12, 1,'rolling pin')
shopModule:addBuyableItem({'spoon'}, 2565, 10, 1,'spoon')
shopModule:addBuyableItem({'wooden spoon'}, 2567, 5, 1,'wooden spoon')
shopModule:addBuyableItem({'fishing rod'}, 2580, 150, 'fishing rod')
shopModule:addBuyableItem({'backpack'}, 1988, 20, 'backpack')
shopModule:addBuyableItem({'bag'}, 1987, 5, 'bag')
shopModule:addBuyableItem({'crowbar'}, 2416, 5, 1,'crowbar')
shopModule:addBuyableItem({'shovel'}, 2554, 5, 1,'shovel')
shopModule:addBuyableItem({'pick'}, 2553, 5, 1,'pick')
shopModule:addBuyableItem({'machete'}, 2420, 5, 1,'machete')
shopModule:addBuyableItem({'scythe'}, 2550, 5, 1,'scythe')
shopModule:addBuyableItem({'rope'}, 2120, 5, 1,'rope')
shopModule:addBuyableItem({'worm'}, 3976, 1, 'worm')


shopModule:addSellableItem({'rope', 'rope'}, 2120, 5, 'rope')


function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
