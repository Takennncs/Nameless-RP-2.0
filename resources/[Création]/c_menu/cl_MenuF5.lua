local cinematique = false
local onAdmin = false
local playergroup = nil
local specjoueur = {}
local kickjoueur = {}
local banjoueur = {}

ESX = nil

function functionCheckBox2()
    TriggerEvent("call:cancelCall") 
    ESX.ShowNotification("Vous avez ~g~annulé ~w~le dernier appel.")
end

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData().org == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	while actualSkin == nil do
		TriggerEvent('skinchanger:getSkin', function(skin) actualSkin = skin end)
		Citizen.Wait(10)
	end

	while playergroup == nil do
		if ESX ~= nil then
			ESX.TriggerServerCallback('s_MenuF5:getAdminGroup', function(group) playergroup = group end)
			Citizen.Wait(10)
		else
			Citizen.Wait(10)
		end
	end

	RefreshMoney()
	RefreshMoney2()
end)

local argent = {
	"Regarder",
    "Donner"
}

local argentsale = {
	"Regarder",
    "Donner"
}

local metier = {
	"Regarder",
    -- "Montrer"
}

local organisation = {
	"Regarder",
    "Action patron"
}

local argententreprise = {
    "Déposer",
    "Retirer"
}

local argentorganisation = {
    "Déposer",
    "Retirer"
}

local optionmoteur = {
    "Allumer",
    "Eteindre"
}

local porte = {
    "Avant Gauche",
    "Avant Droit",
    "Arrière Gauche",
    "Arrière Droit",
    "Capot",
    "Coffre",
    "Toutes les Portes"
}

Admin = {
    actuellementspec = false,
    --showcoords = false,
    --showcrosshair = false
    --nomtete = false
}

RegisterNetEvent('s_MenuF5:onAdmin')
AddEventHandler('s_MenuF5:onAdmin', function()
	onAdmin = true
end)

RegisterNetEvent('s_MenuF5:offAdmin')
AddEventHandler('s_MenuF5:offAdmin', function()
	onAdmin = false
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
	RefreshMoney()
end)

RegisterNetEvent('esx:setOrg')
AddEventHandler('esx:setOrg', function(org)
	ESX.PlayerData.org = org
	RefreshMoney2()
end)

function RefreshMoney()
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			UpdateSocietyMoney(money)
		end, ESX.PlayerData.job.name)
	end
end

function RefreshMoney2()
	if ESX.PlayerData.org ~= nil and ESX.PlayerData.org.gradeorg_name == 'boss' then
		ESX.TriggerServerCallback('esx_organisation:getOrganisationMoney', function(money)
			UpdateSociety2Money(money)
		end, ESX.PlayerData.gradeorg.name)
	end
end

function UpdateSocietyMoney(money)
	societymoney = ESX.Math.GroupDigits(money)
end

function UpdateSociety2Money(money)
	societymoney2 = ESX.Math.GroupDigits(money)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	-- print(xPlayer)
end)

local ragdoll = false
  function setRagdoll(flag)
	ragdoll = flag
  end
  Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
	  if ragdoll then
		SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
	  end
	end
  end)
  
  ragdol = true
  RegisterNetEvent("Ragdoll")
  AddEventHandler("Ragdoll", function()
	  if ( ragdol ) then
		  setRagdoll(true)
		  ragdol = false
	  else
		  setRagdoll(false)
		  ragdol = true
	  end
  end)

  function Ragdoll()
	TriggerEvent("Ragdoll", source)
end

local hasCinematic = true
function openCinematique()
	hasCinematic = not hasCinematic
    if not hasCinematic then -- montrer
        TriggerEvent("s_cinematique:cinematique", false)
        TriggerEvent("ui:off")
        TriggerEvent('ui:refresh')
		ESX.UI.HUD.SetDisplay(0.0)
		TriggerEvent('es:setMoneyDisplay', 0.0)
		TriggerEvent('esx_status:setDisplay', 0.0)
		DisplayRadar(false)
	elseif hasCinematic then -- cacher
		ESX.UI.HUD.SetDisplay(1.0)
		TriggerEvent('es:setMoneyDisplay', 1.0)
		TriggerEvent('esx_status:setDisplay', 1.0)
		DisplayRadar(true)
        TriggerEvent("s_cinematique:cinematique", true)
        TriggerEvent("ui:on")
        TriggerEvent('ui:refresh')
	end
end

local hasAdmin = true
function onAdminCheck()
	hasAdmin = not hasAdmin
    if hasAdmin then -- on
        ESX.ShowAdvancedNotification("Admin Mode", "", "Mode Administrateur Désactiver\nVotre Grade:~g~ user ~s~", "CHAR_MP_FM_CONTACT", 7)
        TriggerEvent('s_MenuF5:offAdmin')
        EndScaleformMovieMethod()
        EndScaleformMovieMethodReturn()
    elseif not hasAdmin then -- off
        ESX.ShowAdvancedNotification("Admin Mode", "", "Mode Administrateur Activé\nVotre Grade: ~g~" ..playergroup.. "~s~", "CHAR_MP_FM_CONTACT", 7)
        TriggerEvent('s_MenuF5:onAdmin')
	end
end

