ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('larm', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId and ESX.GetPlayerFromId(source) or nil

    if xPlayer and xPlayer.job and xPlayer.job.name == 'police' then
        local coords = GetEntityCoords(GetPlayerPed(source))

        TriggerClientEvent('police:sendHelpNotification', -1, source, coords)
    end
end, false)
