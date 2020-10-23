fx_version 'adamant'
games { 'gta5' };

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/app.js',
    'html/style.css',
    'html/styles.css',
    'html/index.html',
    'html/main.js',
    'img/mic.png'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
    '@async/async.lua',
    "config.lua",

    "server/*.lua",
}

client_scripts {
    '@es_extended/locale.lua',
    '@NativeUI/NativeUI.lua',
    "config.lua",

    "client/*.lua",
}

files {
    'vehicles.meta',
    'carvariations.meta',
    'handling.meta',
}

data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'HANDLING_FILE' 'handling.meta'