ESX = nil

local PlayerHackTimer = {}
local PlayerDrugsTimer = {}
local PlayerConvertTimer = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx_newDrugs:startHackTimer")
AddEventHandler("esx_newDrugs:startHackTimer",function(source)
	table.insert(PlayerHackTimer,{started = GetPlayerIdentifier(source), time = 7200000}) -- cooldown timer for using USB stick
end)

RegisterServerEvent("esx_newDrugs:startDrugsTimer") 
AddEventHandler("esx_newDrugs:startDrugsTimer",function(source)
	table.insert(PlayerDrugsTimer,{startedDrugs = GetPlayerIdentifier(source), timeDrugs = 15000}) -- do not touch this
end)

RegisterServerEvent("esx_newDrugs:startConvertTimer")
AddEventHandler("esx_newDrugs:startConvertTimer",function(source)
	table.insert(PlayerConvertTimer,{startedConvert = GetPlayerIdentifier(source), timeConvert = 20000}) -- do not touch this
end)

function CountCops1()
	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops1)
end

CountCops1()

Citizen.CreateThread(function() -- do not touch this thread function!
	while true do
	Citizen.Wait(1000)
		for k,v in pairs(PlayerHackTimer) do
			if v.time <= 0 then
				RemoveStarted(v.started)
			else
				v.time = v.time - 1000
			end
		end
		for k,v in pairs(PlayerDrugsTimer) do
			if v.timeDrugs <= 0 then
				RemoveStartedDrugs(v.startedDrugs)
			else
				v.timeDrugs = v.timeDrugs - 1000
			end
		end
		for k,v in pairs(PlayerConvertTimer) do
			if v.timeConvert <= 0 then
				RemoveStartedConvert(v.startedConvert)
			else
				v.timeConvert = v.timeConvert - 1000
			end
		end
	end
end)


RegisterServerEvent('alertdrugs:poucavepolice')
AddEventHandler('alertdrugs:poucavepolice', function(x, y, z) 
	local total   = math.random(0, 100);
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if total >= 0 and total <= 30 then
		TriggerClientEvent('alertdrugs:poucavepolice1', -1, x, y, z)
	end
end)

--[[ RegisterServerEvent('drogues:positions')
AddEventHandler('drogues:positions', function(x, y, z) 
	local total   = math.random(0, 99);
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
		if total >= 0 and total <= 30 then
			TriggerClientEvent('drogues:infopolice', -1, x, y, z)
		end
	end
end) ]]

-- // ## DRUGS MISSIONS ## // --

RegisterServerEvent("esx_newDrugs:reward")
AddEventHandler("esx_newDrugs:reward",function(amount,typed)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(typed.."brick",math.ceil(amount))
end)

RegisterServerEvent("esx_newDrugs:syncMissionData")
AddEventHandler("esx_newDrugs:syncMissionData",function(data)
	TriggerClientEvent("esx_newDrugs:syncMissionData",-1,data)
end)

ESX.RegisterUsableItem('methburn', function(source)
	if not CheckedStarted(GetPlayerIdentifier(source)) then
		TriggerEvent("esx_newDrugs:startHackTimer",source)
		TriggerClientEvent("esx_newDrugs:UsableItem",source)
		Citizen.Wait(8000)
		TriggerClientEvent("esx_newDrugs:HackingMiniGame",source)
			
		ESX.RegisterServerCallback("esx_newDrugs:StartMissionNow",function(source,cb)
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			cb()
			TriggerClientEvent("esx_newDrugs:startMission",source,0,"meth")
		end)
		
 	else
	 	TriggerClientEvent("esx:showNotification",source,string.format("Vous ne pouvez plus avoir de missions pendant ~b~%s minutes",GetTimeForMission(GetPlayerIdentifier(source))))
  	end
end)

ESX.RegisterUsableItem('cokeburn', function(source)
	if not CheckedStarted(GetPlayerIdentifier(source)) then
		TriggerEvent("esx_newDrugs:startHackTimer",source)
		TriggerClientEvent("esx_newDrugs:UsableItem",source)
		Citizen.Wait(8000)
		TriggerClientEvent("esx_newDrugs:HackingMiniGame",source)
		
		ESX.RegisterServerCallback("esx_newDrugs:StartMissionNow",function(source,cb)
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			cb()
			TriggerClientEvent("esx_newDrugs:startMission",source,0,"coke")
		end)
		
 	else
	 	TriggerClientEvent("esx:showNotification",source,string.format("Vous ne pouvez plus avoir de missions pendant ~b~%s minutes",GetTimeForMission(GetPlayerIdentifier(source))))
  	end
end)

ESX.RegisterUsableItem('weedburn', function(source)
	if not CheckedStarted(GetPlayerIdentifier(source)) then
		TriggerEvent("esx_newDrugs:startHackTimer",source)
		TriggerClientEvent("esx_newDrugs:UsableItem",source)
		Citizen.Wait(8000)
		TriggerClientEvent("esx_newDrugs:HackingMiniGame",source)
		
		ESX.RegisterServerCallback("esx_newDrugs:StartMissionNow",function(source,cb)
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			cb()
			TriggerClientEvent("esx_newDrugs:startMission",source,0,"weed")
		end)
	
	else
	 	TriggerClientEvent("esx:showNotification",source,string.format("Vous ne pouvez plus avoir de missions pendant ~b~%s minutes",GetTimeForMission(GetPlayerIdentifier(source))))
	end
end)

-- // ## DRUGS EFFECT ## // --

