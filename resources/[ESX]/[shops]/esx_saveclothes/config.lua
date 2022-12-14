Config = {}
Config.Locale = 'fr'
Config.Price = 150
Config.DrawDistance = 15.0
Config.MarkerSize = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor = {r = 102, g = 102, b = 204}
Config.MarkerType = -1

Config.Zones = {}

Config.Shops = {
  {x = 429.66781616211, y = -811.67681884766, z = 29.491130828857},
  {x = 71.247894287109, y = -1387.5834960938, z = 29.37611579895},
  {x = -820.21118164063, y = -1067.5611572266, z = 11.328019142151},
  {x = -1180.6496582031, y = -763.94445800781, z = 17.326574325562},
  {x = -1447.939453125, y = -242.67147827148, z = 49.820922851563},
  {x = -704.26531982422, y = -152.45097351074, z = 37.415130615234},
  {x = -167.66825866699, y = -299.04885864258, z = 39.733325958252},
  {x = 117.68845367432, y = -233.57186889648, z = 54.557830810547},
  {x = -1100.1988525391, y = 2717.1435546875, z = 19.107824325562},
  {x = 617.63397216797, y = 2775.2902832031, z = 42.088088989258},
  {x = 1201.73046875, y = 2714.3671875, z = 38.222591400146},
  {x = 1698.7253417969, y = 4818.1342773438, z = 42.063087463379},
  {x = 3.6669969558716, y = 6505.6845703125, z = 31.877855300903},
  {x = -3179.1555175781, y = 1034.4798583984, z = 20.863235473633},
}

for i=1, #Config.Shops, 1 do
	Config.Zones['Shop_' .. i] = {
	 	Pos = Config.Shops[i],
	 	Size = Config.MarkerSize,
	 	Color = Config.MarkerColor,
	 	Type = Config.MarkerType
  }
end