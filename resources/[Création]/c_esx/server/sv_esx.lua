ESX              = nil
local PlayerData = {}
local CopsConnected       	   = 0
local PlayersHarvestingCoke    = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--[[ function CountCops()
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

CountCops() ]]

----------------------------------------- Pôle Emploi ------------------------------------------

RegisterServerEvent('esx_joblisting:setJobRally')
AddEventHandler('esx_joblisting:setJobRally', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("rally", 0)	
end)

RegisterServerEvent('esx_joblisting:setJobTaxi')
AddEventHandler('esx_joblisting:setJobTaxi', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("taxi", 0)	
end)

RegisterServerEvent('esx_joblisting:Ferrailleur')
AddEventHandler('esx_joblisting:Ferrailleur', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("ferrailleur", 0)	
end)

RegisterServerEvent('esx_joblisting:setJobLaitier')
AddEventHandler('esx_joblisting:setJobLaitier', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("krowa", 0)	
end)

RegisterServerEvent('esx_joblisting:setJobEboeur')
AddEventHandler('esx_joblisting:setJobEboeur', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("garbage", 0)	
end)

RegisterServerEvent('esx_joblisting:setJobMiner')
AddEventHandler('esx_joblisting:setJobMiner', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("mhmclovin", 0)	
end)

RegisterServerEvent('esx_joblisting:setJobCho')
AddEventHandler('esx_joblisting:setJobCho', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("unemployed", 0)	
end)

------------------------------------------- BMX -------------------------------------------

ESX.RegisterUsableItem('bmx', function(source)
	TriggerClientEvent('bmx:usebmx', source)
end)

--[[ RegisterNetEvent('addbmxachat')
AddEventHandler('addbmxachat', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem('bmx', 1)
end) ]]

RegisterNetEvent('removebmx')
AddEventHandler('removebmx', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('bmx', 1)
end)

RegisterNetEvent('addbmx')
AddEventHandler('addbmx', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem('bmx', 1)
end)



------------------------------------------- TERRE -------------------------------------------

RegisterServerEvent("clp_terre:retrieveBottle")
AddEventHandler("clp_terre:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local terreQuantity = xPlayer.getInventoryItem('terre').count
    local pelle = xPlayer.getInventoryItem('pelle').count

    if pelle <= 0 then 
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas de pelle.")
        TriggerClientEvent('arretrecolteterre', source)
    else
        if terreQuantity >= 100 then
                TriggerClientEvent('esx:showNotification', source, ('Terre\n~r~Vous portez trop de Kilos'))
                TriggerClientEvent('arretrecolteterre', source)
            else
                xPlayer.addInventoryItem("terre", 1)
                TriggerClientEvent("esx:DrawMissionText", source, "+ ~g~100G ~s~de ~g~Terre", 1000)
            end
    end
end)

RegisterServerEvent('clp_terre:GetUserInventory')
AddEventHandler('clp_terre:GetUserInventory', function(currentZone)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('clp_terre:ReturnInventory', 
        _source, 
        xPlayer.getInventoryItem('terre').count,
        xPlayer.job.name, 
        currentZone
    )
end)

RegisterServerEvent("clp_acide:retrieveBottle")
AddEventHandler("clp_acide:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local terreQuantity = xPlayer.getInventoryItem('acidesulfurique').count

    if terreQuantity >= 500 then
            TriggerClientEvent('esx:showNotification', source, ('Acide Sulfurique\n~r~Vous portez trop de Kilos'))
            TriggerClientEvent('arretrecolteterre', source)
        else
            xPlayer.addInventoryItem("acidesulfurique", 1)
            TriggerClientEvent("esx:DrawMissionText", source, "+ ~g~1 ~s~Acide sulfurique", 1000)
        end
end)

RegisterServerEvent('clp_acide:GetUserInventory')
AddEventHandler('clp_acide:GetUserInventory', function(currentZone)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('clp_acide:ReturnInventory', 
        _source, 
        xPlayer.getInventoryItem('acidesulfurique').count,
        xPlayer.job.name, 
        currentZone
    )
end)

RegisterServerEvent("clp_antigel:retrieveBottle")
AddEventHandler("clp_antigel:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local terreQuantity = xPlayer.getInventoryItem('antigel').count

    if terreQuantity >= 500 then
            TriggerClientEvent('esx:showNotification', source, ('Acide Sulfurique\n~r~Vous portez trop de Kilos'))
            TriggerClientEvent('arretrecolteterre', source)
        else
            xPlayer.addInventoryItem("antigel", 1)
            TriggerClientEvent("esx:DrawMissionText", source, "+ ~g~1 ~s~Antigel", 1000)
        end
end)

