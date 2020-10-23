local group 

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('es_admin:setGroup')
AddEventHandler('es_admin:setGroup', function(g)
	print('Groupe réglé sur ' .. g)
	group = g
end)

RegisterNetEvent("textsent")
AddEventHandler('textsent', function(tPID, names2)
  ESX.ShowNotification('~b~Réponse envoyé à ~s~'..names2..'~b~ - ~s~'..tPID)
end)

RegisterNetEvent("textmsg")
AddEventHandler('textmsg', function(source, textmsg, names2, names3 )
  ESX.ShowAdvancedNotification('Admin', '~b~'..names3, '~b~Message:~s~'.. textmsg.. '', "CHAR_MP_FM_CONTACT", 1)
end)

RegisterNetEvent('sendReport')
AddEventHandler('sendReport', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then    
    ESX.ShowNotification('~b~Report envoyé aux admins connéctés.')
    TriggerEvent('chatMessage', "", {255, 0, 0}, " [REPORT] | [".. id .."]" .. name .."  "..":^0  " .. message)
  elseif group ~= 'user' and pid ~= myId then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " [REPORT] | [".. id .."]" .. name .."  "..":^0  " .. message)
  end
end)

