Config                            = {}

Config.ChanceDoenca = 0.5 -- Percentage 0-100%

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 25, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 150  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'fr'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 5 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 5 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = false

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 500

Config.RespawnPoint = { coords = vector3(364.6, -583.0, 43.28), heading = 154.2287902832 }

Config.NPCJobEarnings = {min = 200, max = 400}

Config.Hospitals = {

	CentralLosSantos = {

		RespawnLS = {
			vector3(355.626, -584.089, 43.28)
		},

		RespawnBC = {
			vector3(-266.373, 6318.053, 32.426)
		},

		Blip = {
			coords = vector3(-464.125, -338.484, 28.79-0.98),
			sprite = 61,
			scale  = 0.9,
			color  = 2
		},

		AmbulanceActions = {
			vector3(-443.754, -309.832, 34.91-0.98),
			vector3(-252.843, 6326.800, 32.40-0.98)
		},

		Pharmacies = {
			vector3(-453.622, -308.436, 34.91-0.98),
			vector3(-253.492, 6318.524, 32.40-0.98)
		},

		Vehicles = {
			{
				Spawner = vector3(-426.407, -357.545, 24.22-0.98),
				InsideShop = vector3(340.64, -559.92, 28.76),
				Marker = { type = 25, x = 1.5, y = 1.5, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = false },
				SpawnPoints = {
					{ coords = vector3(342.28,-560.24,8.76-0.98), heading = 340.47161865234, radius = 10.0 },
					{ coords = vector3(342.28,-560.24,8.76-0.98), heading = 340.47161865234, radius = 10.0 },
					{ coords = vector3(342.28,-560.24,8.76-0.98), heading = 340.47161865234, radius = 10.0 }
				}
			},
			{
				Spawner = vector3(328.36, -559.8, 28.76-0.98),
				InsideShop = vector3(340.64, -559.92, 28.76),
				Marker = { type = 25, x = 1.5, y = 1.5, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = false },
				SpawnPoints = {
					{ coords = vector3(342.28,-560.24,8.76-0.98), heading = 340.47161865234, radius = 10.0 },
					{ coords = vector3(342.28,-560.24,8.76-0.98), heading = 340.47161865234, radius = 10.0 },
					{ coords = vector3(342.28,-560.24,8.76-0.98), heading = 340.47161865234, radius = 10.0 }
				}
			}
		},
		

		Helicopters = {
			{
				Spawner = vector3(341.87, -591.567, 74.165-0.98),
				InsideShop = vector3(349.51, -593.86, 74.16),
				Marker = { type = 25, x = 2.0, y = 2.0, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = false },
				SpawnPoints = {
					{ coords = vector3(351.457, -588.64, 74.165), heading = 142.7, radius = 10.0 }
				}
			},
			{
				Spawner = vector3(-221.826171875, 6339.8315429688, 31.429814910889),
				InsideShop = vector3(-218.66477966309, 6349.8017578125, 32.810332870483),
				Marker = { type = 25, x = 2.0, y = 2.0, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = false },
				SpawnPoints = {
					{ coords = vector3(-218.66477966309, 6349.8017578125, 32.810332870483), heading = 258, radius = 10.0 }
				}
			}
		},


	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Ambulance', price = 1},
		{ model = 'ambulance2', label = 'Ambulance 2', price = 1},
		{ model = 'emscar', label = 'Ford Victoria', price = 1},
		--{ model = 'emscar2', label = 'Dodge', price = 1}
	},

	doctor = {
		{ model = 'ambulance', label = 'Ambulance', price = 1},
		{ model = 'ambulance2', label = 'Ambulance 2', price = 1},
		{ model = 'emscar', label = 'Ford Victoria', price = 1},
		--{ model = 'emscar2', label = 'Dodge', price = 1}
	},

	chief_doctor = {
		{ model = 'ambulance', label = 'Ambulance', price = 1},
		{ model = 'ambulance2', label = 'Ambulance 2', price = 1},
		{ model = 'emscar', label = 'Ford Victoria', price = 1},
		--{ model = 'emscar2', label = 'Dodge', price = 1}
	},

	boss = {
		{ model = 'ambulance', label = 'Ambulance', price = 1},
		{ model = 'ambulance2', label = 'Ambulance 2', price = 1},
		{ model = 'emscar', label = 'Ford Victoria', price = 1},
		--{ model = 'emscar2', label = 'Dodge', price = 1}
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {},

	chief_doctor = {
		{ model = 'supervolito', label = 'Maverick', price = 1 }
	},

	boss = {
		{ model = 'supervolito', label = 'Maverick', price = 1 }
	}

}

Config.JobLocations = {
	--{x = 1163.50, y = -1536.22, z = 39.00},
	--{x = 290.18, y = -1440.89, z = 29.56},
	--{x = -497.59, y = -336.16, z = 34.10},
	{x = -464.244, y = -338.676, z = 33.600}
} 