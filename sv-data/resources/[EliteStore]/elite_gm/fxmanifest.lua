

 

fx_version 'adamant'
game 'gta5'

ui_page "nui/index.html"


server_scripts {
    '@vrp/lib/utils.lua',
    'server.lua',
    'config.lua'
}

client_scripts {
    '@vrp/lib/utils.lua',
    'client.lua'
}

files {
    "nui/images/background.png",
	"nui/index.html",
	"nui/index.js",
	"nui/style.css"
}
                                          