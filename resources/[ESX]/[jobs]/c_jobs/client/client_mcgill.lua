local PlayerData = {}
local GUI = {}
GUI.Time = 0
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local OnJob = false
local jobonlycarpen = false


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


function OpenCarpenterActionsMenu()
	local elements = {
		{label = 'Tenue de travail', value = 'cloakroom_Carpenter'},
		{label = 'Tenue civil', value = 'cloakroom2_Carpenter'}
	}
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'Carpenter_actions',
		{
			css = 'head',
			title = 'McGill',
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'cloakroom_Carpenter' then
				jobonlycarpen = true
				menu.close()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    				if skin.sex == 0 then
						local clothesSkin = {
							['tshirt_1'] = 90, ['tshirt_2'] = 0,
							['torso_1'] = 56, ['torso_2'] = 0,
							['decals_1'] = 0, ['decals_2'] = 0,
							['mask_1'] = 0, ['mask_2'] = 0,
							['arms'] = 0,
							['pants_1'] = 90, ['pants_2'] = 7,
							['shoes_1'] = 25, ['shoes_2'] = 0,
							['helmet_1'] = 0, ['helmet_2'] = 0,
							['glasses_1'] = 6, ['glasses_2'] = 0,
							['watches_1'] = 13, ['watches_2'] = 0,
							['bags_1'] = 0, ['bags_2'] = 0,
							['bproof_1'] = 0, ['bproof_2'] = 0
						}
						TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    				else
						local clothesSkin = {
							['tshirt_1'] = 43, ['tshirt_2'] = 0,
							['torso_1'] = 61, ['torso_2'] = 0,
							['decals_1'] = 0, ['decals_2'] = 0,
							['mask_1'] = 46, ['mask_2'] = 0,
							['arms'] = 101,
							['pants_1'] = 40, ['pants_2'] = 0,
							['shoes_1'] = 25, ['shoes_2'] = 0,
							['helmet_1'] = -1, ['helmet_2'] = 0,
							['bags_1'] = 44, ['bags_2'] = 0,
							['bproof_1'] = 0, ['bproof_2'] = 0
						}
						TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    				end
				end)
			end

			if data.current.value == 'cloakroom2_Carpenter' then
				jobonlycarpen = false
				menu.close()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    				TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'Carpenter_actions_menu'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter'
			CurrentActionData = {}
		end
	)
end

function OpenCarpenterVehiclesMenu()

	local elements = {
		{label = 'Sortir Véhicule', value = 'vehicle_Carpenter_list'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'Carpenter_vehicles',
		{
			css = 'head',
			title = 'McGill',
			elements = elements
		},
		function(data, menu)
			local grade = ESX.PlayerData.job.grade_name
			if data.current.value == 'vehicle_Carpenter_list' then
				local elements = {
					{label = 'Camion', value = 'burrito4'}
				}

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'spawn_Carpenter_vehicle',
					{
						css = 'head',
						title = 'Véhicule de service',
						elements = elements
					},
					function(data, menu)
						for i=1, #elements, 1 do							
							if Config.MaxInService == -1 then
								local playerPed = GetPlayerPed(-1)
								local coords = Config.Zones9.VehicleSpawnCarpenterPoint.Pos
								local platenum = math.random(100, 900)
								ESX.Game.SpawnVehicle(data.current.value, coords, 142.87393188477, function(vehicle)
									SetVehicleNumberPlateText(vehicle, "GILL" .. platenum)
									TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
									local plate = GetVehicleNumberPlateText(vehicle)
									TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate)
								end)
								break
							else
								ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
									if canTakeService then
										local playerPed = GetPlayerPed(-1)
										local coords = Config.Zones9.VehicleSpawnCarpenterPoint.Pos
										ESX.Game.SpawnVehicle(data.current.value, coords, 142.87393188477, function(vehicle)
											SetVehicleNumberPlateText(vehicle, "GILL" .. platenum)
											TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
											local plate = GetVehicleNumberPlateText(vehicle)
											TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate)
										end)
									else
										ESX.ShowNotification('Service complet : ' .. inServiceCount .. '/' .. maxInService)
									end
								end, 'Carpenter')
								break
							end
						end						
						menu.close()
					end,
					function(data, menu)
						menu.close()
						OpenCarpenterVehiclesMenu()
					end
				)
			end	

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'Carpenter_vehicles_menu'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~ouvrir le garage'
			CurrentActionData = {}
		end
	)
end



RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


local poscircuitgcgill = {
	{x = -504.96, y = -939.92, z = 24.0},
	{x = 923.36, y = -1517.24, z = 31.0},
	{x = 139.12, y =  -378.84, z = 43.24}
}

Citizen.CreateThread(function()
    for k in pairs(poscircuitgcgill) do
	local blip = AddBlipForCoord(poscircuitgcgill[k].x, poscircuitgcgill[k].y, poscircuitgcgill[k].z)
	SetBlipSprite(blip, 1)
	--SetBlipDisplay(blip, 3)
	SetBlipAsShortRange(blip, true)
	SetBlipScale(blip, 0.5)
	SetBlipColour(blip, 46)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Circuit McGill")
    EndTextCommandSetBlipName(blip)
    end
end)

local poscircuimcgills = {
	{x = -98.92,  y = -1021.32,  z = 27.28}
}

