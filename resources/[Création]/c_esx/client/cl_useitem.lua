ESX = nil
local CurrentActionData   = {}
local lastTime            = 0
local playerPed = GetPlayerPed(-1)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local personalmenu = {}


------------------------------------------------------------------------------------
------------------------------------ Use Brolly ------------------------------------
------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:brolly')
AddEventHandler('esx_useitem:brolly', function()

  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

	Citizen.CreateThread(function()
    
    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)
    local boneIndex = GetPedBoneIndex(playerPed, 57005)
        
    RequestAnimDict('amb@code_human_wander_drinking@beer@male@base')
    
    while not HasAnimDictLoaded('amb@code_human_wander_drinking@beer@male@base') do
      Citizen.Wait(0)
    end
    
    ESX.Game.SpawnObject('p_amb_brolly_01', {
      x = coords.x,
      y = coords.y,
      z = coords.z + 2
    }, function(object)
    
    Citizen.CreateThread(function()
    
      AttachEntityToEntity(object, playerPed, boneIndex, 0.10, 0, -0.001, 80.0, 150.0, 200.0, true, true, false, true, 1, true)
      TaskPlayAnim(playerPed, "amb@code_human_wander_drinking@beer@male@base", "static", 3.5, -8, -1, 49, 0, 0, 0, 0)
      Citizen.Wait(30000)
      DeleteObject(object)
      ClearPedSecondaryTask(playerPed)
      
     end)
    end)
  end)
end)

------------------------------------------------------------------------------------
------------------------------------ Use ROSE ------------------------------------
------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:rose')
AddEventHandler('esx_useitem:rose', function()

  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

	Citizen.CreateThread(function()
    
    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)
    local boneIndex = GetPedBoneIndex(playerPed, 57005)
        
    RequestAnimDict('amb@code_human_wander_drinking@beer@male@base')
    
    while not HasAnimDictLoaded('amb@code_human_wander_drinking@beer@male@base') do
      Citizen.Wait(0)
    end
    
    ESX.Game.SpawnObject('p_single_rose_s', {
      x = coords.x,
      y = coords.y,
      z = coords.z + 2
    }, function(object)
    
    Citizen.CreateThread(function()
    
      AttachEntityToEntity(object, playerPed, boneIndex, 0.10, 0, -0.001, 80.0, 150.0, 200.0, true, true, false, true, 1, true)
      TaskPlayAnim(playerPed, "amb@code_human_wander_drinking@beer@male@base", "static", 3.5, -8, -1, 49, 0, 0, 0, 0)
      Citizen.Wait(30000)
      DeleteObject(object)
      ClearPedSecondaryTask(playerPed)
      
     end)
    end)
  end)
end)

---------------------------------------------------------------------------------------------
-------------------------------------------USE BONG -----------------------------------------
---------------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:bong')
AddEventHandler('esx_useitem:bong', function()

  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

	Citizen.CreateThread(function()
    
    local playerPed  = GetPlayerPed(-1)
    local coords     = GetEntityCoords(playerPed)
    local boneIndex  = GetPedBoneIndex(playerPed, 18905)
    local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

      RequestAnimDict('anim@safehouse@bong')
        
    while not HasAnimDictLoaded('anim@safehouse@bong') do
      Citizen.Wait(0)
    end
    
    ESX.Game.SpawnObject('hei_heist_sh_bong_01', {
      x = coords.x,
      y = coords.y,
      z = coords.z - 3
    }, function(object)

    ESX.Game.SpawnObject('p_cs_lighter_01', {
      x = coords.x,
      y = coords.y,
      z = coords.z - 3
    }, function(object2)
    
    Citizen.CreateThread(function()
    
      TaskPlayAnim(playerPed, "anim@safehouse@bong", "bong_stage1", 3.5, -8, -1, 49, 0, 0, 0, 0)
      Citizen.Wait(1500)
      AttachEntityToEntity(object2, playerPed, boneIndex2, 0.10, 0.0, 0, 99.0, 192.0, 180.0, true, true, false, true, 1, true)
      AttachEntityToEntity(object, playerPed, boneIndex, 0.10, -0.25, 0, 95.0, 190.0, 180.0, true, true, false, true, 1, true)
      Citizen.Wait(6000)
      DeleteObject(object)
      DeleteObject(object2)
      ClearPedSecondaryTask(playerPed)
      TriggerServerEvent('esx_useitem:bong')
      end)
     end)
    end)
  end)
end)


