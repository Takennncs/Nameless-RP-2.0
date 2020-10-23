Config					= {}
config					= {}
Cfg = {}

intervals = { -- Unit: seconds
	['save'] = 1, -- How often the vehicles' position should be saved. The save schedule is only useful after game crashes, or disconnects while in vehicle.
	['check'] = 2 -- How often should it check for despawned vehicles.
}

saveOnExit = true -- Whether the vehicle should be saved once after a player leaves a vehicle. Make sure to keep a short save interval if you disable this option.

debugMode = false -- Toggle debug mode (client & server console spam).

Config.EnableCash       = true
Config.EnableBlackMoney = true
Config.EnableInventory  = true
Config.EnableWeapons = true

Cfg.radius = 5.0
Config.webhook 					  = "https://discordapp.com/api/webhooks/734562528864108574/F2yQCxDSCKGnsWufbbE_W2-lKkt1Mlh96NPAl25xYVAc6I-kAiERju_r9_tDeF7J_kNx" --webhook 

Config.Percentage		= 50
Config.MarkerSizeBlan   = {x = 3.0, y = 3.0, z = 3.0}
Config.Menu				= true
Config.Bonus			= {min = 0, max = 0}

Config.ZonesBlan = {
	{x = 1641.4388427734, y = 4853.4594726563, z = 42.025337219238, percent = 50}
}

Config.Timer = 1

-- Set if show alert when player use gun

-- Set if show when player do carjacking
Config.CarJackingAlert = true

-- In seconds
Config.BlipJackingTime = 20

-- Blip radius, in float value!
Config.BlipJackingRadius = 50.0

-- Show notification when cops steal too?
Config.ShowCopsMisbehave = true

-- Jobs in this table are considered as cops
Config.WhitelistedCops = {
	'police',
	'sheriff'
}

config.chance = 0 -- chance de ser desbloqueado em porcentagem

config.blacklist = { -- veículos que sempre serão bloqueados quando gerados naturalmente
  "T20",
  "police",
  "police2",
  "police3",
  "sheriff",
  "sheriff3",
  "sheriff2",
  "riot",
  "fbi",
  "hwaycar2",
  "hwaycar3",
  "hwaycar10",
  "hwaycar",
  "polf430",
  "policeb",
  "police7",
  "RHINO"
}

Config.SpeedCamRange = 17
Config.KmhFine = 10

