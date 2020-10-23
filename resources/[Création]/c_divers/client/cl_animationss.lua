RegisterNetEvent('sleep')
AddEventHandler('sleep', function()
	local pedxd = GetPlayerPed(-1)
	if (DoesEntityExist(pedxd) and not IsEntityDead(pedxd) ) then 
	RequestAnimDict("timetable@tracy@sleep@")
	while (not HasAnimDictLoaded("timetable@tracy@sleep@")) do 
			Citizen.Wait(100)
		end
			if IsEntityPlayingAnim(pedxd, "timetable@tracy@sleep@", "idle_c", 3) then
			ClearPedSecondaryTask(pedxd)
			else
			TaskPlayAnim(pedxd, "timetable@tracy@sleep@", "idle_c", 4.0, 3.0, -1, 49, 0, 0, 0, 0 )
		end 
    end
end)