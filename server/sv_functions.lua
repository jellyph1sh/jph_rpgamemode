function GetIdentifier(playerId)
    local identifier = GetPlayerIdentifier(playerId, 0)
    return identifier:gsub("license:", "")
end

function GetPlayerInfo()
    local src = source
    local identifier = GetIdentifier(src)
    local response = MySQL.prepare.await("SELECT position FROM users WHERE identifier = ?;", {identifier})
    if response == nil then
        MySQL.insert.await("INSERT INTO users (identifier, position) VALUES (?, ?);", {identifier, json.encode(Config.DefaultPosition)})
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
    MySQL.update.await("UPDATE users SET position = ? WHERE identifier = ?;", {json.encode(position), identifier})
end

function GetInventory(identifier)
    return MySQL.prepare.await("SELECT items.label, items.name, items.type, items.weight, inventories.quantity FROM inventories LEFT JOIN items ON items.item_id = inventories.item_id WHERE user_id = ?;", {identifier})
end

function InventoryContain(identifier, item)
    local inventory = GetInventory(identifier)
    if inventory == nil then return 0 end
    if #inventory > 1 then
        for _, i in pairs(inventory) do
            if (i.name == item) then
                return i.quantity
            end
        end
        return 0
    end
    if inventory.name == item then
        return inventory.quantity
    end
    return 0
end

function AddItem(src, item, quantity)
    local identifier = GetIdentifier(src)
    local invQuantity = InventoryContain(identifier, item)
    if invQuantity == 0 then
        MySQL.insert.await("INSERT INTO inventories (user_id, item_id, quantity) SELECT ?, item_id, ? FROM items WHERE name = ?;", {identifier, tonumber(quantity), item})
    else
        MySQL.update.await("UPDATE inventories SET quantity = ? WHERE user_id = ? AND item_id = (SELECT item_id FROM items WHERE name = ?);", {invQuantity + quantity, identifier, item})
    end
end

function RemoveItem(src, item, quantity)
    local identifier = GetIdentifier(src)
    local invQuantity = InventoryContain(identifier, item)
    if invQuantity == 0 then
        print("This item is not in the player inventory.")
        return
    elseif invQuantity < quantity then
        print("Quantity is too high!")
    end
    if quantity == invQuantity then
        MySQL.query.await("DELETE FROM inventories WHERE user_id = ? AND item_id = (SELECT item_id FROM items WHERE name = ?);", {identifier, item})
    else
        MySQL.update.await("UPDATE inventories SET quantity = ? WHERE user_id = ? AND item_id = (SELECT item_id FROM items WHERE name = ?);", {invQuantity - quantity, identifier, item})
    end
end