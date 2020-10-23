ESX = nil
Config                            = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_organisation:registerOrganisation', 'sacra', 'Sacra', 'organisation_sacra', 'organisation_sacra', 'organisation_sacra', {type = 'public'})


RegisterServerEvent('clippy_menuil:confiscatePlayerItem')
AddEventHandler('clippy_menuil:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		-- does the target player have enough in their inventory?
		if targetItem.count > 0 and targetItem.count <= amount then

			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
				--TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
				TriggerClientEvent('esx:showNotification', source, "~r~Tu ne peux pas voler.")
			else
				--targetXPlayer.removeInventoryItem(itemName, amount)
				--sourceXPlayer.addInventoryItem   (itemName, amount)
				--TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated', amount, sourceItem.label, targetXPlayer.name))
				--TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated', amount, sourceItem.label, sourceXPlayer.name))
				TriggerClientEvent('esx:showNotification', source, "~r~Tu ne peux pas voler.")
			end
		else
			TriggerClientEvent('esx:showNotification', source, "~r~Tu ne peux pas voler.")
			--TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end

	elseif itemType == 'item_account' then
--[[ 		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney   (itemName, amount)
		TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_account', amount, itemName, targetXPlayer.name))
		TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_account', amount, itemName, sourceXPlayer.name)) ]]
		TriggerClientEvent('esx:showNotification', source, "~r~Tu ne peux pas voler.")

	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end
--[[ 		targetXPlayer.removeWeapon(itemName, amount)
		sourceXPlayer.addWeapon   (itemName, amount)
		TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount))
		TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name)) ]]
		TriggerClientEvent('esx:showNotification', source, "~r~Tu ne peux pas voler.")
	end
end)

RegisterServerEvent('clippy_menuil:putInVehicle')
AddEventHandler('clippy_menuil:putInVehicle', function(target)
	TriggerClientEvent('clippy_menuil:putInVehicle', target)
end)

RegisterServerEvent('clippy_menuil:OutVehicle')
AddEventHandler('clippy_menuil:OutVehicle', function(target)
	TriggerClientEvent('clippy_menuil:OutVehicle', target)
end)

ESX.RegisterServerCallback('clippy_menuil:getOtherPlayerData', function(source, cb, target)
	if Config.EnableESXIdentity then
		local xPlayer = ESX.GetPlayerFromId(target)
		local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		})

		local firstname = result[1].firstname
		local lastname  = result[1].lastname
		local sex       = result[1].sex
		local dob       = result[1].dateofbirth
		local height    = result[1].height

		local data = {
			name      = GetPlayerName(target),
			job       = xPlayer.job,
			inventory = xPlayer.inventory,
			accounts  = xPlayer.accounts,
			weapons   = xPlayer.loadout,
			firstname = firstname,
			lastname  = lastname,
			sex       = sex,
			dob       = dob,
			height    = height
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		if Config.EnableLicenses then
			TriggerEvent('esx_license:getLicenses', target, function(licenses)
				data.licenses = licenses
				cb(data)
			end)
		else
			cb(data)
		end
	else
		local xPlayer = ESX.GetPlayerFromId(target)

		local data = {
			name       = GetPlayerName(target),
			job        = xPlayer.job,
			inventory  = xPlayer.inventory,
			accounts   = xPlayer.accounts,
			weapons    = xPlayer.loadout
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status then
				data.drunk = math.floor(status.percent)
			end
		end)

		TriggerEvent('esx_license:getLicenses', target, function(licenses)
			data.licenses = licenses
		end)

		cb(data)
	end
end)

ESX.RegisterServerCallback('clippy_menuil:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)


ESX.RegisterServerCallback('clippy_menuil:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb( { items = items } )
end)

AddEventHandler('playerDropped', function()
	local _source = source

	if _source ~= nil then
		local xPlayer = ESX.GetPlayerFromId(_source)

		if xPlayer ~= nil and xPlayer.org ~= nil and xPlayer.org.name == 'sacra' then
			Citizen.Wait(5000)
			TriggerClientEvent('clippy_menuil:updateBlip', -1)
		end
	end
end)

RegisterServerEvent('clippy_menuil:spawned')
AddEventHandler('clippy_menuil:spawned', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer ~= nil and xPlayer.org ~= nil and xPlayer.org.name == 'sacra' then
		Citizen.Wait(5000)
		TriggerClientEvent('clippy_menuil:updateBlip', -1)
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_phone:removeNumber', 'sacra')
	end
end)

RegisterServerEvent('clippy_menuil:message')
AddEventHandler('clippy_menuil:message', function(target, msg)
	TriggerClientEvent('esx:showNotification', target, msg)
end)