Config = {}
Config.DrawDistance = 15.0
Config.MaxInService = -1
Config.EnablePlayerManagement = true
Config.MaxInService = -1
Config.Locale = 'fr'

-- Militaire
Config.MarkerType = 1
Config.MarkerSize = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor = { r = 50, g = 50, b = 204 }
Config.EnableArmoryManagement = true
Config.EnableESXIdentity = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds = false -- turn this on if you want custom peds
Config.EnableLicenses = true -- enable if you're using esx_license
Config.EnableHandcuffTimer = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer = 10 * 60000 -- 10 mins
Config.EnableJobBlip = false -- enable blips for colleagues, requires esx_society

-- Avocat
Config.Zones = {
	AvocatActions = {
		Pos = {x = -1904.84, y = -570.815, z = 18.2},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 0, g = 0, b = 250},
		Type = 25
	},
	BossActionsAvocat = {
		Pos = {x = -1912.25, y = -570.21, z = 18.2},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 0, g = 0, b = 250},
		Type = 25
	},
	VehicleSpawnAvocatMenu = {
		Pos = {x = -1905.19, y =  -560.64, z = 11.5},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 0, g = 0, b = 250},
		Type = 36
	},
	VehicleSpawnPointAvocat = {
		Pos = {x = -1900.479, y = -560.6, z = 11.79},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},
	VehicleDeleterAvocat = {
		Pos = {x = -1901.83, y = -562.74, z = 11.5},
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 240, g = 0, b = 0},
		Type = 36
	}
}

Config.TeleportZonesAvocat = {
	EnterBuilding = {
	  Pos = {x = -1898.46, y = -572.459, z = 11.25},
	  Size = {x = 1.0, y = 1.0, z = 1.5},
	  Color = {r = 0, g = 0, b = 250},
	  Marker = 23,
	  Blip = false,
	  Name = "Avocat: Entrée",
	  Type = "teleport",
	  Hint = "Appuyez sur ~INPUT_PICKUP~ pour entrer dans le cabinet d'avocats.",
	  Teleport = {x = -1902.19, y = -572.53, z = 19.09},
	},
	ExitBuilding = {
	  Pos = {x = -1902.19, y = -572.53, z = 18.25},
	  Size = {x = 1.0, y = 1.0, z = 1.5},
	  Color = {r = 0, g = 0, b = 250},
	  Marker = 23,
	  Blip = false,
	  Name = "Avocat: Sortie",
	  Type = "teleport",
	  Hint = "Appuyez sur ~INPUT_PICKUP~ pour sortir du cabinet d'avocats.",
	  Teleport = {x = -1898.46, y = -572.459, z = 11.84},
	}
 }

-- Journalist
Config.Zones2 = {
	JournalistActions = {
		Pos = {x = -593.98, y = -914.17, z = 28.16-0.98},
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 204, g = 150, b = 0},
		Type = 25
	},
	BossActionsJournalist = {
		Pos = {x = -583.58, y = -928.89, z = 28.16-0.98},
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 0, g = 240, b = 0},
		Type = 25
	},
	VehicleSpawnJournalistMenu = {
		Pos = {x = -537.23, y = -886.54, z = 25.21},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 0, g = 240, b = 0},
		Type = 36
	},
	VehicleSpawnPointJournalist = {
		Pos = {x = -544.03, y = -892.61, z = 24.66},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},
	VehicleDeleterJournalist = {
		Pos = {x = -532.4,  y = -888.76,  z = 24.96},
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 240, g = 0, b = 0},
		Type = 36
	},
	HelicoSpawnJournalistMenu = {
		Pos = {x = -575.23, y = -927.91, z = 500.83},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 0, g = 240, b = 0},
		Type = -1
	},
	HelicoSpawnPointJournalist = {
		Pos = {x = -583.53, y = -930.75, z = 36.83},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},
	HelicoDeleterJournalist = {
		Pos = {x = -583.53, y = -930.75, z = 36.83},
		Size = {x = 10.0, y = 10.0, z = 10.0},
		Color = {r = 240, g = 0, b = 0},
		Type = -1
	}
}

Config.TeleportZonesJournalist = {
--[[ 	EnterBuilding = {
	  Pos = {x = -1071.025, y = -244.894, z = 57.2},
	  Size = {x = 1.0, y = 1.0, z = 1.5},
	  Color = {r = 204, g = 204, b = 0},
	  Marker = 23,
	  Blip = false,
	  Name = "CNN: Entrée",
	  Type = "teleport",
	  Hint = "Appuyez sur ~INPUT_PICKUP~ pour entrer au CNN.",
	  Teleport = {x = -1075.532, y = -253.113, z = 44.02},
	},
	ExitBuilding = {
	  Pos = {x = -1075.532, y = -253.113, z = 43.2},
	  Size = {x = 1.0, y = 1.0, z = 1.5},
	  Color = {r = 204, g = 204, b = 0},
	  Marker = 23,
	  Blip = false,
	  Name = "CNN: Sortie",
	  Type = "teleport",
	  Hint = "Appuyez sur ~INPUT_PICKUP~ pour sortir du CNN.",
	  Teleport = {x = -1071.025, y = -244.894, z = 58.13},
	} ]]
}

