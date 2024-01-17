local firstItems = {}
firstItems[0] =
{
2383,
2525,
2647,
2173,
2457,
2463,
2643  
}
firstItems[1] =
{
2190,
2525,
2647,
2173,
2457,
2463,
2643  
}
firstItems[2] =
{
2182,
2525,
2647,
2173,
2457,
2463,
2643  
}
firstItems[3] =
{
2389,
2525,
2647,
2173,
2457,
2463,
2643  
}
firstItems[4] =
{
2383,
2525,
2647,
2173,
2457,
2463,
2643  
}
function onLogin(cid)
if getPlayerStorageValue(cid, 30001) == -1 then
for i = 1, table.maxn(firstItems[getPlayerVocation(cid)]) do
doPlayerAddItem(cid, firstItems[getPlayerVocation(cid)][i], 1)
end
if getPlayerSex(cid) == 0 then
doPlayerAddItem(cid, 2554, 1)
else
doPlayerAddItem(cid, 2120, 1)
end
local bag = doPlayerAddItem(cid, 10518, 1)
doAddContainerItem(bag, 7620, 1)
doAddContainerItem(bag, 7618, 1)
doAddContainerItem(bag, 2160, 3)
doAddContainerItem(bag, 2554, 1)
setPlayerStorageValue(cid, 30001, 1)
end
return TRUE
end