Config.Radars = {
	--{x = -623.44421386719, y = -823.08361816406, z = 25.25704574585, maxSpeed = 90, heading = 145.0 },
	--{x = -652.44421386719, y = -854.08361816406, z = 24.55704574585, maxSpeed = 90, heading = 325.0 },
	-- {x = 1632.41,  y = 1094.17,  z = 81.79, maxSpeed = 70, heading = 127.24 },
	-- {x = 1606.86,  y = 1115.47,  z = 82.22, maxSpeed = 70, heading = 199.38 },

	--{x = 723.57,  y = 2691.01,  z = 40.21, maxSpeed = 120, heading = 309.83 },
	--{x = 645.74,  y = 2710.45,  z = 40.92, maxSpeed = 120, heading = 123.05 },

	-- {x = -2617.35,  y = 2974.03,  z = 16.91, maxSpeed = 70, heading = 202.04 },
	-- {x = -2604.93,  y = 2970.88,  z = 16.88, maxSpeed = 70, heading = 321.63 },

	--{x = 1623.0114746094, y = 1068.9924316406, z = 80.903594970703, maxSpeed = 150, heading = 84.0 },
	--{x = -2604.8994140625, y = 2996.3391113281, z = 27.528566360474, maxSpeed = 150, heading = 175.0 },
	--{x = 2136.65234375, y = -591.81469726563, z = 94.272926330566, maxSpeed = 120, heading = 318.0 },
	--{x = 2117.5764160156, y = -558.51013183594, z = 95.683128356934, maxSpeed = 120, heading = 158.0 },
	--{x = 407.082, y = -969.703, z = 29.431, maxSpeed = 90, heading = 33.0 },-- radar6 commico
	--{x = 657.315, y = -218.819, z = 44.06, maxSpeed = 120, heading = 320.0 },-- radar7
	--{x = 2118.287, y = 6040.027, z = 50.928, maxSpeed = 120, heading = 172.0 },-- radar8
	--{x = -106.304, y = -1127.5530, z = 30.778, maxSpeed = 90, heading = 230.0 },-- radar9
	--{x = -823.3688, y = -1146.980, z = 8.0, maxSpeed = 90, heading = 300.0 },-- radar10
	--{x = 337.996, y = 163.550, z = 103.349, maxSpeed = 90, heading = 114.85311126 },-- la banque prinsipal
	--{x = -1572.364, y = -147.768, z = 55.469, maxSpeed = 90, heading = 59.228 },
	--{x = 254.268, y = 1309.492, z = 236.341, maxSpeed = 90, heading = 22.153 },
	--{x = 196.643, y = -794.398, z = 31.510, maxSpeed = 90, heading = 358.927 },
	--{x = 139.904, y = -822.234, z = 31.163, maxSpeed = 90, heading = 36.118 },
}

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_door01',
				objYaw = -90.0,
				objCoords = vector3(434.7, -980.6, 30.8)
			},

			{
				objName = 'v_ilev_ph_door002',
				objYaw = -90.0,
				objCoords = vector3(434.7, -983.2, 30.8)
			}
		}
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 308.0,
		objCoords  = vector3(-1088.79, -830.25, 5.63),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 308.0,
		objCoords  = vector3(-1091.14, -827.00, 5.63),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 308.0,
		objCoords  = vector3(-1093.55, -823.85, 5.63),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 308.0,
		objCoords  = vector3(-1095.95, -820.72, 5.63),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 308.0,
		objCoords  = vector3(-1090.64, -821.62, 5.63),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 308.0,
		objCoords  = vector3(-1088.23, -824.77, 5.63),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 308.0,
		objCoords  = vector3(-1085.82, -827.83, 5.63),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 180.0,
				objCoords = vector3(443.9, -989.0, 30.6)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 0.0,
				objCoords = vector3(445.3, -988.7, 30.6)
			}
		}
	},

	{
		textCoords = vector3(319.9739074707, -560.64764404297, 28.898637771606),
		authorizedJobs = { 'ambulance' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 205.0,
				objCoords  = vector3(321.098, -560.092, 29.045)
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = 25.0,
				objCoords  = vector3(318.743, -561.184, 29.043)
			}
		}
	},

	{
		textCoords = vector3(959.94409179688, -140.25738525391, 74.499366760254),
		authorizedJobs = { 'tabac' },
		locked = true,
		distance = 12,
		doors = {
			{
				objName = 'prop_fnclink_06gate2',
				objYaw = 329.0,
				objCoords  = vector3(957.198974609375, -138.5960235595703, 74.61907196044922)
			},

			{
				objName = 'prop_fnclink_06gate2',
				objYaw = 149.0,
				objCoords  = vector3(962.5286865234375, -141.7977752685547, 74.61029815673828)
			}
		}
	},

	-- {
	-- 	objName = 'prop_facgate_08',
	-- 	-- objYaw = 250.0,
	-- 	objCoords  = vector3(962.5071411132812, -141.33700561523438, 73.4096908569336),
	-- 	textCoords = vector3(962.5071411132812, -141.33700561523438, 73.4096908569336),
	-- 	authorizedJobs = { 'tabac' },
	-- 	locked = true,
	-- 	distance = 12
	-- },
	
	{
		objName = 'lr_prop_supermod_door_01',
		objCoords  = vector3(-205.68283081054688, -1310.6826171875, 30.29770851135254),
		textCoords = vector3(-205.68283081054688, -1310.6826171875, 30.29770851135254),
		authorizedJobs = { 'lscustoms' },
		locked = true,
		distance = 12
	},
	
	{
		textCoords = vector3(1291.76, -743.2, 65.57),
		authorizedJobs = { 'tabac' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_cor_darkdoor',
				objYaw = 60.0,
				objCoords = vector3(1292.0383, -742.15, 65.77)
			},

			{
				objName = 'v_ilev_cor_darkdoor',
				objYaw = 250.0,
				objCoords = vector3(1290.96, -744.48, 65.77)
			}
		}
	},
	
	{
		objName = 'ex_prop_door_lowbank_ent_r',
		objYaw = 60.0,
		objCoords  = vector3(1290.118, -746.27, 65.70),
		textCoords = vector3(1290.56, -745.55, 65.57),
		authorizedJobs = { 'tabac' },
		locked = true
	},

	-- {
	-- 	objName = 'prop_gate_prison_01',
	-- 	objYaw = 90.0,
	-- 	objCoords  = vector3(417.5696716308594, -1024.9547119140625, 28.206758499145508),
	-- 	textCoords = vector3(417.5696716308594, -1024.9547119140625, 28.206758499145508),
	-- 	authorizedJobs = { 'police' },
	-- 	distance = 20,
	-- 	locked = true
	-- },
	
	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objYaw = 90.0,
		objCoords  = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_ph_gendoor006',
		objYaw = 90.0,
		objCoords  = vector3(463.69, -983.37, 35.99),
		textCoords = vector3(463.67, -984.13, 35.93),
		authorizedJobs = { 'police' },
		locked = true
	},
	
	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objYaw = 90.0,
		objCoords  = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = 90.0,
		objCoords  = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = -90.0,
		objCoords  = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objYaw = -180.0,
		objCoords  = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To downstairs (double doors)

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 0.0,
		objCoords  = vector3(463.8, -992.6, 24.9),
		textCoords = vector3(463.3, -992.6, 25.1),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = -90.0,
		objCoords  = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 180.0,
		objCoords  = vector3(467.4, -999.5, 25.0),
		textCoords = vector3(467.4, -999.5, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 180.0,
		objCoords  = vector3(471.0, -999.5, 25.0),
		textCoords = vector3(471.0, -999.5, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 180.0,
		objCoords  = vector3(475.2, -1007.7, 24.4),
		textCoords = vector3(475.2, -1007.7, 24.4),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 180.0,
		objCoords  = vector3(478.8, -1007.7, 24.4),
		textCoords = vector3(478.8, -1007.7, 24.4),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_gendoor005',
		objYaw = 180.0,
		objCoords  = vector3(483.4, -999.7, 24.4),
		textCoords = vector3(483.4, -999.7, 24.4),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_gendoor005',
		objYaw = 180.0,
		objCoords  = vector3(490.1, -999.7, 24.4),
		textCoords = vector3(490.1, -999.7, 24.4),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 0.0,
		objCoords  = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = { 'police' },
		locked = true
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 0.0,
				objCoords  = vector3(467.3, -1014.4, 26.5)
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = 180.0,
				objCoords  = vector3(469.9, -1014.4, 26.5)
			}
		}
	},
	
	-- {
	-- 	textCoords = vector3(445.991, -999.08, 31.1),
	-- 	authorizedJobs = { 'police' },
	-- 	locked = true,
	-- 	distance = 4,
	-- 	doors = {
	-- 		{
	-- 			objName = 'v_ilev_gtdoor',
	-- 			objYaw = 0.0,
	-- 			objCoords  = vector3(444.62, -999.002, 30.788)
	-- 		},

	-- 		{
	-- 			objName = 'v_ilev_gtdoor',
	-- 			objYaw = 180.0,
	-- 			objCoords  = vector3(447.217, -999.002, 30.788)
	-- 		}
	-- 	}
	-- },

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objYaw = 90.0,
		objCoords  = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objName = 'v_ilev_shrfdoor',
		objYaw = 30.0,
		objCoords  = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = { 'police' },
		locked = false
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_shrf2door',
				objYaw = -45.0,
				objCoords  = vector3(-443.1, 6015.6, 31.7),
			},

			{
				objName = 'v_ilev_shrf2door',
				objYaw = 135.0,
				objCoords  = vector3(-443.9, 6016.6, 31.7)
			}
		}
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 20
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 20
	},

	--
	-- Addons
	--

	--[[
	-- Entrance Gate (Mission Row mod) https://www.gta5-mods.com/maps/mission-row-pd-ymap-fivem-v1
	{
		objName = 'prop_gate_airport_01',
		objCoords  = vector3(420.1, -1017.3, 28.0),
		textCoords = vector3(420.1, -1021.0, 32.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14
	}
	--]]
}

