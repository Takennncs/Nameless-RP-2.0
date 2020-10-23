local converting = false

-- COKE BRICK >> COKE (10G)
RegisterNetEvent("BrickToCoke10g")
AddEventHandler("BrickToCoke10g", function()
    if converting then
      return
    end
    converting = true
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 40000, function()
		ESX.DrawMissionText('Vous avez obtenu ~g~100g de Cocaïne ~w~séparés en 10 pochtars de ~g~10g', 5000)
		ClearPedTasks(PlayerPedId())
		end)
	else
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 40000, function()
		ESX.DrawMissionText('Vous avez obtenu ~g~100g de Cocaïne ~w~séparés en 10 pochtars de ~g~10g', 5000)
		end)
	end
    converting = false
end)

-- METH BRICK >> METH (10G)
RegisterNetEvent("BrickToMeth10g")
AddEventHandler("BrickToMeth10g", function()
    if converting then
      return
    end
    converting = true
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
		--exports['progressBars']:startUI(120000, "Brique de Meth >  Meth (10G)")
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 40000, function()
		--Citizen.Wait(120000)
		ESX.DrawMissionText('Vous avez obtenu ~g~100g de Meth ~w~séparés en 10 pochtars de ~g~10g', 5000)
		ClearPedTasks(PlayerPedId())
		end)
	else
		--exports['progressBars']:startUI(120000, "Brique de Meth >  Meth (10G)")
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 40000, function()
		--Citizen.Wait(120000)
		ESX.DrawMissionText('Vous avez obtenu ~g~100g de Meth ~w~séparés en 10 pochtars de ~g~10g', 5000)
		end)
	end
    converting = false
end)

-- WEED BRICK >> WEED (20G)
RegisterNetEvent("BrickToWeed20g")
AddEventHandler("BrickToWeed20g", function()
    if converting then
      return
    end
    converting = true
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
		--exports['progressBars']:startUI(120000, "Brique de Weed  >  Weed (20G)")
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 40000, function()
		--Citizen.Wait(120000)
		ESX.DrawMissionText('Vous avez obtenu ~g~200g de Weed ~w~séparés en 10 pochtars de ~g~20g', 5000)
		ClearPedTasks(PlayerPedId())
		end)
	else
		--exports['progressBars']:startUI(120000, "Brique de Weed   >  Weed (20G)")
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 40000, function()
		--Citizen.Wait(120000)
		ESX.DrawMissionText('Vous avez obtenu ~g~200g de Weed ~w~séparés en 10 pochtars de ~g~20g', 5000)
		end)
	end
    converting = false
end)

-- COKE (10G) >> COKE (1G)
RegisterNetEvent("Coke10gToCoke1g")
AddEventHandler("Coke10gToCoke1g", function()
    if converting then
      return
    end
    converting = true
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 0, true)
		--exports['progressBars']:startUI(30000, "Coke (10G)  >  Coke (1G)")
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 20000, function()
		--Citizen.Wait(30000)
		ESX.DrawMissionText('Vous avez obtenu ~g~10g de Cocaïne ~w~séparés en 10 pochtars de ~g~1g', 5000)
		ClearPedTasks(PlayerPedId())
		end)
	else
		--exports['progressBars']:startUI(30000, "Coke (10G)  >  Coke (1G)")
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 20000, function()
		--Citizen.Wait(30000)
		ESX.DrawMissionText('Vous avez obtenu ~g~10g de Cocaïne ~w~séparés en 10 pochtars de ~g~1g', 5000)
		end)
	end
    converting = false
end)

-- METH (10G) >> METH (1G)
RegisterNetEvent("Meth10gToMeth1g")
AddEventHandler("Meth10gToMeth1g", function()
    if converting then
      return
    end
    converting = true
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 0, true)
		--exports['progressBars']:startUI(30000, "Meth (10G)  >  Meth (1G)")
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 20000, function()
		--Citizen.Wait(30000)
		ESX.DrawMissionText('Vous avez obtenu ~g~10g de Meth ~w~séparés en 10 pochtars de ~g~1g', 5000)
		ClearPedTasks(PlayerPedId())
		end)
	else
		--exports['progressBars']:startUI(30000, "Meth (10G)  >  Meth (1G)")
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 20000, function()
		--Citizen.Wait(30000)
		ESX.DrawMissionText('Vous avez obtenu ~g~10g de Meth ~w~séparés en 10 pochtars de ~g~1g', 5000)
	end)
	end
    converting = false
end)

-- WEED (20G) >> WEED (4G)
RegisterNetEvent("Weed20gToWeed4g")
AddEventHandler("Weed20gToWeed4g", function()
    if converting then
      return
    end
    converting = true
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		--PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", 0, 1)
		TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 0, true)
		--TaskPlayAnim(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, 8.0, -1, 0, 1, false, false, false)
		--exports['progressBars']:startUI(30000, "Weed (20G)  >  Weed (4G)")
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 20000, function()
		--Citizen.Wait(30000)
		ESX.DrawMissionText('Vous avez obtenu ~g~20g de Weed ~w~séparés en 5 pochtars de ~g~4g', 5000)
		ClearPedTasks(PlayerPedId())
		end)
	else
		--exports['progressBars']:startUI(30000, "Weed (20G)  >  Weed (4G)")
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 20000, function()
		--Citizen.Wait(30000)
		ESX.DrawMissionText('Vous avez obtenu ~g~20g de Weed ~w~séparés en 5 pochtars de ~g~4g', 5000)
		end)
	end
    converting = false
end)

-- WEED (4G) >> JOINT (2G)
RegisterNetEvent("Weed4gToJoint2g")
AddEventHandler("Weed4gToJoint2g", function()
    if converting then
      return
    end
    converting = true
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 0, true)
		--exports['progressBars']:startUI(15000, "Weed (4G)  >  JOINT (2G)")
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 10000, function()
		--Citizen.Wait(15000)
		ESX.DrawMissionText('Vous avez obtenu un ~g~Joint ~w~de ~g~2g', 4000)
		ClearPedTasks(PlayerPedId())
		end)
	else
		--exports['progressBars']:startUI(15000, "Weed (4G)  >  JOINT (2G)")
		exports["a_loadingbar"]:StartDelayedFunction("Détaille..", 10000, function()
		--Citizen.Wait(15000)
		ESX.DrawMissionText('Vous avez obtenu un ~g~Joint ~w~de ~g~2g', 4000)
		end)
	end
    converting = false
end)