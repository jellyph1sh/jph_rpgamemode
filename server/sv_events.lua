-- Events
RegisterServerEvent("jph_rpgamemode:PlayerConnected")
-- Death System
RegisterServerEvent("jph_rpgamemode:OnPlayerDeath")
-- Inventory
RegisterServerEvent("jph_rpgamemode:GetInventory")
RegisterServerEvent("jph_rpgamemode:AddItem")
RegisterServerEvent("jph_rpgamemode:RemoveItem")

-- Handlers
AddEventHandler("jph_rpgamemode:PlayerConnected", GetPlayerInfo)

AddEventHandler("playerDropped", function()
    local src = source
    SavePlayer(src)
end)

AddEventHandler("jph_rpgamemode:GetInventory", function()
    local src = source
    local identifier = GetIdentifier(src)
    local inventory = GetInventory(identifier)
    TriggerClientEvent("jph_rpgamemode:CBGetInventory", src, inventory)
end)
AddEventHandler("jph_rpgamemode:AddItem", AddItem)
AddEventHandler("jph_rpgamemode:RemoveItem", RemoveItem)