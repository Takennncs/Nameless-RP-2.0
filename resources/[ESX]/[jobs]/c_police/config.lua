Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 2.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.WhitelistedCops = {
	'police'
}

Config.Zones = {

	PoliceDuty = {
	  Pos   = {x = -1093.2822265625, y = -832.47888183594, z = 14.283394813538-0.98},
	  Size  = { x = 1.0, y = 1.0, z = 0.5 },
	  Color = { r = 0, g = 255, b = 0 },  
	  Type  = 25,
	},
  
	AmbulanceDuty = {
	  Pos = { x = 341.76,  y = -587.35,  z = 28.89-0.98 },
	--   Pos = { x = -254.086,  y = 6324.037,  z = 32.40-0.98 },
	  Size = { x = 1.5, y = 1.5, z = 0.5 },
	  Color = { r = 0, g = 255, b = 0 },
	  Type = 25,
	},

	AmbulanceDuty = {
	    Pos = { x = -254.086,  y = 6324.037,  z = 32.40-0.98 },
		Size = { x = 1.5, y = 1.5, z = 0.5 },
		Color = { r = 0, g = 255, b = 0 },
		Type = 25,
	},

	SheriffDuty = {
		Pos = { x = -450.263,  y = 6008.969,  z = 31.84-0.92 },
		Size = { x = 1.5, y = 1.5, z = 0.5 },
		Color = { r = 0, g = 255, b = 0 },
		Type = 25,
	  },
  }
  
Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(-1112.1107177734, -824.59246826172, 19.317895889282),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.6,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(-1098.3280029297, -831.66662597656, 14.282796859741-0.98)
		},

		Armories = {
			vector3(-1098.7806396484, -826.03479003906, 14.282969474792-0.98)
		},

		Vehicles = {
			{
				Spawner = vector3(-1071.9644775391, -844.11853027344, 4.8840618133545),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(450.72, -1014.2, 28.48), heading = 89.99, radius = 6.0 },
					{ coords = vector3(450.72, -1014.2, 28.48), heading = 90.00, radius = 6.0 },
					{ coords = vector3(450.72, -1014.2, 28.48), heading = 90.00, radius = 6.0 },
					{ coords = vector3(450.72, -1014.2, 28.48), heading = 90.00, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-1104.7039794922, -838.06085205078, 37.699451446533),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(450.04, -981.14, 42.691), heading = 0.0, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(-1113.2811279297, -832.85766601563, 34.361068725586-0.98)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 1500 },
		{ weapon = 'WEAPON_FLASHBANG', price = 1500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 80 }
	},

	officer = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 1 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	sergeant = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	intendent = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	chef = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_BZGAS', price = 100 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 2500 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 5000 }	
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		--{ model = 'newvic', label = 'Ford Victoria', price = 1 },
		--{ model = '11caprice', label = 'Chevrolet Caprice', price = 1 },
		--{ model = 'lspd1', label = 'Ford Mondéo', price = 1 },
		--{ model = 'lspd2', label = 'Ford Expédition', price = 1 },
		--{ model = 'lspd3', label = 'Ford F150', price = 1 },
		--{ model = 'fbi3', label = 'Mercedes Sprinter', price = 1 },
		--{ model = '1200RTP', label = 'Bmw Moto', price = 1 },
		--{ model = '16explorer', label = 'Ford Explorer', price = 1 },
		--{ model = '16taurus', label = 'Ford Taurus', price = 1 },
		--{ model = '18charger', label = 'Dodge', price = 1 },
		--{ model = '19durango', label = 'Jeep', price = 1 },
		--{ model = 'HellcatBW', label = 'Dodge Charger', price = 1 },
		--{ model = 'pitbull', label = 'Blindé', price = 1 }
	},

	recruit = {
		{ model = 'newvic', label = 'Ford Victoria', price = 1 },
		--{ model = 'newvic', label = 'Ford Victoria', price = 10000 },
		--{ model = 'police2', label = 'Ford Victoria', price = 10000 },
		--{ model = '11caprice', label = 'Chevrolet Caprice', price = 10000 },
		--{ model = 'lspd1', label = 'Ford Mondéo', price = 10000 },
		--{ model = 'lspd2', label = 'Ford Expédition', price = 10000 },
		--{ model = 'lspd3', label = 'Ford F150', price = 10000 },
		--{ model = 'fbi3', label = 'Mercedes Sprinter', price = 10000 },
		--{ model = '1200RTP', label = 'Bmw Moto', price = 10000 },
		--{ model = '16explorer', label = 'Ford Explorer', price = 10000 },
		--{ model = '16taurus', label = 'Ford Taurus', price = 10000 },
		--{ model = '18charger', label = 'Dodge', price = 10000 },
		--{ model = '19durango', label = 'Jeep', price = 10000 },
		--{ model = 'HellcatBW', label = 'Dodge Charger', price = 1 },
		--{ model = 'pitbull', label = 'Blindé', price = 30000 }
	},

	officer = {
		{ model = 'newvic', label = 'Ford Victoria', price = 1 },
		--{ model = 'newvic', label = 'Ford Victoria', price = 10000 },
		{ model = '14charger', label = 'Dodge', price = 1 },
		--{ model = '11caprice', label = 'Chevrolet Caprice', price = 1 },
		--{ model = 'lspd1', label = 'Ford Mondéo', price = 1 },
		--{ model = 'lspd2', label = 'Ford Expédition', price = 1 },
		--{ model = 'lspd3', label = 'Ford F150', price = 1 },
		--{ model = 'fbi3', label = 'Mercedes Sprinter', price = 1 },
		{ model = 'policeb', label = 'Moto', price = 1 },
		--{ model = '16explorer', label = 'Ford Explorer', price = 1 },
		--{ model = '16taurus', label = 'Ford Taurus', price = 1 },
		--{ model = '18charger', label = 'Dodge', price = 1 },
		--{ model = '19durango', label = 'Jeep', price = 1 },
		--{ model = 'HellcatBW', label = 'Dodge Charger', price = 1 },
		--{ model = 'pitbull', label = 'Blindé', price = 30000 }
	},

	sergeant = {
		{ model = 'newvic', label = 'Ford Victoria', price = 1 },
		--{ model = 'newvic', label = 'Ford Victoria', price = 1 },
		{ model = '14charger', label = 'Dodge', price = 1 },
		{ model = '16explorer', label = 'Ford Explorer', price = 1 },
		--{ model = 'lapd3', label = 'Ford Explorer 2', price = 1 },
		--{ model = 'lspd1', label = 'Ford Mondéo', price = 1 },
		--{ model = 'lspd2', label = 'Ford Expédition', price = 1 },
		--{ model = 'lspd3', label = 'Ford F150', price = 1 },
		--{ model = 'fbi3', label = 'Mercedes Sprinter', price = 1 },
		{ model = 'policeb', label = 'Moto', price = 1 },
		--{ model = '16explorer', label = 'Ford Explorer', price = 1 },
		--{ model = '16taurus', label = 'Ford Taurus', price = 1 },
		--{ model = '18charger', label = 'Dodge', price = 1 },
		--{ model = 'lapd4', label = 'Taheo', price = 1 },
		--{ model = 'HellcatBW', label = 'Dodge Charger', price = 1 },
		--{ model = 'pitbull', label = 'Blindé', price = 30000 }
	},

	intendent = {
	},

	lieutenant = {
		{ model = 'newvic', label = 'Ford Victoria', price = 1 },
		--{ model = 'newvic', label = 'Ford Victoria', price = 1 },
		{ model = '14charger', label = 'Dodge', price = 1 },
		{ model = '16explorer', label = 'Ford Explorer', price = 1 },
		--{ model = 'lapd3', label = 'Ford Explorer 2', price = 1 },
		--{ model = 'lspd1', label = 'Ford Mondéo', price = 1 },
		--{ model = 'lspd2', label = 'Ford Expédition', price = 1 },
		--{ model = 'lspd3', label = 'Ford F150', price = 1 },
		{ model = 'police4', label = 'Cruiser Civil', price = 1 },
		{ model = 'policeb', label = 'Bmw Moto', price = 1 },
		--{ model = '16explorer', label = 'Ford Explorer', price = 1 },
		--{ model = '16taurus', label = 'Ford Taurus', price = 1 },
		--{ model = '18charger', label = 'Dodge', price = 1 },
		--{ model = 'lapd4', label = 'Taheo', price = 1 },
		--{ model = 'HellcatBW', label = 'Dodge Charger', price = 1 },
		{ model = 'riot', label = 'Blindé', price = 1 }
	},

	chef = {
		{ model = 'newvic', label = 'Ford Victoria', price = 1 },
		--{ model = 'newvic', label = 'Ford Victoria', price = 1 },
		{ model = '14charger', label = 'Dodge', price = 1 },
		{ model = '16explorer', label = 'Ford Explorer', price = 1 },
		--{ model = 'lapd3', label = 'Ford Explorer 2', price = 1 },
		--{ model = 'lspd1', label = 'Ford Mondéo', price = 1 },
		--{ model = 'lspd2', label = 'Ford Expédition', price = 1 },
		--{ model = 'lspd3', label = 'Ford F150', price = 1 },
		{ model = 'police4', label = 'Cruiser Civil', price = 1 },
		{ model = 'policeb', label = 'Bmw Moto', price = 1 },
		--{ model = '16explorer', label = 'Ford Explorer', price = 1 },
		--{ model = '16taurus', label = 'Ford Taurus', price = 1 },
		--{ model = '18charger', label = 'Dodge', price = 1 },
		--{ model = 'lapd4', label = 'Taheo', price = 1 },
		{ model = 'riot2', label = 'Anti Emeute', price = 1 },
		{ model = 'riot', label = 'Blindé', price = 1 }
	},

	boss = {
		{ model = 'newvic', label = 'Ford Victoria', price = 1 },
		--{ model = 'newvic', label = 'Ford Victoria', price = 1 },
		{ model = '14charger', label = 'Dodge', price = 1 },
		{ model = '16explorer', label = 'Ford Explorer', price = 1 },
		--{ model = 'lapd3', label = 'Ford Explorer 2', price = 1 },
		--{ model = 'lspd1', label = 'Ford Mondéo', price = 1 },
		--{ model = 'lspd2', label = 'Ford Expédition', price = 1 },
		--{ model = 'lspd3', label = 'Ford F150', price = 1 },
		{ model = 'police4', label = 'Cruiser Civil', price = 1 },
		{ model = 'policeb', label = 'Bmw Moto', price = 1 },
		--{ model = '16explorer', label = 'Ford Explorer', price = 1 },
		--{ model = '16taurus', label = 'Ford Taurus', price = 1 },
		--{ model = '18charger', label = 'Dodge', price = 1 },
		--{ model = 'lapd4', label = 'Taheo', price = 1 },
		{ model = 'riot2', label = 'Anti Emeute', price = 1 },
		{ model = 'riot', label = 'Blindé', price = 1 }
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 40000 }
	},

	chef = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 40000 }
	},

	boss = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 40000 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 149,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 149,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 149,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 1,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 149,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
	male = {
		['tshirt_1'] = 55,  ['tshirt_2'] = 0,
		['torso_1'] = 149,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 41,
		['pants_1'] = 59,   ['pants_2'] = 0,
		['shoes_1'] = 24,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 2,     ['ears_2'] = 0
	},
	female = {
		['tshirt_1'] = 35,  ['tshirt_2'] = 0,
		['torso_1'] = 48,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 44,
		['pants_1'] = 34,   ['pants_2'] = 0,
		['shoes_1'] = 27,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 12,  ['bproof_2'] = 3
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	}
}