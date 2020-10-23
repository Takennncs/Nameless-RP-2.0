ESX = nil
local PlayerData              = {}

local isPlayerSpawned = false
local showcoord = false

Config = {}
local playerGroup = nil

local ListPlayer = {}
local ListItem = {}

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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


Admin = {
    actuellementspec = false,
    godmod = false,
    noclip = false,
    supersaut = false,
    staminainfini = false,
    fastrun = false,
    showcoords = false,
    showcrosshair = false
    --nomtete = false
}

function admin_ban()
	TriggerServerEvent("el_bwh:caban")
end

function admin_warn()
	TriggerServerEvent("el_bwh:cawarn")
end

function admin_banlist()
	TriggerServerEvent("el_bwh:cabanlist")
end

function admin_warnlist()
	TriggerServerEvent("el_bwh:cawarnlist")
end

function retournercar()
    local pPed = GetPlayerPed(-1)
    posped = GetEntityCoords(pPed)
    carspawndep = GetClosestVehicle(posped['x'], posped['y'], posped['z'], 10.0,0,70)
	if carspawndep ~= nil then
		platecarspawndep = GetVehicleNumberPlateText(carspawndep)
	end
    local playerCoords = GetEntityCoords(GetPlayerPed(-1))
    playerCoords = playerCoords + vector3(0, 2, 0)
	SetEntityCoords(carspawndep, playerCoords)
end

function SetFuel(vehicle, fuel)
	if type(fuel) == 'number' and fuel >= 0 and fuel <= 100 then
		SetVehicleFuelLevel(vehicle, fuel + 0.0)
		DecorSetFloat(vehicle, Config.FuelDecor, GetVehicleFuelLevel(vehicle))
	end
end

local godmodec = true
function playergodmod()
	godmodec = not godmodec
	local pPed = GetPlayerPed(-1)
	if not godmodec then
		SetEntityInvincible(pPed, true)
		ESX.DrawMissionText("~g~Invincible", 1250)
	elseif godmodec then
		SetEntityInvincible(pPed, false)
		ESX.DrawMissionText("~r~Invincibilité désactivé.", 1250)
	end
end

local invisible = true
function playerinvisible()
	invisible = not invisible
	local pPed = GetPlayerPed(-1)
	if not invisible then
		SetEntityVisible(pPed, false, false)
		ESX.DrawMissionText("~g~Invisible", 1250)
	elseif invisible then
		SetEntityVisible(pPed, true, false)
		ESX.DrawMissionText("~r~Invisibilité désactivé.", 1250)
	end
end

local noclip = false
local noclip_speed = 0.5

function playernoclip()
	noclip = not noclip
	local ped = GetPlayerPed(-1)
	if noclip then -- activé
		SetEntityVisible(ped, false, false)
		ESX.DrawMissionText("~g~Noclip activé", 1250)
	else -- désactivé
		SetEntityVisible(ped, true, false)
		ESX.DrawMissionText("~r~Noclip désactivé", 1250)
	end
end

function getPosition()
	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
	return x,y,z
end

function getCamDirection()
	local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
	local pitch = GetGameplayCamRelativePitch()

	local x = -math.sin(heading*math.pi/180.0)
	local y = math.cos(heading*math.pi/180.0)
	local z = math.sin(pitch*math.pi/180.0)

	local len = math.sqrt(x*x+y*y+z*z)
	if len ~= 0 then
		x = x/len
		y = y/len
		z = z/len
	end

	return x,y,z
end

function isNoclip()
	return noclip
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if noclip then
			local ped = GetPlayerPed(-1)
			local x,y,z = getPosition()
			local dx,dy,dz = getCamDirection()
			local speed = noclip_speed
			SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)
		if IsControlPressed(0,32) then -- MOVE UP
			x = x+speed*dx
			y = y+speed*dy
			z = z+speed*dz
		end
		if IsControlPressed(0,21) then -- Speed
			local speed = 5.5
			x = x+speed*dx
			y = y+speed*dy
			z = z+speed*dz
		end
		if IsControlPressed(0,269) then -- MOVE DOWN
			x = x-speed*dx
			y = y-speed*dy
			z = z-speed*dz
		end
		SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
		end
	end