-- Taxi
Config.EnableTaxiSocietyOwnedVehicles = false
Config.NPCTaxiJobEarnings = {min = 50, max = 150}
Config.MinimumTaxiDistance = 1000 -- Minimum NPC job destination distance from the pickup in GTA units, a higher number prevents nearby destinations.

Config.AuthorizedTaxiVehicles = {
	{	model = 'taxi',
		label = 'Taxi'
	}
}

Config.Zones3 = {
	VehicleTaxiSpawner = {
		Pos = {x = 893.24, y = -146.51, z = 76.9},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 0, g = 255, b = 0},
		Type = 36, Rotate = true
	},
	VehicleSpawnTaxiPoint = {
		Pos = {x = 897.51, y = -152.4, z = 76.56-0.98},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1, Rotate = false,
		Heading = 327.33
	},
	VehicleTaxiDeleter = {
		Pos = {x = 897.51, y = -152.4, z = 76.56},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		Type = 36, Rotate = true
	},
	TaxiActions = {
		Pos = {x = 909.6,  y = -152.64,  z = 74.16-0.98},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type = 25, Rotate = true
	},
	CloakroomTaxi = {
		Pos = {x = 905.05, y = -149.54, z = 74.17-0.98},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type = 25, Rotate = true
	}
}

Config.JobTaxiLocations = {
	vector3(293.5, -590.2, 42.7),
	vector3(253.4, -375.9, 44.1),
	vector3(120.8, -300.4, 45.1),
	vector3(-38.4, -381.6, 38.3),
	vector3(-107.4, -614.4, 35.7),
	vector3(-252.3, -856.5, 30.6),
	vector3(-236.1, -988.4, 28.8),
	vector3(-277.0, -1061.2, 25.7),
	vector3(-576.5, -999.0, 21.8),
	vector3(-602.8, -952.6, 21.6),
	vector3(-790.7, -961.9, 14.9),
	vector3(-912.6, -864.8, 15.0),
	vector3(-1069.8, -792.5, 18.8),
	vector3(-1306.9, -854.1, 15.1),
	vector3(-1468.5, -681.4, 26.2),
	vector3(-1380.9, -452.7, 34.1),
	vector3(-1326.3, -394.8, 36.1),
	vector3(-1383.7, -270.0, 42.5),
	vector3(-1679.6, -457.3, 39.4),
	vector3(-1812.5, -416.9, 43.7),
	vector3(-2043.6, -268.3, 23.0),
	vector3(-2186.4, -421.6, 12.7),
	vector3(-1862.1, -586.5, 11.2),
	vector3(-1859.5, -617.6, 10.9),
	vector3(-1635.0, -988.3, 12.6),
	vector3(-1284.0, -1154.2, 5.3),
	vector3(-1126.5, -1338.1, 4.6),
	vector3(-867.9, -1159.7, 5.0),
	vector3(-847.5, -1141.4, 6.3),
	vector3(-722.6, -1144.6, 10.2),
	vector3(-575.5, -318.4, 34.5),
	vector3(-592.3, -224.9, 36.1),
	vector3(-559.6, -162.9, 37.8),
	vector3(-535.0, -65.7, 40.6),
	vector3(-758.2, -36.7, 37.3),
	vector3(-1375.9, 21.0, 53.2),
	vector3(-1320.3, -128.0, 48.1),
	vector3(-1285.7, 294.3, 64.5),
	vector3(-1245.7, 386.5, 75.1),
	vector3(-760.4, 285.0, 85.1),
	vector3(-626.8, 254.1, 81.1),
	vector3(-563.6, 268.0, 82.5),
	vector3(-486.8, 272.0, 82.8),
	vector3(88.3, 250.9, 108.2),
	vector3(234.1, 344.7, 105.0),
	vector3(435.0, 96.7, 99.2),
	vector3(482.6, -142.5, 58.2),
	vector3(762.7, -786.5, 25.9),
	vector3(809.1, -1290.8, 25.8),
	vector3(490.8, -1751.4, 28.1),
	vector3(432.4, -1856.1, 27.0),
	vector3(164.3, -1734.5, 28.9),
	vector3(-57.7, -1501.4, 31.1),
	vector3(52.2, -1566.7, 29.0),
	vector3(310.2, -1376.8, 31.4),
	vector3(182.0, -1332.8, 28.9),
	vector3(-74.6, -1100.6, 25.7),
	vector3(-887.0, -2187.5, 8.1),
	vector3(-749.6, -2296.6, 12.5),
	vector3(-1064.8, -2560.7, 19.7),
	vector3(-1033.4, -2730.2, 19.7),
	vector3(-1018.7, -2732.0, 13.3),
	vector3(797.4, -174.4, 72.7),
	vector3(508.2, -117.9, 60.8),
	vector3(159.5, -27.6, 67.4),
	vector3(-36.4, -106.9, 57.0),
	vector3(-355.8, -270.4, 33.0),
	vector3(-831.2, -76.9, 37.3),
	vector3(-1038.7, -214.6, 37.0),
	vector3(1918.4, 3691.4, 32.3),
	vector3(1820.2, 3697.1, 33.5),
	vector3(1619.3, 3827.2, 34.5),
	vector3(1418.6, 3602.2, 34.5),
	vector3(1944.9, 3856.3, 31.7),
	vector3(2285.3, 3839.4, 34.0),
	vector3(2760.9, 3387.8, 55.7),
	vector3(1952.8, 2627.7, 45.4),
	vector3(1051.4, 474.8, 93.7),
	vector3(866.4, 17.6, 78.7),
	vector3(319.0, 167.4, 103.3),
	vector3(88.8, 254.1, 108.2),
	vector3(-44.9, 70.4, 72.4),
	vector3(-115.5, 84.3, 70.8),
	vector3(-384.8, 226.9, 83.5),
	vector3(-578.7, 139.1, 61.3),
	vector3(-651.3, -584.9, 34.1),
	vector3(-571.8, -1195.6, 17.9),
	vector3(-1513.3, -670.0, 28.4),
	vector3(-1297.5, -654.9, 26.1),
	vector3(-1645.5, 144.6, 61.7),
	vector3(-1160.6, 744.4, 154.6),
	vector3(-798.1, 831.7, 204.4)
}

