ESX = nil
local started = false
local disableUI = false
local viewangle = false
local cost = 0
local cam = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Citizen.Wait(0)
    end
    barber = GetHashKey("s_f_m_fembarber")
    if not HasModelLoaded(barber) then
        RequestModel(barber)
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(19)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        if (GetDistanceBetweenCoords(coords, -821.76, -184.84, 37.56, true) < 3.0) then
            --AddTextEntry(GetCurrentResourceName(), _U('started'))
            ESX.DrawMissionText("~g~Bonjour~w~, voulez-vous prendre place ? ~g~[E]", 20)
            DisplayHelpTextThisFrame(GetCurrentResourceName(), false)
            if IsControlJustReleased(1, 51) then
                --ESX.TriggerServerCallback('barbershop:checkposition', function(result)
                        readyCutHair()
                        createBarber()
                --end)
            end
        end
    end
end)


Citizen.CreateThread(function()
    local blip = AddBlipForCoord(vector3(-820.16, -186.72, 37.56))
    SetBlipSprite(blip, 71)
    SetBlipColour(blip, 66)
    SetBlipScale(blip, 0.5)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName("Bob Mulé Barber")
    EndTextCommandSetBlipName(blip)
end)


function readyCutHair()
    disableUI = true
    TriggerEvent('barbershop:disableUI')
    TaskPedSlideToCoord(PlayerPedId(), -816.68, -184.0, 37.56, 29.616914749146, 1.0)
    DoScreenFadeOut(1000)
    while not IsScreenFadedOut() do
        Citizen.Wait(0)
    end
    SetEntityCoords(PlayerPedId(), -816.44, -182.52, 36.8)
    SetEntityHeading(PlayerPedId(), 33.285522460938)
    ClearPedTasks(GetPlayerPed(-1))
    BehindPlayer = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0 - 0.5, -0.5);
    TaskStartScenarioAtPosition(GetPlayerPed(-1), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", BehindPlayer['x'], BehindPlayer['y'], BehindPlayer['z'], GetEntityHeading(PlayerPedId()), 0, 1, false)
    Citizen.Wait(1300)
    DoScreenFadeIn(5000)
end


function createBarber()
    Ped = CreatePed(1, barber, -808.72, -179.88, 37.56 - 0.95, 0.0, true, true)
    SetEntityHeading(Ped, 127.02490234375)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, true)
    TaskPedSlideToCoord(Ped, -816.68, -184.0, 37.56, 33.285522460938, 1.0)
    Citizen.Wait(10000)
    FreezeEntityPosition(GetPlayerPed(-1), true)
    started = true
    TriggerEvent('barbershop:start')
end


RegisterNetEvent('barbershop:start')
AddEventHandler('barbershop:start', function()
    Citizen.CreateThread(function()
        while started do
            Citizen.Wait(0)
            --print('bjr')
            AddTextEntry(GetCurrentResourceName(), "~INPUT_FRONTEND_ENDSCREEN_ACCEPT~ ~g~Confirmez et partez\n~INPUT_PICKUP~ ~s~Changez de cheuveux - ~g~ 200$\n~INPUT_COVER~ ~s~Changez de barbe - ~g~ 125$\n~INPUT_RELOAD~ ~s~Changez de sourcils - ~g~ 180$")
            DisplayHelpTextThisFrame(GetCurrentResourceName(), true)
            if (IsControlJustPressed(0, 215)) then
                FreezeEntityPosition(GetPlayerPed(-1), false)
                viewangle = false
                started = false
                disableUI = false
                destorycam()
                SetEntityCoords(PlayerPedId(), -821.76, -184.84, 37.56)
                SetEntityHeading(PlayerPedId(), 237.22)
                ClearPedTasks(GetPlayerPed(-1))
                TriggerServerEvent('barbershop:pay', GetPlayerServerId(PlayerId()), cost)
                Citizen.Wait(500)
                TaskPedSlideToCoord(Ped, -808.72, -179.88, 37.56 - 0.95, 29.616914749146, 1.0)
                Citizen.Wait(6000)
                DeletePed(Ped)
                cost = 0
            elseif (IsControlJustPressed(0, 38) or IsControlJustPressed(0, 44) or IsControlJustPressed(0, 45)) then
                started = false
                viewangle = true
                if IsControlJustPressed(0, 38) then
                    DisplayHelpTextThisFrame(GetCurrentResourceName(), true)
                    barberMenu('hairstyle')
                elseif IsControlJustPressed(0, 44) then
                    DisplayHelpTextThisFrame(GetCurrentResourceName(), true)
                    barberMenu('beardstyle')
                elseif IsControlJustPressed(0, 45) then
                    DisplayHelpTextThisFrame(GetCurrentResourceName(), true)
                    barberMenu('eyebrowstyle')
                end
                --createcam(true)
                --TriggerEvent('barbershop:viewangle')
            end
        end
    end)
end)

RegisterNetEvent('barbershop:viewangle')
AddEventHandler('barbershop:viewangle', function()
    Citizen.CreateThread(function()
        while viewangle do
            Citizen.Wait(0)
            ESX.ShowHelpNotification("~INPUT_VEH_FLY_YAW_LEFT~ Vue : ~g~Centrale~s~ ~INPUT_VEH_FLY_YAW_RIGHT~ Vue : ~g~Droite")
            DisplayHelpTextThisFrame(GetCurrentResourceName(), false)
            if (IsControlJustPressed(0, 89)) then
                createcam(true)
            elseif (IsControlJustPressed(0, 90)) then
                createcam(false)
            end
        end
    end)
end)

