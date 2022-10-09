fx_version "bodacious"
game "gta5" 

author 'ELITE STORE'
description 'ELITE INVENTORY'
version 'v2.5'
contact 'Discord: DosSantos#2208'


ui_page_preload "yes"
ui_page "nui/index.html"


server_scripts {
	'@elite_inventorys/config-side/config_geral.lua'
}
---------------------------------------------------------------
client_scripts {
	'@vrp/lib/utils.lua',
	'main/client.lua',
	'cl_config.lua',
	"config-side.lua"
}

server_scripts {
	'@vrp/lib/utils.lua',
	'main/server.lua',
	'sv_config.lua',
    "config-side.lua"
}

files {
	"nui/*",
	"nui/**/*"
}  