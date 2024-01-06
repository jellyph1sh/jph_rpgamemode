RegisterServerEvent("jph_rpgamemode:PlayerConnected")
AddEventHandler("jph_rpgamemode:PlayerConnected", GetPlayerInfo)

AddEventHandler("playerDropped", function()
    local src = source
    SavePlayer(src)
end)

RegisterServerEvent("jph_rpgamemode:OnPlayerDeath")