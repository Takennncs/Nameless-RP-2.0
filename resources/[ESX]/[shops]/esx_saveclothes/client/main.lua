local GUI = {}
GUI.Time = 0
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local HasPayed = false
local HasLoadCloth = false

ESX = nil

Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

function OpenShopMenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'shop_menu',
		{
			css = 'head',
			title = 'Dressing',
			align = 'top-left',
			elements = {
				{label = ('Sauvegarder'), value = 'yes'},
				{label = ('Dressing'), value = 'player_dressing'},
				{label = ('<span style="color: red;">Fermer</span>'), value = 'no'}
			}
		},
		function(data, menu)

			menu.close()

			if data.current.value == 'no' then
				menu.close()
			end
			
			if data.current.value == 'yes' then
				ESX.ShowNotification('Voulez vous sauvegarder cette tenue ?')
				Citizen.Wait(100)
				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'save_dressing',
					{
						css = 'head',
						title = 'Êtes vous sûr ?',
						align = 'top-left',
						elements = {
							{label = ('Sauvegarder dans la garde robe'), value = 'yes'},
							{label = ('<span style="color: red;">Annuler</span>'),  value = 'no'},
						}
					},
					function(data2, menu2)
						menu2.close()
						if data2.current.value == 'yes' then
							ESX.UI.Menu.Open(
								'dialog', GetCurrentResourceName(), 'outfit_name',
								{
									title = _U('name_outfit'),
								},
								function(data3, menu3)
									menu3.close()
									TriggerEvent('skinchanger:getSkin', function(skin)
										TriggerServerEvent('esx_eden_clotheshop:saveOutfit', data3.value, skin)

									end)
									ESX.ShowNotification('Vous avez sauvegardé une nouvelle tenue')
								end,
								function(data3, menu3)
									menu3.close()
							end)
						end
				end)
			end

			if data.current.value == 'player_dressing' then
	
				ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
					local elements = {}
					for i=1, #dressing, 1 do
					table.insert(elements, {label = dressing[i], value = i})
					end
					ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'player_dressing',
					{
						css = 'head',
						title = _U('player_clothes'),
						align = 'top-left',
						elements = elements,
					},
					function(data, menu)
						TriggerEvent('skinchanger:getSkin', function(skin)
						ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerOutfit', function(clothes)
		
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)
		
							TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerServerEvent('esx_skin:save', skin)
							end)
			
							ESX.ShowNotification(_U('loaded_outfit'))
							HasLoadCloth = true
						end, data.current.value)
						end)
					end,
					function(data, menu)
						menu.close()
					end)
				end)
			end
		end)
end

AddEventHandler('esx_eden_clotheshop:hasEnteredMarker', function(zone)
	CurrentAction = 'shop_menu'
	CurrentActionMsg = _U('press_menu')
	CurrentActionData = {}
end)

AddEventHandler('esx_eden_clotheshop:hasExitedMarker', function(zone)
	
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil

	if not HasPayed then
		if not HasLoadCloth then 

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		end

	end

end)

-- Display markers
Citizen.CreateThread(function()
	while true do

		Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
			end
		end

	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do

		Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				isInMarker = true
				currentZone = k
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone = currentZone
			TriggerEvent('esx_eden_clotheshop:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_eden_clotheshop:hasExitedMarker', LastZone)
		end

	end
end)

-- Key controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if CurrentAction ~= nil then

			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlPressed(0,  38) and (GetGameTimer() - GUI.Time) > 300 then

				if CurrentAction == 'shop_menu' then
					OpenShopMenu()
				end

				CurrentAction = nil
				GUI.Time = GetGameTimer()

			end

		end

	end
end)