Config.MaxDistance = 1.5

Config.debug = false

Config.Interactables = {
	"prop_bench_01a",
	"prop_bench_01b",
	"prop_bench_01c",
	"prop_bench_02",
	"prop_bench_03",
	"prop_bench_04",
	"prop_bench_05",
	"prop_bench_06",
	"prop_bench_05",
	"prop_bench_08",
	"prop_bench_09",
	"prop_bench_10",
	"prop_bench_11",
	"prop_fib_3b_bench",
	"prop_ld_bench01",
	"prop_wait_bench_01",
	"hei_prop_heist_off_chair",
	"hei_prop_hei_skid_chair",
	"prop_chair_01a",
	"prop_chair_01b",
	"prop_chair_02",
	"prop_chair_03",
	"prop_chair_04a",
	"prop_chair_04b",
	"prop_chair_05",
	"prop_chair_06",
	"prop_chair_05",
	"prop_chair_08",
	"prop_chair_09",
	"prop_chair_10",
	"prop_chateau_chair_01",
	"prop_clown_chair",
	"prop_cs_office_chair",
	"prop_direct_chair_01",
	"prop_direct_chair_02",
	"prop_gc_chair02",
	"prop_off_chair_01",
	"prop_off_chair_03",
	"prop_off_chair_04",
	"prop_off_chair_04b",
	"prop_off_chair_04_s",
	"prop_off_chair_05",
	"prop_old_deck_chair",
	"prop_old_wood_chair",
	"prop_rock_chair_01",
	"prop_skid_chair_01",
	"prop_skid_chair_02",
	"prop_skid_chair_03",
	"prop_sol_chair",
	"prop_wheelchair_01",
	"prop_wheelchair_01_s",
	"p_armchair_01_s",
	"p_clb_officechair_s",
	"p_dinechair_01_s",
	"p_ilev_p_easychair_s",
	"p_soloffchair_s",
	"p_yacht_chair_01_s",
	"v_club_officechair",
	"v_corp_bk_chair3",
	"v_corp_cd_chair",
	"v_corp_offchair",
	"v_ilev_chair02_ped",
	"v_ilev_hd_chair",
	"v_ilev_p_easychair",
	"v_ret_gc_chair03",
	"prop_ld_farm_chair01",
	"prop_table_04_chr",
	"prop_table_05_chr",
	"prop_table_06_chr",
	"v_ilev_leath_chr",
	"prop_table_01_chr_a",
	"prop_table_01_chr_b",
	"prop_table_02_chr",
	"prop_table_03b_chr",
	"prop_table_03_chr",
	"prop_torture_ch_01",
	"v_ilev_fh_dineeamesa",
	"v_ilev_fh_kitchenstool",
	"v_ilev_tort_stool",
	"v_ilev_fh_kitchenstool",
	"v_ilev_fh_kitchenstool",
	"v_ilev_fh_kitchenstool",
	"v_ilev_fh_kitchenstool",
	"hei_prop_yah_seat_01",
	"hei_prop_yah_seat_02",
	"hei_prop_yah_seat_03",
	"prop_waiting_seat_01",
	"prop_yacht_seat_01",
	"prop_yacht_seat_02",
	"prop_yacht_seat_03",
	"prop_hobo_seat_01",
	"prop_rub_couch01",
	"miss_rub_couch_01",
	"prop_ld_farm_couch01",
	"prop_ld_farm_couch02",
	"prop_rub_couch02",
	"prop_rub_couch03",
	"prop_rub_couch04",
	"p_lev_sofa_s",
	"p_res_sofa_l_s",
	"p_v_med_p_sofa_s",
	"p_yacht_sofa_01_s",
	"v_ilev_m_sofa",
	"v_res_tre_sofa_s",
	"v_tre_sofa_mess_a_s",
	"v_tre_sofa_mess_b_s",
	"v_tre_sofa_mess_c_s",
	"prop_roller_car_01",
	"prop_roller_car_02",
}

