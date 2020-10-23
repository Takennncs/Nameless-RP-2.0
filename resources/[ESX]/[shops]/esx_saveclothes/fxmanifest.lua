fx_version 'adamant'
games { 'gta5' };

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'server/*.lua',
    'config.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'client/*.lua',
    'config.lua',
    'fr.lua'
}


