ESX = nil
cooldownlist = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local potrzebniPolicjanci = 2
local czastimer = 600 * 1000    
local gotowkaA = 4230		
local gotowkaB = 8123 				
--local KosztAktywacji = 2500 		
-----------------------------------
local MisjaAktywna = 0
local copsConnected = 0
local deadPeds = {}
local rob = false
local robbers = {}
PlayersCrafting    = {}
local CopsConnected  = 0


RegisterServerEvent('napadtransport:akceptujto')
AddEventHandler('napadtransport:akceptujto', function()
	local copsOnDuty = 0
	local Players = ESX.GetPlayers()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	--local accountMoney = 0
	--accountMoney = xPlayer.getAccounts('money')
if MisjaAktywna == 0 then
	--if accountMoney < KosztAktywacji then
	--TriggerClientEvent('esx:showNotification', source, '~r~Vous avez besoin $2,500 à la banque pour accepter la mission.')
	--else
	for i = 1, #Players do
        local xPlayer = ESX.GetPlayerFromId(Players[i])
        if xPlayer["job"]["name"] == "police" or xPlayer["job"]["name"] == "sheriff" then
            copsOnDuty = copsOnDuty + 1
        --end
    end
	if copsOnDuty >= potrzebniPolicjanci then
		TriggerClientEvent("napadtransport:Pozwolwykonac", _source)
		xPlayer.removeMoney(1000)
		OdpalTimer()
	else
		--TriggerClientEvent('esx:showNotification', source, '~r~Je n\'ai pas de mission pour l\'instant.')
        TriggerClientEvent('esx:DrawMissionText', source, "~r~Je n'ai pas de mission pour l'instant.", 5000)
    end
	end
else
--TriggerClientEvent('esx:showNotification', source, '~r~Je viens de donner une mission à quelqu\'un.')
TriggerClientEvent('esx:DrawMissionText', source, "~r~Je viens de donner une mission à quelqu'un.", 5000)
end
end)

function OdpalTimer()
MisjaAktywna = 1
Wait(czastimer)
MisjaAktywna = 0
end

RegisterServerEvent('alertgofaste:infopolice')
AddEventHandler('alertgofaste:infopolice', function(x, y, z) 
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
		TriggerClientEvent('alertgofaste:infopolice', -1, x, y, z)
	end
end)

RegisterServerEvent('napadtransport:brinks')
AddEventHandler('napadtransport:brinks', function(x, y, z) 
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
		TriggerClientEvent('napadtransport:infodlalspd', -1, x, y, z)
	end
end)

RegisterServerEvent('napadtransport:graczZrobilnapad')
AddEventHandler('napadtransport:graczZrobilnapad', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local LosujSiano = math.random(gotowkaA,gotowkaB)
xPlayer.addAccountMoney('black_money', LosujSiano)
--TriggerClientEvent('esx:showNotification', source, 'Tu as récupéré ~g~'..LosujSiano..' $~w~')
TriggerClientEvent('esx:DrawMissionText', source, "Tu as récupéré ~r~"..LosujSiano.." $~w~", 8000)
Wait(2500)
end)










RegisterServerEvent('tost:zgarnijsiano')
AddEventHandler('tost:zgarnijsiano', function()
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local Ilosc = math.random(3500,7500) 
	TriggerClientEvent('esx:showNotification', source, 'Vous avez gagné ~g~'..Ilosc..'$')
    xPlayer.addMoney(Ilosc)
	Wait(500)
end)


RegisterServerEvent('tost:zawiadompsy')
AddEventHandler('tost:zawiadompsy', function(x, y, z) 
    TriggerClientEvent('tost:infodlalspd', -1, x, y, z)
end)









function CountCops()

    local xPlayers = ESX.GetPlayers()
    copsConnected = 0

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff'then
            copsConnected = copsConnected + 1
        end
    end
    TriggerClientEvent('esx_mugging:copsConnected', -1, copsConnected)

    SetTimeout(60000, CountCops)

end
CountCops()

RegisterServerEvent('esx_mugging:giveMoney')
AddEventHandler('esx_mugging:giveMoney', function()
    local _source = source
    local player = ESX.GetPlayerFromId(_source)
    local amount = math.random(Config.MinMoney, Config.MaxMoney)
    if Config.DirtyMoney then
        --print('trying to add dirty money')
        player.addAccountMoney('black_money', amount)
    else
        --print('tring to add cash')
        player.addMoney(amount)
    end
    TriggerClientEvent("esx:showNotification", source, ("Tu as Dépouillé $%s"):format(amount))
end)

