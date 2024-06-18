
fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

games {"rdr3"}


ConvarFramework = "rsg"


client_scripts {
    'client/warmenu.lua',
    'client/client.lua',
    'config.lua',
	'client/npcs.lua',
}

shared_scripts {
    '@rsg-core/shared/locale.lua',
    'locales/en.lua', -- Change to your language
    'config.lua',
}

server_scripts {
    'config.lua',
    'server/server.lua',
	'@oxmysql/lib/MySQL.lua',
}

dependencies {
    'rsg-core',
    'ox_lib'
}