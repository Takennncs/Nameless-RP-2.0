fx_version 'adamant'
games { 'gta5' };

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'sv_MenuF5.lua'
}

client_scripts {
    'dependencies/menu.lua',
	'cl_MenuF5.lua'
}
