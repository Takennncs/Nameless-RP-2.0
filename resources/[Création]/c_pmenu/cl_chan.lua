ESX                           = nil
local ESXLoaded = false
local robbing = false

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	PlayerData = ESX.GetPlayerData()

    ESXLoaded = true
end)

local missioncardiverseschan = false

local locationBulldozer = {x = 102.84,  y = -390.16,  z = 41.28}

local positmissioncarstartchan = {
    {x = 107.52,  y = -383.52,  z = 41.76}
}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(positmissioncarstartchan) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positmissioncarstartchan[k].x, positmissioncarstartchan[k].y, positmissioncarstartchan[k].z)

			if dist <= 2.0 then
				attente = 1
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler à ~b~Asalo")
                if IsControlJustPressed(1,51) then
                    ESX.DrawMissionText("~b~Bonjour que souhaitez-vous ?", 2000)
                    Citizen.Wait(2000)
                    openmenupourmissioncarbulldo()
				end
				break
            else
                attente = 150
            end
        end
    end
end)

Citizen.CreateThread(function()

    for k in pairs(positmissioncarstartchan) do

	local blip = AddBlipForCoord(positmissioncarstartchan[k].x, positmissioncarstartchan[k].y, positmissioncarstartchan[k].z)

	SetBlipSprite(blip, 525)
	SetBlipColour(blip, 26)
	SetBlipScale(blip, 0.4)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Asalo")
    EndTextCommandSetBlipName(blip)
    end
end)

function openmenupourmissioncarbulldo()
    local elems = {
		{label = ("Livrer un Bulldozer"), 	value = 'bullldoedliv1'},
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vocal',
    {
        css = 'head',
        title  = 'Asalo',
        align = 'top-left',
        elements = elems
    },

    function(data, menu)
        if data.current.value == 'bullldoedliv1' then 
            TriggerEvent('bulldoezclp:allezchercher')
            TriggerEvent('activerlamissionetblipschan')
			ESX.UI.Menu.CloseAll()
        end
    end,
        
    function(data, menu)
        ESX.UI.Menu.CloseAll()
    end)
end


RegisterNetEvent('bulldoezclp:allezchercher')
AddEventHandler('bulldoezclp:allezchercher', function()
    missioncardiverseschan = true
    RequestModel(GetHashKey('Bulldozer'))
    while not HasModelLoaded(GetHashKey('Bulldozer')) do
    Citizen.Wait(0)
    end
    
    SetNewWaypoint(-477.4, -888.28)
    ClearAreaOfVehicles(locationBulldozer.x, locationBulldozer.y, locationBulldozer.z, 15.0, false, false, false, false, false) 
                    
    vehicle = CreateVehicle(GetHashKey('Bulldozer'), locationBulldozer.x, locationBulldozer.y, locationBulldozer.z, -2.0,  996.786, 25.1887, true, true)
    SetVehicleNumberPlateText(vehicle, 'CHANTIER')
    --SetVehicleColours(vehicle, 50, 70)
    --SetEntityAsMissionEntity(vehicle)
    SetEntityHeading(vehicle, 249.79153442383)
    local plate = GetVehicleNumberPlateText(vehicle)
    TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) 
end)

RegisterNetEvent('activerlamissionetblipschan')
AddEventHandler('activerlamissionetblipschan', function()
    PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0)
    ESX.DrawMissionText("Localisation disponible sur votre ~g~GPS.", 5000)
    ESX.ShowNotification("Allez cherchez le véhicule et revenez voir ~b~Asalo.")

    blipsfindelamissioncarchant = AddBlipForCoord(-477.4, -888.28, 23.76)
    SetBlipSprite(blipsfindelamissioncarchant, 225)
    SetBlipColour(blipsfindelamissioncarchant, 43)
    SetBlipFlashes(blipsfindelamissioncarchant, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Asalo')
    EndTextCommandSetBlipName(blipsfindelamissioncarchant)
end)

local positrentercarmissioncarchan = {
    {x = -477.4,  y = -888.28,  z = 23.76}
}


Citizen.CreateThread(function()
    local bonus = GetVehicleEngineHealth(vehicle)
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(positrentercarmissioncarchan) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positrentercarmissioncarchan[k].x, positrentercarmissioncarchan[k].y, positrentercarmissioncarchan[k].z)
            if dist <= 6.0 then
                attente = 1
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) then 
                    if missioncardiverseschan then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour vendre le ~b~véhicule.")
                            if IsControlJustPressed(1,51) then 
                                missioncardiverseschan = false
                                local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                                TaskLeaveVehicle(GetPlayerPed(-1), vehicle, 0)
                                Citizen.Wait(2500)
                                RemoveBlip(blipsfindelamissioncarchant)
                                ESX.Game.DeleteVehicle(vehicle)
                                PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 1)
                                TriggerServerEvent('esx_vehiclelock:deletekeyjobs', 'no', plate)
                                TriggerServerEvent("clpmissioncarchantier:ventesreussi", bonus)
                                --Citizen.Wait(2000)
                                TriggerEvent('clpmisssioncar:spawnfaggio')
                            end         
                        end    
                    end
                break
            else
                attente = 150
            end
        end
    end
end)
