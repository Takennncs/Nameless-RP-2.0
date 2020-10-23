ESX = nil
local PlayerData                = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end

	while ESX.GetPlayerData().org == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setOrg')
AddEventHandler('esx:setOrg', function(org)
	ESX.PlayerData.org = org
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(10)
		-- print(ESX.PlayerData.org.name)
        -----------------------------------------------------------------------------------------------------------------------------

        local vehicule = {}

        if ESX.PlayerData.org and ESX.PlayerData.org.name == 'families' then
	        table.insert(vehicule, {x = -220.20, y = -1706.42, z = 33.93})
		end

		if ESX.PlayerData.org and ESX.PlayerData.org.name == 'triade' then
	        table.insert(vehicule, {x = -220.20, y = -1706.42, z = 33.93})
		end

		if ESX.PlayerData.org and ESX.PlayerData.org.name == 'aztecas' then
	        table.insert(vehicule, {x = -220.20, y = -1706.42, z = 33.93})
		end
		
		if ESX.PlayerData.org and ESX.PlayerData.org.name == 'Marabunta' then
	        table.insert(vehicule, {x = -220.20, y = -1706.42, z = 33.93})
		end

		if ESX.PlayerData.org and ESX.PlayerData.org.name == 'Madrazo' then
	        table.insert(vehicule, {x = -220.20, y = -1706.42, z = 33.93})
        end

        if ESX.PlayerData.org and ESX.PlayerData.org.name == 'biker' then
	        table.insert(vehicule, {x = 984.62, y = -139.45, z = 74.04})
        end

        if ESX.PlayerData.org and ESX.PlayerData.org.name == 'ballas' then
	        table.insert(vehicule, {x = 116.45748138428, y = -1950.3718261719, z = 20.751382827759})
        end

        if ESX.PlayerData.org and ESX.PlayerData.org.name == 'vagos' then
	        table.insert(vehicule, {x = 335.89, y = -2044.81, z = 21.09})
        end    

        if ESX.PlayerData.org and ESX.PlayerData.org.name == 'SinaLoa' then
	        table.insert(vehicule, {x = -220.20, y = -1706.42, z = 33.93})
        end 

        if ESX.PlayerData.org and ESX.PlayerData.org.name == 'blanchisseur' then
	        table.insert(vehicule, {x = -2597.1, y = 1927.1, z = 167.1})
		end 
		if ESX.PlayerData.org and ESX.PlayerData.org.name == 'Arkan' then
	        table.insert(vehicule, {x = -2597.1, y = 1927.1, z = 167.1})
        end 

		local coords = GetEntityCoords(GetPlayerPed(-1))
        
        local blanchisseur = {
        	{-2597.1, 1927.1, 167.1}, -- Spawn
        	{-2601.17, 1930.10, 167.31}, -- Deleter
        	{-2597.1, 1927.1, 167.1},
        	{1138.02, -3194.24, -40.39}
        }

		for _,v in pairs(blanchisseur) do
          if ESX.PlayerData.org and ESX.PlayerData.org.name == 'blanchisseur' then
			if(21 ~= -1 and GetDistanceBetweenCoords(coords, v[1], v[2], v[3], true) < 100) then
				DrawMarker(21, v[1], v[2], v[3], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 0, 0, 0, 100, false, true, 2, false, false, false, false)
			end
          end
		end

        local deleter = {
        	{x = 83.70, y = -1974.07, z = 20.92},
            {x = 1000.89, y = -130.53, z = 74.06}, -- Biker
            {x = -230.86, y = -1699.38, z = 34.91},
            {x = 331.11, y = -2045.06, z = 20.76},
           {x = -134.22, y = 1005.81, z = 234.73}, -- SinaLoa
           {x = -2601.17, y = 1930.10, z = 167.31} -- blanchisseur
        }

        local stock = {}

        if ESX.PlayerData.org and ESX.PlayerData.org.name == 'ballas' then
	        table.insert(stock, {x = 85.711631774902, y = -1959.38671875, z = 21.121673583984})
		end
		
		if ESX.PlayerData.org and ESX.PlayerData.org.name == 'lost' then
	        table.insert(stock, {x = 1118.12,  y = -3143.84,  z = -37.08})
        end

        if ESX.PlayerData.org and ESX.PlayerData.org.name == 'biker' then
	        table.insert(stock, {x = 56.76,  y = 3690.28,  z = 39.92})
        end

        if ESX.PlayerData.org and ESX.PlayerData.org.name == 'families' then
	        table.insert(stock, {x = -134.87, y = -1609.68, z = 35.03})
		end

		if ESX.PlayerData.org and ESX.PlayerData.org.name == 'triade' then
	        table.insert(stock, {x = -899.29, y = -1447.26, z = 7.526})
		end
 
		if ESX.PlayerData.org and ESX.PlayerData.org.name == 'aztecas' then
	        table.insert(stock, {x = -134.87, y = -1609.68, z = 35.03})
		end

		if ESX.PlayerData.org and ESX.PlayerData.org.name == 'Marabunta' then
	        table.insert(stock, {x = 1436.84,  y = -1489.16,  z = 66.6})
		end
		
		if ESX.PlayerData.org and ESX.PlayerData.org.name == 'Madrazo' then
	        table.insert(stock, {x = 1405.44,  y = 1137.92,  z = 109.76})
        end

        if ESX.PlayerData.org and ESX.PlayerData.org.name == 'vagos' then
	        table.insert(stock, {x = 343.39, y = -2021.24, z = 22.39})
        end  

        if ESX.PlayerData.org and ESX.PlayerData.org.name == 'SinaLoa' then
	        table.insert(stock, {x = -1500.79, y = 834.80, z = 178.70})
        end

        if ESX.PlayerData.org and ESX.PlayerData.org.name == 'blanchisseur' then
	        table.insert(stock, {x = 1138.02, y = -3194.24, z = -40.39})
		end  
		if ESX.PlayerData.org and ESX.PlayerData.org.name == 'Arkan' then
	        table.insert(stock, {x = 1535.15, y = 2221.37, z = 76.46})
        end  

        for k in pairs(vehicule) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), vehicule[k].x, vehicule[k].y, vehicule[k].z) < 1 then
		        if IsControlJustPressed(1,51) then 
                    OpenVehicleMenu()
		        end
            end
        end

        for k in pairs(deleter) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), deleter[k].x, deleter[k].y, deleter[k].z) < 1.5 then
		        if IsControlJustPressed(1,51) then 
               	    local playerPed = PlayerPedId()

				    local vehicle = ESX.Game.GetVehicleInDirection()

				    if DoesEntityExist(vehicle) then
					    ESX.ShowNotification(('Vehicule ~r~Ranger'))
					    ESX.Game.DeleteVehicle(vehicle)
				    else
					    ESX.ShowNotification(('Vous devez être ~r~près d\'un véhicule~s~ pour le ranger'))
				    end 
		        end
            end
        end

        for k in pairs(stock) do
			if Vdist2(GetEntityCoords(PlayerPedId(), false), stock[k].x, stock[k].y, stock[k].z) < 1 then
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~ouvrir le coffre")
		        if IsControlJustPressed(1,51) then 
                    OpenStockMenu()
		        end
            end
        end
    end