RegisterServerEvent('clp_antigel:GetUserInventory')
AddEventHandler('clp_antigel:GetUserInventory', function(currentZone)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('clp_antigel:ReturnInventory', 
        _source, 
        xPlayer.getInventoryItem('antigel').count,
        xPlayer.job.name, 
        currentZone
    )
end)

RegisterServerEvent("clp_pierre:retrieveBottle")
AddEventHandler("clp_pierre:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local terreQuantity = xPlayer.getInventoryItem('pierre').count

    if terreQuantity >= 50 then
            TriggerClientEvent('esx:showNotification', source, ('Pierre\n~r~Vous portez trop de Kilos'))
            TriggerClientEvent('arretrecolteterre', source)
        else
            xPlayer.addInventoryItem("pierre", 1)
            TriggerClientEvent("esx:DrawMissionText", source, "+ ~g~500G ~s~de ~g~Pierre", 1000)
        end
end)

RegisterServerEvent("clp_sable:retrieveBottle")
AddEventHandler("clp_sable:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local sableQuantity = xPlayer.getInventoryItem('sable').count
    local pelle = xPlayer.getInventoryItem('pelle').count

    if pelle <= 0 then 
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas de pelle.")
        TriggerClientEvent('arretrecolteterre', source)
    else
        if sableQuantity >= 500 then
                TriggerClientEvent('esx:showNotification', source, ('Sable\n~r~Vous portez trop de Kilos'))
                TriggerClientEvent('arretrecolteterre', source)
            else
                xPlayer.addInventoryItem("sable", 1)
                TriggerClientEvent("esx:DrawMissionText", source, "+ ~g~20G ~s~de ~g~Sable", 1000)
            end
        end
end)

RegisterServerEvent("clp_bois:retrieveBottle")
AddEventHandler("clp_bois:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local terreQuantity = xPlayer.getInventoryItem('bois').count

    if terreQuantity >= 50 then
            TriggerClientEvent('esx:showNotification', source, ('Bois\n~r~Vous portez trop de Kilos'))
            TriggerClientEvent('arretrecolteterre', source)
        else
            xPlayer.addInventoryItem("bois", 1)
            TriggerClientEvent("esx:DrawMissionText", source, "+ ~g~1 ~s~Rondin", 1000)
        end
end)

RegisterServerEvent("clp_fer:retrieveBottle")
AddEventHandler("clp_fer:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local terreQuantity = xPlayer.getInventoryItem('ferraille').count

    if terreQuantity >= 50 then
            TriggerClientEvent('esx:showNotification', source, ('Ferraille\n~r~Vous portez trop de Kilos'))
            TriggerClientEvent('arretrecolteterre', source)
        else
            xPlayer.addInventoryItem("ferraille", 1)
            TriggerClientEvent("esx:DrawMissionText", source, "+ ~g~1 ~s~bout de ~g~Ferraille", 1000)
        end
end)


------------------------------------
   ---- Faire Les Poubelles ----