function createcam(default)
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    if (not DoesCamExist(cam)) then
        if default then
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', -816.80, -182.00, 37.8, 0.0, 0.0, 208.0, 85.0, false, 0)
        else
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', -816.88, -183.32, 37.9, 0.0, 0.0, 299.4, 85.0, false, 0)
        end
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, false)
    end
end

function destorycam()
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    TriggerServerEvent('barbershop:removeposition')
end

RegisterNetEvent('barbershop:disableUI')
AddEventHandler('barbershop:disableUI', function()
    Citizen.CreateThread(function()
        while disableUI do
            Citizen.Wait(0)
            HideHudComponentThisFrame(19)
            DisableControlAction(2, 37, true)
            DisablePlayerFiring(GetPlayerPed(-1), true)
            DisableControlAction(0, 106, true)
            if IsDisabledControlJustPressed(2, 37) or IsDisabledControlJustPressed(0, 106) then
                SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)
            end
        end
    end)
end)

barberMenu = function(style)
    TriggerEvent('skinchanger:getSkin', function(skin)
        lastSkin = skin
    end)
    
    local elements = {}
    local _components = {}
    TriggerEvent('skinchanger:getData', function(components, maxVals)
            -- Restrict menu
            if restrict == nil then
                for i = 1, #components, 1 do
                    _components[i] = components[i]
                end
            else
                for i = 1, #components, 1 do
                    local found = false
                    for j = 1, #restrict, 1 do
                        if components[i].name == restrict[j] then
                            found = true
                        end
                    end
                    
                    if found then
                        table.insert(_components, components[i])
                    end
                end
            end
            
            -- Insert elements
            for i = 1, #_components, 1 do
                local compname = _components[i].name
                local value = _components[i].value
                local componentId = _components[i].componentId
                if componentId == 0 then
                    value = GetPedPropIndex(playerPed, _components[i].componentId)
                end
                if style == 'hairstyle' then
                    if compname == 'hair_1' or compname == 'hair_2' or compname == 'hair_color_1' or compname == 'hair_color_2' then
                        local data = {
                            label = _components[i].label,
                            name = _components[i].name,
                            value = value,
                            min = _components[i].min,
                            textureof = _components[i].textureof,
                            type = 'slider'
                        }
                        
                        for k, v in pairs(maxVals) do
                            if k == _components[i].name then
                                data.max = v
                                break
                            end
                        end
                        table.insert(elements, data)
                    end
                elseif style == 'beardstyle' then
                    if compname == 'beard_1' or compname == 'beard_2' or compname == 'beard_3' or compname == 'beard_4' then
                        local data = {
                            label = _components[i].label,
                            name = _components[i].name,
                            value = value,
                            min = _components[i].min,
                            textureof = _components[i].textureof,
                            type = 'slider'
                        }
                        
                        for k, v in pairs(maxVals) do
                            if k == _components[i].name then
                                data.max = v
                                break
                            end
                        end
                        table.insert(elements, data)
                    end
                elseif style == 'eyebrowstyle' then
                    if compname == 'eyebrows_1' or compname == 'eyebrows_2' or compname == 'eyebrows_3' or compname == 'eyebrows_4' then
                        local data = {
                            label = _components[i].label,
                            name = _components[i].name,
                            value = value,
                            min = _components[i].min,
                            textureof = _components[i].textureof,
                            type = 'slider'
                        }
                        
                        for k, v in pairs(maxVals) do
                            if k == _components[i].name then
                                data.max = v
                                break
                            end
                        end
                        table.insert(elements, data)
                    end
                end
            end
    end)
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'skin', {
        css = 'head',
        title = "Bob Mulé",
        align = 'top-right',
        elements = elements
    }, function(data, menu)
        menu.close()
        --createcam(true)
        viewangle = false
        RequestAnimDict("misshair_shop@barbers")
        while not HasAnimDictLoaded("misshair_shop@barbers") do
            Citizen.Wait(0)
        end
        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerServerEvent('esx_skin:save', skin)
        end)
        TaskPlayAnim(Ped, "misshair_shop@barbers", "keeper_idle_b", 8.0, 8.0, 15000, 0, 0, -1, -1, -1)
        TriggerEvent('skinchanger:getSkin', function(getSkin)
            skin = getSkin
        end)
        Citizen.Wait(11500)
        if style == 'beardstyle' then
            cost = cost + 125
        elseif style == 'eyebrowstyle' then
            cost = cost + 180
        else
            cost = cost + 200
        end
        ESX.UI.Menu.CloseAll()
        started = true
        TriggerEvent('barbershop:start')
    end, function(data, menu)
        menu.close()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
        started = true
        viewangle = false
        TriggerEvent('barbershop:start')
    end, function(data, menu)
        local skin, components, maxVals
        TriggerEvent('skinchanger:getSkin', function(getSkin)
            skin = getSkin
        end)
        if skin[data.current.name] ~= data.current.value then
            TriggerEvent('skinchanger:change', data.current.name, data.current.value)
            TriggerEvent('skinchanger:getData', function(comp, max)
                components, maxVals = comp, max
            end)
            
            local newData = {}
            
            for i = 1, #elements, 1 do
                newData = {}
                newData.max = maxVals[elements[i].name]
                
                if elements[i].textureof ~= nil and data.current.name == elements[i].textureof then
                    newData.value = 0
                end
                
                menu.update({name = elements[i].name}, newData)
            end
            menu.refresh()
        end
    end, function(data, menu)
    end)
end
