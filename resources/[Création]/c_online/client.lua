local segundos = 0
local minutos = 0
local horas = 0
local dias = 0
local timechecked = false
------------------ CHECK THE TIME ON SPAWN
Citizen.CreateThread(function()
    while true do
        Wait(0)
		TriggerServerEvent('tempo')
		return
    end
end)

------------------ RETRIEVING THE TIME ON SPAWN
RegisterNetEvent('sendDados')
AddEventHandler("sendDados", function(s, m, h, d)
    segundos = s
	minutos = m
    horas = h 
    dias = d
    timechecked = true -- STARTS THE COUNT OF THE ONLINE TIME
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000) 
		if timechecked == true then
			segundos = segundos + 1
			if segundos == 60 then
			    segundos = 0
			    minutos = minutos + 1
				if minutos == 60 then
				    minutos = 0
				    horas = horas + 1
				    if horas == 24 then
					    horas = 0
				        dias = dias + 1
				    end
				end
			end
		end
		TriggerServerEvent("salvartempo", segundos, minutos, horas, dias)
	end
end)
