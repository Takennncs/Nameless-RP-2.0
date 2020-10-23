fx_version 'adamant'
games { 'gta5' };

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'@es_extended/locales/fr.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'@es_extended/locales/fr.lua',
	'dependencies/menu.lua',
	'config.lua',
	'client/client_avocat.lua',
	'client/client_mcgill.lua',
	'client/client_vigneron.lua',
	'client/client_bugstars.lua',
	'client/client_ltd.lua',
	'client/client_unicorn.lua'
}
