local PlayerData = {}
local HasAlreadyEnteredMarker = false
local LastZone, CurrentAction = nil, nil
local CurrentActionMsg = ''
local CurrentActionData = {}

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

function MessageAvocat()
	Citizen.CreateThread(function()
    while messageavocatnotfinish do
    		Citizen.Wait(10)
			DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
		    while (UpdateOnscreenKeyboard() == 0) do
		        DisableAllControlActions(0);
		       Citizen.Wait(1)
		    end
		    if (GetOnscreenKeyboardResult()) then
		        local result = GetOnscreenKeyboardResult()
		        messageavocatnotfinish = false
		        TriggerServerEvent('clp_avocat:annonceAvocat',result)   
		    end
		end
	end)
end

local posqgavocat = {
	{x = -1898.46, y = -572.459, z = 11.25}
}

Citizen.CreateThread(function()
    for k in pairs(posqgavocat) do
	local blip = AddBlipForCoord(posqgavocat[k].x, posqgavocat[k].y, posqgavocat[k].z)
	SetBlipSprite(blip, 535)
	SetBlipAsShortRange(blip, true)
	SetBlipScale(blip, 0.6)
	SetBlipColour(blip, 24)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Avocat")
    EndTextCommandSetBlipName(blip)
    end
end)

function OpenAvocatActionsMenu()

	local elements = {
		{label = 'Tenue de travail', value = 'cloakroom'},
		{label = 'Tenue civile', value = 'cloakroom2'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'avocat_actions',
		{
			css = 'head',
			title = 'Avocat',
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'cloakroom' then
				menu.close()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    				if skin.sex == 0 then
        				TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
    				else
        				TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
    				end
				end)
			end

			if data.current.value == 'cloakroom2' then
				menu.close()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    				TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			if data.current.value == 'put_stock' then
    			OpenPutStocksAvocatMenu()
			end	

			if data.current.value == 'get_stock' then
				OpenGetStocksAvocatMenu()
			end	

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'avocat_actions_menu'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter'
			CurrentActionData = {}
		end
	)
end

function OpenAvocatVehiclesMenu()

	local elements = {
		{label = 'Sortir Véhicule', value = 'vehicle_list_avocat'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'avocat_vehicles',
		{
			css = 'head',
			title = 'Avocat',
			elements = elements
		},
		function(data, menu)
			local grade = ESX.PlayerData.job.grade_name
			if data.current.value == 'vehicle_list_avocat' then
				local elements = {
					{label = 'Felon', value = 'felon'}
				}

				if Config.EnablePlayerManagement and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
					table.insert(elements, {label = 'Baller', value = 'baller3'})
				end

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'spawn_avocat_vehicle',
					{
						css = 'head',
						title = 'Véhicule de service',
						elements = elements
					},
					function(data, menu)
						for i=1, #elements, 1 do							
							if Config.MaxInService == -1 then
								local playerPed = GetPlayerPed(-1)
								local coords = Config.Zones.VehicleSpawnPointAvocat.Pos
								local platenum = math.random(100, 900)
								ESX.Game.SpawnVehicle(data.current.value, coords, 327.23, function(vehicle)
									SetVehicleNumberPlateText(vehicle, "AVOC" .. platenum)
									TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
									local plate = GetVehicleNumberPlateText(vehicle)
              						plate = string.gsub(plate, " ", "")
									TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) -- vehicle lock
								end)
								break
							else
								ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
									if canTakeService then
										local playerPed = GetPlayerPed(-1)
										local coords = Config.Zones.VehicleSpawnPointAvocat.Pos
										ESX.Game.SpawnVehicle(data.current.value, coords, 327.23, function(vehicle)
											SetVehicleNumberPlateText(vehicle, "AVOC" .. platenum)
											TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
											local plate = GetVehicleNumberPlateText(vehicle)
              								plate = string.gsub(plate, " ", "")
											TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) -- vehicle lock
										end)
									else
										ESX.ShowNotification('Service complet : ' .. inServiceCount .. '/' .. maxInService)
									end
								end, 'avocat')
								break
							end
						end						
						menu.close()
					end,
					function(data, menu)
						menu.close()
						OpenAvocatVehiclesMenu()
					end
				)
			end	

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'avocat_vehicles_menu'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~ouvrir le garage'
			CurrentActionData = {}
		end
	)
