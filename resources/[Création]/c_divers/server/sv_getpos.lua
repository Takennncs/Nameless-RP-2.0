RegisterServerEvent('getpos:send')
AddEventHandler('getpos:send', function(coords)
	sendToDiscord('Coordonnées','{x = ' .. coords.x .. ', y = ' .. coords.y .. ', z = ' .. coords.z .. '},\n{' .. coords.x .. ', ' .. coords.y .. ', ' .. coords.z .. '},\nvector3(' .. coords.x .. ', ' .. coords.y .. ', ' .. coords.z .. '),')
end)

function sendToDiscord(name,message,text)
	local DiscordWebHook = Config.webhook
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds

	local embeds = {
		{
			["title"]=message,
			["description"]=text,
			["type"]="rich",
			["footer"]=  {
			["text"]= os.date("%d/%m/%Y %H:%M:%S"),
		   },
		}
	}
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end