end)

-------------------------------------------------------------------------------------------------------------------------------------

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
    local vehicle = CreateVehicle(car, x, y, z, h, true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    
    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)
    if ESX.PlayerData.org and ESX.PlayerData.org.name == 'vagos' then
    SetVehicleCustomPrimaryColour(vehicle, 240, 255, 0)
    SetVehicleCustomSecondaryColour(vehicle, 240, 255, 0)  
    elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'families' then
    SetVehicleCustomPrimaryColour(vehicle, 101, 255, 0)
	SetVehicleCustomSecondaryColour(vehicle, 101, 255, 0)
	elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'triade' then
    SetVehicleCustomPrimaryColour(vehicle, 101, 255, 0)
	SetVehicleCustomSecondaryColour(vehicle, 101, 255, 0)
    elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'aztecas' then
    SetVehicleCustomPrimaryColour(vehicle, 101, 255, 0)
	SetVehicleCustomSecondaryColour(vehicle, 101, 255, 0)
    elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Marabunta' then
    SetVehicleCustomPrimaryColour(vehicle, 101, 255, 0)
	SetVehicleCustomSecondaryColour(vehicle, 101, 255, 0)
    elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Madrazo' then
    SetVehicleCustomPrimaryColour(vehicle, 101, 255, 0)
    SetVehicleCustomSecondaryColour(vehicle, 101, 255, 0)
    elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'biker' then
    SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
	SetVehicleCustomSecondaryColour(vehicle, 0, 0, 0)
    elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'lost' then
    SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
    SetVehicleCustomSecondaryColour(vehicle, 0, 0, 0)
    elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'ballas' then
    SetVehicleCustomPrimaryColour(vehicle, 135, 0, 255)
    SetVehicleCustomSecondaryColour(vehicle, 135, 0, 255)   
    elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'arme' then
    SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
    SetVehicleCustomSecondaryColour(vehicle, 0, 0, 0)
    elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'blanchisseur' then
    SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
    SetVehicleCustomSecondaryColour(vehicle, 0, 0, 0) 	
    elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Arkan' then
    SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
    SetVehicleCustomSecondaryColour(vehicle, 0, 0, 0) 	
    end
    SetEntityAsMissionEntity(vehicle, true, true)