-- Palace
Config.Zones4 = {
	PalaceActions = {
		Pos = {x = -449.14, y = 269.15, z = 83.02-0.98},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 150, g = 0, b = 150},
		Type = 25
	},

	BossActionsPalace = {
		Pos = {x = -431.81, y = 280.32, z = 83.02-0.98},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 150, g = 0, b = 150},
		Type = 25
	},
	VehicleSpawnPalaceMenu = {
		Pos = {x = -428.55, y = 294.16, z = 83.23-0.98},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 150, g = 0, b = 150},
		Type = 25
	},
	VehicleSpawnPointPalace = {
		Pos = {x = -420.94, y = 293.31, z = 83.23-0.98},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},
	VehicleDeleterPalace = {
		Pos = {x = -424.0, y = 293.6, z = 83.23-0.98},
		Size = {x = 1.2, y = 1.2, z = 1.2},
		Color = {r = 240, g = 0, b = 0},
		Type = 25
	},
	VehicleDeleterPalace2 = {
		Pos = {x = -433.6, y = 300.53, z = 83.22-0.98},
		Size = {x = 2.0, y = 2.0, z = 2.0},
		Color = {r = 240, g = 0, b = 0},
		Type = 25
	}
}

Config.TeleportZonesPalace = {
	EnterBuilding = {
	    Pos = {x = 0.0, y = 0.0, z = 600.0},
	    Size = {x = 1.0, y = 1.0, z = 1.5},
	    Color = {r = 150, g = 0, b = 150},
	    Marker = 25,
	    Blip = false,
	    Name = "The Palace: Entrée",
	    Type = "teleport",
	    Hint = "Appuyez sur ~INPUT_PICKUP~ pour entrer dans The Palace.",
	    Teleport = {x = -1569.3714, y = -3017.1933, z = -74.4062},
 	},

  ExitBuilding = {
	    Pos = {x = 0.0, y = 0.0, z = 600.0},
	    Size = {x = 1.0, y = 1.0, z = 1.5},
	    Color = {r = 150, g = 0, b = 150},
	    Marker = 25,
	    Blip = false,
	    Name = "The Palace: Sortie",
	    Type = "teleport",
	    Hint = "Appuyez sur ~INPUT_PICKUP~ pour sortir de The Palace.",
	    Teleport = {x = -430.1980, y = 261.8168, z = 83.0045},
  	}
}

-- Daymson
Config.Zones5 = {

	DaymsonActions = {
		Pos = {x = 2473.53, y = 4092.42, z = 38.2-0.98},
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 0, g = 0, b = 250},
		Type = 25
	},

	BossActionsDaymson = {
		Pos = {x = 2468.93, y = 4089.38, z = 37.99-0.98},
		Size = {x = 1.3, y = 1.3, z = 1.5},
		Color = {r = 0, g = 0, b = 250},
		Type = 25
	},

	HarvestDaymson = {
		Pos = {x = 2521.32, y = 4124.4, z = 38.63-0.98},
		Size = {x = 5.0, y = 5.0, z = 2.5},
		Color = {r = 0, g = 240, b = 0},
		Type = -1
	},

	DaymsonCraft = {
		Pos = { x = 1917.69, y = 3742.32, z = 32.58-0.98 },
		Size = {x = 5.0, y = 5.0, z = 2.5},
		Color = {r = 204, g = 204, b = 0},
		Type = -1
	},

	DaymsonSellFarm = {
		Pos = {x = 248.423, y = 156.194, z = 104.176},
		Size = {x = 5.0, y = 5.0, z = 1.0},
		Color = {r = 0, g = 240, b = 0},
		Type = -1
	},

	VehicleSpawnDaymsonMenu = {
		Pos = {x = 2471.77, y =  4110.64, z = 38.06},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 240, b = 0},
		Type = 36
	},

	VehicleSpawnDaymsonPoint = {
		Pos = {x = 2484.04,  y = 4112.56,  z = 38.08-0.98},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},

	VehicleDaymsonDeleter = {
		Pos = {x = 2466.17, y = 4101.44, z = 38.06},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 240, g = 0, b = 0},
		Type = 36
	}
}

