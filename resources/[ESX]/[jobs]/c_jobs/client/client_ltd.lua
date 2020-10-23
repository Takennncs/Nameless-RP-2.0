local PlayerData, CurrentActionData, HandcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService, isInShopMenu = false, false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged = false
ESX = nil
locksound = false
onDuty = false

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'LTD',
		number     = 'ltd',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTV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'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData() 
end)



RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job

	Citizen.Wait(5000)

end)



function OpenBillingMenu()

	ESX.UI.Menu.Open(
	  'dialog', GetCurrentResourceName(), 'billing',
	  {
		title = "Facture"
	  },
	  function(data, menu)
  
		local amount = tonumber(data.value)
		local player, distance = ESX.Game.GetClosestPlayer() 
  
		if player ~= -1 and distance <= 3.0 then
  
		  menu.close()
		  if amount == nil then
			  ESX.ShowColoredNotification("~r~ERREUR~s~: ~g~Montant invalide", 25) 
		  else
			  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_ltd', _U('billing'), amount)
			  Citizen.Wait(100)
			  ESX.ShowColoredNotification("Vous avez bien envoyer une facture", 25)
		  end

		else
		  ESX.ShowColoredNotification("~r~ERREUR~s~: ~g~Aucun joueur proximit ", 25)
		end
  
	  end,
	  function(data, menu)
		  menu.close()
	  end
	)
  end

function startAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
	end)
end 
function startScenario(anim)
    TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
end













local notif = {
    "~g~Ouvert (sud)",
    "~r~Fermer (sud)",
    "~g~Ouvert (nord)",
    "~r~Fermer (nord)"
}

local Neo = true
function functionCheckBox()
    Neo = not Neo
    if not Neo then  
        TriggerServerEvent("player:serviceOn", "ltd")
        ESX.ShowColoredNotification("Vous êtes désormais considéré ~g~en service.", 25)  
    elseif Neo then  
        TriggerServerEvent("player:serviceOff", "ltd")
        ESX.ShowColoredNotification("Vous êtes désormais considéré ~r~hors service.", 8)
    end
end

local Neo = true
function functionCheckBox2()
    Neo = not Neo
    if not Neo then  
        TriggerEvent("call:cancelCall") 
        ESX.ShowColoredNotification("Vous avez annulé L\'appel", 6)    
        TriggerServerEvent("player:serviceOff", "ltd")
    elseif Neo then  
        TriggerServerEvent("player:serviceOn", "ltd")
        ESX.ShowColoredNotification("Vous pouvez maintenant accepter à nouveau les appels", 18)   
    end
end


local menuf6ltdsud = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "LTD" },
    Data = { currentMenu = "Action :", "Test" }, 
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
			

            if btn == "Service" then
                functionCheckBox()
            elseif btn == "Annuler l'appel" then
                    functionCheckBox2()
            elseif btn == 'Facturation' then
              OpenBillingMenu()	 
          
            elseif btn == "Prise De ~g~Service" then               
                    TriggerServerEvent("player:serviceOn", "ltd")
                    ESX.ShowColoredNotification("Vous êtes désormais ~y~en service", 18) 

                elseif slide == 1 and btn == "LTD" then                                      
                    TriggerServerEvent('Announceltdsudo') 
                elseif slide == 2 and btn == "LTD" then                                      
                    TriggerServerEvent('Announceltdsudofermer')  
                elseif slide == 3 and btn == "LTD" then                                      
                    TriggerServerEvent('Announceltdnord') 
                elseif slide == 4 and btn == "LTD" then                                      
                    TriggerServerEvent('Announceltdnordfermer') 


                elseif btn == "Fin De ~r~Service" then  
                    TriggerServerEvent('esx_service:disableService', 'ltd')
                    ESX.ShowColoredNotification("Vous êtes désormais ~y~plus en service", 6) 
           
        end
    end,
},

    Menu = {

        ["Action :"] = {

            b = {
                {name = "Facturation", ask = "", askX = true},
                {name = "Action", ask = "→", askX = true},
               
            
                
                
            }
        },
        ["action"] = {

            b = {
                {name = "Service", checkbox = false},
                {name = "LTD", slidemax = notif},
                -- {name = "Annuler l'appel", checkbox = false},
              
                
                
            }
        }
     
      
	}
}  



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1,167) and PlayerData.job and PlayerData.job.name == 'ltd' then
            CreateMenu(menuf6ltdsud)
        end
    end
end)
------Interaction contoire

