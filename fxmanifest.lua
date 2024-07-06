fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'tbrp-companions'
version '1.0.1'

shared_scripts {
    '@ox_lib/init.lua',
    '@rsg-core/shared/locale.lua',
    'locales/en.lua', -- Change to your language
    'config.lua',
}

client_scripts {
    'client/client.lua',
    'config.lua',
	'client/npcs.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server/*.lua',
}

dependencies {
    'rsg-core',
    'rsg-target',
    'ox_lib'
}

lua54 'yes'