-- Tabac
Config.Zones6 = {

	TabacActions = {
		Pos = {x = 2340.8,  y = 3126.48,  z = 48.2-0.98},
		Size = {x = 1.5, y = 1.5, z = 2.0},
		Color = {r = 250, g = 0, b = 0},
		Type = 25
	},

	BossActionsTabac = {
		Pos = {x = 2355.96,  y = 3144.44,  z = 48.2-0.98},
		Size = {x = 1.0, y = 1.0, z = 2.5},
		Color = {r = 230, g = 0, b = 0},
		Type = 25
	},

	HarvestTabac = {
		Pos = {x = 325.04,  y = 6654.64,  z = 28.92},
		Size = {x = 10.0, y = 10.0, z = 2.0},
		Color = {r = 230, g = 20, b = 255},
		Type = -1
	},

	TabacCraft = {
		Pos = {x = 2350.96,  y = 3118.2,  z = 48.2-0.98},
		Size = {x = 1.0, y = 1.0, z = 2.0},
		Color = {r = 230, g = 0, b = 0},
		Type = 25
	},

	TabacCraft2 = {
		Pos = {x = 1702.84,  y = 4917.24,  z = 42.24},
		Size = {x = 1.0, y = 1.0, z = 2.0},
		Color = {r = 230, g = 20, b = 50},
		Type = -1
	},

	TabacSellFarm = {
		Pos = {x = -702.94, y = -917.06, z = 19.21},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 240, g = 0, b = 0},
		Type = -1
	},

	TabacSellFarm2 = {
		Pos = {x = -1469.64, y = -366.57, z = 40.2},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 240, g = 0, b = 0},
		Type = -1
	},

	VehicleSpawnTabacMenu = {
		Pos = {x = 2361.96,  y = 3122.64,  z = 48.2},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 255, b = 0},
		Type = 36
	},

	VehicleSpawnTabacPoint = {
		Pos = {x = 2371.88,  y = 3113.56,  z = 48.08},
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Type = -1
	},

	VehicleTabacDeleter = {
		Pos = {x = 2363.32,  y = 3114.0,  z = 48.36},
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 240, g = 0, b = 0},
		Type = 36
	}
}

-- Vigneron
Config.Zones7 = {

	VigneronActions = {
		Pos = {x = -1909.1966552734, y = 2072.2341308594, z = 140.3863067627-0.98},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 113, g = 0, b = 127},
		Type = 25
	},
	BossActionsVigneron = {
		Pos = {x = -1911.6016845703, y = 2074.3134765625, z = 140.38610839844-0.98},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 113, g = 0, b = 127},
		Type = 25
	},
	HarvestVigneron = {
		Pos = {x = -1781.36,  y = 2223.04,  z = 93.16},
		Size = {x = 6.0, y = 6.0, z = 6.5},
		Color = {r = 113, g = 0, b = 127},
		Type = -1
	},
--[[ 	HarvestVigneron2 = {
		Pos = {x = -1809.004, y = 2209.35, z = 91.251},
		Size = {x = 1.0, y = 1.0, z = 2.5},
		Color = {r = 113, g = 0, b = 127},
		Type = 25
	}, ]]
	VigneronCraft = {
		Pos = {x = 387.24,  y = 3585.8,  z = 33.28},
		Size = {x = 5.0, y = 5.0, z = 2.5},
		Color = {r = 113, g = 0, b = 127},
		Type = -1
	},
	VigneronSellFarm = {
		Pos = {x = 1726.64,  y = 4765.56,  z = 41.92},
		Size = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 240, g = 0, b = 0},
		Type = -1
	},
	VigneronSellFarm2 = {
		Pos = {x = -167.36,  y = 6312.08,  z = 31.48},
		Size = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 240, g = 0, b = 0},
		Type = -1
	},
	VehicleSpawnVigneronMenu = {
		Pos = {x = -1926.92,  y = 2042.04,  z = 140.84},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 0, g = 250, b = 0},
		Type = 36
	},
	VehicleSpawnVigneronPoint = {
		Pos = {x = -1906.56,  y = 2060.0,  z = 140.72},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},
	VehicleVigneronDeleter = {
		Pos = {x = -1902.64,  y = 2042.8,  z = 140.76-0.98},
		Size = {x = 2.0, y = 2.0, z = 1.5},
		Color = {r = 240, g = 0, b = 0},
		Type = 25
	}
}

