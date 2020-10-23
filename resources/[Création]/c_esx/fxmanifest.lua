fx_version 'adamant'
games { 'gta5' };

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'locales/fr.lua',
    "server/*.lua",
    "config.lua",
    --'sv_esx.lua',
}

client_scripts {
    '@es_extended/locale.lua',
    'locales/fr.lua',
    "client/*.lua",
    "config.lua",
--[[     "cl_controlcar.lua",
    "cl_seat.lua",
    "cl_bmx.lua",
    "esx_shit.lua",
    "cl_extra.lua",
    "cl_antispawn.lua",
    "cl_narshop.lua",
    "cl_useitem.lua",
    "cl_ammo.lua", ]]
}