end

-------------------------------------------------------------------------------------------------------------------------------------

function OpenStockMenu()

	local elements = {
        {label = ('Prendre Stock'), value = 'get_stock'},
        {label = ('Déposer Stock'), value = 'put_stock'},
	    {label = ('Prendre Arme'), value = 'get_weapon'},
	    {label = ('Déposer Arme'), value = 'put_weapon'}
	}

	if ESX.PlayerData.org and ESX.PlayerData.org.gradeorg_name == 'boss' then 
		table.insert(elements, {label = ('Action Patron'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'actions', {
			css = 'head',
			title    = 'Menu organistation',
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'get_stock' then
				if ESX.PlayerData.org and ESX.PlayerData.org.name == 'vagos' then
                    OpenGetStocksMenuVagos()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'ballas' then
					OpenGetStocksMenuBallas()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'lost' then
				    OpenGetStocksMenuLost()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'families' then	
					OpenGetStocksMenuFamilies()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'triade' then	
					OpenGetStocksMenuTriade()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'aztecas' then	
					OpenGetStocksMenuAztecas()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Marabunta' then	
					OpenGetStocksMenuMarabunta()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Madrazo' then	
				    OpenGetStocksMenuMadrazo()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'biker' then
				    OpenGetStocksMenuBiker()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'SinaLoa' then
				    OpenGetStocksMenuSinaLoa()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'blanchisseur' then
					OpenGetStocksMenuBlanchisseur()		
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Arkan' then
				    OpenGetStocksMenuArkan()					    				    
				end			
			end

			if data.current.value == 'put_stock' then
				OpenPutStocksMenu()
			end

			if data.current.value == 'boss_actions' then
				local organisation = ESX.PlayerData.org.name
				TriggerEvent('esx_organisation:openBossMenu', 'organisation', function(data, menu)
					menu.close()
				end)
				print('non')
				if ESX.PlayerData.org and ESX.PlayerData.org.name == 'vagos' then
				    TriggerEvent('esx_organisation:openBossMenu', 'vagos', function(data, menu)
					    menu.close()
				    end)
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'ballas' then
				    TriggerEvent('esx_organisation:openBossMenu', 'ballas', function(data, menu)
						menu.close()
						print('ballas')
					end)
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'lost' then
				    TriggerEvent('esx_organisation:openBossMenu', 'lost', function(data, menu)
					    menu.close()
				    end)
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'families' then	
				    TriggerEvent('esx_organisation:openBossMenu', 'families', function(data, menu)
					    menu.close()
					end)
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'triade' then	
				    TriggerEvent('esx_organisation:openBossMenu', 'triade', function(data, menu)
					    menu.close()
					end)
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'aztecas' then	
				    TriggerEvent('esx_organisation:openBossMenu', 'aztecas', function(data, menu)
					    menu.close()
					end)
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Marabunta' then	
				    TriggerEvent('esx_organisation:openBossMenu', 'Marabunta', function(data, menu)
					    menu.close()
					end)
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Madrazo' then	
				    TriggerEvent('esx_organisation:openBossMenu', 'Madrazo', function(data, menu)
					    menu.close()
				    end)
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'biker' then
				    TriggerEvent('esx_organisation:openBossMenu', 'biker', function(data, menu)
					    menu.close()
				    end)
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'SinaLoa' then
				    TriggerEvent('esx_organisation:openBossMenu', 'SinaLoa', function(data, menu)
					    menu.close()
				    end)
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'blanchisseur' then
				    TriggerEvent('esx_organisation:openBossMenu', 'blanchisseur', function(data, menu)
					    menu.close()
					end)	
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Arkan' then
				    TriggerEvent('esx_organisation:openBossMenu', 'Arkan', function(data, menu)
					    menu.close()
				    end)				 		
				end
			end

	        if data.current.value == 'get_weapon' then
				if ESX.PlayerData.org and ESX.PlayerData.org.name == 'vagos' then
                    OpenGetWeaponMenuVagos()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'ballas' then
					OpenGetWeaponMenuBallas()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'lost' then
				    OpenGetWeaponMenuLost()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'families' then	
					OpenGetWeaponMenuFamilies()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'triade' then	
					OpenGetWeaponMenuTriade()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'aztecas' then	
					OpenGetWeaponMenuAztecas()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Marabunta' then	
					OpenGetWeaponMenuMarabunta()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Madrazo' then	
				    OpenGetWeaponMenuMadrazo()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'biker' then
				    OpenGetWeaponMenuBiker()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'SinaLoa' then
				    OpenGetWeaponMenuSinaLoa()
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'blanchisseur' then
					OpenGetWeaponMenuBlanchisseur()		
				elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Arkan' then
				    OpenGetWeaponMenuArkan()		
				end
            end

            if data.current.value == 'put_weapon' then
              OpenPutWeaponMenu()
            end

		end, function(data, menu)
			menu.close()
		end)
end

-------------------------------------------------------------------------------------------------------------------------------------

function OpenVehicleMenu()

	local elements = {
        {label = ('Véhicule Civil'), value = 'civil'},
        {label = ('Vélo'), value = 'velo'},
	}

    if ESX.PlayerData.org and ESX.PlayerData.org.name == 'blanchisseur' then
	    table.insert(elements, {label = ('Véhicule Blanchisseur'), value = 'coquette'})
    end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'actions', {
			css = 'head',
			title    = 'Vehicule Menu',
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'civil' then
				spawnCar("primo")
				ESX.UI.Menu.CloseAll()
			end

			if data.current.value == 'velo' then
				spawnCar("bmx")
				ESX.UI.Menu.CloseAll()
			end

			if data.current.value == 'coquette' then
				spawnCar("coquette")
				ESX.UI.Menu.CloseAll()
			end

		end, function(data, menu)
			menu.close()
		end)
end

-------------------------------------------------------------------------------------------------------------------------------------

function OpenPutStocksMenu()

	ESX.TriggerServerCallback('Destination_Gang:getPlayerInventory', function(inventory)

		local elements = {}

		for i=1, #inventory.items, 1 do

			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
				css = 'head',
				title    = ('Inventaire'),
				elements = elements
			}, function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
						title = ('Quantité')
					}, function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil or count <= 0 then
							ESX.ShowNotification(('Quantité Invalide'))
						else
							menu2.close()
							menu.close()
							OpenStockMenu()

                            if ESX.PlayerData.org and ESX.PlayerData.org.name == 'vagos' then
                                TriggerServerEvent('Destination_Vagos:putStockItems', itemName, count)
                            elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'ballas' then
								TriggerServerEvent('Destination_Ballas:putStockItems', itemName, count)
							elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'lost' then
                            	TriggerServerEvent('Destination_Lost:putStockItems', itemName, count)
                            elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'families' then
								TriggerServerEvent('Destination_Families:putStockItems', itemName, count)
							elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'triade' then
								TriggerServerEvent('Destination_Triade:putStockItems', itemName, count)
							elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'aztecas' then
								TriggerServerEvent('Destination_Aztecas:putStockItems', itemName, count)
							elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Marabunta' then
								TriggerServerEvent('Destination_Marabunta:putStockItems', itemName, count)
							elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Madrazo' then
                            	TriggerServerEvent('Destination_Madrazo:putStockItems', itemName, count)
                            elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'biker' then
                            	TriggerServerEvent('Destination_Biker:putStockItems', itemName, count)
                            elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'SinaLoa' then
                            	TriggerServerEvent('Destination_SinaLoa:putStockItems', itemName, count)
                            elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'blanchisseur' then
								TriggerServerEvent('Destination_Blanchisseur:putStockItems', itemName, count)
							elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Arkan' then
                            	TriggerServerEvent('Destination_Arkan:putStockItems', itemName, count)
                            end
						end

					end, function(data2, menu2)
						menu2.close()
					end)
			end, function(data, menu)
				menu.close()
			end)
	end)
