local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil

local GUI = {}
ESX                           = nil
GUI.Time                      = 0
local PlayerData              = {}

Citizen.CreateThread(function ()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
		  Citizen.Wait(10)
	  end
	  isPlayerWhitelisted = refreshPlayerWhitelisted()
	  PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

AddEventHandler('esx_duty:hasEnteredMarker', function (zone)
    if zone == 'AmbulanceDuty' then
        CurrentAction     = 'ambulance_duty'
        CurrentActionMsg  = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~/~r~terminer ~s~votre service."
        CurrentActionData = {}
    end
    if zone == 'SheriffDuty' then
        CurrentAction     = 'sheriff_duty'
        CurrentActionMsg  = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~/~r~terminer ~s~votre service."
        CurrentActionData = {}
    end
    if zone == 'PoliceDuty' then
        CurrentAction     = 'police_duty'
        CurrentActionMsg  = "Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~/~r~terminer ~s~votre service."
        CurrentActionData = {}
    end
end)

AddEventHandler('esx_duty:hasExitedMarker', function (zone)
    CurrentAction = nil
end)

local posdutyems = {
  { x = -441.465,  y = -318.566,  z = 34.91-0.98 },
  { x = -254.086,  y = 6324.037,  z = 32.40-0.98 }
}

Citizen.CreateThread(function()
  local attente = 150
  while true do
    Wait(attente)
    for k in pairs(posdutyems) do
      local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
      local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posdutyems[k].x, posdutyems[k].y, posdutyems[k].z)
      if dist <= 2.0 then
        attente = 1
        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~/~r~terminer ~s~votre service")
        if IsControlPressed(0, Keys['E']) then
          if PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'offambulance' then
            TriggerServerEvent('duty:ambulance')
            if PlayerData.job.name == 'ambulance' then
              ESX.ShowColoredNotification("Vous êtes désormais considéré ~r~hors service.", 8)
              TriggerServerEvent("player:serviceOff", "ambulance")
              TriggerServerEvent("player:serviceOff", "mort")
              Wait(1000)
            else
              ESX.ShowColoredNotification("Vous êtes désormais considéré ~g~en service.", 25)
              TriggerServerEvent("player:serviceOn", "ambulance")
              TriggerServerEvent("player:serviceOn", "mort")
              Wait(1000)
            end
          else
            ESX.ShowNotification("~r~Vous ne faites pas partie des LSMC.")
            Wait(1000)
          end
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    local playerPed = GetPlayerPed(-1)

    if CurrentAction ~= nil then
      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 0, -1)

      if IsControlPressed(0, Keys['E']) then
        if CurrentAction == 'sheriff_duty' then
          if PlayerData.job.name == 'sheriff' or PlayerData.job.name == 'offsheriff' then
            TriggerServerEvent('duty:sheriff')
          if PlayerData.job.name == 'sheriff' then
            ESX.ShowColoredNotification("Vous êtes désormais considéré ~r~hors service.", 8)
            TriggerServerEvent("player:serviceOff", "sheriff")
            TriggerServerEvent("player:serviceOff", "tir")
            TriggerServerEvent("player:serviceOff", "renfortsheriff")
            TriggerServerEvent("player:serviceOff", "gofast")
            Wait(1000)
          else
            ESX.ShowColoredNotification("Vous êtes désormais considéré ~g~en service.", 25)
            TriggerServerEvent("player:serviceOn", "sheriff")
            TriggerServerEvent("player:serviceOn", "tir")
            TriggerServerEvent("player:serviceOn", "renfortsheriff")
            TriggerServerEvent("player:serviceOn", "gofast")
            Wait(1000)
          end
        else
          ESX.ShowNotification("~r~Vous ne faites pas partie des sheriff's.")
          Wait(1000)
        end
      end

          if CurrentAction == 'police_duty' then
            if PlayerData.job.name == 'police' or PlayerData.job.name == 'offpolice' then
              TriggerServerEvent('duty:police')
              if PlayerData.job.name == 'police' then
                ESX.ShowColoredNotification("Vous êtes désormais considéré ~r~hors service.", 8)
                TriggerServerEvent("player:serviceOff", "police")
                TriggerServerEvent("player:serviceOff", "tir")
                TriggerServerEvent("player:serviceOff", "renforts")
                TriggerServerEvent("player:serviceOff", "cambriolage")
                Wait(1000)
              else
                ESX.ShowColoredNotification("Vous êtes désormais considéré ~g~en service.", 25)
                TriggerServerEvent("player:serviceOn", "police")
                TriggerServerEvent("player:serviceOn", "tir")
                TriggerServerEvent("player:serviceOn", "renforts")
                TriggerServerEvent("player:serviceOn", "cambriolage")
                Wait(1000)
              end
            else
              ESX.ShowNotification("~r~Vous ne faites pas partie de la police.")
              Wait(1000)
            end
          end
        end
      end
    end
  -- end       
end)

AddEventHandler('playerDropped', function()
    if PlayerData.job.name == 'police' or PlayerData.job.name == 'offpolice' then
        TriggerServerEvent('duty:police')
        TriggerServerEvent("player:serviceOff", nil)
    elseif PlayerData.job.name == 'sheriff' or PlayerData.job.name == 'offsheriff' then
        TriggerServerEvent('duty:sheriff')
        TriggerServerEvent("player:serviceOff", nil)
      elseif PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'offambulance' then
        TriggerServerEvent('duty:ambulance')
        TriggerServerEvent("player:serviceOff", nil)
    end
end)

-- Display markers
Citizen.CreateThread(function ()
  while true do
    Wait(0)

    local coords = GetEntityCoords(GetPlayerPed(-1))

    for k,v in pairs(Config.Zones) do
      if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
        DrawMarker(25, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
      end
    end
  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function ()
  while true do
    Wait(0)

    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local isInMarker  = false
    local currentZone = nil

    for k,v in pairs(Config.Zones) do
      if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
        isInMarker  = true
        currentZone = k
      end
    end

    if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
      HasAlreadyEnteredMarker = true
      LastZone                = currentZone
      TriggerEvent('esx_duty:hasEnteredMarker', currentZone)
    end

    if not isInMarker and HasAlreadyEnteredMarker then
      HasAlreadyEnteredMarker = false
      TriggerEvent('esx_duty:hasExitedMarker', LastZone)
    end
  end
end)