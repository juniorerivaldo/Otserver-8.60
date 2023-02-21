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

shopModule:addSellableItem({'meat'}, 2666, 2, 1,'meat')
shopModule:addSellableItem({'salmon'}, 2668, 2, 1,'salmon')
shopModule:addSellableItem({'ham'}, 2671, 4, 1,'ham')
shopModule:addSellableItem({'blueberry'}, 2677, 1, 1,'blueberry')
shopModule:addSellableItem({'cherry'}, 2678, 1, 1,'cherry')
shopModule:addSellableItem({'carrot'}, 2684, 1, 1,'carrot')
shopModule:addSellableItem({'cookie'}, 2687, 1, 1,'cookie')
shopModule:addSellableItem({'bread'}, 2689, 2, 1,'bread')
shopModule:addSellableItem({'egg'}, 2695, 1, 1,'egg')
shopModule:addSellableItem({'green perch'}, 7159, 100, 1,'green perch')
shopModule:addSellableItem({'northern pike'}, 2669, 100, 1,'northern pike')
shopModule:addSellableItem({'rainbow trout'}, 7158, 100, 1,'rainbow trout')
shopModule:addSellableItem({'marlin'}, 7963, 800, 1,'marlin')	
shopModule:addSellableItem({'ectoplasmic sushi'}, 12637, 300, 1,'ectoplasmic sushi')
shopModule:addSellableItem({'wood mushroom'}, 2791, 15, 1,'wood mushroom')
shopModule:addSellableItem({'walnut'}, 7909, 80, 1,'walnut')
shopModule:addSellableItem({'green mushroom'}, 2796, 100, 1,'green mushroom')
shopModule:addSellableItem({'dark mushroom'}, 2792, 100, 1,'dark mushroom')	
shopModule:addSellableItem({'orange mushroom'}, 2790, 150, 1,'orange mushroom')
shopModule:addSellableItem({'fire mushroom'}, 2795, 200, 1,'fire mushroom')
	
shopModule:addBuyableItem({'meat'}, 2666, 5, 1,'meat')
shopModule:addBuyableItem({'fish'}, 2667, 5, 1,'fish')
shopModule:addBuyableItem({'salmon'}, 2668, 6, 1,'salmon')
shopModule:addBuyableItem({'ham'}, 2671, 8, 1,'ham')
shopModule:addBuyableItem({'dragon ham'}, 2671, 25, 1,'dragon ham')
shopModule:addBuyableItem({'pear'}, 2673, 5, 1,'pear')
shopModule:addBuyableItem({'red apple'}, 2674, 3, 1,'red apple')
shopModule:addBuyableItem({'orange'}, 2675, 10, 1,'orange')
shopModule:addBuyableItem({'banana'}, 2676, 5, 1,'banana')
shopModule:addBuyableItem({'blueberry'}, 2677, 1, 1,'blueberry')
shopModule:addBuyableItem({'cherry'}, 2678, 1, 1,'cherry')
shopModule:addBuyableItem({'strawberry'}, 2680, 2, 1,'strawberry')
shopModule:addBuyableItem({'grapes'}, 2681, 3, 1,'grapes')
shopModule:addBuyableItem({'melon'}, 2682, 8, 1,'melon')
shopModule:addBuyableItem({'pumpkin'}, 2683, 10, 1,'pumpkin')
shopModule:addBuyableItem({'carrot'}, 2684, 3, 1,'carrot')
shopModule:addBuyableItem({'tomato'}, 2685, 5, 1,'tomato')
shopModule:addBuyableItem({'corncob'}, 2686, 3, 1,'corncob')
shopModule:addBuyableItem({'cookie'}, 2687, 2, 1,'cookie')
shopModule:addBuyableItem({'bread'}, 2689, 4, 1,'bread')
shopModule:addBuyableItem({'roll'}, 2690, 2, 1,'roll')
shopModule:addBuyableItem({'brown bread'}, 2691, 3, 1,'brown bread')
shopModule:addBuyableItem({'egg'}, 2695, 2, 1,'egg')
shopModule:addBuyableItem({'cheese'}, 2696, 6, 1,'cheese')
shopModule:addBuyableItem({'white mushroom'}, 2787, 6, 1,'white mushroom')
shopModule:addBuyableItem({'red mushroom'}, 2788, 12, 1,'red mushroom')
shopModule:addBuyableItem({'brown mushroom'}, 2789, 10, 1,'brown mushroom')
shopModule:addBuyableItem({'mango'}, 5097, 10, 1,'mango')
shopModule:addBuyableItem({'cake'}, 6278, 50, 1,'cake')
shopModule:addBuyableItem({'party cake'}, 6280, 50, 1,'party cake')
shopModule:addBuyableItem({'valentine/s cake'}, 6393, 100, 1,'valentine/s cake')
shopModule:addBuyableItem({'potato'}, 8838, 4, 1,'potato')
shopModule:addBuyableItem({'plum'}, 8839, 3, 1,'plum')
shopModule:addBuyableItem({'raspberry'}, 8840, 1, 1,'raspberry')
shopModule:addBuyableItem({'lemon'}, 8841, 3, 1,'lemon')
shopModule:addBuyableItem({'cucumber'}, 8842, 3, 1,'cucumber')
shopModule:addBuyableItem({'onion'}, 8843, 2, 1,'onion')
shopModule:addBuyableItem({'jalapeno pepper'}, 8844, 2, 1,'jalapeno pepper')
shopModule:addBuyableItem({'beetroot'}, 8845, 2, 1,'beetroot')
shopModule:addBuyableItem({'cauliflower'}, 12418, 4, 1,'cauliflower')
shopModule:addBuyableItem({'broccoli'}, 12417, 3, 1,'broccoli')
shopModule:addBuyableItem({'pineapple'}, 12415, 12, 1,'pineapple')
shopModule:addBuyableItem({'bulb of garlic'}, 9114, 3, 1,'bulb of garlic')
shopModule:addBuyableItem({'beetroot'}, 8845, 2, 1,'beetroot')
shopModule:addBuyableItem({'aubergine'}, 12416, 8, 1,'aubergine')
shopModule:addBuyableItem({'lemon'}, 8841, 3, 1,'lemon')
shopModule:addBuyableItem({'dragonfruit'}, 12638, 5, 1,'dragonfruit')




function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