end

function OpenGetStocksMenuVagos()

	ESX.TriggerServerCallback('Destination_Vagos:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			if (items[i].count ~= 0) then
				table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css = 'head',
				title    = 'Vagos Stock',
				elements = elements
			}, function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = ('Quantité')
					}, function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil or count <= 0 then
						    ESX.ShowNotification(('Quantité Invalide'))
						else
						    menu2.close()
							menu.close()
							OpenStockMenu()

                            TriggerServerEvent('Destination_Vagos:getStockItem', itemName, count) 
					    end

					end, function(data2, menu2)
						menu2.close()
					end)
			end, function(data, menu)
				menu.close()
			end)
	end)
end

function OpenGetStocksMenuBallas()

	ESX.TriggerServerCallback('Destination_Ballas:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			if (items[i].count ~= 0) then
				table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css = 'head',
				title    = 'Ballas Stock',
				elements = elements
			}, function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = ('Quantité')
					}, function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil or count <= 0 then
						    ESX.ShowNotification(('Quantité Invalide'))
						else
						    menu2.close()
							menu.close()
							OpenStockMenu()

                            TriggerServerEvent('Destination_Ballas:getStockItem', itemName, count) 
					    end

					end, function(data2, menu2)
						menu2.close()
					end)
			end, function(data, menu)
				menu.close()
			end)
	end)
