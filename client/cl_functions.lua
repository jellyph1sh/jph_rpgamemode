function SpawnPlayer(pos)
    exports.spawnmanager:spawnPlayer({
        x = pos.x,
        y = pos.y,
        z = pos.z,
        heading = pos.w,
        model = Config.Model,
        skipFade = false
    }, function()
        SetPedDefaultComponentVariation(GetPlayerPed(-1))
    end)
end