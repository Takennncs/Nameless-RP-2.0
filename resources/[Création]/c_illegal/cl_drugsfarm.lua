ESX 			    			= nil
local cokeQTE       			= 0
local acidesulfuriqueQTE       	= 0
local antigelQTE				= 0
local terreQTE				= 0
local pelleQTE					= 0
local coke_poochQTE 			= 0
local weedQTE					= 0
local weed_poochQTE 			= 0
local methQTE					= 0
local meth_poochQTE 			= 0
local opiumQTE					= 0
local opium_poochQTE 			= 0
local myJob 					= nil
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local isInZone                  = false
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


AddEventHandler('esx_drugs:hasEnteredMarker', function(zone)
	if myJob == 'police' or myJob == 'sheriff' then
		return
	end

	ESX.UI.Menu.CloseAll()
	
	if zone == 'exitMarker' then
		CurrentAction     = zone
		CurrentActionMsg  = "Appuyez sur ~INPUT_CONTEXT~ pour ~r~stopper"
		CurrentActionData = {}	
	elseif zone == 'CokeField' then
		if acidesulfuriqueQTE  >= 2 then 
		CurrentAction     = zone
		--ESX.DrawMissionText("Tu veux récolter des ~y~Feuilles de Coca ~w~?", 5000)
		CurrentActionMsg  = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
		end
	elseif zone == 'TerreField' then 
		if pelleQTE >= 1 then
		CurrentAction     = zone
		--ESX.DrawMissionText("Tu veux récolter des ~y~Feuilles de Coca ~w~?", 5000)
		CurrentActionMsg  = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
		end
	elseif zone == 'AcideField' then 
		CurrentAction     = zone
		--ESX.DrawMissionText("Tu veux récolter des ~y~Feuilles de Coca ~w~?", 5000)
		CurrentActionMsg  = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
	elseif zone == 'AntigelField' then 
		CurrentAction     = zone
		--ESX.DrawMissionText("Tu veux récolter des ~y~Feuilles de Coca ~w~?", 5000)
		CurrentActionMsg  = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
	elseif zone == 'CokeProcessing' then
		if cokeQTE >= 1 then
			CurrentAction     = zone
			--ESX.DrawMissionText("Tu veux traiter les ~y~Feuilles de Coca ~w~?", 5000)
			CurrentActionMsg  = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
			CurrentActionData = {}
		end
	elseif zone == 'CokeDealer' then
		if coke_poochQTE >= 1 then
			CurrentAction     = zone
			--CurrentActionMsg  = _U('press_sell_coke')
			CurrentActionData = {}
		end
	elseif zone == 'MethField' then
		if antigelQTE >= 2 then 
		CurrentAction     = zone
		--ESX.DrawMissionText("Tu veux récolter du ~b~Crystal de Meth ~w~?", 5000)
		CurrentActionMsg  = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
		end
	elseif zone == 'MethProcessing' then
		if methQTE >= 1 then
			CurrentAction     = zone
			--ESX.DrawMissionText("Tu veux traiter les ~b~Crystaux de Meth ~w~?", 5000)
			CurrentActionMsg  = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
			CurrentActionData = {}
		end
	elseif zone == 'MethDealer' then
		if meth_poochQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_meth')
			CurrentActionData = {}
		end
	elseif zone == 'WeedField' then
		if terreQTE >= 2 then
		CurrentAction     = zone
		--ESX.DrawMissionText("Tu veux récolter du ~g~Chanvre ~w~?", 5000)
		CurrentActionMsg  = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
		CurrentActionData = {}
		end
	elseif zone == 'WeedProcessing' then
		if weedQTE >= 1 then
			CurrentAction     = zone
			--ESX.DrawMissionText("Tu veux traiter les ~g~Chanvres ~w~?", 5000)
			CurrentActionMsg  = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~lancer l'activité"
			CurrentActionData = {}
		end
	elseif zone == 'WeedDealer' then
		if weed_poochQTE >= 1 then
			CurrentAction     = zone
			--CurrentActionMsg  = _U('press_sell_weed')
			CurrentActionData = {}
		end
	end
end)

local poscircuiterre = {
	{x = 1517.88,  y = 1796.88,  z = 108.6}
}

Citizen.CreateThread(function()
    for k in pairs(poscircuiterre) do
	local blip = AddBlipForCoord(poscircuiterre[k].x, poscircuiterre[k].y, poscircuiterre[k].z)
	SetBlipSprite(blip, 1)
	--SetBlipDisplay(blip, 3)
	SetBlipAsShortRange(blip, true)
	SetBlipScale(blip, 0.5)
	SetBlipColour(blip, 56)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Circuit Terre")
    EndTextCommandSetBlipName(blip)
    end
end)