function ShowInfo(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end

function notification(msg)
    local texturnotif = 'CHAR_LESTER_DEATHWISH'
    local playername = GetPlayerName(PlayerId())
    TriggerClientEvent('esx:showAdvancedNotification', source, 'title', 'subject', 'msg', 'CHAR_AMMUNATION', 3)
    ESX.ShowAdvancedNotification('Staff', playername , msg, texturnotif, 7)
    UnregisterPedheadshot(mugshot)
end

function RequestTexture(texture)
	RequestStreamedTextureDict(texture)
	while not HasStreamedTextureDictLoaded(texture) do Citizen.Wait(0) end
	SetStreamedTextureDictAsNoLongerNeeded(texture)
end

RegisterNetEvent("s_admin:freeze_player")
AddEventHandler("s_admin:freeze_player", function ()
    local Source = source

    if Source ~= "" then
        if tonumber(Source) > 64 then
            freeze = not freeze

            local local_ped = GetPlayerPed(-1)
        
            FreezeEntityPosition(local_ped, freeze)
        end
    end
end)

local Administration = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {118, 0, 0}, Title = "Administration"},
	Data = { currentMenu = "Administration", "" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
			if btn == "Options Joueurs" then
                OpenMenu('Options Joueurs')
            elseif btn == "Mon Joueurs" then
                OpenMenu('Mon Joueurs')
            elseif btn == "Autre Options" then
                OpenMenu('Autre Options')
            elseif btn == "Options Développeurs" then
                OpenMenu('Options Développeurs')
            elseif btn == "Options Véhicules" then
                OpenMenu('Options Véhicules')
            elseif btn == "Options Monde" then
                OpenMenu('Options Monde')
            elseif btn == "Invincible" then
                admin_mode_invincible()
            elseif btn == "Visibilité" then
                admin_mode_invisible()
            elseif btn == "Réanimer" then
                TriggerEvent('esx_ambulancejob:revive', source)
            elseif btn == "Créer un véhicule" then
                admin_spawn_vehicule()
            elseif btn == "Réparer le moteur" then
                admin_vehicule_repair()
            elseif btn == "Crocheter le véhicule" then
				if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
					Citizen.Wait(1000)
					ClearPedTasksImmediately(playerPed)

					SetVehicleDoorsLocked(vehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(vehicle, false)
					ESX.ShowNotification('véhicule ~g~déverouillé~s~')
                end
            elseif btn == "Téléporter sur un point" then
                admin_tp_marqueur()
            elseif btn == "Afficher les gamertags" then
                admin_gamertags()
            elseif btn == "Afficher les coordonnées" then
                admin_coords()
            elseif btn == "Envoyer un message privé" then
                local message = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

                if message ~= nil then
                    message = tonumber(message)
                    
                    if type(message) == 'number' then
                        local msg = KeyboardInput("SID_BOX_ID", 'Message (200 Caractères Maximum):', "", 200)
                        TriggerServerEvent('s_admin:messageprive', message, msg)
                    end
                end
            elseif btn == "Se téléporter sur le joueur" then
                local iftp = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

                if iftp ~= nil then
                    iftp = tonumber(iftp)
                    
                    if type(iftp) == 'number' then
                        SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(iftp))))
                    end
                end
            elseif btn == "Téléporter le joueur sur vous" then
                local tpajoueur = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

                if tpajoueur ~= nil then
                    tpajoueur = tonumber(tpajoueur)
                    
                    if type(tpajoueur) == 'number' then
                        SetEntityCoords(GetPlayerPed(GetPlayerFromServerId(tpajoueur)), GetEntityCoords(PlayerPedId()))
                    end
                end
            elseif btn == "Give un Objet" then
                local giveid = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

                if giveid ~= nil then
                    giveid = tonumber(giveid)
                    
                    if type(giveid) == 'number' then
                        local giveitem = KeyboardInput("SID_BOX_ID", 'Nom de l\'item (8 Caractères Maximum):', "", 8)

                        if giveitem ~= nil then
                            giveitem = tostring(giveitem)
                            
                            if type(giveitem) == 'string' then
                                local givecount = KeyboardInput("SID_BOX_ID", 'Nombre d\'Item (8 Caractères Maximum):', "", 8)

                                if givecount ~= nil then
                                    givecount = tonumber(givecount)
                                    
                                    if type(givecount) == 'number' then
                                        TriggerServerEvent('s_admin:giveobject', giveid, giveitem, givecount)
                                    end
                                end
                            end
                        end
                    end
                end
            elseif btn == "Réanimer le joueur" then
                local revive = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

                if revive ~= nil then
                    revive = tonumber(revive)
                    
                    if type(revive) == 'number' then
                        TriggerEvent('esx_ambulancejob:revive', (GetPlayerPed(GetPlayerFromServerId(revive))))
                    end
                end
            elseif btn == "Freeze le joueur" then
                local freezeif = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

                if freezeif ~= nil then
                    freezeif = tonumber(freezeif)
                    
                    if type(freezeif) == 'number' then
                        TriggerServerEvent("s_admin:freeze", freezeif)
                    end
                end
            elseif btn == "Avertir le joueur" then
                local avertird = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

                if avertird ~= nil then
                    avertird = tonumber(avertird)
                    
                    if type(avertird) == 'number' then
                        local msgavert = KeyboardInput("SID_BOX_ID", 'Message (100 Caractères Maximum):', "", 100)
                        local texturnotifavert = 'CHAR_LESTER_DEATHWISH'
                        ESX.ShowAdvancedNotification('~r~Avertissement du Staff~s~', GetPlayerServerId(avertird), msgavert, texturnotifavert, 7)
                        TriggerServerEvent("s_admin:avertissement", avertird, msgavert)
                    end
                end
            elseif btn == "Kick le joueur" then
                local kickjoueur = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

                if kickjoueur ~= nil then
                    kickjoueur = tonumber(kickjoueur)
                    
                    if type(kickjoueur) == 'number' then
                        local msgkick = KeyboardInput("SID_BOX_ID", 'Message (100 Caractères Maximum):', "", 100)
                        TriggerServerEvent('s_admin:kick', kickjoueur, msgkick)
                    end
                end
            elseif btn == "Ban le joueur" then
                local banjoueur = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

                if banjoueur ~= nil then
                    banjoueur = tonumber(banjoueur)
                    
                    if type(banjoueur) == 'number' then
                        local msgban = KeyboardInput("SID_BOX_ID", 'Message (100 Caractères Maximum):', "", 100)
                        TriggerServerEvent('s_admin:ban', banjoueur, msgban)
                    end
                    if type(banjoueur) == 'perm' then
                        local msgbanperm = KeyboardInput("SID_BOX_ID", 'Message (100 Caractères Maximum):', "", 100)
                        TriggerServerEvent('s_admin:banperm', banpermjoueur, msgbanperm)
                    end
                end
            elseif btn == "Give de l'argent" then
                local idcash = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

                if idcash ~= nil then
                    idcash = tonumber(idcash)
                    
                    if type(idcash) == 'number' then
                        local amount = KeyboardInput("SID_BOX_ID", 'Montant (8 Caractères Maximum):', "", 8)
                        TriggerServerEvent('s_admin:givecash', amount, idcash)
                    end
                end
            elseif btn == "Give de l'argent en banque" then
                local idbank = KeyboardInput("SID_BOX_ID", 'Montant (8 Caractères Maximum):', "", 8)

                if idbank ~= nil then
                    idbank = tonumber(idbank)
                    
                    if type(idbank) == 'number' then
                        local amount = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)
                        TriggerServerEvent('s_admin:givebank', amount, idbank)
                    end
                end
            elseif btn == "Give de l'argent sale" then
                local idsale = KeyboardInput("SID_BOX_ID", 'Montant (8 Caractères Maximum):', "", 8)

                if idsale ~= nil then
                    idsale = tonumber(idsale)
                    
                    if type(idsale) == 'number' then
                        local amount = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)
                        TriggerServerEvent('s_admin:givesale', amount, idsale)
                    end
                end
            elseif btn == "Give une arme" then
                local idarme = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

                if idarme ~= nil then
                    idarme = tonumber(idarme)
                    
                    if type(idarme) == 'number' then
                        local weaponName = KeyboardInput("SID_BOX_ID", 'Nom de l\'arme exemple: WEAPON_PISTOL (30 Caractères Maximum):', "", 30)
                        local armemun = KeyboardInput("SID_BOX_ID", 'Nombre de munitions (30 Caractères Maximum):', "", 30)
                        TriggerServerEvent('s_admin:givearme', weaponName, idarme, armemun)
                    end
                end
            elseif btn == "Changer de job" then
                local idjob = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

                if idjob ~= nil then
                    idjob = tonumber(idjob)
                    
                    if type(idjob) == 'number' then
                        local jobname = KeyboardInput("SID_BOX_ID", 'Nom du job (30 Caractères Maximum):', "", 30)
                        local gradename = KeyboardInput("SID_BOX_ID", 'Numéro du grade (30 Caractères Maximum):', "", 30)
                        TriggerServerEvent('s_admin:setjob', idjob, jobname, gradename)
                    end
                end
            elseif btn == "Changer d'organisation" then
                local idorg = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

                if idorg ~= nil then
                    idorg = tonumber(idorg)
                    
                    if type(idorg) == 'number' then
                        local orgname = KeyboardInput("SID_BOX_ID", 'Nom du l\'organisation (30 Caractères Maximum):', "", 30)
                        local gradeorg = KeyboardInput("SID_BOX_ID", 'Numéro du grade (30 Caractères Maximum):', "", 30)
                        TriggerServerEvent('s_admin:setorg', idorg, orgname, gradeorg)
                    end
                end
            elseif btn == "~r~Fermer le Menu~s~" then
                self:CloseMenu()
            elseif btn == "~r~Retour~s~" then
                self:Back()
	    end
    end,
},
	Menu = {
        ["Administration"] = {
            b = {
                {name = "Options Joueurs", ask = ">", askX = true},
                {name = "Mon Joueurs", ask = ">", askX = true},
                {name = "Options Véhicules", ask = ">", askX = true},
                {name = "Options Monde", ask = ">", askX = true},
                {name = "Autre Options", ask = ">", askX = true},
                {name = "Options Développeurs", ask = ">", askX = true},
                {name = "~r~Fermer le Menu~s~", ask = ">", askX = true}
            }
        },
        ["Mon Joueurs"] = {
            b = {
                {name = "Invincible", checkbox = false},
                {name = "Visibilité", checkbox = false},
                {name = "Noclip", checkbox = true},
                {name = "Réanimer", ask = ">", askX = true},
                {name = "~r~Retour~s~", ask = "", askX = true}
            }
        },
        ["Options Joueurs"] = {
            b = {
                {name = "Envoyer un message privé", ask = ">", askX = true},
                {name = "Se téléporter sur le joueur", ask = ">", askX = true},
                {name = "Téléporter le joueur sur vous", ask = ">", askX = true},
                {name = "Changer de job", ask = ">", askX = true},
                {name = "Changer d'organisation", ask = ">", askX = true},
                {name = "Give de l'argent", ask = ">", askX = true},
                {name = "Give de l'argent en banque", ask = ">", askX = true},
                {name = "Give de l'argent sale", ask = ">", askX = true},
                {name = "Give une arme", ask = ">", askX = true},
                {name = "Réanimer le joueur", ask = ">", askX = true},
                {name = "Freeze le joueur", ask = ">", askX = true},
                {name = "Avertir le joueur", ask = ">", askX = true},
                {name = "Kick le joueur", ask = ">", askX = true},
                {name = "Ban le joueur", ask = ">", askX = true},
                {name = "~r~Retour~s~", ask = "", askX = true}
            }
        },
        ["Autre Options"] = {
            b = {
                {name = "Afficher les gamertags", checkbox = false},
                {name = "~r~Retour~s~", ask = "", askX = true}
            }
        },
        ["Options Développeurs"] = {
            b = {
                {name = "Afficher les coordonnées", checkbox = false},
                {name = "~r~Retour~s~", ask = "", askX = true}
            }
        },
        ["Options Véhicules"] = {
            b = {
                {name = "Créer un véhicule", ask = ">", askX = true},
                {name = "Réparer le moteur", ask = ">", askX = true},
                {name = "Crocheter le véhicule", ask = ">", askX = true},
                {name = "~r~Retour~s~", ask = "", askX = true}
            }
        },
        ["Options Monde"] = {
            b = {
                {name = "Téléporter sur un point", ask = ">", askX = true},
                {name = "~r~Retour~s~", ask = "", askX = true}
            }
        }
	}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not hasAdmin then
            --ESX.ShowHelpNotification('~INPUT_DROP_AMMO~ Ouvrir le Menu')
            if IsControlJustPressed(1, 57) then
                CreateMenu(Administration)
            end
		end
	end