Config.Sitable = {
	prop_bench_01a 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_bench_01b 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_bench_01c 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_bench_02 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_bench_03 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_bench_04 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_bench_05 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_bench_06 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_bench_05 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_bench_08 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_bench_09 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_bench_10 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_bench_11 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_fib_3b_bench 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_ld_bench01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_wait_bench_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},

	-- CHAIR
	hei_prop_heist_off_chair 	= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	hei_prop_hei_skid_chair 	= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_chair_01a 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_chair_01b 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_chair_02 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_chair_03 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_chair_04a 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_chair_04b 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_chair_05 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_chair_06 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_chair_05 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_chair_08 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_chair_09 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_chair_10 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_chateau_chair_01 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_clown_chair 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_cs_office_chair 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_direct_chair_01 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_direct_chair_02 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_gc_chair02 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_off_chair_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_off_chair_03 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_off_chair_04 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_off_chair_04b 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_off_chair_04_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_off_chair_05 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_old_deck_chair 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_old_wood_chair 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_rock_chair_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_skid_chair_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_skid_chair_02 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_skid_chair_03 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_sol_chair 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_wheelchair_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_wheelchair_01_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	p_armchair_01_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	p_clb_officechair_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	p_dinechair_01_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	p_ilev_p_easychair_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	p_soloffchair_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	p_yacht_chair_01_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_club_officechair 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_corp_bk_chair3 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_corp_cd_chair 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_corp_offchair 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_ilev_chair02_ped 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_ilev_hd_chair 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_ilev_p_easychair 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_ret_gc_chair03 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_ld_farm_chair01 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_table_04_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_table_05_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_table_06_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_ilev_leath_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_table_01_chr_a 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_table_01_chr_b 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_table_02_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_table_03b_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_table_03_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_torture_ch_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_ilev_fh_dineeamesa 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},


	v_ilev_fh_kitchenstool 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_ilev_tort_stool 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_ilev_fh_kitchenstool 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_ilev_fh_kitchenstool 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_ilev_fh_kitchenstool 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_ilev_fh_kitchenstool 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},

	-- SEAT
	hei_prop_yah_seat_01 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	hei_prop_yah_seat_02 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	hei_prop_yah_seat_03 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_waiting_seat_01 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_yacht_seat_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_yacht_seat_02 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_yacht_seat_03 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_hobo_seat_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.65, forwardOffset = 0.0, leftOffset = 0.0},

	-- COUCH
	prop_rub_couch01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	miss_rub_couch_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_ld_farm_couch01 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_ld_farm_couch02 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_rub_couch02 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_rub_couch03 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_rub_couch04 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},

	-- SOFA
	p_lev_sofa_s 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	p_res_sofa_l_s 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	p_v_med_p_sofa_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	p_yacht_sofa_01_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_ilev_m_sofa 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_res_tre_sofa_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_tre_sofa_mess_a_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_tre_sofa_mess_b_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	v_tre_sofa_mess_c_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},

	-- MISC
	prop_roller_car_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0},
	prop_roller_car_02 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0}
}

