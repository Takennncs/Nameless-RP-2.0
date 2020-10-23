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

local missioncardiverses = false
local locationrhapsody = nil

local rhapsody1 = {x = -1270.44,  y = 497.48,  z = 97.2}
local rhapsody2 = {x = 1922.24,  y = 3742.8,  z = 32.48}
local rhapsody3 = {x = -86.2,  y = 6545.04,  z = 31.48}

local primocustom1 = {x = 1211.68,  y = -1276.6,  z = 35.24}
local primocustom2 = {x = 216.68,  y = 2607.24,  z = 46.2}
local primocustom3 = {x = 1685.76,  y = 6433.52,  z = 32.36}

local positmissioncarstart = {
    {x = 188.48,  y = -1479.68,  z = 29.16}
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
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler à ~b~Ybrahm")
                if IsControlJustPressed(1,51) then
                    ESX.DrawMissionText("~b~Bonjour que souhaitez-vous ?", 2000)
                    Citizen.Wait(2000)
                    openmenupourmissioncar()
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
	AddTextComponentString("Ybrahm")
    EndTextCommandSetBlipName(blip)
    end
end)

function openmenupourmissioncar()
    local elems = {
		{label = ("Livrer une Rhapsody"), 					value = 'rhapsodyliv1'},
		{label = ("Livrer une Primo Custom"), 					value = 'primocustomliv1'},
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vocal',
    {
        css = 'head',
        title  = 'Ybrahm',
        align = 'top-left',
        elements = elems
    },

    function(data, menu)
        if data.current.value == 'rhapsodyliv1' then 
            TriggerEvent('clpmisssioncar:spawnfaggio')
            TriggerEvent('rhapsodyclp:allezchercher')
            TriggerEvent('activerlamissionetblips')
			ESX.UI.Menu.CloseAll()
		elseif data.current.value == 'primocustomliv1' then
            TriggerEvent('clpmisssioncar:spawnfaggio')
            TriggerEvent('primocustomclp:allezchercher')
            TriggerEvent('activerlamissionetblips')
			ESX.UI.Menu.CloseAll()
        end
    end,
        
    function(data, menu)
        ESX.UI.Menu.CloseAll()
    end)
end

RegisterNetEvent('clpmisssioncar:spawnfaggio')
AddEventHandler('clpmisssioncar:spawnfaggio', function()
    RequestModel(GetHashKey('faggio3'))
    while not HasModelLoaded('faggio3') do Wait(10) end 
    Citizen.Wait(5000)
    vehiclespawnstartfda = CreateVehicle(GetHashKey('faggio3'), GetEntityCoords(GetPlayerPed(-1)), GetEntityHeading(GetPlayerPed(-1)), 1, 0)
    SetVehicleNumberPlateText(vehiclespawnstartfda, 'MISSION')
    --SetEntityAsMissionEntity(vehiclespawnstartfda)
    TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehiclespawnstartfda, -1)
    local plate = GetVehicleNumberPlateText(vehiclespawnstartfda)
    TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) 
end)


RegisterNetEvent('rhapsodyclp:allezchercher')
AddEventHandler('rhapsodyclp:allezchercher', function()
    local chancespawnrhapsody = math.random(1,3)
    if chancespawnrhapsody == 1 then
        locationrhapsody = rhapsody1
    elseif chancespawnrhapsody == 2 then
        locationrhapsody = rhapsody2
    elseif chancespawnrhapsody == 3 then
        locationrhapsody = rhapsody3
    end

    RequestModel(GetHashKey('rhapsody'))
    while not HasModelLoaded(GetHashKey('rhapsody')) do
    Citizen.Wait(0)
    end

    SetNewWaypoint(locationrhapsody.x, locationrhapsody.y)
    ClearAreaOfVehicles(locationrhapsody.x, locationrhapsody.y, locationrhapsody.z, 15.0, false, false, false, false, false) 
                    
    vehicle = CreateVehicle(GetHashKey('rhapsody'), locationrhapsody.x, locationrhapsody.y, locationrhapsody.z, GetEntityHeading(GetPlayerPed(-1)), 1, 0)
    --SetVehicleColours(vehicle, 50, 70)
    --SetEntityAsMissionEntity(vehicle)
    SetEntityHeading(vehicle, 52.00)
    local plate = GetVehicleNumberPlateText(vehicle)
    TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) 
