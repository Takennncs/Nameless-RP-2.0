local Physgun = false
local Pickup = true
local PlayerID
local EntityID

function GetCoordsInfrontOfCam(distance)
    local GameplayCamRot = GetGameplayCamRot(2)
    local GameplayCamCoord = GetGameplayCamCoord()

    local tan = math.cos(GameplayCamRot.x) * distance
    local xPlane = math.sin(GameplayCamRot.z * -1.0) * tan + GameplayCamCoord.x
    local yPlane = math.cos(GameplayCamRot.z * -1.0) * tan + GameplayCamCoord.y
    local zPlane = math.sin(GameplayCamRot.x) * distance + GameplayCamCoord.z
    return vector3(xPlane, yPlane, zPlane)
end
 
Citizen.CreateThread(function()    
    while true do
        Citizen.Wait(0)
        if (RemoveObjects == true) and (IsControlPressed(0,24)) then
            PlayerID, EntityID = GetEntityPlayerIsFreeAimingAt(PlayerId())
            if (IsEntityAnObject(EntityID) == true ) then
                DeleteEntity(EntityID)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if (Physgun == true) then
            if (Pickup == true) and (IsControlJustReleased(0,24) ) then
                Pickup = false
                PlayerID, EntityID = GetEntityPlayerIsFreeAimingAt(PlayerId())
                if (IsEntityAPed(EntityID) == true) then
                    if (IsPedInAnyVehicle(EntityID,0)) then
                        PlayerID, EntityID = GetVehiclePedIsIn(EntityID,0)
                    end
                end
                local player_cd = GetEntityCoords(PlayerPedId(), false)
                local entity_cd = GetEntityCoords(EntityID, false)
                local pe_distance = GetDistanceBetweenCoords(player_cd.x, player_cd.y, player_cd.z, entity_cd.x, entity_cd.y, entity_cd.z)
                --SetEntityAlpha(EntityID,200)
                --AttachEntityToEntity(EntityID, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), pe_distance, 0.0, 0.0, -78.5, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                DeleteEntity(EntityID)
            elseif  (Pickup == false) and (IsControlJustReleased(0,24) ) then
                --DetachEntity(EntityID, false, true)
                DeleteEntity(EntityID)
                --SetEntityAlpha(EntityID,255)
                Pickup = true
            elseif (Pickup == false and EntityID ~= nil and IsControlPressed(1, 51)) then
                Citizen.Wait(0)
                local player_cd = GetEntityCoords(PlayerPedId(), false)
                local entity_cd = GetEntityCoords(EntityID, false)
                local pe_distance = GetDistanceBetweenCoords(player_cd.x, player_cd.y, player_cd.z, entity_cd.x, entity_cd.y, entity_cd.z)
                --AttachEntityToEntity(EntityID, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), pe_distance + 0.1, 0.0, 0.0, -78.5, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                DeleteEntity(EntityID)
            end
        end
    end
end)

RegisterNetEvent("Physgun:ToggleGun")
AddEventHandler("Physgun:ToggleGun", function()
    Physgun = not Physgun
    TriggerEvent("chatMessage", "[^4Physgun^0]", {255, 255, 255}, "Le physgun est ".. (Physgun and "^2activé" or "^1inactif") .. "^0.")
end)

RegisterNetEvent("actiuvepistolgravity")
AddEventHandler("actiuvepistolgravity", function()
    TriggerEvent("Physgun:ToggleGun", source)
end)