ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_jb_radars:PayFine')
AddEventHandler('esx_jb_radars:PayFine', function(fine)
	local ammende = fine
	local xPlayer = ESX.GetPlayerFromId(source)
	local societyAccount = nil

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)
		societyAccount = account
	end)

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_sheriff', function(account)
		societyAccount = account
	end)

	if societyAccount ~= nil then
	   xPlayer.removeAccountMoney('bank', ammende)
	   societyAccount.addMoney(ammende)
	end
end)

local IsEnabled = false
ESX.RegisterUsableItem('coyotte', function(source)
	if not IsEnabled then
		IsEnabled  = true
		TriggerClientEvent('esx_jb_radars:ShowRadarBlip', source)
		TriggerClientEvent('esx:ShowNotification',source, "~g~Vous venez d'activer votre radar trafiqué.")
	else
		TriggerClientEvent('esx_jb_radars:RemoveRadarBlip', source)
		--TriggerClientEvent('esx:showNotification', source, "Ton coyotte est désactivé.")
		IsEnabled = false
	end
end)

RegisterServerEvent('esx:onRemoveInventoryItem')
AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
	if item.name ~= nil and item.name == 'coyotte' and item.count == 0 then
		IsEnabled = false
		TriggerClientEvent('esx_jb_radars:RemoveRadarBlip', source)
		TriggerClientEvent('esx:showNotification', source, "~r~Vous venez de désactiver votre radar trafiqué.")
	end
end)

RegisterServerEvent('esx_jb_radars:notifpolice')
AddEventHandler('esx_jb_radars:notifpolice', function(plate, kmhSpeed, fine, maxSpeed)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
	    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	    if xPlayer.job.name == 'police' and xPlayer.job.name == 'sheriff' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], "~b~Plaque flaché :~r~ "..plate.."\n~b~Vitesse :~r~ "..kmhSpeed.."~b~\nAmende :~g~ +"..fine.."$")
			--TriggerClientEvent('esx:showNotification', xPlayers[i], "Et a reçu une ~r~amende ~w~de " .. fine .. "$")
	    end
    end
end)

RegisterServerEvent('esx_jb_radars:notifpoliceforpolice')
AddEventHandler('esx_jb_radars:notifpoliceforpolice', function(plate, kmhSpeed, maxSpeed)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
	    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	    if xPlayer.job.name == 'police' and xPlayer.job.name == 'sheriff' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], "~b~Plaque flaché :~r~ "..plate.."\n~b~Vitesse :~r~ "..kmhSpeed.."~b~\nAmende :~g~ +"..fine.."$")
			--TriggerClientEvent('esx:showNotification', xPlayers[i], "Et n'a pas reçu d'amende car c'est un membre du LSPD")
	    end
    end
end)