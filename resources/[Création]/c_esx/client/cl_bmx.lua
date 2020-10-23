ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

-----------------------------------------------------------Positions-----------------------------------------------------------
local posachatbmx = {
	{x = -503.84,  y = -671.28, z = 33.08},
	{x = -406.95440673828, y = 6052.6484375, z = 31.542509078979}
}

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)
            for k in pairs(posachatbmx) do

                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posachatbmx[k].x, posachatbmx[k].y, posachatbmx[k].z)

                if dist <= 2.0 then
                    attente = 1
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour acheter un Bmx ? ~g~500$")
                if IsControlJustPressed(1, 38) then
                    TriggerServerEvent('addbmx')
                    ESX.ShowNotification("~g~Bmx\n~s~Achat Effectué.")
                    Citizen.Wait(5000)
                end
                break
            else
                attente = 150
            end
        end
    end
end)


Citizen.CreateThread(function()

    for k in pairs(posachatbmx) do

	local blip = AddBlipForCoord(posachatbmx[k].x, posachatbmx[k].y, posachatbmx[k].z)

	SetBlipSprite(blip, 483)
	SetBlipColour(blip, 43)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Location Bmx")
    EndTextCommandSetBlipName(blip)
    end
end)

-------------------------------------------------------------Blips-------------------------------------------------------------


function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local playerPed = GetPlayerPed(-1)
    local heading = GetEntityHeading(playerPed)
    local vehicle = CreateVehicle(car, x, y-0.6, z, heading, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
	SetVehicleNumberPlateText(vehicle, "LOCATION")
end

function locabmxpos()
	x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
	playerX = tonumber(string.format("%.2f", x))
    playerY = tonumber(string.format("%.2f", y))
    playerZ = tonumber(string.format("%.2f", z))
end

function RangerVeh()
    local vehicle = nil
    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
    else
        vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), 1)
    end
    local plaque = GetVehicleNumberPlateText(vehicle)
    if plaque == "LOCATION" then
        --Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( GetVehiclePedIsIn(GetPlayerPed(-1), false)))
        SetEntityAsMissionEntity(vehicle, false, true)
        DeleteVehicle(vehicle)
        TriggerServerEvent('addbmx')
        PlaySoundFrontend(-1, 'Bus_Schedule_Pickup', 'DLC_PRISON_BREAK_HEIST_SOUNDS', false)
    else
        ESX.ShowNotification("~r~Ce n'est pas un bmx.")
    end
end

RegisterNetEvent('bmx:usebmx')
AddEventHandler('bmx:usebmx', function()
    locabmxpos()
    TaskPlayAnim(GetPlayerPed(-1), 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@', 'plant_floor', 8.0, 1.0, 1000, 16, 0.0, false, false, false)
    Citizen.Wait(800)
    TriggerServerEvent('removebmx')
    spawnCar("bmx")
end)

local vehicle = {}
Citizen.CreateThread(function()
    while true do 
        vehicle = {}
        for v in EnumerateVehicles() do 
            table.insert(vehicle, v)
        end
        Wait(3000)
    end
end)

Citizen.CreateThread(function()
    local attente = 150
    local count = 0
    while true do
        Wait(attente)
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(vehicle) do 
            local oCoords = GetEntityCoords(v)
            local dst = GetDistanceBetweenCoords(pCoords, oCoords, true)
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), 1)
            local plaque = GetVehicleNumberPlateText(vehicle)
            if dst <= 1.8 and plaque == "LOCATION" then 
                    attente = 1
                    ESX.Game.Utils.DrawText3D1({
                        x = oCoords.x,
                        y = oCoords.y,
                        z = oCoords.z + 0.2,
                    }, "~p~E~s~ ramasser")
                    if IsControlJustReleased(1, 38) then 
                        TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
                        while IsPedInVehicle(PlayerPedId(), vehicle, true) do
                            Citizen.Wait(0)
                        end
                        TaskPlayAnim(GetPlayerPed(-1), 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@', 'plant_floor', 8.0, 1.0, 1000, 16, 0.0, false, false, false)
                        Citizen.Wait(1200)
                        RangerVeh()
                    end
                    break
            else
                attente = 150
            end
        end
    end
end)

--[[ local localbmxPeds = {
  -- Location Bmx
  {model="mp_m_waremech_01",  x=-503.84,  y=-671.28, z=33.08-0.98, a=3.38},
  {model="mp_m_waremech_01",  x=1760.51, y=3293.06, z=41.13-0.98, a=340.85},
  {model="mp_m_waremech_01",  x=-314.08, y=-1035.36, z=30.52-0.98, a=338.22},
  {model="mp_m_waremech_01",  x=-200.2, y=6234.6, z=31.52-0.98, a=230.87}
}
                
                
    Citizen.CreateThread(function()
                
        for k,v in ipairs(localbmxPeds) do
            RequestModel(GetHashKey(v.model))
            while not HasModelLoaded(GetHashKey(v.model)) do
                Wait(50)
            end
                
            local localbPed = CreatePed(4, GetHashKey(v.model), v.x, v.y, v.z, v.a, false, false)
            SetBlockingOfNonTemporaryEvents(localbPed, false)
            FreezeEntityPosition(localbPed, true)
            SetPedFleeAttributes(localbPed, 1, 0)
            SetEntityInvincible(localbPed, true)
            SetPedDiesWhenInjured(localbPed, true)
            TaskStartScenarioInPlace(localbPed, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, 0)
                
            SetModelAsNoLongerNeeded(GetHashKey(v.model))
        end
    end) ]]