-----------------------------------------------------------------------------------------------
------------------------------------------ OUTFIT SWIM ----------------------------------------
-----------------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:swim')
AddEventHandler('esx_useitem:swim', function()

  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

	Citizen.CreateThread(function()
    
    local playerPed  = GetPlayerPed(-1)
    local coords     = GetEntityCoords(playerPed)
    local boneIndex  = GetPedBoneIndex(playerPed, 12844)
    local boneIndex2 = GetPedBoneIndex(playerPed, 24818)
    
    ESX.Game.SpawnObject('p_s_scuba_mask_s', {
      x = coords.x,
      y = coords.y,
      z = coords.z - 3
    }, function(object)

   
    ESX.Game.SpawnObject('p_s_scuba_tank_s', {
      x = coords.x,
      y = coords.y,
      z = coords.z - 3
    }, function(object2) 

      Citizen.CreateThread(function()
      AttachEntityToEntity(object2, playerPed, boneIndex2, -0.30, -0.22, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
      AttachEntityToEntity(object, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
      SetPedDiesInWater(playerPed, false)
      ESX.ShowNotification('~g~Bouteille ~s~= ~g~100%')
      ESX.ShowNotification('~g~Allez vous baigner.')
      Citizen.Wait(45000)
      ESX.ShowNotification('~y~Bouteille ~s~= ~y~50%')
      Citizen.Wait(45000)
      ESX.ShowNotification('~o~Bouteille ~s~= ~o~10%')
      Citizen.Wait(30000)
      ESX.ShowNotification('~r~Bouteille ~s~= ~r~0%')
      SetPedDiesInWater(playerPed, true)
      DeleteObject(object)
      DeleteObject(object2)
      ClearPedSecondaryTask(playerPed)
      end)
     end)
    end)
  end)
end)

----------------------------------------------------------------------------------------------
---------------------------------------EAT SANDWICH ------------------------------------------
----------------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:sandwich')
AddEventHandler('esx_useitem:sandwich', function()

  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

	Citizen.CreateThread(function()
    
    local playerPed  = GetPlayerPed(-1)
    local coords     = GetEntityCoords(playerPed)
    local boneIndex  = GetPedBoneIndex(playerPed, 18905)
    local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

      RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
        
    while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
      Citizen.Wait(0)
    end
    
    ESX.Game.SpawnObject('prop_sandwich_01', {
      x = coords.x,
      y = coords.y,
      z = coords.z - 3
    }, function(object)

    
    Citizen.CreateThread(function()
    
      TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8, -1, 49, 0, 0, 0, 0)
      AttachEntityToEntity(object, playerPed, boneIndex2, 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
      --Citizen.Wait(6500)
      DeleteObject(object)
      ClearPedSecondaryTask(playerPed)
      end)
    end)
  end)
end)

------------------------------------------------------------------------------------
------------------------------------ Use Tatgun ------------------------------------
------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:tatgun')
AddEventHandler('esx_useitem:tatgun', function()

local playerPed = GetPlayerPed(-1)
local coords    = GetEntityCoords(playerPed)

Citizen.CreateThread(function()
  
  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)
  local boneIndex = GetPedBoneIndex(playerPed, 11816)
  local boneIndex2 = GetPedBoneIndex(playerPed, 6286)
      
    RequestAnimDict('random@shop_tattoo')
      
  while not HasAnimDictLoaded('random@shop_tattoo') do
    Citizen.Wait(0)
  end

    ESX.Game.SpawnObject('v_ilev_ta_tatgun', {
      x = coords.x,
      y = coords.y,
      z = coords.z + 2
    }, function(object2)
  
      Citizen.CreateThread(function()

        AttachEntityToEntity(object2, playerPed, boneIndex2, 0.09, 0.11, 0.01, -75.0, -90.0, -140.0, true, true, false, true, 1, true)
        TaskPlayAnim(GetPlayerPed(-1), "random@shop_tattoo", "artist_artist_finishes_up_his_tattoo" ,3.5, -8, -1, 49, 0,false, false, false )
        Citizen.Wait(13000)
        DeleteObject(object)
        DeleteObject(object2) 
        ClearPedSecondaryTask(playerPed)
      end)
    end)
  end)
end)

------------------------------------------------------------------------------------
------------------------------------ Use notepad ------------------------------------
------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:notepad')
AddEventHandler('esx_useitem:notepad', function()

local playerPed = GetPlayerPed(-1)
local coords    = GetEntityCoords(playerPed)

Citizen.CreateThread(function()
  
  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)
  local boneIndex = GetPedBoneIndex(playerPed, 36029)
      
    RequestAnimDict('amb@world_human_clipboard@male@idle_b')
      
  while not HasAnimDictLoaded('amb@world_human_clipboard@male@idle_b') do
    Citizen.Wait(0)
  end

    ESX.Game.SpawnObject('prop_notepad_01', {
      x = coords.x,
      y = coords.y,
      z = coords.z + 2
    }, function(object)
  
      Citizen.CreateThread(function()

        AttachEntityToEntity(object, playerPed, boneIndex, 0.10, 0.08, 0.07, 155.0, 120.0, -180.0, true, true, false, true, 1, true)
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_clipboard@male@idle_b", "idle_d" ,3.5, -8, -1, 49, 0,false, false, false )
        Citizen.Wait(25000)
        DeleteObject(object) 
        ClearPedSecondaryTask(playerPed)
      end)
    end)
  end)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local CurrentActionData = {entity = "prop_notepad_01"}
        
      if IsControlJustReleased(0, 73) then              
        DeleteObject("prop_notepad_01") 
      end
  end
end)