ESX.RegisterUsableItem('meth1g', function(source)
	if not CheckedStartedDrugs(GetPlayerIdentifier(source)) then
	TriggerEvent("esx_newDrugs:startDrugsTimer",source)
	TriggerClientEvent("esx_drugs:activate_meth",source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem("meth1g",1)
	else
	 	TriggerClientEvent("esx:showNotification",source,string.format("Vous pouvez ~r~ consommer ~s~ un autre ~y~ médicament ~s~ en : ~b~%s secondes~s~",GetTimeForDrugs(GetPlayerIdentifier(source))))
	end
end)

ESX.RegisterUsableItem('coke1g', function(source)
	if not CheckedStartedDrugs(GetPlayerIdentifier(source)) then
	TriggerEvent("esx_newDrugs:startDrugsTimer",source)
	TriggerClientEvent("esx_drugs:activate_coke",source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem("coke1g",1)
	else
	 	TriggerClientEvent("esx:showNotification",source,string.format("Vous pouvez ~r~ consommer ~s~ un autre ~y~ médicament ~s~ en : ~b~%s secondes~s~",GetTimeForDrugs(GetPlayerIdentifier(source))))
	end
end)

ESX.RegisterUsableItem('joint2g', function(source)
	if not CheckedStartedDrugs(GetPlayerIdentifier(source)) then
	TriggerEvent("esx_newDrugs:startDrugsTimer",source)
	TriggerClientEvent("esx_drugs:activate_weed",source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem("joint2g",1)
	else
	 	TriggerClientEvent("esx:showNotification",source,string.format("Vous pouvez ~r~ consommer ~s~ un autre ~y~ médicament ~s~ en : ~b~%s secondes~s~",GetTimeForDrugs(GetPlayerIdentifier(source))))
	end
end)

-- // ## DRUGS CONVERSION ## // --

-- COKE BRICK >> COKE (10G)
ESX.RegisterUsableItem('cokebrick', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local brick = xPlayer.getInventoryItem("cokebrick").count >= 1
	local scale = xPlayer.getInventoryItem("hqscale").count >= 1
	local bags = xPlayer.getInventoryItem("drugbags").count >= 10
	
	if not bags or not brick then
		if not bags then
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de pochtars.")
		else
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de briques de cocaïne.")
		end
		return
	end
	
	local maxCokeOutput = 10
		
	if not scale then
		maxCokeOutput = 10
	end

	if xPlayer.getInventoryItem("coke10g").count <= 500 or (not scale and xPlayer.getInventoryItem("coke10g").count <= 504) then
		if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
			TriggerEvent("esx_newDrugs:startConvertTimer",source)
					
			xPlayer.removeInventoryItem("cokebrick",1)
			xPlayer.removeInventoryItem("drugbags",10)
		
			TriggerClientEvent("BrickToCoke10g",source)
			Citizen.Wait(80000)
		
			xPlayer.addInventoryItem("coke10g",maxCokeOutput)
		else
			TriggerClientEvent("esx:showNotification",source,string.format("~r~Vous êtes déjà engagé dans une action.",GetTimeForConvert(GetPlayerIdentifier(source))))
		end
	else
		TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez plus assez de place.")
	end
end)

-- METH BRICK >> METH (10G)
ESX.RegisterUsableItem('methbrick', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local brick = xPlayer.getInventoryItem("methbrick").count >= 1
	local scale = xPlayer.getInventoryItem("hqscale").count >= 1
	local bags = xPlayer.getInventoryItem("drugbags").count >= 10
	
	if not bags or not brick then
		if not bags then
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de pochtars.")
		else
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de briques de meth.")
		end
		return
	end

	local maxMethOutput = 10
		
	if not scale then
		maxMethOutput = 10
	end
	
	if xPlayer.getInventoryItem("meth10g").count <= 500 or (not scale and xPlayer.getInventoryItem("meth10g").count <= 504) then
		if xPlayer.hasWeapon('WEAPON_KNIFE') then 
			if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
				TriggerEvent("esx_newDrugs:startConvertTimer",source)
			
				xPlayer.removeInventoryItem("methbrick",1)
				xPlayer.removeInventoryItem("drugbags",10)
			
				TriggerClientEvent("BrickToMeth10g",source)
				Citizen.Wait(80000)
			
				xPlayer.addInventoryItem("meth10g",maxMethOutput)
			else
				TriggerClientEvent("esx:showNotification",source,string.format("~r~Vous êtes déjà engagé dans une action.",GetTimeForConvert(GetPlayerIdentifier(source))))
			end
		else
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de couteau.")
		end
	else
		TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez plus assez de place.")
	end
end)

-- WEED BRICK >> WEED (20G)
ESX.RegisterUsableItem('weedbrick', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local brick = xPlayer.getInventoryItem("weedbrick").count >= 1
	local scale = xPlayer.getInventoryItem("hqscale").count >= 1
	local bags = xPlayer.getInventoryItem("drugbags").count >= 10
	
	if not bags or not brick then
		if not bags then
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de pochtars.")
		else
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de briques de weed.")
		end
		return
	end
	
	local maxWeedOutput = 10
		
	if not scale then
		maxWeedOutput = 10
	end
	
	if xPlayer.getInventoryItem("weed20g").count <= 90 or (not scale and xPlayer.getInventoryItem("weed20g").count <= 92) then
		if xPlayer.hasWeapon('WEAPON_KNIFE') then 
		if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
			TriggerEvent("esx_newDrugs:startConvertTimer",source)
		
			xPlayer.removeInventoryItem("weedbrick",1)
			xPlayer.removeInventoryItem("drugbags",10)
		
			TriggerClientEvent("BrickToWeed20g",source)
			Citizen.Wait(80000)
		
			xPlayer.addInventoryItem("weed20g",maxWeedOutput)
		else
			TriggerClientEvent("esx:showNotification",source,string.format("~r~Vous êtes déjà engagé dans une action.",GetTimeForConvert(GetPlayerIdentifier(source))))
		end
	else
		TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de couteau.")
	end
	else
		TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez plus assez de place.")
	end
end)

ESX.RegisterUsableItem('coke10g', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local coke = xPlayer.getInventoryItem("coke10g").count >= 1
	local scale = xPlayer.getInventoryItem("hqscale").count >= 1
	local bags = xPlayer.getInventoryItem("drugbags").count >= 10
	
	if not bags or not coke then
		if not bags then
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de pochtars.")
		else
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de Cocaïne (10G)")
		end
		return
	end
	
	local maxCoke1gOutput = 10
		
	if not scale then
		maxCoke1gOutput = 10
	end
	
	if xPlayer.getInventoryItem("coke1g").count <= 1000 or (not scale and xPlayer.getInventoryItem("coke1g").count <= 1004) then
		if xPlayer.hasWeapon('WEAPON_KNIFE') then 
		if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
			TriggerEvent("esx_newDrugs:startConvertTimer",source)
		
			xPlayer.removeInventoryItem("coke10g",1)
			xPlayer.removeInventoryItem("drugbags",10)
		
			TriggerClientEvent("Coke10gToCoke1g",source)
			Citizen.Wait(20000)
		
			xPlayer.addInventoryItem("coke1g",maxCoke1gOutput)
		else
			TriggerClientEvent("esx:showNotification",source,string.format("~r~Vous êtes déjà engagé dans une action.",GetTimeForConvert(GetPlayerIdentifier(source))))
		end
	else
		TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de couteau.")
	end
	else
		TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez plus assez de place.")
	end
end)


ESX.RegisterUsableItem('meth10g', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local meth = xPlayer.getInventoryItem("meth10g").count >= 1
	local scale = xPlayer.getInventoryItem("hqscale").count >= 1
	local bags = xPlayer.getInventoryItem("drugbags").count >= 10
	
	if not bags or not meth then
		if not bags then
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de pochtars.")
		else
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de Meth (10G)")
		end
		return
	end
	
	local maxMeth1gOutput = 10
		
	if not scale then
		maxMeth1gOutput = 10
	end
	
	if xPlayer.getInventoryItem("meth1g").count <= 1000 or (not scale and xPlayer.getInventoryItem("meth1g").count <= 1004) then
		if xPlayer.hasWeapon('WEAPON_KNIFE') then 
		if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
			TriggerEvent("esx_newDrugs:startConvertTimer",source)
		
			xPlayer.removeInventoryItem("meth10g",1)
			xPlayer.removeInventoryItem("drugbags",10)
		
			TriggerClientEvent("Meth10gToMeth1g",source)
			Citizen.Wait(20000)
		
			xPlayer.addInventoryItem("meth1g",maxMeth1gOutput)
		else
			TriggerClientEvent("esx:showNotification",source,string.format("~r~Vous êtes déjà engagé dans une action.",GetTimeForConvert(GetPlayerIdentifier(source))))
		end
	else
		TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de couteau.")
	end
	else
		TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez plus assez de place.")
	end
end)

ESX.RegisterUsableItem('weed20g', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local weedBag = xPlayer.getInventoryItem("weed20g").count >= 1
	local scale = xPlayer.getInventoryItem("hqscale").count >= 1
	local bags = xPlayer.getInventoryItem("drugbags").count >= 5
	
	if not bags or not weedBag then
		if not bags then
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de pochtars.")
		else
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de Weed (20G)")
		end
		return
	end
	
	local maxWeedBagOutput = 5
		
	if not scale then
		maxWeedBagOutput = 5
	end
	
	if xPlayer.getInventoryItem("weed4g").count <= 195 or (not scale and xPlayer.getInventoryItem("weed4g").count <= 196) then
		if xPlayer.hasWeapon('WEAPON_KNIFE') then 
		if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
			TriggerEvent("esx_newDrugs:startConvertTimer",source)
		
			xPlayer.removeInventoryItem("weed20g",1)
			xPlayer.removeInventoryItem("drugbags",5)
		
			TriggerClientEvent("Weed20gToWeed4g",source)
			Citizen.Wait(20000)
		
			xPlayer.addInventoryItem("weed4g",maxWeedBagOutput)
		else
			TriggerClientEvent("esx:showNotification",source,string.format("~r~Vous êtes déjà engagé dans une action.",GetTimeForConvert(GetPlayerIdentifier(source))))
		end
	else
		TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de couteau.")
	end
	else
		TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez plus assez de place.")
	end
end)

-- WEED (4G) >> JOINT (2G)
ESX.RegisterUsableItem('weed4g', function(source)
		
	local xPlayer = ESX.GetPlayerFromId(source)
	local weed = xPlayer.getInventoryItem("weed4g").count >= 1
	local paper = xPlayer.getInventoryItem("rolpaper").count >= 2
	
	if not paper or not weed then
		if not paper then
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de papier a rouler.")
		else
			TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez pas de Weed (4G)")
		end
		return
	end
	
	if xPlayer.getInventoryItem("joint2g").count <= 48 then
		if not CheckedStartedConvert(GetPlayerIdentifier(source)) then
			TriggerEvent("esx_newDrugs:startConvertTimer",source)
		
			xPlayer.removeInventoryItem("weed4g",1)
			xPlayer.removeInventoryItem("rolpaper",2)
		
			TriggerClientEvent("Weed4gToJoint2g",source)
			Citizen.Wait(10000)
		
			xPlayer.addInventoryItem("joint2g",2)
		else
			TriggerClientEvent("esx:showNotification",source,string.format("~r~Vous êtes déjà engagé dans une action.",GetTimeForConvert(GetPlayerIdentifier(source))))
		end
	else
		TriggerClientEvent("esx:showNotification",source,"~r~Vous n'avez plus assez de place.")
	end
end)

function RemoveStarted(source)
	for k,v in pairs(PlayerHackTimer) do
		if v.started == source then
			table.remove(PlayerHackTimer,k)
		end
	end
end

function GetTimeForMission(source)
	for k,v in pairs(PlayerHackTimer) do
		if v.started == source then
			return math.ceil(v.time/60000)
		end
	end
end

function CheckedStarted(source)
	for k,v in pairs(PlayerHackTimer) do
		if v.started == source then
			return true
		end
	end
	return false
end


function RemoveStartedDrugs(source)
	for k,v in pairs(PlayerDrugsTimer) do
		if v.startedDrugs == source then
			table.remove(PlayerDrugsTimer,k)
		end
	end
end

function GetTimeForDrugs(source)
	for k,v in pairs(PlayerDrugsTimer) do
		if v.startedDrugs == source then
			return math.ceil(v.timeDrugs/1000)
		end
	end
end

function CheckedStartedDrugs(source)
	for k,v in pairs(PlayerDrugsTimer) do
		if v.startedDrugs == source then
			return true
		end
	end
	return false
end

function RemoveStartedConvert(source)
	for k,v in pairs(PlayerConvertTimer) do
		if v.startedConvert == source then
			table.remove(PlayerConvertTimer,k)
		end
	end
end

function GetTimeForConvert(source)
	for k,v in pairs(PlayerConvertTimer) do
		if v.startedConvert == source then
			return math.ceil(v.timeConvert/1000)
		end
	end
end

function CheckedStartedConvert(source)
	for k,v in pairs(PlayerConvertTimer) do
		if v.startedConvert == source then
			return true
		end
	end
	return false
end


local soldAmount = {}

RegisterServerEvent("esx_newDrugs:sellDrugs")
AddEventHandler("esx_newDrugs:sellDrugs", function()
	if CopsConnected < 2 then
		TriggerClientEvent('esx:DrawMissionText', source, "~r~Action impossible. (Police)", 3500)
		return
	end

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local weed = xPlayer.getInventoryItem('weed4g').count
	local meth = xPlayer.getInventoryItem('meth1g').count
	local coke = xPlayer.getInventoryItem('coke1g').count
	local drugamount = 0
	local price = 0
	local drugType = nil
	
	if weed > 0 then
		drugType = 'weed4g'
		if weed == 1 then
			drugamount = 1
		elseif weed == 2 then
			drugamount = math.random(1,1)
		elseif weed == 3 then	
			drugamount = math.random(1,1)
		elseif weed >= 4 then	
			drugamount = math.random(1,1)
		elseif weed >= 5 then	
			drugamount = math.random(1,1)
		elseif weed >= 6 then	
			drugamount = math.random(1,1)
		end
		
	elseif meth > 0 then
		drugType = 'meth1g'
		if meth == 1 then
			drugamount = 1
		elseif meth == 2 then
			drugamount = math.random(1,1)
		elseif meth >= 3 then	
			drugamount = math.random(1,1)
		end
		
	elseif coke > 0 then
		drugType = 'coke1g'
		if coke == 1 then
			drugamount = 1
		elseif coke == 2 then
			drugamount = math.random(1,1)
		elseif coke >= 3 then	
			drugamount = math.random(1,1)
		end
	
	else
		TriggerClientEvent('esx:DrawMissionText', _source, "~r~Vous n'avez plus assez de marchandise.", 5000)
		return
	end
	
	if drugType=='weed4g' then
		price = math.random(50,80) * drugamount
	elseif drugType=='meth1g' then
		price = math.random(108,140) * drugamount
	elseif drugType=='coke1g' then
		price = math.random(73,115) * drugamount
	end
	
	if drugType ~= nil then
		xPlayer.removeInventoryItem(drugType, drugamount)
	end
	
	AddToSoldAmount(xPlayer.getIdentifier(),drugamount)
	xPlayer.addAccountMoney('black_money', price)
	if drugType=='weed4g' then
		TriggerClientEvent('esx:DrawMissionText', _source, "~b~Client: ~s~Merci beaucoup mec, à plus tard ~g~+ " .. price .."$", 3000)
	elseif drugType=='meth1g' then
		TriggerClientEvent('esx:DrawMissionText', _source, "~b~Client: ~s~Merci beaucoup mec, à plus tard ~g~+ " .. price .."$", 3000)
	elseif drugType=='coke1g' then
		TriggerClientEvent('esx:DrawMissionText', _source, "~b~Client: ~s~Merci beaucoup mec, à plus tard ~g~+ " .. price .."$", 3000)
	end
end)

RegisterServerEvent("esx_newDrugs:canSellDrugs")
AddEventHandler("esx_newDrugs:canSellDrugs", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		local soldAmount = (xPlayer.getInventoryItem("coke1g").count > 0 or xPlayer.getInventoryItem("meth1g").count > 0 or xPlayer.getInventoryItem("weed4g").count > 0) and CheckSoldAmount(xPlayer.getIdentifier()) < Config.maxCap
		TriggerClientEvent("esx_newDrugs:canSellDrugs",source,soldAmount)
	end
end)

RegisterServerEvent("esx_drugSale:canSellDrugs")
AddEventHandler("esx_drugSale:canSellDrugs", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		local sell = (xPlayer.getInventoryItem("coke1g").count > 0 or xPlayer.getInventoryItem("meth1g").count > 0 or xPlayer.getInventoryItem("weed4g").count > 0) and CheckSellAmount(xPlayer.getIdentifier()) < 150
		TriggerClientEvent("esx_drugSale:canSellDrugs",source,sell)
	end
end)

function AddToSoldAmount(source,amount)
	for k,v in pairs(soldAmount) do
		if v.id == source then
			v.amount = v.amount + amount
			return
		end
	end
end

function CheckSoldAmount(source)
	for k,v in pairs(soldAmount) do
		if v.id == source then
			return v.amount
			
		end
	end
	table.insert(soldAmount,{id = source, amount = 0})
	return CheckSoldAmount(source)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------POUSSE WEED-------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------POUSSE WEED-------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------POUSSE WEED-------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('nwx_weed:DeleteWeed')
AddEventHandler('nwx_weed:DeleteWeed', function(x)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('nwx_weed:DeleteWeed', _source, x)

    MySQL.Async.execute(
        'DELETE FROM position_agricultures WHERE x = @x',
        {
            ['@x'] = x
        },
        function()
        end
    )
end)


RegisterServerEvent('nwx_weed:CreateWeed')
AddEventHandler('nwx_weed:CreateWeed', function(x, y, z,id)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    MySQL.Async.execute(
        'INSERT INTO position_agricultures (id, identifier, name, x, y, z) VALUES (@id, @identifier, @name, @x, @y, @z)',
        {
        ['@id'] = id,
        ['@identifier'] = xPlayer.identifier,
        ['@name'] = 'Weed',
        ['@x'] = x,
        ['@y'] = y,
        ['@z'] = z
        },
        function(result)
        end
     ) 
end)

ESX.RegisterServerCallback('nwx_weed:CheckWeed', function(source, cb)

    MySQL.Async.fetchAll(
        'SELECT * FROM position_agricultures',
        {},
        function(result)
            local data = {}
            for i=1, #result, 1 do
                table.insert(data, {
                    identifier = result[i].identifier,
                    name = result[i].name,
                    x = result[i].x,
                    y = result[i].y,
                    z = result[i].z,
                    percent = result[i].percent 
                })
            end
            cb(data)
        end
    ) 
end)

RegisterServerEvent('nwx_weed:GiveWeed')
AddEventHandler('nwx_weed:GiveWeed', function(x)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local random = math.random(75,90)
    local randomweed = math.random(0,100)
    local randomgraineweed = math.random(1,5)

    xPlayer.addInventoryItem('chanvre', random)

    if randomweed <= 2 then
        xPlayer.addInventoryItem('weed_seed', randomgraineweed)
    end

    TriggerClientEvent('nwx_weed:DeleteWeed', _source, x)

    MySQL.Async.execute(
        'DELETE FROM position_agricultures WHERE x = @x',
        {
            ['@x'] = x
        },
        function()
        end
    )
end)

ESX.RegisterUsableItem('weed_seed', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local pot = xPlayer.getInventoryItem('pot').count

    if pot <= 0 then
        --TriggerClientEvent('esx:showNotification', source,'~r~Vous devez avoir un ~b~Pot~s~ !')
        TriggerClientEvent('esx:DrawMissionText', source,"~r~Vous devez avoir un pot.", 3000)
    else 
        xPlayer.removeInventoryItem('weed_seed', 1)
        xPlayer.removeInventoryItem('pot', 1)
        TriggerClientEvent('nwx_weed:PlantationWeed', source)
        --print("Graine de Weed Plante par: " ..xPlayer.name)
        --TriggerClientEvent('esx:showNotification', source,'~g~Plantation~s~ en ~b~cours~s~.') 
        --TriggerClientEvent('esx:DrawMissionText', source,"~g~Plantation en cours...", 5000)  
    end
end)

ESX.RegisterUsableItem('truele', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('nwx_weed:UseTruelle', source)
	--print("Truelle utilise par: " ..xPlayer.name)
end)

ESX.RegisterUsableItem('pelle', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('nwx_weed:UsePelle', source)
    --TriggerClientEvent('esx:showNotification', source,'~r~Destruction~s~ du plant en ~b~cours~s~.')       
    TriggerClientEvent('esx:DrawMissionText', source,"~r~Destruction de la plante en cours...", 5000)    
	--print("Pelle utilise par: " ..xPlayer.name)
end)

RegisterServerEvent('nwx_weed:BuySeedWeed')
AddEventHandler('nwx_weed:BuySeedWeed', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeMoney(40)
    xPlayer.addInventoryItem('weed_seed', 1)

end)

RegisterServerEvent('nwx_weed:BuyTruelle')
AddEventHandler('nwx_weed:BuyTruelle', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeMoney(100)
    xPlayer.addInventoryItem('truele', 1)

end)

RegisterServerEvent('nwx_weed:BuyPot')
AddEventHandler('nwx_weed:BuyPot', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeMoney(65)
    xPlayer.addInventoryItem('pot', 1)

end)

function UptadePourcent()
	local xPlayers 	= ESX.GetPlayers()
	local TimeUpdate = 28 -- En minutes
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		MySQL.Async.execute(
			'UPDATE position_agricultures SET percent = percent + 1.0',
		 	{
		 	}
		)
	end
    SetTimeout(TimeUpdate * 60 * 1000, UptadePourcent)
    --print('Le pourcentage des plantations de cannabis vient d\'augmenter')
end
UptadePourcent()


--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------ESX DRUGS-------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------ESX DRUGS-------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------ESX DRUGS-------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------


local CopsConnected       	   = 0
local PlayersHarvestingCoke    = {}
local PlayersTransformingCoke  = {}
local PlayersSellingCoke       = {}
local PlayersHarvestingMeth    = {}
local PlayersTransformingMeth  = {}
local PlayersSellingMeth       = {}
local PlayersHarvestingAcide   = {}
local PlayersHarvestingWeed    = {}
local PlayersTransformingWeed  = {}
local PlayersSellingWeed       = {}
local PlayersHarvestingTerre   = {}
local PlayersHarvestingAntigel = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()
	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()

--coke
local function HarvestCoke(source)
	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, "~r~Action impossible. (Police)", CopsConnected, Config.RequiredCopsCoke)
		return
	end

	SetTimeout(3000, function()
		if PlayersHarvestingCoke[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local acidesulQuantity = xPlayer.getInventoryItem('acidesulfurique').count
			local coke = xPlayer.getInventoryItem('feuilledecoca')

			if coke.limit ~= -1 and coke.count >= coke.limit then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous ne pouvez plus fabriquer de feuilles.")
			elseif acidesulQuantity < 2 then 
				TriggerClientEvent('esx:showNotification', source, "~r~Vous n\'avez pas assez ~s~d\'acide sulfurique.")
			else
				xPlayer.removeInventoryItem('acidesulfurique', 2)
				xPlayer.addInventoryItem('feuilledecoca', 1)
				HarvestCoke(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestCoke')
AddEventHandler('esx_drugs:startHarvestCoke', function()
	local _source = source

	if not PlayersHarvestingCoke[_source] then
		PlayersHarvestingCoke[_source] = true

		TriggerClientEvent('esx:showNotification', _source, "~g~Ramassage en cours~s~...")
		HarvestCoke(_source)
	else
		print(('esx_drugs: %s attempted to exploit the zone!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:stopHarvestCoke')
AddEventHandler('esx_drugs:stopHarvestCoke', function()
	local _source = source

	PlayersHarvestingCoke[_source] = false
end)

local function TransformCoke(source)
	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, "~r~Action impossible. (Police)", CopsConnected, Config.RequiredCopsCoke)
		return
	end

	SetTimeout(60000, function()
		if PlayersTransformingCoke[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local cokeQuantity = xPlayer.getInventoryItem('feuilledecoca').count
			local pooch = xPlayer.getInventoryItem('cokebrick')

			if pooch.limit ~= -1 and pooch.count >= pooch.limit then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous avez trop de bloques.")
			elseif cokeQuantity < 100 then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous n\'avez pas assez de feuilles de coca à traiter")
			else
				xPlayer.removeInventoryItem('feuilledecoca', 100)
				xPlayer.addInventoryItem('cokebrick', 1)

				TransformCoke(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformCoke')
AddEventHandler('esx_drugs:startTransformCoke', function()
	local _source = source

	if not PlayersTransformingCoke[_source] then
		PlayersTransformingCoke[_source] = true

		TriggerClientEvent('esx:showNotification', _source, "~g~Traitement en cours~s~...")
		TransformCoke(_source)
	else
		print(('esx_drugs: %s attempted to exploit the zone!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:stopTransformCoke')
AddEventHandler('esx_drugs:stopTransformCoke', function()
	local _source = source

	PlayersTransformingCoke[_source] = false
end)

local function SellCoke(source)
	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, "~r~Action impossible. (Police)", CopsConnected, Config.RequiredCopsCoke)
		return
	end

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingCoke[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local poochQuantity = xPlayer.getInventoryItem('cokebrick').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de pochons à ~r~vendre~s~")
			else
				xPlayer.removeInventoryItem('cokebrick', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 0)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de coke~s~")
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 0)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de coke~s~")
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 380)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de coke~s~")
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de coke~s~")
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 425)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de coke~s~")
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 450)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de coke~s~")
				end

				SellCoke(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startSellCoke')
AddEventHandler('esx_drugs:startSellCoke', function()
	local _source = source

	if not PlayersSellingCoke[_source] then
		PlayersSellingCoke[_source] = true

		TriggerClientEvent('esx:showNotification', _source, "~g~Vente en cours~s~...")
		SellCoke(_source)
	else
		print(('esx_drugs: %s attempted to exploit the zone!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:stopSellCoke')
AddEventHandler('esx_drugs:stopSellCoke', function()
	local _source = source

	PlayersSellingCoke[_source] = false
end)

--meth
local function HarvestMeth(source)
	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, "~r~Action impossible. (Police)", CopsConnected, Config.RequiredCopsCoke)
		return
	end
	
	SetTimeout(3000, function()
		if PlayersHarvestingMeth[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local antigelQuantity = xPlayer.getInventoryItem('antigel').count
			local meth = xPlayer.getInventoryItem('crystaldemeth')

			if meth.limit ~= -1 and meth.count >= meth.limit then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous avez trop de cristaux de meth.")
			elseif antigelQuantity < 2 then 
				TriggerClientEvent('esx:showNotification', source, "~r~Vous n\'avez pas assez ~s~d\'antigel.")
			else
				xPlayer.removeInventoryItem('antigel', 2)
				xPlayer.addInventoryItem('crystaldemeth', 1)
				HarvestMeth(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestMeth')
AddEventHandler('esx_drugs:startHarvestMeth', function()
	local _source = source

	if not PlayersHarvestingMeth[_source] then
		PlayersHarvestingMeth[_source] = true

		TriggerClientEvent('esx:showNotification', _source, "~g~Ramassage en cours~s~...")
		HarvestMeth(_source)
	else
		print(('esx_drugs: %s attempted to exploit the zone!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:stopHarvestMeth')
AddEventHandler('esx_drugs:stopHarvestMeth', function()
	local _source = source

	PlayersHarvestingMeth[_source] = false
end)

local function TransformMeth(source)
	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, "~r~Action impossible. (Police)", CopsConnected, Config.RequiredCopsCoke)
		return
	end

	SetTimeout(60000, function()
		if PlayersTransformingMeth[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local methQuantity = xPlayer.getInventoryItem('crystaldemeth').count
			local pooch = xPlayer.getInventoryItem('methbrick')

			if pooch.limit ~= -1 and pooch.count >= pooch.limit then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous avez trop de bloques.")
			elseif methQuantity < 100 then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous n\'avez pas assez de cristal de meth à conditionner")
			else
				xPlayer.removeInventoryItem('crystaldemeth', 100)
				xPlayer.addInventoryItem('methbrick', 1)

				TransformMeth(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformMeth')
AddEventHandler('esx_drugs:startTransformMeth', function()
	local _source = source

	if not PlayersTransformingMeth[_source] then
		PlayersTransformingMeth[_source] = true

		TriggerClientEvent('esx:showNotification', _source, "~g~Traitement en cours~s~...")
		TransformMeth(_source)
	else
		print(('esx_drugs: %s attempted to exploit the zone!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:stopTransformMeth')
AddEventHandler('esx_drugs:stopTransformMeth', function()
	local _source = source

	PlayersTransformingMeth[_source] = false
end)

local function SellMeth(source)
	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, "~r~Action impossible. (Police)", CopsConnected, Config.RequiredCopsCoke)
		return
	end

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingMeth[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local poochQuantity = xPlayer.getInventoryItem('methbrick').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de pochons à ~r~vendre~s~")
			else
				xPlayer.removeInventoryItem('methbrick', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 0)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de meth~s~")
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 0)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de meth~s~")
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 0)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de meth~s~")
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 0)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de meth~s~")
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de meth~s~")
				elseif CopsConnected == 5 then
					xPlayer.addAccountMoney('black_money', 545)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de meth~s~")
				elseif CopsConnected >= 6 then
					xPlayer.addAccountMoney('black_money', 565)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de meth~s~")
				end

				SellMeth(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startSellMeth')
AddEventHandler('esx_drugs:startSellMeth', function()
	local _source = source

	if not PlayersSellingMeth[_source] then
		PlayersSellingMeth[_source] = true

		TriggerClientEvent('esx:showNotification', _source, "~g~Vente en cours~s~...")
		SellMeth(_source)
	else
		print(('esx_drugs: %s attempted to exploit the zone!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:stopSellMeth')
AddEventHandler('esx_drugs:stopSellMeth', function()
	local _source = source

	PlayersSellingMeth[_source] = false
end)

--weed
local function HarvestWeed(source)
	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, "~r~Action impossible. (Police)", CopsConnected, Config.RequiredCopsCoke)
		return
	end

	SetTimeout(3000, function()
		if PlayersHarvestingWeed[source] then
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			local terreQuantity = xPlayer.getInventoryItem('terre').count
			local weed = xPlayer.getInventoryItem('chanvre')

			if weed.limit ~= -1 and weed.count >= weed.limit then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous avez trop de chanvre.")
			elseif terreQuantity < 2 then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous n\'avez pas assez de Terre")
			else
				xPlayer.removeInventoryItem('terre', 2)
				xPlayer.addInventoryItem('chanvre', 1)
				HarvestWeed(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestWeed')
AddEventHandler('esx_drugs:startHarvestWeed', function()
	local _source = source

	if not PlayersHarvestingWeed[_source] then
		PlayersHarvestingWeed[_source] = true

		TriggerClientEvent('esx:showNotification', _source, "~g~Ramassage en cours~s~...")
		HarvestWeed(_source)
	else
		print(('esx_drugs: %s attempted to exploit the zone!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:stopHarvestWeed')
AddEventHandler('esx_drugs:stopHarvestWeed', function()
	local _source = source

	PlayersHarvestingWeed[_source] = false
end)

local function TransformWeed(source)
	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, "~r~Action impossible. (Police)", CopsConnected, Config.RequiredCopsCoke)
		return
	end

	SetTimeout(60000, function()
		if PlayersTransformingWeed[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local weedQuantity = xPlayer.getInventoryItem('chanvre').count
			local pooch = xPlayer.getInventoryItem('weedbrick')

			if pooch.limit ~= -1 and pooch.count >= pooch.limit then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous avez trop de bloques.")
			elseif weedQuantity < 100 then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous n\'avez pas assez de chanvre.")
			else
				xPlayer.removeInventoryItem('chanvre', 100)
				xPlayer.addInventoryItem('weedbrick', 1)

				TransformWeed(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformWeed')
AddEventHandler('esx_drugs:startTransformWeed', function()
	local _source = source

	if not PlayersTransformingWeed[_source] then
		PlayersTransformingWeed[_source] = true

		TriggerClientEvent('esx:showNotification', _source, "~g~Traitement en cours~s~...")
		TransformWeed(_source)
	else
		print(('esx_drugs: %s attempted to exploit the zone!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:stopTransformWeed')
AddEventHandler('esx_drugs:stopTransformWeed', function()
	local _source = source

	PlayersTransformingWeed[_source] = false
end)

local function SellWeed(source)
	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, "~r~Action impossible. (Police)", CopsConnected, Config.RequiredCopsCoke)
		return
	end

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingWeed[source] then
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			local poochQuantity = xPlayer.getInventoryItem('weedbrick').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de pochons à ~r~vendre~s")
			else
				xPlayer.removeInventoryItem('weedbrick', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 0)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de weed~s~")
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 250)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de weed~s~")
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 300)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de weed~s~")
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 350)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de weed~s~")
				elseif CopsConnected >= 4 then
					xPlayer.addAccountMoney('black_money', 380)
					TriggerClientEvent('esx:showNotification', source, "Vous avez vendu ~g~x1 Pochon de weed~s~")
				end

				SellWeed(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startSellWeed')
AddEventHandler('esx_drugs:startSellWeed', function()
	local _source = source

	if not PlayersSellingWeed[_source] then
		PlayersSellingWeed[_source] = true

		TriggerClientEvent('esx:showNotification', _source, "~g~Vente en cours~s~...")
		SellWeed(_source)
	else
		print(('esx_drugs: %s attempted to exploit the zone!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:stopSellWeed')
AddEventHandler('esx_drugs:stopSellWeed', function()
	local _source = source

	PlayersSellingWeed[_source] = false
end)

local function HarvestTerre(source)
	if CopsConnected < Config.RequiredCopsTerre then
		TriggerClientEvent('esx:showNotification', source, "~r~Action impossible. (Police)", CopsConnected, Config.RequiredCopsTerre)
		return
	end

	SetTimeout(2000, function()
		if PlayersHarvestingTerre[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local terre = xPlayer.getInventoryItem('terre')

			if terre.limit ~= -1 and terre.count >= terre.limit then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous ne pouvez ramasser de terre.")
			else
				xPlayer.addInventoryItem('terre', 1)
				HarvestTerre(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestTerre')
AddEventHandler('esx_drugs:startHarvestTerre', function()
	local _source = source

	if not PlayersHarvestingTerre[_source] then
		PlayersHarvestingTerre[_source] = true

		TriggerClientEvent('esx:showNotification', _source, "~g~Ramassage en cours~s~...")
		HarvestTerre(_source)
	else
		print(('esx_drugs: %s attempted to exploit the zone!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:stopHarvestTerre')
AddEventHandler('esx_drugs:stopHarvestTerre', function()
	local _source = source

	PlayersHarvestingTerre[_source] = false
end)

local function HarvestAcide(source)
	if CopsConnected < Config.RequiredCopsTerre then
		TriggerClientEvent('esx:showNotification', source, "~r~Action impossible. (Police)", CopsConnected, Config.RequiredCopsTerre)
		return
	end

	SetTimeout(2000, function()
		if PlayersHarvestingAcide[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local acide = xPlayer.getInventoryItem('acidesulfurique')

			if acide.limit ~= -1 and acide.count >= acide.limit then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous ne pouvez ramasser d'acide.")
			else
				xPlayer.addInventoryItem('acidesulfurique', 1)
				HarvestAcide(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestAcide')
AddEventHandler('esx_drugs:startHarvestAcide', function()
	local _source = source

	if not PlayersHarvestingAcide[_source] then
		PlayersHarvestingAcide[_source] = true

		TriggerClientEvent('esx:showNotification', _source, "~g~Ramassage en cours~s~...")
		HarvestAcide(_source)
	else
		print(('esx_drugs: %s attempted to exploit the zone!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:stopHarvestAcide')
AddEventHandler('esx_drugs:stopHarvestAcide', function()
	local _source = source

	PlayersHarvestingAcide[_source] = false
end)


local function HarvestAntigel(source)
	if CopsConnected < Config.RequiredCopsTerre then
		TriggerClientEvent('esx:showNotification', source, "~r~Action impossible. (Police)", CopsConnected, Config.RequiredCopsTerre)
		return
	end

	SetTimeout(2000, function()
		if PlayersHarvestingAntigel[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local antigel = xPlayer.getInventoryItem('antigel')

			if antigel.limit ~= -1 and antigel.count >= antigel.limit then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous ne pouvez ramasser d'antigel.")
			else
				xPlayer.addInventoryItem('antigel', 1)
				HarvestAntigel(source)
			end
		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestAntigel')
AddEventHandler('esx_drugs:startHarvestAntigel', function()
	local _source = source

	if not PlayersHarvestingAntigel[_source] then
		PlayersHarvestingAntigel[_source] = true

		TriggerClientEvent('esx:showNotification', _source, "~g~Ramassage en cours~s~...")
		HarvestAntigel(_source)
	else
		print(('esx_drugs: %s attempted to exploit the zone!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:stopHarvestAntigel')
AddEventHandler('esx_drugs:stopHarvestAntigel', function()
	local _source = source

	PlayersHarvestingAntigel[_source] = false
end)

RegisterServerEvent('esx_drugs:GetUserInventory')
AddEventHandler('esx_drugs:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_drugs:ReturnInventory',
		_source,
		xPlayer.getInventoryItem('feuilledecoca').count,
		xPlayer.getInventoryItem('cokebrick').count,
		xPlayer.getInventoryItem('acidesulfurique').count,
		xPlayer.getInventoryItem('antigel').count,
		xPlayer.getInventoryItem('pelle').count,
		xPlayer.getInventoryItem('terre').count,
		xPlayer.getInventoryItem('crystaldemeth').count,
		xPlayer.getInventoryItem('methbrick').count,
		xPlayer.getInventoryItem('chanvre').count,
		xPlayer.getInventoryItem('weedbrick').count,
		xPlayer.job.name,
		currentZone
	)
end)