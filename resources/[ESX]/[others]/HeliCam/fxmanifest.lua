fx_version 'bodacious'
games {'gta5'}

author 'David Wheatley'
description 'FiveM Helicopter Camera by davwheat and mraes'
version '3.0.0'

client_script 'heli_client.lua'
server_script 'heli_server.lua'

files {'custom_ui.html', 'ui.css', 'noise.png'}

ui_page 'custom_ui.html'


dependencys {
	'c_esx',
	'c_pmenu',
	'c_divers',
	'c_illegal',
	'c_menu',
    'c_ui',
    'c_shops',
    'c_gang',
    'c_inventaire'
}