-- Unicorn
Config.Zones8 = {

	UnicornActions = {
		Pos = {x = 106.67, y = -1299.64, z = 27.85},
		Size = {x = 1.3, y = 1.3, z = 1.5},
		Color = {r = 113, g = 0, b = 127},
		Type = 25
	},
	BossActionsUnicorn = {
		Pos = {x = 94.86, y = -1292.76, z = 28.35},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 113, g = 0, b = 127},
		Type = 25
	},
	HarvestUnicorn = {
		Pos = {x = 1835.11, y = 5042.02, z = 57.25},
		Size = {x = 5.0, y = 5.0, z = 2.5},
		Color = {r = 113, g = 0, b = 127},
		Type = -1
	},
	HarvestUnicorn2 = {
		Pos = {x = 1809.79, y = 5020.33, z = 56.45},
		Size = {x = 5.0, y = 5.0, z = 2.5},
		Color = {r = 113, g = 0, b = 127},
		Type = -1
	},
	UnicornCraft = {
		Pos = {x = 131.47, y = -1285.19, z = 28.3},
		Size = {x = 1.5, y = 1.5, z = 2.5},
		Color = {r = 113, g = 0, b = 127},
		Type = 25
	},
	VehicleSpawnUnicornMenu = {
		Pos = {x = 136.32, y = -1278.76, z = 29.36},
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 0, g = 250, b = 0},
		Type = 36
	},
	VehicleSpawnUnicornPoint = {
		Pos = {x = 139.96, y = -1277.29, z = 29.3},
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Type = -1
	},
	VehicleUnicornDeleter = {
		Pos = {x = 140.24,  y = -1280.56,  z = 29.36},
		Size = {x = 2.0, y = 2.0, z = 1.5},
		Color = {r = 240, g = 0, b = 0},
		Type = 36
	}
}

Config.TeleportZonesUnicorn = {
	EnterBuilding = {
	    Pos = {x = 132.93, y = -1293.71, z = 28.3},
	    Size = {x = 1.0, y = 1.0, z = 1.5},
	    Color = {r = 150, g = 0, b = 150},
	    Marker = 25,
	    Blip = false,
	    Name = "Bars: Entrée",
	    Type = "teleport",
	    Hint = "Appuyez sur ~INPUT_PICKUP~ pour entrer dans le bar.",
	    Teleport = {x = 132.53, y = -1287.45, z = 28.3},
 	},

  ExitBuilding = {
	    Pos = {x = 132.53, y = -1287.45, z = 28.3},
	    Size = {x = 1.0, y = 1.0, z = 1.5},
	    Color = {r = 150, g = 0, b = 150},
	    Marker = 25,
	    Blip = false,
	    Name = "Bars: Sortie",
	    Type = "teleport",
	    Hint = "Appuyez sur ~INPUT_PICKUP~ pour sortir du bar.",
	    Teleport = {x = 132.93, y = -1293.71, z = 28.3},
  	}
}

-- Carpenter
Config.Zones9 = {

	CarpenterActions = {
		Pos = {x = -97.52,  y = -1015.48,  z = 27.28-0.98},
		-- Pos = {x = -79.775382995605, y = 6501.6982421875, z = 31.49089050293},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 230, g = 20, b = 255},
		Type = 25
	},

	BossActionsCarpenter = {
		Pos = {x = -565.64, y = 5325.76, z = 02.65},
		-- Pos = {x = -66.172981262207, y = 6505.7407226563, z = 31.513069152832},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 230, g = 20, b = 255},
		Type = 25
	},

	HarvestCarpenter = {
		Pos = {x = -504.96, y = -939.92, z = 24.0},
		-- Pos = {x = -532.28442382813, y = 5372.48046875, z = 70.446731567383},
		Size = {x = 1.0, y = 1.0, z = 2.5},
		Color = {r = 230, g = 20, b = 255},
		Type = -1
	},

	CarpenterCraft2 = {
		Pos = {x = 923.36, y = -1517.24, z = 31.0},
		-- Pos = {x = -556.43499755859, y = 5319.7421875, z = 73.59969329834},
		Size = {x = 1.0, y = 1.0, z = 2.5},
		Color = {r = 230, g = 20, b = 255},
		Type = -1
	},

	CarpenterSellFarm = {
		Pos = {x = 139.12, y =  -378.84, z = 43.24},
		-- Pos = {x = -145.24229431152, y = 6143.4775390625, z = 32.33508682251},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 240, g = 0, b = 0},
		Type = -1
	},

	VehicleSpawnCarpenterMenu = {
		Pos = {x = -91.4,  y = -1032.44,  z = 28.0},
		-- Pos = {x = -83.790130615234, y = 6497.0063476563, z = 31.490894317627},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 230, g = 20, b = 255},
		Type = 36
	},

	VehicleSpawnCarpenterPoint = {
		Pos = {x = -98.6,  y = -1037.2,  z = 27.48},
		-- Pos = {x = -77.807861328125, y = 6490.2612304688, z = 31.490894317627},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},

	VehicleCarpenterDeleter = {
		Pos = {x = -100.64,  y = -1050.28,  z = 27.44},
		-- Pos = {x = -89.424125671387, y = 6487.1723632813, z = 31.490894317627},
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 240, g = 0, b = 0},
		Type = 36
	}
}

