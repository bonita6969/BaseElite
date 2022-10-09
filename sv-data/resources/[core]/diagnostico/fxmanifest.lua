fx_version 'bodacious'
game 'gta5'

client_scripts {
	'@vrp/lib/utils.lua',
	"hospital.lua",
	'hospital/client.lua',
	'diagnostico/client.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	"hospital.lua",
	'hospital/server.lua',
	'diagnostico/server.lua'
}