end

function OpenGetStocksMenuLost()

	ESX.TriggerServerCallback('Destination_Lost:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			if (items[i].count ~= 0) then
				table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css = 'head',
				title    = 'Lost Stock',
				elements = elements
			}, function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = ('Quantité')
					}, function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil or count <= 0 then
						    ESX.ShowNotification(('Quantité Invalide'))
						else
						    menu2.close()
							menu.close()
							OpenStockMenu()

                            TriggerServerEvent('Destination_Lost:getStockItem', itemName, count) 
					    end

					end, function(data2, menu2)
						menu2.close()
					end)
			end, function(data, menu)
				menu.close()
			end)
	end)
end


function OpenGetStocksMenuFamilies()

	ESX.TriggerServerCallback('Destination_Families:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			if (items[i].count ~= 0) then
				table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css = 'head',
				title    = 'Families Stock',
				elements = elements
			}, function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = ('Quantité')
					}, function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil or count <= 0 then
						    ESX.ShowNotification(('Quantité Invalide'))
						else
						    menu2.close()
							menu.close()
							OpenStockMenu()

                            TriggerServerEvent('Destination_Families:getStockItem', itemName, count) 
					    end

					end, function(data2, menu2)
						menu2.close()
					end)
			end, function(data, menu)
				menu.close()
			end)
	end)
end

function OpenGetStocksMenuTriade()

	ESX.TriggerServerCallback('Destination_Triade:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			if (items[i].count ~= 0) then
				table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css = 'head',
				title    = 'Triade Stock',
				elements = elements
			}, function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = ('Quantité')
					}, function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil or count <= 0 then
						    ESX.ShowNotification(('Quantité Invalide'))
						else
						    menu2.close()
							menu.close()
							OpenStockMenu()

                            TriggerServerEvent('Destination_Triade:getStockItem', itemName, count) 
					    end

					end, function(data2, menu2)
						menu2.close()
					end)
			end, function(data, menu)
				menu.close()
			end)
	end)
end

function OpenGetStocksMenuAztecas()

	ESX.TriggerServerCallback('Destination_Aztecas:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			if (items[i].count ~= 0) then
				table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
				title    = 'Aztecas Stock',
				css = 'head',
				elements = elements
			}, function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = ('Quantité')
					}, function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil or count <= 0 then
						    ESX.ShowNotification(('Quantité Invalide'))
						else
						    menu2.close()
							menu.close()
							OpenStockMenu()

                            TriggerServerEvent('Destination_Aztecas:getStockItem', itemName, count) 
					    end

					end, function(data2, menu2)
						menu2.close()
					end)
			end, function(data, menu)
				menu.close()
			end)
	end)
end


function OpenGetStocksMenuMarabunta()

	ESX.TriggerServerCallback('Destination_Marabunta:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			if (items[i].count ~= 0) then
				table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css = 'head',
				title    = 'Marabunta Stock',
				elements = elements
			}, function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = ('Quantité')
					}, function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil or count <= 0 then
						    ESX.ShowNotification(('Quantité Invalide'))
						else
						    menu2.close()
							menu.close()
							OpenStockMenu()

                            TriggerServerEvent('Destination_Marabunta:getStockItem', itemName, count) 
					    end

					end, function(data2, menu2)
						menu2.close()
					end)
			end, function(data, menu)
				menu.close()
			end)
	end)
