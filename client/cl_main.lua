local function main()
    while not NetworkIsPlayerActive(PlayerId()) do
        Wait(100)
    end
    
    TriggerServerEvent("jph_rpgamemode:PlayerConnected")
end

main()
DeathSystem()