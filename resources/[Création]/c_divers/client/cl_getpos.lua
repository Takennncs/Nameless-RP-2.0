RegisterCommand("getpos", function(ped, coords)
    local ped = GetPlayerPed(PlayerId())
    local coords = GetEntityCoords(ped, false)
	Citizen.Trace(tostring("{x = " .. coords.x .. ", y = " .. coords.y .. ", z = " .. coords.z .. "},"))
	TriggerServerEvent('getpos:send', coords)
end, false)