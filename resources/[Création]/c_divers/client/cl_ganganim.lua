RegisterNetEvent('gang')
AddEventHandler('gang', function()
local pedxd = GetPlayerPed(-1)

if (DoesEntityExist(pedxd) and not IsEntityDead(pedxd) ) then 

Citizen.CreateThread( function()
	RequestAnimDict("combat@aim_variations@1h@gang")
	   while (not HasAnimDictLoaded("combat@aim_variations@1h@gang")) do 
                Citizen.Wait(100)
            end
				if IsEntityPlayingAnim(pedxd, "combat@aim_variations@1h@gang", "aim_variation_a", 3) then
				ClearPedSecondaryTask(pedxd)
				else
				TaskPlayAnim(pedxd, "combat@aim_variations@1h@gang", "aim_variation_a", 4.0, 3.0, -1, 49, 0, 0, 0, 0 )
            end 
        end)
    end 
end)

RegisterKeyMapping('gang', 'Animation "Gang Weapons"', 'keyboard', '')

