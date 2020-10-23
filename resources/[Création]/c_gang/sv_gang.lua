ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_organisation:registerOrganisation', 'biker', 'Biker', 'organisation_biker', 'organisation_biker', 'organisation_biker', {type = 'public'})
TriggerEvent('esx_organisation:registerOrganisation', 'ballas', 'Ballas', 'organisation_ballas', 'organisation_ballas', 'organisation_ballas', {type = 'public'})
TriggerEvent('esx_organisation:registerOrganisation', 'lost', 'Lost', 'organisation_lost', 'organisation_lost', 'organisation_lost', {type = 'public'})
TriggerEvent('esx_organisation:registerOrganisation', 'vagos', 'Vagos', 'organisation_vagos', 'organisation_vagos', 'organisation_vagos', {type = 'public'})
TriggerEvent('esx_organisation:registerOrganisation', 'families', 'Families', 'organisation_families', 'organisation_families', 'organisation_families', {type = 'public'})
TriggerEvent('esx_organisation:registerOrganisation', 'triade', 'Triade', 'organisation_triade', 'organisation_triade', 'organisation_triade', {type = 'public'})
TriggerEvent('esx_organisation:registerOrganisation', 'aztecas', 'Aztecas', 'organisation_aztecas', 'organisation_aztecas', 'organisation_aztecas', {type = 'public'})
TriggerEvent('esx_organisation:registerOrganisation', 'Marabunta', 'Marabunta', 'organisation_Marabunta', 'organisation_Marabunta', 'organisation_Marabunta', {type = 'public'})
TriggerEvent('esx_organisation:registerOrganisation', 'Madrazo', 'Madrazo', 'organisation_Madrazo', 'organisation_Madrazo', 'organisation_Madrazo', {type = 'public'})
TriggerEvent('esx_organisation:registerOrganisation', 'SinaLoa', 'SinaLoa', 'organisation_SinaLoa', 'organisation_SinaLoa', 'organisation_SinaLoa', {type = 'public'})
TriggerEvent('esx_organisation:registerOrganisation', 'blanchisseur', 'Blanchisseur', 'organisation_blanchisseur', 'organisation_blanchisseur', 'organisation_blanchisseur', {type = 'public'})
TriggerEvent('esx_organisation:registerOrganisation', 'Arkan', 'Arkan', 'organisation_Arkan', 'organisation_Arkan', 'organisation_Arkan', {type = 'public'})

ESX.RegisterServerCallback('Destination_Gang:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})
end)

RegisterServerEvent('Destination_Biker:putStockItems')
AddEventHandler('Destination_Biker:putStockItems', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_biker', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez ajouté ') .. count .. ' ~b~' .. item.label)
	end)	

end)

RegisterServerEvent('Destination_Biker:getStockItem')
AddEventHandler('Destination_Biker:getStockItem', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_biker', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez retiré ') .. count .. ' ~b~' .. item.label)
	end)	

end)

ESX.RegisterServerCallback('Destination_Biker:getStockItems', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
    
	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_biker', function(inventory)
		cb(inventory.items)
	end)

end)

RegisterServerEvent('Destination_Blanchisseur:putStockItems')
AddEventHandler('Destination_Blanchisseur:putStockItems', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_blanchisseur', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez ajouté ') .. count .. ' ~b~' .. item.label)
	end)	

end)

RegisterServerEvent('Destination_Blanchisseur:getStockItem')
AddEventHandler('Destination_Blanchisseur:getStockItem', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_blanchisseur', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez retiré ') .. count .. ' ~b~' .. item.label)
	end)	

end)

ESX.RegisterServerCallback('Destination_Blanchisseur:getStockItems', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
    
	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_blanchisseur', function(inventory)
		cb(inventory.items)
	end)

end)

-------------------------------------------------------------------------------------------------------------
RegisterServerEvent('Destination_Arkan:putStockItems')
AddEventHandler('Destination_Arkan:putStockItems', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_Arkan', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez ajouté ') .. count .. ' ~b~' .. item.label)
	end)	

end)