end)




Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputvehicle == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputvehicle = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputvehicle = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputvehicle = 0
			end
		end
		if inputvehicle == 2 then
		local vehicleidd = GetOnscreenKeyboardResult()

				local car = GetHashKey(vehicleidd)
				
				Citizen.CreateThread(function()
					Citizen.Wait(10)
					RequestModel(car)
					while not HasModelLoaded(car) do
						Citizen.Wait(0)
					end
                    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
					veh = CreateVehicle(car, x,y,z, 0.0, true, false)
					SetEntityVelocity(veh, 2000)
					SetVehicleOnGroundProperly(veh)
					SetVehicleHasBeenOwnedByPlayer(veh,true)
					local id = NetworkGetNetworkIdFromEntity(veh)
					SetNetworkIdCanMigrate(id, true)
					SetVehRadioStation(veh, "OFF")
					SetPedIntoVehicle(GetPlayerPed(-1),  veh,  -1)
					--Notify("Véhicule spawn, bonne route")
				end)
		
        inputvehicle = 0
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputplate == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputplate = 0
			elseif UpdateOnscreenKeyboard() == 1 then
				inputplate = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputplate = 0
			end
		end
		if inputplate == 2 then
		local vehicleplate = GetOnscreenKeyboardResult()

				
				Citizen.CreateThread(function()
					Citizen.Wait(10)
					SetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false), vehicleplate)
				end)
		
			inputplate = 0
		end
	end
end)


function changeplayerskin()
	CloseMenu(force)
	Citizen.Wait(100)
	TriggerEvent('esx_skin:openSaveableMenu', source)
end

function KeyboardInput1(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, "", inputText, "", "", "", maxLength)
	blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(10)
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

function agivemoney()
	local amount = KeyboardInput1("CLIPPY_BOX_AMOUNT", "", "", 8)
	if amount ~= nil then
		amount = tonumber(amount)
		if type(amount) == 'number' then
			TriggerServerEvent('c_admin:givecash', amount)
		end
	end
end

function agivemoneybank()
	local amount = KeyboardInput1("CLIPPY_BOX_AMOUNT", "", "", 8)
	if amount ~= nil then
		amount = tonumber(amount)
		if type(amount) == 'number' then
			TriggerServerEvent('c_admin:givecashbank', amount)
		end
	end
end

function agivemoneysale()
	local amount = KeyboardInput1("CLIPPY_BOX_AMOUNT", "", "", 8)
	if amount ~= nil then
		amount = tonumber(amount)
		if type(amount) == 'number' then
			TriggerServerEvent('c_admin:givecashsale', amount)
		end
	end
end


function tpplayermarker()
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
			Citizen.Wait(50)
		end
	end
end

function tptoplayer()
	local plyId = KeyboardInput1("CLIPPY_BOX_ID", "", "", 8)

	if plyId ~= nil then
		plyId = tonumber(plyId)
		
		if type(plyId) == 'number' then
			local targetPlyCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(plyId)))
			SetEntityCoords(plyPed, targetPlyCoords)
		end
	end
end

RegisterNetEvent('c_admin:bringplayer')
AddEventHandler('c_admin:bringplayer', function(plyPedCoords)
	SetEntityCoords(plyPed, plyPedCoords)
end)

function tpplayertome()
	local plyId = KeyboardInput1("CLIPPY_BOX_ID", "", "", 8)

	if plyId ~= nil then
		plyId = tonumber(plyId)
		
		if type(plyId) == 'number' then
			local plyPedCoords = GetEntityCoords(plyPed)
			TriggerServerEvent('c_admin:bringplayer', plyId, plyPedCoords)
		end
	end
end

function showplayername()
	showname = not showname
end

local activerposition = true
function activpos()
	activerposition = not activerposition
	local pPed = GetPlayerPed(-1)
	if not activerposition then
		showcoord = true
	elseif activerposition then
		showcoord = false
	end
end

local afficherlesnoms = true
function activename()
	afficherlesnoms = not afficherlesnoms
	local pPed = GetPlayerPed(-1)
	if not afficherlesnoms then
		showname = true
	elseif afficherlesnoms then
		showname = false
	end
end

MainColor = {
	r = 225, 
	g = 55, 
	b = 55,
	a = 255
}

