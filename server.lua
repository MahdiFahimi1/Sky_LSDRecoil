if Config.Base == 'oldesx' then
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif Config.Base == 'newesx' then
	ESX = exports["es_extended"]:getSharedObject()
end

RegisterServerEvent('Sky_LSDRecoil:removelsdinventory')
AddEventHandler('Sky_LSDRecoil:removelsdinventory', function(itemName, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer then
        local playerInventory = xPlayer.inventory
        local hasLSD = false
        for _, item in pairs(playerInventory) do
            if item.name == "lsd" then 
                hasLSD = true
                break
            end
        end

        if not hasLSD then
            TriggerClientEvent('chatMessage', _source, '^3Sky_LSDRecoil : ^0Shoma LSD nadarid')
                
        else
            xPlayer.removeInventoryItem(itemName, amount)
        end
    end
end)


RegisterNetEvent('LSD', function(source, args)
    local player = source
    local itemName = 'lsd'

    local playerInventory = ESX.GetPlayerFromId(player).getInventoryItem(itemName)

    if playerInventory and playerInventory.count > 0 then
        TriggerClientEvent('Sky_LSDRecoil:RunLSD', player)
    else
        TriggerClientEvent('chatMessage', player, '^1Sky_LSDRecoil : ^0Shoma LSD nadarid', 'Dar inventory shoma lsd nist')
    end
end, false)


RegisterServerEvent('Sky_LSDRecoil:addlsdinventory')
AddEventHandler('Sky_LSDRecoil:addlsdinventory', function(itemName, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer then
        xPlayer.addInventoryItem(itemName, amount)
    end
end)

ESX.RegisterUsableItem('lsd', function(source)
    local player = source
    local itemName = 'lsd'

    local playerInventory = ESX.GetPlayerFromId(player).getInventoryItem(itemName)

    if Config.Use1 then

    if playerInventory and playerInventory.count > 0 then
        TriggerClientEvent('Sky_LSDRecoil:RunLSD', player)
    else
        TriggerClientEvent('chatMessage', player, '^1Sky_LSDRecoil : ^0Shoma LSD nadarid', 'Dar inventory shoma lsd nist')
    end
end

end)