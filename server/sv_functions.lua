function GetIdentifier(playerId)
    local identifier = GetPlayerIdentifier(playerId, 0)
    return identifier:gsub("license:", "")
end

function GetPlayerInfo()
    local src = source
    local identifier = GetIdentifier(src)
    local response = MySQL.prepare.await('SELECT position FROM users WHERE identifier = ?;', {identifier})
    if response == nil then
        MySQL.insert.await('INSERT INTO users (identifier, position) VALUES (?, ?);', {identifier, json.encode(Config.DefaultPosition)})
        TriggerClientEvent("jph_rpgamemode:SpawnPlayer", src, Config.DefaultPosition)
        return
    end
    TriggerClientEvent("jph_rpgamemode:SpawnPlayer", src, json.decode(response))
end

function SavePlayer(src)
    local identifier = GetIdentifier(src)
    local ped = GetPlayerPed(src)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local position = {x = x, y = y, z = z, w = GetEntityHeading(ped)}
    MySQL.update.await('UPDATE users SET position = ? WHERE identifier = ?;', {json.encode(position), identifier})
end

function GetInventory(identifier)
    return MySQL.prepare.await('SELECT items.label, items.name, items.type, items.weight, inventories.quantity FROM inventories LEFT JOIN items ON items.item_id = inventories.item_id WHERE identifier = ?;', {identifier})
end

function AddItem(src, item, quantity)
    local identifier = GetIdentifier(src)
    MySQL.insert.await('INSERT INTO inventories (user_id, item_id, quantity) SELECT ?, item_id, ? FROM items WHERE name = ?;', {identifier, tonumber(quantity), item})
end

function RemoveItem(src, item, quantity)
    local identifier = GetIdentifer(src)
    
end