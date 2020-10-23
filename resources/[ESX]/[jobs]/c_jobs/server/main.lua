ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterServerCallback('clp_jobs:getPlayerInventory', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local items = xPlayer.inventory

    cb({
        items = items
    })

end)

ESX.RegisterServerCallback('clp_jobs:getPlayerInventory2', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local blackMoney = xPlayer.getAccount('black_money').money
    local items = xPlayer.inventory

    cb({
        blackMoney = blackMoney,
        items = items
    })
end)

-- Avocat
if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'avocat', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'avocat', 'Client Avocat', true, true)
TriggerEvent('esx_society:registerSociety', 'avocat', 'Avocat', 'society_avocat', 'society_avocat', 'society_avocat', { type = 'private' })

RegisterServerEvent('clp_avocat:annonceAvocat')
AddEventHandler('clp_avocat:annonceAvocat', function(result)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local text = result
    print(text)
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_avocat:annonceAvocat', xPlayers[i], text)
    end

    Citizen.Wait(10000)

    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_avocat:annonceAvocatstop', xPlayers[i])
    end

end)

-- Ajout gestion stock
RegisterServerEvent('clp_avocat:getStockItemAvocat')
AddEventHandler('clp_avocat:getStockItemAvocat', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_avocat', function(inventory)

        local item = inventory.getItem(itemName)

        if item.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

    end)

end)

ESX.RegisterServerCallback('clp_avocat:getStockItemsAvocat', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_avocat', function(inventory)
        cb(inventory.items)
    end)

end)

-- ajout 2
RegisterServerEvent('clp_avocat:putStockItemsAvocat')
AddEventHandler('clp_avocat:putStockItemsAvocat', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_avocat', function(inventory)

        local item = inventory.getItem(itemName)
        local playerItemCount = xPlayer.getInventoryItem(itemName).count

        if item.count >= 0 and count <= playerItemCount then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

    end)

end)

-- Journalist
if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'journalist', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'journalist', 'Client FlashNews', true, true)
TriggerEvent('esx_society:registerSociety', 'journalist', 'FlashNews', 'society_journalist', 'society_journalist', 'society_journalist', { type = 'private' })

RegisterServerEvent('clp_journalist:annonceJournalist')
AddEventHandler('clp_journalist:annonceJournalist', function(result)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local text = result
    print(text)
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_journalist:annonceJournalist', xPlayers[i], text)
    end

    Citizen.Wait(10000)

    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_journalist:annonceJournaliststop', xPlayers[i])
    end

end)

-- Ajout gestion stock
RegisterServerEvent('clp_journalist:getStockItemJournalist')
AddEventHandler('clp_journalist:getStockItemJournalist', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_journalist', function(inventory)

        local item = inventory.getItem(itemName)

        if item.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

    end)

end)

ESX.RegisterServerCallback('clp_journalist:getStockItemsJournalist', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_journalist', function(inventory)
        cb(inventory.items)
    end)

end)

-- ajout 2
RegisterServerEvent('clp_journalist:putStockItemsJournalist')
AddEventHandler('clp_journalist:putStockItemsJournalist', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_journalist', function(inventory)

        local item = inventory.getItem(itemName)
        local playerItemCount = xPlayer.getInventoryItem(itemName).count

        if item.count >= 0 and count <= playerItemCount then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

    end)

end)

-- Taxi
if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'taxi', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'taxi', 'Client Taxi', true, true)
TriggerEvent('esx_society:registerSociety', 'taxi', 'Taxi', 'society_taxi', 'society_taxi', 'society_taxi', { type = 'public' })

RegisterServerEvent('clp_taxi:successTaxi')
AddEventHandler('clp_taxi:successTaxi', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= 'taxi' then
        print(('clp_taxi: %s attempted to trigger success!'):format(xPlayer.identifier))
        return
    end

    math.randomseed(os.time())

    local total = math.random(Config.NPCTaxiJobEarnings.min, Config.NPCTaxiJobEarnings.max)
    local societyAccount

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_taxi', function(account)
        societyAccount = account
    end)


    if societyAccount then
        local societyMoney = ESX.Math.Round(total / 100 * 50)

        societyAccount.addMoney(societyMoney)
        xPlayer.addMoney(societyMoney)

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez gagné ' .. societyMoney .. ' ~g~$~s~', societyMoney)
        --TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez gagné ' .. societyMoney .. ' ~g~$~s~', societyMoney)
    end

end)

RegisterServerEvent('clp_taxi:getStockItemTaxi')
AddEventHandler('clp_taxi:getStockItemTaxi', function(itemName, count)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= 'taxi' then
        print(('clp_taxi: %s attempted to trigger getStockItem!'):format(xPlayer.identifier))
        return
    end

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_taxi', function(inventory)
        local item = inventory.getItem(itemName)
        local sourceItem = xPlayer.getInventoryItem(itemName)

        -- is there enough in the society?
        if count > 0 and item.count >= count then

            -- can the player carry the said amount of x item?
            if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
                TriggerClientEvent('esx:showNotification', xPlayer.source, '~r~Vous n\'avez pas assez de place.')
            else
                inventory.removeItem(itemName, count)
                xPlayer.addInventoryItem(itemName, count)
                TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)
            end
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end
    end)
end)

ESX.RegisterServerCallback('clp_taxi:getStockItemsTaxi', function(source, cb)
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_taxi', function(inventory)
        cb(inventory.items)
    end)
end)

RegisterServerEvent('clp_taxi:putStockItemsTaxi')
AddEventHandler('clp_taxi:putStockItemsTaxi', function(itemName, count)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= 'taxi' then
        print(('clp_taxi: %s attempted to trigger putStockItems!'):format(xPlayer.identifier))
        return
    end

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_taxi', function(inventory)
        local item = inventory.getItem(itemName)

        if item.count >= 0 then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez déposé x' .. count .. ' ' .. item.label)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

    end)

end)

-- Palace
if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'palace', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'palace', 'Client Palace', true, true)
TriggerEvent('esx_society:registerSociety', 'palace', 'Palace', 'society_palace', 'society_palace', 'society_palace', { type = 'private' })

RegisterServerEvent('clp_palace:annoncePalace')
AddEventHandler('clp_palace:annoncePalace', function(result)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local text = result
    print(text)
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_palace:annoncePalace', xPlayers[i], text)
    end

    Citizen.Wait(10000)

    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_palace:annoncePalacestop', xPlayers[i])
    end

end)

-- Ajout gestion stock
RegisterServerEvent('clp_palace:getStockItemPalace')
AddEventHandler('clp_palace:getStockItemPalace', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_palace', function(inventory)

        local item = inventory.getItem(itemName)

        if item.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

    end)

end)

ESX.RegisterServerCallback('clp_palace:getStockItemsPalace', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_palace', function(inventory)
        cb(inventory.items)
    end)

end)

-- ajout 2
RegisterServerEvent('clp_palace:putStockItemsPalace')
AddEventHandler('clp_palace:putStockItemsPalace', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_palace', function(inventory)

        local item = inventory.getItem(itemName)
        local playerItemCount = xPlayer.getInventoryItem(itemName).count

        if item.count >= 0 and count <= playerItemCount then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

    end)

end)

-- Daymson
PlayersHarvestingDaymson = {}
PlayersCraftingDaymson = {}
PlayersSellingDaymson = {}
local cddaym = 1

if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'daymson', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'daymson', 'Client Daymson', true, true)
TriggerEvent('esx_society:registerSociety', 'daymson', 'Daymson', 'society_daymson', 'society_daymson', 'society_daymson', { type = 'private' })

RegisterServerEvent('clp_daymson:annonceDaymson')
AddEventHandler('clp_daymson:annonceDaymson', function(result)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local text = result
    print(text)
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_daymson:annonceDaymson', xPlayers[i], text)
    end

    Citizen.Wait(8000)

    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_daymson:annoncestopDaymson', xPlayers[i])
    end

end)

