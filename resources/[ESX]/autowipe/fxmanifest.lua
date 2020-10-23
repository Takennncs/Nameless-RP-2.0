fx_version 'adamant'
 game 'gta5' 
 
 server_script "@mysql-async/lib/MySQL.lua"

 client_scripts { 'requires/framework.lua', 'cl_admin.lua' } 
 
 server_scripts { 

     'sv_admin.lua',
    } 