-----------------------------------------------------------------------------------------------
--------------------------------------------- KIT PIC -----------------------------------------
-----------------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:kitpic')
AddEventHandler('esx_useitem:kitpic', function()
  
    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)

    ESX.Game.SpawnObject('prop_yoga_mat_02',  {
      x = coords.x,
      y = coords.y,
      z = coords.z -1
    }, function(object)
    end)
    ESX.Game.SpawnObject('prop_yoga_mat_02',  {
      x = coords.x ,
      y = coords.y -0.9,
      z = coords.z -1
    }, function(object)
    end)
    ESX.Game.SpawnObject('prop_yoga_mat_02',  {
      x = coords.x ,
      y = coords.y +0.9,
      z = coords.z -1
    }, function(object)
    end)
    ESX.Game.SpawnObject('prop_champset',  {
      x = coords.x ,
      y = coords.y ,
      z = coords.z -1
    }, function(object)
    end)
    ESX.Game.SpawnObject('prop_beach_fire',  {
      x = coords.x +1.3,
      y = coords.y ,
      z = coords.z -1.6
    }, function(object)
    end)
    
end)


-----------------------------------------------------------------------------------------------
--------------------------------------------- Kali Linux -----------------------------------------
-----------------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:kalilinux')
AddEventHandler('esx_useitem:kalilinux', function()
  
    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)

    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start",7,35,mycb)
    
end)

function mycb(success, timeremaining)
	if success then
		-- print('Success with '..timeremaining..'s remaining.')
		TriggerEvent('mhacking:hide')
	else
		-- print('Failure')
		TriggerEvent('mhacking:hide')
	end
end

