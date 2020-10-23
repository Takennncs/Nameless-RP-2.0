local PlayerData = {}
local GUI = {}
GUI.Time = 0
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local OnJob = false

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'Vigneron',
		number     = 'vigne',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTV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'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

function MessageVigneron()
	Citizen.CreateThread(function()
    while messagevigneronnotfinish do
    		Citizen.Wait(10)
			DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
		    while (UpdateOnscreenKeyboard() == 0) do
		        DisableAllControlActions(0);
		       Citizen.Wait(1)
		    end
		    if (GetOnscreenKeyboardResult()) then
		        local result = GetOnscreenKeyboardResult()
		        messagevigneronnotfinish = false
		        TriggerServerEvent('clp_vigneron:annonceVigneron',result)   
		    end


		end
	end)
end

function OpenVigneronActionsMenu()

	local elements = {
		{label = 'Tenue de travail', value = 'cloakroom_vigneron'},
		{label = 'Tenue civil', value = 'cloakroom2_vigneron'},
		{label = 'Déposer Stock', value = 'put_stock_vigneron'},
		{label = 'Prendre Stock', value = 'get_stock_vigneron'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vigneron_actions',
		{
			css = 'head',
			title = 'Vigneron',
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'cloakroom_vigneron' then
				--menu.close()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    				if skin.sex == 0 then
						local clothesSkin = {
							['tshirt_1'] = 15, ['tshirt_2'] = 0,
							['torso_1'] = 42, ['torso_2'] = 0,
							['decals_1'] = 0,  ['decals_2'] = 0,
							--['mask_1'] = 46, ['mask_2'] = 0,
							['arms'] = 48,
							['pants_1'] = 63, ['pants_2'] = 0,
							['shoes_1'] = 42, ['shoes_2'] = 1,
							['helmet_1'] = -1, ['helmet_2'] = 0,
							['chain_1'] = 58, ['chain_2'] = 0,
							['bproof_1'] = 0,  ['bproof_2'] = 0,
							['bags_1'] = 0, ['bags_2'] = 0
						}
						TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    				else
						local clothesSkin = {
							['tshirt_1'] = 43, ['tshirt_2'] = 3,
							['torso_1'] = 61, ['torso_2'] = 3,
							['decals_1'] = 0,  ['decals_2'] = 0,
							['mask_1'] = 46, ['mask_2'] = 0,
							['arms'] = 101,
							['pants_1'] = 40, ['pants_2'] = 3,
							['shoes_1'] = 25, ['shoes_2'] = 0,
							['helmet_1'] = -1, ['helmet_2'] = 0,
							['bags_1'] = 44, ['bags_2'] = 0,
							['bproof_1'] = 0,  ['bproof_2'] = 0
						}
						TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    				end
				end)
			end

			if data.current.value == 'cloakroom2_vigneron' then
				--menu.close()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    				TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			if data.current.value == 'put_stock_vigneron' then
    			OpenPutStocksVigneronMenu()
			end	

			if data.current.value == 'get_stock_vigneron' then
				OpenGetStocksVigneronMenu()
			end	

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'vigneron_actions_menu'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter'
			CurrentActionData = {}
		end
	)
end

function OpenVigneronVehiclesMenu()

	local elements = {
		{label = 'Sortir Véhicule', value = 'vehicle_vigneron_list'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vigneron_vehicles',
		{
			css = 'head',
			title = 'Vigneron',
			elements = elements
		},
		function(data, menu)
			local grade = ESX.PlayerData.job.grade_name
			if data.current.value == 'vehicle_vigneron_list' then
				local elements = {
					{label = 'Rebel', value = 'rebel2'}
				}

				-- if Config.EnablePlayerManagement and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
				-- 	table.insert(elements, {label = 'Jackal Ocelot', value = 'jackal'})
				-- end

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'spawn_vigneron_vehicle',
					{
						css = 'head',
						title = 'Véhicule de service',
						elements = elements
					},
					function(data, menu)
						for i=1, #elements, 1 do							
							if Config.MaxInService == -1 then
								local playerPed = GetPlayerPed(-1)
								local coords = Config.Zones7.VehicleSpawnVigneronPoint.Pos
								local platenum = math.random(100, 900)
								ESX.Game.SpawnVehicle(data.current.value, coords, 223.46530151367, function(vehicle)
									SetVehicleNumberPlateText(vehicle, "VIGN" .. platenum)
									TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
									local plate = GetVehicleNumberPlateText(vehicle)
									TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) -- vehicle lock
								end)
								break
							else
								ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
									if canTakeService then
										local playerPed = GetPlayerPed(-1)
										local coords = Config.Zones7.VehicleSpawnVigneronPoint.Pos
										ESX.Game.SpawnVehicle(data.current.value, coords, 223.46530151367, function(vehicle)
											SetVehicleNumberPlateText(vehicle, "VIGN" .. platenum)
											TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
											local plate = GetVehicleNumberPlateText(vehicle)
											TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) -- vehicle lock
										end)
									else
										ESX.ShowNotification('Service complet : ' .. inServiceCount .. '/' .. maxInService)
									end
								end, 'vigneron')
								break
							end
						end						
						menu.close()
					end,
					function(data, menu)
						menu.close()
						OpenVigneronVehiclesMenu()
					end
				)
			end	

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'vigneron_vehicles_menu'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~ouvrir le garage.'
			CurrentActionData = {}
		end
	)
