ESX                           = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local PlayerData              = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()

end)


RegisterNetEvent('esx_narshop:clipcli')
AddEventHandler('esx_narshop:clipcli', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
	  AddAmmoToPed(GetPlayerPed(-1), hash,50)
	  --startAnim("mp_corona@single_team", "single_team_intro_one")
	  --TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
	  ESX.ShowNotification("~g~Chargeur utilisé.")
	  TriggerServerEvent('esx_narshop:remove')
    else
      ESX.ShowNotification("~r~Tu n'as pas d'armes en mains.")
    end
  else
    	ESX.ShowNotification("~r~Ce type de munitions ne convient pas.")
  end
end)

--[[ RegisterNetEvent('esx_narshop:clipextended')
AddEventHandler('esx_narshop:clipextended', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      	AddAmmoToPed(GetPlayerPed(-1), hash,100)
	  --startAnim("mp_corona@single_team", "single_team_intro_one")
	  --TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
	  ESX.ShowNotification("~g~Chargeur utilisé.")
	  Citizen.Wait(5000)
	  --TriggerServerEvent('esx_narshop:remove1')
    else
		ESX.ShowNotification("~r~Tu n'as pas d'arme en main.")
    end
    else
    	ESX.ShowNotification("~r~Ce type de munitions ne convient pas.")
  end
end) ]]

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer 
end)

				local used = 0


RegisterNetEvent('esx_narshop:silencieux')
AddEventHandler('esx_narshop:silencieux', function(duration)
				local inventory = ESX.GetPlayerData().inventory
				local silencieux = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'silencieux' then
						silencieux = inventory[i].count
					  end
					end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used < silencieux then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
		  		 	used = used + 1

			  elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
		  			used = used + 1


			  elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
					used = used + 1

			  elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
		  		 	used = used + 1

			  elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
		  			used = used + 1

			  elseif currentWeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
		  		  	used = used + 1

			  elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
		  		 	used = used + 1


			  elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
	used = used + 1
				

			  elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
	used = used + 1
		  		

			  elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
	used = used + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
	used = used + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
	used = used + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
	used = used + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
	used = used + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
	used = used + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
	used = used + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
	used = used + 1
		  		 
			  elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_SR_SUPP"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
	used = used + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
	used = used + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 ESX.ShowNotification(("~g~Silencieux équipé.")) 
	used = used + 1
		  		
		  	else 
		  		ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter un silencieux."))
			end
			else
				ESX.ShowNotification(("Vous avez utiliser tout vos silencieux.")) 

		end
end)
				local used2 = 0

RegisterNetEvent('esx_narshop:flashlight')
AddEventHandler('esx_narshop:flashlight', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local flashlight = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'flashlight' then
						flashlight = inventory[i].count
					  end
					end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used2 < flashlight then
						-- print('used2')

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
				   ESX.ShowNotification(("~g~Lampe équipée.")) 
		  		 	used2 = used2 + 1
			  elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  		

			  elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
				
			  elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  		 
			  elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
		  		 	used2 = used2 + 1


			  elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
				

			  elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
				 
			  elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  			

			  elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  		 
			  elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 ESX.ShowNotification(("~g~Lampe équipée.")) 
	used2 = used2 + 1
		  		
		  	else 
		  		  ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter une lampe."))
		  		
			end
		else
			ESX.ShowNotification(("Vous avez utiliser toutes vos lampes."))
		end
end)

				local used3 = 0

RegisterNetEvent('esx_narshop:grip')
AddEventHandler('esx_narshop:grip', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local grip = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'grip' then
						grip = inventory[i].count
					  end
					end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used3 < grip then

			
			if currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("~g~Poignée équipée.")) 
		  				used3 = used3 + 1


			  elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("~g~Poignée équipée.")) 
	used3 = used3 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("~g~Poignée équipée.")) 
	used3 = used3 + 1
				  
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("~g~Poignée équipée.")) 
	used3 = used3 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("~g~Poignée équipée.")) 
	used3 = used3 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("~g~Poignée équipée.")) 
	used3 = used3 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("~g~Poignée équipée.")) 
	used3 = used3 + 1
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("~g~Poignée équipée.")) 
	used3 = used3 + 1
		  		 
		  		
			  elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
				--TaskPlayAnim(PlayerPedId(), "mp_corona@single_team", "single_team_intro_one", 2.0, 2.0, 5000, 48, 0, false, false, false)
				--Citizen.Wait(3500)
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("~g~Poignée équipée.")) 
	used3 = used3 + 1
		  		
		  	else 
		  		  ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter une poignée."))
		  		
			end
		else
				  		  ESX.ShowNotification(("Vous avez utiliser toutes vos poignées."))
		end