RegisterServerEvent('esx_mugging:giveItems')
AddEventHandler('esx_mugging:giveItems', function(itemName)
    local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
        xPlayer.addInventoryItem(itemName, 1)

end)

RegisterServerEvent('esx_mugging:muggingAlert')
AddEventHandler('esx_mugging:muggingAlert', function(street1, street2, sex, coords)
    if Config.GCPhone  then
		--TriggerClientEvent("muggingNotify", -1, "Agression signalée par "..sex.." prêt "..street1.." et de "..street2, coords)
		TriggerClientEvent('esx:showAdvancedNotification', -1, "Central", "~b~Appel d'urgence: 911", "~b~Identité: ~s~"..sex.."\n~b~Localisation: ~s~"..street1.."/"..coords.."\n~b~Infos: ~s~Agression signalée", 'CHAR_CALL911', 7)
    else
	    TriggerClientEvent('esx:showAdvancedNotification', -1, "Central", "~b~Appel d'urgence: 911", "~b~Identité: ~s~"..sex.."\n~b~Localisation: ~s~"..street1.."/"..coords.."\n~b~Infos: ~s~Agression signalée", 'CHAR_CALL911', 7)
    end
end)


RegisterServerEvent('esx_mugging:muggingAlertS1')
AddEventHandler('esx_mugging:muggingAlertS1', function(street1, sex, coords)
    if Config.GCPhone  then
        TriggerClientEvent('esx:showAdvancedNotification', -1, "Central", "~b~Appel d'urgence: 911", "~b~Identité: ~s~"..sex.."\n~b~Localisation: ~s~"..street1.."/"..coords.."\n~b~Infos: ~s~Agression signalée", 'CHAR_CALL911', 7)
    else
	    TriggerClientEvent('esx:showAdvancedNotification', -1, "Central", "~b~Appel d'urgence: 911", "~b~Identité: ~s~"..sex.."\n~b~Localisation: ~s~"..street1.."/"..coords.."\n~b~Infos: ~s~Agression signalée", 'CHAR_CALL911', 7)
    end
end)
RegisterServerEvent('esx_mugging:muggingAlertS2')
AddEventHandler('esx_mugging:muggingAlertS2', function(street1, sex, coords)
    if Config.GCPhone then
        TriggerClientEvent('esx:showAdvancedNotification', -1, "Central", "~b~Appel d'urgence: 911", "~b~Identité: ~s~"..sex.."\n~b~Localisation: ~s~"..street1.."/"..coords.."\n~b~Infos: ~s~Agression signalée", 'CHAR_CALL911', 7)
    else
        TriggerClientEvent('esx:showAdvancedNotification', -1, "Central", "~b~Appel d'urgence: 911", "~b~Identité: ~s~"..sex.."\n~b~Localisation: ~s~"..street1.."/"..coords.."\n~b~Infos: ~s~Agression signalée", 'CHAR_CALL911', 7)
    end
end)

RegisterServerEvent('esx_mugging:muggingPos')
AddEventHandler('esx_mugging:muggingPos', function(gx, gy, gz)
	TriggerClientEvent('esx_mugging:muggingPos', -1, gx, gy, gz)
end)







RegisterServerEvent('loffe_robbery:pedDead')
AddEventHandler('loffe_robbery:pedDead', function(store)
    if not deadPeds[store] then
        deadPeds[store] = 'deadlol'
        TriggerClientEvent('loffe_robbery:onPedDeath', -1, store)
        local second = 1000
        local minute = 60 * second
        local hour = 60 * minute
        local cooldown = Config.Shops[store].cooldown
        local wait = cooldown.hour * hour + cooldown.minute * minute + cooldown.second * second
        Wait(wait)
        if not Config.Shops[store].robbed then
            for k, v in pairs(deadPeds) do if k == store then table.remove(deadPeds, k) end end
            TriggerClientEvent('loffe_robbery:resetStore', -1, store)
        end
    end
end)

RegisterServerEvent('loffe_robbery:handsUp')
AddEventHandler('loffe_robbery:handsUp', function(store)
    TriggerClientEvent('loffe_robbery:handsUp', -1, store)
end)

RegisterServerEvent('loffe_robbery:pickUp')
AddEventHandler('loffe_robbery:pickUp', function(store)
    local xPlayer = ESX.GetPlayerFromId(source)
    local randomAmount = math.random(950, 2000)
    xPlayer.addMoney(randomAmount)
	--TriggerClientEvent('esx:showNotification', source, Translation[Config.Locale]['cashrecieved'] .. ' ~g~' .. randomAmount .. ' ' .. Translation[Config.Locale]['currency'])
	TriggerClientEvent('esx:DrawMissionText', source, "+~g~".. randomAmount .."$", 3500)
    TriggerClientEvent('loffe_robbery:removePickup', -1, store) 
end)

