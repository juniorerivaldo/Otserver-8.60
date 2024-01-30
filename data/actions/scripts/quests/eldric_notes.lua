function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStorageValue(PlayerStorageKeys.Quests.notasDeEldric) == 0 then
        player:setStorageValue(PlayerStorageKeys.Quests.notasDeEldric, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'PARTE 2 OK')
    end

end