end)

				local used4 = 0

RegisterNetEvent('esx_narshop:yusuf')
AddEventHandler('esx_narshop:yusuf', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local yusuf = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'yusuf' then
						yusuf = inventory[i].count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used4 < yusuf then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE"))  
				   				   ESX.ShowNotification("~g~Skin équipé.")  
		  		 	used4 = used4 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE"))  
		  		 				   ESX.ShowNotification("~g~Skin équipé.")  
	used4 = used4 + 1
		  		
				
		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE"))  
		  		 				   ESX.ShowNotification("~g~Skin équipé.")  
	used4 = used4 + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE"))  
		  		 				   ESX.ShowNotification("~g~Skin équipé.")  
	used4 = used4 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_VARMOD_LUXE"))  
		  		 				   ESX.ShowNotification("~g~Skin équipé.")  
	used4 = used4 + 1
		  		 

		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"))  
		  		 				   ESX.ShowNotification("~g~Skin équipé.")  
	used4 = used4 + 1
				


		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))  
		  		 				   ESX.ShowNotification("~g~Skin équipé.")  
	used4 = used4 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE"))  
		  		 				   ESX.ShowNotification("~g~Skin équipé.")  
	used4 = used4 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"))  
		  		 				   ESX.ShowNotification("~g~Skin équipé.")  
	used4 = used4 + 1
		  		
		  	
		  	else 
		  		  ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter le look de luxe."))
		  		
			end
		else
				  		  ESX.ShowNotification(("Vous avez utiliser tout vos skins de luxe."))

		end
end)

local used5 = 0

RegisterNetEvent('esx_narshop:clipextended')
AddEventHandler('esx_narshop:clipextended', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local yusuf = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'clipextended' then
						yusuf = inventory[i].count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used5 < yusuf then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_CLIP_02"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove1')
		  		 	used5 = used5 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_CLIP_02"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove1')
	used5 = used5 + 1
		  		
				
		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_CLIP_02"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove1')
	used5 = used5 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
				GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_COMBATPISTOL_CLIP_02"))  
				ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				--TriggerServerEvent('esx_narshop:remove1')
	used5 = used5 + 1

	
		elseif currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey("COMPONENT_SNSPISTOL_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_02"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove1')
	used5 = used5 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_02"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove1')
	used5 = used5 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_ASSAULTSMG_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1
		  		 

		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_CLIP_02"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove1')
	used5 = used5 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_MINISMG") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MINISMG"), GetHashKey("COMPONENT_MINISMG_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1
				
		
		elseif currentWeaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL"), GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_COMBATPDW_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_ASSAULTSHOTGUN_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_02"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove1')
	used5 = used5 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove1')
	used5 = used5 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_02"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove1')
	used5 = used5 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1
		
		elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_BULLPUPRIFLE_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_COMPACTRIFLE") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_COMBATMG") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG"), GetHashKey("COMPONENT_COMBATMG_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_GUSENBERG") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_GUSENBERG"), GetHashKey("COMPONENT_GUSENBERG_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_MARKSMANRIFLE_CLIP_02"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove1')
		used5 = used5 + 1
		  	
		  	else 
		  		  ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de grands chargeurs."))
		  		
			end
		else
				  		  ESX.ShowNotification(("Vous avez utiliser tout vos grands chargeurs."))

		end
end)

local used6 = 0

RegisterNetEvent('esx_narshop:clipdrum')
AddEventHandler('esx_narshop:clipdrum', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local yusuf = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'clipdrum' then
						yusuf = inventory[i].count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used6 < yusuf then

			if currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_03"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove2')
		  		 	used6 = used6 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_03"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove2')
	used6 = used6 + 1
		  		
				
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_03"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove2')
	used6 = used6 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_COMPACTRIFLE") then
				GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_03"))  
				ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				--TriggerServerEvent('esx_narshop:remove2')
	used6 = used6 + 1

	
		elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_03"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove2')
		used6 = used6 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL"), GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_03"))  
			ESX.ShowNotification("~g~Grand Chargeur équipé.") 
			--TriggerServerEvent('esx_narshop:remove2')
		used6 = used6 + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_COMBATPDW_CLIP_03"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove2')
	used6 = used6 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_03"))  
				   ESX.ShowNotification("~g~Grand Chargeur équipé.") 
				   --TriggerServerEvent('esx_narshop:remove2')
	used6 = used6 + 1
		  	
		  	else 
		  		  ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de chargeur Drum."))
		  		
			end
		else
				  		  ESX.ShowNotification(("Vous avez utiliser tout vos chargeurs Drum."))

		end
end)

local used7 = 0

