fx_version 'adamant'
game 'gta5'

server_scripts {
	'webhooks.lua',
	'cargos.lua'
}

client_scripts {
	'@vrp/lib/utils.lua',
	'client/*.lua',
	'doors.lua',
	'client/cfg_rotas_policiais.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server/*.lua',
	'client/cfg_rotas_policiais.lua'
}

ui_page {
	"uinotify/index.html"
	
}    
export "isPed"
export "getUserCid"                            

files {
	"uinotify/images/adm.svg",
	"uinotify/images/alert.svg",
	"uinotify/images/alert.svg",
	"uinotify/images/hospital.svg",
	"uinotify/images/localizacao.svg",
	"uinotify/images/mecanico.svg",
	"uinotify/images/negado.svg",
	"uinotify/images/policia.svg",
	"uinotify/images/sucesso.svg",
	"uinotify/app.js",
	"uinotify/index.html",
	"uinotify/style.css",
	"uinotify/js/app.js",
	"uinotify/js/iziToast.min.js",
	"uinotify/index.html",
	"uinotify/css/iziToast.css",
	"uinotify/css/style.css",
	'audio/sfx/resident/explosions.awc',
	'audio/sfx/resident/vehicles.awc',
	'audio/sfx/resident/weapons.awc',
	'audio/sfx/weapons_player/lmg_combat.awc',
	'audio/sfx/weapons_player/lmg_mg_player.awc',
	'audio/sfx/weapons_player/mgn_sml_am83_vera.awc',
	'audio/sfx/weapons_player/mgn_sml_am83_verb.awc',
	'audio/sfx/weapons_player/mgn_sml_sc__l.awc',
	'audio/sfx/weapons_player/ptl_50cal.awc',
	'audio/sfx/weapons_player/ptl_combat.awc',
	'audio/sfx/weapons_player/ptl_pistol.awc',
	'audio/sfx/weapons_player/ptl_px4.awc',
	'audio/sfx/weapons_player/ptl_rubber.awc',
	'audio/sfx/weapons_player/sht_bullpup.awc',
	'audio/sfx/weapons_player/sht_pump.awc',
	'audio/sfx/weapons_player/smg_micro.awc',
	'audio/sfx/weapons_player/smg_smg.awc',
	'audio/sfx/weapons_player/snp_heavy.awc',
	'audio/sfx/weapons_player/snp_rifle.awc',
	'audio/sfx/weapons_player/spl_grenade_player.awc',
	'audio/sfx/weapons_player/spl_minigun_player.awc',
	'audio/sfx/weapons_player/spl_prog_ar_player.awc',
	'audio/sfx/weapons_player/spl_railgun.awc',
	'audio/sfx/weapons_player/spl_rpg_player.awc',
	'audio/sfx/weapons_player/spl_tank_player.awc'
}

  data_file 'AUDIO_WAVEPACK' 'audio/sfx/resident'
  data_file 'AUDIO_WAVEPACK' 'audio/sfx/weapons_player'
  