-- Récupération cd vierge
local function HarvestDaymson(source)
    local _source = source
    SetTimeout(4000, function()

        if PlayersHarvestingDaymson[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local CdviergeQuantity = xPlayer.getInventoryItem('cdvierge').count

            if CdviergeQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez plus de place~s~')
            else
                xPlayer.addInventoryItem('cdvierge', 5)
                HarvestDaymson(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_daymson:startHarvestDaymson')
AddEventHandler('clp_daymson:startHarvestDaymson', function()
    local _source = source
    PlayersHarvestingDaymson[_source] = true
    TriggerClientEvent('esx:showNotification', _source, 'Récupération des ~b~cd vierge~s~...')
    HarvestDaymson(_source)
end)

RegisterServerEvent('clp_daymson:stopHarvestDaymson')
AddEventHandler('clp_daymson:stopHarvestDaymson', function()
    local _source = source
    PlayersHarvestingDaymson[_source] = false
end)

-- Gravure CD
local function CraftDaymson(source)
    local _source = source
    SetTimeout(4000, function()

        if PlayersCraftingDaymson[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local CdviergeQuantity = xPlayer.getInventoryItem('cdvierge').count

            if CdviergeQuantity <= 0 then
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez pas assez de ~w~CD vierge.')
            else
                xPlayer.removeInventoryItem('cdvierge', 5)
                xPlayer.addInventoryItem('cddaym', 5)

                CraftDaymson(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_daymson:startCraftDaymson')
AddEventHandler('clp_daymson:startCraftDaymson', function()
    local _source = source
    PlayersCraftingDaymson[_source] = true
    TriggerClientEvent('esx:showNotification', _source, 'Gravure en ~g~cours~s~...')
    CraftDaymson(_source)
end)

RegisterServerEvent('clp_daymson:stopCraftDaymson')
AddEventHandler('clp_daymson:stopCraftDaymson', function()
    local _source = source
    PlayersCraftingDaymson[_source] = false
end)

-- Vente des cd
local function SellDaymson(source, zone)

    if PlayersSellingDaymson[source] == true then
        local xPlayer = ESX.GetPlayerFromId(source)

        if zone == 'DaymsonSellFarm' then
            if xPlayer.getInventoryItem('cddaym').count <= 1 then
                cddaym = 0
            else
                cddaym = 1
            end

            if cddaym == 0 then
                TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de cd a vendre.')
                return
            elseif xPlayer.getInventoryItem('cddaym').count <= 1 then
                TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de cd a vendre.')
                cddaym = 0
                return
            else
                if (cddaym == 1) then
                    SetTimeout(4000, function()
                        local money = math.random(5, 10)
                        xPlayer.removeInventoryItem('cddaym', 1)

                        local societyAccount
                        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_daymson', function(account)
                            societyAccount = account
                        end)
                        if societyAccount ~= nil then
                            societyAccount.addMoney(money)
                            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Société : +~g~' .. money.."$")
                        end
                        SellDaymson(source, zone)
                    end)
                end

            end
        end
    end
end

RegisterServerEvent('clp_daymson:startSellDaymson')
AddEventHandler('clp_daymson:startSellDaymson', function(zone)

    local _source = source

    if PlayersSellingDaymson[_source] == false then
        TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
        PlayersSellingDaymson[_source] = false
    else
        PlayersSellingDaymson[_source] = true
        TriggerClientEvent('esx:showNotification', _source, '~g~Vente en cours..')
        SellDaymson(_source, zone)
    end

end)

RegisterServerEvent('clp_daymson:stopSellDaymson')
AddEventHandler('clp_daymson:stopSellDaymson', function()

    local _source = source

    if PlayersSellingDaymson[_source] == true then
        PlayersSellingDaymson[_source] = false
        --TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
    else
        --TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
        PlayersSellingDaymson[_source] = true
    end

end)

-- Ajout gestion stock
RegisterServerEvent('clp_daymson:getStockItemDaymson')
AddEventHandler('clp_daymson:getStockItemDaymson', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_daymson', function(inventory)

        local item = inventory.getItem(itemName)

        if item.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

    end)

end)

ESX.RegisterServerCallback('clp_daymson:getStockItemsDaymson', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_daymson', function(inventory)
        cb(inventory.items)
    end)

end)

-- ajout 2
RegisterServerEvent('clp_daymson:putStockItemsDaymson')
AddEventHandler('clp_daymson:putStockItemsDaymson', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_daymson', function(inventory)

        local item = inventory.getItem(itemName)
        local playerItemCount = xPlayer.getInventoryItem(itemName).count

        if item.count >= 0 and count <= playerItemCount then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

    end)

end)

-- Tabac
PlayersHarvestingTabac = {}
PlayersCraftingTabac = {}
PlayersCraftingTabac2 = {}
PlayersCraftingTabac3 = {}
PlayersSellingTabac = {}
PlayersSellingTabac2 = {}
local feuilletabac = 1
local tabacsec = 1
local malbora = 1
local cigar = 1

if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'tabac', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'tabac', 'Client Malborose', true, true)
TriggerEvent('esx_society:registerSociety', 'tabac', 'Tabac', 'society_tabac', 'society_tabac', 'society_tabac', { type = 'private' })

RegisterServerEvent('clp_tabac:annonceTabac')
AddEventHandler('clp_tabac:annonceTabac', function(result)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local text = result
    print(text)
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_tabac:annonceTabac', xPlayers[i], text)
    end

    Citizen.Wait(8000)

    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_tabac:annoncestopTabac', xPlayers[i])
    end

end)

-- Récupération des feuilles de tabac
local function HarvestTabac(source)
    local _source = source
    SetTimeout(4000, function()

        if PlayersHarvestingTabac[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local FeuilleTabacQuantity = xPlayer.getInventoryItem('feuilletabac').count

            if FeuilleTabacQuantity >= 100 then
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez plus de place~s~')
            else
                xPlayer.addInventoryItem('feuilletabac', 5)
                HarvestTabac(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_tabac:startHarvestTabac')
AddEventHandler('clp_tabac:startHarvestTabac', function()
    local _source = source
    PlayersHarvestingTabac[_source] = true
    TriggerClientEvent('esx:showNotification', _source, 'Récupération des ~b~feuilles de tabac~s~...')
    HarvestTabac(_source)
end)

RegisterServerEvent('clp_tabac:stopHarvestTabac')
AddEventHandler('clp_tabac:stopHarvestTabac', function()
    local _source = source
    PlayersHarvestingTabac[_source] = false
end)

-- Séchage du tabac
local function CraftTabac(source)
    local _source = source
    SetTimeout(4000, function()

        if PlayersCraftingTabac[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local FeuilleTabacQuantity = xPlayer.getInventoryItem('feuilletabac').count

            if FeuilleTabacQuantity <= 1 then
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez pas assez de ~s~feuilles de tabac.')
            else
                xPlayer.removeInventoryItem('feuilletabac', 2)
                xPlayer.addInventoryItem('tabacsec', 1)

                CraftTabac(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_tabac:startCraftTabac')
AddEventHandler('clp_tabac:startCraftTabac', function()
    local _source = source
    PlayersCraftingTabac[_source] = true
    TriggerClientEvent('esx:showNotification', _source, 'Séchage en ~g~cours~s~...')
    CraftTabac(_source)
end)

RegisterServerEvent('clp_tabac:stopCraftTabac')
AddEventHandler('clp_tabac:stopCraftTabac', function()
    local _source = source
    PlayersCraftingTabac[_source] = false
end)

-- Tabac sec en cigarette
local function CraftTabac2(source)
    local _source = source
    SetTimeout(2100, function()

        if PlayersCraftingTabac2[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local TabacSecQuantity = xPlayer.getInventoryItem('tabacsec').count

            if TabacSecQuantity <= 1 then
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez pas assez de ~s~tabac sec.')
            else
                xPlayer.removeInventoryItem('tabacsec', 2)
                xPlayer.addInventoryItem('malbora', 1)

                CraftTabac2(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_tabac:startCraftTabac2')
AddEventHandler('clp_tabac:startCraftTabac2', function()
    local _source = source
    PlayersCraftingTabac2[_source] = true
    TriggerClientEvent('esx:showNotification', _source, 'Assemblage ~g~en cours~s~...')
    CraftTabac2(_source)
end)

RegisterServerEvent('clp_tabac:stopCraftTabac2')
AddEventHandler('clp_tabac:stopCraftTabac2', function()
    local _source = source
    PlayersCraftingTabac2[_source] = false
end)

-- Tabac sec en cigar
local function CraftTabac3(source)
    local _source = source
    SetTimeout(2100, function()

        if PlayersCraftingTabac3[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local TabacSecQuantity = xPlayer.getInventoryItem('tabacsec').count

            if TabacSecQuantity <= 2 then
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez pas assez de tabac sec.')
            else
                xPlayer.removeInventoryItem('tabacsec', 3)
                xPlayer.addInventoryItem('cigar', 1)

                CraftTabac3(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_tabac:startCraftTabac3')
AddEventHandler('clp_tabac:startCraftTabac3', function()
    local _source = source
    PlayersCraftingTabac3[_source] = true
    TriggerClientEvent('esx:showNotification', _source, 'Assemblage ~g~en cours~s~...')
    CraftTabac3(_source)
end)

RegisterServerEvent('clp_tabac:stopCraftTabac3')
AddEventHandler('clp_tabac:stopCraftTabac3', function()
    local _source = source
    PlayersCraftingTabac3[_source] = false
end)



-- Vente des cigarettes
local function SellTabac2(source, zone)

    if PlayersSellingTabac2[source] == true then
        local xPlayer = ESX.GetPlayerFromId(source)

        if zone == 'TabacSellFarm2' then
            if xPlayer.getInventoryItem('cigar').count <= 1 then
                cigar = 0
            else
                cigar = 1
            end

            if cigar == 0 then
                TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de cigares à vendre.')
                return
            elseif xPlayer.getInventoryItem('cigar').count <= 1 then
                TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de cigares à vendre.')
                cigar = 0
                return
            else
                if (cigar == 1) then
                    SetTimeout(5000, function()
                        local money = math.random(1, 6)
                        xPlayer.removeInventoryItem('cigar', 2)
                        local societyAccount

                        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_tabac', function(account)
                            societyAccount = account
                        end)
                        if societyAccount ~= nil then
                            societyAccount.addMoney(money)
                            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Société : +~g~' .. money.."$")
                        end
                        xPlayer.addMoney(money)
                        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous : +~g~4$~s~')
                        SellTabac2(source, zone)
                    end)
                end

            end
        end
    end
end

RegisterServerEvent('clp_tabac:startSellTabac2')
AddEventHandler('clp_tabac:startSellTabac2', function(zone)
    local _source = source

    if PlayersSellingTabac2[_source] == false then
        TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
        PlayersSellingTabac2[_source] = false
    else
        PlayersSellingTabac2[_source] = true
        TriggerClientEvent('esx:showNotification', _source, '~g~Vente en cours..')
        SellTabac2(_source, zone)
    end

end)

RegisterServerEvent('clp_tabac:stopSellTabac2')
AddEventHandler('clp_tabac:stopSellTabac2', function()
    local _source = source

    if PlayersSellingTabac2[_source] == true then
        PlayersSellingTabac2[_source] = false
        --TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
    else
        --TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
        PlayersSellingTabac2[_source] = true
    end

end)

-- Ajout gestion stock
RegisterServerEvent('clp_tabac:getStockItemTabac')
AddEventHandler('clp_tabac:getStockItemTabac', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_tabac', function(inventory)

        local item = inventory.getItem(itemName)

        if item.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

    end)

end)

ESX.RegisterServerCallback('clp_tabac:getStockItemsTabac', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_tabac', function(inventory)
        cb(inventory.items)
    end)

end)

-- ajout 2
RegisterServerEvent('clp_tabac:putStockItemsTabac')
AddEventHandler('clp_tabac:putStockItemsTabac', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_tabac', function(inventory)

        local item = inventory.getItem(itemName)
        local playerItemCount = xPlayer.getInventoryItem(itemName).count

        if item.count >= 0 and count <= playerItemCount then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

    end)

end)

-- Vigneron
PlayersHarvestingVigneron = {}
PlayersCraftingVigneron = {}
PlayersCraftingVigneron2 = {}
PlayersSellingVigneron = {}
PlayersSellingVigneron2 = {}
local raisin = 1
local jusraisin = 1
local vin = 1

if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'vigneron', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'vigneron', 'Client Vigneron', true, true)
TriggerEvent('esx_society:registerSociety', 'vigneron', 'Vigneron', 'society_vigneron', 'society_vigneron', 'society_vigneron', { type = 'private' })

RegisterServerEvent('clp_vigneron:annonceVigneron')
AddEventHandler('clp_vigneron:annonceVigneron', function(result)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local text = result
    print(text)
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_vigneron:annonceVigneron', xPlayers[i], text)
    end

    Citizen.Wait(8000)

    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_vigneron:annoncestopVigneron', xPlayers[i])
    end

end)


RegisterServerEvent('clp_taxi:annonceTaxi')
AddEventHandler('clp_taxi:annonceTaxi', function(result)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local text = result
    print(text)
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_taxi:annonceTaxi', xPlayers[i], text)
    end

    Citizen.Wait(8000)

    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_taxi:annoncestopTaxi', xPlayers[i])
    end

end)

-- Récupération du raisin
local function HarvestVigneron(source)
    local _source = source
    SetTimeout(4000, function()

        if PlayersHarvestingVigneron[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local RaisinQuantity = xPlayer.getInventoryItem('raisin').count

            if RaisinQuantity >= 100 then
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez plus de place~s~')
            else
                xPlayer.addInventoryItem('raisin', 5)
                HarvestVigneron(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_vigneron:startHarvestVigneron')
AddEventHandler('clp_vigneron:startHarvestVigneron', function()
    local _source = source
    PlayersHarvestingVigneron[_source] = true
    TriggerClientEvent('esx:showNotification', _source, 'Récupération du ~b~raisin~s~...')
    HarvestVigneron(_source)
end)

RegisterServerEvent('clp_vigneron:stopHarvestVigneron')
AddEventHandler('clp_vigneron:stopHarvestVigneron', function()
    local _source = source
    PlayersHarvestingVigneron[_source] = false
end)

-- Raisin en Jus de raisin
local function CraftVigneron(source)
    local _source = source
    SetTimeout(4000, function()

        if PlayersCraftingVigneron[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local RaisinQuantity = xPlayer.getInventoryItem('raisin').count

            if RaisinQuantity <= 1 then
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez pas assez de raisin.')
            else
                xPlayer.removeInventoryItem('raisin', 2)
                xPlayer.addInventoryItem('jusraisin', 1)

                CraftVigneron(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_vigneron:startCraftVigneron')
AddEventHandler('clp_vigneron:startCraftVigneron', function()
    local _source = source
    PlayersCraftingVigneron[_source] = true
    TriggerClientEvent('esx:showNotification', _source, '~g~Transformation~s~ en cours..')
    CraftVigneron(_source)
end)

RegisterServerEvent('clp_vigneron:stopCraftVigneron')
AddEventHandler('clp_vigneron:stopCraftVigneron', function()
    local _source = source
    PlayersCraftingVigneron[_source] = false
end)

-- Raisin en vin
local function CraftVigneron2(source)
    local _source = source
    SetTimeout(5000, function()

        if PlayersCraftingVigneron2[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local RaisinQuantity = xPlayer.getInventoryItem('raisin').count

            if RaisinQuantity <= 1 then
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez pas assez de ~s~raisin.')
            else
                xPlayer.removeInventoryItem('raisin', 4)
                xPlayer.addInventoryItem('vin', 1)

                CraftVigneron2(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_vigneron:startCraftVigneron2')
AddEventHandler('clp_vigneron:startCraftVigneron2', function()
    local _source = source
    PlayersCraftingVigneron2[_source] = true
    TriggerClientEvent('esx:showNotification', _source, '~g~Distillation~s~ en cours..')
    CraftVigneron2(_source)
end)

RegisterServerEvent('clp_vigneron:stopCraftVigneron2')
AddEventHandler('clp_vigneron:stopCraftVigneron2', function()
    local _source = source
    PlayersCraftingVigneron2[_source] = false
end)

-- Vente jus de raisin
local function SellVigneron(source, zone)
    if PlayersSellingVigneron[source] == true then
        local xPlayer = ESX.GetPlayerFromId(source)

        if zone == 'VigneronSellFarm' then
            if xPlayer.getInventoryItem('jusraisin').count <= 0 then
                jusraisin = 0
            else
                jusraisin = 1
            end

            if jusraisin == 0 then
                TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de ~s~jus de raisin ~r~~à vendre.')
                return
            elseif xPlayer.getInventoryItem('jusraisin').count <= 0 then
                TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de ~s~jus de raisin ~r~à vendre.')
                jusraisin = 0
                return
            else
                if (jusraisin == 1) then
                    SetTimeout(5000, function()
                        local money = math.random(15, 15)
                        xPlayer.removeInventoryItem('jusraisin', 1)
                        local societyAccount

                        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigneron', function(account)
                            societyAccount = account
                        end)
                        if societyAccount ~= nil then
                            societyAccount.addMoney(money)
                            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Société : +~g~' .. money.."$")
                        end
                        xPlayer.addMoney(10)
                        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous : +~g~10$~s~')
                        SellVigneron(source, zone)
                    end)
                end

            end
        end
    end
end

RegisterServerEvent('clp_vigneron:startSellVigneron')
AddEventHandler('clp_vigneron:startSellVigneron', function(zone)
    local _source = source

    if PlayersSellingVigneron[_source] == false then
        TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
        PlayersSellingVigneron[_source] = false
    else
        PlayersSellingVigneron[_source] = true
        TriggerClientEvent('esx:showNotification', _source, '~g~Vente en cours..')
        SellVigneron(_source, zone)
    end

end)

RegisterServerEvent('clp_vigneron:stopSellVigneron')
AddEventHandler('clp_vigneron:stopSellVigneron', function()
    local _source = source

    if PlayersSellingVigneron[_source] == true then
        PlayersSellingVigneron[_source] = false
        --TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
    else
        --TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
        PlayersSellingVigneron[_source] = true
    end

end)

-- Vente de vin
local function SellVigneron2(source, zone)

    if PlayersSellingVigneron2[source] == true then
        local xPlayer = ESX.GetPlayerFromId(source)

        if zone == 'VigneronSellFarm2' then
            if xPlayer.getInventoryItem('vin').count <= 0 then
                vin = 0
            else
                vin = 1
            end

            if vin == 0 then
                TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de vin a vendre.')
                return
            elseif xPlayer.getInventoryItem('vin').count <= 0 then
                TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de vin a vendre.')
                vin = 0
                return
            else
                if (vin == 1) then
                    SetTimeout(3000, function()
                        local money = math.random(15, 15)
                        xPlayer.removeInventoryItem('vin', 1)
                        local societyAccount

                        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigneron', function(account)
                            societyAccount = account
                        end)
                        if societyAccount ~= nil then
                            societyAccount.addMoney(money)
                            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Société : +~g~' .. money.."$")
                        end
                        xPlayer.addMoney(10)
                        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous : +~g~10$~s~')
                        SellVigneron2(source, zone)
                    end)
                end

            end
        end
    end
end

RegisterServerEvent('clp_vigneron:startSellVigneron2')
AddEventHandler('clp_vigneron:startSellVigneron2', function(zone)
    local _source = source

    if PlayersSellingVigneron2[_source] == false then
        TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
        PlayersSellingVigneron2[_source] = false
    else
        PlayersSellingVigneron2[_source] = true
        TriggerClientEvent('esx:showNotification', _source, '~g~Vente en cours..')
        SellVigneron2(_source, zone)
    end

end)

RegisterServerEvent('clp_vigneron:stopSellVigneron2')
AddEventHandler('clp_vigneron:stopSellVigneron2', function()
    local _source = source

    if PlayersSellingVigneron2[_source] == true then
        PlayersSellingVigneron2[_source] = false
        --TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
    else
        --TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
        PlayersSellingVigneron2[_source] = true
    end

end)

-- Ajout gestion stock
RegisterServerEvent('clp_vigneron:getStockItemVigneron')
AddEventHandler('clp_vigneron:getStockItemVigneron', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigneron', function(inventory)

        local item = inventory.getItem(itemName)

        if item.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

    end)

end)

ESX.RegisterServerCallback('clp_vigneron:getStockItemsVigneron', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigneron', function(inventory)
        cb(inventory.items)
    end)

end)

-- ajout 2
RegisterServerEvent('clp_vigneron:putStockItemsVigneron')
AddEventHandler('clp_vigneron:putStockItemsVigneron', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigneron', function(inventory)

        local item = inventory.getItem(itemName)
        local playerItemCount = xPlayer.getInventoryItem(itemName).count

        if item.count >= 0 and count <= playerItemCount then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

    end)

end)

-- Unicorn
PlayersHarvestingUnicorn = {}
PlayersHarvestingUnicorn2 = {}
PlayersCraftingUnicorn = {}
PlayersCraftingUnicorn2 = {}
PlayersCraftingUnicorn3 = {}
PlayersCraftingUnicorn4 = {}

if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'unicorn', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'unicorn', 'Client Unicorn', true, true)
TriggerEvent('esx_society:registerSociety', 'unicorn', 'Unicorn', 'society_unicorn', 'society_unicorn', 'society_unicorn', { type = 'private' })

RegisterServerEvent('clp_unicorn:annonceUnicorn')
AddEventHandler('clp_unicorn:annonceUnicorn', function(result)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local text = result
    print(text)
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_unicorn:annonceUnicorn', xPlayers[i], text)
    end

    Citizen.Wait(8000)

    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_unicorn:annoncestopUnicorn', xPlayers[i])
    end

end)

-- Récupération du houblon
local function HarvestUnicorn(source)
    local _source = source
    SetTimeout(4000, function()

        if PlayersHarvestingUnicorn[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local HoublonQuantity = xPlayer.getInventoryItem('houblon').count

            if HoublonQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez plus de place~s~')
            else
                xPlayer.addInventoryItem('houblon', 2)
                HarvestUnicorn(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_unicorn:startHarvestUnicorn')
AddEventHandler('clp_unicorn:startHarvestUnicorn', function()
    local _source = source
    PlayersHarvestingUnicorn[_source] = true
    TriggerClientEvent('esx:showNotification', _source, 'Récupération du ~b~houblon~s~...')
    HarvestUnicorn(_source)
end)

RegisterServerEvent('clp_unicorn:stopHarvestUnicorn')
AddEventHandler('clp_unicorn:stopHarvestUnicorn', function()
    local _source = source
    PlayersHarvestingUnicorn[_source] = false
end)

-- Récupération malt
local function HarvestUnicorn2(source)
    local _source = source
    SetTimeout(4000, function()

        if PlayersHarvestingUnicorn2[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local MaltQuantity = xPlayer.getInventoryItem('malt').count

            if MaltQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez plus de place~s~')
            else
                xPlayer.addInventoryItem('malt', 2)
                HarvestUnicorn2(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_unicorn:startHarvestUnicorn2')
AddEventHandler('clp_unicorn:startHarvestUnicorn2', function()
    local _source = source
    PlayersHarvestingUnicorn2[_source] = true
    TriggerClientEvent('esx:showNotification', _source, 'Récupération du ~b~malt~s~...')
    HarvestUnicorn2(_source)
end)

RegisterServerEvent('clp_unicorn:stopHarvestUnicorn2')
AddEventHandler('clp_unicorn:stopHarvestUnicorn2', function()
    local _source = source
    PlayersHarvestingUnicorn2[_source] = false
end)





-- craft bière
local function CraftUnicorn(source)
    local _source = source
    SetTimeout(4000, function()

        if PlayersCraftingUnicorn[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local HoublonBiereQuantity = xPlayer.getInventoryItem('houblon').count
            local MaltBiereQuantity = xPlayer.getInventoryItem('malt').count
            local LevureBiereQuantity = xPlayer.getInventoryItem('levure').count
            local WaterBiereQuantity = xPlayer.getInventoryItem('water').count

            if HoublonBiereQuantity >= 5  then
				xPlayer.removeInventoryItem('houblon', 5)
				--xPlayer.removeInventoryItem('malt', 2)
				--xPlayer.removeInventoryItem('levure', 1)
				--xPlayer.removeInventoryItem('water', 1)
				xPlayer.addInventoryItem('biere', 1)

				CraftUnicorn(_source)
            else
				TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez pas assez de ~s~composants nécessaires.')
            end
        end
    end)
end

RegisterServerEvent('clp_unicorn:startCraftUnicorn')
AddEventHandler('clp_unicorn:startCraftUnicorn', function()
    local _source = source
    PlayersCraftingUnicorn[_source] = true
    TriggerClientEvent('esx:showNotification', _source, '~g~Distillation~s~ en cours..')
    CraftUnicorn(_source)
end)

RegisterServerEvent('clp_unicorn:stopCraftUnicorn')
AddEventHandler('clp_unicorn:stopCraftUnicorn', function()
    local _source = source
    PlayersCraftingUnicorn[_source] = false
end)





-- Craft cocktail
local function CraftUnicorn2(source)
    local _source = source
    SetTimeout(4000, function()

        if PlayersCraftingUnicorn2[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local JusfruitCocktailQuantity = xPlayer.getInventoryItem('houblon').count
            local BananeCocktailQuantity = xPlayer.getInventoryItem('banane').count
            local SiropCocktailQuantity = xPlayer.getInventoryItem('sirop').count
            local GlaconCocktailQuantity = xPlayer.getInventoryItem('glacon').count

            if JusfruitCocktailQuantity >= 7 then
                xPlayer.removeInventoryItem('houblon', 7)
                --xPlayer.removeInventoryItem('banane', 1)
                --xPlayer.removeInventoryItem('sirop', 1)
                --xPlayer.removeInventoryItem('glacon', 2)
                xPlayer.addInventoryItem('cocktail', 1)

                CraftUnicorn2(_source)
            else
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez pas assez de ~s~composants nécessaires.')
            end
        end
    end)
end

RegisterServerEvent('clp_unicorn:startCraftUnicorn2')
AddEventHandler('clp_unicorn:startCraftUnicorn2', function()
    local _source = source
    PlayersCraftingUnicorn2[_source] = true
    TriggerClientEvent('esx:showNotification', _source, '~g~Distillation~s~ en cours..')
    CraftUnicorn2(_source)
end)

RegisterServerEvent('clp_unicorn:stopCraftUnicorn2')
AddEventHandler('clp_unicorn:stopCraftUnicorn2', function()
    local _source = source
    PlayersCraftingUnicorn2[_source] = false
end)




-- Craft mojito
local function CraftUnicorn3(source)
    local _source = source
    SetTimeout(4000, function()

        if PlayersCraftingUnicorn3[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local RhumMojitoQuantity = xPlayer.getInventoryItem('houblon').count
            local SucrecanneMojitoQuantity = xPlayer.getInventoryItem('sucrecanne').count
            local SiropMojitoQuantity = xPlayer.getInventoryItem('menthe').count
            local CitronMojitoQuantity = xPlayer.getInventoryItem('citron').count
            local WatergMojitoQuantity = xPlayer.getInventoryItem('waterg').count
            local GlaconMojitoQuantity = xPlayer.getInventoryItem('glacon').count

            if RhumMojitoQuantity >= 6 then
                xPlayer.removeInventoryItem('houblon', 6)
                --xPlayer.removeInventoryItem('sucrecanne', 1)
                --xPlayer.removeInventoryItem('menthe', 1)
                --xPlayer.removeInventoryItem('citron', 1)
                --xPlayer.removeInventoryItem('waterg', 1)
                --xPlayer.removeInventoryItem('glacon', 2)
                xPlayer.addInventoryItem('mojito', 1)

                CraftUnicorn3(_source)
            else
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez pas assez de ~s~composants nécessaires.')
            end
        end
    end)
end

RegisterServerEvent('clp_unicorn:startCraftUnicorn3')
AddEventHandler('clp_unicorn:startCraftUnicorn3', function()
    local _source = source
    PlayersCraftingUnicorn3[_source] = true
    TriggerClientEvent('esx:showNotification', _source, '~g~Distillation~s~ en cours..')
    CraftUnicorn3(_source)
end)

RegisterServerEvent('clp_unicorn:stopCraftUnicorn3')
AddEventHandler('clp_unicorn:stopCraftUnicorn3', function()
    local _source = source
    PlayersCraftingUnicorn3[_source] = false
end)




-- Craft Rhum
local function CraftUnicorn4(source)
    local _source = source
    SetTimeout(4000, function()

        if PlayersCraftingUnicorn4[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local LevureRhumQuantity = xPlayer.getInventoryItem('houblon').count
            local JuscanneRhumQuantity = xPlayer.getInventoryItem('juscanne').count
            local SiropRhumQuantity = xPlayer.getInventoryItem('sirop').count

            if LevureRhumQuantity >= 4 then
				xPlayer.removeInventoryItem('houblon', 4)
				--xPlayer.removeInventoryItem('juscanne', 1)
				--xPlayer.removeInventoryItem('sirop', 1)
				xPlayer.addInventoryItem('rhum', 1)

				CraftUnicorn4(_source)
            else
				TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez pas assez de ~s~composants nécessaires.')
            end
        end
    end)
end

RegisterServerEvent('clp_unicorn:startCraftUnicorn4')
AddEventHandler('clp_unicorn:startCraftUnicorn4', function()
    local _source = source
    PlayersCraftingUnicorn4[_source] = true
    TriggerClientEvent('esx:showNotification', _source, '~g~Distillation~s~ en cours..')
    CraftUnicorn4(_source)
end)

RegisterServerEvent('clp_unicorn:stopCraftUnicorn4')
AddEventHandler('clp_unicorn:stopCraftUnicorn4', function()
    local _source = source
    PlayersCraftingUnicorn4[_source] = false
end)
















-- Ajout gestion stock
RegisterServerEvent('clp_unicorn:getStockItemUnicorn')
AddEventHandler('clp_unicorn:getStockItemUnicorn', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)

        local item = inventory.getItem(itemName)

        if item.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

    end)

end)

ESX.RegisterServerCallback('clp_unicorn:getStockItemsUnicorn', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
        cb(inventory.items)
    end)

end)

-- ajout 2
RegisterServerEvent('clp_unicorn:putStockItemsUnicorn')
AddEventHandler('clp_unicorn:putStockItemsUnicorn', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)

        local item = inventory.getItem(itemName)
        local playerItemCount = xPlayer.getInventoryItem(itemName).count

        if item.count >= 0 and count <= playerItemCount then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

    end)

end)

-- Carpenter
PlayersHarvestingCarpenter = {}
PlayersCraftingCarpenter = {}
PlayersCraftingCarpenter2 = {}
PlayersSellingCarpenter = {}
local bois = 1
local planche = 1
local paquetplanche = 1

if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'Carpenter', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'Carpenter', 'Client Carpenter', true, true)
TriggerEvent('esx_society:registerSociety', 'Carpenter', 'Carpenter', 'society_Carpenter', 'society_Carpenter', 'society_Carpenter', { type = 'private' })

RegisterServerEvent('clp_Carpenter:annonceCarpenter')
AddEventHandler('clp_Carpenter:annonceCarpenter', function(result)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local text = result
    print(text)
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_Carpenter:annonceCarpenter', xPlayers[i], text)
    end

    Citizen.Wait(8000)

    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_Carpenter:annoncestopCarpenter', xPlayers[i])
    end

end)

-- Récupération du bois
local function HarvestCarpenter(source)
    local _source = source
    SetTimeout(2500, function()

        if PlayersHarvestingCarpenter[_source] == true then
            local xPlayer = ESX.GetPlayerFromId(_source)
            local PlancheToBoisQuantity = xPlayer.getInventoryItem('bois').count

            if PlancheToBoisQuantity >= 50 then
                --TriggerClientEvent('esx:showNotification', _source, '~r~Vous avez trop de rondins.')
                TriggerClientEvent('esx:DrawMissionText', _source, '~r~Vous avez trop de rondins de bois.', 1250)
            else
                xPlayer.addInventoryItem('bois', 1)
                HarvestCarpenter(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_Carpenter:startHarvestCarpenter')
AddEventHandler('clp_Carpenter:startHarvestCarpenter', function()
    local _source = source
    PlayersHarvestingCarpenter[_source] = true
    TriggerClientEvent('esx:showNotification', _source, '~g~Récupération des rondins...')
    HarvestCarpenter(_source)
end)

RegisterServerEvent('clp_Carpenter:stopHarvestCarpenter')
AddEventHandler('clp_Carpenter:stopHarvestCarpenter', function()
    local _source = source
    PlayersHarvestingCarpenter[_source] = false
end)


RegisterServerEvent('clp_Carpenter:stopCraftCarpenter')
AddEventHandler('clp_Carpenter:stopCraftCarpenter', function()
    local _source = source
    PlayersCraftingCarpenter[_source] = false
end)

-- Planche en paquet de planche
local function CraftCarpenter2(source)
    local _source = source
    SetTimeout(2500, function()

        if PlayersCraftingCarpenter2[_source] == true then
            local xPlayer = ESX.GetPlayerFromId(_source)
            local PlanchePaquetQuantity = xPlayer.getInventoryItem('bois').count

            if PlanchePaquetQuantity <= 0 then
                --TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez pas assez de rondins de bois.')
                TriggerClientEvent('esx:DrawMissionText', _source, '~r~Vous n\'avez pas assez de rondins de bois.', 3500)
            else
                xPlayer.removeInventoryItem('bois', 1)
                xPlayer.addInventoryItem('planche', 1)

                CraftCarpenter2(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_Carpenter:startCraftCarpenter2')
AddEventHandler('clp_Carpenter:startCraftCarpenter2', function()
    local _source = source
    PlayersCraftingCarpenter2[_source] = true
    TriggerClientEvent('esx:showNotification', _source, '~g~Découpe en cours...')
    CraftCarpenter2(_source)
end)

RegisterServerEvent('clp_Carpenter:stopCraftCarpenter2')
AddEventHandler('clp_Carpenter:stopCraftCarpenter2', function()
    local _source = source
    PlayersCraftingCarpenter2[_source] = false
end)

-- Vente des paquet de planches
local function SellCarpenter(source, zone)

    if PlayersSellingCarpenter[source] == true then
        local xPlayer = ESX.GetPlayerFromId(source)

        if zone == 'CarpenterSellFarm' then
            if xPlayer.getInventoryItem('planche').count <= 0 then
                paquetplanche = 0
            else
                paquetplanche = 1
            end

            if paquetplanche == 0 then
                --TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de paquet de ~s~planches ~r~a vendre.')
                TriggerClientEvent('esx:DrawMissionText', source, '~r~Vous n\'avez pas assez de planches.', 3500)
                return
            elseif xPlayer.getInventoryItem('planche').count <= 0 then
               --TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de paquet de ~s~planches ~r~a vendre.')
                TriggerClientEvent('esx:DrawMissionText', source, '~r~Vous n\'avez pas assez de planches.', 3500)
                paquetplanche = 0
                return
            else
                if (paquetplanche == 1) then
                    SetTimeout(3000, function()
                        xPlayer.removeInventoryItem('planche', 1)

                        local money = math.random(6, 11)
                        xPlayer.addMoney(money)
                        --TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous : +~g~$' .. money)
                        TriggerClientEvent('esx:DrawMissionText', xPlayer.source, 'Vous avez vendu une planche pour ~g~' ..money..'$', 1250)
                        SellCarpenter(source, zone)
                    end)
                end

            end
        end
    end
end

RegisterServerEvent('clp_Carpenter:startSellCarpenter')
AddEventHandler('clp_Carpenter:startSellCarpenter', function(zone)
    local _source = source

    if PlayersSellingCarpenter[_source] == false then
        TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
        PlayersSellingCarpenter[_source] = false
    else
        PlayersSellingCarpenter[_source] = true
        TriggerClientEvent('esx:showNotification', _source, '~g~Vente en cours..')
        SellCarpenter(_source, zone)
    end

end)

RegisterServerEvent('clp_Carpenter:stopSellCarpenter')
AddEventHandler('clp_Carpenter:stopSellCarpenter', function()
    local _source = source

    if PlayersSellingCarpenter[_source] == true then
        PlayersSellingCarpenter[_source] = false
        --TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
    else
        --TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
        PlayersSellingCarpenter[_source] = true
    end

end)

-- Ajout gestion stock
RegisterServerEvent('clp_Carpenter:getStockItemCarpenter')
AddEventHandler('clp_Carpenter:getStockItemCarpenter', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_Carpenter', function(inventory)

        local item = inventory.getItem(itemName)

        if item.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

    end)

end)

ESX.RegisterServerCallback('clp_Carpenter:getStockItemsCarpenter', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_Carpenter', function(inventory)
        cb(inventory.items)
    end)

end)

-- ajout 2
RegisterServerEvent('clp_Carpenter:putStockItemsCarpenter')
AddEventHandler('clp_Carpenter:putStockItemsCarpenter', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_Carpenter', function(inventory)

        local item = inventory.getItem(itemName)
        local playerItemCount = xPlayer.getInventoryItem(itemName).count

        if item.count >= 0 and count <= playerItemCount then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

    end)

end)

-- Skiver
PlayersHarvestingSkiver = {}
PlayersCraftingSkiver = {}
PlayersCraftingSkiver2 = {}
PlayersSellingSkiver = {}
local bois = 1
local planche = 1
local paquetplanche = 1

if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'Skiver', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'Skiver', 'Client Skiver', true, true)
TriggerEvent('esx_society:registerSociety', 'Skiver', 'Skiver', 'society_Skiver', 'society_Skiver', 'society_Skiver', { type = 'private' })

-- Récupération du bois
local function HarvestSkiver(source)
    local _source = source
    SetTimeout(2500, function()

        if PlayersHarvestingSkiver[_source] == true then
            local xPlayer = ESX.GetPlayerFromId(_source)
            local PlancheTopierreQuantity = xPlayer.getInventoryItem('pierre').count

            if PlancheTopierreQuantity >= 50 then
                --TriggerClientEvent('esx:showNotification', _source, '~r~Vous avez trop de rondins.')
                TriggerClientEvent('esx:DrawMissionText', _source, '~r~Vous avez trop de pierres.', 1250)
            else
                xPlayer.addInventoryItem('pierre', 1)
                HarvestSkiver(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_Skiver:startHarvestSkiver')
AddEventHandler('clp_Skiver:startHarvestSkiver', function()
    local _source = source
    PlayersHarvestingSkiver[_source] = true
    TriggerClientEvent('esx:showNotification', _source, '~g~Récupération des pierres...')
    HarvestSkiver(_source)
end)

RegisterServerEvent('clp_Skiver:stopHarvestSkiver')
AddEventHandler('clp_Skiver:stopHarvestSkiver', function()
    local _source = source
    PlayersHarvestingSkiver[_source] = false
end)


RegisterServerEvent('clp_Skiver:stopCraftSkiver')
AddEventHandler('clp_Skiver:stopCraftSkiver', function()
    local _source = source
    PlayersCraftingSkiver[_source] = false
end)

local function CraftSkiver2(source)
    local _source = source
    SetTimeout(2500, function()

        if PlayersCraftingSkiver2[_source] == true then
            local xPlayer = ESX.GetPlayerFromId(_source)
            local PlancheBriqueQuantity = xPlayer.getInventoryItem('pierre').count

            if PlancheBriqueQuantity <= 0 then
                --TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez pas assez de rondins de bois.')
                TriggerClientEvent('esx:DrawMissionText', _source, '~r~Vous n\'avez pas assez de pierres.', 3500)
            else
                xPlayer.removeInventoryItem('pierre', 1)
                xPlayer.addInventoryItem('brique', 1)

                CraftSkiver2(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_Skiver:startCraftSkiver2')
AddEventHandler('clp_Skiver:startCraftSkiver2', function()
    local _source = source
    PlayersCraftingSkiver2[_source] = true
    TriggerClientEvent('esx:showNotification', _source, '~g~Découpe en cours...')
    CraftSkiver2(_source)
end)

RegisterServerEvent('clp_Skiver:stopCraftSkiver2')
AddEventHandler('clp_Skiver:stopCraftSkiver2', function()
    local _source = source
    PlayersCraftingSkiver2[_source] = false
end)

-- Vente des paquet de planches
local function SellSkiver(source, zone)

    if PlayersSellingSkiver[source] == true then
        local xPlayer = ESX.GetPlayerFromId(source)

        if zone == 'SkiverSellFarm' then
            if xPlayer.getInventoryItem('brique').count <= 0 then
                paquetplanche = 0
            else
                paquetplanche = 1
            end

            if paquetplanche == 0 then
                --TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de paquet de ~s~planches ~r~a vendre.')
                TriggerClientEvent('esx:DrawMissionText', source, '~r~Vous n\'avez pas assez de briques.', 3500)
                return
            elseif xPlayer.getInventoryItem('brique').count <= 0 then
               --TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de paquet de ~s~planches ~r~a vendre.')
                TriggerClientEvent('esx:DrawMissionText', source, '~r~Vous n\'avez pas assez de briques.', 3500)
                paquetplanche = 0
                return
            else
                if (paquetplanche == 1) then
                    SetTimeout(3000, function()
                        xPlayer.removeInventoryItem('brique', 1)

                        local money = math.random(6, 11)
                        xPlayer.addMoney(money)
                        --TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous : +~g~$' .. money)
                        TriggerClientEvent('esx:DrawMissionText', xPlayer.source, 'Vous avez vendu une brique pour ~g~' ..money..'$', 1250)
                        SellSkiver(source, zone)
                    end)
                end

            end
        end
    end
end

RegisterServerEvent('clp_Skiver:startSellSkiver')
AddEventHandler('clp_Skiver:startSellSkiver', function(zone)
    local _source = source

    if PlayersSellingSkiver[_source] == false then
        TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
        PlayersSellingSkiver[_source] = false
    else
        PlayersSellingSkiver[_source] = true
        TriggerClientEvent('esx:showNotification', _source, '~g~Vente en cours..')
        SellSkiver(_source, zone)
    end

end)

RegisterServerEvent('clp_Skiver:stopSellSkiver')
AddEventHandler('clp_Skiver:stopSellSkiver', function()
    local _source = source

    if PlayersSellingSkiver[_source] == true then
        PlayersSellingSkiver[_source] = false
        --TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
    else
        --TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
        PlayersSellingSkiver[_source] = true
    end

end)

-- Ajout gestion stock
RegisterServerEvent('clp_Skiver:getStockItemSkiver')
AddEventHandler('clp_Skiver:getStockItemSkiver', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_Skiver', function(inventory)

        local item = inventory.getItem(itemName)

        if item.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

    end)

end)

ESX.RegisterServerCallback('clp_Skiver:getStockItemsSkiver', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_Skiver', function(inventory)
        cb(inventory.items)
    end)

end)

-- ajout 2
RegisterServerEvent('clp_Skiver:putStockItemsSkiver')
AddEventHandler('clp_Skiver:putStockItemsSkiver', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_Skiver', function(inventory)

        local item = inventory.getItem(itemName)
        local playerItemCount = xPlayer.getInventoryItem(itemName).count

        if item.count >= 0 and count <= playerItemCount then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

    end)

end)

-- Abatteur
PlayersHarvestingAbatteur = {}
PlayersCraftingAbatteur = {}
PlayersCraftingAbatteur2 = {}
PlayersSellingAbatteur = {}
local bois = 1
local planche = 1
local paquetplanche = 1

if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'abatteur', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'abatteur', 'Client Malborose', true, true)
TriggerEvent('esx_society:registerSociety', 'abatteur', 'Abatteur', 'society_abatteur', 'society_abatteur', 'society_abatteur', { type = 'private' })

RegisterServerEvent('clp_abatteur:annonceAbatteur')
AddEventHandler('clp_abatteur:annonceAbatteur', function(result)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local text = result
    print(text)
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_abatteur:annonceAbatteur', xPlayers[i], text)
    end

    Citizen.Wait(8000)

    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_abatteur:annoncestopAbatteur', xPlayers[i])
    end

end)

-- Récupération du bois
local function HarvestAbatteur(source)
    local _source = source
    SetTimeout(5000, function()

        if PlayersHarvestingAbatteur[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local BoisQuantity = xPlayer.getInventoryItem('bois').count

            if BoisQuantity >= 5 then
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez plus de place~s~')
            else
                xPlayer.addInventoryItem('bois', 1)
                HarvestAbatteur(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_abatteur:startHarvestAbatteur')
AddEventHandler('clp_abatteur:startHarvestAbatteur', function()
    local _source = source
    PlayersHarvestingAbatteur[_source] = true
    TriggerClientEvent('esx:showNotification', _source, 'Récupération du ~b~bois~s~...')
    HarvestAbatteur(_source)
end)

RegisterServerEvent('clp_abatteur:stopHarvestAbatteur')
AddEventHandler('clp_abatteur:stopHarvestAbatteur', function()
    local _source = source
    PlayersHarvestingAbatteur[_source] = false
end)

-- Bois en planche
local function CraftAbatteur(source)
    local _source = source
    SetTimeout(5000, function()

        if PlayersCraftingAbatteur[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local BoisPlancheQuantity = xPlayer.getInventoryItem('bois').count

            if BoisPlancheQuantity <= 0 then
                TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez pas assez de ~s~Bois.')
            else
                xPlayer.removeInventoryItem('bois', 1)
                xPlayer.addInventoryItem('planche', 4)

                CraftAbatteur(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_abatteur:startCraftAbatteur')
AddEventHandler('clp_abatteur:startCraftAbatteur', function()
    local _source = source
    PlayersCraftingAbatteur[_source] = true
    TriggerClientEvent('esx:showNotification', _source, 'Coupe en ~g~cours~s~...')
    CraftAbatteur(_source)
end)

RegisterServerEvent('clp_abatteur:stopCraftAbatteur')
AddEventHandler('clp_abatteur:stopCraftAbatteur', function()
    local _source = source
    PlayersCraftingAbatteur[_source] = false
end)

-- Planche en paquet de planche
local function CraftAbatteur2(source)
    local _source = source
    SetTimeout(4000, function()

        if PlayersCraftingAbatteur2[_source] == true then

            local xPlayer = ESX.GetPlayerFromId(_source)
            local PlanchePaquetQuantity = xPlayer.getInventoryItem('planche').count

            if PlanchePaquetQuantity <= 1 then
                TriggerClientEvent('esx:showNotification', _source, ~r~'Vous n\'avez pas assez de ~s~planche.')
            else
                xPlayer.removeInventoryItem('planche', 5)
                xPlayer.addInventoryItem('paquetplanche', 1)

                CraftAbatteur2(_source)
            end
        end
    end)
end

RegisterServerEvent('clp_abatteur:startCraftAbatteur2')
AddEventHandler('clp_abatteur:startCraftAbatteur2', function()
    local _source = source
    PlayersCraftingAbatteur2[_source] = true
    TriggerClientEvent('esx:showNotification', _source, 'Assemblage ~g~en cours~s~...')
    CraftAbatteur2(_source)
end)

RegisterServerEvent('clp_abatteur:stopCraftAbatteur2')
AddEventHandler('clp_abatteur:stopCraftAbatteur2', function()
    local _source = source
    PlayersCraftingAbatteur2[_source] = false
end)

-- Vente des paquet de planches
local function SellAbatteur(source, zone)

    if PlayersSellingAbatteur[source] == true then
        local xPlayer = ESX.GetPlayerFromId(source)

        if zone == 'AbatteurSellFarm' then
            if xPlayer.getInventoryItem('paquetplanche').count <= 0 then
                paquetplanche = 0
            else
                paquetplanche = 1
            end

            if paquetplanche == 0 then
                TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de ~s~paquets de planches ~r~a vendre.')
                return
            elseif xPlayer.getInventoryItem('paquetplanche').count <= 0 then
                TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez de ~s~paquets de planches ~r~a vendre.')
                paquetplanche = 0
                return
            else
                if (paquetplanche == 1) then
                    SetTimeout(5000, function()
                        xPlayer.removeInventoryItem('paquetplanche', 1)

                        local moneys = math.random(8, 12)
                        xPlayer.addMoney(moneys)
                        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous : +~g~$' .. moneys)
                        SellAbatteur(source, zone)

                        local money = math.random(6, 10)
                        local societyAccount

                        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_abatteur', function(account)
                            societyAccount = account
                        end)
                        if societyAccount ~= nil then
                            societyAccount.addMoney(money)
                            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Société : +~g~' .. money.."$")
                        end

                    end)
                end

            end
        end
    end
end

RegisterServerEvent('clp_abatteur:startSellAbatteur')
AddEventHandler('clp_abatteur:startSellAbatteur', function(zone)

    local _source = source

    if PlayersSellingAbatteur[_source] == false then
        TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
        PlayersSellingAbatteur[_source] = false
    else
        PlayersSellingAbatteur[_source] = true
        TriggerClientEvent('esx:showNotification', _source, '~g~Vente en cours..')
        SellAbatteur(_source, zone)
    end

end)

RegisterServerEvent('clp_abatteur:stopSellAbatteur')
AddEventHandler('clp_abatteur:stopSellAbatteur', function()

    local _source = source

    if PlayersSellingAbatteur[_source] == true then
        PlayersSellingAbatteur[_source] = false
        --TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
    else
        --TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
        PlayersSellingAbatteur[_source] = true
    end

end)

-- Ajout gestion stock
RegisterServerEvent('clp_abatteur:getStockItemAbatteur')
AddEventHandler('clp_abatteur:getStockItemAbatteur', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_abatteur', function(inventory)

        local item = inventory.getItem(itemName)

        if item.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

    end)

end)

ESX.RegisterServerCallback('clp_abatteur:getStockItemsAbatteur', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_abatteur', function(inventory)
        cb(inventory.items)
    end)

end)

-- ajout 2
RegisterServerEvent('clp_abatteur:putStockItemsAbatteur')
AddEventHandler('clp_abatteur:putStockItemsAbatteur', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_abatteur', function(inventory)

        local item = inventory.getItem(itemName)
        local playerItemCount = xPlayer.getInventoryItem(itemName).count

        if item.count >= 0 and count <= playerItemCount then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

    end)

end)

-- Bacars
if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'bacars', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'bacars', 'Client Bacars', true, true)
TriggerEvent('esx_society:registerSociety', 'bacars', 'Bacars', 'society_bacars', 'society_bacars', 'society_bacars', { type = 'private' })

RegisterServerEvent('clp_bacars:annonceBacars')
AddEventHandler('clp_bacars:annonceBacars', function(result)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local text = result
    print(text)
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_bacars:annonceBacars', xPlayers[i], text)
    end

    Citizen.Wait(10000)

    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('clp_bacars:annonceBacarsstop', xPlayers[i])
    end

end)

-- Ajout gestion stock
RegisterServerEvent('clp_bacars:getStockItemBacars')
AddEventHandler('clp_bacars:getStockItemBacars', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bacars', function(inventory)

        local item = inventory.getItem(itemName)

        if item.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

    end)

end)

ESX.RegisterServerCallback('clp_bacars:getStockItemsBacars', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bacars', function(inventory)
        cb(inventory.items)
    end)

end)

-- ajout 2
RegisterServerEvent('clp_bacars:putStockItemsBacars')
AddEventHandler('clp_bacars:putStockItemsBacars', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bacars', function(inventory)

        local item = inventory.getItem(itemName)
        local playerItemCount = xPlayer.getInventoryItem(itemName).count

        if item.count >= 0 and count <= playerItemCount then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end

        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

    end)

end)

--- Militaire
if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'militaire', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'militaire', 'Alerte Militaire', true, true)
TriggerEvent('esx_society:registerSociety', 'militaire', 'Militaire', 'society_militaire', 'society_militaire', 'society_militaire', { type = 'public' })

RegisterServerEvent('esx_militairejob:confiscatePlayerItem')
AddEventHandler('esx_militairejob:confiscatePlayerItem', function(target, itemType, itemName, amount)
    local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
    local targetXPlayer = ESX.GetPlayerFromId(target)

    if sourceXPlayer.job.name ~= 'militaire' then
        print(('esx_militairejob: %s attempted to confiscate!'):format(xPlayer.identifier))
        return
    end

    if itemType == 'item_standard' then
        local targetItem = targetXPlayer.getInventoryItem(itemName)
        local sourceItem = sourceXPlayer.getInventoryItem(itemName)

        -- does the target player have enough in their inventory?
        if targetItem.count > 0 and targetItem.count <= amount then

            -- can the player carry the said amount of x item?
            if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
                TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
            else
                targetXPlayer.removeInventoryItem(itemName, amount)
                sourceXPlayer.addInventoryItem(itemName, amount)
                TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated', amount, sourceItem.label, targetXPlayer.name))
                TriggerClientEvent('esx:showNotification', target, _U('got_confiscated', amount, sourceItem.label, sourceXPlayer.name))
            end
        else
            TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
        end

    elseif itemType == 'item_account' then
        targetXPlayer.removeAccountMoney(itemName, amount)
        sourceXPlayer.addAccountMoney(itemName, amount)

        TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_account', amount, itemName, targetXPlayer.name))
        TriggerClientEvent('esx:showNotification', target, _U('got_confiscated_account', amount, itemName, sourceXPlayer.name))

    elseif itemType == 'item_weapon' then
        if amount == nil then
            amount = 0
        end
        targetXPlayer.removeWeapon(itemName, amount)
        sourceXPlayer.addWeapon(itemName, amount)

        TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount))
        TriggerClientEvent('esx:showNotification', target, _U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name))
    end
end)

RegisterServerEvent('esx_militairejob:handcuff')
AddEventHandler('esx_militairejob:handcuff', function(target)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name == 'militaire' then
        TriggerClientEvent('esx_militairejob:handcuff', target)
    else
        print(('esx_militairejob: %s attempted to handcuff a player (not cop)!'):format(xPlayer.identifier))
    end
end)

RegisterServerEvent('esx_militairejob:drag')
AddEventHandler('esx_militairejob:drag', function(target)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name == 'militaire' then
        TriggerClientEvent('esx_militairejob:drag', target, source)
    else
        print(('esx_militairejob: %s attempted to drag (not cop)!'):format(xPlayer.identifier))
    end
end)

RegisterServerEvent('esx_militairejob:putInVehicle')
AddEventHandler('esx_militairejob:putInVehicle', function(target)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name == 'militaire' then
        TriggerClientEvent('esx_militairejob:putInVehicle', target)
    else
        print(('esx_militairejob: %s attempted to put in vehicle (not cop)!'):format(xPlayer.identifier))
    end
end)

RegisterServerEvent('esx_militairejob:OutVehicle')
AddEventHandler('esx_militairejob:OutVehicle', function(target)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name == 'militaire' then
        TriggerClientEvent('esx_militairejob:OutVehicle', target)
    else
        print(('esx_militairejob: %s attempted to drag out from vehicle (not cop)!'):format(xPlayer.identifier))
    end
end)

RegisterServerEvent('esx_militairejob:getStockItem')
AddEventHandler('esx_militairejob:getStockItem', function(itemName, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local sourceItem = xPlayer.getInventoryItem(itemName)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_militaire', function(inventory)
        local inventoryItem = inventory.getItem(itemName)

        -- is there enough in the society?
        if count > 0 and inventoryItem.count >= count then

            -- can the player carry the said amount of x item?
            if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
                TriggerClientEvent('esx:showNotification', _source, 'Quantité invalide')
            else
                inventory.removeItem(itemName, count)
                xPlayer.addInventoryItem(itemName, count)
                TriggerClientEvent('esx:showNotification', _source, 'Vous avez retiré x' .. count .. ' ' .. inventoryItem.label)
            end
        else
            TriggerClientEvent('esx:showNotification', _source, 'Quantité invalide')
        end
    end)
end)

RegisterServerEvent('esx_militairejob:putStockItems')
AddEventHandler('esx_militairejob:putStockItems', function(itemName, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local sourceItem = xPlayer.getInventoryItem(itemName)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_militaire', function(inventory)
        local inventoryItem = inventory.getItem(itemName)

        -- does the player have enough of the item?
        if sourceItem.count >= count and count > 0 then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez déposé x' .. count .. ' ' .. inventoryItem.label)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
        end
    end)
end)

ESX.RegisterServerCallback('esx_militairejob:getOtherPlayerData', function(source, cb, target)
    if Config.EnableESXIdentity then
        local xPlayer = ESX.GetPlayerFromId(target)
        local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM users WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier
        })

        local firstname = result[1].firstname
        local lastname = result[1].lastname
        local sex = result[1].sex
        local dob = result[1].dateofbirth
        local height = result[1].height

        local data = {
            name = GetPlayerName(target),
            job = xPlayer.job,
            inventory = xPlayer.inventory,
            accounts = xPlayer.accounts,
            weapons = xPlayer.loadout,
            firstname = firstname,
            lastname = lastname,
            sex = sex,
            dob = dob,
            height = height
        }

        TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
            if status ~= nil then
                data.drunk = math.floor(status.percent)
            end
        end)

        if Config.EnableLicenses then
            TriggerEvent('esx_license:getLicenses', target, function(licenses)
                data.licenses = licenses
                cb(data)
            end)
        else
            cb(data)
        end
    else
        local xPlayer = ESX.GetPlayerFromId(target)

        local data = {
            name = GetPlayerName(target),
            job = xPlayer.job,
            inventory = xPlayer.inventory,
            accounts = xPlayer.accounts,
            weapons = xPlayer.loadout
        }

        TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
            if status then
                data.drunk = math.floor(status.percent)
            end
        end)

        TriggerEvent('esx_license:getLicenses', target, function(licenses)
            data.licenses = licenses
        end)

        cb(data)
    end
end)

ESX.RegisterServerCallback('esx_militairejob:getVehicleFromPlate', function(source, cb, plate)
    MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        if result[1] ~= nil then

            MySQL.Async.fetchAll('SELECT name, firstname, lastname FROM users WHERE identifier = @identifier', {
                ['@identifier'] = result[1].owner
            }, function(result2)

                if Config.EnableESXIdentity then
                    cb(result2[1].firstname .. ' ' .. result2[1].lastname, true)
                else
                    cb(result2[1].name, true)
                end

            end)
        else
            cb('Inconnu', false)
        end
    end)
end)

ESX.RegisterServerCallback('esx_militairejob:getArmoryWeapons', function(source, cb)
    TriggerEvent('esx_datastore:getSharedDataStore', 'society_militaire', function(store)
        local weapons = store.get('weapons')

        if weapons == nil then
            weapons = {}
        end

        cb(weapons)
    end)
end)

ESX.RegisterServerCallback('esx_militairejob:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
    local xPlayer = ESX.GetPlayerFromId(source)

    if removeWeapon then
        xPlayer.removeWeapon(weaponName)
    end

    TriggerEvent('esx_datastore:getSharedDataStore', 'society_militaire', function(store)
        local weapons = store.get('weapons')

        if weapons == nil then
            weapons = {}
        end

        local foundWeapon = false

        for i = 1, #weapons, 1 do
            if weapons[i].name == weaponName then
                weapons[i].count = weapons[i].count + 1
                foundWeapon = true
                break
            end
        end

        if not foundWeapon then
            table.insert(weapons, {
                name = weaponName,
                count = 1
            })
        end

        store.set('weapons', weapons)
        cb()
    end)
end)

ESX.RegisterServerCallback('esx_militairejob:removeArmoryWeapon', function(source, cb, weaponName)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addWeapon(weaponName, 500)

    TriggerEvent('esx_datastore:getSharedDataStore', 'society_militaire', function(store)

        local weapons = store.get('weapons')

        if weapons == nil then
            weapons = {}
        end

        local foundWeapon = false

        for i = 1, #weapons, 1 do
            if weapons[i].name == weaponName then
                weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
                foundWeapon = true
                break
            end
        end

        if not foundWeapon then
            table.insert(weapons, {
                name = weaponName,
                count = 0
            })
        end

        store.set('weapons', weapons)
        cb()
    end)
end)

ESX.RegisterServerCallback('esx_militairejob:buyWeapon', function(source, cb, weaponName, type, componentNum)
    local xPlayer = ESX.GetPlayerFromId(source)
    local authorizedWeapons, selectedWeapon = Config.AuthorizedWeaponsMilitaire[xPlayer.job.grade_name]

    for k, v in ipairs(authorizedWeapons) do
        if v.weapon == weaponName then
            selectedWeapon = v
            break
        end
    end

    if not selectedWeapon then
        print(('esx_militairejob: %s attempted to buy an invalid weapon.'):format(xPlayer.identifier))
        cb(false)
    else
        -- Weapon
        if type == 1 then
            if xPlayer.getMoney() >= selectedWeapon.price then
                xPlayer.removeMoney(selectedWeapon.price)
                xPlayer.addWeapon(weaponName, 100)

                cb(true)
            else
                cb(false)
            end

            -- Weapon Component
        elseif type == 2 then
            local price = selectedWeapon.components[componentNum]
            local weaponNum, weapon = ESX.GetWeapon(weaponName)

            local component = weapon.components[componentNum]

            if component then
                if xPlayer.getMoney() >= price then
                    xPlayer.removeMoney(price)
                    xPlayer.addWeaponComponent(weaponName, component.name)

                    cb(true)
                else
                    cb(false)
                end
            else
                print(('esx_militairejob: %s attempted to buy an invalid weapon component.'):format(xPlayer.identifier))
                cb(false)
            end
        end
    end
end)

ESX.RegisterServerCallback('esx_militairejob:buyJobVehicle', function(source, cb, vehicleProps, type)
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = getPriceFromHash(vehicleProps.model, xPlayer.job.grade_name, type)

    -- vehicle model not found
    if price == 0 then
        print(('esx_militairejob: %s attempted to exploit the shop! (invalid vehicle model)'):format(xPlayer.identifier))
        cb(false)
    else
        if xPlayer.getMoney() >= price then
            xPlayer.removeMoney(price)

            MySQL.Async.execute('INSERT INTO owned_vehicles (owner, vehicle, plate, type, job, `stored`) VALUES (@owner, @vehicle, @plate, @type, @job, @stored)', {
                ['@owner'] = xPlayer.identifier,
                ['@vehicle'] = json.encode(vehicleProps),
                ['@plate'] = vehicleProps.plate,
                ['@type'] = type,
                ['@job'] = xPlayer.job.name,
                ['@stored'] = true
            }, function(rowsChanged)
                cb(true)
            end)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx_militairejob:storeNearbyVehicle', function(source, cb, nearbyVehicles)
    local xPlayer = ESX.GetPlayerFromId(source)
    local foundPlate, foundNum

    for k, v in ipairs(nearbyVehicles) do
        local result = MySQL.Sync.fetchAll('SELECT plate FROM owned_vehicles WHERE owner = @owner AND plate = @plate AND job = @job', {
            ['@owner'] = xPlayer.identifier,
            ['@plate'] = v.plate,
            ['@job'] = xPlayer.job.name
        })

        if result[1] then
            foundPlate, foundNum = result[1].plate, k
            break
        end
    end

    if not foundPlate then
        cb(false)
    else
        MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = true WHERE owner = @owner AND plate = @plate AND job = @job', {
            ['@owner'] = xPlayer.identifier,
            ['@plate'] = foundPlate,
            ['@job'] = xPlayer.job.name
        }, function(rowsChanged)
            if rowsChanged == 0 then
                print(('esx_militairejob: %s has exploited the garage!'):format(xPlayer.identifier))
                cb(false)
            else
                cb(true, foundNum)
            end
        end)
    end

end)

function getPriceFromHash(hashKey, jobGrade, type)
    if type == 'helicopter' then
        local vehicles = Config.AuthorizedHelicoptersMilitaire[jobGrade]

        for k, v in ipairs(vehicles) do
            if GetHashKey(v.model) == hashKey then
                return v.price
            end
        end
    elseif type == 'car' then
        local vehicles = Config.AuthorizedVehiclesMilitaire[jobGrade]
        local shared = Config.AuthorizedVehiclesMilitaire['Shared']

        for k, v in ipairs(vehicles) do
            if GetHashKey(v.model) == hashKey then
                return v.price
            end
        end

        for k, v in ipairs(shared) do
            if GetHashKey(v.model) == hashKey then
                return v.price
            end
        end
    end

    return 0
end

ESX.RegisterServerCallback('esx_militairejob:getStockItems', function(source, cb)
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_militaire', function(inventory)
        cb(inventory.items)
    end)
end)

ESX.RegisterServerCallback('esx_militairejob:getPlayerInventory', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local items = xPlayer.inventory

    cb({ items = items })
end)

AddEventHandler('playerDropped', function()
    -- Save the source in case we lose it (which happens a lot)
    local _source = source

    -- Did the player ever join?
    if _source ~= nil then
        local xPlayer = ESX.GetPlayerFromId(_source)

        -- Is it worth telling all clients to refresh?
        if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'militaire' then
            Citizen.Wait(5000)
            TriggerClientEvent('esx_militairejob:updateBlip', -1)
        end
    end
end)

RegisterServerEvent('esx_militairejob:spawned')
AddEventHandler('esx_militairejob:spawned', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'militaire' then
        Citizen.Wait(5000)
        TriggerClientEvent('esx_militairejob:updateBlip', -1)
    end
end)

RegisterServerEvent('esx_militairejob:forceBlip')
AddEventHandler('esx_militairejob:forceBlip', function()
    TriggerClientEvent('esx_militairejob:updateBlip', -1)
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Citizen.Wait(5000)
        TriggerClientEvent('esx_militairejob:updateBlip', -1)
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        TriggerEvent('esx_phone:removeNumber', 'militaire')
    end
end)

RegisterServerEvent('esx_militairejob:message')
AddEventHandler('esx_militairejob:message', function(target, msg)
    TriggerClientEvent('esx:showNotification', target, msg)
end)

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'ltd', 'LTD', 'society_ltd', 'society_ltd', 'society_ltd', {type = 'public'})

