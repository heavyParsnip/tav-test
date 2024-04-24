-- Matt Camera's technical test for Tavernlight Games

--Q1 - Fix or improve the implementation of the below methods
--This function seems fine as-is.
local function releaseStorage(player)
    player:setStorageValue(1000, -1)
end

--Assuming this is supposed to be global
function onLogout(player)
    if player:getStorageValue(1000) == 1 then
        addEvent(releaseStorage, 1000, player)
        --Move the 'return true' here since things worked out
        return true
    else
        --Need a case for when things don't work out.
        print("whoops, player:getStorageValue was not == 1")    --Maybe print an error?
        return false
    end
end