end

function OpenVigneronHarvestMenu()

	local elements = {
		{label = 'Raisin', value = 'harvest_vigneron'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vigneron_harvest',
		{
			css = 'head',
			title = 'Ramasser du Raisin',
			elements = elements
		},
		function(data, menu)

			if data.current.value == 'harvest_vigneron' then
				menu.close()
				TriggerServerEvent('clp_vigneron:startHarvestVigneron')
			end

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'vigneron_harvest_menu'
			CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
			CurrentActionData = {}
		end
	)
end

function OpenVigneronCraftMenu()

	local elements = {
		{label = 'Jus de raisin', value = 'craft_jusraisin'},
		{label = 'Vin', value = 'craft_vin'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vigneron_craft',
		{
			css = 'head',
			title = 'Distillation',
			elements = elements
		},
		function(data, menu)

			if data.current.value == 'craft_jusraisin' then
				menu.close()
				TriggerServerEvent('clp_vigneron:startCraftVigneron')
			elseif data.current.value == 'craft_vin' then
				menu.close()
				TriggerServerEvent('clp_vigneron:startCraftVigneron2')
			end
			

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'vigneron_craft_menu'
			CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
			CurrentActionData = {}
		end
	)
end

function OpenMobileVigneronActionsMenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'mobile_vigneron_actions',
		{
			css = 'head',
			title = 'Vigneron',
			elements = {
				{label = 'Facturation',    value = 'billing_vigneron'},
				-- {label = '----------------------------', value = nil},
				-- {label = 'Passer une annonce', value = 'announce_vigneron'},
			}
		},
		function(data, menu)

			if data.current.value == 'billing_vigneron' then
				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'vigneron_billing',
					{
						title = 'Montant de la facture'
					},
					function(data, menu)
						local amount = tonumber(data.value)
						if amount == nil then
							ESX.ShowNotification('Montant invalide')
						else							
							menu.close()							
							local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
							if closestPlayer == -1 or closestDistance > 3.0 then
								ESX.ShowNotification('Aucun joueur à proximité')
							else
								TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_vigneron', 'vigneron', amount)
							end
						end
					end,
				function(data, menu)
					menu.close()
				end
				)
			end

			if data.current.value == 'announce_vigneron' then
			    messagevigneronnotfinish = true
				MessageVigneron()
			end

		end,
	function(data, menu)
		menu.close()
	end
	)
end

function OpenGetStocksVigneronMenu()

	ESX.TriggerServerCallback('clp_vigneron:getStockItemsVigneron', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
		end

	  ESX.UI.Menu.Open(
	    'default', GetCurrentResourceName(), 'stocks_vigneron_menu',
	    {
	    	css = 'head',
		    title = 'Vigneron Stock',
		    elements = elements
	    },
	    function(data, menu)

	    	local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count_vigneron',
					{
						title = 'Quantité'
					},
					function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil then
							ESX.ShowNotification('Quantité invalide')
						else
						menu2.close()
				    	menu.close()
							TriggerServerEvent('clp_vigneron:getStockItemVigneron', itemName, count)
							Citizen.Wait(1000)
							OpenGetStocksVigneronMenu()
						end

					end,
					function(data2, menu2)
						menu2.close()
					end
				)

	    end,
	    function(data, menu)
	    	menu.close()
	    end
	  )

	end)