RegisterServerEvent('KrXDarhop:buy')
AddEventHandler('KrXDarhop:buy', function(price, item, label)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= price then
	    xPlayer.removeMoney(price)
    	xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Merci pour votre ~g~achat !", "", 1)
    else
          TriggerClientEvent('esx:showNotification', source, "Pas assez ~r~d'argent sur vous")   
    end
end)

RegisterServerEvent('c_ltd:buy')
AddEventHandler('c_ltd:buy', function(price, item, label)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= price then
	    xPlayer.removeMoney(price)
    	xPlayer.addInventoryItem(item, 20)
        TriggerClientEvent('esx:showNotification', source, "Merci pour votre ~g~achat !", "", 1)
    else
          TriggerClientEvent('esx:showNotification', source, "Pas assez ~r~d'argent sur vous")   
    end
end)


RegisterServerEvent('Announceltdsudo')
AddEventHandler('Announceltdsudo', function()   
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD Sud', '~b~Magasin', 'Le LTD (Sud) est ouvert venez chercher ce dont vous avez besoin !', 'CHAR_AMANDA')
	end
end)


RegisterServerEvent('Announceltdsudofermer')
AddEventHandler('Announceltdsudofermer', function()    
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD Sud', '~b~Magasin', 'Le LTD (Sud) est fermer !', 'CHAR_AMANDA')
	end
end)

RegisterServerEvent('Announceltdnord')
AddEventHandler('Announceltdnord', function()   
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD Nord', '~b~Magasin', 'Le LTD (Nord) est ouvert venez chercher ce dont vous avez besoin !', 'CHAR_AMANDA')
	end
end)


RegisterServerEvent('Announceltdnordfermer')
AddEventHandler('Announceltdnordfermer', function()    
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD Nord', '~b~Magasin', 'Le LTD (Nord) est fermer !', 'CHAR_AMANDA')
	end
end)
