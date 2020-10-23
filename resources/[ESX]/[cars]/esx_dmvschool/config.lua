Config = {}
Config.DrawDistance = 30.0
Config.MaxErrors = 5
Config.SpeedMultiplier = 3.6
Config.Locale = 'fr'

Config.Prices = {
	dmv = 100,
	drive = 425,
	drive_bike = 245,
	drive_truck = 560
}

Config.VehicleModels = {
	drive = 'warrener',
	drive_bike = 'double',
	drive_truck = 'mule3'
}

Config.SpeedLimits = {
	residence = 80,
	town = 80,
	freeway = 80
}

Config.Zones = {

	DMVSchool = {
		Pos = {x = -324.24,  y = -1064.16,  z = 29.4},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type = -1
	},

	VehicleSpawnPoint = {
		Pos = {x = -360.48,  y = -1061.36,  z = 30.4-0.98, h = 13.82},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type = -1
	}

}

Config.CheckPoints = {

	{
		Pos = {x = -360.48,  y = -1061.36,  z = 30.4-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -254.88,  y = -1016.8,  z = 28.84-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -199.84,  y = -912.12,  z = 29.36-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
				DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -272.64,  y = -851.16,  z = 31.72-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -225.48,  y = -696.92,  z = 33.52-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -234.32,  y = -668.28,  z = 33.4-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -528.6,  y = -654.96,  z = 33.28-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -503.16,  y = -817.6,  z = 30.48-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -357.8,  y = -875.64,  z = 31.08-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -290.0,  y = -896.2,  z = 31.08-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -212.96,  y = -895.4,  z = 29.24-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -265.44,  y = -1033.96,  z = 28.16-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -281.36,  y = -1089.36,  z = 24.04-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -286.6,  y = -1108.32,  z = 23.12-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -315.2,  y = -1098.56,  z = 23.04-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},


	{
		Pos = {x = -333.96,  y = -1071.32,  z = 23.04-0.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			ESX.Game.DeleteVehicle(vehicle)
		end
	}

}