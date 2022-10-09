fx_version "bodacious"
game "gta5" 

author 'ELITE STORE'
description 'ELITE KILL LOGGER'
version 'v3.9'
contact 'Discord: DosSantos#2208'



ui_page "nui/index.html"

server_scripts {
	'@elitestore/webhooks.lua'
}

client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua"
}

files {
	"config.lua",
}

                            