RegisterServerEvent('Destination_Arkan:getStockItem')
AddEventHandler('Destination_Arkan:getStockItem', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_Arkan', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez retiré ') .. count .. ' ~b~' .. item.label)
	end)	

end)

ESX.RegisterServerCallback('Destination_Arkan:getStockItems', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
    
	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_Arkan', function(inventory)
		cb(inventory.items)
	end)

end)


-------------------------------------------------------------------------------------------------------------

RegisterServerEvent('Destination_SinaLoa:putStockItems')
AddEventHandler('Destination_SinaLoa:putStockItems', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_SinaLoa', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez ajouté ') .. count .. ' ~b~' .. item.label)
	end)	

end)

RegisterServerEvent('Destination_SinaLoa:getStockItem')
AddEventHandler('Destination_SinaLoa:getStockItem', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_SinaLoa', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez retiré ') .. count .. ' ~b~' .. item.label)
	end)	

end)

ESX.RegisterServerCallback('Destination_SinaLoa:getStockItems', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
    
	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_SinaLoa', function(inventory)
		cb(inventory.items)
	end)

end)

---------------------------------------------------------------------------------------------------------

RegisterServerEvent('Destination_Families:putStockItems')
AddEventHandler('Destination_Families:putStockItems', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_families', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez ajouté ') .. count .. ' ~b~' .. item.label)
	end)	

end)

RegisterServerEvent('Destination_Families:getStockItem')
AddEventHandler('Destination_Families:getStockItem', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_families', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez retiré ') .. count .. ' ~b~' .. item.label)
	end)	

end)

ESX.RegisterServerCallback('Destination_Families:getStockItems', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
    
	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_families', function(inventory)
		cb(inventory.items)
	end)

end)

---------------------------------------------------------------------------------------------------------

RegisterServerEvent('Destination_Triade:putStockItems')
AddEventHandler('Destination_Triade:putStockItems', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_triade', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez ajouté ') .. count .. ' ~b~' .. item.label)
	end)	

end)

RegisterServerEvent('Destination_Triade:getStockItem')
AddEventHandler('Destination_Triade:getStockItem', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_triade', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez retiré ') .. count .. ' ~b~' .. item.label)
	end)	

end)

ESX.RegisterServerCallback('Destination_Triade:getStockItems', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
    
	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_triade', function(inventory)
		cb(inventory.items)
	end)

end)


---------------------------------------------------------------------------------------------------------

RegisterServerEvent('Destination_Aztecas:putStockItems')
AddEventHandler('Destination_Aztecas:putStockItems', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_aztecas', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez ajouté ') .. count .. ' ~b~' .. item.label)
	end)	

end)

RegisterServerEvent('Destination_Aztecas:getStockItem')
AddEventHandler('Destination_Aztecas:getStockItem', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_aztecas', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez retiré ') .. count .. ' ~b~' .. item.label)
	end)	

end)

ESX.RegisterServerCallback('Destination_Aztecas:getStockItems', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
    
	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_aztecas', function(inventory)
		cb(inventory.items)
	end)

end)


-----------------------------------------------------------------------------------------------------------------

RegisterServerEvent('Destination_Marabunta:putStockItems')
AddEventHandler('Destination_Marabunta:putStockItems', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_Marabunta', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez ajouté ') .. count .. ' ~b~' .. item.label)
	end)	

end)

RegisterServerEvent('Destination_Marabunta:getStockItem')
AddEventHandler('Destination_Marabunta:getStockItem', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_Marabunta', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez retiré ') .. count .. ' ~b~' .. item.label)
	end)	

end)

ESX.RegisterServerCallback('Destination_Marabunta:getStockItems', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
    
	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_Marabunta', function(inventory)
		cb(inventory.items)
	end)

end)

-----------------------------------------------------------------------------------------------------------------
RegisterServerEvent('Destination_Madrazo:putStockItems')
AddEventHandler('Destination_Madrazo:putStockItems', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_Madrazo', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez ajouté ') .. count .. ' ~b~' .. item.label)
	end)	

end)

RegisterServerEvent('Destination_Madrazo:getStockItem')
AddEventHandler('Destination_Madrazo:getStockItem', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_Madrazo', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez retiré ') .. count .. ' ~b~' .. item.label)
	end)	

