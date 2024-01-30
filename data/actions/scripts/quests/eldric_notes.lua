function onUse(player, item, fromPosition, target, toPosition, isHotkey)
if player:getStorageValue(PlayerStorageKeys.Quests.eldricNotes) == 1 then
    player:setStorageValue(PlayerStorageKeys.Quests.eldricNotes, 2)
        end