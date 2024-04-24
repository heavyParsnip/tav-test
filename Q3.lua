-- Matt Camera's technical test for Tavernlight Games

--Q3 - Fix or improve the name and the implementation of the below method

--Assuming global is intended again.
function leaveParty(playerId, membername)   --Changed name to 'leaveParty', since that seems to be what the function is doing
    player = Player(playerId)   --A 'player' variable seems like it would be global, so leaving it as-is.
    local party = player:getParty()

    for k,v in pairs(party:getMembers()) do
        if v == Player(membername) then
            party:removeMember(v)   --If we've already confirmed v == Player(membername), then it's probably better to remove v instead of invoking Player(membername) again?
        end
    end
end
