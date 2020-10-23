ESX = nil
ActualWipe = nil
Config = {}
local playerGroup = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	while playerGroup == nil do
		ESX.TriggerServerCallback('c_admin:getgroupadmin', function(group) playerGroup = group end)
		Citizen.Wait(10)
	end

end)

RegisterNetEvent('aw:SyncWipe') AddEventHandler('aw:SyncWipe', function(data) ActualWipe = data end) 

local WipeData = {} 
RegisterNetEvent('esx:playerLoaded') AddEventHandler('esx:playerLoaded', function(xPlayer) ESX.PlayerData = xPlayer end) 
      
local menuadmin = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Wipe"},
	Data = { currentMenu = "Options"},
	Events = {
		onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            if btn.name == "Steam ID" then  
			  local result = GetOnscreenKeyboardResult() if result ~= nil then WipeData.ID = result end
				elseif btn.name == "Numéro de telephone" then    
					 local result = GetOnscreenKeyboardResult() if result ~= nil then WipeData.TEL = result end
                        elseif btn.name == "Confirmer le Wype" then   
						   TriggerServerEvent('fdv:wipe', WipeData)	  
						   ESX.ShowNotification('~g~Wipe~s~\n~s~Wipe effectué ') 
						   CloseMenu(force) 
			end 
        end, 
    },   
	Menu = {  
		["Options"] = {
			b = {  
				{name = "Steam ID", ask = 'Aucun'},
                {name = "Numéro de telephone", ask = 'Aucun'}, 
                {name = "Confirmer le Wype", ask = '>', askX = true},		
			}
		} 
	} 
}
RegisterCommand('wipe', function(source)
	if playerGroup == 'superadmin' or playerGroup == 'admin' then
		CreateMenu(menuadmin) 
	end
end)

  