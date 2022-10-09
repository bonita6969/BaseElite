fx_version "bodacious"
game "gta5" 

author 'ELITE STORE'
description 'ELITE FUEL'
version 'v1.0'
contact 'Discord: DosSantos#2208'

ui_page 'nui/ui.html'

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua",
	"config.lua"
}
client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua",
	"config.lua"
}
files {
  'nui/ui.html',
  'nui/ui.css', 
  'nui/ui.js'
}