-- Events
RegisterNetEvent("jph_rpgamemode:SpawnPlayer")
RegisterNetEvent("jph_rpgamemode:CBGetInventory")

-- Handlers
AddEventHandler("jph_rpgamemode:SpawnPlayer", function(pos)
    SpawnPlayer(pos)
end)

AddEventHandler("jph_rpgamemode:CBGetInventory", function(inv)
    if (#inv > 1) then
        for k, v in pairs(inv) do
            print(v.label, v.name, v.type, v.weight, v.quantity)
        end
    else
        print(inv.label, inv.name, inv.type, inv.weight, inv.quantity)
    end
end)