end)

ESX.RegisterServerCallback('Destination_Madrazo:getStockItems', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
    
	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_Madrazo', function(inventory)
		cb(inventory.items)
	end)

end)


----------------------------------------------------------------------------------------------------------------

RegisterServerEvent('Destination_Ballas:putStockItems')
AddEventHandler('Destination_Ballas:putStockItems', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_ballas', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez ajouté ') .. count .. ' ~b~' .. item.label)
	end)	

end)

RegisterServerEvent('Destination_Ballas:getStockItem')
AddEventHandler('Destination_Ballas:getStockItem', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_ballas', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez retiré ') .. count .. ' ~b~' .. item.label)
	end)	

end)

ESX.RegisterServerCallback('Destination_Ballas:getStockItems', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
    
	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_ballas', function(inventory)
		cb(inventory.items)
	end)

end)

RegisterServerEvent('Destination_Lost:putStockItems')
AddEventHandler('Destination_Lost:putStockItems', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_lost', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez ajouté ') .. count .. ' ~b~' .. item.label)
	end)	

end)

RegisterServerEvent('Destination_Lost:getStockItem')
AddEventHandler('Destination_Lost:getStockItem', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_lost', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez retiré ') .. count .. ' ~b~' .. item.label)
	end)	

end)

ESX.RegisterServerCallback('Destination_Lost:getStockItems', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
    
	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_lost', function(inventory)
		cb(inventory.items)
	end)

end)

RegisterServerEvent('Destination_Vagos:putStockItems')
AddEventHandler('Destination_Vagos:putStockItems', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_vagos', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez ajouté ') .. count .. ' ~b~' .. item.label)
	end)	

end)

RegisterServerEvent('Destination_Vagos:getStockItem')
AddEventHandler('Destination_Vagos:getStockItem', function(itemName, count)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_vagos', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			xPlayer.showNotification(('~r~Quantité Invalide~w~'))
		end

		xPlayer.showNotification(('Vous avez retiré ') .. count .. ' ~b~' .. item.label)
	end)	

end)

ESX.RegisterServerCallback('Destination_Vagos:getStockItems', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
    
	TriggerEvent('esx_addoninventory:getSharedInventory', 'organisation_vagos', function(inventory)
		cb(inventory.items)
	end)

end)

--------------------------------------------------------------------------------------------------------------------

ESX.RegisterServerCallback('Destination_Vagos:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_vagos', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('Destination_Marabunta:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_Madrazo', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)


ESX.RegisterServerCallback('Destination_Ballas:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_ballas', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('Destination_Lost:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_lost', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('Destination_Families:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_families', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('Destination_Triade:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_triade', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('Destination_Aztecas:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_aztecas', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('Destination_Biker:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_biker', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('Destination_SinaLoa:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_SinaLoa', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('Destination_Blanchisseur:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_blanchisseur', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('Destination_Arkan:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_Arkan', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)


ESX.RegisterServerCallback('Destination_Vagos:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_vagos', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Ballas:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_ballas', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Lost:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_lost', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)


ESX.RegisterServerCallback('Destination_Families:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_families', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)


ESX.RegisterServerCallback('Destination_Triade:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_triade', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Aztecas:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_aztecas', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)



ESX.RegisterServerCallback('Destination_Marabunta:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_Marabunta', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Madrazo:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_Madrazo', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)



ESX.RegisterServerCallback('Destination_Biker:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_biker', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_SinaLoa:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_SinaLoa', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Blanchisseur:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_blanchisseur', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Arkan:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_Arkan', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)


ESX.RegisterServerCallback('Destination_Vagos:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_vagos', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Ballas:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_ballas', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Families:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_families', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Triade:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_triade', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Aztecas:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_aztecas', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Marabunta:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_Marabunta', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)


ESX.RegisterServerCallback('Destination_Madrazo:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_Madrazo', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Lost:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_lost', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Biker:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_biker', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_SinaLoa:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_SinaLoa', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Blanchisseur:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_blanchisseur', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('Destination_Arkan:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'organisation_Arkan', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)