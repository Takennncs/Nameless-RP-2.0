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

local missioncardiversespour = false
local locationrhapsody = nil

local locationpounder = {x = 133.96,  y = -3210.4,  z = 5.84}

local positmissioncarstart = {
    {x = 153.16,  y = -3210.64,  z = 5.92}
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

        for k in pairs(positmissioncarstart) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positmissioncarstart[k].x, positmissioncarstart[k].y, positmissioncarstart[k].z)

			if dist <= 2.0 then
				attente = 1
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler à ~b~Kalvin")
                if IsControlJustPressed(1,51) then
                    ESX.DrawMissionText("~b~Bonjour que souhaitez-vous ?", 2000)
                    Citizen.Wait(2000)
                    openmenupourmissioncarpound()
				end
				break
            else
                attente = 150
            end
        end
    end
end)

Citizen.CreateThread(function()

    for k in pairs(positmissioncarstart) do

	local blip = AddBlipForCoord(positmissioncarstart[k].x, positmissioncarstart[k].y, positmissioncarstart[k].z)

	SetBlipSprite(blip, 525)
	SetBlipColour(blip, 26)
	SetBlipScale(blip, 0.4)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Kalvin")
    EndTextCommandSetBlipName(blip)
    end
end)

function openmenupourmissioncarpound()
    local elems = {
		{label = ("Livrer un Camion"), 	value = 'poundedliv1'},
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vocal',
    {
        css = 'head',
        title  = 'Kalvin',
        align = 'top-left',
        elements = elems
    },

    function(data, menu)
        if data.current.value == 'poundedliv1' then 
            TriggerEvent('pounderclp:allezchercher')
            TriggerEvent('activerlamissionetblips1')
			ESX.UI.Menu.CloseAll()
        end
    end,
        
    function(data, menu)
        ESX.UI.Menu.CloseAll()
    end)
end

RegisterNetEvent('pounderclp:allezchercher')
AddEventHandler('pounderclp:allezchercher', function()
    missioncardiversespour = true
    RequestModel(GetHashKey('Pounder'))
    while not HasModelLoaded(GetHashKey('Pounder')) do
    Citizen.Wait(0)
    end
    
    SetNewWaypoint(140.88, 6605.88)
    ClearAreaOfVehicles(locationpounder.x, locationpounder.y, locationpounder.z, 15.0, false, false, false, false, false) 
                    
    vehicle = CreateVehicle(GetHashKey('Pounder'), locationpounder.x, locationpounder.y, locationpounder.z, -2.0,  996.786, 25.1887, true, true)
    SetVehicleNumberPlateText(vehicle, 'CAMION')
    --SetVehicleColours(vehicle, 50, 70)
    --SetEntityAsMissionEntity(vehicle)
    SetEntityHeading(vehicle, 92.51)
    local plate = GetVehicleNumberPlateText(vehicle)
    TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) 
end)

RegisterNetEvent('activerlamissionetblips1')
AddEventHandler('activerlamissionetblips1', function()
    PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0)
    ESX.DrawMissionText("Localisation disponible sur votre ~g~GPS.", 5000)
    ESX.ShowNotification("Allez cherchez le véhicule et revenez voir ~b~Kalvin.")

    blipsfindelamissioncarpound = AddBlipForCoord(140.88, 6605.88, 31.84)
    SetBlipSprite(blipsfindelamissioncarpound, 225)
    SetBlipColour(blipsfindelamissioncarpound, 43)
    SetBlipFlashes(blipsfindelamissioncarpound, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Kalvin')
    EndTextCommandSetBlipName(blipsfindelamissioncarpound)
end)

local positrentercarmissioncarpound = {
    {x = 140.88,  y = 6605.88,  z = 31.84}
}


Citizen.CreateThread(function()
    local bonus = GetVehicleEngineHealth(vehicle)
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(positrentercarmissioncarpound) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positrentercarmissioncarpound[k].x, positrentercarmissioncarpound[k].y, positrentercarmissioncarpound[k].z)
            if dist <= 10.0 then
                attente = 1
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) then 
                    if missioncardiversespour then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour vendre le ~b~véhicule.")
                            if IsControlJustPressed(1,51) then 
                                missioncardiversespour = false
                                local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                                TaskLeaveVehicle(GetPlayerPed(-1), vehicle, 0)
                                Citizen.Wait(2500)
                                RemoveBlip(blipsfindelamissioncarpound)
                                ESX.Game.DeleteVehicle(vehicle)
                                PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 1)
                                TriggerServerEvent('esx_vehiclelock:deletekeyjobs', 'no', plate)
                                TriggerServerEvent("clpmissioncarpound:ventesreussi", bonus)
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