end)


RegisterNetEvent('primocustomclp:allezchercher')
AddEventHandler('primocustomclp:allezchercher', function()
    local chancespawnprimo = math.random(1,3)
    if chancespawnprimo == 1 then
        locationprimocustom = primocustom1
    elseif chancespawnprimo == 2 then
        locationprimocustom = primocustom2
    elseif chancespawnprimo == 3 then
        locationprimocustom = primocustom3
    end

    RequestModel(GetHashKey('primo2'))
    while not HasModelLoaded(GetHashKey('primo2')) do
    Citizen.Wait(0)
    end

    SetNewWaypoint(locationprimocustom.x, locationprimocustom.y)
    ClearAreaOfVehicles(locationprimocustom.x, locationprimocustom.y, locationprimocustom.z, 15.0, false, false, false, false, false) 
                    
    vehicle = CreateVehicle(GetHashKey('primo2'), locationprimocustom.x, locationprimocustom.y, locationprimocustom.z, -2.436,  996.786, 25.1887, true, true)
    --SetVehicleColours(vehicle, 50, 70)
    SetEntityAsMissionEntity(vehicle)
    SetEntityHeading(vehicle, 52.00)
    local plate = GetVehicleNumberPlateText(vehicle)
    TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) 
end)

RegisterNetEvent('activerlamissionetblips')
AddEventHandler('activerlamissionetblips', function()
    PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0)
    ESX.DrawMissionText("Localisation disponible sur votre ~g~GPS.", 5000)
    ESX.ShowNotification("Allez cherchez le véhicule et revenez voir ~b~Ybrahm.")

    blipsfindelamissioncar = AddBlipForCoord(191.68, -1454.76, 29.16)
    SetBlipSprite(blipsfindelamissioncar, 225)
    SetBlipColour(blipsfindelamissioncar, 43)
    SetBlipFlashes(blipsfindelamissioncar, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Ybrahm')
    EndTextCommandSetBlipName(blipsfindelamissioncar)
end)


local locationrhapsodydelete = {
    {x = -1270.44,  y = 497.48,  z = 97.2},
    {x = 1922.24,  y = 3742.8,  z = 32.48},
    {x = -86.2,  y = 6545.04,  z = 31.48},
    {x = 1211.68,  y = -1276.6,  z = 35.24},
    {x = 216.68,  y = 2607.24,  z = 46.2},
    {x = 1685.76,  y = 6433.52,  z = 32.36}
}

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(locationrhapsodydelete) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, locationrhapsodydelete[k].x, locationrhapsodydelete[k].y, locationrhapsodydelete[k].z)
            if dist <= 6.0 then
                attente = 1
                    --if missioncardiverses then
                        missioncardiverses = true
                        TaskLeaveVehicle(GetPlayerPed(-1), vehiclespawnstartfda, 0)
                        Citizen.Wait(5000)
                        ESX.Game.DeleteVehicle(vehiclespawnstartfda)
                    --end               
                break
            else
                attente = 150
            end
        end
    end
end)

local positrentercarmissioncar = {
    {x = 191.68,  y = -1454.76,  z = 29.16}
}

Citizen.CreateThread(function()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local bonus = GetVehicleEngineHealth(vehicle)
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(positrentercarmissioncar) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positrentercarmissioncar[k].x, positrentercarmissioncar[k].y, positrentercarmissioncar[k].z)
            if dist <= 6.0 then
                attente = 1
                if missioncardiverses then
                    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then 
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour vendre le ~b~véhicule.")
                            if IsControlJustPressed(1,51) then 
                                missioncardiverses = false
                                local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                                TaskLeaveVehicle(GetPlayerPed(-1), vehicle, 0)
                                Citizen.Wait(1750)
                                RemoveBlip(blipsfindelamissioncar)
                                ESX.Game.DeleteVehicle(vehicle)
                                PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 1)
                                TriggerServerEvent('esx_vehiclelock:deletekeyjobs', 'no', plate)
                                TriggerServerEvent("clpmissioncar:ventesreussi", bonus)
                            end               
                        break
                    else
                        attente = 150
                    end
                end
            end
        end
    end
end)