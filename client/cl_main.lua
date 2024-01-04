local function main()
    while not NetworkIsPlayerActive(PlayerId()) do
        Wait(500)
    end

    exports.spawnmanager:spawnPlayer({
        x = -802.311, y = 175.056, z = 72.8446,
        heading = 90.0,
        model = `mp_m_freemode_01`,
        skipFade = false
    }, function()
        SetPedDefaultComponentVariation(GetPlayerPed(-1))
    end)
end

main()