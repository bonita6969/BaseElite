client_script "lib/lib.lua"

fx_version 'adamant'
game 'gta5'

ui_page 'gui/index.html'

server_scripts {
	'@elitestore/webhooks.lua',
	'@elite_inventorys/config-side/cars.lua',
	'@elite_inventorys/config-side/items.lua',
}

client_scripts {
	'@elite_inventorys/config-side/cars.lua',
	'@elite_inventorys/config-side/items.lua',
}

server_scripts {
	'lib/utils.lua',
	'cfg/groups.lua',
	'cfg/blips.lua',
	'base.lua',
	'queue.lua',
	'modules/gui.lua',
	'modules/player_state.lua',
	'modules/map.lua',
	'modules/money.lua',
	'modules/inventory.lua',
	'modules/identity.lua',
	'modules/aptitude.lua',
	'modules/basic_items.lua',
	'modules/basic_skinshop.lua',
	'modules/group.lua',
	'modules/survival.lua'
}

client_scripts {
	'lib/utils.lua',
	'client/base.lua',
	'client/objects.lua',
	'client/basic_garage.lua',
	'client/iplloader.lua',
	'client/gui.lua',
	'client/player_state.lua',
	'client/survival.lua',
	'client/map.lua',
	'client/identity.lua',
	'client/police.lua'
}

files {
	"loading/index.html",
	"loading/css/main.css",
	-- imagens --
	"loading/img/person-male.png",
	"loading/img/cursor.png",
	-- javascript --
	"loading/js/music-controls.js",
	"loading/js/music-handler.js",
	"loading/js/main.js",
	"loading/js/config.js",
	"loading/js/synn.js",
	"loading/js/progressbar-renderer.js",


	'lib/Tunnel.lua',
	'lib/Proxy.lua',
	'lib/Luaseq.lua',
	'lib/Tools.lua',
	'gui/index.html',
	'gui/design.css',
	'gui/main.js',
	'gui/Menu.js',
	'gui/WPrompt.js',
	'gui/RequestManager.js',
	'gui/Div.js',
	'gui/dynamic_classes.js',
	'gui/bebas.ttf',
}

loadscreen "loading/index.html"

server_export 'AddPriority'
server_export 'RemovePriority'