end

function OpenPutStocksVigneronMenu()

	ESX.TriggerServerCallback('clp_jobs:getPlayerInventory', function(inventory)
	
			local elements = {}
	
			for i=1, #inventory.items, 1 do
	
				local item = inventory.items[i]
	
				if item.count > 0 then
					table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
				end
	
			end
	
			ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'stocks_menu_vigneron',
				{
					css = 'head',
					title = 'Inventaire',
					 elements = elements
				},
				function(data, menu)
	
					local itemName = data.current.value
	
					ESX.UI.Menu.Open(
						'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count_vigneron',
						{
							title = 'Quantité'
						},
						function(data2, menu2)
	
							local count = tonumber(data2.value)
	
							if count == nil then
								ESX.ShowNotification('Quantité invalide')
							else
							menu2.close()
							menu.close()
	
							TriggerServerEvent('clp_vigneron:putStockItemsVigneron', itemName, count)
							Citizen.Wait(1000)
							OpenPutStocksVigneronMenu()
							end
	
						end,
						function(data2, menu2)
							menu2.close()
						end
					)
	
				end,
				function(data, menu)
					menu.close()
				end
			)
	
		end)
	
	end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

function IsJobTrueVigneron()
	if ESX.PlayerData ~= nil then
	  local IsJobTrueVigneron = false
	  if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'vigneron' then
		IsJobTrueVigneron = true
	  end
	  return IsJobTrueVigneron
	end
end

local poscircuitvigneron = {
	{x = -1781.36,  y = 2223.04,  z = 93.16},
	{x = 387.24,  y = 3585.8,  z = 33.28},
	{x = 1726.64,  y = 4765.56,  z = 41.92},
	{x = -167.36,  y = 6312.08,  z = 31.48}
}

Citizen.CreateThread(function()
    for k in pairs(poscircuitvigneron) do
	local blip = AddBlipForCoord(poscircuitvigneron[k].x, poscircuitvigneron[k].y, poscircuitvigneron[k].z)
	SetBlipSprite(blip, 1)
	--SetBlipDisplay(blip, 3)
	SetBlipAsShortRange(blip, true)
	SetBlipScale(blip, 0.5)
	SetBlipColour(blip, 7)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Circuit Vigneron")
    EndTextCommandSetBlipName(blip)
    end
end)

local poscircuitvigneronc = {
	{x = -1889.64,  y = 2047.0,  z = 140.88}
}

Citizen.CreateThread(function()
    for k in pairs(poscircuitvigneronc) do
	local blip = AddBlipForCoord(poscircuitvigneronc[k].x, poscircuitvigneronc[k].y, poscircuitvigneronc[k].z)
	SetBlipSprite(blip, 85)
	--SetBlipDisplay(blip, 3)
	SetBlipAsShortRange(blip, true)
	SetBlipScale(blip, 0.6)
	SetBlipColour(blip, 7)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Vigneron")
    EndTextCommandSetBlipName(blip)
    end
end)