------------------------------------
RegisterServerEvent('esx_useitem:bin')
AddEventHandler('esx_useitem:bin', function()

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local total   = math.random(0, 99);

	if total >= 0 and total <= 50 then
		TriggerClientEvent('esx:DrawMissionText', source ,"La poubelle est ~r~vide.", 3500)
	elseif total > 50 and total <= 60 then 
		local item = 'hamburger'
		local amount = 1
		TriggerClientEvent('esx:DrawMissionText', source ,"Vous avez trouvé~g~ " ..amount.. " " ..item.. " ", 3500)
		xPlayer.addInventoryItem(item, amount)
	elseif total > 60 and total <= 65 then
		local item = 'sirop'
		local amount = 1
		TriggerClientEvent('esx:DrawMissionText', source ,"Vous avez trouvé~g~ " ..amount.. " " ..item.. " ", 3500)
		xPlayer.addInventoryItem(item, amount)
	elseif total > 65 and total <= 71 then
		local total   = math.random(1, 3);
		local item = 'frites'
		local amount = total
		TriggerClientEvent('esx:DrawMissionText', source ,"Vous avez trouvé~g~ " ..amount.. " " ..item.. " ", 3500)
		xPlayer.addInventoryItem(item, amount)
	elseif total > 71 and total <= 74 then
		local total   = math.random(1, 3);
		local item = 'icetea'
		local amount = total
		TriggerClientEvent('esx:DrawMissionText', source ,"Vous avez trouvé~g~ " ..amount.. " " ..item.. " ", 3500)
		xPlayer.addInventoryItem(item, amount)
	elseif total > 74 and total <= 76 then
		local total   = math.random(1, 3);
		local item = 'sprite'
		local amount = total
		TriggerClientEvent('esx:DrawMissionText', source ,"Vous avez trouvé~g~ " ..amount.. " " ..item.. " ", 3500)
		xPlayer.addInventoryItem(item, amount)
	elseif total > 76 and total <= 79 then
		local total   = math.random(1, 3);
		local item = 'water'
		local amount = total
		TriggerClientEvent('esx:DrawMissionText', source ,"Vous avez trouvé~g~ " ..amount.. " " ..item.. " ", 3500)
		xPlayer.addInventoryItem(item, amount)
	elseif total > 79 and total <=85 then
		local total   = math.random(1, 3);
		local item = 'bread'
		local amount = total
		TriggerClientEvent('esx:DrawMissionText', source ,"Vous avez trouvé~g~ " ..amount.. " " ..item.. " ", 3500)
		xPlayer.addInventoryItem(item, amount)
	elseif total > 85 and total <= 87 then
		local total   = math.random(5, 15);
		local item = 'croquettes'
		local amount = total
		TriggerClientEvent('esx:DrawMissionText', source ,"Vous avez trouvé~g~ " ..amount.. " " ..item.. " ", 3500)
		xPlayer.addInventoryItem(item, amount)
	elseif total > 87 and total <= 88 then
		local item = 'bread'
		local amount = 1
		TriggerClientEvent('esx:DrawMissionText', source ,"Vous avez trouvé~g~ " ..amount.. " " ..item.. " ", 3500)
		xPlayer.addInventoryItem(item, amount)
	elseif total > 88 and total <= 95 then
		local total   = math.random(1, 5);
		local item = 'pizza'
		local amount = total
		TriggerClientEvent('esx:DrawMissionText', source ,"Vous avez trouvé~g~ " ..amount.. " " ..item.. " ", 3500)
		xPlayer.addInventoryItem(item, amount)
	end
end)






RegisterServerEvent('esx_narshop:remove')
AddEventHandler('esx_narshop:remove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clip', 1)
end)

RegisterServerEvent('esx_narshop:remove1')
AddEventHandler('esx_narshop:remove1', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clipextended', 1)
end)

RegisterServerEvent('esx_narshop:remove2')
AddEventHandler('esx_narshop:remove2', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clipdrum', 1)
end)

RegisterServerEvent('esx_narshop:remove3')
AddEventHandler('esx_narshop:remove3', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('viseur', 1)
end)

ESX.RegisterUsableItem('clip', function(source)
	TriggerClientEvent('esx_narshop:clipcli', source)
end)

ESX.RegisterUsableItem('silencieux', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)	
    TriggerClientEvent('esx_narshop:silencieux', source)
end)

ESX.RegisterUsableItem('flashlight', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)	
    TriggerClientEvent('esx_narshop:flashlight', source)
end)

ESX.RegisterUsableItem('grip', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)	
    TriggerClientEvent('esx_narshop:grip', source)
end)

ESX.RegisterUsableItem('viseur', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)	
    TriggerClientEvent('esx_narshop:viseur', source)
end)

ESX.RegisterUsableItem('clipextended', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)	
    TriggerClientEvent('esx_narshop:clipextended', source)
end)

ESX.RegisterUsableItem('clipdrum', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)	
    TriggerClientEvent('esx_narshop:clipdrum', source)
end)

ESX.RegisterUsableItem('yusuf', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx_narshop:yusuf', source)
end)






------------------------------------
	---- Utiliser Brolly ----
------------------------------------
ESX.RegisterUsableItem('brolly', function(source)
	TriggerClientEvent('esx_useitem:brolly', source)
end)

------------------------------------
	---- Utiliser Kitpic ----
------------------------------------
ESX.RegisterUsableItem('kitpic', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_useitem:kitpic', source)
	xPlayer.removeInventoryItem('kitpic', 1)
end)

------------------------------------
	---- Utiliser Ball ----
------------------------------------
ESX.RegisterUsableItem('ball', function(source)
	TriggerClientEvent('esx_useitem:ball', source)
end)

------------------------------------
	---- Utiliser Permis ----
------------------------------------
ESX.RegisterUsableItem('permis', function(source)
	TriggerClientEvent('esx_useitem:permis', source)
end)

------------------------------------
	---- Utiliser Armes ----
------------------------------------
ESX.RegisterUsableItem('permisarmes', function(source)
	TriggerClientEvent('esx_useitem:permisarmes', source)
end)

------------------------------------
	---- Utiliser Identité ----
