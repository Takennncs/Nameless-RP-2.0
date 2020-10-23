Citizen.CreateThread(function()
    while true do
       Citizen.Wait(1)
       RestorePlayerStamina(GetPlayerPed(-1), 1.0)
    end
end)