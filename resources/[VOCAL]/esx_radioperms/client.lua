PlayerData = {}

local done = false
local pressed = false
local once = true

-- RegisterNetEvent('esx:playerLoaded')
-- AddEventHandler('esx:playerLoaded', function(xPlayer)
-- 	PlayerData = ESX.GetPlayerData()
-- 	if PlayerData.job.name == 'police' then
--         exports["rp-radio"]:GivePlayerAccessToFrequencies(1, 2, 3)    
--     end
--     if PlayerData.job.name == 'ambulance' then
--         exports["rp-radio"]:GivePlayerAccessToFrequencies(7, 8, 9)    
--     end
--     if PlayerData.job.name == 'sheriff' then
--         exports["rp-radio"]:GivePlayerAccessToFrequencies(4, 5, 6)    
-- 	end
-- end)

-- Citizen.CreateThread(function()
--     while ESX == nil do
--         TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--         Citizen.Wait(0)
--     end
--     PlayerData = ESX.GetPlayerData()
--     while PlayerData.job == nil do
--         Citizen.Wait(10)
--     end
--     if PlayerData.job.name == 'police' then 
-- 	    exports["rp-radio"]:GivePlayerAccessToFrequencies(1, 2, 3)    
--     end
-- end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if once then
			once = false
			-- NetworkSetVoiceActive(1)
		end

		while IsControlJustPressed(1, 19) and pressed do
			Wait(10)
		end
		if IsControlJustPressed(1, 19) and not pressed then
			pressed = true
			level = level + 1
			if level > 3 then
				level = 1
			end
			if level == 1 then
				ShowNotif("~b~très basse~w~")
			elseif level == 2 then
				ShowNotif("~g~normale~w~")
			elseif level == 3 then
				ShowNotif("~r~très élevée~w~")
			end
		elseif not IsControlJustPressed(1, 19) and pressed then
			pressed = false
		end
	end
end)
