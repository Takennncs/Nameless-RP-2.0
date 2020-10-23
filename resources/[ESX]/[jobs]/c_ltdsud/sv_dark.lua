ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'ltd', 'LTD', 'society_ltd', 'society_ltd', 'society_ltd', {type = 'public'})

RegisterServerEvent('KrXDarhop:buy')
AddEventHandler('KrXDarhop:buy', function(price, item, label)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= price then
	xPlayer.removeMoney(price)
    	xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Merci pour votre ~g~achat !", "", 1)
     else
          TriggerClientEvent('esx:showNotification', source, "Pas assez ~r~d'argent sur vous")    end
end)



RegisterServerEvent('Announceltdsudo')
AddEventHandler('Announceltdsudo', function()   
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD Sud', '~b~Magasin', 'Le LTD (Sud) est ouvert venez chercher ce dont vous avez besoin !', 'CHAR_AMANDA')
	end
end)


RegisterServerEvent('Announceltdsudofermer')
AddEventHandler('Announceltdsudofermer', function()    
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD Sud', '~b~Magasin', 'Le LTD (Sud) est fermer !', 'CHAR_AMANDA')
	end
end)

RegisterServerEvent('Announceltdnord')
AddEventHandler('Announceltdnord', function()   
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD Nord', '~b~Magasin', 'Le LTD (Nord) est ouvert venez chercher ce dont vous avez besoin !', 'CHAR_AMANDA')
	end
end)


RegisterServerEvent('Announceltdnordfermer')
AddEventHandler('Announceltdnordfermer', function()    
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD Nord', '~b~Magasin', 'Le LTD (Nord) est fermer !', 'CHAR_AMANDA')
	end
end)
