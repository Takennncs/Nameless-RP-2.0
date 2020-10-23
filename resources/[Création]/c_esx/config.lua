config = {}
Config = {}
config.Vehicles = {
  'police',
  'newvic',
  '11caprice',
  'lspd1',
  'lspd2',
  'lspd3',
  'fbi3',
  '1200RTP',
  '16explorer',
  '16taurus',
  '18charger',
  '19durango',
  'pitbull',
  'so3',
  'so2',
  'so4',
  'so1',
  'so5',
  'so13',
  'police2',
  'police3',
  'police4',
  'fbi',
  'fbi2',
  'riot2',
  'policet',
  'sheriff',
  'sheriff2',
  'riot',
  'pranger',
  'polschafter3',
  'lapd',
  'lapd2',
  'lapd3',
  'lapd4',
  'lapd5',
  'lapd6',
  '14charger',
  'newvic',
  '16explorer',
  'county12',
  'county13',
  'county2',
  'county17',
  'sp1',
  'sp7',
  'sp9',
  'sp11',
  'sp21',
  '16explorer',
  '19suburban',
  '14charger',
  '18charger',
}

Config.Timer = 1

-- Set if show alert when player use gun

-- Set if show when player do carjacking
Config.CarJackingAlert = false

-- In seconds
Config.BlipJackingTime = 20

-- Blip radius, in float value!
Config.BlipJackingRadius = 50.0

-- Show notification when cops steal too?
Config.ShowCopsMisbehave = false

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


Config.EnableInventoryHUD = false
Config.ReloadTime = 1000 --ms

Config.Ammo = {
    {
        name = 'disc_ammo_pistol',
        weapons = {
            `WEAPON_PISTOL`,
            `WEAPON_SNSPISTOL`,
            `WEAPON_REVOLVER`,
            `WEAPON_FLAREGUN`,
            `WEAPON_FIREWORK`,
            `WEAPON_VINTAGEPISTOL`
        },
        count = 2
    },
    {
        name = 'flare',
        weapons = {
            `WEAPON_FLAREGUN`
        },
        count = 2
    },
    {
        name = 'disc_ammo_pistol_large',
        weapons = {
            `WEAPON_APPISTOL`,
            `WEAPON_COMBATPISTOL`,
            `WEAPON_HEAVYPISTOL`,
            `WEAPON_MARKSMANPISTOL`,
            `WEAPON_PISTOL50`,
            `WEAPON_MICROSMG`,
            `WEAPON_MINISMG`,
            `WEAPON_MACHINEPISTOL`
        },
        count = 2
    },
	{
        name = 'disc_ammo_shotgun',
        weapons = {
	    `WEAPON_DBSHOTGUN`,
        `WEAPON_HEAVYSHOTGUN`,
        `WEAPON_PUMPSHOTGUN`,
        `WEAPON_SAWNOFFSHOTGUN`,
        `WEAPON_ASSAULTSHOTGUN`,
	    `WEAPON_AUTOSHOTGUN`,
        `WEAPON_BULLPUPSHOTGUN`
        },
        count = 2
    },
	{
        name = 'disc_ammo_shotgun_large',
        weapons = {
        `WEAPON_DBSHOTGUN`,
        `WEAPON_HEAVYSHOTGUN`,
        `WEAPON_PUMPSHOTGUN`,
        `WEAPON_SAWNOFFSHOTGUN`,
        `WEAPON_ASSAULTSHOTGUN`,
	    `WEAPON_AUTOSHOTGUN`,
        `WEAPON_BULLPUPSHOTGUN`
        },
        count = 2
    },
	{
        name = 'disc_ammo_smg',
        weapons = {
            `WEAPON_ASSAULTSMG`,
            `WEAPON_COMBATPDW`,
            `WEAPON_SMG`
        },
        count = 2
    },
	{
        name = 'disc_ammo_smg_large',
        weapons = {
            `WEAPON_ASSAULTSMG`,
        },
        count = 2
    },
	{
        name = 'disc_ammo_rifle',
        weapons = {
            `WEAPON_MUSKET`,
            `WEAPON_ADVANCEDRIFLE`,
            `WEAPON_BULLPUPRIFLE`,
            `WEAPON_CARBINERIFLE`
        },
        count = 2
    },
	{
        name = 'disc_ammo_rifle_large',
        weapons = {
        `WEAPON_ASSAULTRIFLE`,
        `WEAPON_COMPACTRIFLE`,
        `WEAPON_MG`,
        `WEAPON_COMBATMG`,
        `WEAPON_GUSENBERG`,
	    `WEAPON_SPECIALCARBINE`
        },
        count = 2
    },
	{
        name = 'disc_ammo_snp',
        weapons = {
        `WEAPON_SNIPERRIFLE`,
        `WEAPON_HEAVYSNIPER`,
        `WEAPON_MARKSMANRIFLE`
        },
        count = 2
    },
	{
        name = 'disc_ammo_snp_large',
        weapons = {
        `WEAPON_SNIPERRIFLE`,
        `WEAPON_HEAVYSNIPER`,
        `WEAPON_MARKSMANRIFLE`
        },
        count = 2
    }
}

Config.Zones = {
	posfarm =   {x = 1509.76,  y = 1791.24,  z = 108.92,		sprite = 501,	color = 40},
	posfarm2 =	{x = -6.28,  y = 6486.84,  z = 31.48,	sprite = 478,	color = 40}
}