local voiture = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "LTD Comptoir" },
    Data = { currentMenu = "Animation ltd", "Test"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
            if btn.name == "Donner objet" then 
               
                local lib1, anim1 = 'mp_safehousevagos@', 'package_dropoff'
                ESX.Streaming.RequestAnimDict(lib1, function()
                TaskPlayAnim(PlayerPedId(), lib1, anim1, 8.0, -8.0, -1, 0, 0, false, false, false)
                end)  
            elseif btn.name == "Comptoir" then 
                ExecuteCommand('e leanbar')
            elseif btn.name == "Bras croisé" then  
                ExecuteCommand('e crossarms')
            elseif btn.name == "Prendre note" then 
                ExecuteCommand('e notepad')
            elseif btn.name == "Prendre une boite" then 
                ExecuteCommand('e box')
            elseif btn.name == "~r~APPELER LA POLICE" then 
                ExecuteCommand('e pointdown')
                ESX.ShowColoredNotification("Tu as appelé la police", 6)
                local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
                TriggerServerEvent("call:makeCall", "police", {x=plyPos.x,y=plyPos.y,z=plyPos.z}, "Besoin d'aide au LTD !")
                TriggerServerEvent("call:makeCall", "sheriff", {x=plyPos.x,y=plyPos.y,z=plyPos.z}, "Besoin d'aide au LTD !")
                Citizen.Wait(2000)
            end  
    end,
},

    Menu = {

        ["Animation ltd"] = {

            b = {
                {name = "Donner objet", ask = ">", askX = true},
                {name = "Comptoir", ask = ">", askX = true},
                {name = "Bras croisé", ask = ">", askX = true},
                {name = "Prendre note", ask = ">", askX = true},
                {name = "Prendre une boite", ask = "~g~Grosse commande", askX = true},
                {name = "~r~APPELER LA POLICE", ask = "~r~>", askX = true}, 
            
            }
        }
    }
}




local garage = {
    {x=-706.10, y=-914.81, z=19.11}, 
    {x=-706.12, y=-912.68, z=19.11},
    {x = 1697.1285400391, y = 4923.3540039063, z = 42.063678741455},
    {x = 1698.6827392578, y = 4922.4760742188, z = 42.063678741455}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    
        for k in pairs(garage) do
                
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, garage[k].x, garage[k].y, garage[k].z)
    
            if dist <= 1.5 and PlayerData.job and PlayerData.job.name == 'ltd' then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder au ~b~comptoir~s~")
                if IsControlJustPressed(1,38) then 			
                    CreateMenu(voiture)
                    end
                end
            end
        end
    end)






------------------------
       --Casier--
------------------------

  local casierltdsud = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Casier" },
	Data = { currentMenu = "Action :", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
            if btn == "Tenue Civil" then

               
               
          
            
                -------
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
				end)
                ESX.ShowAdvancedNotification('LTD Sud', '~b~Casier', 'Tu viens de mettre ta tenue Civil !', 'CHAR_AMANDA')
            end
        
 if btn == "Tenue Employé" then				
					TriggerEvent('skinchanger:getSkin', function(skin)
						if skin.sex == 0 then
                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.ltdnord_wear.male)
                    elseif skin.sex == 1 then
                            TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.ltdnord_wear.female)
                    end
                end)
                ESX.ShowAdvancedNotification('LTD Sud', '~b~Casier', 'Tu viens de mettre ta tenue de travail !', 'CHAR_AMANDA')
                
    end
            
        
	end,
}, 
	Menu = {
		["Action :"] = {
			b = {
				{name = "Tenue Civil", ask = "→", askX = true},
				{name = "Tenue Employé", ask = "→", askX = true}
			}
		}
	}
}

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[job].male then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		else
			if Config.Uniforms[job].female then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		end
	end)
end

local casierltdsuds = {
    {x = -708.96, y = -907.21, z = 19.21},
    {x = 1704.9382324219, y = 4921.544921875, z = 42.063678741455}
}


Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(0)
    
        for k in pairs(casierltdsuds) do
                
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, casierltdsuds[k].x, casierltdsuds[k].y, casierltdsuds[k].z)
    
            if dist <= 0.5 and PlayerData.job and PlayerData.job.name == 'ltd' then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder au ~b~Casier~s~")
                if IsControlJustPressed(1,38) then 
                    CreateMenu(casierltdsud)
                    end
                end
            end
        end
    end)




        
-------------------------------------------------
  --Interaction Achat/Déposer/Retirer Objects--
