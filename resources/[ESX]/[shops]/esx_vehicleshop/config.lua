Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnablePvCommand            = false
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 50
Config.Locale = 'fr'

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {

  ShopEntering = {
    Pos   = {x = -34.96240234375, y = -1101.552734375, z = 25.422372817993},
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = 1,
  },

  ShopInside = {
    Pos     = {x = -33.558937072754, y = -1079.7261962891, z = 26.687339782715},
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 70.0,
    Type    = -1,
  },

  ShopOutside = {
    Pos     = { x = -55.111, y = -1075.257, z = 27.107 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 70.0,
    Type    = -1,
  },

  BossActions = {
    Pos   = { x = -32.065, y = -1114.277, z = 25.422 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = -1,
  },

  GiveBackVehicle = {
    Pos   = { x = -18.227, y = -1078.558, z = 19.675 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = (Config.EnablePlayerManagement and 1 or -1),
  },

  ResellVehicle = {
    Pos   = { x = -44.630, y = -1080.738, z = 25.683 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = 1,
  },

}
