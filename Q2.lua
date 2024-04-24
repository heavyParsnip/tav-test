-- Matt Camera's technical test for Tavernlight Games

--Q2 - Fix or improve the implementation of the below method

--Assuming again that this is supposed to be global
function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))    --Assuming db is in the global scope? If not, it needs to be passed into the function, a la printSmallGuildNames(memberCount, db)
    local guildName = resultId.getString("name")    --Original version pulled from 'result', should be from 'resultId'
    print(guildName)
end