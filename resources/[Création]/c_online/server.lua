local segundosshow = {}
local minutosshow = {}
local horasshow = {}
local diasshow = {}
local segundoscheck = {}
local minutoscheck = {}
local horascheck = {}
local diascheck = {}
--------------------------- CHECK SE EXISTE REGISTO DE NECESSIDADES NA DATABASE ----------------
RegisterServerEvent("tempo")
AddEventHandler("tempo", function()
    local value = GetPlayerIdentifiers(source)[1]
	local identifiernr = string.match(value, "^.*%:(.*)" )
	local content = LoadResourceFile(GetCurrentResourceName(), 'tempo/'.. identifiernr ..'-tempo.txt')
	-- print(content)
	if content ~= nil then
		local segundo = 0
	    local minuto = 0
		local hora = 0
		local dia = 0
		for i,l in ipairs(stringsplit(content, "\n")) do
		    local thecheck = ""
			for i = 1, #l do
		        if string.sub(l,i,i) == ":" then break end 
		        thecheck = thecheck..string.sub(l,i,i)
			end
			if thecheck == 'Seg' then
		        segundo = string.match(l, "^.*%:(.*)" )
            end
			if thecheck == 'Min' then
		        minuto = string.match(l, "^.*%:(.*)" )
            end
			if thecheck == 'Hor' then
		        hora = string.match(l, "^.*%:(.*)" )
            end
			if thecheck == 'Dia' then
		        dia = string.match(l, "^.*%:(.*)" )
            end				
		end
		TriggerClientEvent("sendDados", source, segundo, minuto, hora, dia)
	else
		local string = "Seg:0\nMin:0\nHor:0\nDia:0\n"
	    file = io.open('resources/'.. GetCurrentResourceName() .. '/tempo/'.. identifiernr ..'-tempo.txt', "a")
		content = LoadResourceFile(GetCurrentResourceName(), 'tempo/'.. identifiernr ..'-tempo.txt')
	    file:write(string)
		file:flush()
	    file:close()
		local segundo = 0
		local minuto = 0
		local hora = 0
		local dia = 0
		for i,l in ipairs(stringsplit(content, "\n")) do
		    local thecheck = ""
			for i = 1, #l do
		        if string.sub(l,i,i) == ":" then break end 
		        thecheck = thecheck..string.sub(l,i,i)
			end
			if thecheck == 'Seg' then
		        segundo = string.match(l, "^.*%:(.*)" )
				-- print(segundo)
            end
			if thecheck == 'Min' then
		        minuto = string.match(l, "^.*%:(.*)" )
            end
			if thecheck == 'Hor' then
		        hora = string.match(l, "^.*%:(.*)" )
            end
			if thecheck == 'Dia' then
		        dia = string.match(l, "^.*%:(.*)" )
            end				
		end
		TriggerClientEvent("sendDados", source, segundo, minuto, hora, dia)
	end
end)

RegisterServerEvent("salvartempo")
AddEventHandler("salvartempo", function(s, m, h, d)
    local value = GetPlayerIdentifiers(source)[1]
	local identifiernr = string.match(value, "^.*%:(.*)" )
    local string = "Seg:".. s .."\nMin:".. m .."\nHor:".. h .."\nDia:".. d .."\n"
	file = io.open('resources/'.. GetCurrentResourceName() .. '/tempo/'.. identifiernr ..'-tempo.txt', "w+")
	file:flush()
	file:close() 
	file2 = io.open('resources/'.. GetCurrentResourceName() .. '/tempo/'.. identifiernr ..'-tempo.txt', "w")
	file2:write(string)
    file2:flush()
	file2:close()    
end)