function TouslesJoueursCO()
    local joueurs = 0

    for _, i in ipairs(GetActivePlayers()) do
        joueurs = joueurs + 1
    end

    return joueurs
end


function DrawTxt(text,r,z)
    SetTextColour(225, 55, 55, 255, 255)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0,0.4)
    SetTextDropshadow(1,0,0,0,255)
    SetTextEdge(1,0,0,0,255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(r,z)
end


local activprint = true
function activepointergun()
	activprint = not activprint
	if not activprint then
		DrawTxt('.', 0.495, 0.484)
		ESX.DrawMissionText("~g~Super Sprint", 1250)
	elseif activprint then
		DrawTxt('', 0.495, 0.484)
		ESX.DrawMissionText("~r~Super Sprint désactivé.", 1250)
	end
end

function FullVehicleBoost()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleModKit(vehicle, 0)
		SetVehicleMod(vehicle, 14, 0, true)
		SetVehicleNumberPlateTextIndex(vehicle, 5)
		ToggleVehicleMod(vehicle, 18, true)
		SetVehicleColours(vehicle, 0, 0)
		SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
		SetVehicleModColor_2(vehicle, 5, 0)
		SetVehicleExtraColours(vehicle, 111, 111)
		SetVehicleWindowTint(vehicle, 2)
		ToggleVehicleMod(vehicle, 22, true)
		SetVehicleMod(vehicle, 23, 11, false)
		SetVehicleMod(vehicle, 24, 11, false)
		SetVehicleWheelType(vehicle, 120)
		SetVehicleWindowTint(vehicle, 3)
		ToggleVehicleMod(vehicle, 20, true)
		SetVehicleTyreSmokeColor(vehicle, 0, 0, 0)
		LowerConvertibleRoof(vehicle, true)
		SetVehicleIsStolen(vehicle, false)
		SetVehicleIsWanted(vehicle, false)
		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetCanResprayVehicle(vehicle, true)
		SetPlayersLastVehicle(vehicle)
		SetVehicleFixed(vehicle)
		SetVehicleDeformationFixed(vehicle)
		SetVehicleTyresCanBurst(vehicle, false)
		SetVehicleWheelsCanBreak(vehicle, false)
		SetVehicleCanBeTargetted(vehicle, false)
		SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
		SetVehicleHasStrongAxles(vehicle, true)
		SetVehicleDirtLevel(vehicle, 0)
		SetVehicleCanBeVisiblyDamaged(vehicle, false)
		IsVehicleDriveable(vehicle, true)
		SetVehicleEngineOn(vehicle, true, true)
		SetVehicleStrong(vehicle, true)
		RollDownWindow(vehicle, 0)
		RollDownWindow(vehicle, 1)
		SetVehicleNeonLightEnabled(vehicle, 0, true)
		SetVehicleNeonLightEnabled(vehicle, 1, true)
		SetVehicleNeonLightEnabled(vehicle, 2, true)
		SetVehicleNeonLightEnabled(vehicle, 3, true)
		SetVehicleNeonLightsColour(vehicle, 0, 0, 255)
		
		SetPedCanBeDraggedOut(PlayerPedId(), false)
		SetPedStayInVehicleWhenJacked(PlayerPedId(), true)
		SetPedRagdollOnCollision(PlayerPedId(), false)
		ResetPedVisibleDamage(PlayerPedId())
		ClearPedDecorations(PlayerPedId())
		SetIgnoreLowPriorityShockingEvents(PlayerPedId(), true)

		for i = 0,14 do
			SetVehicleExtra(veh, i, 0)
		end
		SetVehicleModKit(veh, 0)
		for i = 0,49 do
			local custom = GetNumVehicleMods(veh, i)
			for j = 1,custom do
				SetVehicleMod(veh, i, math.random(1,j), 1)
			end
		end
	end
end


Citizen.CreateThread(function()
    while true do
        if Admin.supersaut then
            SetSuperJumpThisFrame(PlayerId(-1))
        end
        if Admin.fastrun then
            SetRunSprintMultiplierForPlayer(PlayerId(-1), 2.5) SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
		end
        if Admin.showcrosshair then
            DrawTxt('+', 0.495, 0.484, 1.0, 0.3, MainColor)
        end
        Citizen.Wait(0)
    end
end)

local function OnSelected(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
	local slide = btn.slidenum
	local btn = btn.name
	local check = btn.unkCheckbox
	if btn == "Téléportation/Joueurs" then
		OpenMenu("Téléportation/Joueurs")
	elseif btn == "Mon personnage" then
		OpenMenu("Mon personnage")
	elseif btn == "Véhicules" then
		OpenMenu("Véhicules")
	elseif btn == "Argent" then
		if playerGroup == 'superadmin' then
			OpenMenu("Argent")
		else
			ESX.ShowNotification('~g~Menu admin~w~.\n~w~Tu n\'es pas ~g~superadmin')
		end
	elseif btn == "Divers" then
		OpenMenu("Divers")
	elseif btn == "TP sur un joueur" then
		tptoplayer()
	elseif btn == "TP joueur sur moi" then
		tpplayertome()
	elseif btn == "TP sur le marqueur" then
		tpplayermarker()
	elseif btn == "NoClip" then 
		playernoclip()
	elseif btn == "Invincible" then 
		playergodmod()
	elseif btn == "Fantôme" then 
		playerinvisible()
	elseif btn == "Changer d'apparence" then 
		changeplayerskin()
	elseif btn == "Spawn un véhicule" then 
		DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
		inputvehicle = 1
		CloseMenu(forcer)
	elseif btn == "Réparer un véhicule" then
		SetVehicleFixed(GetVehiclePedIsUsing(PlayerPedId()))
		SetVehicleDirtLevel(GetVehiclePedIsUsing(PlayerPedId()), 0.0)
	elseif btn == "S'octroyer du cash" then
		agivemoney()
	elseif btn == "Bannir un joueur" then
		TriggerServerEvent("el_bwh:caban")
	elseif btn == "Ouvrir la banlist" then
		TriggerServerEvent("el_bwh:cabanlist")
	elseif btn == "Warn un joueur" then
		TriggerServerEvent("el_bwh:cawarn")
	elseif btn == "Ouvrir la warnlist" then
		TriggerServerEvent("el_bwh:cawarnlist")
	elseif btn == "S'octroyer de l'argent (banque)" then
		agivemoneybank()
	elseif btn == "S'octroyer de l'argent (sale)" then
		agivemoneysale()
	elseif btn == "Retourner un véhicule" then
		retournercar()
	elseif btn == "Afficher/Cacher coordonnées" then
		activpos()
	elseif btn == "Afficher/Cacher nom des joueurs" then 
		activename()
	elseif btn == "Super Sprint" then 
		Admin.fastrun = not Admin.fastrun
	elseif btn == "Super Jump" then 
		Admin.supersaut = not Admin.supersaut
	elseif btn == "Modifier la plaque du véhicule" then 
		DisplayOnscreenKeyboard(true, "CLIPPY_S", "", "", "", "", "", 8)
		inputplate = 1
	elseif btn == "Customiser le véhicule" then 
		FullVehicleBoost()
	elseif btn == "Listes des joueurs" then 
		OpenMenu("Listes des joueurs")
	elseif btn == GetPlayerName(PlayerId()) then 
		CloseMenu('OwnerMenu')
		CreateMenu(JoueurMenu)
	elseif btn == "Activer un crosshair" then 
		Admin.showcrosshair = not Admin.showcrosshair
	elseif btn == "Se give les clés du véhicule" then 
		local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local plate = GetVehicleNumberPlateText(veh)
		TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) 
	elseif btn == "Remplire l'essence du véhicule" then 
		local ped = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(ped)
		SetFuel(vehicle, 80)
	elseif btn == "Activer le pistol gravity" then 
		TriggerEvent("actiuvepistolgravity")
	end
end

local menuadmin = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 0, 0}, Title = "Administration"},
	Data = { currentMenu = "Options"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Options"] = {
			b = {
				{name = "Téléportation/Joueurs",ask = "→", askX = true},
				{name = "Mon personnage",ask = "→", askX = true},
				{name = "Véhicules",ask = "→", askX = true},
				{name = "Argent",ask = "→", askX = true},
				{name = "Divers",ask = "→", askX = true}
			}
		},
		["Listes des joueurs"] = {
			useFilter = true,
			refresh = true,
			b = ListPlayer
		},
		["Divers"] = {
			b = { 
				{name = "Afficher/Cacher nom des joueurs", checkbox = false, Description = "Afficher le nom des joueurs au dessus d'eux."},
				{name = "Afficher/Cacher coordonnées", checkbox = false, Description = "Afficher les coordonnées."},
				{name = "Bannir un joueur", Description = "Ouvrir le menu de ban."},
				{name = "Ouvrir la banlist", Description = "Afficher la banlist."},
				{name = "Warn un joueur", Description = "Ouvrir le menu de warn."},
				{name = "Ouvrir la warnlist", Description = "Afficher la warnlist."}
			}
		},
		["Argent"] = {
			b = { 
				{name = "S'octroyer du cash", Description = "Se give de l'argent en cash."},
				{name = "S'octroyer de l'argent (banque)", Description = "Se give de l'argent en banque."},
				{name = "S'octroyer de l'argent (sale)", Description = "Se give de l'argent sale."}
			}
		},
		["Véhicules"] = {
			b = { 
				{name = "Réparer un véhicule", Description = "Réparer le véhicule."},
				{name = "Retourner un véhicule", Description = "Retourner un véhicule prêt de vous."},
				{name = "Spawn un véhicule", Description = "Faire apapraître un véhicule."},
				{name = "Modifier la plaque du véhicule", Description = "Modifier la plaque du véhicule."},
				{name = "Customiser le véhicule", Description = "Customiser le véhicule."},
				{name = "Remplire l'essence du véhicule", Description = "Remplire l'essence du véhicule."},
				{name = "Se give les clés du véhicule", Description = "Se give les clés du véhicule."},
			}
		},
		["Mon personnage"] = {
			b = { 
				{name = "NoClip", checkbox = false, Description = "Vous mettre en NoClip."},
				{name = "Invincible", checkbox = false, Description = "Vous mettre en mode invincible."},
				{name = "Fantôme", checkbox = false, Description = "Vous mettre en mode fantôme."},
				{name = "Super Sprint", checkbox = false, Description = "Courir plus vite."},
				{name = "Super Jump", checkbox = false, Description = "Sauter plus haut."},
				{name = "Activer le pistol gravity", checkbox = false, Description = "Activer un le pistolet gravité."},
				{name = "Activer un crosshair", checkbox = false, Description = "Activer un crosshair."},
				{name = "Changer d'apparence", ask = "→", askX = true, Description = "Changer votre personnage d'apparence."},
			}
		},
		["Téléportation/Joueurs"] = {
			b = { 
				{name = "TP sur un joueur"},
				{name = "TP joueur sur moi"},
				{name = "TP sur le marqueur"},
			}
		}
	}
}

