local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                           = nil
local GUI					  = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
GUI.Time           			  = 0
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
	TriggerEvent('skinchanger:getSkin', function(skin)
		playerGender = skin.sex
	end)

	PlayerData = ESX.GetPlayerData()
end)


function OpenBlanchisseurMenu()

  local elements = { }
	  table.insert(elements, {label = "Blanchir votre argent sale",    value = 'wash_money'})

	ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'whitening',
      {
		css	  = 'head',
        title    = "Blanchisseur",
        align    = 'top-left',
        elements = elements,
        },

        function(data, menu)
		
		if data.current.value == 'wash_money' then

			ESX.UI.Menu.Open(
				'dialog', GetCurrentResourceName(), 'wash_money_amount_',
				{
					css	  = 'head',
					title = "Montant à blanchir"
				},
				function(data, menu)

					local amount = tonumber(data.value)

					if amount == nil then
						ESX.DrawMissionText("~r~T'as pas assez d'argent mec.")
						ESX.UI.Menu.CloseAll()
					else
						menu.close()
						ESX.UI.Menu.CloseAll()
						ESX.DrawMissionText("Bouge pas je reviens dans ~b~une minute.", 3500)
						Citizen.Wait(3500)
						ESX.DrawMissionText("~r~Fais attention à la Police, il y a des poucaves dans le coin.", 3500)
						alertepoliceblanchisseur()
						Citizen.Wait(53000)
						TriggerServerEvent('esx_blanchisseur:washMoney', amount)
						ESX.DrawMissionText("~y~Bon allez maintenant casse toi d'ici.", 3500)
					end

				end,
				function(data, menu)
					menu.close()
				end
			)

			end
    end,
    function(data, menu)

      menu.close()

      CurrentAction     = '"whitening"'
      CurrentActionData = { }
    end
    )

end

function alertepoliceblanchisseur()
	local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
	TriggerServerEvent("call:makeCall", "blanchisseur", {x=plyPos.x,y=plyPos.y,z=plyPos.z})
end

RegisterNetEvent('blanchisseur:infopolice')
AddEventHandler('blanchisseur:infopolice', function(x, y, z)	
		ESX.ShowAdvancedNotification("Central", "~b~Appel d'urgence: 911", "~b~Identité: ~s~Poucave\n~b~Infos: \n~s~Transaction d'argent.", 'CHAR_CALL911', 7)
		ESX.ShowNotification("Accepter: ~g~E~s~ Refuser : ~r~X")

		while true do
			if IsControlPressed(0, 38) then
				SetNewWaypoint(x, y, z)
				ESX.ShowNotification("~g~Vous avez accepté l'appel.")
			return
			elseif IsControlPressed(0, 73) then
			  ESX.ShowNotification("~r~Vous avez refusé l'appel.")
			  return
		  end
		  Wait(0)
	end
end)

AddEventHandler('esx_blanchisseur:hasEnteredMarker', function(zone)
	CurrentAction     = 'whitening'
	CurrentActionData = {zone = zone}
end)

AddEventHandler('esx_blanchisseur:hasExitedMarker', function(zone)
	CurrentAction = nil
	TriggerServerEvent('esx_blanchisseur:stopWhitening')
end)

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.ZonesBlan) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.MarkerSizeBlan.x / 2) then
				attente = 1
				isInMarker  = true
				currentZone = k
				percent     = v.percent
				break
            else
                attente = 150
			end
		end
		
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_blanchisseur:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_blanchisseur:hasExitedMarker', LastZone)
		end
	end
end)


-- Key Controls
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustReleased(0, 38) then
		
        if CurrentAction == 'whitening' then
					if Config.Menu then	
						OpenBlanchisseurMenu()
					else
						TriggerServerEvent('esx_blanchisseur:startWhitening', percent)
					end					
			else
				if Config.Menu then	
					OpenBlanchisseurMenu()
				else
					TriggerServerEvent('esx_blanchisseur:startWhitening', percent)
				end					
			end

        CurrentAction = nil
      end

    end
  end
end)