-------------------------------------------------

local coffreltdsud = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Coffre" },
	Data = { currentMenu = "Action :", "Test" },
	Events = {
        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            if btn.name == "Orangina" then
                TriggerServerEvent('KrXDarhop:buy', 2, "orangina", "orangina")
            elseif btn.name == "Frites" then
                TriggerServerEvent('KrXDarhop:buy', 2, "frites", "frites")
            elseif btn.name == "Hamburger" then
                TriggerServerEvent('KrXDarhop:buy', 4, "pizza", "pizza")
            elseif btn.name == "PC Portable" then
                TriggerServerEvent('KrXDarhop:buy', 250, "laptop_h", "laptop_h")
            elseif btn.name == "20 Sac de conservation" then
                TriggerServerEvent('c_ltd:buy', 10, "drugbags", "drugbags")
            elseif btn.name == "20 Papier à rouler" then
                TriggerServerEvent('c_ltd:buy', 5, "rolpaper", "rolpaper")
            elseif btn.name == "Ticket d'annonce" then
                TriggerServerEvent('KrXDarhop:buy', 250, "ticket_news", "ticket_news")
        end
	end,
},
	Menu = {
		["Action :"] = {
			b = {
                {name = "Acheter nourriture", ask = "~g~$", askX = true},
                {name = "Acheter multimédia", ask = "~g~$", askX = true}
			}
        },
        
		["acheter nourriture"] = {
			b = {
                {name = "Orangina",ask = "~s~2$ → ~g~5$", askX = true},
                {name = "Frites", ask = "~s~2$ → ~g~5$", askX = true},
                {name = "Hamburger", ask = "~s~4$ → ~g~10$", askX = true}
			}
        },
        ["acheter multimédia"] = {
			b = {
                {name = "PC Portable", ask = "~g~2 500$", askX = true},
                {name = "20 Sac de conservation", ask = "~g~10$", askX = true},
                {name = "20 Papier à rouler", ask = "~g~5$", askX = true},
                {name = "Ticket d'annonce", ask = "~g~250$", askX = true}
			}
        }
	}
}

local positionshop = {
	{x = -706.08,  y = -914.44,  z = 19.2},
	{x = 1697.1354980469, y = 4930.9404296875, z = 42.078094482422},
}

-------------------------------------------------------------Blips-------------------------------------------------------------

Citizen.CreateThread(function()

    for k in pairs(positionshop) do

	local blip = AddBlipForCoord(positionshop[k].x, positionshop[k].y, positionshop[k].z)

	SetBlipSprite(blip, 59)
	SetBlipColour(blip, 2)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("LTD")
    EndTextCommandSetBlipName(blip)
    end
end)

local Coffresltdsuds = {
    {x = -705.54, y = -904.99, z = 19.21},
    {x = 1705.1821289063, y = 4917.4174804688, z = 42.063678741455}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    
        for k in pairs(Coffresltdsuds) do
                
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Coffresltdsuds[k].x, Coffresltdsuds[k].y, Coffresltdsuds[k].z)
    
            if dist <= 1.5 and PlayerData.job and PlayerData.job.name == 'ltd' then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder au ~b~coffre~s~")
                if IsControlJustPressed(1,38) then
                    CreateMenu(coffreltdsud) 
                    end
                end
            end
        end
    end)

---------------------
  --Patron Action--
---------------------

local patronltdsud = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Intéraction Patron" },
	Data = { currentMenu = "Action :", "Test" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
            if btn == "Entreprise" then   
                self:CloseMenu()
                TriggerEvent('esx_society:openBossMenu', 'ltd', function(data, menu)
                    menu.close()
                end)
        end
	end,
},
	Menu = {
		["Action :"] = {
			b = {
				{name = "Entreprise", ask = "→", askX = true}
			}
        }
	}
}

local patronltdsuds = {
    {x = -709.66, y = -905.31, z = 19.21},
    {x = 1706.7043457031, y = 4921.1328125, z = 42.063678741455}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    
        for k in pairs(patronltdsuds) do
                
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, patronltdsuds[k].x, patronltdsuds[k].y, patronltdsuds[k].z)
    
            if dist <= 0.5 and PlayerData.job and PlayerData.job.name == 'ltd' and PlayerData.job.grade_name == 'gerant' then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder à l'ordinateur de ~b~l'entreprise")
                if IsControlJustPressed(1,38) then
                    CreateMenu(patronltdsud)
                    end
                end 
            end
        end
    end)