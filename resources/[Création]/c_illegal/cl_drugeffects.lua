RegisterNetEvent("esx_drugs:activate_meth")
AddEventHandler("esx_drugs:activate_meth",function()
    local ped = GetPlayerPed(-1)
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true)
		--exports['progressBars']:startUI(10000, "Tu Prend de la meth")
		exports["a_loadingbar"]:StartDelayedFunction("Tu prend de la meth", 10000, function()
		--Citizen.Wait(10000)
		ESX.DrawMissionText("Tu as consommé de la ~g~Meth", 3000)
		ClearPedTasks(PlayerPedId())
		end)
	else
		--exports['progressBars']:startUI(10000, "Tu Prend de la meth")
		exports["a_loadingbar"]:StartDelayedFunction("Tu prend de la meth", 10000, function()
		--Citizen.Wait(10000)
		ESX.DrawMissionText("Tu as consommé de la ~g~Meth", 3000)
		end)
	end	
    SetTimecycleModifier("spectator5")
	SetPedMotionBlur(playerPed, true)
    if GetEntityHealth(ped) <= 180 then
        SetEntityHealth(ped,GetEntityHealth(ped)+20)
    elseif GetEntityHealth(ped) <= 199 then
        SetEntityHealth(ped,200)
    end
	Citizen.Wait(10000)
    SetTimecycleModifier("default")
	SetPedMotionBlur(playerPed, false)
end)

RegisterNetEvent("esx_drugs:activate_weed")
AddEventHandler("esx_drugs:activate_weed",function()
    local ped = GetPlayerPed(-1)
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_DRUG_DEALER", 0, true)
		--exports['progressBars']:startUI(10000, "Tu Prend un gros Joint")
		exports["a_loadingbar"]:StartDelayedFunction("Tu prend un Gros Joint", 10000, function()
		--Citizen.Wait(10000)
		ESX.DrawMissionText("Tu as consommé un ~g~Joint", 3000)
		ClearPedTasks(PlayerPedId())
		end)
	else
		--exports['progressBars']:startUI(10000, "Tu Prend un gros Joint")
		exports["a_loadingbar"]:StartDelayedFunction("Tu prend un Gros Joint", 10000, function()
		--Citizen.Wait(10000)
		ESX.DrawMissionText("Tu as consommé un ~g~Joint", 3000)
	end)
	end	
    SetTimecycleModifier("spectator5")
	SetPedMotionBlur(playerPed, true)
    if GetPedArmour(ped) <= 90 then
        AddArmourToPed(ped,10)
    elseif GetPedArmour(ped) <= 99 then
        SetPedArmour(ped,100)
    end
	Citizen.Wait(30000)
    SetTimecycleModifier("default")
	SetPedMotionBlur(playerPed, false)
end)

RegisterNetEvent("esx_drugs:activate_coke")
AddEventHandler("esx_drugs:activate_coke",function()
    local playerPed = PlayerId()
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true)
		--exports['progressBars']:startUI(10000, "Tu Prend un Rail de Coke")
		exports["a_loadingbar"]:StartDelayedFunction("Tu prend un rail de coke", 10000, function()
		--Citizen.Wait(10000)
		ESX.DrawMissionText("Tu as consommé un ~g~Rail de Cocaïne", 3000)
		ClearPedTasks(PlayerPedId())
		end)
	else
		--exports['progressBars']:startUI(10000, "Tu Prend un Rail de Coke")
		exports["a_loadingbar"]:StartDelayedFunction("Tu prend un rail de coke", 10000, function()
		--Citizen.Wait(10000)
		ESX.DrawMissionText("Tu as consommé un ~g~Rail de Cocaïne", 3000)
		end)
	end
	local timer = 0
	while timer < 60 do
    SetRunSprintMultiplierForPlayer(playerPed,1.2)
    SetTimecycleModifier("spectator5")
	SetPedMotionBlur(playerPed, true)
	ResetPlayerStamina(PlayerId())
	Citizen.Wait(2000)
	timer = timer + 2
	end
    SetTimecycleModifier("default")
	SetPedMotionBlur(playerPed, false)
    SetRunSprintMultiplierForPlayer(playerPed,1.0)
end)

RegisterNetEvent("clippy_teltraf:commencer")
AddEventHandler("clippy_teltraf:commencer",function()
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_STAND_MOBILE', 0, true)
		--exports['progressBars']:startUI(8000, "Connection")
		exports["a_loadingbar"]:StartDelayedFunction("Connection...", 8000, function()
		--Citizen.Wait(8000)
		end)
	else
		--exports['progressBars']:startUI(8000, "Connection")
		ESX.ShowNotification("~r~Vous ne pouvez pas faire cela en véhicule.")
		--exports["a_loadingbar"]:StartDelayedFunction("Connection...", 8000, function()
		--Citizen.Wait(8000)
		--end)
	end
end)

RegisterNetEvent("esx_newDrugs:HackingMiniGame")
AddEventHandler("esx_newDrugs:HackingMiniGame",function()
	toggleHackGame()
end)

function toggleHackGame()
	TriggerEvent("mhacking:show")
	TriggerEvent("mhacking:start",4,30,AtmHackFirstSuccess) 
	FreezeEntityPosition(GetPlayerPed(-1),true)
end

function AtmHackFirstSuccess(success)
    FreezeEntityPosition(GetPlayerPed(-1),false)
    TriggerEvent('mhacking:hide')
    if success then
		ESX.TriggerServerCallback("esx_newDrugs:StartMissionNow",function()
			ESX.ShowNotification("Tu as Réussi a  ~y~hacker~s~ le ~b~NetWork~s~")
			ClearPedTasks(PlayerPedId())
		end)
    else
		ESX.ShowNotification("Tu as ~r~Raté~s~ le Hack de la ~y~Location~s~")
		ClearPedTasks(PlayerPedId())
	end
end

function AtmHackSecondSuccess(success)
    FreezeEntityPosition(GetPlayerPed(-1),false)
    TriggerEvent('mhacking:hide')
    if success then
		ESX.TriggerServerCallback("esx_newDrugs:StartMissionNow",function()
		ESX.ShowNotification("Tu as Réussi a  ~y~hacker~s~ le ~b~NetWork~s~")
		end)
    else
		ESX.ShowNotification("Tu as ~r~Raté~s~ le Hack de la ~y~Location~s~")
		ClearPedTasks(PlayerPedId())
	end
	ClearPedTasks(PlayerPedId())
end