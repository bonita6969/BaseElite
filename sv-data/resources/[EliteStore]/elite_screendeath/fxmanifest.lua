fx_version "bodacious"
game "gta5" 

author 'ELITE STORE'
description 'ELITE SCREENDEATH'
version 'v1.1'
contact 'Discord: DosSantos#2208'

server_scripts {
	'@elitestore/webhooks.lua'
}

client_script {
	"@vrp/lib/utils.lua",
	"client.lua",
	"config.lua"
}

server_script {
	"@vrp/lib/utils.lua",
	"server.lua",	
	"config.lua"
}


ui_page 'nui/ui.html'

files {
	'nui/**',
	"images/*"
}