end)

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, "", inputText, "", "", "", maxLength)
	blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
		blockinput = false
        return result
    else
        Citizen.Wait(500)
		blockinput = false
        return nil
    end
end

function LoadingPrompt(loadingText, spinnerType)

    if IsLoadingPromptBeingDisplayed() then
        RemoveLoadingPrompt()
    end

    if (loadingText == nil) then
        BeginTextCommandBusyString(nil)
    else
        BeginTextCommandBusyString("STRING");
        AddTextComponentSubstringPlayerName(loadingText);
    end

    EndTextCommandBusyString(spinnerType)
end

function setUniform(value, plyPed)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:getSkin', function(skina)
			if value == 'tshirt' then
				startAnimAction("clothingtie", "try_tie_neutral_a")
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.tshirt_1 ~= skina.tshirt_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['tshirt_1'] = skin.tshirt_1, ['tshirt_2'] = skin.tshirt_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['tshirt_1'] = 15, ['tshirt_2'] = 0})
				end
			elseif value == 'torso' then
					startAnimAction("clothingtie", "try_tie_neutral_a")
					Citizen.Wait(1000)
					ClearPedTasks(plyPed)
			if skin.torso_1 ~= skina.torso_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['torso_1'] = skin.torso_1, ['torso_2'] = skin.torso_2, ['arms'] = skin.arms})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['torso_1'] = 15, ['torso_2'] = 0, ['arms'] = 15})
				end
			elseif value == 'pants' then
				if skin.pants_1 ~= skina.pants_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = skin.pants_1, ['pants_2'] = skin.pants_2})
				else
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = 61, ['pants_2'] = 1})
					elseif skin.sex == 1 then
						TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = 15, ['pants_2'] = 0})
					end
				end
			elseif value == 'shoes' then
				if skin.shoes_1 ~= skina.shoes_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = skin.shoes_1, ['shoes_2'] = skin.shoes_2})
				else
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = 34, ['shoes_2'] = 0})
					elseif skin.sex == 1 then
						TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = 35, ['shoes_2'] = 0})
					end
				end
			elseif value == 'bag' then
				if skin.bags_1 ~= skina.bags_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['bags_1'] = skin.bags_1, ['bags_2'] = skin.bags_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['bags_1'] = 0, ['bags_2'] = 0})
				end
			elseif value == 'bproof' then
				startAnimAction("clothingtie", "try_tie_neutral_a")
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.bproof_1 ~= skina.bproof_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['bproof_1'] = skin.bproof_1, ['bproof_2'] = skin.bproof_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['bproof_1'] = 0, ['bproof_2'] = 0})
				end
			elseif value == 'watches' then
				startAnimAction("clothingtie", "try_tie_neutral_a")
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.watches_1 ~= skina.watches_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['watches_1'] = skin.watches_1, ['watches_2'] = skin.watches_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['watches_1'] = -1, ['watches_2'] = -1})
				end
			elseif value == 'bracelet' then
				startAnimAction("clothingtie", "try_tie_neutral_a")
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.bracelets_1 ~= skina.bracelets_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['bracelets_1'] = skin.bracelets_1})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['bracelets_1'] = -1})
				end
            elseif value == 'masque' then
                startAnimAction("clothingtie", "try_tie_neutral_a")
                Citizen.Wait(1000)
                ClearPedTasks(plyPed)

                if skin.mask_1 ~= skina.mask_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['mask_1'] = skin.mask_1, ['mask_2'] = skin.mask_2})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['mask_1'] = 0, ['mask_2'] = 0 })
                end
            elseif value == 'lunettes' then
                startAnimAction("clothingtie", "try_tie_neutral_a")
                Citizen.Wait(1000)
                ClearPedTasks(plyPed)

                if skin.glasses_1 ~= skina.glasses_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['glasses_1'] = skin.glasses_1})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['glasses_1'] = -1})
                end
            elseif value == 'chapeau' then
                startAnimAction("clothingtie", "try_tie_neutral_a")
                Citizen.Wait(1000)
                ClearPedTasks(plyPed)

                if skin.helmet_1 ~= skina.helmet_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, {['helmet_1'] = skin.helmet_1})
                else
                    TriggerEvent('skinchanger:loadClothes', skina, {['helmet_1'] = -1})
                end
            end
		end)
	end)
