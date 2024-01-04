fx_version "cerulean"
game "gta5"

description "Core for RolePlay."
author "JellyPh1sh"
version "1.0"

client_scripts {
    "client/*.lua"
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "server/*.lua"
}

shared_scripts {
    "config.lua",
    "lang/*.lua"
}