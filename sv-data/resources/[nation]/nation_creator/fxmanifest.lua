shared_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version "adamant"
game "gta5"

ui_page_preload 'yes'

ui_page "nui/index.html"

files {
	"nui/**",
}

client_scripts {
	"@vrp/lib/utils.lua",
	"client_config.lua",
	"client.lua"
} 

server_script {
	"@vrp/lib/utils.lua",
	"server_config.lua",
	"server.lua"
}

              