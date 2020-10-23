ESX = nil

cachedData = {
	["houseData"] = {},
	["Cameras"] = {}
}

local positionCAMBRIOLAGE = {
	vector3(-7.22, 409.2, 120.13),
	vector3(-408.92, 341.67, 108.91),
	vector3(-561.08, 403.19, 101.81),
	vector3(-7.79, 468.12, 145.86),
	vector3(84.89, 561.77, 182.78),
	vector3(-299.18, 635.27, 175.69),
	vector3(-667.47, 472.42, 114.14),
	vector3(-708.57, 712.76, 162.21),
}

Citizen.CreateThread(function()
    for k,v in ipairs(positionCAMBRIOLAGE)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite(blip, 134)
			SetBlipScale(blip, 0.7)		
			SetBlipColour(blip, 40)		
			SetBlipDisplay(blip, 8)		
			SetBlipAsShortRange(blip, true)		
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Cambriolage')
			EndTextCommandSetBlipName(blip)
		end
	end)

Citizen.CreateThread(function()
	
	while not ESX do

		TriggerEvent("esx:getSharedObject", function(library) 
			ESX = library 
		end)

		Citizen.Wait(0)
	end
	
	if ESX.IsPlayerLoaded() then
		DecorRegister('instance', 3)
		FetchHouseData()
	end

end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerData)
	ESX.PlayerData = playerData
	DecorRegister('instance', 3)
	FetchHouseData()
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(newJob)
	ESX.PlayerData["job"] = newJob
end)

RegisterCommand("fetch", function()
	FetchHouseData()
end)

RegisterNetEvent("burglary:eventHandler")
AddEventHandler("burglary:eventHandler", function(response, eventData)
	if response == "lockpick_house" then
		cachedData["houseData"][eventData["houseId"]] = {
			["Lootables"] = {}
		}
		if ESX.PlayerData["job"] and ESX.PlayerData["job"]["name"] == "police" then
			local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
			TriggerServerEvent("call:makeCall", "cambriolage", {x=plyPos.x,y=plyPos.y,z=plyPos.z})
			CreateBlip(eventData)
		end
	elseif response == "lock_house" then
		cachedData["houseData"][eventData["houseId"]] = {
			["locked"] = true
		}
		if ESX.PlayerData["job"] and ESX.PlayerData["job"]["name"] == "police" then
			if DoesBlipExist(cachedData[eventData["houseId"]]) then
				RemoveBlip(cachedData[eventData["houseId"]])
			end
			ESX.ShowNotification("Vous avez fermé ~g~la porte ~w~et ~g~stoppé l'alarme.")
		end
	elseif response == "loot_place" then
		cachedData["houseData"][eventData["houseId"]]["Lootables"][eventData["lootSpot"]] = true
	else	
 		-- print("Wrong event handler: " .. response)
	end
end)

Citizen.CreateThread(function()

	Wait(500)
	
	while true do
		
		local sleepThread = 500
		
		if Config.PoliceCameras and ESX.PlayerData["job"] and ESX.PlayerData["job"]["name"] == "police" then

			if not cachedData["cameraMode"] then
			
				local ped = PlayerPedId()
				local pedCoords = GetEntityCoords(ped)
				local dstCheck = #(Config.CameraComputer - pedCoords)

				if dstCheck <= 3.0 then

					sleepThread = 5

					if dstCheck <= 1.2 then

						ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder aux ~g~caméras de sécurité.")

						if IsControlJustReleased(0, 38) then
							CameraMenu()
						end

					end
					DrawMarker(6, Config.CameraComputer-vector3(0.0,0.0,0.975), 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 1.0, 1.0, 1.0, 55, 100, 200, 155, 0, false, false, 0, false, false, false, false)
				end
			end
		end
		Citizen.Wait(sleepThread)
	end
end)

Citizen.CreateThread(function()
	Wait(500)
	
	while true do
		
		local sleep = 500
		local pedCoords = GetEntityCoords(PlayerPedId())
		
		for id,data in pairs(Config.Coords) do
			
			local dstcheck = #(data["Pos"] - pedCoords)
			local text = data["Info"]

			if dstcheck <= 5.5 then
				sleep = 5
				if dstcheck <= 1.3 then
					if ESX.PlayerData["job"] and ESX.PlayerData["job"]["name"] == "police" then
						text = "[~b~E~s~] " .. (cachedData["houseData"][id] and "Entrer | [~r~H~s~] Fermer." or "Forcer la porte") .. " \n" .. data["Info"]
						if IsControlJustReleased(0, 38) then
							if not cachedData["houseData"][id] then
								if HasLockPick() then ESX.TriggerServerCallback("burglary:isHouseRobbable", function(robbable) if robbable then BeginLockpick(id, data) else ESX.ShowNotification("Pas assez de ~r~policier") end end) else ESX.ShowNotification("Vous avez besoin d'un ~g~outil de crochetage") end
							elseif cachedData["houseData"][id] and not cachedData["houseData"][id]["locked"] then
								EnterHouse(id, data)
							else
								ESX.ShowNotification("On dirait que vous n'arrivez pas à ouvrir cette maison.")
							end
						elseif IsControlJustReleased(0, 74) then
							if cachedData["houseData"][id] and not cachedData["houseData"][id]["locked"] then
								LockHouse(id, data)
							else
								ESX.ShowNotification("Déjà fermé !")
							end
						end
					else
						text = "[~b~E~s~] " .. (cachedData["houseData"][id] and "Entrer" or "Forcer la porte") .. " \n" .. data["Info"]
						if IsControlJustReleased(0, 38) then
							if not cachedData["houseData"][id] then
								if HasLockPick() then ESX.TriggerServerCallback("burglary:isHouseRobbable", function(robbable) if robbable then BeginLockpick(id, data) else ESX.ShowNotification("Pas assez de ~r~policier") end end) else ESX.ShowNotification("Vous avez besoin d'un ~g~outil de crochetage") end
							elseif cachedData["houseData"][id] and not cachedData["houseData"][id]["locked"] then
								EnterHouse(id, data)
							else
								ESX.ShowNotification("On dirait que vous n'arrivez pas à ouvrir cette maison.")
							end
						end
					end
				end
				if Config.EnableHouseText then ESX.Game.Utils.DrawText3D(data["Pos"], text, 0.6) end
				DrawMarker(6, data["Pos"]-vector3(0.0,0.0,0.975), 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 1.0, 1.0, 1.0, 55, 100, 200, 155, 0, false, false, 0, false, false, false, false)
			end
			
		end
		Citizen.Wait(sleep)
	end
end)