local PlayerData, CurrentActionData, HandcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService, isInShopMenu = false, false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged = false
ESX = nil
locksound = false
onDuty = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

function avantgauche()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
       if GetVehicleDoorAngleRatio(playerVeh, 0) > 0.0 then 
          SetVehicleDoorShut(playerVeh, 0, false)
        else
          SetVehicleDoorOpen(playerVeh, 0, false)
          frontleft = true        
       end
    end
end

function avantdroite()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
       if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then 
          SetVehicleDoorShut(playerVeh, 1, false)
        else
          SetVehicleDoorOpen(playerVeh, 1, false)
          frontleft = true        
       end
    end
end

function arrieregauche()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
       if GetVehicleDoorAngleRatio(playerVeh, 2) > 0.0 then 
          SetVehicleDoorShut(playerVeh, 2, false)
        else
          SetVehicleDoorOpen(playerVeh, 2, false)
          frontleft = true        
       end
    end
end

function arrieredroite()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
       if GetVehicleDoorAngleRatio(playerVeh, 3) > 0.0 then 
          SetVehicleDoorShut(playerVeh, 3, false)
        else
          SetVehicleDoorOpen(playerVeh, 3, false)
          frontleft = true        
       end
    end
end

function capot()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
       if GetVehicleDoorAngleRatio(playerVeh, 4) > 0.0 then 
		  SetVehicleDoorShut(playerVeh, 4, false)
        else
          SetVehicleDoorOpen(playerVeh, 4, false)
          frontleft = true        
       end
    end
end

function coffre()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
       if GetVehicleDoorAngleRatio(playerVeh, 5) > 0.0 then 
		  SetVehicleDoorShut(playerVeh, 5, false)
        else
          SetVehicleDoorOpen(playerVeh, 5, false)
          frontleft = true        
       end
    end
end

AddEventHandler('window_open', function(data)
    local player = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(player, false) 
    if (IsPedSittingInAnyVehicle(player)) then
        if data == 1 then
            RollDownWindow(vehicle, 1)
        elseif data == 2 then
            RollDownWindow(vehicle, 0)
        elseif data == 3 then
            RollDownWindow(vehicle, 3)
        elseif data == 4 then
            RollDownWindow(vehicle, 2)
        elseif data == 5 then
            RollUpWindow(vehicle, 0)
            RollUpWindow(vehicle, 1)
            RollUpWindow(vehicle, 2)
            RollUpWindow(vehicle, 3)
        end
    else
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(20)
            if IsControlJustPressed(1,157) and IsPedInAnyVehicle(GetPlayerPed(-1)) then 
                local pedsCar = GetVehiclePedIsIn(GetPlayerPed(-1),false)
                SetPedIntoVehicle(PlayerPedId(), pedsCar, -1)
            elseif IsControlJustPressed(1,158) and IsPedInAnyVehicle(GetPlayerPed(-1)) then 
                local pedsCar = GetVehiclePedIsIn(GetPlayerPed(-1),false)
                SetPedIntoVehicle(PlayerPedId(), pedsCar, 0)
            elseif IsControlJustPressed(1,160) and IsPedInAnyVehicle(GetPlayerPed(-1)) then 
                    local pedsCar = GetVehiclePedIsIn(GetPlayerPed(-1),false)
                    SetPedIntoVehicle(PlayerPedId(), pedsCar, 1)
            elseif IsControlJustPressed(1,164) and IsPedInAnyVehicle(GetPlayerPed(-1)) then 
                    local pedsCar = GetVehiclePedIsIn(GetPlayerPed(-1),false)
                    SetPedIntoVehicle(PlayerPedId(), pedsCar, 2)
            elseif IsControlJustPressed(1,165) and IsPedInAnyVehicle(GetPlayerPed(-1)) then 
                    local pedsCar = GetVehiclePedIsIn(GetPlayerPed(-1),false)
                    SetPedIntoVehicle(PlayerPedId(), pedsCar, 3)
            elseif IsControlJustPressed(1,161) and IsPedInAnyVehicle(GetPlayerPed(-1)) then 
                    local pedsCar = GetVehiclePedIsIn(GetPlayerPed(-1),false)
                    SetPedIntoVehicle(PlayerPedId(), pedsCar, 6)
            elseif IsControlJustPressed(1,159) and IsPedInAnyVehicle(GetPlayerPed(-1)) then 
                    local pedsCar = GetVehiclePedIsIn(GetPlayerPed(-1),false)
                    SetPedIntoVehicle(PlayerPedId(), pedsCar, 4)
            elseif IsControlJustPressed(1,162) and IsPedInAnyVehicle(GetPlayerPed(-1)) then 
                    local pedsCar = GetVehiclePedIsIn(GetPlayerPed(-1),false)
                    SetPedIntoVehicle(PlayerPedId(), pedsCar, 5)
                --end
            --end                                                   
        end
    end
end)