------------------------------------
ESX.RegisterUsableItem('carteidentite', function(source)
	TriggerClientEvent('esx_useitem:carteidentite', source)
end)


------------------------------------
	---- Utiliser Swim ----
------------------------------------

ESX.RegisterUsableItem('mask_swim', function(source)
	TriggerClientEvent('esx_useitem:swim', source)

	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mask_swim', 1)
end)

------------------------------------
	---- Utiliser Bong ----
------------------------------------

ESX.RegisterUsableItem('bong', function(source)
	TriggerClientEvent('esx_useitem:bong', source)
end)

RegisterServerEvent('esx_useitem:bong')
AddEventHandler('esx_useitem:bong', function()

	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bong', 1)
	TriggerClientEvent('esx_status:add', source, 'drunk', 450000)

end)

------------------------------------
	---- Utiliser Sandwich ----
------------------------------------

ESX.RegisterUsableItem('sandwich', function(source)
	TriggerClientEvent('esx_useitem:sandwich', source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bread', 1)	
	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)

end)

------------------------------------
	----- Utiliser Tatgun -------
------------------------------------

ESX.RegisterUsableItem('tatgun', function(source)

	TriggerClientEvent('esx_useitem:tatgun', source)

end)

------------------------------------
	----- Utiliser Gillet par balle -------
------------------------------------

ESX.RegisterUsableItem('bulletproof', function(source)

	--local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('esx_useitem:bulletproof', source)
	--xPlayer.removeInventoryItem('bulletproof', 1)

end)

RegisterServerEvent('removebullet')
AddEventHandler('removebullet', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('bulletproof', 1)
end)

ESX.RegisterUsableItem('bulletproofpolice', function(source)

	--local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('esx_useitem:removebulletpolice', source)
	--xPlayer.removeInventoryItem('bulletproof', 1)

end)
RegisterServerEvent('removebulletpolice')
AddEventHandler('removebulletpolice', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('bulletproofpolice', 1)
end)

RegisterServerEvent('removebulletsheriff')
AddEventHandler('removebulletsheriff', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('bulletproofsheriff', 1)
end)
ESX.RegisterUsableItem('bulletproofsheriff', function(source)
	TriggerClientEvent('esx_useitem:removebulletsheriff', source)
end)


------------------------------------
	----- Utiliser Kali Linux -------
------------------------------------

ESX.RegisterUsableItem('kalilinux', function(source)

	TriggerClientEvent('esx_useitem:kalilinux', source)

end)

------------------------------------
	----- Utiliser ROSE -------
------------------------------------

ESX.RegisterUsableItem('rose', function(source)
	
		TriggerClientEvent('esx_useitem:rose', source)
	
end)

------------------------------------
	----- Utiliser NOTEPAD -------
------------------------------------

ESX.RegisterUsableItem('notepad', function(source)
	
		TriggerClientEvent('esx_useitem:notepad', source)
	
end)

--HAZMAT NOIRE
ESX.RegisterUsableItem('sactactique', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_objects:settenuesactac', _source)
end)


--HAZMAT NOIRE
ESX.RegisterUsableItem('hazmat1', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_objects:settenuehaz1', _source)
end)

--HAZMAT BLEUE
ESX.RegisterUsableItem('hazmat2', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_objects:settenuehaz2', _source)
end)

--HAZMAT BREAKINGBAD
ESX.RegisterUsableItem('hazmat3', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_objects:settenuehaz3', _source)
end)

--HAZMAT BLANCHE
ESX.RegisterUsableItem('hazmat4', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_objects:settenuehaz4', _source)
end)

--CASA PAPEL
ESX.RegisterUsableItem('casapapel', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_objects:settenuecasa', _source)
end)

--TENUE KARTING
ESX.RegisterUsableItem('karting1', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_objects:settenuekarting1', _source)
end)

--TENUE KARTING2
ESX.RegisterUsableItem('karting2', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_objects:settenuekarting2', _source)
end)

--TENUE SKYDIVING
ESX.RegisterUsableItem('skydiving', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_objects:settenueskydivingcl', _source)
end)

--TENUE PRISON
ESX.RegisterUsableItem('prisonnier', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_objects:settenuejailer', _source)
end)

--TENUE Little Pricks
ESX.RegisterUsableItem('LittlePricks', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_objects:settenuelittlepricks', _source)
end)

--TENUE Mécano
ESX.RegisterUsableItem('LsCustoms', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    TriggerClientEvent('esx_objects:settenuelscustoms', _source)
end)



