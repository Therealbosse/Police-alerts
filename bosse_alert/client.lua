ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)

RegisterNetEvent('police:sendHelpNotification')
AddEventHandler('police:sendHelpNotification', function(source, coords)
    while ESX == nil do
        Citizen.Wait(10)
    end

    ESX.TriggerServerCallback('esx:getPlayerData', function(data)
        if data.job and data.job.name == 'police' then
            ESX.ShowNotification('En kollega är i fara, kolla din GPS!')

            local blip = AddBlipForCoord(coords.x, coords.y, coords.z)

            SetBlipSprite(blip, 161)
            SetBlipScale(blip, 1.2)
            SetBlipColour(blip, 1)
            BeginTextCommandSetBlipName("STRING")
            EndTextCommandSetBlipName(blip)

            Citizen.SetTimeout(60000, function()
                RemoveBlip(blip)
            end)
        end
    end)
end)
