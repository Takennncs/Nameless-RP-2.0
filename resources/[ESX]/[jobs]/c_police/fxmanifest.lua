fx_version 'adamant'
games { 'gta5' };

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	--'duty/sv_main.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'client/alerte.lua',
	'client/radar.lua',
	'duty/cl_main.lua',
	'client/main.lua'
}
