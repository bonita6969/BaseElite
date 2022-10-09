fx_version "bodacious"
game "gta5" 

author 'Elite Store'
description 'Elite Homes'
version 'v1.3'

ui_page_preload "yes"

ui_page "nui/index.html"

server_scripts {
	"elitestore/webhooks.lua"
}

client_scripts {
	'@vrp/lib/utils.lua',
	'homes_sem_sessao/cl.homes.lua',
	'homes_sem_sessao/homes.lua',
	'client.lua',
	'config.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'homes_sem_sessao/sv.homes.lua',
	'homes_sem_sessao/homes.lua',
	'server.lua',
	'config.lua'
}

files {
	"nui/*"
}              