end

function startAnimAction(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(plyPed, lib, anim, 8.0, 1.0, -1, 49, 0, false, false, false)
	end)
end

function admin_tp_sur_joueur()
	local plyId = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

	if plyId ~= nil then
		plyId = tonumber(plyId)
		
		if type(plyId) == 'number' then
			local targetPlyCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(plyId)))
			SetEntityCoords(plyPed, targetPlyCoords)
		end
	end
end

function tp_joueur_sur_moi()
	local plyId = KeyboardInput("SID_BOX_ID", 'ID du Joueur (8 Caractères Maximum):', "", 8)

	if plyId ~= nil then
		plyId = tonumber(plyId)
		
		if type(plyId) == 'number' then
			local plyPedCoords = GetEntityCoords(plyPed)
			TriggerServerEvent('s_MenuF5:Admin_BringS', plyId, plyPedCoords)
		end
	end
end

RegisterNetEvent('s_MenuF5:Admin_BringC')
AddEventHandler('s_MenuF5:Admin_BringC', function(plyPedCoords)
	SetEntityCoords(plyPed, plyPedCoords)
end)

function tp_sur_coords()
	local pos = KeyboardInput("SID_BOX_XYZ", 'Position XYZ (50 Caractères Maximum):', "", 50)

	if pos ~= nil and pos ~= '' then
		local _, _, x, y, z = string.find(pos, "([%d%.]+) ([%d%.]+) ([%d%.]+)")
				
		if x ~= nil and y ~= nil and z ~= nil then
			SetEntityCoords(plyPed, x + .0, y + .0, z + .0)
		end
	end
end

function admin_no_clip()
	noclip = not noclip

	if noclip then
		SetEntityInvincible(plyPed, true)
		SetEntityVisible(plyPed, false, false)
		ESX.ShowNotification('NoClip ~g~Activé')
	else
		SetEntityInvincible(plyPed, false)
		SetEntityVisible(plyPed, true, false)
		ESX.ShowNotification('NoClip ~r~Désactivé')
	end
end

function admin_mode_invincible()
	godmode = not godmode

    if godmode then
		SetEntityInvincible(plyPed, true)
		ESX.ShowNotification('Mode invincible ~g~Activé')
	else
		SetEntityInvincible(plyPed, false)
		ESX.ShowNotification('Mode invincible ~r~Désactivé')
	end
end

function admin_mode_invisible()
	invisible = not invisible

	if invisible then
		SetEntityVisible(plyPed, false, false)
		ESX.ShowNotification('Mode fantôme ~g~activé')
	else
		SetEntityVisible(plyPed, true, false)
		ESX.ShowNotification('Mode fantôme ~r~désactivé')
	end
end

function admin_vehicule_repair()
	local car = GetVehiclePedIsIn(plyPed, false)

	SetVehicleFixed(car)
	SetVehicleDirtLevel(car, 0.0)
end

