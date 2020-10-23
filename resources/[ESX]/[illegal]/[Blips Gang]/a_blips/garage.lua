local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

     {title="Garage", colour=3, id=289, x = -1546.025, y = -398.557, z = 41.20},
     {title="Garage", colour=3, id=289, x = 105.359, y = 6613.586, z = 31.3973},
     {title="Garage", colour=3, id=289, x = -1511.655, y = 5009.875, z = 61.80},
     {title="Garage", colour=3, id=289, x = -977.216, y = -2710.379, z = 12.85},
     {title="Garage", colour=3, id=289, x = 1501.2, y = 3762.19, z = 33.0},
     {title="Garage", colour=3, id=289, x = -342.28, y = -1069.35, z = 22.02},
     {title="Garage", colour=3, id=289, x = 894.20, y = -51.32, z = 78.76},
     {title="Garage", colour=3, id=289, x = -905.40, y = -161.14, z = 40.87},

     {title="Fourière", colour=64, id=67, x = 490.942, y = -1313.067, z = 27.964},
     {title="Fourière", colour=64, id=67, x = -2205.45, y = 4247.36, z = 46.63},
     {title="Fourière", colour=64, id=67, x = 1551.83, y = 3518.10, z = 34.98},
     {title="Fourière", colour=64, id=67, x = -1048.34, y = -2669.77, z = 12.83},

  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)