function SpawnPlayer(pos)
    exports.spawnmanager:spawnPlayer({
        x = pos.x,
        y = pos.y,
        z = pos.z,
        heading = pos.w,
        model = Config.Model,
        skipFade = false
    }, function()
        SetPedDefaultComponentVariation(PlayerPedId())
    end)
end

function DeathSystem()
    Citizen.CreateThread(function()
        while true do
            if GetEntityHealth(PlayerPedId()) <= 0 then
                local ped = PlayerPedId()
                if IsControlJustReleased(0, 51) then
                    local x, y, z = table.unpack(GetEntityCoords(ped))
                    RemoveAllPedWeapons(ped, 1)
                    NetworkResurrectLocalPlayer(x, y, z, GetEntityHeading(ped), false, false)
                end
            else
                Citizen.Wait(500)
            end
            Citizen.Wait(0)
        end
    end)
end

RegisterCommand("inventory", function(src)
    TriggerServerEvent("jph_rpgamemode:GetInventory")
end, false)