-- Ceci est un exemple basique utilisant ESX.
-- C'est seulement une demo, à vous de modifier à votre convenance.

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function getPlayerByName(playername)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer ~= nil and xPlayer.getName() == playername then
            return xPlayer
        end
    end
    return nil
end

AddEventHandler('onPlayerVote', function (playername, ip, date)
    local Player = getPlayerByName(playername)
    if Player then
        Player.addMoney(500)              
        ESX.ShowAdvancedNotification('top-serveurs.net/gta/namelessrp', '~w~'..playername..' a voté pour le serveur !\nIl a gagné ~g~500$', "CHAR_LIFEINVADER", 1)
    else     
        ESX.ShowAdvancedNotification('top-serveurs.net/gta/namelessrp', '~w~Un inconnu a voté pour le serveur !\nIl a gagné ~g~500$', "CHAR_LIFEINVADER", 1)
    end
end)
