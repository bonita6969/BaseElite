fx_version 'bodacious'
game 'gta5'

ui_page 'ui/ui.html'

files {
	'ui/*',
	'ui/img/*',
	'ui/fonts/*'
}

client_scripts {
	'@vrp/lib/utils.lua',
	'client.lua',
	'client2.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server.lua'
}