AddEventHandler('clp_vigneron:hasEnteredMarkerVigneron', function(zone)

	if zone == 'VigneronActions' then
		CurrentAction = 'vigneron_actions_menu'
		CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter'
		CurrentActionData = {}
	elseif zone == 'HarvestVigneron' then
		CurrentAction = 'vigneron_harvest_menu'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
	elseif zone == 'HarvestVigneron2' then
		CurrentAction = 'vigneron_harvest_menu'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
	elseif zone == 'VigneronCraft' then
		CurrentAction = 'vigneron_craft_menu'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
	elseif zone == 'VigneronSellFarm' then
		CurrentAction = 'vigneron_sell_menu'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {zone = zone}
	elseif zone == 'VigneronSellFarm2' then
		CurrentAction = 'vigneron_sell_menu2'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {zone = zone}
	elseif zone == 'VehicleSpawnVigneronMenu' then
		CurrentAction = 'vigneron_vehicles_menu'
		CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~ouvrir le garage.'
		CurrentActionData = {}
	elseif zone == 'VehicleVigneronDeleter' then
		local playerPed = GetPlayerPed(-1)
		if IsPedInAnyVehicle(playerPed,  false) then
			CurrentAction = 'delete_vigneron_vehicle'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~r~ranger le véhicule.'
			CurrentActionData = {}
		end
	elseif zone == 'BossActionsVigneron' and ESX.PlayerData.job.grade_name == 'boss' then
		CurrentAction = 'boss_vigneron_actions_menu'
		CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu ~g~patron.'
		CurrentActionData = {}
	end

end)

AddEventHandler('clp_vigneron:hasExitedMarkerVigneron', function(zone)

	if zone == 'VigneronCraft' then
		TriggerServerEvent('clp_vigneron:stopCraftVigneron')
		TriggerServerEvent('clp_vigneron:stopCraftVigneron2')
	elseif zone == 'HarvestVigneron' then
		TriggerServerEvent('clp_vigneron:stopHarvestVigneron')
	elseif zone == 'HarvestVigneron2' then
		TriggerServerEvent('clp_vigneron:stopHarvestVigneron')
	elseif zone == 'VigneronSellFarm' then
		TriggerServerEvent('clp_vigneron:stopSellVigneron')
	elseif zone == 'VigneronSellFarm2' then
		TriggerServerEvent('clp_vigneron:stopSellVigneron2')
	end

	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)


-- Display markers
Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)	
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'vigneron' then

			local coords = GetEntityCoords(GetPlayerPed(-1))
			
			for k,v in pairs(Config.Zones7) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					attente = 1
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
					break
				else
					attente = 150
				end
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'vigneron' then
			local coords = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker = false
			local currentZone = nil
			for k,v in pairs(Config.Zones7) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 5.5) then
					attente = 1
					isInMarker = true
					currentZone = k
					break
				else
					attente = 150
				end
			end
			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone = currentZone
				TriggerEvent('clp_vigneron:hasEnteredMarkerVigneron', currentZone)
			end
			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('clp_vigneron:hasExitedMarkerVigneron', LastZone)
			end
		end
	end
end)



-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, false, -1)
            if IsControlJustReleased(0, 38) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'vigneron' then

                if CurrentAction == 'vigneron_actions_menu' then
                	OpenVigneronActionsMenu()
                elseif CurrentAction == 'vigneron_harvest_menu' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					--OpenVigneronHarvestMenu()
					TriggerServerEvent('clp_vigneron:startHarvestVigneron')
					Citizen.Wait(5000)
				elseif CurrentAction == 'boss_vigneron_actions_menu' then
                	OpenBossVigneronActionsMenu()
                elseif CurrentAction == 'vigneron_craft_menu' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					OpenVigneronCraftMenu()
					Citizen.Wait(5000)
				elseif CurrentAction == 'vigneron_sell_menu' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					TriggerServerEvent('clp_vigneron:startSellVigneron', CurrentActionData.zone)
					Citizen.Wait(5000)
				elseif CurrentAction == 'vigneron_sell_menu2' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					TriggerServerEvent('clp_vigneron:startSellVigneron2', CurrentActionData.zone)
					Citizen.Wait(5000)
                elseif CurrentAction == 'vigneron_vehicles_menu' then
                	OpenVigneronVehiclesMenu()
                elseif CurrentAction == 'delete_vigneron_vehicle' then
                    local playerPed = GetPlayerPed(-1)
                    local vehicle = GetVehiclePedIsIn(playerPed,  false)
                    local hash = GetEntityModel(vehicle)
                    local plate = GetVehicleNumberPlateText(vehicle)
					if hash == GetHashKey('rebel2') or
					hash == GetHashKey('jackal') then
                        if Config.MaxInService ~= -1 then
                          TriggerServerEvent('esx_service:disableService', 'vigneron')
                        end
                        DeleteVehicle(vehicle)
                        	TriggerServerEvent('esx_vehiclelock:deletekeyjobs', 'no', plate) --vehicle lock
                    else
                        ESX.ShowNotification('Vous ne pouvez ranger que des ~b~véhicules Vigneron~s~.')
                    end
				end
                CurrentAction = nil               
            end
        end

        if IsControlJustReleased(0, 167) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'vigneron' then
            OpenMobileVigneronActionsMenu()
		end
		
    end
