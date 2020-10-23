fx_version 'adamant'
game 'gta5'

client_scripts {
	'@es_extended/locale.lua',
	"@NativeUI/NativeUI.lua",
	'locales/fr.lua',
	'config.lua',
	'cl_accessories.lua',
	'cl_clothes.lua',
	'cl_tatoo.lua',
	'list_tatoo.lua',
	'cl_barber.lua',
	--'cl_cardealer.lua',
	--'utils_cardealer.lua',
	'cl_skin.lua',
	'cl_skinchanger.lua',
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/fr.lua',
	'config.lua',
	'sv_tatoo.lua',
	'sv_accessories.lua',
	'sv_clothes.lua',
	'sv_barber.lua',
	--'sv_cardealer.lua',
	'sv_skin.lua',
}