-----------------------------------------------------------------------------------------------
--------------------------------------------- Bulletproof -----------------------------------------
-----------------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:bulletproof')
AddEventHandler('esx_useitem:bulletproof', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)
    
    TriggerEvent('skinchanger:getSkin', function(skin)

      if skin.sex == 0 then
       local clothesSkin = {
        ['bproof_1'] = 27,  ['bproof_2'] = 5
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
      elseif skin.sex == 1 then
        local clothesSkin = {
        ['bproof_1'] = 29,  ['bproof_2'] = 5
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
      end
      local playerPed = GetPlayerPed(-1)
      ClearPedBloodDamage(playerPed)
      ResetPedVisibleDamage(playerPed)
      ClearPedLastWeaponDamage(playerPed)
      AddArmourToPed(playerPed, 100)
      SetPedArmour(playerPed, 100)
    end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    
          --Citizen.Wait(6500)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
          TriggerServerEvent('removebullet')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)


RegisterNetEvent('esx_useitem:removebulletpolice')
AddEventHandler('esx_useitem:removebulletpolice', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)
    
    TriggerEvent('skinchanger:getSkin', function(skin)

      if skin.sex == 0 then
       local clothesSkin = {
        ['bproof_1'] = 12,  ['bproof_2'] = 3
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
      elseif skin.sex == 1 then
        local clothesSkin = {
        ['bproof_1'] = 17,  ['bproof_2'] = 0
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
      end
      local playerPed = GetPlayerPed(-1)
      ClearPedBloodDamage(playerPed)
      ResetPedVisibleDamage(playerPed)
      ClearPedLastWeaponDamage(playerPed)
      AddArmourToPed(playerPed, 100)
      SetPedArmour(playerPed, 100)
    end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    
          --Citizen.Wait(6500)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
          TriggerServerEvent('removebulletpolice')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)

RegisterNetEvent('esx_useitem:removebulletsheriff')
AddEventHandler('esx_useitem:removebulletsheriff', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)
    
    TriggerEvent('skinchanger:getSkin', function(skin)

      if skin.sex == 0 then
       local clothesSkin = {
        ['bproof_1'] = 12,  ['bproof_2'] = 2
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
      elseif skin.sex == 1 then
        local clothesSkin = {
        ['bproof_1'] = 18,  ['bproof_2'] = 2
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
      end
      local playerPed = GetPlayerPed(-1)
      ClearPedBloodDamage(playerPed)
      ResetPedVisibleDamage(playerPed)
      ClearPedLastWeaponDamage(playerPed)
      AddArmourToPed(playerPed, 100)
      SetPedArmour(playerPed, 100)
    end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    
          --Citizen.Wait(6500)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
          TriggerServerEvent('removebulletsheriff')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)

-----------------------------------------------------------------------------------------------
-------------------------------------------- BALL XXL -----------------------------------------
-----------------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:ball')
  AddEventHandler('esx_useitem:ball', function()

    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)

 ESX.Game.SpawnObject('prop_beach_volball01',  {
      x = coords.x +1.5,
      y = coords.y +1.5,
      z = coords.z -1
    }, function(object)
  end)

end)


-----------------------------------------------------------------------------------------------
--------------------------------------------- Permis ------------------------------------------
-----------------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:permis')
AddEventHandler('esx_useitem:permis', function()
  personalmenu.closestPlayer, personalmenu.closestDistance = ESX.Game.GetClosestPlayer()		
  if personalmenu.closestDistance ~= -1 and personalmenu.closestDistance <= 3.0 then
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(personalmenu.closestPlayer), 'driver')
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
  else
    ESX.ShowColoredNotification("Personne à côté de vous", 5)
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
  end
end)

-----------------------------------------------------------------------------------------------
--------------------------------------------- Armes ------------------------------------------
-----------------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:permisarmes')
AddEventHandler('esx_useitem:permisarmes', function()
  personalmenu.closestPlayer, personalmenu.closestDistance = ESX.Game.GetClosestPlayer()		
  if personalmenu.closestDistance ~= -1 and personalmenu.closestDistance <= 3.0 then
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(personalmenu.closestPlayer), 'weapon')
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
  else
    ESX.ShowColoredNotification("Personne à côté de vous", 5)
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
  end
end)


-----------------------------------------------------------------------------------------------
--------------------------------------------- Identité ------------------------------------------
-----------------------------------------------------------------------------------------------

RegisterNetEvent('esx_useitem:carteidentite')
AddEventHandler('esx_useitem:carteidentite', function()
  personalmenu.closestPlayer, personalmenu.closestDistance = ESX.Game.GetClosestPlayer()		
  if personalmenu.closestDistance ~= -1 and personalmenu.closestDistance <= 3.0 then
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(personalmenu.closestPlayer))
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
  else
    ESX.ShowColoredNotification("Personne à côté de vous", 5)
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
  end
end)

----------------------------------------------------------------------------
--------------------------------  OPEN BIN  --------------------------------
----------------------------------------------------------------------------
--[[

AddEventHandler('esx_useitem:trashcanEnteredEntityZone', function(entity)
  
    local playerPed = GetPlayerPed(-1)
  
      CurrentAction     = 'open_bin'
      CurrentActionMsg  = 'Appuyez sur ~INPUT_TALK~ pour faire les poubelles'
      CurrentActionData = {entity = entity}
  
end)

AddEventHandler('esx_useitem:trashcanhasExitedEntityZone', function(entity)
  
    if CurrentAction == 'open_bin' then
      CurrentAction = nil
    end
  
end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local playerPed = GetPlayerPed(-1)
		local coords    = GetEntityCoords(playerPed)

		local entity, distance = ESX.Game.GetClosestObject({
      'prop_recyclebin_03_a',
      'zprop_bin_01a_old',
      'prop_bin_01a',
      'prop_bin_03a',
      'prop_bin_05a',
      'prop_bin_06a',
      'prop_bin_07a',
      'prop_bin_07d',
      'prop_cs_bin_02'

		})

		if distance ~= -1 and distance <= 2.0 then

 			if entity then
				TriggerEvent('esx_useitem:trashcanEnteredEntityZone', entity)
				LastEntity = entity
			end

		else

			if entity ~= nil then
				TriggerEvent('esx_useitem:trashcanhasExitedEntityZone', entity)
				entity = nil
			end

		end

	end
end)

function OpenBin()

  local playerPed = GetPlayerPed(-1)

	Citizen.CreateThread(function()
    
    local playerPed  = GetPlayerPed(-1)

    TaskPlayAnim(playerPed, "amb@prop_human_bum_bin@enter", "enter", 3.5, -8, -1, 2, 0, 0, 0, 0)
    TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
    Citizen.CreateThread(function()
    Citizen.Wait(10000)
    TriggerServerEvent('esx_useitem:bin')
    ClearPedTasksImmediately(playerPed)
    end)
  end)

end ]]

------------------------------------------------------------------------------------------------
---------------------------------------- KEY CONTROLS ------------------------------------------
------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)

      if CurrentAction ~= nil then
         
        SetTextComponentFormat('STRING')
        AddTextComponentString(CurrentActionMsg)
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        
      if IsControlJustReleased(0, 38) then              

        if CurrentAction == 'remove_entity' then
          DeleteEntity(CurrentActionData.entity)
        end

        if CurrentAction == 'open_bin' then
          if GetGameTimer() - lastTime >= 15000 then 
            OpenBin()
            lastTime = GetGameTimer()
          end
        end

          CurrentAction = nil               
      end
    end
  end
end)

