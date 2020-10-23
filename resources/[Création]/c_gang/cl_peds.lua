ESX = nil
local PlayerData = {}
local HasAlreadyEnteredMarker = false
local currentZone = nil
local DISTANCE = 10
local DISTANCE_INTERACTION = 2
local MARKER_SIZE = 1.0
local E_KEY = 38

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                'sat:getSharedObject',
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(100)
        end

        PlayerData = ESX.GetPlayerData()
        start()
    end
)

function start()
    for _, ped in pairs(Config.Peds) do
        if ped.model ~= nil then

            local modelHash = GetHashKey(ped.model)
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Wait(1)
            end
            local SpawnedPed = CreatePed(2, modelHash, ped.pos, ped.h, false, true)
            TaskSetBlockingOfNonTemporaryEvents(SpawnedPed, true)
            Citizen.Wait(1)

            if ped.animation ~= nil then
                TaskStartScenarioInPlace(SpawnedPed, ped.animation, 0, false)
            end

            SetEntityInvincible(SpawnedPed, true)
            PlaceObjectOnGroundProperly(SpawnedPed)
            SetModelAsNoLongerNeeded(modelHash)
            Citizen.CreateThread(
                function()
                    local _ped = SpawnedPed
                    Citizen.Wait(1000)
                    FreezeEntityPosition(_ped, true)
                end
            )
        end
    end
end