Config.bugstars = {

	CarpenterActions = {
		Pos = {x = -79.775382995605, y = 6501.6982421875, z = 30.59089050293},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 230, g = 20, b = 255},
		Type = 25
	},

	BossActionsCarpenter = {
		Pos = {x = -66.172981262207, y = 6505.7407226563, z = -31.513069152832},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 230, g = 20, b = 255},
		Type = 25
	},

	HarvestCarpenter = {
		Pos = {x = -532.28442382813, y = 5372.48046875, z = 70.446731567383},
		Size = {x = 1.0, y = 1.0, z = 2.5},
		Color = {r = 230, g = 20, b = 255},
		Type = -1
	},

	CarpenterCraft2 = {
		Pos = {x = -556.43499755859, y = 5319.7421875, z = 73.59969329834},
		Size = {x = 1.0, y = 1.0, z = 2.5},
		Color = {r = 230, g = 20, b = 255},
		Type = -1
	},

	CarpenterSellFarm = {
		Pos = {x = -145.24229431152, y = 6143.4775390625, z = 32.33508682251},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 240, g = 0, b = 0},
		Type = -1
	},

	VehicleSpawnCarpenterMenu = {
		Pos = {x = -83.790130615234, y = 6497.0063476563, z = 31.490894317627},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 230, g = 20, b = 255},
		Type = 36
	},

	VehicleSpawnCarpenterPoint = {
		Pos = {x = -77.807861328125, y = 6490.2612304688, z = 31.490894317627},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},

	VehicleCarpenterDeleter = {
		Pos = {x = -89.424125671387, y = 6487.1723632813, z = 31.490894317627},
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 240, g = 0, b = 0},
		Type = 36
	}
}

-- Skiver
Config.ZonesSkiver = {

	SkiverActions = {
		Pos = {x = 2545.08,  y = 2591.92,  z = 37.96-0.98},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 230, g = 20, b = 255},
		Type = 25
	},

	HarvestSkiver = {
		Pos = {x = 2677.16, y = 2863.8, z = 36.6},
		Size = {x = 1.0, y = 1.0, z = 2.5},
		Color = {r = 230, g = 20, b = 255},
		Type = -1
	},

	SkiverCraft2 = {
		Pos = {x = 286.68, y = 2843.84, z = 44.72},
		Size = {x = 1.0, y = 1.0, z = 2.5},
		Color = {r = 230, g = 20, b = 255},
		Type = -1
	},

	SkiverSellFarm = {
		Pos = {x = 464.4,  y = 3565.48,  z = 33.24},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 240, g = 0, b = 0},
		Type = -1
	},

	VehicleSpawnSkiverMenu = {
		Pos = {x = 2547.32,  y = 2580.64,  z = 37.96},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 230, g = 20, b = 255},
		Type = 36
	},

	VehicleSpawnSkiverPoint = {
		Pos = {x = 2540.68,  y = 2586.28,  z = 37.96},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},

	VehicleSkiverDeleter = {
		Pos = {x = 2531.36,  y = 2617.4,  z = 37.96},
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 240, g = 0, b = 0},
		Type = 36
	}
}

-- Bacars
Config.Zones10 = {
	BacarsActions = {
		Pos = {x = -206.56, y = -1341.66, z = 34.89-0.98},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 0, g = 0, b = 250},
		Type = 25
	},
	BossActionsBacars = {
		Pos = {x = -206.66, y = -1331.5, z = 34.89-0.98},
		Size = {x = 1.0, y = 1.0, z = 1.5},
		Color = {r = 0, g = 0, b = 250},
		Type = 25
	},
	VehicleSpawnBacarsMenu = {
		Pos = {x = -186.83, y =  -1321.57, z = 31.3},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 0, g = 0, b = 250},
		Type = 36
	},
	VehicleSpawnPointBacars= {
		Pos = {x = -182.93, y = -1320.01, z = 31.29},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},
	VehicleDeleterBacars = {
		Pos = {x = -186.0, y = -1318.82, z = 31.29},
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 240, g = 0, b = 0},
		Type = 36
	}
}

