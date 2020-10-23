ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('s_MenuF5:getAdminGroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer ~= nil then
		local playerGroup = xPlayer.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb(nil)
        end
	else
		cb(nil)
	end
end)

RegisterServerEvent("s_admin:giveobject")
AddEventHandler("s_admin:giveobject", function(giveid, giveitem, givecount)
	local xPlayer = ESX.GetPlayerFromId(giveid)
	xPlayer.addInventoryItem(giveitem, givecount)
	local name = GetPlayerName(source)
	sendToDiscord(name, "" ..name.. " viens de give " .. givecount .. "x  " .. giveitem .. " a l'id " .. giveid .. "")
end)

RegisterServerEvent("s_admin:freeze")
AddEventHandler("s_admin:freeze", function(freezeif)
	local name = GetPlayerName(source)
	sendToDiscord(name, "" ..name.. " a freeze/defreeze l'id " ..freezeif.. "")
	TriggerClientEvent("s_admin:freeze_player", freezeif)
end)

RegisterServerEvent("s_admin:avertissement")
AddEventHandler("s_admin:avertissement", function(avertird, msgavert)
	local name = GetPlayerName(source)
	sendToDiscord(name, "" ..name.. " a mis un avertissement a l'id " ..avertird.. " pour " .. msgavert .. "")
end)

RegisterServerEvent("s_admin:kick")
AddEventHandler("s_admin:kick", function(kickjoueur, msgkick)
	local name = GetPlayerName(source)
	sendToDiscord(name, "" ..name.. " a kick l'id " ..kickjoueur.. " pour " .. msgkick .. "")
	DropPlayer(kickjoueur, msgkick)
end)

RegisterServerEvent("s_admin:ban")
AddEventHandler("s_admin:ban", function(banjoueur, msgban)
	local name = GetPlayerName(source)
	sendToDiscord(name, "" ..name.. " a ban l'id " ..banjoueur.. " pour " .. msgban .. "")
	DropPlayer(banjoueur, "Vous avez étais bannie pour: " ..msgban.. "")
	TriggerEvent("BanSql:ICheat", msgban,valuejoueur)
end)

RegisterServerEvent("s_admin:banperm")
AddEventHandler("s_admin:banperm", function(banpermjoueur, msgbanperm)
	local name = GetPlayerName(source)
	sendToDiscord(name, "" ..name.. " a ban l'id " ..banjoueur.. " pour " .. msgbanperm .. "")
	DropPlayer(banpermjoueur, "Vous avez étais bannie pour: " ..msgbanperm.. "")
	TriggerEvent("BanSql:ICheat", msgbanperm,valuejoueur)
end)

RegisterServerEvent("s_admin:givearme")
AddEventHandler("s_admin:givearme", function(weaponName, idarme, armemun)
	local name = GetPlayerName(source)
	local xPlayer    = ESX.GetPlayerFromId(idarme)

	sendToDiscord(name, "" ..name.. " viens de give " ..weaponName.. " a l'id " .. idarme .. " avec " ..armemun.. "x munitions")
	xPlayer.addWeapon(weaponName, armemun)
end)

RegisterServerEvent("s_admin:givecash")
AddEventHandler("s_admin:givecash", function(idcash, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total = amount
	
	xPlayer.addMoney((total))

	local item = '$'
    local message = 'GIVE de '
    local name = GetPlayerName(source)
    TriggerClientEvent('esx:showNotification', _source, message .. total .. item)
    sendToDiscord(name, "" ..name.. " viens de se give " .. total .. "" .. item .. " a l'id " ..idcash.. " depuis l'option Give de l'Argent dans le Menu F5' ")
end)

RegisterServerEvent("s_admin:givebank")
AddEventHandler("s_admin:givebank", function(idbank, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total = amount
	
	xPlayer.addAccountMoney('bank', total)

	local item = '$ en banque'
    local message = 'GIVE de '
    local name = GetPlayerName(source)
    TriggerClientEvent('esx:showNotification', _source, message .. total .. item)
    sendToDiscord(name, "" ..name.. " viens de se give " .. total .. "" .. item .. " a l'id " ..idbank.. " depuis l'option Give de l'Argent en Banque dans le Menu F5' ")
end)

RegisterServerEvent("s_admin:givesale")
AddEventHandler("s_admin:givesale", function(idsale, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total = amount
	
	xPlayer.addAccountMoney('black_money', total)

	local item = '$ sale.'
    local message = 'GIVE de '
    local name = GetPlayerName(source)
    TriggerClientEvent('esx:showNotification', _source, message..total..item)
    sendToDiscord(name, "" ..name.. " viens give " .. total .. "" .. item .. " a l'id " ..idsale.. " depuis l'option Give de l'Argent Sale dans le Menu F5' ")
end)

RegisterServerEvent("s_admin:setjob")
AddEventHandler("s_admin:setjob", function(idjob, jobname, gradename)
	local xPlayer = ESX.GetPlayerFromId(idjob)
	local name = GetPlayerName(source)
	xPlayer.setJob(jobname, gradename)
    sendToDiscord(name, "" ..name.. " viens changer le métier de l'id " ..idjob.. " en " ..jobname.. " avec comme grade " ..gradename.. "")
end)

RegisterServerEvent("s_admin:setorg")
AddEventHandler("s_admin:setorg", function(idorg, orgname, gradeorg)
	local xPlayer = ESX.GetPlayerFromId(idorg)
	local name = GetPlayerName(source)
	xPlayer.setorg(orgname, gradeorg)
	sendToDiscord(name, "" ..name.. " viens changer l'organisation de l'id " ..idorg.. " en " ..orgname.. " avec comme grade " ..gradeorg.. "")
end)

RegisterServerEvent("s_admin:messageprive")
AddEventHandler("s_admin:messageprive", function(message, msg)
	local xTarget = ESX.GetPlayerFromId(message)
	local name = GetPlayerName(source)
	xTarget.showNotification(msg)
    sendToDiscord(name, "" ..name.. " viens d'envoyer un message a l'id " ..message.. " pour " ..msg.. "")
end)

RegisterServerEvent("s_admin:ticket")
AddEventHandler("s_admin:ticket", function(sujet, message)
	local name = GetPlayerName(source)
    sendToDiscordTicket(name, "" ..name.. " viens d'ouvrir un Ticket In Game : \n\nSujet: " ..sujet.."\n\nMessage: " ..message.. "")
end)

function sendToDiscordTicket (name,message,color)
	local DiscordWebHook = "met ton webhook"
	local color = 6965387
  	local embeds = {
	  	{
		  ["title"]=message,
		  ["type"]="rich",
		  ["color"] =color,
		  ["footer"]=  {
		  ["text"]= "s_Logs",
		},
	  }
  	}
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord (name,message,color)
	local DiscordWebHook = "met ton webhook"
	local color = 6965387
  	local embeds = {
	  	{
		  ["title"]=message,
		  ["type"]="rich",
		  ["color"] =color,
		  ["footer"]=  {
		  ["text"]= "s_Logs",
		},
	  }
  	}
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end