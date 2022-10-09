fx_version "bodacious"
game "gta5" 

author 'ELITE STORE'
description 'ELITE GARAGES'
version 'v1.0'
contact 'Discord: DosSantos#2208'

ui_page 'nui/index.html'

server_scripts {
	'@elitestore/webhooks.lua',
}

client_scripts {
	'@vrp/lib/utils.lua',
	'client.lua',
	'config.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server.lua',
	'config.lua'
}

files {
	'nui/index.html',
	'nui/jquery.js',
	'nui/style.css'
}