end

function OpenGetStocksMenuMadrazo()

	ESX.TriggerServerCallback('Destination_Madrazo:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			if (items[i].count ~= 0) then
				table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css = 'head',
				title    = 'Madrazo Stock',
				elements = elements
			}, function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = ('Quantité')
					}, function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil or count <= 0 then
						    ESX.ShowNotification(('Quantité Invalide'))
						else
						    menu2.close()
							menu.close()
							OpenStockMenu()

                            TriggerServerEvent('Destination_Madrazo:getStockItem', itemName, count) 
					    end

					end, function(data2, menu2)
						menu2.close()
					end)
			end, function(data, menu)
				menu.close()
			end)
	end)
end


function OpenGetStocksMenuBiker()

	ESX.TriggerServerCallback('Destination_Biker:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			if (items[i].count ~= 0) then
				table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css = 'head',
				title    = 'Biker Stock',
				elements = elements
			}, function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = ('Quantité')
					}, function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil or count <= 0 then
						    ESX.ShowNotification(('Quantité Invalide'))
						else
						    menu2.close()
							menu.close()
							OpenStockMenu()

                            TriggerServerEvent('Destination_Biker:getStockItem', itemName, count) 
					    end

					end, function(data2, menu2)
						menu2.close()
					end)
			end, function(data, menu)
				menu.close()
			end)
	end)
end

function OpenGetStocksMenuSinaLoa()

	ESX.TriggerServerCallback('Destination_SinaLoa:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			if (items[i].count ~= 0) then
				table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css = 'head',
				title    = 'Vendeur Arme Stock',
				elements = elements
			}, function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = ('Quantité')
					}, function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil or count <= 0 then
						    ESX.ShowNotification(('Quantité Invalide'))
						else
						    menu2.close()
							menu.close()
							OpenStockMenu()

                            TriggerServerEvent('Destination_SinaLoa:getStockItem', itemName, count) 
					    end

					end, function(data2, menu2)
						menu2.close()
					end)
			end, function(data, menu)
				menu.close()
			end)
	end)
end

function OpenGetStocksMenuBlanchisseur()

	ESX.TriggerServerCallback('Destination_Blanchisseur:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			if (items[i].count ~= 0) then
				table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css = 'head',
				title    = 'Blanchisseur Stock',
				elements = elements
			}, function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = ('Quantité')
					}, function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil or count <= 0 then
						    ESX.ShowNotification(('Quantité Invalide'))
						else
						    menu2.close()
							menu.close()
							OpenStockMenu()

                            TriggerServerEvent('Destination_Blanchisseur:getStockItem', itemName, count) 
					    end

					end, function(data2, menu2)
						menu2.close()
					end)
			end, function(data, menu)
				menu.close()
			end)
	end)
end

function OpenGetStocksMenuArkan()

	ESX.TriggerServerCallback('Destination_Arkan:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			if (items[i].count ~= 0) then
				table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css = 'head',
				title    = 'Arkan Stock',
				elements = elements
			}, function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
						title = ('Quantité')
					}, function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil or count <= 0 then
						    ESX.ShowNotification(('Quantité Invalide'))
						else
						    menu2.close()
							menu.close()
							OpenStockMenu()

                            TriggerServerEvent('Destination_Arkan:getStockItem', itemName, count) 
					    end

					end, function(data2, menu2)
						menu2.close()
					end)
			end, function(data, menu)
				menu.close()
			end)
	end)
end
-------------------------------------------------------------------------------------------------------------------------------------