RegisterNetEvent('esx_objects:settenuesactac')
AddEventHandler('esx_objects:settenuesactac', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)
    
    TriggerEvent('skinchanger:getSkin', function(skin)

      if skin.sex == 0 then
       local clothesSkin = {
        ['bags_1'] = 44, ['bags_2'] = 0
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
      elseif skin.sex == 1 then
        local clothesSkin = {
        ['bags_1'] = 44, ['bags_2'] = 0
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
      end
      local playerPed = GetPlayerPed(-1)
      ClearPedBloodDamage(playerPed)
      ResetPedVisibleDamage(playerPed)
      ClearPedLastWeaponDamage(playerPed)
    end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)

-- Tenus Hasmat
-- Noir
RegisterNetEvent('esx_objects:settenuehaz1')
AddEventHandler('esx_objects:settenuehaz1', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)
    
    TriggerEvent('skinchanger:getSkin', function(skin)

      if skin.sex == 0 then
       local clothesSkin = {
        ['tshirt_1'] = 62, ['tshirt_2'] = 1,
        ['torso_1'] = 67, ['torso_2'] = 1,
        ['decals_1'] = 0,  ['decals_2'] = 0,
        ['mask_1'] = 46, ['mask_2'] = 0,
        ['arms'] = 38,
        ['pants_1'] = 40, ['pants_2'] = 1,
        ['shoes_1'] = 25, ['shoes_2'] = 0,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['bags_1'] = 44, ['bags_2'] = 0,
        ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
      elseif skin.sex == 1 then
        local clothesSkin = {
        ['tshirt_1'] = 43, ['tshirt_2'] = 1,
        ['torso_1'] = 61, ['torso_2'] = 1,
        ['decals_1'] = 0,  ['decals_2'] = 0,
        ['mask_1'] = 46, ['mask_2'] = 0,
        ['arms'] = 101,
        ['pants_1'] = 40, ['pants_2'] = 1,
        ['shoes_1'] = 25, ['shoes_2'] = 0,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['bags_1'] = 44, ['bags_2'] = 0,
        ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
      end
      local playerPed = GetPlayerPed(-1)
      ClearPedBloodDamage(playerPed)
      ResetPedVisibleDamage(playerPed)
      ClearPedLastWeaponDamage(playerPed)
    end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    
          --Citizen.Wait(6500)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)

--Tenue Hazmat Bleu
RegisterNetEvent('esx_objects:settenuehaz2')
AddEventHandler('esx_objects:settenuehaz2', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)

    TriggerEvent('skinchanger:getSkin', function(skin)

        if skin.sex == 0 then
            local clothesSkin = {
                ['tshirt_1'] = 62, ['tshirt_2'] = 3,
                ['torso_1'] = 67, ['torso_2'] = 3,
                ['decals_1'] = 0,  ['decals_2'] = 0,
                ['mask_1'] = 46, ['mask_2'] = 0,
                ['arms'] = 38,
                ['pants_1'] = 40, ['pants_2'] = 3,
                ['shoes_1'] = 25, ['shoes_2'] = 0,
                ['helmet_1'] = -1, ['helmet_2'] = 0,
                ['bags_1'] = 44, ['bags_2'] = 0,
                ['bproof_1'] = 0,  ['bproof_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        elseif skin.sex == 1 then
            local clothesSkin = {
                ['tshirt_1'] = 43, ['tshirt_2'] = 3,
                ['torso_1'] = 61, ['torso_2'] = 3,
                ['decals_1'] = 0,  ['decals_2'] = 0,
                ['mask_1'] = 46, ['mask_2'] = 0,
                ['arms'] = 101,
                ['pants_1'] = 40, ['pants_2'] = 3,
                ['shoes_1'] = 25, ['shoes_2'] = 0,
                ['helmet_1'] = -1, ['helmet_2'] = 0,
                ['bags_1'] = 44, ['bags_2'] = 0,
                ['bproof_1'] = 0,  ['bproof_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
          end
          local playerPed = GetPlayerPed(-1)
        ClearPedBloodDamage(playerPed)
        ResetPedVisibleDamage(playerPed)
        ClearPedLastWeaponDamage(playerPed)
      end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    
          --Citizen.Wait(6500)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)

-- Jaune
RegisterNetEvent('esx_objects:settenuehaz3')
AddEventHandler('esx_objects:settenuehaz3', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)

    TriggerEvent('skinchanger:getSkin', function(skin)

        if skin.sex == 0 then
            local clothesSkin = {
                ['tshirt_1'] = 62, ['tshirt_2'] = 2,
                ['torso_1'] = 67, ['torso_2'] = 2,
                ['decals_1'] = 0,  ['decals_2'] = 0,
                ['mask_1'] = 46, ['mask_2'] = 0,
                ['arms'] = 38,
                ['pants_1'] = 40, ['pants_2'] = 2,
                ['shoes_1'] = 25, ['shoes_2'] = 0,
                ['helmet_1'] = -1, ['helmet_2'] = 0,
                ['bags_1'] = 44, ['bags_2'] = 0,
                ['bproof_1'] = 0,  ['bproof_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        elseif skin.sex == 1 then
            local clothesSkin = {
                ['tshirt_1'] = 43, ['tshirt_2'] = 2,
                ['torso_1'] = 61, ['torso_2'] = 2,
                ['decals_1'] = 0,  ['decals_2'] = 0,
                ['mask_1'] = 46, ['mask_2'] = 0,
                ['arms'] = 101,
                ['pants_1'] = 40, ['pants_2'] = 2,
                ['shoes_1'] = 25, ['shoes_2'] = 0,
                ['helmet_1'] = -1, ['helmet_2'] = 0,
                ['bags_1'] = 44, ['bags_2'] = 0,
                ['bproof_1'] = 0,  ['bproof_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
          end
          local playerPed = GetPlayerPed(-1)
        ClearPedBloodDamage(playerPed)
        ResetPedVisibleDamage(playerPed)
        ClearPedLastWeaponDamage(playerPed)
      end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    
          --Citizen.Wait(6500)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end
      end)
    end)
  end
  UseTenu  = not UseTenu
end)

-- Blanche
RegisterNetEvent('esx_objects:settenuehaz4')
AddEventHandler('esx_objects:settenuehaz4', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)

    TriggerEvent('skinchanger:getSkin', function(skin)

        if skin.sex == 0 then
            local clothesSkin = {
                ['tshirt_1'] = 62, ['tshirt_2'] = 0,
                ['torso_1'] = 67, ['torso_2'] = 0,
                ['decals_1'] = 0, ['decals_2'] = 0,
                ['mask_1'] = 46, ['mask_2'] = 0,
                ['arms'] = 38,
                ['pants_1'] = 40, ['pants_2'] = 0,
                ['shoes_1'] = 25, ['shoes_2'] = 0,
                ['helmet_1'] = -1, ['helmet_2'] = 0,
                ['bags_1'] = 44, ['bags_2'] = 0,
                ['bproof_1'] = 0, ['bproof_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        elseif skin.sex == 1 then
            local clothesSkin = {
                ['tshirt_1'] = 43, ['tshirt_2'] = 0,
                ['torso_1'] = 61, ['torso_2'] = 0,
                ['decals_1'] = 0, ['decals_2'] = 0,
                ['mask_1'] = 46, ['mask_2'] = 0,
                ['arms'] = 101,
                ['pants_1'] = 40, ['pants_2'] = 0,
                ['shoes_1'] = 25, ['shoes_2'] = 0,
                ['helmet_1'] = -1, ['helmet_2'] = 0,
                ['bags_1'] = 44, ['bags_2'] = 0,
                ['bproof_1'] = 0, ['bproof_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
          end
          local playerPed = GetPlayerPed(-1)
        ClearPedBloodDamage(playerPed)
        ResetPedVisibleDamage(playerPed)
        ClearPedLastWeaponDamage(playerPed)
      end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    
          --Citizen.Wait(6500)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)

-- Casa Papel
RegisterNetEvent('esx_objects:settenuecasa')
AddEventHandler('esx_objects:settenuecasa', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)

    TriggerEvent('skinchanger:getSkin', function(skin)

        if skin.sex == 0 then
            local clothesSkin = {
                ['tshirt_1']  = 15, ['tshirt_2'] = 0,
                ['torso_1'] = 65, ['torso_2'] = 0,
                ['decals_1'] = 0, ['decals_2'] = 0,
                ['mask_1'] = 50, ['mask_2'] = 6,
                ['arms'] = 17,
                ['pants_1'] = 38, ['pants_2'] = 0,
                ['shoes_1'] = 54, ['shoes_2'] = 0,
                ['helmet_1'] = -1, ['helmet_2'] = 0,
                ['bags_1'] = 44, ['bags_2'] = 0,
                ['bproof_1'] = 0, ['bproof_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        elseif skin.sex == 1 then
            local clothesSkin = {
                ['tshirt_1'] = 14, ['tshirt_2'] = 0,
                ['torso_1'] = 59, ['torso_2'] = 0,
                ['decals_1'] = 0, ['decals_2'] = 0,
                ['mask_1'] = 50, ['mask_2'] = 6,
                ['arms'] = 18,
                ['pants_1'] = 38, ['pants_2'] = 0,
                ['shoes_1'] = 55, ['shoes_2'] = 0,
                ['helmet_1'] = -1, ['helmet_2'] = 0,
                ['bags_1'] = 44, ['bags_2'] = 0,
                ['bproof_1'] = 0, ['bproof_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
          end
          local playerPed = GetPlayerPed(-1)
        SetPedArmour(playerPed, 100)
        ClearPedBloodDamage(playerPed)
        ResetPedVisibleDamage(playerPed)
        ClearPedLastWeaponDamage(playerPed)
      end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    
          --Citizen.Wait(6500)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)

--Tenue Karting
RegisterNetEvent('esx_objects:settenuekarting1')
AddEventHandler('esx_objects:settenuekarting1', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)

    TriggerEvent('skinchanger:getSkin', function(skin)

        if skin.sex == 0 then
            local clothesSkin = {
                ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                ['torso_1'] = 147,['torso_2'] = 2,
                ['decals_1'] = 0, ['decals_2'] = 0,
                ['mask_1'] = 0, ['mask_2'] = 0,
                ['arms'] = 22,
                ['pants_1'] = 66, ['pants_2'] = 2,
                ['shoes_1'] = 46, ['shoes_2'] = 2,
                ['helmet_1'] = 62, ['helmet_2'] = 4,
                ['bags_1'] = 0, ['bags_2'] = 0,
                ['bproof_1'] = 0, ['bproof_2']  = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        elseif skin.sex == 1 then
            local clothesSkin = {
                ['tshirt_1'] = 34, ['tshirt_2'] = 0,
                ['torso_1'] = 144,['torso_2'] = 9,
                ['decals_1'] = 0,  ['decals_2'] = 0,
                ['mask_1'] = 0, ['mask_2'] = 0,
                ['arms'] = 36,
                ['pants_1'] = 68, ['pants_2'] = 9,
                ['shoes_1'] = 47, ['shoes_2'] = 9,
                ['helmet_1'] = 71, ['helmet_2'] = 3,
                ['bags_1'] = 0, ['bags_2'] = 0,
                ['bproof_1'] = 0, ['bproof_2']  = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
          end
          local playerPed = GetPlayerPed(-1)
        --SetPedArmour(playerPed, 100)
        ClearPedBloodDamage(playerPed)
        ResetPedVisibleDamage(playerPed)
        ClearPedLastWeaponDamage(playerPed)
      end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    
          --Citizen.Wait(6500)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)

--Tenue Karting boss
RegisterNetEvent('esx_objects:settenuekarting2')
AddEventHandler('esx_objects:settenuekarting2', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)

    TriggerEvent('skinchanger:getSkin', function(skin)

        if skin.sex == 0 then
            local clothesSkin = {
                ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                ['torso_1'] = 147,['torso_2'] = 3,
                ['decals_1'] = 0, ['decals_2'] = 0,
                ['mask_1'] = 0, ['mask_2'] = 0,
                ['arms'] = 17,
                ['pants_1'] = 66, ['pants_2'] = 3,
                ['shoes_1'] = 46, ['shoes_2'] = 3,
                ['helmet_1'] = 58, ['helmet_2'] = 2,
                ['bags_1'] = 0, ['bags_2'] = 0,
                ['bproof_1'] = 0, ['bproof_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        elseif skin.sex == 1 then
            local clothesSkin = {
                ['tshirt_1'] = 34, ['tshirt_2'] = 0,
                ['torso_1'] = 144,['torso_2'] = 9,
                ['decals_1'] = 0, ['decals_2'] = 0,
                ['mask_1'] = 0, ['mask_2'] = 0,
                ['arms'] = 36,
                ['pants_1'] = 68, ['pants_2'] = 9,
                ['shoes_1'] = 47, ['shoes_2'] = 9,
                ['helmet_1'] = 71, ['helmet_2'] = 3,
                ['bags_1'] = 0, ['bags_2'] = 0,
                ['bproof_1'] = 0, ['bproof_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
          end
          local playerPed = GetPlayerPed(-1)
        --SetPedArmour(playerPed, 100)
        ClearPedBloodDamage(playerPed)
        ResetPedVisibleDamage(playerPed)
        ClearPedLastWeaponDamage(playerPed)
      end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    
          --Citizen.Wait(6500)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)

--Tenue Parachute
RegisterNetEvent('esx_objects:settenueskydivingcl')
AddEventHandler('esx_objects:settenueskydivingcl', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)

    TriggerEvent('skinchanger:getSkin', function(skin)

        if skin.sex == 0 then
            local clothesSkin = {
                ['tshirt_1'] = 15, ['tshirt_2'] = 1,
                ['torso_1'] = 148,['torso_2'] = 1,
                ['decals_1'] = 0, ['decals_2']  = 0,
                ['mask_1'] = 0, ['mask_2'] = 0,
                ['arms'] = 17,
                ['pants_1'] = 67, ['pants_2'] = 3,
                ['shoes_1'] = 25, ['shoes_2'] = 0,
                ['helmet_1'] = -1, ['helmet_2'] = 0,
                ['glasses_1'] = 25, ['glasses_2']  = 0,
                ['bags_1'] = 31, ['bags_2'] = 0,
                ['bproof_1'] = 0, ['bproof_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        elseif skin.sex == 1 then
            local clothesSkin = {
                ['tshirt_1'] = 14, ['tshirt_2'] = 0,
                ['torso_1'] = 145,['torso_2'] = 1,
                ['decals_1'] = 0, ['decals_2'] = 0,
                ['mask_1'] = 0,  ['mask_2'] = 0,
                ['arms'] = 42,
                ['pants_1'] = 69, ['pants_2'] = 1,
                ['shoes_1'] = 25, ['shoes_2'] = 0,
                ['helmet_1'] = 19, ['helmet_2'] = 0,
                ['glasses_1'] = 27, ['glasses_2'] = 0,
                ['bags_1'] = 52, ['bags_2'] = 9,
                ['bproof_1'] = 0, ['bproof_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
          end
          local playerPed = GetPlayerPed(-1)
        --SetPedArmour(playerPed, 100)
        ClearPedBloodDamage(playerPed)
        ResetPedVisibleDamage(playerPed)
        ClearPedLastWeaponDamage(playerPed)
      end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    
          --Citizen.Wait(6500)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)

--Tenue Jailer
RegisterNetEvent('esx_objects:settenuejailer')
AddEventHandler('esx_objects:settenuejailer', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)

    TriggerEvent('skinchanger:getSkin', function(skin)

				if skin.sex == 0 then

					local clothesSkin = {
						['tshirt_1'] = 15, ['tshirt_2'] = 0,
						['torso_1'] = 146, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 0,
						['pants_1'] = 3, ['pants_2'] = 7,
						['shoes_1'] = 12, ['shoes_2'] = 12,
						['chain_1'] = 0, ['chain_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

				elseif skin.sex == 1 then

					local clothesSkin = {
						['tshirt_1'] = 3, ['tshirt_2'] = 0,
						['torso_1'] = 38, ['torso_2'] = 3,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 2,
						['pants_1'] = 3, ['pants_2'] = 15,
						['shoes_1'] = 66, ['shoes_2'] = 5,
						['chain_1'] = 0, ['chain_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

				end

				local playerPed = GetPlayerPed(-1)
				ClearPedBloodDamage(playerPed)
				ResetPedVisibleDamage(playerPed)
				ClearPedLastWeaponDamage(playerPed)
				ResetPedMovementClipset(playerPed, 0)
			end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    
          --Citizen.Wait(6500)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)



--Tenue Little
RegisterNetEvent('esx_objects:settenuelittlepricks')
AddEventHandler('esx_objects:settenuelittlepricks', function()
  if UseTenu then

    cleanPlayer(playerPed)
    RequestAnimDict('mp_clothing@female@shoes')
    
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
      Citizen.Wait(0)
    end
    
    --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

    --Citizen.Wait(6500)

    TriggerEvent('skinchanger:getSkin', function(skin)

				if skin.sex == 0 then

					local clothesSkin = {
						['tshirt_1'] = 59, ['tshirt_2'] = 0,
						['torso_1'] = 56, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 19,
						['pants_1'] = 36, ['pants_2'] = 0,
            ['shoes_1'] = 25, ['shoes_2'] = 0,
            ['helmet_1'] = 120
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

				elseif skin.sex == 1 then

					local clothesSkin = {
						['tshirt_1'] = 36, ['tshirt_2'] = 0,
						['torso_1'] = 49, ['torso_2'] = 1,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 20,
						['pants_1'] = 35, ['pants_2'] = 0,
            ['shoes_1'] = 25, ['shoes_2'] = 0,
            ['helmet_1'] = -1
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

				end

				local playerPed = GetPlayerPed(-1)
				ClearPedBloodDamage(playerPed)
				ResetPedVisibleDamage(playerPed)
				ClearPedLastWeaponDamage(playerPed)
				ResetPedMovementClipset(playerPed, 0)
			end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    
          --Citizen.Wait(6500)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)


--Tenue ls Custom's
RegisterNetEvent('esx_objects:settenuelscustoms')
AddEventHandler('esx_objects:settenuelscustoms', function()

  if UseTenu then

    cleanPlayer(playerPed)
      RequestAnimDict('mp_clothing@female@shoes')
      
			while not HasAnimDictLoaded('mp_clothing@female@shoes') do
				Citizen.Wait(0)
      end
      
			--TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

      --Citizen.Wait(6500)

    TriggerEvent('skinchanger:getSkin', function(skin)

				if skin.sex == 0 then

					local clothesSkin = {
						['tshirt_1'] = 15, ['tshirt_2'] = 0,
						['torso_1'] = 65, ['torso_2'] = 0,
						['arms'] = 17,
						['pants_1'] = 38, ['pants_2'] = 0,
            ['shoes_1'] = 25, ['shoes_2'] = 0,
            ['helmet_1'] = 83
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

				elseif skin.sex == 1 then

					local clothesSkin = {
						['tshirt_1'] = 14, ['tshirt_2'] = 0,
						['torso_1'] = 59, ['torso_2'] = 0,
						['arms'] = 19,
						['pants_1'] = 38, ['pants_2'] = 0,
            ['shoes_1'] = 25, ['shoes_2'] = 0,
            ['helmet_1'] = -1
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

				end

				local playerPed = GetPlayerPed(-1)
				ClearPedBloodDamage(playerPed)
				ResetPedVisibleDamage(playerPed)
				ClearPedLastWeaponDamage(playerPed)
				ResetPedMovementClipset(playerPed, 0)
			end)
  else

    TriggerEvent('skinchanger:getSkin', function(skin)

      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)

        if hasSkin then

          cleanPlayer(playerPed)
          RequestAnimDict('mp_clothing@female@shoes')
          
          while not HasAnimDictLoaded('mp_clothing@female@shoes') do
            Citizen.Wait(0)
          end
          
          --TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )

          --Citizen.Wait(6500)
          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end
      end)
    end)
  end
  UseTenu = not UseTenu
end)

function cleanPlayer(playerPed)
  SetPedArmour(playerPed, 0)
  ClearPedBloodDamage(playerPed)
  ResetPedVisibleDamage(playerPed)
  ClearPedLastWeaponDamage(playerPed)
  ResetPedMovementClipset(playerPed, 0)
end

