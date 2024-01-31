function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStorageValue(45001) == 0 then
        player:setStorageValue(45001, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'PARTE 2 OK')
    end

end