function admin_spawn_vehicule()
	local vehicleName = KeyboardInput("SID_BOX_VEHICLE_NAME", 'Nom du Véhicule (50 Caractères Maximum):', "", 50)

	if vehicleName ~= nil then
		vehicleName = tostring(vehicleName)
		
		if type(vehicleName) == 'string' then
			local car = GetHashKey(vehicleName)
				
			Citizen.CreateThread(function()
				RequestModel(car)

				while not HasModelLoaded(car) do
					Citizen.Wait(0)
				end

				local x, y, z = table.unpack(GetEntityCoords(plyPed, true))

				local veh = CreateVehicle(car, x, y, z, 0.0, true, false)
				local id = NetworkGetNetworkIdFromEntity(veh)

				SetEntityVelocity(veh, 2000)
				SetVehicleOnGroundProperly(veh)
				SetVehicleHasBeenOwnedByPlayer(veh, true)
				SetNetworkIdCanMigrate(id, true)
				SetVehRadioStation(veh, "OFF")
				SetPedIntoVehicle(plyPed, veh, -1)
			end)
		end
	end
end

function admin_give_argent()
	local amount = KeyboardInput("SID_BOX_AMOUNT", 'Montant (8 Caractères Maximum):', "", 8)

	if amount ~= nil then
		amount = tonumber(amount)
		
		if type(amount) == 'number' then
			TriggerServerEvent('s_MenuF5:Admin_giveCash', amount)
		end
	end
end

function admin_give_bank()
	local amount = KeyboardInput("SID_BOX_AMOUNT", 'Montant (8 Caractères Maximum):', "", 8)

	if amount ~= nil then
		amount = tonumber(amount)
		
		if type(amount) == 'number' then
			TriggerServerEvent('s_MenuF5:Admin_giveBank', amount)
		end
	end
end

function admin_give_argentsale()
	local amount = KeyboardInput("SID_BOX_AMOUNT", 'Montant (8 Caractères Maximum):', "", 8)

	if amount ~= nil then
		amount = tonumber(amount)
		
		if type(amount) == 'number' then
			TriggerServerEvent('s_MenuF5:Admin_giveDirtyMoney', amount)
		end
	end
end

function admin_show_nom_joueur()
	showname = not showname
end

function admin_tp_marqueur()
	local WaypointHandle = GetFirstBlipInfoId(8)

	if DoesBlipExist(WaypointHandle) then
		local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

		for height = 1, 1000 do
			SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

			local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

			if foundGround then
				SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

				break
			end

			Citizen.Wait(0)
		end

		ESX.ShowNotification('Téléporté sur le marqueur !')
	else
		ESX.ShowNotification('Pas de marqueur sur la carte !')
	end
end

function changer_skin()
	Citizen.Wait(100)
	TriggerEvent('esx_skin:openSaveableMenu', source)
end

function save_skin()
	TriggerEvent('esx_skin:requestSaveSkin', source)
end

