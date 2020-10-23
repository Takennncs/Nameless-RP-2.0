ESX = nil

local playerGender

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
	TriggerEvent('skinchanger:getSkin', function(skin)
		playerGender = skin.sex
	end)

	PlayerData = ESX.GetPlayerData()
end)

local oPlayer = false
local InVehicle = false
local playerpos = false
local canSellDrugs = false

Citizen.CreateThread(function()
    while(true) do
		oPlayer = GetPlayerPed(-1)
        InVehicle = IsPedInAnyVehicle(oPlayer, true)
		playerpos = GetEntityCoords(oPlayer)
        Citizen.Wait(500)
    end
end)

RequestAnimDict("mp_common")
Citizen.CreateThread(function(prop_name)
	local prop_name = 'bkr_prop_weed_bag_01a'
    local attente = 150
    while true do
		Wait(attente)
		local handle, ped = FindFirstPed()
		local success
		repeat
			success, ped = FindNextPed(handle)
			local pos = GetEntityCoords(ped)
			local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerpos.x, playerpos.y, playerpos.z, true)
				if distance < 4.0 and CanSellToPed(ped) and canSellDrugs and not InVehicle then
					attente = 1
					PlayAmbientSpeech2(ped, "GENERIC_HI", "SPEECH_PARAMS_FORCE")
					if distance < 1.5 and CanSellToPed(ped) and canSellDrugs then
						if canSellDrugs and not InVehicle then
								ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~vendre votre marchandise.")
							if IsControlJustPressed(1,38) then	
								oldped = ped
								SetEntityHeading(ped,GetHeadingFromVector_2d(pos.x-playerpos.x,pos.y-playerpos.y)+180)
								SetEntityHeading(oPlayer,GetHeadingFromVector_2d(pos.x-playerpos.x,pos.y-playerpos.y))
								exports["a_loadingbar"]:StartDelayedFunction("Vente de drogues...", 1000, function()
									TaskPlayAnim(oPlayer, "mp_common", "givetake2_a", 2.0, 2.0, 1000, 51, 0, false, false, false)
									TaskPlayAnim(ped, "mp_common", "givetake2_a", 2.0, 2.0, 1000, 51, 0, false, false, false)
									local x,y,z = table.unpack(GetEntityCoords(playerPed))
									prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
									AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
									TriggerServerEvent("esx_newDrugs:sellDrugs")
									Citizen.Wait(1000)
									DeleteObject(prop)
									ClearPedSecondaryTask(PlayerPedId())
									ClearPedTasksImmediately(ped)
									ClearPedTasks(ped)
								end)
								Citizen.Wait(4000)
								-- DeleteEntity(ped)
								break
							end
							break
						else
							attente = 150
						end
					end
			end
		until not success
		EndFindPed(handle)
	end
end)

function alertepolicedrugspoucave()
	local aleatoire = math.random(1, 10)
	if aleatoire == 2 then
		local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
		TriggerServerEvent("call:makeCall", "drogue", {x=plyPos.x,y=plyPos.y,z=plyPos.z})
	end
end

RegisterNetEvent('alertdrugs:poucavepolice1')
AddEventHandler('alertdrugs:poucavepolice1', function(x, y, z)	
	TriggerServerEvent("call:makeCall", "drogue", {x=x,y=y,z=z})
	Wait(0)
end)


Citizen.CreateThread(function()
	while true do
		Wait(0)
		if not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			TriggerServerEvent("esx_newDrugs:canSellDrugs")
			Citizen.Wait(3000)
		end
	end
end)


function CanSellToPed(ped)
	if not IsPedAPlayer(ped) and not IsPedInAnyVehicle(ped,false) and not IsEntityDead(ped) and IsPedHuman(ped) and GetEntityModel(ped) ~= GetHashKey("s_m_y_cop_01") and GetEntityModel(ped) ~= GetHashKey("s_m_y_dealer_01") and GetEntityModel(ped) ~= GetHashKey("mp_m_shopkeep_01") and ped ~= oldped and canSellDrugs then 
		return true
	end
	return false
end


RegisterNetEvent("esx_newDrugs:canSellDrugs")
AddEventHandler("esx_newDrugs:canSellDrugs", function(soldAmount)
	canSellDrugs = soldAmount
end)