Config.TeleportZonesBacars = {
	EnterBuilding = {
	  Pos = {x = -1898.46, y = -572.459, z = 11.25},
	  Size = {x = 1.0, y = 1.0, z = 1.5},
	  Color = {r = 0, g = 0, b = 250},
	  Marker = 23,
	  Blip = false,
	  Name = "Bacars: Entrée",
	  Type = "teleport",
	  Hint = "Appuyez sur ~INPUT_PICKUP~ pour entrer dans le Towing.",
	  Teleport = {x = -1902.19, y = -572.53, z = 19.09},
	},
	ExitBuilding = {
	  Pos = {x = -1902.19, y = -572.53, z = 18.25},
	  Size = {x = 1.0, y = 1.0, z = 1.5},
	  Color = {r = 0, g = 0, b = 250},
	  Marker = 23,
	  Blip = false,
	  Name = "Bacars: Sortie",
	  Type = "teleport",
	  Hint = "Appuyez sur ~INPUT_PICKUP~ pour sortir du Towing.",
	  Teleport = {x = -1898.46, y = -572.459, z = 11.84},
	}
 }
 
 --- Militaire
Config.MilitaireStations = {

	MILI = {

		Blip = {
			Coords = vector3(-2358.22, 3249.59, 101.45),
			Sprite = 78,
			Display = 4,
			Scale = 0.7,
			Colour = 16
		},

		Cloakrooms = {
			vector3(-2363.07, 3246.34, 92.9)
		},

		Armories = {
			vector3(-2357.84, 3243.19, 92.9)
		},

		Vehicles = {
			{
				Spawner = vector3(-1835.34, 2953.89, 32.81),
				InsideShop = vector3(-1841.08, 2982.74, 32.81),
				SpawnPoints = {
					{ coords = vector3(-1846.46, 2985.65, 32.81), heading = 90.0, radius = 6.0 },
					{ coords = vector3(-1853.62, 2989.91, 32.81), heading = 90.0, radius = 6.0 },
					{ coords = vector3(-1866.89, 2997.07, 32.81), heading = 90.0, radius = 6.0 },
					{ coords = vector3(-1880.81, 3004.22, 32.81), heading = 90.0, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(-2165.62, 3250.47, 32.81),
				InsideShop = vector3(-2136.86, 3255.89, 32.81),
				SpawnPoints = {
					{ coords = vector3(-2147.53, 3240.45, 32.81), heading = 276.1, radius = 6.0 },
					{ coords = vector3(-2152.14, 3232.2, 32.81), heading = 302.5, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-1847.65, 2791.62, 32.81),
				InsideShop = vector3(-1859.67, 2795.52, 32.81),
				SpawnPoints = {
					{ coords = vector3(-1877.02, 2805.48, 32.81), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(-2353.07, 3256.18, 92.9)
		}

	}

}

Config.AuthorizedWeaponsMilitaire = {
	recrue = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 100, 400, nil }, price = 1500 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 600, 1000, 1400, 1800, nil }, price = 5000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 80 }
	},

	caporal = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 100, 400, nil }, price = 1500 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 600, 1000, 1400, 1800, nil }, price = 5000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 7500 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	sergent = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 100, 400, nil }, price = 1500 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 600, 1000, 1400, 1800, nil }, price = 5000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 200, 600, nil }, price = 7000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_MG', price = 10000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 7500 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 100, 400, nil }, price = 1500 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 600, 1000, 1400, 1800, nil }, price = 5000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 200, 600, nil }, price = 7000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_COMBATMG', price = 15000 },
		{ weapon = 'WEAPON_MG', price = 10000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 7500 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	major = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 100, 400, nil }, price = 1500 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 600, 1000, 1400, 1800, nil }, price = 5000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 200, 600, nil }, price = 7000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_COMBATMG', price = 15000 },
		{ weapon = 'WEAPON_MG', price = 10000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 7500 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	colonel = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 100, 400, nil }, price = 1500 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 600, 1000, 1400, 1800, nil }, price = 5000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 200, 600, nil }, price = 7000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_MG', price = 10000 },
		{ weapon = 'WEAPON_COMBATMG', price = 15000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 20000 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 100, 400, nil }, price = 1500 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 600, 1000, 1400, 1800, nil }, price = 5000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 200, 600, nil }, price = 7000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_MG', price = 10000 },
		{ weapon = 'WEAPON_COMBATMG', price = 15000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 20000 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	}
}

Config.AuthorizedVehiclesMilitaire = {
	Shared = {
		{ model = 'crusader', label = 'Jeep Militar', price = 5000 },
		{ model = 'barracks', label = 'Camion Barracas', price = 10000 },	
		{ model = 'rhino', label = 'Tank', price = 150000 },
		{ model = 'apc', label = 'Tank APC', price = 100000 },
		{ model = 'kuruma2', label = 'Voiture Blindée', price = 100000 },
	},

	recrue = {

	},

	caporal = {

	},

	sergent = {

	},

	lieutenant = {

	},

	major = {
	},

	colonel = {

	},

	boss = {

	}
}

