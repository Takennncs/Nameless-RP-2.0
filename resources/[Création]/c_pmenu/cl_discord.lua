Citizen.CreateThread(function()
    while true do
        local user = GetPlayerPed(-1)
        
		Citizen.Wait(5000) 
        
        SetDiscordAppId(748889269388705812) -- input the applications client ID you created. This can be found in the tab "General Information"

        -- SetRichPresence(GetPlayerName(source) .. " est sur " .. GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(user))) )) --[[ this will show the players 
        --current location in game(street name) there are more sources you can use to show more options 
        --about the player--]]

        SetDiscordRichPresenceAsset("logo") 
        SetDiscordRichPresenceAssetText("discord.gg/uk6NpCf") 

		players = {}
		for i = 0, 255 do
			if NetworkIsPlayerActive( i ) then
				table.insert( players, i )
			end
		end
		SetRichPresence(GetPlayerName(PlayerId()) .. " - ".. #players .. "/64 en ligne !")

		Citizen.Wait(60000)
    end
end)

