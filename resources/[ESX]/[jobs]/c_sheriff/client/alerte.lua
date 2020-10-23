ESX                           = nil
local PlayerData              = {}
Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

-- Citizen.CreateThread( function()
--     while true do
--         Wait(0)
-- 		if IsPedTryingToEnterALockedVehicle(GetPlayerPed(-1)) or IsPedJacking(GetPlayerPed(-1)) then	
--             local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
--             TriggerServerEvent("call:makeCall", "veh", {x=plyPos.x,y=plyPos.y,z=plyPos.z})
--             Wait(3000)
--         end
--     end
-- end)

-- Citizen.CreateThread( function()
--     while true do
--         Wait(0)
--         if IsPedShooting(GetPlayerPed(-1)) then
--             local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
--             TriggerServerEvent("call:makeCall", "tir", {x=plyPos.x,y=plyPos.y,z=plyPos.z})
--             Wait(1000)
--         end
--     end
-- end)