fx_version 'adamant'
games { 'gta5' };

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    "sv_bra.lua",
    "sv_drugs.lua",
    "config.lua"
}

client_scripts {
	'@es_extended/locale.lua',
    "config.lua",
    "cl_drugconvert.lua",
    "cl_drugeffects.lua",
    "cl_drugmissions.lua",
    "cl_drugsale.lua",
    "cl_drugsfarm.lua",
    "cl_brinks.lua",
    "cl_gofast.lua"
}