Config.AuthorizedHelicoptersMilitaire = {
	recrue = {},

	caporal = {
		{ model = 'cargobob', label = 'CargoBob', livery = 0, price = 100000 }
	},

	sergent = {
		{ model = 'cargobob', label = 'CargoBob', livery = 0, price = 100000 }
	},

	lieutenant = {
		{ model = 'cargobob', label = 'CargoBob', livery = 0, price = 100000 }
	},

	major = {
		{ model = 'cargobob', label = 'CargoBob', livery = 0, price = 100000 }
	},

	colonel = {
		{ model = 'cargobob', label = 'CargoBob', livery = 0, price = 100000 }
	},

	boss = {
		{ model = 'valkyrie', label = 'Valkyrie', price = 5000 },
		{ model = 'cargobob', label = 'CargoBob', livery = 0, price = 100000 },
		{ model = 'titan', label = 'Titan', price = 150000 },
		{ model = 'lazer', label = 'Avion Lazer', price = 500000 },
		{ model = 'hydra', label = 'Avion Hydra', price = 500000 },
		{ model = 'buzzard2', label = 'Militaire Buzzard', livery = 0, price = 150000 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.UniformsMilitaire = {
	recrue_wear = {
		male = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 220, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 97, ['pants_2'] = 20,
			['shoes_1'] = 35, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 0, ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 161, ['tshirt_2'] = 8,
			['torso_1'] = 230, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 89, ['pants_2'] = 5,
			['shoes_1'] = 36, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 83, ['chain_2'] = 0
		}
	},
	caporal_wear = {
		male = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 220, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 97, ['pants_2'] = 20,
			['shoes_1'] = 35, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 0, ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 161, ['tshirt_2'] = 8,
			['torso_1'] = 230, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 89, ['pants_2'] = 5,
			['shoes_1'] = 36, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 83, ['chain_2'] = 0
		}
	},
	sergent_wear = {
		male = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 220, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 97, ['pants_2'] = 20,
			['shoes_1'] = 35, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 0, ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 161, ['tshirt_2'] = 8,
			['torso_1'] = 230, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 89, ['pants_2'] = 5,
			['shoes_1'] = 36, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 83, ['chain_2'] = 0
		}
	},
	lieutenant_wear = {
		male = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 220, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 97, ['pants_2'] = 20,
			['shoes_1'] = 35, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 0, ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 161, ['tshirt_2'] = 8,
			['torso_1'] = 230, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 89, ['pants_2'] = 5,
			['shoes_1'] = 36, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 83, ['chain_2'] = 0
		}
	},
	major_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 220, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 97, ['pants_2'] = 20,
			['shoes_1'] = 35, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 0, ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 161, ['tshirt_2'] = 8,
			['torso_1'] = 230, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 89, ['pants_2'] = 5,
			['shoes_1'] = 36, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 83, ['chain_2'] = 0
		}
	},
	colonel_wear = {
		male = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 220, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 97, ['pants_2'] = 20,
			['shoes_1'] = 35, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 0, ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 161, ['tshirt_2'] = 8,
			['torso_1'] = 230, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 89, ['pants_2'] = 5,
			['shoes_1'] = 36, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 83, ['chain_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 220, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 97, ['pants_2'] = 20,
			['shoes_1'] = 35, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 0, ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 161, ['tshirt_2'] = 8,
			['torso_1'] = 230, ['torso_2'] = 5,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 89, ['pants_2'] = 5,
			['shoes_1'] = 36, ['shoes_2'] = 0,
			['helmet_1'] = -1, ['helmet_2'] = 0,
			['chain_1'] = 83, ['chain_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 16, ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 13, ['bproof_2'] = 1
		}
	}
}

Config.Size         = {x = 1.0, y = 1.0, z = 1.0}
Config.Color        = {r = 186, g = 200, b = 0}
Config.Type         = 27
Config.Uniforms = { 
	ltdsud_wear = {
		male = {
			['tshirt_1'] = 75,  ['tshirt_2'] = 3,
			['torso_1'] = 29,   ['torso_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 0,
			['torso_1'] = 37,   ['torso_2'] = 0, 
			['arms'] = 4,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 6,   ['shoes_2'] = 0,  
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
    },
    
	ltdnord_wear = {
		male = {
			['tshirt_1'] = 75,  ['tshirt_2'] = 3,
			['torso_1'] = 29,   ['torso_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0   
		},
		female = {
			['tshirt_1'] = 68,  ['tshirt_2'] = 0,
			['torso_1'] = 37,   ['torso_2'] = 0, 
			['arms'] = 4,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 6,   ['shoes_2'] = 0,  
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},

	nue_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 15,   ['torso_2'] = 0,
			['arms'] = 15,
			['pants_1'] = 14,   ['pants_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 15,   ['torso_2'] = 0,
			['arms'] = 15,
			['pants_1'] = 14,   ['pants_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	}
}