ESX.RegisterServerCallback('loffe_robbery:canRob', function(source, cb, store)
    local cops = 0
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
            cops = cops + 1
        end
    end
    if cops >= Config.Shops[store].cops then
        if not Config.Shops[store].robbed and not deadPeds[store] then
            cb(true)
        else
            cb(false)
        end
    else
        cb('no_cops')
    end
end)

RegisterServerEvent('loffe_robbery:policemsg')
AddEventHandler('loffe_robbery:policemsg', function(store)
    local src = source
    Config.Shops[store].robbed = true
    local xPlayers = ESX.GetPlayers()
    Wait(4000)
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
            TriggerClientEvent('loffe_robbery:msgPolice', xPlayer.source, store, src)
        end
    end
end)

RegisterServerEvent('loffe_robbery:rob')
AddEventHandler('loffe_robbery:rob', function(store)
    local src = source
    Config.Shops[store].robbed = true
    local xPlayers = ESX.GetPlayers()

    TriggerClientEvent('loffe_robbery:rob', -1, store)
    Wait(30000)
    TriggerClientEvent('loffe_robbery:robberyOver', src)

    local second = 1000
    local minute = 60 * second
    local hour = 60 * minute
    local cooldown = Config.Shops[store].cooldown
    local wait = cooldown.hour * hour + cooldown.minute * minute + cooldown.second * second
    Wait(wait)
    Config.Shops[store].robbed = false
    for k, v in pairs(deadPeds) do if k == store then table.remove(deadPeds, k) end end
    TriggerClientEvent('loffe_robbery:resetStore', -1, store)
end)

Citizen.CreateThread(function()
    while true do
        for i = 1, #deadPeds do TriggerClientEvent('loffe_robbery:pedDead', -1, i) end -- update dead peds
        Citizen.Wait(500)
    end
end)



function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

RegisterServerEvent('esx_vangelico_robbery:toofar')
AddEventHandler('esx_vangelico_robbery:toofar', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], "~r~Braquage annulé à: ~b~" .. Stores[robb].nameofstore)
			TriggerClientEvent('esx_vangelico_robbery:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_vangelico_robbery:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, "~r~Braquage annulé: ~b~" .. Stores[robb].nameofstore)
	end
end)

RegisterServerEvent('esx_vangelico_robbery:endrob')
AddEventHandler('esx_vangelico_robbery:endrob', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], "Vous avez volez tout les bijoux")
			TriggerClientEvent('esx_vangelico_robbery:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_vangelico_robbery:robberycomplete', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, "Braquage fini à" .. Stores[robb].nameofstore)
	end
end)

RegisterServerEvent('esx_vangelico_robbery:rob')
AddEventHandler('esx_vangelico_robbery:rob', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	if Stores[robb] then

		local store = Stores[robb]

		if (os.time() - store.lastrobbed) < 600 and store.lastrobbed ~= 0 then

            TriggerClientEvent('esx_vangelico_robbery:togliblip', source)
			TriggerClientEvent('esx:showNotification', source, "La Bijouterie a déjà été braqué. Merci d\'attendre : " .. (1800 - (os.time() - store.lastrobbed)) .. "Secondes")
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
				cops = cops + 1
			end
		end


		if rob == false then

			if(cops >= Config.RequiredCopsRob)then

				rob = true
				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
							--TriggerClientEvent('esx:showNotification', xPlayers[i], "~r~ Braquage en cours à: ~b~" .. store.nameofstore)
							TriggerClientEvent('clippy:alarmebijouterie', xPlayers[i], Stores[robb].position)
							--TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Central", "~b~Appel d'urgence: 911", "~b~Identité: ~s~Civil\n~b~Localisation: ~s~".. store.nameofstore.."\n~b~Infos: \n~s~Braquage de bijouterie", 'CHAR_CALL911', 7)
							--TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Accepter: ~g~E~s~ Refuser : ~r~X")
							--TriggerClientEvent('esx_vangelico_robbery:setblip', xPlayers[i], Stores[robb].position)
							--TriggerClientEvent('clippy:alarmebijouterie')
					end
				end

				--TriggerClientEvent('esx:showNotification', source, '_U('started_to_rob') .. store.nameofstore .. _U('do_not_move')')
				TriggerClientEvent('esx:showNotification', source, "~r~L\'alarme a été déclenché")
				TriggerClientEvent('esx:showNotification', source, "~g~Vole tout les bijoux.")
			    TriggerClientEvent('esx_vangelico_robbery:currentlyrobbing', source, robb)
                CancelEvent()
				Stores[robb].lastrobbed = os.time()
			else
				TriggerClientEvent('esx_vangelico_robbery:togliblip', source)
				TriggerClientEvent('esx:showNotification', source, "Il faut au moin ~b~3 Policier~s~ Pour braquer.")
			end
		else
			TriggerClientEvent('esx_vangelico_robbery:togliblip', source)
			TriggerClientEvent('esx:showNotification', source, "~r~Braquage déja en cours.")
		end
	end
end)