AddEventHandler('chatMessage', function(source, color, msg)
	cm = stringsplit(msg, " ")
	if cm[1] == "/ot" or cm[1] == "/onlinetime" then
		CancelEvent()
		local name = GetPlayerName(source)
		if tablelength(cm) == 1 then
		    local value = GetPlayerIdentifiers(source)[1]
	        local identifiernr = string.match(value, "^.*%:(.*)" )
		    local content = LoadResourceFile(GetCurrentResourceName(), 'tempo/'.. identifiernr ..'-tempo.txt')
			local segundo = 0
	    	local minuto = 0
			local hora = 0
			local dia = 0
			for i,l in ipairs(stringsplit(content, "\n")) do
		   	 	local thecheck = ""
				for i = 1, #l do
		        	if string.sub(l,i,i) == ":" then break end 
		       		thecheck = thecheck..string.sub(l,i,i)
				end
				if thecheck == 'Seg' then
		       		segundo = string.match(l, "^.*%:(.*)" )
                end
				if thecheck == 'Min' then
		        	minuto = string.match(l, "^.*%:(.*)" )
            	end
				if thecheck == 'Hor' then
		        	hora = string.match(l, "^.*%:(.*)" )
            	end
				if thecheck == 'Dia' then
		        	dia = string.match(l, "^.*%:(.*)" )
           		end
			end
			segundo = tonumber(segundo)
			minuto = tonumber(minuto)
			hora = tonumber(hora)
			dia = tonumber(dia)
			segundo = math.floor(segundo)
			minuto = math.floor(minuto)
			hora = math.floor(hora)
			dia = math.floor(dia)
			if segundo <= 9 then
			    segundo = '0'.. tostring(segundo)
			end
			if minuto <= 9 then
			    minuto = '0'.. tostring(minuto)
		    end
			if hora <= 9 then
			    hora = '0'.. tostring(hora)
			end
			if dia > 0 then
				if dia == 1 then
					TriggerClientEvent('chatMessage', source, "Online time" , {255, 0, 0}, "Joueur: " .. name .. " | " .. tostring(dia) .. " Jour | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")    
			    else
				    TriggerClientEvent('chatMessage', source, "Online time" , {255, 0, 0}, "Joueur: " .. name .. " | " .. tostring(dia) .. " Jours |  " .. hora .. ":" .. minuto .. ":" .. segundo .. "")          
				end
			else
				TriggerClientEvent('chatMessage', source, "Online time" , {255, 0, 0}, "Joueur: " .. name .. " |  " .. hora .. ":" .. minuto .. ":" .. segundo .. "")    
		    end
		end
		if tablelength(cm) == 2 then
		    if tonumber(cm[2]) then
		    local tPID = tonumber(cm[2])
			    local name = GetPlayerName(tPID)
				if name ~= nil then			    
				    local value = GetPlayerIdentifiers(tPID)[1]
	                local identifiernr = string.match(value, "^.*%:(.*)" )
		            local content = LoadResourceFile(GetCurrentResourceName(), 'tempo/'.. identifiernr ..'-tempo.txt')
			        local segundo = 0
	    	        local minuto = 0
			        local hora = 0
			        local dia = 0
			        for i,l in ipairs(stringsplit(content, "\n")) do
		   	 	        local thecheck = ""
				        for i = 1, #l do
		        	        if string.sub(l,i,i) == ":" then break end 
		       		        thecheck = thecheck..string.sub(l,i,i)
				        end
				        if thecheck == 'Seg' then
		       		        segundo = string.match(l, "^.*%:(.*)" )
                        end
				        if thecheck == 'Min' then
		        	        minuto = string.match(l, "^.*%:(.*)" )
            	        end
				        if thecheck == 'Hor' then
		        	        hora = string.match(l, "^.*%:(.*)" )
            	        end
				        if thecheck == 'Dia' then
		        	        dia = string.match(l, "^.*%:(.*)" )
           		        end
			        end
			        segundo = tonumber(segundo)
			        minuto = tonumber(minuto)
			        hora = tonumber(hora)
			        dia = tonumber(dia)
			        segundo = math.floor(segundo)
			        minuto = math.floor(minuto)
			        hora = math.floor(hora)
			        dia = math.floor(dia)
			        if segundo <= 9 then
			            segundo = '0'.. tostring(segundo)
			        end
			        if minuto <= 9 then
			            minuto = '0'.. tostring(minuto)
		            end
			        if hora <= 9 then
			            hora = '0'.. tostring(hora)
			        end
				    if dia > 0 then
				        if dia == 1 then
							if name ~= GetPlayerName(source) then
						        TriggerClientEvent('chatMessage', source, "Online time" , {255, 0, 0}, "Joueur: " .. name .. " | " .. tostring(dia) .." Jour | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")       
						    else
								TriggerClientEvent('chatMessage', source, "Online time" , {255, 0, 0}, "Joueur: " .. name .. " | " .. tostring(dia) .." Jour | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")     
						    end
						else
							if name ~= GetPlayerName(source) then
						        TriggerClientEvent('chatMessage', source, "Online time" , {255, 0, 0}, "Joueur: " .. name .. " | " .. tostring(dia) .." Jours | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")         
						    else
								TriggerClientEvent('chatMessage', source, "Online time" , {255, 0, 0}, "Joueur: " .. name .. " | " .. tostring(dia) .." Jours | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")     
						    end
					    end
				    else
					    if name ~= GetPlayerName(source) then
						    TriggerClientEvent('chatMessage', source, "Online time" , {255, 0, 0}, "Joueur: " .. name .. " | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")           
						else
						    TriggerClientEvent('chatMessage', source, "Online time" , {255, 0, 0}, "Joueur: " .. name .. " | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")     
						end
					end
			    else
				    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "ID Incorrect!")
				end
	        end	
		end
		if tablelength(cm) > 2 then
		    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Faites : /ot ou /onlinetime")
			TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Pour voir le temps de jeu d'autres joueurs : /ot [ID] ou /onlinetime [ID]")
		end
	end		
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end


function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end