function OpenGetWeaponMenuVagos()

  ESX.TriggerServerCallback('Destination_Vagos:getArmoryWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
      if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory_get_weapon',
      {
		css = 'head',
        title    = ('Armurerie - Prendre Arme'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('Destination_Vagos:removeArmoryWeapon', function()
          OpenGetWeaponMenuVagos()
        end, data.current.value)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenGetWeaponMenuBallas()

  ESX.TriggerServerCallback('Destination_Ballas:getArmoryWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
      if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory_get_weapon',
      {
		css = 'head',
        title    = ('Armurerie - Prendre Arme'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('Destination_Ballas:removeArmoryWeapon', function()
          OpenGetWeaponMenuBallas()
        end, data.current.value)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenGetWeaponMenuLost()

	ESX.TriggerServerCallback('Destination_Lost:getArmoryWeapons', function(weapons)
  
	  local elements = {}
  
	  for i=1, #weapons, 1 do
		if weapons[i].count > 0 then
		  table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
		end
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'armory_get_weapon',
		{
			css = 'head',
		  title    = ('Armurerie - Prendre Arme'),
		  align    = 'top-left',
		  elements = elements,
		},
		function(data, menu)
  
		  menu.close()
  
		  ESX.TriggerServerCallback('Destination_Lost:removeArmoryWeapon', function()
			OpenGetWeaponMenuLost()
		  end, data.current.value)
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
  
  end

function OpenGetWeaponMenuFamilies()

  ESX.TriggerServerCallback('Destination_Families:getArmoryWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
      if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory_get_weapon',
      {
		css = 'head',
        title    = ('Armurerie - Prendre Arme'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('Destination_Families:removeArmoryWeapon', function()
          OpenGetWeaponMenuFamilies()
        end, data.current.value)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenGetWeaponMenuTriade()

	ESX.TriggerServerCallback('Destination_Triade:getArmoryWeapons', function(weapons)
  
	  local elements = {}
  
	  for i=1, #weapons, 1 do
		if weapons[i].count > 0 then
		  table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
		end
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'armory_get_weapon',
		{
			css = 'head',
		  title    = ('Armurerie - Prendre Arme'),
		  align    = 'top-left',
		  elements = elements,
		},
		function(data, menu)
  
		  menu.close()
  
		  ESX.TriggerServerCallback('Destination_Triade:removeArmoryWeapon', function()
			OpenGetWeaponMenuTriade()
		  end, data.current.value)
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
  end)
  
end

function OpenGetWeaponMenuAztecas()

	ESX.TriggerServerCallback('Destination_Aztecas:getArmoryWeapons', function(weapons)
  
	  local elements = {}
  
	  for i=1, #weapons, 1 do
		if weapons[i].count > 0 then
		  table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
		end
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'armory_get_weapon',
		{
			css = 'head',
		  title    = ('Armurerie - Prendre Arme'),
		  align    = 'top-left',
		  elements = elements,
		},
		function(data, menu)
  
		  menu.close()
  
		  ESX.TriggerServerCallback('Destination_Aztecas:removeArmoryWeapon', function()
			OpenGetWeaponMenuAztecas()
		  end, data.current.value)
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
  end)
  
end

function OpenGetWeaponMenuMarabunta()

	ESX.TriggerServerCallback('Destination_Marabunta:getArmoryWeapons', function(weapons)
  
	  local elements = {}
  
	  for i=1, #weapons, 1 do
		if weapons[i].count > 0 then
		  table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
		end
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'armory_get_weapon',
		{
			css = 'head',
		  title    = ('Armurerie - Prendre Arme'),
		  align    = 'top-left',
		  elements = elements,
		},
		function(data, menu)
  
		  menu.close()
  
		  ESX.TriggerServerCallback('Destination_Marabunta:removeArmoryWeapon', function()
			OpenGetWeaponMenuMarabunta()
		  end, data.current.value)
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
  
end

function OpenGetWeaponMenuMadrazo()

	ESX.TriggerServerCallback('Destination_Madrazo:getArmoryWeapons', function(weapons)
  
	  local elements = {}
  
	  for i=1, #weapons, 1 do
		if weapons[i].count > 0 then
		  table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
		end
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'armory_get_weapon',
		{
			css = 'head',
		  title    = ('Armurerie - Prendre Arme'),
		  align    = 'top-left',
		  elements = elements,
		},
		function(data, menu)
  
		  menu.close()
  
		  ESX.TriggerServerCallback('Destination_Madrazo:removeArmoryWeapon', function()
			OpenGetWeaponMenuMadrazo()
		  end, data.current.value)
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
  
end

function OpenGetWeaponMenuBiker()

  ESX.TriggerServerCallback('Destination_Biker:getArmoryWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
      if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory_get_weapon',
      {
		css = 'head',
        title    = ('Armurerie - Prendre Arme'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('Destination_Biker:removeArmoryWeapon', function()
          OpenGetWeaponMenuBiker()
        end, data.current.value)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenGetWeaponMenuSinaLoa()

  ESX.TriggerServerCallback('Destination_SinaLoa:getArmoryWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
      if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory_get_weapon',
      {
		css = 'head',
        title    = ('Armurerie - Prendre Arme'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('Destination_SinaLoa:removeArmoryWeapon', function()
          OpenGetWeaponMenuSinaLoa()
        end, data.current.value)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenGetWeaponMenuBiker()

  ESX.TriggerServerCallback('Destination_Blanchisseur:getArmoryWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
      if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory_get_weapon',
      {
		css = 'head',
        title    = ('Armurerie - Prendre Arme'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('Destination_Blanchisseur:removeArmoryWeapon', function()
          OpenGetWeaponMenuBlanchisseur()
        end, data.current.value)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenGetWeaponMenuArkan()

	ESX.TriggerServerCallback('Destination_Arkan:getArmoryWeapons', function(weapons)
  
	  local elements = {}
  
	  for i=1, #weapons, 1 do
		if weapons[i].count > 0 then
		  table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
		end
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'armory_get_weapon',
		{
			css = 'head',
		  title    = ('Armurerie - Prendre Arme'),
		  align    = 'top-left',
		  elements = elements,
		},
		function(data, menu)
  
		  menu.close()
  
		  ESX.TriggerServerCallback('Destination_Arkan:removeArmoryWeapon', function()
			OpenGetWeaponMenuBlanchisseur()
		  end, data.current.value)
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
  
  end

function OpenPutWeaponMenu()

  local elements   = {}
  local playerPed  = GetPlayerPed(-1)
  local weaponList = ESX.GetWeaponList()

  for i=1, #weaponList, 1 do

    local weaponHash = GetHashKey(weaponList[i].name)

    if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
      local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
      table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
    end

  end
----------------------------------------------------------------------------------------------------------------------------------------------------





  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'armory_put_weapon',
    {
		css = 'head',
      title    = ('Armurerie - Déposer Arme'),
      align    = 'top-left',
      elements = elements,
    },
    function(data, menu)

      menu.close()

      if ESX.PlayerData.org and ESX.PlayerData.org.name == 'vagos' then
         ESX.TriggerServerCallback('Destination_Vagos:addArmoryWeapon', function()
           OpenPutWeaponMenu()
         end, data.current.value)
      elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'ballas' then
         ESX.TriggerServerCallback('Destination_Ballas:addArmoryWeapon', function()
           OpenPutWeaponMenu()
		 end, data.current.value)
		elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'lost' then
			ESX.TriggerServerCallback('Destination_Lost:addArmoryWeapon', function()
			  OpenPutWeaponMenu()
			end, data.current.value)
      elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'families' then
         ESX.TriggerServerCallback('Destination_Families:addArmoryWeapon', function()
           OpenPutWeaponMenu()
		 end, data.current.value)
	elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'triade' then
		ESX.TriggerServerCallback('Destination_Triade:addArmoryWeapon', function()
		 OpenPutWeaponMenu()
			end, data.current.value)
		elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'aztecas' then
			ESX.TriggerServerCallback('Destination_Aztecas:addArmoryWeapon', function()
			  OpenPutWeaponMenu()
			end, data.current.value)
	  elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Marabunta' then
		 ESX.TriggerServerCallback('Destination_Marabunta:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		 end, data.current.value)
		elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Madrazo' then
		  ESX.TriggerServerCallback('Destination_Madrazo:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		  end, data.current.value)
      elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'biker' then
         ESX.TriggerServerCallback('Destination_Biker:addArmoryWeapon', function()
           OpenPutWeaponMenu()
         end, data.current.value)
      elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'SinaLoa' then
         ESX.TriggerServerCallback('Destination_SinaLoa:addArmoryWeapon', function()
           OpenPutWeaponMenu()
         end, data.current.value)
      elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'blanchisseur' then
         ESX.TriggerServerCallback('Destination_Blanchisseur:addArmoryWeapon', function()
           OpenPutWeaponMenu()
		 end, data.current.value)
	  elseif ESX.PlayerData.org and ESX.PlayerData.org.name == 'Arkan' then
		ESX.TriggerServerCallback('Destination_Arkan:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		end, data.current.value)
      end

    end,
    function(data, menu)
      menu.close()
    end
  )

end