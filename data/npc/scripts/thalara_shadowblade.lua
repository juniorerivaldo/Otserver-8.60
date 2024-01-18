local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)	selfTurn(NORTH)      npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           	 	 npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)     		     npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()	selfTurn(NORTH)	         		 npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              		 npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          		 npcHandler:onPlayerCloseChannel(cid)        end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	if msgcontains(msg, "old backpack") or msgcontains(msg, "backpack") or msgcontains(msg, "sam backpack") then
		npcHandler:say("Você deve falar sobre isto com a Soya. Ela está aqui, do meu lado!", cid)
		npcHandler.topic[cid] = 0
	
	elseif msgcontains(msg, "time") then
	   local time = getTibiaTime()
	   npcHandler:say("Certo, hmm, deixe-me ver. Agora são: ".. time.hours ..":".. time.minutes ..".", cid)
	   npcHandler.topic[cid] = 0
	end
	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

--SWORDS
shopModule:addSellableItem({'bone sword'}, 2450, 20, 'bone sword')
shopModule:addSellableItem({'carlin sword'}, 2395, 118, 'carlin sword')
shopModule:addSellableItem({'combat knife'}, 2404, 1, 'combat knife')
shopModule:addSellableItem({'dagger'}, 2379, 2, 'dagger')
shopModule:addSellableItem({'heavy machete'}, 2442, 90, 'heavy machete')
shopModule:addSellableItem({'katana'}, 2412, 35, 'katana')
shopModule:addSellableItem({'knife'}, 2403, 1, 'knife')
shopModule:addSellableItem({'longsword'}, 2397, 51, 'longsword')
shopModule:addSellableItem({'machete'}, 2420, 6, 'machete')
shopModule:addSellableItem({'poison dagger'}, 2411, 50, 'poison dagger')
shopModule:addSellableItem({'rapier'}, 2384, 5, 'rapier')
shopModule:addSellableItem({'sabre'}, 2385, 12, 'sabre')
shopModule:addSellableItem({'scimitar'}, 2419, 150, 'scimitar')
shopModule:addSellableItem({'short sword'}, 2406, 10, 'short sword')
shopModule:addSellableItem({'sword'}, 2376, 25, 'sword')
shopModule:addSellableItem({'two handed sword'}, 2377, 450, 'two handed sword')
--AXES
shopModule:addSellableItem({'axe'}, 2386, 7, 'axe')
shopModule:addSellableItem({'battle axe'}, 2378, 80, 'battle axe')
shopModule:addSellableItem({'hand axe'}, 2380, 4, 'hand axe')
shopModule:addSellableItem({'hatchet'}, 2388, 25, 'hatchet')
shopModule:addSellableItem({'orcish axe'}, 2428, 350, 'orcish axe')
shopModule:addSellableItem({'sickle'}, 2405, 3, 'sickle')
shopModule:addSellableItem({'barbarian axe'}, 2429, 185, 'barbarian axe')
shopModule:addSellableItem({'halberd'}, 2381, 400, 'halberd')
shopModule:addSellableItem({'double axe'}, 2387, 260, 'double axe')
--CLUBS
shopModule:addSellableItem({'battle hammer'}, 2417, 120, 'battle hammer')
shopModule:addSellableItem({'bone club'}, 2449, 5, 'bone club')
shopModule:addSellableItem({'club'}, 2382, 1, 'club')
shopModule:addSellableItem({'crowbar'}, 2416, 50, 'crowbar')
shopModule:addSellableItem({'daramian mace'}, 2439, 110, 'daramian mace')
shopModule:addSellableItem({'mace'}, 2398, 30, 'mace')
shopModule:addSellableItem({'morning star'}, 2394, 100, 'morning star')
shopModule:addSellableItem({'scythe'}, 2550, 10, 'scythe')
shopModule:addSellableItem({'studded club'}, 2448, 10, 'studded club')
shopModule:addSellableItem({'clerical mace'}, 7754, 170, 'clerical mace')
shopModule:addSellableItem({'mammoth whopper'}, 7381, 300, 'mammoth whopper')
--SHIELDS
shopModule:addSellableItem({'wooden shield'}, 2512, 5, 'wooden shield')
shopModule:addSellableItem({'studded shield'}, 2526, 16, 'studded shield')
shopModule:addSellableItem({'brass shield'}, 2511, 25, 'brass shield')
shopModule:addSellableItem({'plate shield'}, 2510, 45, 'plate shield')
shopModule:addSellableItem({'copper shield'}, 2530, 50, 'copper shield')
shopModule:addSellableItem({'bone shield'}, 2541, 80, 'bone shield')
shopModule:addSellableItem({'steel shield'}, 2509, 80, 'steel shield')
shopModule:addSellableItem({'sentinel shield'}, 3974, 120, 'sentinel shield')
shopModule:addSellableItem({'viking shield'}, 2531, 85, 'viking shield')
shopModule:addSellableItem({'battle shield'}, 2513, 95, 'battle shield')
shopModule:addSellableItem({'dark shield'}, 2521, 400, 'dark shield')
--HELMS
shopModule:addSellableItem({'flower wreath'}, 9927, 500, 'flower wreath')
shopModule:addSellableItem({'bandana'}, 5917, 150, 'bandana')
shopModule:addSellableItem({'leather helmet'}, 2461, 4, 'leather helmet')
shopModule:addSellableItem({'mystic turban'}, 2663, 150, 'mystic turban')
shopModule:addSellableItem({'chain helmet'}, 2458, 17, 'chain helmet')
shopModule:addSellableItem({'studded helmet'}, 2482, 20, 'studded helmet')
shopModule:addSellableItem({'tribal mask'}, 3967, 250, 'tribal mask')
shopModule:addSellableItem({'brass helmet'}, 2460, 30, 'brass helmet')
shopModule:addSellableItem({'legion helmet'}, 2480, 22, 'legion helmet')
shopModule:addSellableItem({'viking helmet'}, 2473, 66, 'viking helmet')
shopModule:addSellableItem({'iron helmet'}, 2459, 150, 'iron helmet')
shopModule:addSellableItem({'soldier helmet'}, 2481, 16, 'soldier helmet')
shopModule:addSellableItem({'horseman helmet'}, 3969, 280, 'horseman helmet')
shopModule:addSellableItem({'dark helmet'}, 2490, 250, 'dark helmet')
shopModule:addSellableItem({'ragnir helmet'}, 7462, 400, 'ragnir helmet')
shopModule:addSellableItem({'steel helmet'}, 2457, 293, 'steel helmet')
--ARMORS
shopModule:addSellableItem({'simple dress'}, 2657, 50, 'simple dress')
shopModule:addSellableItem({'coat'}, 2651, 1, 'coat')
shopModule:addSellableItem({'red robe'}, 2655, 300, 'red robe')
shopModule:addSellableItem({'jacket'}, 2650, 1, 'jacket')
shopModule:addSellableItem({'doublet'}, 2485, 3, 'doublet')
shopModule:addSellableItem({'leather armor'}, 2467, 12, 'leather armor')
shopModule:addSellableItem({'studded armor'}, 2484, 25, 'studded armor')
shopModule:addSellableItem({'chain armor'}, 2464, 70, 'chain armor')
shopModule:addSellableItem({'ethno coat'}, 8892, 200, 'ethno coat')
shopModule:addSellableItem({'brass armor'}, 2465, 150, 'brass armor')
shopModule:addSellableItem({'spirit cloak'}, 8870, 350, 'spirit cloak')
shopModule:addSellableItem({'scale armor'}, 2483, 75, 'scale armor')
shopModule:addSellableItem({'dark armor'}, 2489, 400, 'dark armor')
shopModule:addSellableItem({'dwarven armor'}, 2503, 30000, 'dwarven armor')
shopModule:addSellableItem({'plate armor'}, 2463, 400, 'plate armor')
shopModule:addSellableItem({'summer dress'}, 8874, 1500, 'summer dress')
--LEGS
shopModule:addSellableItem({'leather legs'}, 2649, 9, 'leather legs')
shopModule:addSellableItem({'studded legs'}, 2468, 15, 'studded legs')
shopModule:addSellableItem({'chain legs'}, 2648, 25, 'chain legs')
shopModule:addSellableItem({'brass legs'}, 2478, 49, 'brass legs')
shopModule:addSellableItem({'plate legs'}, 2647, 115, 'plate legs')
--BOOTS
shopModule:addSellableItem({'leather boots'}, 2643, 2, 'leather boots')

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo, |PLAYERNAME|! Venda seu LOOT aqui.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Volte logo.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até logo.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Eu posso comprar todo o seu LOOT!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())