fx_version "bodacious"
game "gta5" 

author 'Elite Store'
description 'Elite Resource'
version 'v3.4'

ui_page_preload "yes"
ui_page "nui/index.html"
-----------------------------------------
client_scripts {
	'config-side/cars.lua',
	'config-side/items.lua',
	'config-side/chest.lua',
	'config-side/shops.lua',
	'config-side/rotas.lua',
	'config-side/drogas.lua',
	'config-side/crafting.lua',
	
}

server_scripts {
	'config-side/cars.lua',
	'config-side/items.lua',
	'config-side/chest.lua',
	'config-side/rotas.lua',
	'config-side/homes.lua',
	'config-side/shops.lua',
	'config-side/rotas.lua',
	'config-side/drogas.lua',
	'config-side/crafting.lua',
	'config-side/config_geral.lua',
}
---------------------------------------------------------------
client_scripts {
	'@vrp/lib/utils.lua',
	'client-side/*'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server-side/*'
}

files {
	"nui/*",
	"nui/**/*"
}  