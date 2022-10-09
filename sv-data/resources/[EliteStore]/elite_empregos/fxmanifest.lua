fx_version "bodacious"
game "gta5" 

author 'ELITE STORE'
description 'ELITE EMPREGOS'
version 'v1.3'
contact 'Discord: DosSantos#2208'



---[ CONFIGS FILES ]----------------------------------------------------------------

server_scripts {
	'@vrp/lib/utils.lua',
	'config-side/jobs_payment.lua',
	'config-side/driver.lua',
	'config-side/farmer.lua',
	'config-side/farmer_d.lua',
	'config-side/lumberjack.lua',
	'config-side/lumberjack_d.lua',
	'config-side/milkman.lua',
	'config-side/milkman_d.lua',
	'config-side/miner.lua',
	'config-side/postman.lua',
	'config-side/postman_d.lua',
	'config-side/taxista.lua',
	'config-side/ifood.lua',
	'config-side/webhook.lua'
}

client_scripts {
	'@vrp/lib/utils.lua',
	'config-side/driver.lua',
	'config-side/farmer.lua',
	'config-side/farmer_d.lua',
	'config-side/lumberjack.lua',
	'config-side/lumberjack_d.lua',
	'config-side/milkman.lua',
	'config-side/milkman_d.lua',
	'config-side/miner.lua',
	'config-side/postman.lua',
	'config-side/postman_d.lua',
	'config-side/taxista.lua',
	'config-side/ifood.lua'
}
---[ CARTEIRO ]----------------------------------------------------------------

client_scripts {'postman/client.lua'}

server_scripts {'postman/server.lua'}

---[ CARTEIRO ENTREGAS ]----------------------------------------------------------------

client_scripts {'postman-delivery/client.lua'}

server_scripts {'postman-delivery/server.lua'}

---[ LEIREITO ]----------------------------------------------------------------

client_scripts {'milkman/client.lua'}

server_scripts {'milkman/server.lua'}

---[ LEITEIRO ENTREGAS ]----------------------------------------------------------------

client_scripts {'milkman-delivery/client.lua'}

server_scripts {'milkman-delivery/server.lua'}
---[ ifood ]-----------------------------------------------------------------

client_scripts {'ifood/client.lua'}

server_scripts {'ifood/server.lua'}

---[ MINERADOR ]-----------------------------------------------------------------

client_scripts {'miner/client.lua'}

server_scripts {'miner/server.lua'}

---[ MOTORISTA ]-------------------------------------------------------------

client_scripts {'driver/client.lua'}

server_scripts {'driver/server.lua'}

---[ LENHADOR ]-------------------------------------------------------------

client_scripts {'lumberjack/client.lua'}

server_scripts {'lumberjack/server.lua'}

---[ LENHADOR ENTREGAS ]-------------------------------------------------------------

client_scripts {'lumberjack-delivery/client.lua'}

server_scripts {'lumberjack-delivery/server.lua'}

---[ LIXEIRO ]-------------------------------------------------------------

client_scripts {'garbageman/client.lua'}

server_scripts {'garbageman/server.lua'}

---[ FAZENDEIRO ]-------------------------------------------------------------

client_scripts {'farmer/client.lua'}

server_scripts {'farmer/server.lua'}
---[ DESMANCHE ]-------------------------------------------------------------

client_scripts {'desmanche/client.lua'}

server_scripts {'desmanche/server.lua'}
---[ DROGAS ]-------------------------------------------------------------

client_scripts {'drogas/client.lua'}

server_scripts {'drogas/server.lua'}

---[ FAZENDEIRO ENTREGAS ]----------------------------------------------------------------

client_scripts {'farmer-delivery/client.lua'}

server_scripts {'farmer-delivery/server.lua'}

---[ PESCADOR ]-------------------------------------------------------------

client_scripts {'pescador/client.lua'}

server_scripts {'pescador/server.lua'}
---[ TAXISTA ]-------------------------------------------------------------

ui_page 'taxista/html/ui.html'

client_scripts {'taxista/client.lua'}

server_scripts {'taxista/server.lua'}           
 
files {
	'taxista/html/ui.html',
	'taxista/html/taximeter.ttf',
	'taxista/html/cursor.png',
	'taxista/html/styles.css',
	'taxista/html/scripts.js',
	'taxista/html/debounce.min.js'
}                            