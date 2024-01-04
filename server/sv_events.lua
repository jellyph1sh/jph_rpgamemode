RegisterServerEvent("jph_rpgamemode:PlayerConnected")
AddEventHandler("jph_rpgamemode:PlayerConnected", GetPlayerInfo)

AddEventHandler("playerDropped", SavePlayer)