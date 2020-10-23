local PlayersWashing = {}
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function WhiteningMoney(source,percent)
	local source = source
		SetTimeout(10000, function()

		if PlayersWashing[source] == true then
			local xPlayer		= ESX.GetPlayerFromId(source)
			local blackMoney	= xPlayer.getAccount('black_money')
			local _percent		= Config.Percentage
			
			if blackMoney.money < 1000 then
				TriggerClientEvent("esx:showNotification", source, "~r~T'a pas assez d'argent. ~s~Reviens avec minimum ~g~1000$")
			else
				local bonus = math.random(Config.Bonus.min, Config.Bonus.max)
				local washedMoney = math.floor(1000 / 100 * (_percent + bonus))

				xPlayer.removeAccountMoney('black_money', 1000)
				xPlayer.addMoney(washedMoney)
				WhiteningMoney(source,_percent)
				
				TriggerClientEvent("esx:showNotification", source, "Je t'ai ramené ~g~".. washedMoney .."$")
			end
		end
	end)
end

RegisterServerEvent('blanchisseur:infopolicea')
AddEventHandler('blanchisseur:infopolicea', function(x, y, z) 
	local total   = math.random(0, 99);
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
		if total >= 0 and total <= 15 then
			TriggerClientEvent('blanchisseur:infopolice', -1, x, y, z)
	end
	end
end)

RegisterServerEvent('esx_blanchisseur:washMoney')
AddEventHandler('esx_blanchisseur:washMoney', function(amount)
	local xPlayer 		= ESX.GetPlayerFromId(source)
	local account 		= xPlayer.getAccount('black_money')
	local _percent		= Config.Percentage

	if amount > 0 and account.money >= amount then
		
		local bonus = math.random(Config.Bonus.min, Config.Bonus.max)
		local washedMoney = math.floor(amount / 100 * (_percent + bonus))	

		xPlayer.removeAccountMoney('black_money', amount)
		xPlayer.addMoney(washedMoney)
		
		TriggerClientEvent("esx:showNotification", source, "Je t'ai ramené ~g~".. washedMoney .."$")
	else
		TriggerClientEvent("esx:showNotification", source, "~r~T'a pas assez d'argent. ~s~Reviens avec minimum ~g~1000$")
	end

end)

RegisterServerEvent('esx_blanchisseur:startWhitening')
AddEventHandler('esx_blanchisseur:startWhitening', function(percent)
	PlayersWashing[source] = true
	--TriggerClientEvent("esx_blanchisseur:notify", source, "CHAR_LESTER_DEATHWISH", 1, "Blanchisseur", false, "Blanchiement en cours ...")
	WhiteningMoney(source,percent)
end)


RegisterServerEvent('esx_blanchisseur:stopWhitening')
AddEventHandler('esx_blanchisseur:stopWhitening', function()
	PlayersWashing[source] = false
end)
