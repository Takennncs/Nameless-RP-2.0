ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function IsAbleToSteal(targetSID, err)
	ESX.TriggerServerCallback('esx_thief:getValue', function(result)
		local result = result
		if result.value then
			err(false)
		else
			err('La cible n\'a pas les mains en l\'air !')
		end
	end, targetSID)
end

function OpenBodySearchMenu(player)

  ESX.TriggerServerCallback('esx_thief:getOtherPlayerData', function(data)

    local elements = {}

    local blackMoney = 0

    if Config.EnableBlackMoney then
    for i=1, #data.accounts, 1 do
      if data.accounts[i].name == 'black_money' then
        blackMoney = data.accounts[i].money
      end
    end

    table.insert(elements, {
      label          = "$" .. blackMoney,
      value          = 'black_money',
      itemType       = 'item_account',
      amount         = blackMoney
    })
end


if Config.EnableWeapons then
   	table.insert(elements, {label = '--- ' .. "Armes" .. ' ---', value = nil})
    for i=1, #data.weapons, 1 do
        table.insert(elements, {
          label          = data.weapons[i].label .. ' x' .. data.weapons[i].ammo,
          value          = data.weapons[i].name,
          itemType       = 'item_weapon',
          amount         = data.weapons[i].ammo,
        })
      end
  end

if Config.EnableInventory then
	table.insert(elements, {label = '--- ' .. 'Invetaire' .. ' ---', value = nil})
    for i=1, #data.inventory, 1 do
      if data.inventory[i].count > 0 then
        table.insert(elements, {
          label          = data.inventory[i].label .. ' x' .. data.inventory[i].count,
          value          = data.inventory[i].name,
          itemType       = 'item_standard',
          amount         = data.inventory[i].count,
        })
      end
    end
end


    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'body_search',
      {
        css 	 = 'head',
        title    = 'Fouille',
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        local itemType = data.current.itemType
        local itemName = data.current.value
        local amount   = data.current.amount

        if data.current.value ~= nil then

          TriggerServerEvent('esx_thief:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)

          OpenBodySearchMenu(player)

        end

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, GetPlayerServerId(player))

end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local ped = PlayerPedId()

		if IsControlJustPressed(0, 182) and IsPedArmed(ped, 7) and not IsEntityDead(ped) and IsPedOnFoot(ped) then
			local target, distance = ESX.Game.GetClosestPlayer()

			if target ~= -1 and distance ~= -1 and distance <= 2.0 then
				local target_id = GetPlayerServerId(target)
				
				IsAbleToSteal(target_id, function(err)
					if(not err)then
						OpenBodySearchMenu(target)
					else
						ESX.ShowNotification(err)
					end
				end)
			elseif distance < 20 and distance > 2.0 then
				ESX.ShowNotification('La cible est trop loin')
			else
				ESX.ShowNotification('Personne à poximité')
			end
		end
	end
end)