Citizen.CreateThread(function()
    for k in pairs(poscircuimcgills) do
	local blip = AddBlipForCoord(poscircuimcgills[k].x, poscircuimcgills[k].y, poscircuimcgills[k].z)
	SetBlipSprite(blip, 124)
	--SetBlipDisplay(blip, 3)
	SetBlipAsShortRange(blip, true)
	SetBlipScale(blip, 0.6)
	SetBlipColour(blip, 46)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("LS McGill")
    EndTextCommandSetBlipName(blip)
    end
end)


AddEventHandler('clp_Carpenter:hasEnteredMarkerCarpenter', function(zone)

	if zone == 'CarpenterActions' then
		CurrentAction = 'Carpenter_actions_menu'
		CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter'
		CurrentActionData = {}
	elseif zone == 'HarvestCarpenter' and jobonlycarpen then
		CurrentAction = 'Carpenter_harvest_menu'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
	elseif zone == 'CarpenterCraft2' and jobonlycarpen then
		CurrentAction = 'Carpenter_craft_menu2'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
	elseif zone == 'CarpenterSellFarm' and jobonlycarpen then
		CurrentAction = 'Carpenter_sell_menu'
		CurrentActionMsg = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {zone = zone}
	elseif zone == 'VehicleSpawnCarpenterMenu' and jobonlycarpen then
		CurrentAction = 'Carpenter_vehicles_menu'
		CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~ouvrir le garage'
		CurrentActionData = {}
	elseif zone == 'VehicleCarpenterDeleter' then
		local playerPed = GetPlayerPed(-1)
		if IsPedInAnyVehicle(playerPed,  false) then
			CurrentAction = 'delete_Carpenter_vehicle'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~r~ranger le véhicule'
			CurrentActionData = {}
		end
	elseif zone == 'BossActionsCarpenter' and ESX.PlayerData.job.grade_name == 'boss' then
		CurrentAction = 'boss_Carpenter_actions_menu'
		CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter'
		CurrentActionData = {}
	end
end)

AddEventHandler('clp_Carpenter:hasExitedMarkerCarpenter', function(zone)

	if zone == 'CarpenterCraft2' then
		TriggerServerEvent('clp_Carpenter:stopCraftCarpenter2')
		TriggerServerEvent('clp_Carpenter:stopCraftCarpenter3')
		ESX.DrawMissionText("~r~Vous avez quitté la zone.", 3800)
	elseif zone == 'HarvestCarpenter' then
		TriggerServerEvent('clp_Carpenter:stopHarvestCarpenter')
		ESX.DrawMissionText("~r~Vous avez quitté la zone.", 3800)
	elseif zone == 'CarpenterSellFarm' then
		TriggerServerEvent('clp_Carpenter:stopSellCarpenter')
		ESX.DrawMissionText("~r~Vous avez quitté la zone.", 3800)
	end
	CurrentAction = nil
	--ESX.UI.Menu.CloseAll()
end)


Citizen.CreateThread(function()
	while true do		
		Citizen.Wait(5)	
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for k,v in pairs(Config.Zones9) do
			if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
			local coords = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker = false
			local currentZone = nil
			for k,v in pairs(Config.Zones9) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 5.5) then
					isInMarker = true
					currentZone = k
				end
			end
			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone = currentZone
				TriggerEvent('clp_Carpenter:hasEnteredMarkerCarpenter', currentZone)
			end
			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('clp_Carpenter:hasExitedMarkerCarpenter', LastZone)
			end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 0, -1)
			if IsControlJustReleased(0, 38) then

                if CurrentAction == 'Carpenter_actions_menu' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
                	OpenCarpenterActionsMenu()
				elseif CurrentAction == 'Carpenter_harvest_menu' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					Citizen.Wait(5000)
                	TriggerServerEvent('clp_Carpenter:startHarvestCarpenter')
				elseif CurrentAction == 'boss_Carpenter_actions_menu' then
                	OpenBossCarpenterActionsMenu()
				elseif CurrentAction == 'Carpenter_craft_menu' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					Citizen.Wait(5000)
					TriggerServerEvent('clp_Carpenter:startCraftCarpenter')
				elseif CurrentAction == 'Carpenter_craft_menu2' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					Citizen.Wait(5000)
					TriggerServerEvent('clp_Carpenter:startCraftCarpenter2')
				elseif CurrentAction == 'Carpenter_sell_menu' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					Citizen.Wait(5000)
					TriggerServerEvent('clp_Carpenter:startSellCarpenter', CurrentActionData.zone)
				elseif CurrentAction == 'Carpenter_sell_menu2' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					Citizen.Wait(5000)
                	TriggerServerEvent('clp_Carpenter:startSellCarpenter2', CurrentActionData.zone)
                elseif CurrentAction == 'Carpenter_vehicles_menu' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and jobonlycarpen then
                	OpenCarpenterVehiclesMenu()
                elseif CurrentAction == 'delete_Carpenter_vehicle' then
                    local playerPed = GetPlayerPed(-1)
                    local vehicle = GetVehiclePedIsIn(playerPed,  false)
                    local hash = GetEntityModel(vehicle)
                    local plate = GetVehicleNumberPlateText(vehicle)
					if hash == GetHashKey('burrito4') then
                        if Config.MaxInService ~= -1 then
                          TriggerServerEvent('esx_service:disableService', 'Carpenter')
                        end
                        DeleteVehicle(vehicle)
                        	TriggerServerEvent('esx_vehiclelock:deletekeyjobs', 'no', plate) --vehicle lock
                    else
                        ESX.ShowNotification('~r~Vous ne pouvez ranger que des véhicules du McGill.')
                    end
				end
                CurrentAction = nil               
            end
        end

		
    end
end)