local PlayerData, CurrentActionData, HandcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService, isInShopMenu = false, false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged = false
ESX = nil
locksound = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().org == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)


function OpenBodySearchMenu(player)
	ESX.TriggerServerCallback('clippy_menuil:getOtherPlayerData', function(data)
		local elements = {}

		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
				table.insert(elements, {
					label    = _U('confiscate_dirty', ESX.Math.Round(data.accounts[i].money)),
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end
		end

		table.insert(elements, {label = _U('guns_label')})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = _U('confiscate_weapon', ESX.GetWeaponLabel(data.weapons[i].name), data.weapons[i].ammo),
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = _U('inventory_label')})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
			css = 'head',
			title    = "Sac de la personne",
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			if data.current.value then
				TriggerServerEvent('clippy_menuil:confiscatePlayerItem', GetPlayerServerId(player), data.current.itemType, data.current.value, data.current.amount)
				OpenBodySearchMenu(player)
			end
		end, function(data, menu)
			menu.close()
			ClearPedTasksImmediately(GetPlayerPed(-1))
		end)
	end, GetPlayerServerId(player))
end

RegisterNetEvent('clippy_menuil:putInVehicle')
AddEventHandler('clippy_menuil:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(GetEntityCoords(playerPed), 5.0) then
		local vehicle = GetClosestVehicle(GetEntityCoords(playerPed), 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				dragStatus.isDragged = false
			end
		end
	end
end)

RegisterNetEvent('clippy_menuil:OutVehicle')
AddEventHandler('clippy_menuil:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	TriggerEvent('clippy_menuil:unrestrain')

	if not hasAlreadyJoined then
		TriggerServerEvent('clippy_menuil:spawned')
	end
	hasAlreadyJoined = true
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)


-- RegisterKeyMapping('+fouiller', 'Fouiller une personne', 'keyboard', 'G')

-- RegisterCommand("+fouiller", function()
	-- if not isDead then 
	-- 	if not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
	-- 		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	-- 		if closestPlayer ~= -1 and closestDistance <= 1.5 then
	-- 			TaskPlayAnim(PlayerPedId(), "rcmbarry", "bar_1_attack_idle_aln", 8.0,-8.0, 10000, 0, 0, false, false, false)
	-- 			TriggerServerEvent('clippy_menuil:message', GetPlayerServerId(closestPlayer), "~o~Quelqu'un vous fouille.")
	-- 			OpenBodySearchMenu(closestPlayer)
	-- 			ExecuteCommand('me fouille la personne')
	-- 		else 
	-- 			ESX.ShowNotification("~r~Aucunne personne présente.")
	-- 		end
	-- 	end
	-- end
-- end)
