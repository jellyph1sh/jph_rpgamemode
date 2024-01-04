fx_version "cerulean"
game "gta5"

description "Core for RolePlay."
author "JellyPh1sh"
version "1.0"

client_scripts {
    "client/cl_functions.lua",
    "client/cl_events.lua",
    "client/cl_main.lua"
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "server/sv_functions.lua",
    "server/sv_events.lua",
    "server/sv_commands.lua",
    "server/sv_main.lua"
}

shared_scripts {
    "config.lua",
    "lang/*.lua"
}