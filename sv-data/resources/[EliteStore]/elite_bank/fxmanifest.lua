

fx_version 'bodacious'
game 'gta5' 

version '1.0.0'

ui_page 'nui/ui.html'
ui_page_preload 'yes'

server_scripts {'@elitestore/webhooks.lua'}

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
    'nui/*',
    'nui/ui.js',
    'nui/img/*',
    'nui/img/*.svg',
    'nui/img/*.png',
}              