local MenuF5 = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Menu intéractions" },
	Data = { currentMenu = "Intéraction", "" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
			if btn == "Me concernants" then
				OpenMenu('Me concernants  ')
			elseif btn == "Mes Vêtements" then
                OpenMenu('Vêtements')
            elseif btn == "Annuler l'appel" then
				TriggerEvent('call:cancelCall')
		    elseif btn == "Options" then
                OpenMenu('Mes Options')
            elseif btn == "Portefeuille" then
			    OpenMenu('Portefeuille  ')
	        elseif btn == "Mes Cartes d'Identité" then
                OpenMenu('Mes Cartes d\'Identité  ')
            elseif btn == "Regarder sa Carte d'Identité:" then
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
            elseif btn == "Regarder son Permis" then
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
            elseif btn == "Regarder son PPA" then
                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
            elseif btn == "Montrer sa Carte d'Identité" then
                closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestDistance ~= -1 and closestDistance <= 3.0 then
					TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
				else
					ESX.ShowNotification('Personne n\'est au alentour !')
				end
            elseif btn == "Montrer son Permis" then
                closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestDistance ~= -1 and closestDistance <= 3.0 then
					TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
				else
					ESX.ShowNotification('Personne n\'est au alentour')
				end
            elseif btn == "Montrer son PPA" then
                closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestDistance ~= -1 and closestDistance <= 3.0 then
					TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
				else
					ESX.ShowNotification('Personne n\'est au alentour')
				end
            elseif btn == "~r~Fermer le Menu~s~" then
                self:CloseMenu()
            elseif slide == 1 and btn == "Gérer votre Argent" then
                ESX.ShowAdvancedNotification("Information - Argent", "", "Vous avez ~g~" ..ESX.Math.GroupDigits(ESX.PlayerData.money).. " $ ~s~ en Argent ~g~Liquide~s~", "CHAR_BANK_MAZE", 9)
            elseif slide == 2 and btn == "Gérer votre Argent" then
                local quantity = KeyboardInput('SID_BOX_AMOUNT', 'Saisissez le Montant', '', 8)

                if quantity ~= nil then
                    local post = true
                    quantity = tonumber(quantity)
    
                    if type(quantity) == 'number' then
                        quantity = ESX.Math.Round(quantity)
    
                        if quantity <= 0 then
                            post = false
                        end
                    end
    
                    local foundPlayers = false
                    closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        foundPlayers = true
                    end
    
                    if foundPlayers == true then
                        local closestPed = GetPlayerPed(closestPlayer)
    
                        if not IsPedSittingInAnyVehicle(closestPed) then
                            if post == true then
                                    TriggerServerEvent('esx:giveItem', GetPlayerServerId(closestPlayer), 'item_money', 'money', quantity)
                                    self:CloseMenu()
                            else
                                ESX.ShowNotification('Montant Invalide')
                            end
                        else
                                ESX.ShowNotification('Impossible de donner de l\'argent dans un véhicule')
                        end
                    else
                        ESX.ShowNotification('Personne n\'est au alentour !')
                    end
                end
            elseif slide == 1 and btn == "Gérer votre Argent Sale" then
                for i = 1, #ESX.PlayerData.accounts, 1 do
                    if ESX.PlayerData.accounts[i].name == 'black_money' then
                        ESX.ShowAdvancedNotification("Information - Argent Sale", "", "Vous avez ~r~" ..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money).. " $~s~ en Argent ~r~Sale~s~", "CHAR_BANK_MAZE", 9)
                    end
                end
            elseif slide == 2 and btn == "Gérer votre Argent Sale" then
                local quantity = KeyboardInput('SID_BOX_AMOUNT', 'Saisissez le Montant', '', 8)

                if quantity ~= nil then
                    local post = true
                    quantity = tonumber(quantity)
    
                    if type(quantity) == 'number' then
                        quantity = ESX.Math.Round(quantity)
    
                        if quantity <= 0 then
                            post = false
                        end
                    end
    
                    local foundPlayers = false
                    closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        foundPlayers = true
                    end
    
                    if foundPlayers == true then
                        local closestPed = GetPlayerPed(closestPlayer)
    
                        if not IsPedSittingInAnyVehicle(closestPed) then
                            if post == true then
                                    TriggerServerEvent('esx:giveItem', GetPlayerServerId(closestPlayer), 'item_account', 'black_money', quantity)
                                    self:CloseMenu()
                            else
                                ESX.ShowNotification('Montant Invalide')
                            end
                        else
                                ESX.ShowNotification('Impossible de donner de l\'argent sale dans un véhicule')
                        end
                    else
                        ESX.ShowNotification('Personne n\'est au alentour')
                    end
                end
            elseif slide == 1 and btn == "Voir votre Métier" then
                ESX.ShowAdvancedNotification("Information - Métier", "", "Votre Métier est ~g~" ..ESX.PlayerData.job.label.. "~s~ et votre grade est ~g~" ..ESX.PlayerData.job.grade_label.. "~s~", "CHAR_LIFEINVADER", 9)
            elseif slide == 2 and btn == "Voir votre Métier" then
                if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
                    OpenMenu('Action Patron')
                else
                    ESX.ShowNotification('~r~Vous devez être le Patron d\'une Entreprise pour Accéder à cette Option !~s~')
                end
            elseif slide == 1 and btn == "Voir votre Organisation" then
                ESX.ShowAdvancedNotification("Information - Organisation", "", "Votre Organisation est ~g~" ..ESX.PlayerData.org.label.. "~s~", "CHAR_GANGAPP", 9)
            elseif slide == 2 and btn == "Voir votre Organisation" then
                if ESX.PlayerData.org ~= nil and ESX.PlayerData.org.grade_name == 'boss' then
                    OpenMenu('Action Boss')
                else
                    ESX.ShowNotification('~r~Vous devez être le Boss d\'une Organisation pour Accéder à cette Option !~s~')
                end
            elseif slide == 1 and btn == "Argent Entreprise" then
                local amount = KeyboardInput("SID_BOX_AMOUNT", 'Montant (8 Caractères Maximum):', "", 8)
                local society = ESX.PlayerData.job.name
                if amount ~= nil then
                    amount = tonumber(amount)
                    
                    if type(amount) == 'number' then
                        TriggerServerEvent('esx_society:depositMoney', society, amount)
                        ESX.ShowNotification('Vous venez de déposer ~g~' ..amount.. ' $~s~ sur le compte Entreprise ~g~' ..ESX.PlayerData.job.label.. '~s~')
                    end
                end
            elseif slide == 2 and btn == "Argent Entreprise" then
                local amount = KeyboardInput("SID_BOX_AMOUNT", 'Montant (8 Caractères Maximum):', "", 8)
                local society = ESX.PlayerData.job.name
                if amount ~= nil then
                    amount = tonumber(amount)
                    
                    if type(amount) == 'number' then
                        TriggerServerEvent('esx_society:withdrawMoney', society, amount)
                        ESX.ShowNotification('Vous venez de retirez ~r~' ..amount.. ' $~s~ sur le compte Entreprise ~g~' ..ESX.PlayerData.job.label.. '~s~')
                    end
                end
            elseif slide == 1 and btn == "Argent Organisation" then
                local amount = KeyboardInput("SID_BOX_AMOUNT", 'Montant (8 Caractères Maximum):', "", 8)
                local organisation = ESX.PlayerData.org.name
                if amount ~= nil then
                    amount = tonumber(amount)
                    
                    if type(amount) == 'number' then
                        TriggerServerEvent('esx_organisation:depositMoney', organisation, amount)
                        ESX.ShowNotification('Vous venez de déposer ~g~' ..amount.. ' $~s~ sur le compte Organisation ~g~' ..ESX.PlayerData.org.label.. '~s~')
                    end
                end
            elseif slide == 2 and btn == "Argent Organisation" then
                local amount = KeyboardInput("SID_BOX_AMOUNT", 'Montant (8 Caractères Maximum):', "", 8)
                local organisation = ESX.PlayerData.org.name
                if amount ~= nil then
                    amount = tonumber(amount)
                    
                    if type(amount) == 'number' then
                        TriggerServerEvent('esx_organisation:withdrawMoney', organisation, amount)
                        ESX.ShowNotification('Vous venez de retirez ~r~' ..amount.. ' $~s~ sur le compte Organisation ~g~' ..ESX.PlayerData.org.label.. '~s~')
                    end
                end
            elseif btn == "Action Patron" then
                local society = ESX.PlayerData.job.name
                TriggerEvent('esx_society:openBossMenu', society, function (data, menu)
                    menu.close()
                end, {wash = false})
                self:CloseMenu()
            elseif btn == "Action Boss" then
                local organisation = ESX.PlayerData.org.name
                TriggerEvent('esx_organisation:openBossMenu', organisation, function (data, menu)
                    menu.close()
                end, {wash = false})
                self:CloseMenu()
            elseif btn == "Gestion du Véhicule" then
                if IsPedSittingInAnyVehicle(PlayerPedId()) then
                    self:CloseMenu()
                    ExecuteCommand('+controlcar')
                else
                    ESX.ShowNotification('Vous devez être dans un ~r~Véhicule !~s~')
                end
            elseif btn == "Animation" then
                functionCheckBox2()
            elseif slide == 1 and btn == "Gérer le Moteur" then
                local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), true, false)   
            elseif slide == 2 and btn == "Gérer le Moteur" then
                local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), false, false)
            elseif slide == 1 and btn == "Gérer les Portes" then
                local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 0) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 0, false)
                    else
                      SetVehicleDoorOpen(playerVeh, 0, false)
                      frontleft = true        
                   end
                end
            elseif slide == 2 and btn == "Gérer les Portes" then
                local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 1, false)
                    else
                      SetVehicleDoorOpen(playerVeh, 1, false)
                      frontleft = true        
                   end
                end
            elseif slide == 3 and btn == "Gérer les Portes" then
                local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 2) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 2, false)
                    else
                      SetVehicleDoorOpen(playerVeh, 2, false)
                      frontleft = true        
                   end
                end
            elseif slide == 4 and btn == "Gérer les Portes" then
                local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 3) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 3, false)
                    else
                      SetVehicleDoorOpen(playerVeh, 3, false)
                      frontleft = true        
                   end
                end
            elseif slide == 5 and btn == "Gérer les Portes" then
                local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 4) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 4, false)
                    else
                      SetVehicleDoorOpen(playerVeh, 4, false)
                      frontleft = true        
                   end
                end
            elseif slide == 6 and btn == "Gérer les Portes" then
                local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 5) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 5, false)
                    else
                      SetVehicleDoorOpen(playerVeh, 5, false)
                      frontleft = true        
                   end
                end
            elseif slide == 7 and btn == "Gérer les Portes" then
                local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 5, false)        
                      SetVehicleDoorShut(playerVeh, 4, false)
                      SetVehicleDoorShut(playerVeh, 3, false)
                      SetVehicleDoorShut(playerVeh, 2, false)
                      SetVehicleDoorShut(playerVeh, 1, false)
                      SetVehicleDoorShut(playerVeh, 0, false)         
                    else
                      SetVehicleDoorOpen(playerVeh, 5, false)        
                      SetVehicleDoorOpen(playerVeh, 4, false)
                      SetVehicleDoorOpen(playerVeh, 3, false)
                      SetVehicleDoorOpen(playerVeh, 2, false)
                      SetVehicleDoorOpen(playerVeh, 1, false)
                      SetVehicleDoorOpen(playerVeh, 0, false)  
                      frontleft = true        
                   end
                end
            elseif btn == "~r~Retour~s~" then
                self:Back()
            elseif btn == "Torse" then
                setUniform('torso', plyPed)
            elseif btn == "T-Shirt" then
                setUniform('tshirt', plyPed)
            elseif btn == "Pantalon" then
                setUniform('pants', plyPed)
            elseif btn == "Chaussures" then
                setUniform('shoes', plyPed)
            elseif btn == "Sac à Dos" then
                setUniform('bag', plyPed)
            elseif btn == "Gilet par Balle" then
                setUniform('bproof', plyPed)
            elseif btn == "Montre" then
                setUniform('watches', plyPed)
            elseif btn == "Bracelet" then
                setUniform('bracelet', plyPed)
            elseif btn == "Masque" then
                setUniform('masque', plyPed)
            elseif btn == "Lunettes" then
                setUniform('lunettes', plyPed)
            elseif btn == "Chapeau" then
                setUniform('chapeau', plyPed)
            elseif btn == "S'endormir/Se Reveiller" then
                Ragdoll()
            elseif btn == "Mode Cinématique" then
                openCinematique()
            elseif btn == "Synchroniser Votre Personnage" then
                Citizen.Wait(0)
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                ESX.ShowNotification('✅ Synchronisation effectuée.')
                self:CloseMenu()
            elseif btn == "Optimiser Vos FPS" then
                DoScreenFadeIn(2000) -- Ecran Noir
                LoadingPrompt('Optimisation en cours...')
                DoScreenFadeOut(2000)  -- Ecran Noir
                Citizen.Wait(2000)
                DoScreenFadeIn(1500) -- Ecran Noir
                ClearAllBrokenGlass()
                ClearAllHelpMessages()
                LeaderboardsReadClearAll()
                ClearBrief()
                ClearGpsFlags()
                ClearPrints()
                ClearSmallPrints()
                ClearReplayStats()
                LeaderboardsClearCacheData()
                ClearFocus()
                ClearHdArea()
                ClearHelp()
                ClearNotificationsPos()
                ClearPedInPauseMenu()
                ClearFloatingHelp()
                ClearGpsPlayerWaypoint()
                ClearGpsRaceTrack()
                ClearReminderMessage()
                ClearThisPrint()
                Citizen.Wait(2090)
                RemoveLoadingPrompt()
                Citizen.Wait(100)
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                ESX.ShowAdvancedNotification('Optimisation FPS', '', 'Optimisation ~g~effectuée~g~', 'CHAR_MP_FM_CONTACT', 8)
                self:CloseMenu()
            elseif btn == "Filtre" then
                OpenMenu('Filtre Disponible')
            elseif btn == "Normal" then
                SetTimecycleModifier('')
            elseif btn == "Vue & lumières améliorées" then
                SetTimecycleModifier('tunnel')
            elseif btn == "Couleurs amplifiées" then
                SetTimecycleModifier('rply_saturation')
            elseif btn == "Noir & blancs" then
                SetTimecycleModifier('rply_saturation_neg')
            elseif btn == "Admin Mode" then
                if playergroup == 'mod' or playergroup == 'admin' or playergroup == 'superadmin' then
                    onAdminCheck()
                else
                    ESX.ShowNotification('Vous n\'êtes pas membre du ~r~staff !~s~')
                end
            elseif btn == "Connaître son ID" then
                ESX.ShowAdvancedNotification("Information - ID", "", "Bonjour ~g~" ..GetPlayerName(PlayerId(-1)).. "~s~ votre ID est le Numéro ~g~" ..GetPlayerServerId(PlayerId(-1))..  "~s~", "CHAR_MP_FM_CONTACT", 7)
            elseif btn == "~r~Faire un ticket aux staff~s~" then
                local sujet = KeyboardInput("SID_BOX_ID", 'Sujet du Ticket (30 Caractères Maximum):', "", 30)

                if sujet ~= nil then
                    sujet = tostring(sujet)
                    
                    if type(sujet) == 'string' then
                        local message = KeyboardInput("SID_BOX_ID", 'Message (200 Caractères Maximum):', "", 200)
                        TriggerServerEvent('s_admin:ticket', sujet, message)
                    end
                end
	    end
    end,
},
	Menu = {
		["Intéraction"] = {
			b = {
				{name = "Me concernants", ask = ">", askX = true},
				{name = "Gestion du Véhicule", ask = ">", askX = true},
				-- {name = "Options", ask = ">", askX = true},
				{name = "~r~Fermer le Menu~s~", ask = "", askX = true}
			}
		},
		
		["Me concernants  "] = {
            b = {
                {name = "Portefeuille", ask = ">", askX = true},
                {name = "Mes Vêtements", ask = ">", askX = true},
                {name = "Annuler l'appel", ask = ">", askX = true},
                {name = "~r~Retour~s~", ask = "", askX = true}
            }
        },

        ["Vêtements"] = {
            b = {
                {name = "Torse", ask = ">", askX = true},
                {name = "T-Shirt", ask = ">", askX = true},
                {name = "Pantalon", ask = ">", askX = true},
                {name = "Chaussures", ask = ">", askX = true},
                {name = "Sac à Dos", ask = ">", askX = true},
                {name = "Gilet par Balle", ask = ">", askX = true},
                {name = "Montre", ask = ">", askX = true},
                {name = "Bracelet", ask = ">", askX = true},
                {name = "Masque", ask = ">", askX = true},
                {name = "Chapeau", ask = ">", askX = true},
                {name = "Lunettes", ask = ">", askX = true},
                {name = "~r~Retour~s~", ask = "", askX = true}
            }
        },

        -- ["Mes Options"] = {
        --     b = {
        --         {name = "S'endormir/Se Reveiller", checkbox = false},
        --         {name = "Mode Cinématique", checkbox = false},
        --         {name = "Filtre", ask = ">", askX = true},
        --         {name = "------------------------", ask = "", askX = true},
        --         {name = "Synchroniser Votre Personnage", ask = ">", askX = true},
        --         {name = "Optimiser Vos FPS", ask = ">", askX = true},
        --         {name = "Connaître son ID", ask = ">", askX = true},
        --         {name = "------------------------", ask = "", askX = true},
        --         {name = "~r~Faire un ticket aux staff~s~", ask = "", askX = true},
        --         {name = "Admin Mode", checkbox = false},
        --         {name = "~r~Retour~s~", ask = "", askX = true}
        --     }
        -- },

        ["Portefeuille  "] = {
            b = {
                {name = "Voir votre Métier", ask = ">", askX = true},
                {name = "Voir votre Organisation", ask = ">", askX = true},
                -- {name = "------------------------", ask = "", askX = true},
                -- {name = "Gérer votre Argent", slidemax = argent},
                -- {name = "Gérer votre Argent Sale", slidemax = argentsale},
                -- {name = "------------------------", ask = "", askX = true},
                -- {name = "Mes Cartes d'Identité", ask = ">", askX = true},
                {name = "~r~Retour~s~", ask = "", askX = true}
            }
        },

        ["Mes Cartes d'Identité  "] = {
            b = {
                {name = "Regarder sa Carte d'Identité:", ask = ">", askX = true},
                {name = "Regarder son Permis", ask = ">", askX = true},
                {name = "Regarder son PPA", ask = ">", askX = true},
                {name = "------------------------", ask = "", askX = true},
                {name = "Montrer sa Carte d'Identité", ask = ">", askX = true},
                {name = "Montrer son Permis", ask = ">", askX = true},
                {name = "Montrer son PPA", ask = ">", askX = true},
                {name = "~r~Retour~s~", ask = "", askX = true}
            }
        },

        ["Action Patron"] = {
            b = {
                {name = "Argent Entreprise", slidemax = argententreprise},
                {name = "Action Patron", ask = ">", askX = true},
                {name = "~r~Retour~s~", ask = "", askX = true}
            }
        },

        ["Action Boss"] = {
            b = {
                {name = "Argent Organisation", slidemax = argentorganisation},
                {name = "Action Boss", ask = ">", askX = true},
                {name = "~r~Retour~s~", ask = "", askX = true}
            }
        },

        -- ["Gestion du véhicule"] = {
        --     b = {
        --         {name = "Gérer le Moteur", slidemax = optionmoteur},
        --         {name = "Gérer les Portes", slidemax = porte},
        --         {name = "~r~Retour~s~", ask = "", askX = true}
        --     }
        -- },

        ["Filtre Disponible"] = {
            b = {
                {name = "Normal", ask = "", askX = true},
                {name = "Vue & lumières améliorées", ask = "", askX = true},
                {name = "Couleurs amplifiées", ask = "", askX = true},
                {name = "Noir & blancs", ask = "", askX = true},
                {name = "~r~Retour~s~", ask = "", askX = true}
            }
        },
	}
}

