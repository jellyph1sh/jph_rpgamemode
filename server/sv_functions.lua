function GetIdentifier(playerId)
    local identifier = GetPlayerIdentifierByType(playerId, 'license')
    return identifier:gsub('license:', '')
end

function GetPlayerInfo()
    local src = source
    local identifier = GetIdentifier(src)
    local response = MySQL.prepare.await('SELECT identifier, position FROM users WHERE identifier = ?;', {identifier})
    if response == nil then
        MySQL.insert.await('INSERT INTO users (identifier, position) VALUES (?, ?);', {identifier, json.encode(Config.DefaultPosition)})
        TriggerClientEvent("jph_rpgamemode:SpawnPlayer", src, Config.DefaultPosition)
        return
    end
    TriggerClientEvent("jph_rpgamemode:SpawnPlayer", src, json.decode(response.position))
end

function SavePlayer()
    local src = source
    local identifier = GetIdentifier(src)
    local ped = GetPlayerPed(src)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local position = {x = x, y = y, z = z, w = GetEntityHeading(ped)}
    MySQL.update.await('UPDATE users SET position = ? WHERE identifier = ?;', {json.encode(position), identifier})
end