RegisterServerEvent('esx_vangelico_robbery:gioielli1')
AddEventHandler('esx_vangelico_robbery:gioielli1', function()

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addInventoryItem('jewels', math.random(5, 20))
end)

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

local function Craft(source)

	SetTimeout(4000, function()

		if PlayersCrafting[source] == true and CopsConnected >= Config.RequiredCopsSell then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local JewelsQuantity = xPlayer.getInventoryItem('jewels').count

			if JewelsQuantity < 20 then 
				TriggerClientEvent('esx:showNotification', source, "~r~Vous n\'avez pas assez de bijoux")
			else   
                xPlayer.removeInventoryItem('jewels', 20)
                Citizen.Wait(4000)
				xPlayer.addAccountMoney('black_money', 5000)
				
				Craft(source)
			end
		else
		TriggerClientEvent('esx:showNotification', source, "Il faut au moins ~b~3 Policier~s~ en ville pour vendre.")
		end
	end)
end

RegisterServerEvent('lester:vendita')
AddEventHandler('lester:vendita', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, "~y~Bijoux~s~ Vente en cours ...")
	Craft(_source)
end)

RegisterServerEvent('lester:nvendita')
AddEventHandler('lester:nvendita', function()
	local _source = source
	PlayersCrafting[_source] = false
end)






local CopsConnected       	   = 0
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

RegisterServerEvent("gofastclp:atendretest")
AddEventHandler("gofastclp:atendretest", function(bonus)
	if CopsConnected < 3 then
		TriggerClientEvent('esx:showNotification', source, "Action ~r~impossible~s~, il n'y a pas assez de LSPD en ville.", CopsConnected, 3)
	else
		TriggerClientEvent("chancelocal:clp_mission")
	end
	--end
end)

RegisterServerEvent("gofastclp:venfres")
AddEventHandler("gofastclp:venfres", function(bonus)
     local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)
     if not xPlayer then return; end

     if bonus > 950 then
		  TriggerClientEvent('esx:showNotification', source, '~g~Véhicule en parfait état.')
     elseif bonus > 900 then
		  TriggerClientEvent('esx:showNotification', source, '🔧~y~Véhicule en états correct.')
		  xPlayer.removeMoney(450)
     elseif bonus > 800 then
		  TriggerClientEvent('esx:showNotification', source, '🔧~o~Véhicule assez abimé.')
		  xPlayer.removeMoney(950)
     elseif bonus > 650 then
		  TriggerClientEvent('esx:showNotification', source, '🔧~r~Véhicule complétement abimé.')
		  xPlayer.removeMoney(1250)
     end
	 local montantentre = math.random(1250, 4320)
     --xPlayer.addMoney(montantentre)
     xPlayer.addAccountMoney('black_money', montantentre)
     TriggerClientEvent('esx:DrawMissionText', source, 'Le dealer vous a donné ~r~'..montantentre..' $', 4600)
end)



-----------------------------------------------------------LOCKPICK----------------------------------------------------------------

ESX.RegisterUsableItem('lockpick', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent("clippy_lockpick:open", xPlayer.source)
end)

RegisterServerEvent('lockpick:positions')
AddEventHandler('lockpick:positions', function(x, y, z) 
	TriggerClientEvent('lockpick:infopolice', -1, x, y, z)
end)

RegisterNetEvent('removebecausecrocheter')
AddEventHandler('removebecausecrocheter', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('lockpick', 1)
end)


RegisterNetEvent('ChanceOpenCarLock')
AddEventHandler('ChanceOpenCarLock', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local total   = math.random(0, 99);

	if total >= 0 and total <= 50 then
        TriggerClientEvent('crochetagegagnecivil', source)
    else 
        TriggerClientEvent('crochetagefail', source)
    end
end)