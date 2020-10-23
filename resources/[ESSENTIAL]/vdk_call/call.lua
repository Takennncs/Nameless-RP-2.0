ESX 			    			= nil
local callActive = false
local haveTarget = false
local isCall = false
local work = {}
local target = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        -- if IsControlJustPressed(1, 56) then
        --     local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
        --     TriggerServerEvent("call:makeCall", "uber", {x=plyPos.x,y=plyPos.y,z=plyPos.z})
        -- end

        -- Press E key to get the call
		if IsControlJustPressed(0, 246) and callActive then
			RemoveBlip(target.blip)
			TriggerServerEvent("call:getCall", work)
			SendNotification("~g~Vous avez pris l'appel !")
			target.blip = AddBlipForCoord(target.pos.x, target.pos.y, target.pos.z)
			SetBlipRoute(target.blip, true)
			haveTarget = true
			isCall = true
			callActive = false
            DrawMarker(1, target.pos.x, target.pos.y, target.pos.z-1, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 255, 255, 0, 200, 0, 0, 0, 0)
        -- Press Y key to decline the call
        elseif IsControlJustPressed(0, 74) and callActive then
            SendNotification("~r~Vous avez refusé l'appel.")
            callActive = false
        end
        if haveTarget then
            local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
            if Vdist(target.pos.x, target.pos.y, target.pos.z, playerPos.x, playerPos.y, playerPos.z) < 2.0 then
                RemoveBlip(target.blip)
                haveTarget = false
				isCall = false
            end
        end
    end
end)

RegisterNetEvent("call:cancelCall")
AddEventHandler("call:cancelCall", function()
	if haveTarget then
		RemoveBlip(target.blip)
        haveTarget = false
		isCall = false
	else
		TriggerEvent("itinerance:notif", "~r~Vous n'avez aucun appel en cours !")
	end
end)

RegisterNetEvent("call:callIncoming")
AddEventHandler("call:callIncoming", function(job, pos, msg)
	callActive = true
    work = job
    target.pos = pos
	
	--print(json.encode(target.pos))
	coords = GetEntityCoords(GetPlayerPed(-1))
	dist1 = CalculateTravelDistanceBetweenPoints(coords.x,coords.y,coords.z,target.pos.x,target.pos.y,target.pos.z)
	dist2 = dist1 / 10
	dist3 = math.ceil(dist2)
	dist = dist3 / 100
	streetname = GetStreetNameFromHashKey(GetStreetNameAtCoord(target.pos.x,target.pos.y,target.pos.z)) .. " ("..dist.." km)"
	msg = msg
	if target.pos.y > 1600 then
		location = '(BC)'
	else
		location = '(LS)'
	end
	
	if work == "police" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel d\'urgence: 911', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_CALL911", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "sheriff" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel d\'urgence: 911', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_CALL911", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "veh" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel d\'urgence: 911', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. '\n~b~Raison: ~s~Vol de véhicule', "CHAR_CALL911", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "tir" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel d\'urgence: 911', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. '\n~b~Raison: ~s~Coup de feu', "CHAR_CALL911", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "renforts" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel d\'urgence: 911', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. '\n~b~Raison: ~s~Demande de renforts', "CHAR_CALL911", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "cambriolage" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel d\'urgence: 911', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. '\n~b~Raison: ~s~Cambriolage en cours', "CHAR_CALL911", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "renfortsheriff" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel d\'urgence: 911', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. '\n~b~Raison: ~s~Demande de renforts', "CHAR_CALL911", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "drogue" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel d\'urgence: 911', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. '\n~b~Raison: ~s~Deal de drogue', "CHAR_CALL911", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)
	
	elseif work == "ambulance" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel d\'urgence: 912', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_CALL911", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "mort" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel d\'urgence: 912', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. '\n~b~Raison: ~s~Accident mortel', "CHAR_CALL911", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "vite" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel d\'urgence: 911', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. '\n~b~Raison: ~s~Excès de vitesse', "CHAR_CALL911", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "ltd" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel reçu : LTD', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_PROPERTY_CAR_MOD_SHOP", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "cardealer" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel reçu : PDM', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_CARSITE", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "lscustoms" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel reçu : LsCustoms', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_LS_CUSTOMS", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "fueler" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel reçu : Raffineur', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_CHAT_CALL", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)
	
	elseif work == "taxi" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel reçu : Taxi', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_TAXI", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "gouv" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel reçu : Gouvernement', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_CHAT_CALL", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "tabac" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel reçu : Tabac', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_CHAT_CALL", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	elseif work == "unicorn" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel reçu : Unicorn', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_MP_STRIPCLUB_PR", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)	

	elseif work == "bahamas" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel reçu : Unicorn', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_PEGASUS_DELIVERY", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)	

	elseif work == "vigne" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel reçu : Vigneron', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_CHAT_CALL", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)	
	
	elseif work == "ammu" then
	ESX.ShowAdvancedNotification('Centrale', '~b~Appel reçu : Ammunation', '~b~Localisation: ~s~'.. streetname.. ' ' .. location.. ' \n~b~Raison: ~s~' .. msg .. '', "CHAR_AMMUNATION", 1)
	SendNotification("Accepter: ~g~Y~s~ ou ~r~H~s~")
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 0)

	end
	
end)

RegisterNetEvent("call:taken")
AddEventHandler("call:taken", function(a)
	callActive = true
    SendNotification("~b~L'appel a été pris par quelqu'un !")
end)

RegisterNetEvent("target:call:taken")
AddEventHandler("target:call:taken", function(taken)
    if taken == 1 then
        -- SendNotification("~b~Quelqu'un arrive !")
    elseif taken == 0 then
        -- SendNotification("~r~Personne n'a pu venir !")
    elseif taken == 2 then
        -- SendNotification("~o~Veuillez rappeler dans quelques instants.")
    end
end)

-- If player disconnect, remove him from the inService server table
AddEventHandler('playerDropped', function()
	TriggerServerEvent("player:serviceOff", nil)
end)

function SendNotification(message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(false, false)
end

