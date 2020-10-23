local ESX

cachedData = {
	["cbData"] = {}
}

TriggerEvent("esx:getSharedObject", function(library) 
	ESX = library 
end)

RegisterServerEvent("burglary:globalEvent")
AddEventHandler("burglary:globalEvent", function(options)
	ESX.Trace((options["event"] or "none") .. " triggered to all clients.")

	if options["data"]["saveData"] then
		if options["event"] == "lockpick_house" then
			cachedData["cbData"][options["data"]["houseId"]] = {
				["Lootables"] = {}
			}
		elseif options["event"] == "lock_house" then
			cachedData["cbData"][options["data"]["houseId"]] = {
				["locked"] = true
			}
		else
			cachedData["cbData"][options["data"]["houseId"]]["Lootables"][options["data"]["lootSpot"]] = true
		end
	end
	
    TriggerClientEvent("burglary:eventHandler", -1, options["event"] or "none", options["data"] or nil)
end)

RegisterServerEvent("burglary:cacheData")
AddEventHandler("burglary:cacheData", function(data)
	cachedData["cbData"] = data
end)

ESX.RegisterServerCallback("burglary:fetchData", function(source, cb)
	local player = ESX.GetPlayerFromId(source)
	if player then	
		cb(cachedData["cbData"])
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback("burglary:lootItem", function(source, cb)
	local player = ESX.GetPlayerFromId(source)
	if player then
		local randomTier = math.random(100)
		local tier = randomTier >= 95 and 5 or randomTier >= 85 and 4 or randomTier >= 70 and 3 or randomTier >= 50 and 2 or randomTier >= 0 and 1

		if #Config.LootTable[tier] > 0 then
			local randomItem = Config.LootTable[tier][math.random(#Config.LootTable[tier])]
			print("oui")
			if randomItem ~= "nothing" and randomItem ~= "money" then
				player.addInventoryItem(randomItem, 1)
				if randomItem == "joint2g" then
					TriggerClientEvent("esx:showNotification", source, "Vous avez récupérer ~g~un joint.")
				elseif randomItem == "bmx" then
					TriggerClientEvent("esx:showNotification", source, "Vous avez récupérer ~g~un bmx.")
				elseif randomItem == "phone" then
					TriggerClientEvent("esx:showNotification", source, "Vous avez récupérer ~g~un téléphone.")
				elseif randomItem == "weed20g" then
					TriggerClientEvent("esx:showNotification", source, "Vous avez récupérer ~g~un petit sac de weed.")
				end
			elseif randomItem == "money" then
				player.addMoney(350)
				TriggerClientEvent("esx:showNotification", source, "Vous avez récupérer ~g~350$.")
			else
				TriggerClientEvent("esx:showNotification", source, "Vous n'avez ~r~rien trouvé.")
			end
		end
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback("burglary:isHouseRobbable", function(source, cb)

	local player = ESX.GetPlayerFromId(source)
	local players = ESX.GetPlayers()
	local copsOnduty = 0

	for playerIndex = 1, #players do
		local player = ESX.GetPlayerFromId(players[playerIndex])

		if player["job"]["name"] == "police" then
			copsOnduty = copsOnduty + 1
		end
	end

	if copsOnduty >= Config.CopsRequired then
		cb(true)
	else
		cb(false)
	end

end)