end)

function DrawAdvancedTextCNN (x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end


 Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)    
						
		if (affichevigneronnews == true) then
			DrawRect(0.494, 0.227, 5.185, 0.118, 0, 0, 0, 150)
			DrawAdvancedTextCNN(0.588, 0.14, 0.005, 0.0028, 0.8, "~r~ Vigneron ~d~", 255, 255, 255, 255, 1, 0)
			DrawAdvancedTextCNN(0.586, 0.199, 0.005, 0.0028, 0.6, textevigneronafiche, 255, 255, 255, 255, 7, 0)
			DrawAdvancedTextCNN(0.588, 0.246, 0.005, 0.0028, 0.4, "", 255, 255, 255, 255, 0, 0)
		end                
	end
end)



RegisterNetEvent('clp_vigneron:annonceVigneron')
AddEventHandler('clp_vigneron:annonceVigneron', function(text)
	textevigneronafiche = text
	affichevigneronnews = true	
end) 


RegisterNetEvent('clp_vigneron:annoncestopVigneron')
AddEventHandler('clp_vigneron:annoncestopVigneron', function()
	affichevigneronnews = false	
end) 


function OpenBossVigneronActionsMenu()

	local elements = {
		{label = 'Déposer Stock', value = 'put_stock_vigneron'},
		{label = 'Prendre Stock', value = 'get_stock_vigneron'},
		{label = '---------------', value = nil},
		{label = 'Action Patron', value = 'boss_vigneron_actions'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'boss_actions_vigneron',
		{
			css = 'head',
			title = 'Boss',
			elements = elements
		},
		function(data, menu)

			if data.current.value == 'put_stock_vigneron' then
				OpenPutStocksVigneronMenu()
			elseif data.current.value == 'get_stock_vigneron' then
				OpenGetStocksVigneronMenu()
			elseif data.current.value == 'boss_vigneron_actions' then
				TriggerEvent('esx_society:openBossMenu', 'vigneron', function(data, menu)
					menu.close()
				end)
			end

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'boss_vigneron_actions_menu'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter'
			CurrentActionData = {}
		end
	)
end


--[[ local tabacPeds = {
  -- Vigneron
  {model="mp_f_execpa_02",  x = -1874.52,  y = 2059.24,  z = 135.92-0.98, a=72.74},
  {model="mp_f_boatstaff_01",  x = -1890.36,  y = 2064.28,  z = 145.56-0.98, a=252.98},
  {model="mp_f_execpa_02",  x = -1924.08,  y = 2054.4,  z = 140.84-0.98, a=261.18},
  {model="mp_f_execpa_01",  x = -1927.04,  y = 2042.08,  z = 140.84-0.98, a=259.51},
  {model="mp_f_execpa_01",  x = -1502.76,  y = 1521.68,  z = 115.28-0.98, a=171.95}
  }
		  
		  
  Citizen.CreateThread(function()
		  
	  for k,v in ipairs(tabacPeds) do
		  RequestModel(GetHashKey(v.model))
		  while not HasModelLoaded(GetHashKey(v.model)) do
			  Wait(50)
		  end
		  
		  local tabaccPed = CreatePed(4, GetHashKey(v.model), v.x, v.y, v.z, v.a, false, false)
		  SetBlockingOfNonTemporaryEvents(tabaccPed, false)
		  FreezeEntityPosition(tabaccPed, true)
		  SetPedFleeAttributes(tabaccPed, 1, 0)
		  SetEntityInvincible(tabaccPed, true)
		  SetPedDiesWhenInjured(tabaccPed, true)
		  TaskStartScenarioInPlace(tabaccPed, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, 0)
		  
		  SetModelAsNoLongerNeeded(GetHashKey(v.model))
	  end
  end) ]]