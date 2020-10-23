fx_version 'adamant'
games { 'gta5' };

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',

    'locales/fr.lua',

    'sv_clippy.lua',

    "config.lua",

}

client_scripts {
    '@es_extended/locale.lua',
    "pmenu.lua",

    "config.lua",

    'locales/fr.lua',


    "cl_menuf5.lua",

    "cl_shops.lua",

    "cl_vehmenu.lua",

    "cl_3dme.lua",
    "cl_npc.lua",
    "cl_charcreator.lua",
    "cl_menuadmin.lua",
    "cl_discord.lua"
}

files {
    'html/ui.html',
    'html/img/image.png',
    'html/css/app.css',
    'html/scripts/app.js'
}

ui_page 'html/ui.html'