end

function OpenMobileAvocatActionsMenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'mobile_avocat_actions',
		{
			css = 'head',
			title = 'Avocat',
			elements = {
				{label = 'Facturation',    value = 'billing'},
				-- {label = '----------------------------', value = nil},
				-- {label = 'Passer une annonce', value = 'announceAvocat'},
			}
		},
		function(data, menu)

			if data.current.value == 'billing' then
				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'billing',
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
								TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_avocat', 'Avocat', amount)
							end
						end
					end,
				function(data, menu)
					menu.close()
				end
				)
			end

			if data.current.value == 'announceAvocat' then
			    messageavocatnotfinish = true
				MessageAvocat()
			end

		end,
	function(data, menu)
		menu.close()
	end
	)
end

function OpenGetStocksAvocatMenu()

	ESX.TriggerServerCallback('clp_avocat:getStockItemsAvocat', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
		end

	  ESX.UI.Menu.Open(
	    'default', GetCurrentResourceName(), 'stocks_avocat_menu',
	    {
	    	css = 'head',
		    title = 'Avocat Stock',
		    elements = elements
	    },
	    function(data, menu)

	    	local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'stocks_avocat_menu_get_item_count',
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
							TriggerServerEvent('clp_avocat:getStockItemAvocat', itemName, count)
							Citizen.Wait(1000)
							OpenPutStocksAvocatMenu()
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

function OpenPutStocksAvocatMenu()

ESX.TriggerServerCallback('clp_jobs:getPlayerInventory', function(inventory)

		local elements = {}

		for i=1, #inventory.items, 1 do

			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
			end

		end

	  ESX.UI.Menu.Open(
	    'default', GetCurrentResourceName(), 'stocks_avocat_menu',
	    {
	    	css = 'head',
	        title = 'Inventaire',
	     	elements = elements
	    },
	    function(data, menu)

	    	local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'stocks_avocat_menu_put_item_count',
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

						TriggerServerEvent('clp_avocat:putStockItemsAvocat', itemName, count)
						Citizen.Wait(1000)
						OpenPutStocksAvocatMenu()
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

AddEventHandler('clp_avocat:hasEnteredMarker', function(zone)

	if zone == 'AvocatActions' then
		CurrentAction = 'avocat_actions_menu'
		CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter'
		CurrentActionData = {}
	elseif zone == 'VehicleSpawnAvocatMenu' then
		CurrentAction = 'avocat_vehicles_menu'
		CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~ouvrir le garage'
		CurrentActionData = {}
	elseif zone == 'VehicleDeleterAvocat' then
		local playerPed = GetPlayerPed(-1)
		if IsPedInAnyVehicle(playerPed,  false) then
			CurrentAction = 'delete_avocat_vehicle'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~r~ranger le véhicule.'
			CurrentActionData = {}
		end
	elseif zone == 'BossActionsAvocat' and ESX.PlayerData.job.grade_name == 'boss' then
		CurrentAction = 'boss_actions_avocat_menu'
		CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter'
		CurrentActionData = {}
	end

end)

AddEventHandler('clp_avocat:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)


-- Display markers
Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)		
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'avocat' then

			local coords = GetEntityCoords(GetPlayerPed(-1))
			
			for k,v in pairs(Config.Zones) do
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
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'avocat' then
			local coords = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker = false
			local currentZone = nil
			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
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
				TriggerEvent('clp_avocat:hasEnteredMarker', currentZone)
			end
			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('clp_avocat:hasExitedMarker', LastZone)
			end
		end
	end
end)



-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, false, -1)
            if IsControlJustReleased(0, 38) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'avocat' then

                if CurrentAction == 'avocat_actions_menu' then
                	OpenAvocatActionsMenu()
								elseif CurrentAction == 'boss_actions_avocat_menu' then
                	OpenBossActionsAvocatMenu()
                elseif CurrentAction == 'avocat_vehicles_menu' then
                	OpenAvocatVehiclesMenu()
                elseif CurrentAction == 'delete_avocat_vehicle' then
                    local playerPed = GetPlayerPed(-1)
                    local vehicle = GetVehiclePedIsIn(playerPed,  false)
                    local hash = GetEntityModel(vehicle)
                    local plate = GetVehicleNumberPlateText(vehicle)
                    if hash == GetHashKey('felon') or hash == GetHashKey('baller3') then
                        if Config.MaxInService ~= -1 then
                          TriggerServerEvent('esx_service:disableService', 'avocat')
                        end
                        DeleteVehicle(vehicle)
                        TriggerServerEvent('esx_vehiclelock:deletekeyjobs', 'no', plate) --vehicle lock
                    else
                        ESX.ShowNotification('Vous ne pouvez ranger que des ~b~véhicules Avocat~s~.')
                    end
								end
                CurrentAction = nil               
            end
        end

        if IsControlJustReleased(0, 167) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'avocat' then
            OpenMobileAvocatActionsMenu()
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
						
		if (afficheavocatnews == true) then
			DrawRect(0.494, 0.227, 5.185, 0.118, 0, 0, 0, 150)
			DrawAdvancedTextCNN(0.588, 0.14, 0.005, 0.0028, 0.8, "~r~ Avocat ~d~", 255, 255, 255, 255, 1, 0)
			DrawAdvancedTextCNN(0.586, 0.199, 0.005, 0.0028, 0.6, texteavocatafiche, 255, 255, 255, 255, 7, 0)
			DrawAdvancedTextCNN(0.588, 0.246, 0.005, 0.0028, 0.4, "", 255, 255, 255, 255, 0, 0)
		end 

	end
end)



RegisterNetEvent('clp_avocat:annonceAvocat')
AddEventHandler('clp_avocat:annonceAvocat', function(text)
	texteavocatafiche = text
	afficheavocatnews = true	
end) 


RegisterNetEvent('clp_avocat:annonceAvocatstop')
AddEventHandler('clp_avocat:annonceAvocatstop', function()
	afficheavocatnews = false	
end) 


function OpenBossActionsAvocatMenu()

	local elements = {
		{label = 'Déposer Stock', value = 'put_stock'},
		{label = 'Prendre Stock', value = 'get_stock'},
		{label = '----------------', value = nil},
		{label = 'Action Patron', value = 'boss_actions'},
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'boss_actions',
		{
			css = 'head',
			title = 'Boss',
			elements = elements
		},
		function(data, menu)

			if data.current.value == 'put_stock' then
				OpenPutStocksAvocatMenu()
			elseif data.current.value == 'get_stock' then
				OpenGetStocksAvocatMenu()
			elseif data.current.value == 'boss_actions' then
				TriggerEvent('esx_society:openBossMenu', 'avocat', function(data, menu)
					menu.close()
				end)
			end

		end,
		function(data, menu)
			menu.close()
			CurrentAction = 'boss_actions_avocat_menu'
			CurrentActionMsg = 'Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter.'
			CurrentActionData = {}
		end
	)
end

-- TELEPORTERS
AddEventHandler('esx_avocat:teleportMarkersAvocat', function(position)
  SetEntityCoords(GetPlayerPed(-1), position.x, position.y, position.z)
end)

-- Show top left hint
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if hintIsShowed == true then
      SetTextComponentFormat("STRING")
      AddTextComponentString(hintToDisplay)
      DisplayHelpTextFromStringLabel(0, 0, false, -1)
    end
  end
end)

-- Display teleport markers
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    --if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'avocat' then
      local coords = GetEntityCoords(GetPlayerPed(-1))

      for k,v in pairs(Config.TeleportZonesAvocat) do
        if(v.Marker ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
          DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
        end
      end

    --end

  end
end)

-- Activate teleport marker
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local position = nil
    local zone = nil

    --if  ESX.PlayerData.job ~= nil and  ESX.PlayerData.job.name == 'avocat' then

      for k,v in pairs(Config.TeleportZonesAvocat) do
        if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
          isInPublicMarker = true
          position = v.Teleport
          zone = v
          break
        else
          isInPublicMarker = false
        end
      end

      if IsControlJustReleased(0, 38) and isInPublicMarker then
        TriggerEvent('esx_avocat:teleportMarkersAvocat', position)
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

    --end

  end
end)