UTK = {}
UTK.timer = 60 -- countdown to secure lock in seconds (time needed to pass to door to be closed back)
UTK.hacktime = 1000 -- first door open delay to make time for police to arrive and roleplay in miliseconds (I highly recommend to leave it be (2.5 min default))
UTK.maxcash = 500 -- maximum amount of cash a pile can hold
UTK.mincash = 250 -- minimum amount of cash a pile holds
UTK.black = true -- enable this if you want blackmoney as a reward
UTK.cooldown = 1200 -- amount of time to do the heist again in seconds (15min)
UTK.mincops = 2 -- minimum required cops to start mission
UTK.vaultdoor = "v_ilev_gb_vauldr"
UTK.door = "v_ilev_gb_vaubar"
UTK.office = "v_ilev_gb_teldr"
UTK.Banks = {
    F1 = {
        doors = {
            startloc = {x = 310.93, y = -284.44, z = 54.16, h = -90.00, animcoords = {x = 311.05, y = -284.00, z = 53.16, h = 248.60}},
            secondloc = {x = 312.93, y = -284.45, z = 54.16, h = 160.91, animcoords = {x = 313.41, y = -284.42, z = 53.16, h = 160.91}},
            --lockpick = {x = , y = , z = , h = , animcoords = {x = , y = , z = }}
        },
        prop = {
            first = {coords = vector3(311.5481, -284.5114, 54.285), rot = vector3(90.0, 180.0, 21.0)},
            second = {coords = vector3(312.90, -284.95, 54.285), rot = vector3(90.0, 180.0, 110.0)}
        },
        trolley1 = {x = 313.45, y = -289.24, z = 53.14, h = -15},
        trolley2 = {x = 311.51, y = -288.54, z = 53.14, h = -15},
        trolley3 = {x = 314.49, y = -283.65, z = 53.14, h = 160},
        objects = {
            vector3(313.45, -289.24, 53.14),
            vector3(311.51, -288.54, 53.14),
            vector3(314.49, -283.65, 53.14)
        },
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F2 = {
        doors = {
            startloc = {x = 146.61, y = -1046.02, z = 29.37, h = 244.20, animcoords = {x = 146.75, y = -1045.60, z = 28.37, h = 244.20}},
            secondloc = {x = 148.76, y = -1045.89, z = 29.37, h = 158.54, animcoords = {x = 149.10, y = -1046.08, z = 28.37, h = 158.54}}
        },
        prop = {
            first = {coords = vector3(147.22, -1046.148, 29.487), rot = vector3(90.0, 180.0, 20.0)},
            second = {coords = vector3(148.57, -1046.578, 29.487), rot = vector3(90.0, 180.0, 110.0)}
        },
        trolley1 = {x = 147.25, y = -1050.38, z = 28.35, h = -15},
        trolley2 = {x = 149.21, y = -1051.07, z = 28.35, h = -15},
        trolley3 = {x = 150.23, y = -1045.40, z = 28.35, h = 160},
        objects = {
            vector3(147.25, -1050.38, 28.35),
            vector3(149.21, -1051.07, 28.35),
            vector3(150.23, -1045.40, 28.35)
        },
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F3 = {
        doors = {
            startloc = {x = -1211.07, y = -336.68, z = 37.78, h = 296.76, animcoords = {x = -1211.25, y = -336.37, z = 36.78, h = 296.76}}, 
            secondloc = {x = -1209.66, y = -335.15, z = 37.78, h = 213.67, animcoords = {x = -1209.40, y = -335.05, z = 36.78, h = 213.67}}
        },
        prop = {
            first = {coords = vector3(-1210.50, -336.37, 37.901), rot = vector3(-90.0, 0.0, 25.0)},
            second = {coords = vector3(-1209.27, -335.68, 37.90), rot = vector3(90.0, 180.0, 65.0)}
        },
        trolley1 = {x = -1207.50, y = -339.20, z = 36.76, h = 30},
        trolley2 = {x = -1205.61, y = -338.24, z = 36.76, h = 30},
        trolley3 = {x = -1209.10, y = -333.59, z = 36.76, h = 210},
        objects = {
            vector3(-1207.50, -339.20, 36.76),
            vector3(-1205.61, -338.24, 36.76),
            vector3(-1209.10, -333.59, 36.76)
        },
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F4 = {
        hash = 4231427725, -- exception
        doors = {
            startloc = {x = -2956.68, y = 481.34, z = 15.70, h = 353.97, animcoords = {x = -2956.68, y = 481.34, z = 14.70, h = 353.97}},
            secondloc = {x = -2957.26, y = 483.53, z = 15.70, h = 267.73, animcoords = {x = -2957.26, y = 483.53, z = 14.70, h = 267.73}}
        },
        prop = {
            first = {coords = vector3(-2956.59, 482.05, 15.815), rot = vector3(90.0, 180.0, -88.0)},
            second = {coords = vector3(-2956.60, 483.46, 15.815), rot = vector3(90.0, 180.0, 3.0)}
        },
        trolley1 = {x = -2952.69, y = 483.34, z = 14.68, h = 85},
        trolley2 = {x = -2952.57, y = 485.18, z = 14.68, h = 85},
        trolley3 = {x = -2958.35, y = 484.69, z = 14.68, h = 270},
        objects = {
            vector3(-2952.69, 483.34, 14.68),
            vector3(-2952.57, 485.18, 14.68),
            vector3(-2958.35, 484.69, 14.68)
        },
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F5 = {
        doors = {
            startloc = {x = -354.15, y = -55.11, z = 49.04, h = 251.05, animcoords = {x = -354.15, y = -55.11, z = 48.04, h = 251.05}},
            secondloc = {x = -351.97, y = -55.18, z = 49.04, h = 159.79, animcoords = {x = -351.97, y = -55.18, z = 48.04, h = 159.79}}
        },
        prop = {
            first = {coords = vector3(-353.50, -55.37, 49.157), rot = vector3(90.0, 180.0, 20.0)},
            second = {coords = vector3(-352.15, -55.77, 49.157), rot = vector3(90.0, 180.0, 110.0)}
        },
        trolley1 = {x = -353.34, y = -59.48, z = 48.01, h = -15},
        trolley2 = {x = -351.57, y = -60.09, z = 48.01, h = -15},
        trolley3 = {x = -350.57, y = -54.45, z = 48.01, h = 160},
        objects = {
            vector3(-353.34, -59.48, 48.01),
            vector3(-351.57, -60.09, 48.01),
            vector3(-350.57, -54.45, 48.01)
        },
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F6 = {
        doors = {
            startloc = {x = 1176.40, y = 2712.75, z = 38.09, h = 84.83, animcoords = {x = 1176.40, y = 2712.75, z = 37.09, h = 84.83}},
            secondloc = {x = 1174.24, y = 2712.47, z = 38.09, h = 359.05, animcoords = {x = 1174.33, y = 2712.09, z = 37.09, h = 359.05}}
        },
        prop = {
            first = {coords = vector3(1175.70, 2712.82, 38.207), rot = vector3(90.0, 180.0, 180.0)},
            second = {coords = vector3(1174.267, 2712.736, 38.207), rot = vector3(90.0, 180.0, -90.0)}
        },
        trolley1 = {x = 1174.24, y = 2716.69, z = 37.07, h = -180},
        trolley2 = {x = 1172.27, y = 2716.67, z = 37.07, h = -180},
        trolley3 = {x = 1173.23, y = 2711.02, z = 37.07, h = 0},
        objects = {
            vector3(1174.24, 2716.69, 37.07),
            vector3(1172.27, 2716.67, 37.07),
            vector3(1173.23, 2711.02, 37.07)
        },
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    }
}

Config.debug = false


Config.title = "Annonce :"
Config.placeholder = "Passez votre annonce"