function Text(text)
	SetTextColour(186, 186, 186, 255)
	SetTextFont(0)
	SetTextScale(0.378, 0.378)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(false)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.017, 0.977)
end

Citizen.CreateThread(function()
	while true do
		plyPed = PlayerPedId()
	
		if showcoord then
			local playerPos = GetEntityCoords(plyPed)
			local playerHeading = GetEntityHeading(plyPed)
			ESX.DrawMissionText("~b~X~s~ : " .. playerPos.x .. " ~b~Y~s~ : " .. playerPos.y .. " ~b~Z~s~ : " .. playerPos.z .. " 		~b~Angle~s~: " .. playerHeading)
		end

		if showname then
			for id = 0, 256 do
				if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= plyPed then
					local headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, GetPlayerPed(id), ('('.. GetPlayerServerId(id) .. ') ' .. GetPlayerName(id)), false, false, "", false)
				end
			end
		end
		
		Citizen.Wait(0)
	end
end)


RegisterKeyMapping('+openstaff', 'Ouvrir le menu staff', 'keyboard', 'F9')

RegisterCommand("+openstaff", function()
	if playerGroup == 'superadmin' or playerGroup == 'mod'or playerGroup == 'admin' then
		CreateMenu(menuadmin)
	end
end)

-- RegisterNetEvent('openmenustaff')
-- AddEventHandler('openmenustaff', function()
-- 	CreateMenu(menuadmin)
-- end)