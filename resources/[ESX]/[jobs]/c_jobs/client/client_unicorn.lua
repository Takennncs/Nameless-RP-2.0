local PlayerData = {}
local GUI = {}
GUI.Time = 0
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local OnJob = false
local BlipsUnicorn = {}
local JobBlipsUnicorn = {}
local JobBlipsUnicorn2 = {}
local Blips2Unicorn = {}
local JobBlips2Unicorn = {}

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'Unicorn',
		number     = 'unicorn',
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

function MessageUnicorn()
	Citizen.CreateThread(function()
    while messageunicornnotfinish do
    		Citizen.Wait(10)
			DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
		    while (UpdateOnscreenKeyboard() == 0) do
		        DisableAllControlActions(0);
		       Citizen.Wait(1)
		    end
		    if (GetOnscreenKeyboardResult()) then
		        local result = GetOnscreenKeyboardResult()
		        messageunicornnotfinish = false
		        TriggerServerEvent('clp_unicorn:annonceUnicorn',result)   
		    end


		end
	end)
end

function OpenUnicornActionsMenu()

	local elements = {
		{label = 'Tenue de travail', value = 'cloakroom_unicorn'},
		{label = 'Tenue civil', value = 'cloakroom2_unicorn'},
		{label = 'Déposer Stock', value = 'put_stock_unicorn'},
		{label = 'Prendre Stock', value = 'get_stock_unicorn'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'unicorn_actions',
		{
			css = 'head',
			title = 'Unicorn',
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'cloakroom_unicorn' then
				--menu.close()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    				if skin.sex == 0 then
        				TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
    				else
        				TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
    				end
				end)
			end

			if data.current.value == 'cloakroom2_unicorn' then
				--menu.close()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    				TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			if data.current.value == 'put_stock_unicorn' then
    			OpenPutStocksUnicornMenu()
			end	

			if data.current.value == 'get_stock_unicorn' then
				OpenGetStocksUnicornMenu()
			end	

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'unicorn_actions_menu'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter'
			CurrentActionData = {}
		end
	)
end

function OpenUnicornVehiclesMenu()

	local elements = {
		{label = 'Sortir Véhicule', value = 'vehicle_unicorn_list'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'unicorn_vehicles',
		{
			css = 'head',
			title = 'Unicorn',
			elements = elements
		},
		function(data, menu)
			local grade = ESX.PlayerData.job.grade_name
			if data.current.value == 'vehicle_unicorn_list' then
				local elements = {
					{label = 'Burrito livraison', value = 'burrito3'},
					--{label = 'Brioso', value = 'brioso'}
				}

				if Config.EnablePlayerManagement and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
					table.insert(elements, {label = 'Cognoscenti', value = 'cognoscenti'})
				end

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'spawn_unicorn_vehicle',
					{
						css = 'head',
						title = 'Véhicule de service',
						elements = elements
					},
					function(data, menu)
						for i=1, #elements, 1 do							
							if Config.MaxInService == -1 then
								local playerPed = GetPlayerPed(-1)
								local coords = Config.Zones8.VehicleSpawnUnicornPoint.Pos
								local platenum = math.random(100, 900)
								ESX.Game.SpawnVehicle(data.current.value, coords, 300.149, function(vehicle)
									SetVehicleNumberPlateText(vehicle, "UNIC" .. platenum)
									TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
									local plate = GetVehicleNumberPlateText(vehicle)
									TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) -- vehicle lock
								end)
								break
							else
								ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
									if canTakeService then
										local playerPed = GetPlayerPed(-1)
										local coords = Config.Zones8.VehicleSpawnUnicornPoint.Pos
										ESX.Game.SpawnVehicle(data.current.value, coords, 300.149, function(vehicle)
											SetVehicleNumberPlateText(vehicle, "UNIC" .. platenum)
											TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
											local plate = GetVehicleNumberPlateText(vehicle)
											TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) -- vehicle lock
										end)
									else
										ESX.ShowNotification('Service complet : ' .. inServiceCount .. '/' .. maxInService)
									end
								end, 'unicorn')
								break
							end
						end						
						menu.close()
					end,
					function(data, menu)
						menu.close()
						OpenUnicornVehiclesMenu()
					end
				)
			end	

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'unicorn_vehicles_menu'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~ouvrir le garage.'
			CurrentActionData = {}
		end
	)