function vehicleType(using)
    local cars = Config.Vehicles
  
    for i=1, #cars, 1 do
      if IsVehicleModel(using, GetHashKey(cars[i])) then
            return true
        end
    end
end

local etatmot = {
	"Allumer",
	"Eteindre"
}

local portes = {
	"Porte Avant Droite",
    "Porte Avant Gauche",
    "Porte Arrière Droite",
    "Porte Arrière Gauche",
    "Capot",
    "Coffre"
}

local fenetres = {
    "Avant Gauche",
    "Avant Droite",
    "Arrière Gauche",
    "Arrière Droite",
    "Fermer toutes les fenêtres"
}

local etatmoteur = {
    "Démarrer",
    "Couper"
}

local vitesselimit = {
    "50",
    "75",
    "110",
    "130",
    "Par défault"
}

local megaphone = {
    "Conducteur Stop !",
    "Arrêter votre putain de voiture",
    "Arrêter vous immédiatement"
}

local menuveh = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Menu véhicule" },
	Data = { currentMenu = "Menu véhicule", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local pPed = GetPlayerPed(-1)
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            local PedCar = GetVehiclePedIsIn(pPed, false)
            local carSpeed = math.ceil(GetEntitySpeed(PedCar) * 3.6)
            if btn == "Moteur" then 
                OpenMenu('Moteur')
            elseif slide == 1 and btn == "Gestion moteur" then 
                SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), true, false, true)
                SetVehicleUndriveable(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
            elseif slide == 2 and btn == "Gestion moteur" then 
                SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), false, false, true)
                SetVehicleUndriveable(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
            elseif btn == "Vérifier l'état du moteur" then 
                local pPed = GetPlayerPed(-1)
                local vehicleclp = GetVehiclePedIsIn(pPed, false)
                local vievehiculeclp = GetVehicleEngineHealth(vehicleclp)
                ESX.ShowNotification("~b~État:~s~\n"..vievehiculeclp.. "~b~ / 1000")
            elseif btn == "Vérifier la température du moteur" then 
                local pPed = GetPlayerPed(-1)
                local vehicleclp = GetVehiclePedIsIn(pPed, false)
                local vievehiculefuelclp = GetVehicleEngineTemperature(vehicleclp)
                ESX.ShowNotification("~b~Température:~s~\n"..vievehiculefuelclp.. "")
            elseif btn == "Tracer le véhicule" then
                local player = GetPlayerPed(-1)
                if (IsPedSittingInAnyVehicle(player)) then 
                    if  saved == true then
                        saveVehicle = GetVehiclePedIsIn(player,false)
                        local vehicle = saveVehicle
                        RemoveBlip(targetBlip)
                        ESX.ShowNotification("Véhicule : ".. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "\n~r~Supprimé")
                        saved = false
                    else
                        RemoveBlip(targetBlip)
                        saveVehicle = GetVehiclePedIsIn(player,true)
                        local vehicle = saveVehicle
                        targetBlip = AddBlipForEntity(vehicle)
                        SetBlipSprite(targetBlip,225)
                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentString("Véhicule Enregistré")
                        EndTextCommandSetBlipName(targetBlip)
                        ESX.ShowNotification("Véhicule : ".. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "\n~g~Enregistré")
                        saved = true
                    end
                else
                    ESX.ShowNotification("Vous devez être dans un véhicule pour faire cette action")
                end
			elseif slide == 1 and btn == "Portes" then
				avantdroite()
			elseif slide == 2 and btn == "Portes" then
				avantgauche()
			elseif slide == 3 and btn == "Portes" then
				arrieredroite()
			elseif slide == 4 and btn == "Portes" then
				arrieregauche()
			elseif slide == 5 and btn == "Portes" then
				capot()
			elseif slide == 6 and btn == "Portes" then
				coffre()
			elseif slide == 1 and btn == "Fenêtres" then
                TriggerEvent('window_open', 2)
			elseif slide == 2 and btn == "Fenêtres" then
                TriggerEvent('window_open', 1)
			elseif slide == 3 and btn == "Fenêtres" then	
                TriggerEvent('window_open', 4)
			elseif slide == 4 and btn == "Fenêtres" then
                TriggerEvent('window_open', 3)
            elseif slide == 5 and btn == "Fenêtres" then 
                TriggerEvent('window_open', 5)
            elseif slide == 1 and btn == "Limitateur de vitesse" then 
                SetEntityMaxSpeed(GetVehiclePedIsIn(pPed, false), 50.0/3.6)
            elseif slide == 2 and btn == "Limitateur de vitesse" then 
                SetEntityMaxSpeed(GetVehiclePedIsIn(pPed, false), 75.0/3.6)
            elseif slide == 3 and btn == "Limitateur de vitesse" then 
                SetEntityMaxSpeed(GetVehiclePedIsIn(pPed, false), 110.0/3.6)
            elseif slide == 4 and btn == "Limitateur de vitesse" then 
                SetEntityMaxSpeed(GetVehiclePedIsIn(pPed, false), 130.0/3.6)
            elseif slide == 5 and btn == "Limitateur de vitesse" then 
                SetEntityMaxSpeed(GetVehiclePedIsIn(pPed, false), 1000.0/3.6)
            elseif slide == 1 and btn == "Mégaphone" then 
                if vehicleType(GetVehiclePedIsUsing(GetPlayerPed(-1))) then
                    OpenMenu('Mégaphone')
                else
                    ESX.ShowNotification("~r~Votre véhicule ne possède aucun mégaphone.")
                end
            elseif btn == "Conducteur Stop !" then 
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "stop_vehicle-2", 0.6)
            elseif btn == "Arrêter votre putain de voiture" then 
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "stop_the_f_car", 0.6)
            elseif btn == "Arrêter vous immédiatement" then 
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "stop_or_executed", 0.6)
		end
	end,
	
},
	Menu = {
		["Menu véhicule"] = {
			b = {
                {name = "Tracer le véhicule", checkbox = false},
                {name = "Moteur", ask = "→", askX = true},
				{name = "Portes", slidemax = portes},
                {name = "Fenêtres", slidemax = fenetres},
                {name = "Limitateur de vitesse", slidemax = vitesselimit},
                -- {name = "Mégaphone", ask = ">", askX = true}
			}
        },
        ["Moteur"] = {
			b = {
				{name = "Gestion moteur", slidemax = etatmoteur},
                {name = "Vérifier l'état du moteur"},
				{name = "Vérifier la température du moteur"}
			}
        },
        ["Mégaphone"] = {
			b = {
				{name = "Conducteur Stop !"},
                {name = "Arrêter votre putain de voiture"},
				{name = "Arrêter vous immédiatement"}
			}
        },
	}
}


RegisterKeyMapping('+controlcar', 'Ouvrir les options de véhicule', 'keyboard', 'F11')

RegisterCommand('+controlcar', function()
    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
        CreateMenu(menuveh)
    end
end)