AddEventHandler('esx_drugs:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()

	if zone == 'CokeField' then
		TriggerServerEvent('esx_drugs:stopHarvestCoke')
	elseif zone == 'TerreField' then 
		TriggerServerEvent('esx_drugs:stopHarvestTerre')
	elseif zone == 'AcideField' then 
		TriggerServerEvent('esx_drugs:stopHarvestAcide')
	elseif zone == 'AntigelField' then 
		TriggerServerEvent('esx_drugs:stopHarvestAntigel')
	elseif zone == 'CokeProcessing' then
	TriggerServerEvent('esx_drugs:stopTransformCoke')
	elseif zone == 'CokeDealer' then
		TriggerServerEvent('esx_drugs:stopSellCoke')
	elseif zone == 'MethField' then
		TriggerServerEvent('esx_drugs:stopHarvestMeth')
	elseif zone == 'MethProcessing' then
		TriggerServerEvent('esx_drugs:stopTransformMeth')
	elseif zone == 'MethDealer' then
		TriggerServerEvent('esx_drugs:stopSellMeth')
	elseif zone == 'WeedField' then
		TriggerServerEvent('esx_drugs:stopHarvestWeed')
	elseif zone == 'WeedProcessing' then
		TriggerServerEvent('esx_drugs:stopTransformWeed')
	elseif zone == 'WeedDealer' then
		TriggerServerEvent('esx_drugs:stopSellWeed')
	end
end)






RegisterNetEvent('esx_drugs:ReturnInventory')
AddEventHandler('esx_drugs:ReturnInventory', function(cokeNbr, cokepNbr, acidesulfuriqueQTENbr, antigelQTENbr, pelleQTENbr, terreQTENbr, methNbr, methpNbr, weedNbr, weedpNbr, jobName, currentZone)
	cokeQTE	   = cokeNbr
	coke_poochQTE = cokepNbr
	acidesulfuriqueQTE = acidesulfuriqueQTENbr
	antigelQTE = antigelQTENbr
	pelleQTE = pelleQTENbr
	terreQTE = terreQTENbr
	methQTE 	  = methNbr
	meth_poochQTE = methpNbr
	weedQTE 	  = weedNbr
	weed_poochQTE = weedpNbr
	myJob		 = jobName
	TriggerEvent('esx_drugs:hasEnteredMarker', currentZone)
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x / 2) then
				isInMarker  = true
				currentZone = k
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			lastZone				= currentZone
			TriggerServerEvent('esx_drugs:GetUserInventory', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
		end

		if isInMarker and isInZone then
			TriggerEvent('esx_drugs:hasEnteredMarker', 'exitMarker')
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
			if IsControlJustPressed(1, 51) then
				isInZone = true 
				if CurrentAction == 'exitMarker' then
					isInZone = false 
					TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
					--Citizen.Wait(1000)
				elseif CurrentAction == 'CokeField' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					TriggerServerEvent('esx_drugs:startHarvestCoke')
					Citizen.Wait(5000)
				elseif CurrentAction == 'TerreField' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
					TriggerServerEvent('esx_drugs:startHarvestTerre')
					Citizen.Wait(3500)
				elseif CurrentAction == 'AcideField' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
					TriggerServerEvent('esx_drugs:startHarvestAcide')
					Citizen.Wait(3500)
				elseif CurrentAction == 'AntigelField' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
					TriggerServerEvent('esx_drugs:startHarvestAntigel')
					Citizen.Wait(3500)
				elseif CurrentAction == 'CokeProcessing' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					TriggerServerEvent('esx_drugs:startTransformCoke')
					Citizen.Wait(65000)
				elseif CurrentAction == 'CokeDealer' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					TriggerServerEvent('esx_drugs:startSellCoke')
				elseif CurrentAction == 'MethField' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					TriggerServerEvent('esx_drugs:startHarvestMeth')
					Citizen.Wait(5000)
				elseif CurrentAction == 'MethProcessing' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					TriggerServerEvent('esx_drugs:startTransformMeth')
					Citizen.Wait(65000)
				elseif CurrentAction == 'MethDealer' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					TriggerServerEvent('esx_drugs:startSellMeth')
				elseif CurrentAction == 'WeedField' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					TriggerServerEvent('esx_drugs:startHarvestWeed')
					Citizen.Wait(5000)
				elseif CurrentAction == 'WeedProcessing' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					TriggerServerEvent('esx_drugs:startTransformWeed')
					Citizen.Wait(65000)
				elseif CurrentAction == 'WeedDealer' and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					TriggerServerEvent('esx_drugs:startSellWeed')
				else
					isInZone = false -- not a esx_drugs zone
				end
				
				CurrentAction = nil
			end
		end
	end
end)

