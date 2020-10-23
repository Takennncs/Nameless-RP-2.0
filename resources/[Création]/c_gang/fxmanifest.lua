fx_version 'adamant'
game 'gta5'

client_scripts {
	'@es_extended/locale.lua',
	'cl_gang.lua',
	'cl_teleports.lua',
	'cl_peds.lua',
	'config.lua',
	'locales/fr.lua',
	'cl_fouille.lua',
	'cl_antigundrop.lua',
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/fr.lua',
	'sv_gang.lua',
	'config.lua',
	'sv_fouille.lua'
}