Citizen.CreateThread(function()
    local scaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
    while not HasScaleformMovieLoaded(scaleform) do
    	Citizen.Wait(0)
    end

    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieMethodParameterString("~INPUT_CONTEXT~")
    PushScaleformMovieMethodParameterString("Ouvrir le Menu")
    PushScaleformMovieMethodParameterInt(5)
    EndScaleformMovieMethod()
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
		for i = 1, 12 do
			EnableDispatchService(i, false)
		end
		SetPlayerWantedLevel(PlayerId(), 0, false)
		SetPlayerWantedLevelNow(PlayerId(), false)
		SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsControlJustPressed(1, 170) then
            CreateMenu(MenuF5)
        end
        if IsControlJustPressed(1, 73) then
            ClearPedTasks(plyPed)
        end
    end
end)

local TPMarker = {
    clavier1 = Keys["LEFTALT"],
	clavier2 = Keys["E"],
}

Citizen.CreateThread(function()
	while true do
		plyPed = PlayerPedId()
		plyVehicle = GetVehiclePedIsIn(plyPed, false)

		if IsControlPressed(1, TPMarker.clavier1) and IsControlJustReleased(1, TPMarker.clavier2) and GetLastInputMethod(2) and playergroup == 'superadmin' and not isDead then
			admin_tp_marqueur()
		end

		if noclip then
			local x, y, z = getPosition()
			local dx, dy, dz = getCamDirection()
			local speed = 1.5

			SetEntityVelocity(plyPed, 0.0001, 0.0001, 0.0001)

			if IsControlPressed(0, 32) then
				x = x + speed * dx
				y = y + speed * dy
				z = z + speed * dz
			end

			if IsControlPressed(0, 269) then
				x = x - speed * dx
				y = y - speed * dy
				z = z - speed * dz
			end

			SetEntityCoordsNoOffset(plyPed, x, y, z, true, true, true)
		end

		if showname then
			for id = 0, 255 do
				if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= plyPed then
					local ped = GetPlayerPed(id)
					local headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, (GetPlayerServerId(id) .. ' - ' .. GetPlayerName(id)), false, false, "", false)
				end
			end
		end
		
		Citizen.Wait(0)
	end
end)

RegisterCommand("debugmouse", function(source, args, rawCommand)
    SetNuiFocus(false)
end, false)
