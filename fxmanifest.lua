fx_version 'cerulean'
game 'gta5'

author 'Exytra'
description 'Interactions Library'
version '1.0.0'

-- Define client scripts
client_scripts {
	'client/*.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

shared_scripts {
	'@qb-core/shared/locale.lua',
	'locales/en.lua',
	'locales/*.lua'
}

-- Define dependencies (assuming you need QBCore and rpemotes)
dependencies {
    'qb-core',
    'rpemotes',
    'oxmysql'
}

-- Ensure the resource starts with the client script
lua54 'yes'