RegisterNetEvent('esx_narshop:viseur')
AddEventHandler('esx_narshop:viseur', function(duration)
	local inventory = ESX.GetPlayerData().inventory
	local viseur = 0
		for i=1, #inventory, 1 do
		  if inventory[i].name == 'viseur' then
			viseur = inventory[i].count
		  end
		end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used7 < viseur then

		if currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO"))  
			ESX.ShowNotification("~g~Viseur équipé.") 
			--TriggerServerEvent('esx_narshop:remove3')
		used7 = used7 + 1

		
		elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02"))  
			ESX.ShowNotification("~g~Viseur équipé.") 
			--TriggerServerEvent('esx_narshop:remove3')
		used7 = used7 + 1

				
		elseif currentWeaponHash == GetHashKey("WEAPON_MG") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MG"), GetHashKey("COMPONENT_AT_SCOPE_SMALL_02"))  
			ESX.ShowNotification("~g~Viseur équipé.") 
			--TriggerServerEvent('esx_narshop:remove3')
		used7 = used7 + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO"))  
				ESX.ShowNotification("~g~Viseur équipé.") 
				--TriggerServerEvent('esx_narshop:remove3')
		used7 = used7 + 1
			

		elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))  
			ESX.ShowNotification("~g~Viseur équipé.") 
			--TriggerServerEvent('esx_narshop:remove3')
		used7 = used7 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_02"))  
			ESX.ShowNotification("~g~Viseur équipé.") 
			--TriggerServerEvent('esx_narshop:remove3')
		used7 = used7 + 1


				elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MACRO"))  
					ESX.ShowNotification("~g~Viseur équipé.") 
					--TriggerServerEvent('esx_narshop:remove3')
		used7 = used7 + 1
						
				elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))  
					ESX.ShowNotification("~g~Viseur équipé.") 
					--TriggerServerEvent('esx_narshop:remove3')
		used7 = used7 + 1
		  		
				elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))  
					ESX.ShowNotification("~g~Viseur équipé.") 
					--TriggerServerEvent('esx_narshop:remove3')
		used7 = used7 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))  
			ESX.ShowNotification("~g~Viseur équipé.") 
			--TriggerServerEvent('esx_narshop:remove3')
		used7 = used7 + 1
		
		elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))  
			ESX.ShowNotification("~g~Viseur équipé.") 
			--TriggerServerEvent('esx_narshop:remove3')
		used7 = used7 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_COMBATMG") then
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))  
			ESX.ShowNotification("~g~Viseur équipé.") 
			--TriggerServerEvent('esx_narshop:remove3')
		used7 = used7 + 1

		  	
		  	else 
		  		  ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de viseur."))
		  		
			end
		else
				  		  ESX.ShowNotification(("Vous avez utiliser tout vos viseur."))

		end
end)


AddEventHandler('playerSpawned', function()
  used = 0
  used2 = 0
  used3 = 0
  used4 = 0
  used5 = 0
  used6 = 0
  used7 = 0
end)


--[[ local narshPeds = {
  --Ammu
  {model="a_m_m_socenlat_01",  x = 1692.8,  y = 3761.52,  z = 33.74, a=228.04},
  {model="a_m_y_downtown_01",  x = 23.10,  y = -1105.38,  z = 28.78, a=162.05},
  -- Dealer Divers
  {model="s_m_y_dockwork_01",  x = -170.64,  y = 6142.56,  z = 42.64-0.98, a=50.692234039307},
  -- Reseller Chargeur
  {model="g_m_m_armlieut_01",  x = -1323.98,  y = -1516.32,  z = 4.44-0.98, a=47.446220397949},
  -- Siméon
  {model="csb_grove_str_dlr",  x = 136.56,  y = -1049.04,  z = 57.8-0.98, a=342.33154296875},
  {model="mp_m_forgery_01",  x = 188.44,  y = -1479.72,  z = 29.16-0.98, a=50.097938537598}
}
				  
				  
Citizen.CreateThread(function()
				  
	for k,v in ipairs(narshPeds) do
		RequestModel(GetHashKey(v.model))
		 while not HasModelLoaded(GetHashKey(v.model)) do
			Wait(50)
		end
				  
		local narshopPed = CreatePed(4, GetHashKey(v.model), v.x, v.y, v.z, v.a, false, false)
		SetBlockingOfNonTemporaryEvents(narshopPed, false)
		FreezeEntityPosition(narshopPed, true)
		SetPedFleeAttributes(narshopPed, 1, 0)
		SetEntityInvincible(narshopPed, true)
		SetPedDiesWhenInjured(narshopPed, true)
		TaskStartScenarioInPlace(narshopPed, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, 0)
				  
		SetModelAsNoLongerNeeded(GetHashKey(v.model))
	end
end) ]]