RegisterServerEvent('esx_outlawalert:carJackInProgress')
AddEventHandler('esx_outlawalert:carJackInProgress', function(targetCoords, streetName, vehicleLabel, playerGender)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if playerGender == 0 then
		playerGender = "Homme"
	else
		playerGender = "Femme"
	end
    
    --if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
	TriggerClientEvent('esx:showAdvancedNotification', -1, "Centrale", "~b~Appel d'urgence: 911", "~b~Identité: ~s~"..playerGender.."\n~b~Localisation: ~s~"..streetName.."\n~b~Infos: ~s~Vol de véhicule", 'CHAR_CALL911', 7)
    TriggerClientEvent('esx:showNotification', -1, "Accepter: ~g~E~s~ Refuser : ~r~X")
    --end
	TriggerClientEvent('esx_outlawalert:carJackInProgress', -1, targetCoords)
end)

ESX.RegisterServerCallback('esx_outlawalert:isVehicleOwner', function(source, cb, plate)
	local identifier = GetPlayerIdentifier(source, 0)

	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
		['@owner'] = identifier,
		['@plate'] = plate
	}, function(result)
		if result[1] then
			cb(result[1].owner == identifier)
		else
			cb(false)
		end
	end)
end)








local vehicles = {}

function getVehData(plate, callback)
    MySQL.Async.fetchAll("SELECT * FROM `owned_vehicles`", {},
    function(result)
        local foundIdentifier = nil
        for i=1, #result, 1 do
            local vehicleData = json.decode(result[i].vehicle)
            if vehicleData.plate == plate then
                foundIdentifier = result[i].owner
                break
            end
        end
        if foundIdentifier ~= nil then
            MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier", {['@identifier'] = foundIdentifier},
            function(result)
                local ownerName = result[1].firstname .. " " .. result[1].lastname

                local info = {
                    plate = plate,
                    owner = ownerName
                }
                callback(info)
            end
          )
        else -- if identifier is nil then...
          local info = {
            plate = plate
          }
          callback(info)
        end
    end)
  end

RegisterNetEvent("esx_nocarjack:setVehicleDoorsForEveryone")
AddEventHandler("esx_nocarjack:setVehicleDoorsForEveryone", function(veh, doors, plate)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local veh_model = veh[1]
    local veh_doors = veh[2]
    local veh_plate = veh[3]

    if not vehicles[veh_plate] then
        getVehData(veh_plate, function(veh_data)
            if veh_data.plate ~= plate then
                local players = GetPlayers()
                for _,player in pairs(players) do
                    TriggerClientEvent("esx_nocarjack:setVehicleDoors", player, table.unpack(veh, doors))
                end
            end
        end)
        vehicles[veh_plate] = true
    end
end)





Citizen.CreateThread(function()
    Citizen.Wait(0)
    for k, v in pairs(Config.Ammo) do
        ESX.RegisterUsableItem(v.name, function(source)
            TriggerClientEvent('disc-ammo:useAmmoItem', source, v)
        end)
    end
end)

RegisterServerEvent('disc-ammo:removeAmmoItem')
AddEventHandler('disc-ammo:removeAmmoItem', function(ammo)
    local player = ESX.GetPlayerFromId(source)
    player.removeInventoryItem(ammo.name, 1)
end)



local Cops = {
	"steam:100000000000",
}

RegisterServerEvent("PoliceVehicleWeaponDeleter:askDropWeapon")
AddEventHandler("PoliceVehicleWeaponDeleter:askDropWeapon", function(wea)
	local isCop = false

	for _,k in pairs(Cops) do
		if(k == getPlayerID(source)) then
			isCop = true
			break;
		end
	end

	if(not isCop) then
		print(1)
		TriggerClientEvent("PoliceVehicleWeaponDeleter:drop", source, wea)
	end

end)


function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

local PlayersHarvestingBois = {}

local function HarvestBois(source)

	SetTimeout(1 * 850, function()
		if PlayersHarvestingBois[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local bois = xPlayer.getInventoryItem('bois')

			if bois.limit ~= -1 and bois.count >= bois.limit then
				TriggerClientEvent('esx:showNotification', source, "~r~Vous ne pouvez ramasser de rondins de bois.")
			else
				xPlayer.addInventoryItem('bois', 1)
				HarvestBois(source)
			end
		end
	end)
end

RegisterServerEvent('clp_farm:startHarvestBois')
AddEventHandler('clp_farm:startHarvestBois', function()
	local _source = source

	if not PlayersHarvestingBois[_source] then
		PlayersHarvestingBois[_source] = true

        TriggerClientEvent('esx:showNotification', _source, "~g~Ramassage en cours~s~...")
		HarvestBois(_source)
	else
		print(('clp_farm: %s attempted to exploit the zone!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