end

function OpenUnicornHarvestMenu()

	local elements = {
		{label = 'Houblon', value = 'harvest_houblon'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'unicorn_harvest',
		{
			css = 'head',
			title = 'Ramasser du Houblon',
			elements = elements
		},
		function(data, menu)

			if data.current.value == 'harvest_houblon' then
				menu.close()
				TriggerServerEvent('clp_unicorn:startHarvestUnicorn')
			end

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'unicorn_harvest_menu'
			CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
			CurrentActionData = {}
		end
	)
end

function OpenUnicornHarvestMenu2()

	local elements = {
		{label = 'Malt', value = 'harvest_malt'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'unicorn_harvest2',
		{
			css = 'head',
			title = 'Ramasser du malt',
			elements = elements
		},
		function(data, menu)

			if data.current.value == 'harvest_malt' then
				menu.close()
				TriggerServerEvent('clp_unicorn:startHarvestUnicorn2')
			end

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'unicorn_harvest_menu2'
			CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
			CurrentActionData = {}
		end
	)
end

function OpenUnicornCraftMenu()

	local elements = {
		{label = 'Bière', value = 'craft_biere'},
		{label = 'Cocktail', value = 'craft_cocktail'},
		{label = 'Mojito', value = 'craft_mojito'},
		{label = 'Rhum', value = 'craft_rhum'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'unicorn_craft',
		{
			css = 'head',
			title = 'Distillation',
			elements = elements
		},
		function(data, menu)

			if data.current.value == 'craft_biere' then
				menu.close()
				TriggerServerEvent('clp_unicorn:startCraftUnicorn')
			elseif data.current.value == 'craft_cocktail' then
				menu.close()
				TriggerServerEvent('clp_unicorn:startCraftUnicorn2')
			elseif data.current.value == 'craft_mojito' then
				menu.close()
				TriggerServerEvent('clp_unicorn:startCraftUnicorn3')
			elseif data.current.value == 'craft_rhum' then
				menu.close()
				TriggerServerEvent('clp_unicorn:startCraftUnicorn4')
			end
			
		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'unicorn_craft_menu'
			CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
			CurrentActionData = {}
		end
	)
end

function OpenMobileUnicornActionsMenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'mobile_unicorn_actions',
		{
			css = 'head',
			title = 'Unicorn',
			elements = {
				{label = 'Facturation',    value = 'billing_unicorn'},
				-- {label = '----------------------------', value = nil},
				-- {label = 'Passer une annonce', value = 'announce_unicorn'},
			}
		},
		function(data, menu)

			if data.current.value == 'billing_unicorn' then
				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'unicorn_billing',
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
								TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_unicorn', 'unicorn', amount)
							end
						end
					end,
				function(data, menu)
					menu.close()
				end
				)
			end

			if data.current.value == 'announce_unicorn' then
			    messageunicornnotfinish = true
				MessageUnicorn()
			end

		end,
	function(data, menu)
		menu.close()
	end
	)
end

function OpenGetStocksUnicornMenu()

	ESX.TriggerServerCallback('clp_unicorn:getStockItemsUnicorn', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
		end

	  ESX.UI.Menu.Open(
	    'default', GetCurrentResourceName(), 'stocks_unicorn_menu',
	    {
	    	css = 'head',
		    title = 'Unicorn Stock',
		    elements = elements
	    },
	    function(data, menu)

	    	local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count_unicorn',
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
							TriggerServerEvent('clp_unicorn:getStockItemUnicorn', itemName, count)
							Citizen.Wait(1000)
							OpenGetStocksUnicornMenu()
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

function OpenPutStocksUnicornMenu()

	ESX.TriggerServerCallback('clp_jobs:getPlayerInventory', function(inventory)
	
			local elements = {}
	
			for i=1, #inventory.items, 1 do
	
				local item = inventory.items[i]
	
				if item.count > 0 then
					table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
				end
	
			end
	
			ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'stocks_menu_unicorn',
				{
					css = 'head',
					title = 'Inventaire',
					elements = elements
				},
				function(data, menu)
	
					local itemName = data.current.value
	
					ESX.UI.Menu.Open(
						'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count_unicorn',
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
	
							TriggerServerEvent('clp_unicorn:putStockItemsUnicorn', itemName, count)
							Citizen.Wait(1000)
							OpenPutStocksUnicornMenu()
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

function IsJobTrueUnicorn()
	if ESX.PlayerData ~= nil then
	  local IsJobTrueUnicorn = false
	  if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'unicorn' then
		IsJobTrueUnicorn = true
	  end
	  return IsJobTrueUnicorn
	end
end
  
local poscircuitunicorn = {
	{x = 1835.11, y = 5042.02, z = 57.25},
	{x = 1809.79, y = 5020.33, z = 56.45},
	{x = 131.47, y = -1285.19, z = 28.3}
}

Citizen.CreateThread(function()
    for k in pairs(poscircuitunicorn) do
	local blip = AddBlipForCoord(poscircuitunicorn[k].x, poscircuitunicorn[k].y, poscircuitunicorn[k].z)
	SetBlipSprite(blip, 1)
	--SetBlipDisplay(blip, 3)
	SetBlipScale(blip, 0.5)
	SetBlipColour(blip, 19)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Circuit Unicorn")
    EndTextCommandSetBlipName(blip)
    end
end)

local poscircuiunicornt = {
	{x = 128.96,  y = -1298.76,  z = 29.24}
}

Citizen.CreateThread(function()
    for k in pairs(poscircuiunicornt) do
	local blip = AddBlipForCoord(poscircuiunicornt[k].x, poscircuiunicornt[k].y, poscircuiunicornt[k].z)
	SetBlipSprite(blip, 304)
	--SetBlipDisplay(blip, 3)
	SetBlipAsShortRange(blip, true)
	SetBlipScale(blip, 0.6)
	SetBlipColour(blip, 19)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Unicorn")
    EndTextCommandSetBlipName(blip)
    end
end)

AddEventHandler('clp_unicorn:hasEnteredMarkerUnicorn', function(zone)

	if zone == 'UnicornActions' then
		CurrentAction = 'unicorn_actions_menu'
		CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter'
		CurrentActionData = {}
	elseif zone == 'HarvestUnicorn' then
		CurrentAction = 'unicorn_harvest_menu'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
	elseif zone == 'HarvestUnicorn2' then
		CurrentAction = 'unicorn_harvest_menu2'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
	elseif zone == 'UnicornCraft' then
		CurrentAction = 'unicorn_craft_menu'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
	elseif zone == 'VehicleSpawnUnicornMenu' then
		CurrentAction = 'unicorn_vehicles_menu'
		CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~ouvrir le garage.'
		CurrentActionData = {}
	elseif zone == 'VehicleUnicornDeleter' then
		local playerPed = GetPlayerPed(-1)
		if IsPedInAnyVehicle(playerPed,  false) then
			CurrentAction = 'delete_unicorn_vehicle'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~r~ranger le véhicule.'
			CurrentActionData = {}
		end
	elseif zone == 'BossActionsUnicorn' and ESX.PlayerData.job.grade_name == 'boss' then
		CurrentAction = 'boss_unicorn_actions_menu'
		CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter'
		CurrentActionData = {}
	end

end)

AddEventHandler('clp_unicorn:hasExitedMarkerUnicorn', function(zone)

	if zone == 'UnicornCraft' then
		TriggerServerEvent('clp_unicorn:stopCraftUnicorn')
		TriggerServerEvent('clp_unicorn:stopCraftUnicorn2')
		TriggerServerEvent('clp_unicorn:stopCraftUnicorn3')
		TriggerServerEvent('clp_unicorn:stopCraftUnicorn4')
	elseif zone == 'HarvestUnicorn' then
		TriggerServerEvent('clp_unicorn:stopHarvestUnicorn')
	elseif zone == 'HarvestUnicorn2' then
		TriggerServerEvent('clp_unicorn:stopHarvestUnicorn2')
	end

	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)


-- Display markers
Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)	
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'unicorn' then

			local coords = GetEntityCoords(GetPlayerPed(-1))
			
			for k,v in pairs(Config.Zones8) do
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
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'unicorn' then
			local coords = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker = false
			local currentZone = nil
			for k,v in pairs(Config.Zones8) do
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
				TriggerEvent('clp_unicorn:hasEnteredMarkerUnicorn', currentZone)
			end
			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('clp_unicorn:hasExitedMarkerUnicorn', LastZone)
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
            if IsControlJustReleased(1, 38) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'unicorn' then

                if CurrentAction == 'unicorn_actions_menu' then
                	OpenUnicornActionsMenu()
                elseif CurrentAction == 'unicorn_harvest_menu' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					--OpenUnicornHarvestMenu()
					Citizen.Wait(5000)
					TriggerServerEvent('clp_unicorn:startHarvestUnicorn')
				elseif CurrentAction == 'unicorn_harvest_menu2' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					Citizen.Wait(5000)
					--OpenUnicornHarvestMenu2()
					TriggerServerEvent('clp_unicorn:startHarvestUnicorn')
				elseif CurrentAction == 'boss_unicorn_actions_menu' then
                	OpenBossUnicornActionsMenu()
				elseif CurrentAction == 'unicorn_craft_menu' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					Citizen.Wait(5000)
					OpenUnicornCraftMenu()
                elseif CurrentAction == 'unicorn_vehicles_menu' then
                	OpenUnicornVehiclesMenu()
                elseif CurrentAction == 'delete_unicorn_vehicle' then
                    local playerPed = GetPlayerPed(-1)
                    local vehicle = GetVehiclePedIsIn(playerPed,  false)
                    local hash = GetEntityModel(vehicle)
                    local plate = GetVehicleNumberPlateText(vehicle)
					if hash == GetHashKey('burrito3') or
					--hash == GetHashKey('brioso') or
					hash == GetHashKey('cognoscenti') then
                        if Config.MaxInService ~= -1 then
                          TriggerServerEvent('esx_service:disableService', 'unicorn')
                        end
                        DeleteVehicle(vehicle)
                        	TriggerServerEvent('esx_vehiclelock:deletekeyjobs', 'no', plate) --vehicle lock
                    else
                        ESX.ShowNotification('Vous ne pouvez ranger que des ~b~véhicules de L\'Unicorn~s~.')
                    end
				end
                CurrentAction = nil               
            end
        end

        if IsControlJustReleased(1, 167) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'unicorn' then
            OpenMobileUnicornActionsMenu()
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
						
		if (afficheunicornnews == true) then
			DrawRect(0.494, 0.227, 5.185, 0.118, 0, 0, 0, 150)
			DrawAdvancedTextCNN(0.588, 0.14, 0.005, 0.0028, 0.8, "~r~ Unicorn ~d~", 255, 255, 255, 255, 1, 0)
			DrawAdvancedTextCNN(0.586, 0.199, 0.005, 0.0028, 0.6, texteunicornafiche, 255, 255, 255, 255, 7, 0)
			DrawAdvancedTextCNN(0.588, 0.246, 0.005, 0.0028, 0.4, "", 255, 255, 255, 255, 0, 0)
		end                
	end
end)



RegisterNetEvent('clp_unicorn:annonceUnicorn')
AddEventHandler('clp_unicorn:annonceUnicorn', function(text)
	texteunicornafiche = text
	afficheunicornnews = true	
end) 


RegisterNetEvent('clp_unicorn:annoncestopUnicorn')
AddEventHandler('clp_unicorn:annoncestopUnicorn', function()
	afficheunicornnews = false	
end) 


function OpenBossUnicornActionsMenu()

	local elements = {
		{label = 'Déposer Stock', value = 'put_stock_unicorn'},
		{label = 'Prendre Stock', value = 'get_stock_unicorn'},
		{label = '---------------', value = nil},
		{label = 'Action Patron', value = 'boss_unicorn_actions'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'boss_actions_unicorn',
		{
			css = 'head',
			title = 'Boss',
			elements = elements
		},
		function(data, menu)

			if data.current.value == 'put_stock_unicorn' then
				OpenPutStocksUnicornMenu()
			elseif data.current.value == 'get_stock_unicorn' then
				OpenGetStocksUnicornMenu()
			elseif data.current.value == 'boss_unicorn_actions' then
				TriggerEvent('esx_society:openBossMenu', 'unicorn', function(data, menu)
					menu.close()
				end)
			end

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'boss_unicorn_actions_menu'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter'
			CurrentActionData = {}
		end
	)
end

-- TELEPORTERS
AddEventHandler('esx_unicorn:teleportMarkersUnicorn', function(position)
	SetEntityCoords(GetPlayerPed(-1), position.x, position.y, position.z)
  end)
  
  -- Show top left hint
  Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
	  if hintIsShowed == true then
		SetTextComponentFormat("STRING")
		AddTextComponentString(hintToDisplay)
		DisplayHelpTextFromStringLabel(0, 0, 1, -1)
	  end
	end
  end)
  
  -- Display teleport markers
  Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
  
	  if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'unicorn' then
		local coords = GetEntityCoords(GetPlayerPed(-1))
  
		for k,v in pairs(Config.TeleportZonesUnicorn) do
		  if(v.Marker ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
			DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
		  end
		end
  
	  end
  
	end
  end)
  
  -- Activate teleport marker
  Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
	  local coords = GetEntityCoords(GetPlayerPed(-1))
	  local position = nil
	  local zone = nil
  
	  if  ESX.PlayerData.job ~= nil and  ESX.PlayerData.job.name == 'unicorn' then
  
		for k,v in pairs(Config.TeleportZonesUnicorn) do
		  if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
			isInPublicMarker = true
			position = v.Teleport
			zone = v
			break
		  else
			isInPublicMarker = false
		  end
		end
  
		if IsControlJustReleased(1, 38) and isInPublicMarker then
		  TriggerEvent('esx_unicorn:teleportMarkersUnicorn', position)
		end
  
		-- hide or show top left zone hints
		if isInPublicMarker then
		  hintToDisplay = zone.Hint
		  hintIsShowed = true
		else
		  if not isInMarker then
			hintToDisplay = "no hint to display"
			hintIsShowed = false
		  end
		end
  
	  end
  
	end
  end)

--[[ local unicornPeds = {
  -- Unicorn
  {model="mp_f_stripperlite",  x = 106.56,  y = -1299.56,  z = 28.76-0.98, a=220.84},
  {model="s_f_y_stripper_01",  x = 95.0,  y = -1292.68,  z = 29.28-0.98, a=298.67},
  {model="mp_f_stripperlite",  x = 131.64,  y = -1285.08,  z = 29.28-0.98, a=124.58},
  {model="s_f_y_hooker_02",  x = 135.84,  y = -1279.12,  z = 29.36-0.98, a=302.47}
}
			
			
Citizen.CreateThread(function()
			
	for k,v in ipairs(unicornPeds) do
		RequestModel(GetHashKey(v.model))
		while not HasModelLoaded(GetHashKey(v.model)) do
			Wait(50)
		end
			
		local unicPed = CreatePed(4, GetHashKey(v.model), v.x, v.y, v.z, v.a, false, false)
		SetBlockingOfNonTemporaryEvents(unicPed, false)
		FreezeEntityPosition(unicPed, true)
		SetPedFleeAttributes(unicPed, 1, 0)
		SetEntityInvincible(unicPed, true)
		SetPedDiesWhenInjured(unicPed, true)
		TaskStartScenarioInPlace(unicPed, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, 0)
			
		SetModelAsNoLongerNeeded(GetHashKey(v.model))
	end
end) ]]