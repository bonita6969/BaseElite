local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

config = {}
Proxy.addInterface("nation_garages", config)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG
-----------------------------------------------------------------------------------------------------------------------------------------
config.client_vehicle = false
config.detido = 20 -- taxa para ser paga quando o veiculo for detido (porcentagem do valor do veiculo)
config.seguradora = 10 -- taxa para ser paga quando o veiculo estiver apreendido (porcentagem do valor do veiculo)
config.ipva = 1 -- taxa para ser paga quando o veiculo estiver com o ipva atrasado (porcentagem do valor do veiculo)
config.use_tryFullPayment = true -- quando true, aceita pagamentos de taxas com o dinheiro do banco
config.dv_permission = {"admin.permissao","mod.permissao","suporte.permissao"} -- permissao para dv
config.guardar_veiculo_proximo = true -- mostrar botão de guardar veículo próximo
config.server_side_check = true -- checa se o veículo já foi retirado da garagem pelo player via server-side (o player não conseguirá retirar o veículo até guardá-lo novamente / DV)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGEM DAS CASAS
-----------------------------------------------------------------------------------------------------------------------------------------
config.homeGarages = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- MARKERS
-----------------------------------------------------------------------------------------------------------------------------------------
config.markers = {
	["avião"] = 33,
	["helicóptero"] = 34,
	["barco"] = 35,
	["carro"] = 36,
	["moto"] = 37,
	["bicicleta"] = 38,
	["truck"] = 39,
} 

config.vehList = {
----------------------------------------------
----------- THE DIAMOND CASSINO --------------
----------------------------------------------
	--[COMPACTS]--
	{ hash = 1118611807, name = 'asbo', price = 1000, banido = false, modelo = 'asbo', capacidade = 0, tipo = 'work' },
	{ hash = 409049982, name = 'kanjo', price = 1000, banido = false, modelo = 'kanjo', capacidade = 0, tipo = 'work' },
	--[MUSCLE]--
	{ hash = 1693751655, name = 'yosemite2', price = 1000, banido = false, modelo = 'yosemite2', capacidade = 0, tipo = 'work' },
	--[OFF-ROAD]--
	{ hash = -1349095620, name = 'caracara2', price = 1000, banido = false, modelo = 'caracara2', capacidade = 0, tipo = 'work' },
	{ hash = -1756021720, name = 'everon', price = 1000, banido = false, modelo = 'everon', capacidade = 0, tipo = 'work' },
	--[SUVS]--
	{ hash = 83136452, name = 'rebla', price = 1000, banido = false, modelo = 'rebla', capacidade = 0, tipo = 'work' },
	--[SPORTS]--
	{ hash = -834353991, name = 'komoda', price = 1000, banido = false, modelo = 'komoda', capacidade = 0, tipo = 'work' },
	{ hash = -1132721664, name = 'imorgon', price = 1000, banido = false, modelo = 'imorgon', capacidade = 0, tipo = 'work' },
	{ hash = 1456336509, name = 'vstr', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	--[NEWS]--
	{ hash = -324618589, name = 's80', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = -447711397, name = 'paragon', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = 1416466158, name = 'paragon2', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = 686471183, name = 'drafter', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = 1044193113, name = 'thrax', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = 1854776567, name = 'issi7', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = -1620126302, name = 'neo', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = 722226637, name = 'gauntlet3', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = 1934384720, name = 'gauntlet4', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = 1323778901, name = 'emerus', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = -882629065, name = 'nebula', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = -941272559, name = 'locust', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = 310284501, name = 'dynasty', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = -362150785, name = 'hellion', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = -208911803, name = 'jugular', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = -664141241, name = 'krieger', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = -1829436850, name = 'novak', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = -1804415708, name = 'peyote2', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = 916547552, name = 'rrocket', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = 1862507111, name = 'zion3', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },
	{ hash = -682108547, name = 'zorrusso', price = 1000, banido = false, modelo = 'vstr', capacidade = 0, tipo = 'work' },

----------------------------------------------
----------- CAYO PERICO ----------------------
----------------------------------------------
	--[BOATS]--
	{ hash = -1706603682, name = 'avisa', price = 1000, banido = false, modelo = 'avisa', capacidade = 0, tipo = 'work' },
	{ hash = -980573366, name = 'dinghy5', price = 1000, banido = false, modelo = 'dinghy5', capacidade = 0, tipo = 'work' },
	{ hash = 1336872304, name = 'kosatka', price = 1000, banido = false, modelo = 'kosatka', capacidade = 0, tipo = 'work' },
	{ hash = 1861786828, name = 'longfin', price = 1000, banido = false, modelo = 'longfin', capacidade = 0, tipo = 'work' },
	{ hash = -276744698, name = 'patrolboat', price = 1000, banido = false, modelo = 'patrolboat', capacidade = 0, tipo = 'work' },
	--[COMPACTS]--
	{ hash = 1429622905, name = 'brioso2', price = 1000, banido = false, modelo = 'brioso2', capacidade = 0, tipo = 'work' },
	{ hash = 1644055914, name = 'weevil', price = 1000, banido = false, modelo = 'weevil', capacidade = 0, tipo = 'work' },
	--[HELICOPTERS]--
	{ hash = 295054921, name = 'annihilator2', price = 1000, banido = false, modelo = 'annihilator2', capacidade = 0, tipo = 'importair' },
	{ hash = 1229411063, name = 'seasparrow2', price = 1000, banido = false, modelo = 'seasparrow2', capacidade = 0, tipo = 'importair' },
	{ hash = 1593933419, name = 'seasparrow3', price = 1000, banido = false, modelo = 'seasparrow3', capacidade = 0, tipo = 'importair' },
	--[MOTORCYCLES]--
	{ hash = 1086534307, name = 'manchez2', price = 1000, banido = false, modelo = 'manchez2', capacidade = 0, tipo = 'work' },
	--[OFF-ROAD]--
	{ hash = 298565713, name = 'verus', price = 1000, banido = false, modelo = 'verus', capacidade = 0, tipo = 'work' },
	{ hash = -210308634, name = 'winky', price = 1000, banido = false, modelo = 'winky', capacidade = 0, tipo = 'work' },
	{ hash = 408825843, name = 'outlaw', price = 25000, banido = false, modelo = 'winky', capacidade = 0, tipo = 'import' },
	--[PLANES]--
	{ hash = -365873403, name = 'alkonost', price = 1000, banido = false, modelo = 'alkonost', capacidade = 0, tipo = 'work' },
	--[SUVS]--
	{ hash = -102335483, name = 'squaddie', price = 1000, banido = false, modelo = 'squaddie', capacidade = 0, tipo = 'work' },
	--[SPORTS]--
	{ hash = -1149725334, name = 'italirsx', price = 1000, banido = false, modelo = 'italirsx', capacidade = 0, tipo = 'work' },
	{ hash = -857356038, name = 'veto', price = 1000, banido = false, modelo = 'veto', capacidade = 0, tipo = 'work' },
	{ hash = -1492917079, name = 'veto2', price = 1000, banido = false, modelo = 'veto2', capacidade = 0, tipo = 'work' },
	--[SPORTS CLASSIC]--
	{ hash = 1455990255, name = 'toreador', price = 1000, banido = false, modelo = 'toreador', capacidade = 0, tipo = 'work' },
----------------------------------------------
----------- BOATS ----------------------------
----------------------------------------------
	{ hash = 1033245328, name = 'dinghy', price = 1000, banido = false, modelo = 'Dinghy', capacidade = 0, tipo = 'work' },
	{ hash = 276773164, name = 'dinghy2', price = 1000, banido = false, modelo = 'Dinghy2', capacidade = 0, tipo = 'work' },
	{ hash = 509498602, name = 'dinghy3', price = 1000, banido = false, modelo = 'Dinghy3', capacidade = 0, tipo = 'work' },
	{ hash = 867467158, name = 'dinghy4', price = 1000, banido = false, modelo = 'Dinghy4', capacidade = 0, tipo = 'work' },
	{ hash = 861409633, name = 'jetmax', price = 2900000, banido = false, modelo = 'Jetmax', capacidade = 40, tipo = 'work' },
	{ hash = -1043459709, name = 'marquis', price = 5000000, banido = false, modelo = 'Marquis', capacidade = 50, tipo = 'work' },
	{ hash = -1030275036, name = 'seashark', price = 1000, banido = false, modelo = 'Seashark', capacidade = 0, tipo = 'work' },
	{ hash = -616331036, name = 'seashark2', price = 1000, banido = false, modelo = 'Seashark2', capacidade = 0, tipo = 'work' },
	{ hash = -311022263, name = 'seashark3', price = 1000, banido = false, modelo = 'Seashark3', capacidade = 0, tipo = 'work' },
	{ hash = 231083307, name = 'speeder', price = 3200000, banido = false, modelo = 'Speeder', capacidade = 40, tipo = 'work' },
	{ hash = 437538602, name = 'speeder2', price = 3500000, banido = false, modelo = 'Speeder2', capacidade = 60, tipo = 'work' },
	{ hash = 400514754, name = 'squalo', price = 2500000, banido = false, modelo = 'Squalo', capacidade = 40, tipo = 'work' },
	{ hash = 771711535, name = 'submersible', price = 1000, banido = false, modelo = 'Submersible', capacidade = 0, tipo = 'work' },
	{ hash = -1066334226, name = 'submersible', price = 1000, banido = false, modelo = 'Submersible2', capacidade = 0, tipo = 'work' },
	{ hash = -282946103, name = 'suntrap', price = 1000, banido = false, modelo = 'Suntrap', capacidade = 0, tipo = 'work' },
	{ hash = 1070967343, name = 'toro', price = 2550000, banido = false, modelo = 'Toro', capacidade = 40, tipo = 'work' },
	{ hash = 908897389, name = 'toro2', price = 2750000, banido = false, modelo = 'Toro2', capacidade = 40, tipo = 'work' },
	{ hash = 290013743, name = 'tropic', price = 1000, banido = false, modelo = 'Tropic', capacidade = 0, tipo = 'work' },
	{ hash = 1448677353, name = 'tropic2', price = 2750000, banido = false, modelo = 'Tropic2', capacidade = 40, tipo = 'work' },
	{ hash = -2100640717, name = 'tug', price = 1000, banido = false, modelo = 'Tug', capacidade = 0, tipo = 'work' },
	
----------------------------------------------
----------- COMMERCIAL -----------------------
----------------------------------------------
	{ hash = 2053223216, name = 'benson', price = 4800000, banido = false, modelo = 'Benson', capacidade = 1000, tipo = 'carros' },
	{ hash = 850991848, name = 'biff', price = 1000, banido = false, modelo = 'Biff', capacidade = 0, tipo = 'carros' },
	{ hash = 1518533038, name = 'hauler', price = 1000, banido = false, modelo = 'Hauler', capacidade = 0, tipo = 'carros' },
	{ hash = 387748548, name = 'hauler2', price = 1000, banido = false, modelo = 'Hauler2', capacidade = 0, tipo = 'carros' },
	{ hash = 904750859, name = 'mule', price = 3500000, banido = false, modelo = 'Mule', capacidade = 600, tipo = 'carros' },
	{ hash = -1050465301, name = 'mule2', price = 3500000, banido = false, modelo = 'Mule2', capacidade = 600, tipo = 'carros' },
	{ hash = -2052737935, name = 'mule3', price = 3500000, banido = false, modelo = 'Mule3', capacidade = 600, tipo = 'carros' },
	{ hash = 1945374990, name = 'mule4', price = 3500000, banido = false, modelo = 'Mule4', capacidade = 600, tipo = 'carros' },
	{ hash = 569305213, name = 'packer', price = 1000, banido = false, modelo = 'Packer', capacidade = 0, tipo = 'carros' },
	{ hash = -305727417, name = 'brickade', price = 5000000, banido = false, modelo = 'Brickade', capacidade = 1500, tipo = 'carros' },
	{ hash = -1649536104, name = 'phantom2', price = 1000, banido = false, modelo = 'Phantom2', capacidade = 0, tipo = 'carros' },
	{ hash = 177270108, name = 'phantom3', price = 1000, banido = false, modelo = 'Phantom3', capacidade = 0, tipo = 'carros' },
	{ hash = 2112052861, name = 'pounder', price = 5800000, banido = false, modelo = 'Pounder', capacidade = 1500, tipo = 'carros' },
	{ hash = 1653666139, name = 'pounder2', price = 5800000, banido = false, modelo = 'Pounder2', capacidade = 1500, tipo = 'carros' },
	{ hash = 1747439474, name = 'stockade', price = 1000, banido = false, modelo = 'Stockade', capacidade = 0, tipo = 'carros' },
	{ hash = -1988428699, name = 'terbyte', price = 1000, banido = false, modelo = 'Terbyte', capacidade = 0, tipo = 'carros' },
----------------------------------------------
----------- COMPACTS -------------------------
----------------------------------------------
	{ hash = -344943009, name = 'blista', price = 30000, banido = false, modelo = 'Blista', capacidade = 30, tipo = 'carros' },
	{ hash = 1039032026, name = 'blista2', price = 20000, banido = false, modelo = 'Blista2', capacidade = 30, tipo = 'carros' },
	{ hash = -591651781, name = 'blista3', price = 35000, banido = false, modelo = 'Blista3', capacidade = 30, tipo = 'carros' },
	{ hash = 1549126457, name = 'brioso', price = 15000, banido = false, modelo = 'Brioso', capacidade = 20, tipo = 'carros' },
	{ hash = -1130810103, name = 'dilettante', price = 25000, banido = false, modelo = 'Dilettante', capacidade = 25, tipo = 'carros' },
	{ hash = 1682114128, name = 'dilettante2', price = 60000, banido = false, modelo = 'Dilettante2', capacidade = 25, tipo = 'carros' },
	{ hash = -1177863319, name = 'issi2', price = 30000, banido = false, modelo = 'Issi2', capacidade = 25, tipo = 'carros' },
	{ hash = 931280609, name = 'issi3', price = 50000, banido = false, modelo = 'Issi3', capacidade = 0, tipo = 'carros' },
	{ hash = -431692672, name = 'panto', price = 5000, banido = false, modelo = 'Panto', capacidade = 20, tipo = 'carros' },
	{ hash = -1450650718, name = 'prairie', price = 40000, banido = false, modelo = 'Prairie', capacidade = 20, tipo = 'carros' },
	{ hash = 841808271, name = 'rhapsody', price = 15000, banido = false, modelo = 'Rhapsody', capacidade = 30, tipo = 'carros' },
	{ hash = -452604007, name = 'rt3000', price = 15000, banido = false, modelo = 'RT 3000', capacidade = 30, tipo = 'carros' },
----------------------------------------------
----------- COUPES ---------------------------
----------------------------------------------
	{ hash = 330661258, name = 'cogcabrio', price = 100000, banido = false, modelo = 'Cogcabrio', capacidade = 40, tipo = 'carros' },
	{ hash = -5153954, name = 'exemplar', price = 60000, banido = false, modelo = 'Exemplar', capacidade = 30, tipo = 'carros' },
	{ hash = -591610296, name = 'f620', price = 70000, banido = false, modelo = 'F620', capacidade = 30, tipo = 'carros' },
	{ hash = -391594584, name = 'felon', price = 60000, banido = false, modelo = 'Felon', capacidade = 40, tipo = 'carros' },
	{ hash = -89291282, name = 'felon2', price = 70000, banido = false, modelo = 'Felon2', capacidade = 35, tipo = 'carros' },
	{ hash = -624529134, name = 'jackal', price = 50000, banido = false, modelo = 'Jackal', capacidade = 45, tipo = 'carros' },
	{ hash = 1348744438, name = 'oracle', price = 30000, banido = false, modelo = 'Oracle', capacidade = 45, tipo = 'carros' },
	{ hash = -511601230, name = 'oracle2', price = 70000, banido = false, modelo = 'Oracle2', capacidade = 50, tipo = 'carros' },
	{ hash = 1349725314, name = 'sentinel', price = 55000, banido = false, modelo = 'Sentinel', capacidade = 40, tipo = 'carros' },
	{ hash = 873639469, name = 'sentinel2', price = 65000, banido = false, modelo = 'Sentinel2', capacidade = 35, tipo = 'carros' },
	{ hash = 1581459400, name = 'windsor', price = 300000, banido = false, modelo = 'Windsor', capacidade = 30, tipo = 'carros' },
	{ hash = -1930048799, name = 'windsor2', price = 350000, banido = false, modelo = 'Windsor2', capacidade = 35, tipo = 'carros' },
	{ hash = -1122289213, name = 'zion', price = 130000, banido = false, modelo = 'Zion', capacidade = 40, tipo = 'carros' },
	{ hash = -1193103848, name = 'zion2', price = 130000, banido = false, modelo = 'Zion2', capacidade = 35, tipo = 'carros' },
----------------------------------------------
----------- CYCLES ---------------------------
----------------------------------------------
	{ hash = 1131912276, name = 'bmx', price = 1000, banido = true, modelo = 'Bmx', capacidade = 0, tipo = 'work' },
	{ hash = 448402357, name = 'cruiser', price = 1000, banido = true, modelo = 'Cruiser', capacidade = 0, tipo = 'work' },
	{ hash = -836512833, name = 'fixter', price = 1000, banido = true, modelo = 'Fixter', capacidade = 0, tipo = 'work' },
	{ hash = -186537451, name = 'scorcher', price = 1000, banido = true, modelo = 'Policia Scorcher', capacidade = 0, tipo = 'work' },
	{ hash = 1127861609, name = 'tribike', price = 1000, banido = true, modelo = 'Tribike', capacidade = 0, tipo = 'work' },
	{ hash = -1233807380, name = 'tribike2', price = 1000, banido = true, modelo = 'Tribike2', capacidade = 0, tipo = 'work' },
	{ hash = -400295096, name = 'tribike3', price = 1000, banido = true, modelo = 'Tribike3', capacidade = 0, tipo = 'work' },
	{ hash = -1138804729, name = 'odv-uninho', price = 1000, banido = false, modelo = 'Uno Eletricista', capacidade = 30, tipo = 'work' },
----------------------------------------------
----------- EMERGENCY ------------------------
----------------------------------------------
	{ hash = 1171614426, name = 'ambulance', price = 1000, banido = false, modelo = 'Ambulância', capacidade = 0, tipo = 'work' },
	{ hash = 1127131465, name = 'fbi', price = 1000, banido = true, modelo = 'FBI', capacidade = 0, tipo = 'work' },
	{ hash = -1647941228, name = 'fbi2', price = 1000, banido = true, modelo = 'FBI2', capacidade = 0, tipo = 'work' },
	{ hash = 1938952078, name = 'firetruk', price = 1000, banido = false, modelo = 'Caminhão de Bombeiros', capacidade = 0, tipo = 'work' },
	{ hash = -2007026063, name = 'pbus', price = 1000, banido = true, modelo = 'Ônibus Penitenciário', capacidade = 0, tipo = 'work' },
	{ hash = 456714581, name = 'policeT', price = 1000, banido = true, modelo = 'Police Gramp', capacidade = 0, tipo = 'work' },
	{ hash = 353883353, name = 'polmav', price = 1000, banido = true, modelo = 'Helicóptero Police', capacidade = 0, tipo = 'work' },
	{ hash = -488123221, name = 'predator', price = 1000, banido = true, modelo = 'Barco Police', capacidade = 0, tipo = 'work' },
	{ hash = -1205689942, name = 'riot', price = 1000, banido = true, modelo = 'Riot', capacidade = 0, tipo = 'work' },
	{ hash = -1693015116, name = 'riot2', price = 1000, banido = true, modelo = 'Riot2', capacidade = 0, tipo = 'work' },
	{ hash = 1922257928, name = 'sheriff2', price = 1000, banido = true, modelo = 'Sheriff2', capacidade = 0, tipo = 'work' },
----------------------------------------------
----------- HELICOPTERS ----------------------
----------------------------------------------
	{ hash = 788747387, name = 'buzzard', price = 1000, banido = true, modelo = 'Buzzard', capacidade = 0, tipo = 'importair' },
	{ hash = 745926877, name = 'buzzard2', price = 1000, banido = true, modelo = 'Buzzard2', capacidade = 0, tipo = 'importair' },
	{ hash = 744705981, name = 'frogger', price = 1000, banido = true, modelo = 'Frogger', capacidade = 0, tipo = 'importair' },
	{ hash = 1949211328, name = 'frogger2', price = 1000, banido = false, modelo = 'Frogger2', capacidade = 60, tipo = 'importair' },
	{ hash = -1984275979, name = 'havok', price = 1000, banido = false, modelo = 'Havok', capacidade = 30, tipo = 'importair' },
	{ hash = -1660661558, name = 'maverick', price = 1000, banido = true, modelo = 'Maverick', capacidade = 0, tipo = 'importair' },
	{ hash = -726768679, name = 'seasparrow', price = 1000, banido = true, modelo = 'Seasparrow', capacidade = 0, tipo = 'importair' },
	{ hash = 710198397, name = 'supervolito', price = 10000000, banido = false, modelo = 'Supervolito', capacidade = 50, tipo = 'importair' },
	{ hash = -1671539132, name = 'supervolito2', price = 1000, banido = true, modelo = 'Supervolito2', capacidade = 0, tipo = 'importair' },
	{ hash = -339587598, name = 'swift', price = 1000, banido = true, modelo = 'Swift', capacidade = 0, tipo = 'importair' },
	{ hash = 1075432268, name = 'swift2', price = 1000, banido = true, modelo = 'Swift2', capacidade = 0, tipo = 'importair' },
	{ hash = -1845487887, name = 'volatus', price = 1000, banido = false, modelo = 'Volatus', capacidade = 0, tipo = 'importair' },
----------------------------------------------
----------- INDUSTRIAL -----------------------
----------------------------------------------
	{ hash = 1353720154, name = 'flatbed', price = 1000, banido = true, modelo = 'Reboque', capacidade = 0, tipo = 'work' },
	{ hash = -2107990196, name = 'guardian', price = 1750000, banido = false, modelo = 'Guardian', capacidade = 150, tipo = 'carros' },
	{ hash = -1705304628, name = 'rubble', price = 1000, banido = false, modelo = 'Rubble', capacidade = 0, tipo = 'work' },
	{ hash = 48339065, name = 'tiptruck', price = 1000, banido = false, modelo = 'Tiptruck', capacidade = 0, tipo = 'work' },
	{ hash = -947761570, name = 'tiptruck2', price = 1000, banido = false, modelo = 'Tiptruck2', capacidade = 0, tipo = 'work' },
----------------------------------------------
----------- MOTORCYCLES ----------------------
----------------------------------------------
	{ hash = 1672195559, name = 'akuma', price = 50000, banido = false, modelo = 'Akuma', capacidade = 10, tipo = 'motos' },
	{ hash = -2115793025, name = 'avarus', price = 100000, banido = false, modelo = 'Avarus', capacidade = 10, tipo = 'motos' },
	{ hash = -2140431165, name = 'bagger', price = 75000, banido = false, modelo = 'Bagger', capacidade = 20, tipo = 'motos' },
	{ hash = -114291515, name = 'bati', price = 120000, banido = false, modelo = 'Bati', capacidade = 10, tipo = 'motos' },
	{ hash = -891462355, name = 'bati2', price = 150000, banido = false, modelo = 'Bati2', capacidade = 10, tipo = 'motos' },
	{ hash = 86520421, name = 'bf400', price = 80000, banido = false, modelo = 'Bf400', capacidade = 10, tipo = 'import' },
	{ hash = -440768424, name = 'blazer4', price = 500000, banido = true, modelo = 'Blazer4', capacidade = 10, tipo = 'motos' },
	{ hash = 11251904, name = 'carbonrs', price = 300000, banido = false, modelo = 'Carbonrs', capacidade = 10, tipo = 'motos' },
	{ hash = 6774487, name = 'chimera', price = 150000, banido = false, modelo = 'Chimera', capacidade = 10, tipo = 'motos' },
	{ hash = 390201602, name = 'cliffhanger', price = 200000, banido = false, modelo = 'Cliffhanger', capacidade = 10, tipo = 'motos' },
	{ hash = 2006142190, name = 'daemon', price = 175000, banido = false, modelo = 'Daemon', capacidade = 10, tipo = 'motos' },
	{ hash = -1404136503, name = 'daemon2', price = 185000, banido = false, modelo = 'Daemon2', capacidade = 10, tipo = 'motos' },
	{ hash = 822018448, name = 'defiler', price = 200000, banido = false, modelo = 'Defiler', capacidade = 10, tipo = 'motos' },
	{ hash = -27326686, name = 'deathbike', price = 445000, banido = false, modelo = 'deathbike', capacidade = 10, tipo = 'motos' },
	{ hash = -239841468, name = 'diablous', price = 80000, banido = false, modelo = 'diablous', capacidade = 10, tipo = 'motos' },
	{ hash = 1790834270, name = 'diablous2', price = 200000, banido = false, modelo = 'diablous2', capacidade = 10, tipo = 'motos' },
	{ hash = -1670998136, name = 'double', price = 300000, banido = false, modelo = 'Double', capacidade = 10, tipo = 'motos' },
	{ hash = 1753414259, name = 'enduro', price = 50000, banido = false, modelo = 'Enduro', capacidade = 10, tipo = 'motos' },
	{ hash = 2035069708, name = 'esskey', price = 60000, banido = false, modelo = 'Esskey', capacidade = 10, tipo = 'motos' },
	{ hash = -1842748181, name = 'faggio', price = 5000, banido = false, modelo = 'Faggio', capacidade = 5, tipo = 'motos' },
	{ hash = 55628203, name = 'faggio2', price = 4000, banido = false, modelo = 'Faggio2', capacidade = 5, tipo = 'motos' },
	{ hash = -1289178744, name = 'faggio3', price = 20000, banido = false, modelo = 'Faggio3', capacidade = 5, tipo = 'motos' },
	{ hash = 627535535, name = 'fcr', price = 50000, banido = false, modelo = 'Fcr', capacidade = 10, tipo = 'motos' },
	{ hash = -757735410, name = 'fcr2', price = 170000, banido = false, modelo = 'Fcr2', capacidade = 10, tipo = 'motos' },
	{ hash = 741090084, name = 'gargoyle', price = 50000, banido = false, modelo = 'Gargoyle', capacidade = 10, tipo = 'motos' },
	{ hash = 1265391242, name = 'hakuchou', price = 150000, banido = false, modelo = 'Hakuchou', capacidade = 10, tipo = 'motos' },
	{ hash = -255678177, name = 'hakuchou2', price = 300000, banido = false, modelo = 'Hakuchou2', capacidade = 10, tipo = 'motos' },
	{ hash = 301427732, name = 'hexer', price = 150000, banido = false, modelo = 'Hexer', capacidade = 10, tipo = 'motos' },
	{ hash = -159126838, name = 'innovation', price = 50000, banido = false, modelo = 'Innovation', capacidade = 10, tipo = 'motos' },
	{ hash = 640818791, name = 'lectro', price = 60000, banido = false, modelo = 'Lectro', capacidade = 10, tipo = 'motos' },
	{ hash = -1523428744, name = 'manchez', price = 200000, banido = false, modelo = 'Manchez', capacidade = 10, tipo = 'motos' },
	{ hash = -634879114, name = 'nemesis', price = 70000, banido = false, modelo = 'Nemesis', capacidade = 10, tipo = 'motos' },
	{ hash = -1606187161, name = 'nightblade', price = 250000, banido = false, modelo = 'Nightblade', capacidade = 10, tipo = 'motos' },
	{ hash = -909201658, name = 'pcj', price = 50000, banido = false, modelo = 'PCJ', capacidade = 10, tipo = 'import' },
	{ hash = 1873600305, name = 'ratbike', price = 25000, banido = false, modelo = 'Ratbike', capacidade = 10, tipo = 'motos' },
	{ hash = -893578776, name = 'ruffian', price = 80000, banido = false, modelo = 'Ruffian', capacidade = 10, tipo = 'motos' },
	{ hash = 788045382, name = 'sanchez', price = 200000, banido = false, modelo = 'Sanchez', capacidade = 10, tipo = 'motos' },
	{ hash = -1453280962, name = 'sanchez2', price = 220000, banido = false, modelo = 'Sanchez2', capacidade = 10, tipo = 'motos' },
	{ hash = 1491277511, name = 'sanctus', price = 300000, banido = false, modelo = 'Sanctus', capacidade = 10, tipo = 'motos' },
	{ hash = -405626514, name = 'shotaro', price = 1500000, banido = false, modelo = 'Shotaro', capacidade = 10, tipo = 'motos' },
	{ hash = 743478836, name = 'sovereign', price = 300000, banido = false, modelo = 'Sovereign', capacidade = 20, tipo = 'motos' },
	{ hash = 1836027715, name = 'thrust', price = 100000, banido = false, modelo = 'Thrust', capacidade = 10, tipo = 'motos' },
	{ hash = -140902153, name = 'vader', price = 50000, banido = false, modelo = 'Vader', capacidade = 10, tipo = 'motos' },
	{ hash = -1353081087, name = 'vindicator', price = 80000, banido = false, modelo = 'Vindicator', capacidade = 10, tipo = 'motos' },
	{ hash = -609625092, name = 'vortex', price = 200000, banido = false, modelo = 'Vortex', capacidade = 10, tipo = 'motos' },
	{ hash = -618617997, name = 'wolfsbane', price = 180000, banido = false, modelo = 'Wolfsbane', capacidade = 10, tipo = 'motos' },
	{ hash = -1009268949, name = 'zombiea', price = 185000, banido = false, modelo = 'Zombiea', capacidade = 10, tipo = 'motos' },
	{ hash = -570033273, name = 'zombieb', price = 195000, banido = false, modelo = 'Zombieb', capacidade = 10, tipo = 'motos' },
----------------------------------------------
----------- MUSCLE ---------------------------
----------------------------------------------
	{ hash = -1205801634, name = 'blade', price = 120000, banido = false, modelo = 'Blade', capacidade = 30, tipo = 'carros' },
	{ hash = -682211828, name = 'buccaneer', price = 80000, banido = false, modelo = 'Buccaneer', capacidade = 40, tipo = 'carros' },
	{ hash = -1013450936, name = 'buccaneer2', price = 150000, banido = false, modelo = 'Buccaneer2', capacidade = 30, tipo = 'carros' },
	{ hash = 349605904, name = 'chino', price = 80000, banido = false, modelo = 'Chino', capacidade = 30, tipo = 'carros' },
	{ hash = -1361687965, name = 'chino2', price = 100000, banido = false, modelo = 'Chino2', capacidade = 30, tipo = 'carros' },
	{ hash = 80636076, name = 'dominator', price = 75000, banido = false, modelo = 'Dominator', capacidade = 30, tipo = 'carros' },
	{ hash = -915704871, name = 'dominator2', price = 95000, banido = false, modelo = 'Dominator2', capacidade = 30, tipo = 'carros' },
	{ hash = -986944621, name = 'dominator3', price = 300000, banido = false, modelo = 'Dominator3', capacidade = 30, tipo = 'carros' },
	{ hash = 723973206, name = 'dukes', price = 80000, banido = false, modelo = 'Dukes', capacidade = 30, tipo = 'carros' },
	{ hash = -326143852, name = 'dukes2', price = 2000, banido = false, modelo = 'Dukes2', capacidade = 30, tipo = 'import' },
	{ hash = -2119578145, name = 'faction', price = 75000, banido = false, modelo = 'Faction', capacidade = 30, tipo = 'carros' },
	{ hash = -1790546981, name = 'faction2', price = 105000, banido = false, modelo = 'Faction2', capacidade = 30, tipo = 'carros' },
	{ hash = -2039755226, name = 'faction3', price = 200000, banido = false, modelo = 'Faction3', capacidade = 30, tipo = 'carros' },
	{ hash = -1800170043, name = 'gauntlet', price = 55000, banido = false, modelo = 'Gauntlet', capacidade = 30, tipo = 'carros' },
	{ hash = 349315417, name = 'gauntlet2', price = 85000, banido = false, modelo = 'Gauntlet2', capacidade = 30, tipo = 'carros' },
	{ hash = 37348240, name = 'hotknife', price = 300000, banido = false, modelo = 'Hotknife', capacidade = 30, tipo = 'carros' },
	{ hash = 2068293287, name = 'lurcher', price = 45000, banido = false, modelo = 'Lurcher', capacidade = 30, tipo = 'carros' },
	{ hash = 525509695, name = 'moonbeam', price = 180000, banido = false, modelo = 'Moonbeam', capacidade = 110, tipo = 'carros' },
	{ hash = 1896491931, name = 'moonbeam2', price = 250000, banido = false, modelo = 'Moonbeam2', capacidade = 85, tipo = 'carros' },
	{ hash = -1943285540, name = 'nightshade', price = 220000, banido = false, modelo = 'Nightshade', capacidade = 30, tipo = 'carros' },
	{ hash = -2095439403, name = 'phoenix', price = 160000, banido = false, modelo = 'Phoenix', capacidade = 30, tipo = 'carros' },
	{ hash = 1507916787, name = 'picador', price = 45000, banido = false, modelo = 'Picador', capacidade = 100, tipo = 'carros' },
	{ hash = -667151410, name = 'ratloader', price = 10000, banido = true, modelo = 'Caminhão', capacidade = 0, tipo = 'work' },
	{ hash = -589178377, name = 'ratloader2', price = 50000, banido = false, modelo = 'Ratloader2', capacidade = 90, tipo = 'work' },
	{ hash = -227741703, name = 'ruiner', price = 100000, banido = false, modelo = 'Ruiner', capacidade = 30, tipo = 'carros' },
	{ hash = 941494461, name = 'ruiner2', price = 155000, banido = false, modelo = 'Ruiner2', capacidade = 30, tipo = 'carros' },
	{ hash = -1685021548, name = 'sabregt', price = 70000, banido = false, modelo = 'Sabregt', capacidade = 30, tipo = 'carros' },
	{ hash = 223258115, name = 'sabregt2', price = 180000, banido = false, modelo = 'Sabregt2', capacidade = 30, tipo = 'carros' },
	{ hash = 729783779, name = 'slamvan', price = 120000, banido = false, modelo = 'Slamvan', capacidade = 130, tipo = 'carros' },
	{ hash = 833469436, name = 'slamvan2', price = 130000, banido = false, modelo = 'Slamvan2', capacidade = 100, tipo = 'carros' },
	{ hash = 1119641113, name = 'slamvan3', price = 150000, banido = false, modelo = 'Slamvan3', capacidade = 100, tipo = 'carros' },
	{ hash = 1923400478, name = 'stalion', price = 80000, banido = false, modelo = 'Stalion', capacidade = 30, tipo = 'carros' },
	{ hash = -401643538, name = 'stalion2', price = 150000, banido = false, modelo = 'Stalion2', capacidade = 20, tipo = 'carros' },
	{ hash = 972671128, name = 'tampa', price = 80000, banido = false, modelo = 'Tampa', capacidade = 30, tipo = 'carros' },
	{ hash = -1210451983, name = 'tampa3', price = 2000, banido = false, modelo = 'Tampa3', capacidade = 30, tipo = 'carros' },
	{ hash = -825837129, name = 'vigero', price = 90000, banido = false, modelo = 'Vigero', capacidade = 30, tipo = 'carros' },
	{ hash = -498054846, name = 'virgo', price = 80000, banido = false, modelo = 'Virgo', capacidade = 30, tipo = 'carros' },
	{ hash = -899509638, name = 'virgo2', price = 90000, banido = false, modelo = 'Virgo2', capacidade = 30, tipo = 'carros' },
	{ hash = 16646064, name = 'virgo3', price = 100000, banido = false, modelo = 'Virgo3', capacidade = 30, tipo = 'carros' },
	{ hash = 2006667053, name = 'voodoo', price = 85000, banido = false, modelo = 'Voodoo', capacidade = 30, tipo = 'carros' },
	{ hash = 523724515, name = 'voodoo2', price = 100000, banido = false, modelo = 'Voodoo2', capacidade = 30, tipo = 'carros' },
	{ hash = 15219735, name = 'hermes', price = 200000, banido = false, modelo = 'Hermes', capacidade = 30, tipo = 'carros' },
	{ hash = 1871995513, name = 'yosemite', price = 120000, banido = false, modelo = 'Yosemite', capacidade = 115, tipo = 'carros' },
	{ hash = -1267543371, name = 'ellie', price = 200000, banido = false, modelo = 'Ellie', capacidade = 30, tipo = 'carros' },
	{ hash = -1566607184, name = 'clique', price = 175000, banido = false, modelo = 'Clique', capacidade = 30, tipo = 'carros' },
	{ hash = 1279262537, name = 'deviant', price = 356000, banido = false, modelo = 'Deviant', capacidade = 30, tipo = 'carros' },
	{ hash = -2096690334, name = 'impaler', price = 90000, banido = false, modelo = 'Impaler', capacidade = 30, tipo = 'carros' },
	{ hash = 1456744817, name = 'tulip', price = 130000, banido = false, modelo = 'Tulip', capacidade = 30, tipo = 'carros' },
	{ hash = -49115651, name = 'vamos', price = 135000, banido = false, modelo = 'Vamos', capacidade = 30, tipo = 'carros' },
----------------------------------------------
----------- OFF-ROAD ------------------------
----------------------------------------------
	{ hash = 1126868326, name = 'bfinjection', price = 30000, banido = false, modelo = 'Bfinjection', capacidade = 20, tipo = 'carros' },
	{ hash = -349601129, name = 'bifta', price = 50000, banido = false, modelo = 'Bifta', capacidade = 20, tipo = 'carros' },
	{ hash = 92612664, name = 'kalahari', price = 65000, banido = false, modelo = 'Kalahari', capacidade = 20, tipo = 'carros' },
	{ hash = 914654722, name = 'mesa', price = 65000, banido = false, modelo = 'Mesa', capacidade = 100, tipo = 'carros' },
	{ hash = -2064372143, name = 'mesa3', price = 300000, banido = false, modelo = 'Mesa3', capacidade = 110, tipo = 'carros' },
	{ hash = 1645267888, name = 'rancherxl', price = 640000, banido = false, modelo = 'Rancherxl', capacidade = 70, tipo = 'carros' },
	{ hash = -1207771834, name = 'rebel', price = 60000, banido = false, modelo = 'Rebel', capacidade = 100, tipo = 'work' },
	{ hash = -2045594037, name = 'rebel2', price = 65000, banido = false, modelo = 'Rebel2', capacidade = 120, tipo = 'carros' },
	{ hash = -1189015600, name = 'sandking', price = 250000, banido = false, modelo = 'Sandking', capacidade = 150, tipo = 'carros' },
	{ hash = 989381445, name = 'sandking2', price = 265000, banido = false, modelo = 'Sandking2', capacidade = 145, tipo = 'carros' },
	{ hash = 101905590, name = 'trophytruck', price = 600000, banido = false, modelo = 'Trophytruck', capacidade = 15, tipo = 'carros' },
	{ hash = -663299102, name = 'trophytruck2', price = 680000, banido = false, modelo = 'Trophytruck2', capacidade = 15, tipo = 'carros' },
	{ hash = -121446169, name = 'kamacho', price = 400000, banido = false, modelo = 'Kamacho', capacidade = 140, tipo = 'carros' },
	{ hash = -54332285, name = 'freecrawler', price = 450000, banido = false, modelo = 'Freecrawler', capacidade = 50, tipo = 'carros' },
	{ hash = -1435919434, name = 'bodhi2', price = 180000, banido = false, modelo = 'Bodhi2', capacidade = 150, tipo = 'carros' },
	{ hash = -1479664699, name = 'brawler', price = 660000, banido = false, modelo = 'Brawler', capacidade = 50, tipo = 'carros' },
	{ hash = -1532697517, name = 'riata', price = 195000, banido = false, modelo = 'Riata', capacidade = 100, tipo = 'carros' },
	{ hash = 1770332643, name = 'dloader', price = 150000, banido = false, modelo = 'Dloader', capacidade = 120, tipo = 'carros' },
----------------------------------------------
----------- PLANES ---------------------------
----------------------------------------------
	{ hash = -644710429, name = 'cuban800', price = 1000, banido = true, modelo = 'Cuban800', capacidade = 0, tipo = 'importair' },
	{ hash = -901163259, name = 'dodo', price = 1000, banido = true, modelo = 'Dodo', capacidade = 0, tipo = 'importair' },
	{ hash = 970356638, name = 'duster', price = 1000, banido = true, modelo = 'Duster', capacidade = 0, tipo = 'importair' },
	{ hash = 621481054, name = 'luxor', price = 1000, banido = true, modelo = 'Luxor', capacidade = 0, tipo = 'importair' },
	{ hash = -1214293858, name = 'luxor2', price = 1000, banido = true, modelo = 'Luxor2', capacidade = 0, tipo = 'importair' },
	{ hash = -1746576111, name = 'mammatus', price = 1000, banido = true, modelo = 'Mammatus', capacidade = 0, tipo = 'importair' },
	{ hash = -2122757008, name = 'stunt', price = 1000, banido = true, modelo = 'Stunt', capacidade = 0, tipo = 'importair' },
	{ hash = -1673356438, name = 'velum', price = 1000, banido = true, modelo = 'velum', capacidade = 0, tipo = 'importair' },
	{ hash = 1077420264, name = 'velum2', price = 1000, banido = false, modelo = 'Velum2', capacidade = 100, tipo = 'importair' },
	{ hash = 1341619767, name = 'vestra', price = 1000, banido = false, modelo = 'Vestra', capacidade = 150, tipo = 'importair' },
----------------------------------------------
----------- SUVS -----------------------------
----------------------------------------------
	{ hash = 850565707, name = 'bjxl', price = 55000, banido = false, modelo = 'Bjxl', capacidade = 100, tipo = 'carros' },
	{ hash = -808831384, name = 'baller', price = 60000, banido = false, modelo = 'Baller', capacidade = 100, tipo = 'carros' },
	{ hash = 142944341, name = 'baller2', price = 70000, banido = false, modelo = 'Baller2', capacidade = 100, tipo = 'carros' },
	{ hash = 1878062887, name = 'baller3', price = 85000, banido = false, modelo = 'Baller3', capacidade = 100, tipo = 'carros' },
	{ hash = 634118882, name = 'baller4', price = 150000, banido = false, modelo = 'Baller4', capacidade = 100, tipo = 'carros' },
	{ hash = 470404958, name = 'baller5', price = 950000, banido = false, modelo = 'Baller5', capacidade = 50, tipo = 'carros' },
	{ hash = 666166960, name = 'baller6', price = 970000, banido = false, modelo = 'Baller6', capacidade = 50, tipo = 'carros' },
	{ hash = 2006918058, name = 'cavalcade', price = 75000, banido = false, modelo = 'Cavalcade', capacidade = 100, tipo = 'carros' },
	{ hash = -789894171, name = 'cavalcade2', price = 90000, banido = false, modelo = 'Cavalcade2', capacidade = 100, tipo = 'carros' },
	{ hash = 683047626, name = 'contender', price = 500000, banido = false, modelo = 'Contender', capacidade = 150, tipo = 'carros' },
	{ hash = 1177543287, name = 'dubsta', price = 355000, banido = false, modelo = 'Dubsta', capacidade = 100, tipo = 'carros' },
	{ hash = -394074634, name = 'dubsta2', price = 400000, banido = false, modelo = 'Dubsta2', capacidade = 100, tipo = 'carros' },
	{ hash = -1237253773, name = 'dubsta3', price = 55000, banido = false, modelo = 'Dubsta3', capacidade = 150, tipo = 'carros' },
	{ hash = -1137532101, name = 'fq2', price = 85000, banido = false, modelo = 'Fq2', capacidade = 50, tipo = 'carros' },
	{ hash = -1775728740, name = 'granger', price = 66000, banido = false, modelo = 'Granger', capacidade = 100, tipo = 'carros' },
	{ hash = -1543762099, name = 'gresley', price = 40000, banido = false, modelo = 'Gresley', capacidade = 85, tipo = 'carros' },
	{ hash = 884422927, name = 'habanero', price = 45000, banido = false, modelo = 'Habanero', capacidade = 50, tipo = 'carros' },
	{ hash = 486987393, name = 'huntley', price = 80000, banido = false, modelo = 'Huntley', capacidade = 85, tipo = 'carros' },
	{ hash = 1269098716, name = 'landstalker', price = 35000, banido = false, modelo = 'Landstalker', capacidade = 100, tipo = 'carros' },
	{ hash = -808457413, name = 'patriot', price = 15500, banido = false, modelo = 'Patriot', capacidade = 70, tipo = 'carros' },
	{ hash = -420911112, name = 'patriot2', price = 150000, banido = false, modelo = 'Patriot2', capacidade = 60, tipo = 'carros' },
	{ hash = -1651067813, name = 'radi', price = 55000, banido = false, modelo = 'Radi', capacidade = 85, tipo = 'carros' },
	{ hash = 2136773105, name = 'rocoto', price = 120000, banido = false, modelo = 'Rocoto', capacidade = 60, tipo = 'carros' },
	{ hash = 1221512915, name = 'seminole', price = 35000, banido = false, modelo = 'Seminole', capacidade = 60, tipo = 'carros' },
	{ hash = -1810806490, name = 'seminole2', price = 35000, banido = false, modelo = 'Seminole2', capacidade = 60, tipo = 'carros' },
	{ hash = 1337041428, name = 'serrano', price = 40000, banido = false, modelo = 'Serrano', capacidade = 50, tipo = 'carros' },
	{ hash = 1203490606, name = 'xls', price = 100000, banido = false, modelo = 'Xls', capacidade = 100, tipo = 'carros' },
	{ hash = -432008408, name = 'xls2', price = 8000000, banido = false, modelo = 'Xls2', capacidade = 100, tipo = 'carros' },
	{ hash = -1168952148, name = 'toros', price = 500000, banido = false, modelo = 'Toros', capacidade = 85, tipo = 'carros' },
----------------------------------------------
----------- SEDANS ---------------------------
----------------------------------------------
	{ hash = -1809822327, name = 'asea', price = 30000, banido = false, modelo = 'Asea', capacidade = 20, tipo = 'carros' },
	{ hash = -1903012613, name = 'asterope', price = 40000, banido = false, modelo = 'Asterope', capacidade = 20, tipo = 'carros' },
	{ hash = 906642318, name = 'cog55', price = 150000, banido = false, modelo = 'Cog55', capacidade = 30, tipo = 'carros' },
	{ hash = 704435172, name = 'cog552', price = 6000000, banido = false, modelo = 'Cog552', capacidade = 20, tipo = 'carros' },
	{ hash = -2030171296, name = 'cognoscenti', price = 160000, banido = false, modelo = 'Cognoscenti', capacidade = 30, tipo = 'carros' },
	{ hash = -604842630, name = 'cognoscenti2', price = 6000000, banido = false, modelo = 'Cognoscenti2', capacidade = 20, tipo = 'carros' },
	{ hash = -685276541, name = 'emperor', price = 25000, banido = false, modelo = 'Emperor', capacidade = 40, tipo = 'carros' },
	{ hash = -1883002148, name = 'emperor2', price = 15000, banido = false, modelo = 'Emperor 2', capacidade = 40, tipo = 'carros' },
	{ hash = 1909141499, name = 'fugitive', price = 55000, banido = false, modelo = 'Fugitive', capacidade = 40, tipo = 'carros' },
	{ hash = 75131841, name = 'glendale', price = 40000, banido = false, modelo = 'Glendale', capacidade = 40, tipo = 'carros' },
	{ hash = -1289722222, name = 'ingot', price = 25000, banido = false, modelo = 'Ingot', capacidade = 40, tipo = 'carros' },
	{ hash = 886934177, name = 'intruder', price = 40000, banido = false, modelo = 'Intruder', capacidade = 40, tipo = 'carros' },
	{ hash = -1883869285, name = 'premier', price = 25000, banido = false, modelo = 'Premier', capacidade = 40, tipo = 'carros' },
	{ hash = -1150599089, name = 'primo', price = 45000, banido = false, modelo = 'Primo', capacidade = 40, tipo = 'carros' },
	{ hash = -2040426790, name = 'primo2', price = 80000, banido = false, modelo = 'Primo2', capacidade = 40, tipo = 'carros' },
	{ hash = -14495224, name = 'regina', price = 20000, banido = false, modelo = 'Regina', capacidade = 40, tipo = 'carros' },
	{ hash = 627094268, name = 'romero', price = 340000, banido = false, modelo = 'Romero', capacidade = 10, tipo = 'carros' },
	{ hash = -1477580979, name = 'stanier', price = 55000, banido = false, modelo = 'Stanier', capacidade = 30, tipo = 'carros' },
	{ hash = 1723137093, name = 'stratum', price = 40000, banido = false, modelo = 'Stratum', capacidade = 40, tipo = 'carros' },
	{ hash = -1961627517, name = 'stretch', price = 2000000, banido = false, modelo = 'Stretch', capacidade = 40, tipo = 'carros' },
	{ hash = -1894894188, name = 'surge', price = 158000, banido = false, modelo = 'Surge', capacidade = 20, tipo = 'carros' },
	{ hash = -1008861746, name = 'tailgater', price = 60000, banido = false, modelo = 'Tailgater', capacidade = 40, tipo = 'carros' },
	{ hash = 1373123368, name = 'warrener', price = 55000, banido = false, modelo = 'Warrener', capacidade = 40, tipo = 'carros' },
	{ hash = 1777363799, name = 'washington', price = 45000, banido = false, modelo = 'Washington', capacidade = 40, tipo = 'carros' },
	{ hash = 321186144, name = 'stafford', price = 600000, banido = false, modelo = 'Stafford', capacidade = 50, tipo = 'carros' },
----------------------------------------------
----------- SERVICE --------------------------
----------------------------------------------
	{ hash = -2072933068, name = 'coach', price = 1000, banido = true, modelo = 'Coach', capacidade = 0, tipo = 'work' },
	{ hash = -713569950, name = 'bus', price = 1000, banido = true, modelo = 'Ônibus', capacidade = 0, tipo = 'work' },
	{ hash = 345756458, name = 'pbus2', price = 1000, banido = true, modelo = 'Ônibus de Festa', capacidade = 0, tipo = 'work' },
	{ hash = -956048545, name = 'taxi', price = 1000, banido = true, modelo = 'Taxi', capacidade = 0, tipo = 'work' },
	{ hash = 1917016601, name = 'trash', price = 1000, banido = false, modelo = 'Caminhão de Lixo', capacidade = 0, tipo = 'work' },
	{ hash = -1255698084, name = 'trash2', price = 1000, banido = false, modelo = 'Caminhão de Lixo', capacidade = 0, tipo = 'work' },
----------------------------------------------
----------- SPORTS ---------------------------
----------------------------------------------
	{ hash = 767087018, name = 'alpha', price = 200000, banido = false, modelo = 'Alpha', capacidade = 30, tipo = 'carros' },
	{ hash = -1041692462, name = 'banshee', price = 255000, banido = false, modelo = 'Banshee', capacidade = 30, tipo = 'carros' },
	{ hash = 633712403, name = 'banshee2', price = 55000, banido = false, modelo = 'Banshee2', capacidade = 20, tipo = 'carros' },
	{ hash = 1274868363, name = 'bestiagts', price = 1600000, banido = false, modelo = 'Bestiagts', capacidade = 30, tipo = 'carros' },
	{ hash = -304802106, name = 'buffalo', price = 55000, banido = false, modelo = 'Buffalo', capacidade = 30, tipo = 'carros' },
	{ hash = 736902334, name = 'buffalo2', price = 95000, banido = false, modelo = 'Buffalo2', capacidade = 30, tipo = 'carros' },
	{ hash = 237764926, name = 'buffalo3', price = 800000, banido = false, modelo = 'Buffalo3', capacidade = 30, tipo = 'carros' },
	{ hash = 2072687711, name = 'carbonizzare', price = 350000, banido = false, modelo = 'Carbonizzare', capacidade = 30, tipo = 'carros' },
	{ hash = -1045541610, name = 'comet2', price = 160000, banido = false, modelo = 'Comet2', capacidade = 30, tipo = 'carros' },
	{ hash = -2022483795, name = 'comet3', price = 190000, banido = false, modelo = 'Comet3', capacidade = 30, tipo = 'carros' },
	{ hash = 661493923, name = 'comet5', price = 260000, banido = false, modelo = 'Comet5', capacidade = 30, tipo = 'carros' },
	{ hash = 108773431, name = 'coquette', price = 300000, banido = false, modelo = 'Coquette', capacidade = 30, tipo = 'carros' },
	{ hash = 196747873, name = 'elegy', price = 150000, banido = false, modelo = 'Elegy', capacidade = 30, tipo = 'carros' },
	{ hash = -566387422, name = 'elegy2', price = 380000, banido = false, modelo = 'Elegy2', capacidade = 30, tipo = 'carros' },
	{ hash = -1995326987, name = 'feltzer2', price = 355000, banido = false, modelo = 'Feltzer2', capacidade = 30, tipo = 'carros' },
	{ hash = -1566741232, name = 'feltzer3', price = 55000, banido = false, modelo = 'Feltzer3', capacidade = 30, tipo = 'carros' },
	{ hash = -1089039904, name = 'furoregt', price = 195000, banido = false, modelo = 'Furoregt', capacidade = 30, tipo = 'carros' },
	{ hash = 499169875, name = 'fusilade', price = 95000, banido = false, modelo = 'Fusilade', capacidade = 30, tipo = 'carros' },
	{ hash = 2016857647, name = 'futo', price = 55000, banido = false, modelo = 'Futo', capacidade = 30, tipo = 'carros' },
	{ hash = -1405937764, name = 'infernus2', price = 750000, banido = false, modelo = 'Infernus2', capacidade = 20, tipo = 'carros' },
	{ hash = -1297672541, name = 'jester', price = 400000, banido = false, modelo = 'Jester', capacidade = 30, tipo = 'carros' },
	{ hash = -1106353882, name = 'jester2', price = 455000, banido = false, modelo = 'Jester2', capacidade = 30, tipo = 'carros' },
	{ hash = -214906006, name = 'jester3', price = 255000, banido = false, modelo = 'Jester3', capacidade = 30, tipo = 'carros' },
	{ hash = 544021352, name = 'khamelion', price = 705000, banido = false, modelo = 'Khamelion', capacidade = 30, tipo = 'carros' },
	{ hash = -1372848492, name = 'kuruma', price = 255000, banido = false, modelo = 'Kuruma', capacidade = 30, tipo = 'carros' },
	{ hash = 410882957, name = 'kuruma2', price = 2000, banido = false, modelo = 'Kuruma 2', capacidade = 30, tipo = 'import'},
	{ hash = 482197771, name = 'lynx', price = 800000, banido = false, modelo = 'Lynx', capacidade = 30, tipo = 'carros' },
	{ hash = -142942670, name = 'massacro', price = 160000, banido = false, modelo = 'Massacro', capacidade = 30, tipo = 'carros' },
	{ hash = -631760477, name = 'massacro2', price = 190000, banido = false, modelo = 'Massacro2', capacidade = 30, tipo = 'carros' },
	{ hash = 1032823388, name = 'ninef', price = 200000, banido = false, modelo = 'Ninef', capacidade = 30, tipo = 'carros' },
	{ hash = -1461482751, name = 'ninef2', price = 210000, banido = false, modelo = 'Ninef2', capacidade = 30, tipo = 'carros' },
	{ hash = -777172681, name = 'omnis', price = 55000, banido = false, modelo = 'Omnis', capacidade = 20, tipo = 'carros' },
	{ hash = -377465520, name = 'penumbra', price = 55000, banido = false, modelo = 'Penumbra', capacidade = 30, tipo = 'carros' },
	{ hash = -1934452204, name = 'rapidgt', price = 60000, banido = false, modelo = 'Rapidgt', capacidade = 20, tipo = 'carros' },
	{ hash = 1737773231, name = 'rapidgt2', price = 65000, banido = false, modelo = 'Rapidgt2', capacidade = 20, tipo = 'carros' },
	{ hash = 719660200, name = 'ruston', price = 1255000, banido = false, modelo = 'Ruston', capacidade = 20, tipo = 'carros' },
	{ hash = -1255452397, name = 'schafter2', price = 55000, banido = false, modelo = 'Schafter2', capacidade = 30, tipo = 'carros' },
	{ hash = -1485523546, name = 'schafter3', price = 95000, banido = false, modelo = 'Schafter3', capacidade = 30, tipo = 'carros' },
	{ hash = 1489967196, name = 'schafter4', price = 640000, banido = false, modelo = 'Schafter4', capacidade = 30, tipo = 'carros' },
	{ hash = -888242983, name = 'schafter5', price = 5000000, banido = false, modelo = 'Schafter5', capacidade = 30, tipo = 'carros' },
	{ hash = -746882698, name = 'schwarzer', price = 270000, banido = false, modelo = 'Schwarzer', capacidade = 30, tipo = 'carros' },
	{ hash = 1104234922, name = 'sentinel3', price = 55000, banido = false, modelo = 'Sentinel3', capacidade = 30, tipo = 'carros' },
	{ hash = -1757836725, name = 'seven70', price = 2500000, banido = false, modelo = 'Seven70', capacidade = 30, tipo = 'carros' },
	{ hash = 1886268224, name = 'specter', price = 800000, banido = false, modelo = 'Specter', capacidade = 20, tipo = 'carros' },
	{ hash = 1074745671, name = 'specter2', price = 910000, banido = false, modelo = 'Specter2', capacidade = 20, tipo = 'carros' },
	{ hash = 970598228, name = 'sultan', price = 155000, banido = false, modelo = 'Sultan', capacidade = 30, tipo = 'carros' },
	{ hash = 384071873, name = 'surano', price = 85000, banido = false, modelo = 'Surano', capacidade = 30, tipo = 'carros' },
	{ hash = -1071380347, name = 'tampa2', price = 335000, banido = false, modelo = 'Tampa2', capacidade = 20, tipo = 'carros' },
	{ hash = 1887331236, name = 'tropos', price = 275000, banido = false, modelo = 'Tropos', capacidade = 20, tipo = 'carros' },
	{ hash = 1102544804, name = 'verlierer2', price = 155000, banido = false, modelo = 'Verlierer2', capacidade = 20, tipo = 'carros' },
	{ hash = -1529242755, name = 'raiden', price = 650000, banido = false, modelo = 'Raiden', capacidade = 30, tipo = 'carros' },
	{ hash = 1115909093, name = 'hotring', price = 180000, banido = false, modelo = 'Hotring', capacidade = 30, tipo = 'carros' },
	{ hash = 1591739866, name = 'deveste', price = 1255000, banido = false, modelo = 'Deveste', capacidade = 30, tipo = 'carros' },
	{ hash = -331467772, name = 'italigto', price = 1500000, banido = false, modelo = 'Italigto', capacidade = 30, tipo = 'carros' },
	{ hash = -1848994066, name = 'neon', price = 855000, banido = false, modelo = 'Neon', capacidade = 30, tipo = 'carros' },
	{ hash = -507495760, name = 'schlagen', price = 655000, banido = false, modelo = 'Schlagen', capacidade = 30, tipo = 'carros' },
	{ hash = -1259134696, name = 'flashgt', price = 355000, banido = false, modelo = 'Flashgt', capacidade = 30, tipo = 'carros' },
	{ hash = 1741861769, name = 'streiter', price = 55000, banido = false, modelo = 'Streiter', capacidade = 30, tipo = 'carros' },
	{ hash = 867799010, name = 'pariah', price = 455000, banido = false, modelo = 'Pariah', capacidade = 30, tipo = 'carros' },
----------------------------------------------
----------- SPORTS CLASSIC -------------------
----------------------------------------------
	{ hash = 159274291, name = 'ardent', price = 455000, banido = false, modelo = 'Ardent', capacidade = 25, tipo = 'carros' },
	{ hash = 117401876, name = 'btype', price = 605000, banido = false, modelo = 'Btype', capacidade = 25, tipo = 'carros' },
	{ hash = -831834716, name = 'btype2', price = 505000, banido = false, modelo = 'Btype2', capacidade = 25, tipo = 'carros' },
	{ hash = -602287871, name = 'btype3', price = 605000, banido = false, modelo = 'Btype3', capacidade = 25, tipo = 'carros' },
	{ hash = 941800958, name = 'casco', price = 100000, banido = false, modelo = 'Casco', capacidade = 25, tipo = 'carros' },
	{ hash = 223240013, name = 'cheetah2', price = 450000, banido = false, modelo = 'Cheetah2', capacidade = 20, tipo = 'carros' },
	{ hash = 1011753235, name = 'coquette2', price = 185000, banido = false, modelo = 'Coquette2', capacidade = 25, tipo = 'carros' },
	{ hash = 784565758, name = 'coquette3', price = 200000, banido = false, modelo = 'Coquette3', capacidade = 25, tipo = 'carros' },
	{ hash = 1051415893, name = 'jb700', price = 350000, banido = false, modelo = 'Jb700', capacidade = 25, tipo = 'carros' },
	{ hash = -1660945322, name = 'mamba', price = 400000, banido = false, modelo = 'Mamba', capacidade = 25, tipo = 'carros' },
	{ hash = -2124201592, name = 'manana', price = 55000, banido = false, modelo = 'Manana', capacidade = 25, tipo = 'carros' },
	{ hash = -433375717, name = 'monroe', price = 85000, banido = false, modelo = 'Monroe', capacidade = 20, tipo = 'carros' },
	{ hash = 1830407356, name = 'peyote', price = 75000, banido = false, modelo = 'Peyote', capacidade = 25, tipo = 'carros' },
	{ hash = 1078682497, name = 'pigalle', price = 25000, banido = false, modelo = 'Pigalle', capacidade = 25, tipo = 'carros' },
	{ hash = 1545842587, name = 'stinger', price = 155000, banido = false, modelo = 'Stinger', capacidade = 20, tipo = 'carros' },
	{ hash = -2098947590, name = 'stingergt', price = 205000, banido = false, modelo = 'Stingergt', capacidade = 20, tipo = 'carros' },
	{ hash = 1504306544, name = 'torero', price = 550000, banido = false, modelo = 'Torero', capacidade = 30, tipo = 'carros' },
	{ hash = 464687292, name = 'tornado', price = 1500, banido = false, modelo = 'Tornado', capacidade = 25, tipo = 'carros' },
	{ hash = 1531094468, name = 'tornado2', price = 35000, banido = false, modelo = 'Tornado2', capacidade = 25, tipo = 'carros' },
	{ hash = 1762279763, name = 'tornado3', price = 10000, banido = false, modelo = 'Tornado3', capacidade = 25, tipo = 'carros' },
	{ hash = -2033222435, name = 'tornado4', price = 10000, banido = false, modelo = 'Tornado4', capacidade = 25, tipo = 'carros' },
	{ hash = -1797613329, name = 'tornado5', price = 40000, banido = false, modelo = 'Tornado5', capacidade = 25, tipo = 'carros' },
	{ hash = -1558399629, name = 'tornado6', price = 280000, banido = false, modelo = 'Tornado6', capacidade = 25, tipo = 'carros' },
	{ hash = 758895617, name = 'ztype', price = 550000, banido = false, modelo = 'Ztype', capacidade = 20, tipo = 'carros' },
	{ hash = -2079788230, name = 'gt500', price = 300000, banido = false, modelo = 'Gt500', capacidade = 25, tipo = 'carros' },
	{ hash = 2049897956, name = 'rapidgt3', price = 185000, banido = false, modelo = 'Rapidgt3', capacidade = 40, tipo = 'carros' },
	{ hash = 1841130506, name = 'retinue', price = 40000, banido = false, modelo = 'Retinue', capacidade = 25, tipo = 'carros' },
	{ hash = -988501280, name = 'cheburek', price = 15000, banido = false, modelo = 'Cheburek', capacidade = 25, tipo = 'carros' },
	{ hash = 838982985, name = 'z190', price = 65000, banido = false, modelo = 'Z190', capacidade = 25, tipo = 'carros' },
	{ hash = -982130927, name = 'turismo2', price = 1000000, banido = false, modelo = 'Turismo2', capacidade = 30, tipo = 'carros' },
	{ hash = 1046206681, name = 'michelli', price = 55000, banido = false, modelo = 'Michelli', capacidade = 25, tipo = 'carros' },
	{ hash = 1617472902, name = 'fagaloa', price = 55000, banido = false, modelo = 'Fagaloa', capacidade = 25, tipo = 'carros' },
	{ hash = 500482303, name = 'swinger', price = 505000, banido = false, modelo = 'Swinger', capacidade = 20, tipo = 'carros' },
----------------------------------------------
----------- SUPER ----------------------------
----------------------------------------------
	{ hash = -1216765807, name = 'adder', price = 800000, banido = false, modelo = 'Adder', capacidade = 20, tipo = 'carros' },
	{ hash = -1696146015, name = 'bullet', price = 560000, banido = false, modelo = 'Bullet', capacidade = 20, tipo = 'carros' },
	{ hash = -1311154784, name = 'cheetah', price = 750000, banido = false, modelo = 'Cheetah', capacidade = 20, tipo = 'carros' },
	{ hash = -1291952903, name = 'entityxf', price = 850000, banido = false, modelo = 'Entityxf', capacidade = 20, tipo = 'carros' },
	{ hash = 1426219628, name = 'fmj', price = 905000, banido = false, modelo = 'Fmj', capacidade = 20, tipo = 'carros' },
	{ hash = 1234311532, name = 'gp1', price = 1200000, banido = false, modelo = 'Gp1', capacidade = 20, tipo = 'carros' },
	{ hash = 418536135, name = 'infernus', price = 556000, banido = false, modelo = 'Infernus', capacidade = 20, tipo = 'carros' },
	{ hash = -1232836011, name = 'le7b', price = 1055000, banido = false, modelo = 'le7b', capacidade = 20, tipo = 'carros' },
	{ hash = 1034187331, name = 'nero', price = 1605000, banido = false, modelo = 'Nero', capacidade = 20, tipo = 'carros' },
	{ hash = 1093792632, name = 'nero2', price = 1805000, banido = false, modelo = 'Nero2', capacidade = 20, tipo = 'carros' },
	{ hash = 1987142870, name = 'osiris', price = 900000, banido = false, modelo = 'Osiris', capacidade = 20, tipo = 'carros' },
	{ hash = -1758137366, name = 'penetrator', price = 450000, banido = false, modelo = 'Penetrator', capacidade = 20, tipo = 'carros' },
	{ hash = -1829802492, name = 'pfister811', price = 505000, banido = false, modelo = 'Pfister811', capacidade = 20, tipo = 'carros' },
	{ hash = 2123327359, name = 'prototipo', price = 2000000, banido = false, modelo = 'Prototipo', capacidade = 20, tipo = 'carros' },
	{ hash = 234062309, name = 'reaper', price = 1005000, banido = false, modelo = 'Reaper', capacidade = 20, tipo = 'carros' },
	{ hash = 819197656, name = 'sheava', price = 355000, banido = false, modelo = 'Sheava', capacidade = 20, tipo = 'carros' },
	{ hash = -295689028, name = 'sultanrs', price = 200000, banido = false, modelo = 'Sultan RS', capacidade = 30, tipo = 'carros' },
	{ hash = 1123216662, name = 'superd', price = 55000, banido = false, modelo = 'Superd', capacidade = 40, tipo = 'carros' },
	{ hash = 1663218586, name = 't20', price = 750000, banido = false, modelo = 'T20', capacidade = 20, tipo = 'carros' },
	{ hash = 272929391, name = 'tempesta', price = 950000, banido = false, modelo = 'Tempesta', capacidade = 20, tipo = 'carros' },
	{ hash = 408192225, name = 'turismor', price = 840000, banido = false, modelo = 'Turismor', capacidade = 20, tipo = 'carros' },
	{ hash = 2067820283, name = 'tyrus', price = 1000000, banido = false, modelo = 'Tyrus', capacidade = 20, tipo = 'carros' },
	{ hash = 338562499, name = 'vacca', price = 550000, banido = false, modelo = 'Vacca', capacidade = 30, tipo = 'carros' },
	{ hash = 1939284556, name = 'vagner', price = 605000, banido = false, modelo = 'Vagner', capacidade = 20, tipo = 'carros' },
	{ hash = -1622444098, name = 'voltic', price = 250000, banido = false, modelo = 'Voltic', capacidade = 20, tipo = 'carros' },
	{ hash = -1403128555, name = 'zentorno', price = 355000, banido = false, modelo = 'Zentorno', capacidade = 20, tipo = 'carros' },
	{ hash = -2048333973, name = 'italigtb', price = 555000, banido = false, modelo = 'Italigtb', capacidade = 20, tipo = 'carros' },
	{ hash = -482719877, name = 'italigtb2', price = 580000, banido = false, modelo = 'Italigtb2', capacidade = 20, tipo = 'carros' },
	{ hash = 917809321, name = 'xa21', price = 600000, banido = false, modelo = 'Xa21', capacidade = 20, tipo = 'carros' },
	{ hash = -313185164, name = 'autarch', price = 15000000, banido = false, modelo = 'Autarch', capacidade = 20, tipo = 'carros' },
	{ hash = 1352136073, name = 'sc1', price = 400000, banido = false, modelo = 'Sc1', capacidade = 20, tipo = 'carros' },
	{ hash = -998177792, name = 'visione', price = 1000000, banido = false, modelo = 'Visione', capacidade = 20, tipo = 'carros' },
	{ hash = -376434238, name = 'tyrant', price = 1200000, banido = false, modelo = 'Tyrant', capacidade = 20, tipo = 'carros' },
	{ hash = -1134706562, name = 'taipan', price = 1100000, banido = false, modelo = 'Taipan', capacidade = 20, tipo = 'carros' },
	{ hash = -2120700196, name = 'entity2', price = 1300000, banido = false, modelo = 'Entity2', capacidade = 20, tipo = 'carros' },
	{ hash = 1909189272, name = 'gb200', price = 55000, banido = false, modelo = 'Gb200', capacidade = 20, tipo = 'carros' },
	{ hash = 1392481335, name = 'cyclone', price = 300000, banido = false, modelo = 'Cyclone', capacidade = 20, tipo = 'carros' },
	{ hash = 1031562256, name = 'tezeract', price = 5640000, banido = false, modelo = 'Tezeract', capacidade = 20, tipo = 'carros' },
----------------------------------------------
----------- TRAILER --------------------------
----------------------------------------------
	{ hash = -1207431159, name = 'armytanker', price = 1000, banido = true, modelo = 'Diesel', capacidade = 0, tipo = 'work' },
	{ hash = 2091594960, name = 'tr4', price = 1000, banido = true, modelo = 'Cars', capacidade = 0, tipo = 'work' },
	{ hash = -1770643266, name = 'tvtrailer', price = 1000, banido = true, modelo = 'Show', capacidade = 0, tipo = 'work' },
	{ hash = 1956216962, name = 'tanker2', price = 1000, banido = true, modelo = 'Gas', capacidade = 0, tipo = 'work' },
	{ hash = 2016027501, name = 'trailerlogs', price = 1000, banido = true, modelo = 'Woods', capacidade = 0, tipo = 'work' },
----------------------------------------------
----------- UTILITY --------------------------
----------------------------------------------
	{ hash = 1560980623, name = 'airtug', price = 370000, banido = false, modelo = 'airtug', capacidade = 0, tipo = 'work' },
	{ hash = 1147287684, name = 'caddy', price = 370000, banido = false, modelo = 'caddy', capacidade = 0, tipo = 'work' },
	{ hash = -599568815, name = 'sadler', price = 420000, banido = false, modelo = 'Sadler', capacidade = 0, tipo = 'work' },
	{ hash = -1323100960, name = 'towtruck', price = 1000, banido = false, modelo = 'Towtruck', capacidade = 0, tipo = 'work' },
	{ hash = -442313018, name = 'towtruck2', price = 1000, banido = false, modelo = 'Towtruck2', capacidade = 0, tipo = 'work' },
	{ hash = 1641462412, name = 'tractor', price = 1000, banido = false, modelo = 'Tractor', capacidade = 0, tipo = 'work' },
	{ hash = -2076478498, name = 'tractor2', price = 1000, banido = false, modelo = 'Tractor2', capacidade = 0, tipo = 'work' },
	{ hash = 1445631933, name = 'tractor3', price = 1000, banido = false, modelo = 'Tractor3', capacidade = 0, tipo = 'work' },
	{ hash = 1088829493, name = 'cg160', price = 0, banido = false, modelo = 'Honda CG 160', capacidade = 10, tipo = 'motos' },


----------------------------------------------
----------- VANS -----------------------------
----------------------------------------------
	{ hash = -16948145, name = 'bison', price = 300000, banido = false, modelo = 'Bison', capacidade = 100, tipo = 'carros' },
	{ hash = 2072156101, name = 'bison2', price = 305000, banido = false, modelo = 'Bison2', capacidade = 100, tipo = 'carros' },
	{ hash = 1739845664, name = 'bison3', price = 310000, banido = false, modelo = 'Bison3', capacidade = 100, tipo = 'carros' },
	{ hash = 1069929536, name = 'bobcatxl', price = 350000, banido = false, modelo = 'Bobcatxl', capacidade = 100, tipo = 'carros' },
	{ hash = -1987130134, name = 'boxville', price = 1000, banido = false, modelo = 'Caminhão', capacidade = 0, tipo = 'work' },
	{ hash = -233098306, name = 'boxville2', price = 1000, banido = false, modelo = 'Caminhão', capacidade = 0, tipo = 'work' },
	{ hash = 121658888, name = 'boxville3', price = 1000, banido = false, modelo = 'Caminhão', capacidade = 0, tipo = 'work' },
	{ hash = 444171386, name = 'boxville4', price = 1000, banido = false, modelo = 'Caminhão', capacidade = 0, tipo = 'work' },
	{ hash = -1346687836, name = 'burrito', price = 670000, banido = false, modelo = 'Burrito', capacidade = 100, tipo = 'carros' },
	{ hash = -907477130, name = 'burrito2', price = 680000, banido = false, modelo = 'Burrito2', capacidade = 100, tipo = 'carros' },
	{ hash = -1743316013, name = 'burrito3', price = 690000, banido = false, modelo = 'Burrito3', capacidade = 100, tipo = 'carros' },
	{ hash = 893081117, name = 'burrito4', price = 650000, banido = false, modelo = 'Burrito4', capacidade = 100, tipo = 'carros' },
	{ hash = -2103821244, name = 'rallytruck', price = 4100000, banido = false, modelo = 'Burrito4', capacidade = 1000, tipo = 'carros' },
	{ hash = 1876516712, name = 'camper', price = 500000, banido = false, modelo = 'Camper', capacidade = 100, tipo = 'carros' },
	{ hash = -1745203402, name = 'gburrito', price = 500000, banido = false, modelo = 'GBurrito', capacidade = 100, tipo = 'carros' },
	{ hash = 296357396, name = 'gburrito2', price = 550000, banido = false, modelo = 'GBurrito2', capacidade = 100, tipo = 'carros' },
	{ hash = -120287622, name = 'journey', price = 250000, banido = false, modelo = 'Journey', capacidade = 100, tipo = 'carros' },
	{ hash = -310465116, name = 'minivan', price = 380000, banido = false, modelo = 'Minivan', capacidade = 70, tipo = 'carros' },
	{ hash = -1126264336, name = 'minivan2', price = 400000, banido = false, modelo = 'Minivan2', capacidade = 70, tipo = 'carros' },
	{ hash = 1488164764, name = 'paradise', price = 450000, banido = false, modelo = 'Paradise', capacidade = 100, tipo = 'carros' },
	{ hash = -119658072, name = 'pony', price = 660000, banido = false, modelo = 'Pony', capacidade = 120, tipo = 'carros' },
	{ hash = 943752001, name = 'pony2', price = 670000, banido = false, modelo = 'Pony2', capacidade = 120, tipo = 'carros' },
	{ hash = 1162065741, name = 'rumpo', price = 670000, banido = false, modelo = 'Rumpo', capacidade = 120, tipo = 'carros' },
	{ hash = -1776615689, name = 'rumpo2', price = 660000, banido = false, modelo = 'Rumpo2', capacidade = 120, tipo = 'carros' },
	{ hash = 1475773103, name = 'rumpo3', price = 1575000, banido = false, modelo = 'Rumpo3', capacidade = 120, tipo = 'carros' },
	{ hash = -810318068, name = 'speedo', price = 650000, banido = false, modelo = 'Speedo', capacidade = 120, tipo = 'carros' },
	{ hash = 728614474, name = 'speedo2', price = 630000, banido = false, modelo = 'Speedo2', capacidade = 120, tipo = 'carros' },
	{ hash = 699456151, name = 'surfer', price = 290000, banido = false, modelo = 'Surfer', capacidade = 90, tipo = 'carros' },
	{ hash = -1311240698, name = 'surfer2', price = 225000, banido = false, modelo = 'Surfer2', capacidade = 90, tipo = 'carros' },
	{ hash = 1951180813, name = 'taco', price = 1000, banido = false, modelo = 'taco', capacidade = 0, tipo = 'carros' },
	{ hash = 65402552, name = 'youga', price = 650000, banido = false, modelo = 'Youga', capacidade = 100, tipo = 'carros' },
	{ hash = 1026149675, name = 'youga2', price = 630000, banido = false, modelo = 'Youga2', capacidade = 120, tipo = 'carros' },
	{ hash = 2038480341, name = 'euros', price = 1000000, banido = false, modelo = 'Euros 370z', capacidade = 120, tipo = 'carros' },

----------------------------------------------
----------- CARRROS V1 -----------------------
----------------------------------------------
	{ hash = 999324520, name = 'bmwm5f90', price = 2000000, banido = false, modelo = 'BMW M5 F90', capacidade = 30, tipo = 'import' },
	{ hash = -1215316954, name = 'c63', price = 2000000, banido = false, modelo = 'Mercedes C63', capacidade = 50, tipo = 'import' },
	{ hash = 1995020435, name = 'celta', price = 2000000, banido = false, modelo = 'Celta', capacidade = 30, tipo = 'import' },
	{ hash = 580861919, name = 'fc15', price = 2000000, banido = false, modelo = 'Ferrari FC15', capacidade = 40, tipo = 'import' },
	{ hash = -959337978, name = '370z16', price = 2000000, banido = false, modelo = 'Nissan 370Z', capacidade = 40, tipo = 'import' },
	{ hash = 122224136, name = '458it', price = 2000000, banido = false, modelo = 'Ferrari 458IT', capacidade = 20, tipo = 'import' },
	{ hash = 362375920, name = '600lt', price = 2000000, banido = false, modelo = 'Mclaren 600LT', capacidade = 20, tipo = 'import' },
	{ hash = -1528734685, name = '718b', price = 1300000, banido = false, modelo = 'Porsche 718', capacidade = 20, tipo = 'import' },
	{ hash = -1362182420, name = 'a452', price = 2000000, banido = false, modelo = 'Mercedes A45', capacidade = 50, tipo = 'import' },
	{ hash = 1878807939, name = 'fnfrx7', price = 2000000, banido = false, modelo = 'Mazda RX7', capacidade = 50, tipo = 'import' },
	{ hash = -60313827, name = 'nissangtr', price = 2000000, banido = false, modelo = 'Nissan GTR', capacidade = 30, tipo = 'import' },
	{ hash = 69730216, name = 'foxshelby', price = 2000000, banido = false, modelo = 'Mustang Shelby', capacidade = 50, tipo = 'import' },
	{ hash = -986071517, name = 'corvettec7', price = 2000000, banido = false, modelo = 'Corvette C7', capacidade = 20, tipo = 'import' },
	{ hash = 653510754, name = 'hondafk8', price = 2000000, banido = false, modelo = 'Honda FK8', capacidade = 50, tipo = 'import' },
	{ hash = 1978088379, name = 'lancerevolutionx', price = 1200000, banido = false, modelo = 'Lancer Evolution', capacidade = 50, tipo = 'import' },
	{ hash = 590709306, name = 'lwgtr', price = 2000000, banido = false, modelo = 'Nissan GTR R35 LW', capacidade = 50, tipo = 'import' },
	{ hash = -418486680, name = 'mercedesgt63', price = 2000000, banido = false, modelo = 'Mercedes GT63', capacidade = 50, tipo = 'import' },
	{ hash = -1686080635, name = 'f250deboxe', price = 2000000, banido = false, modelo = 'F250 Deboxe', capacidade = 40, tipo = 'import' },
	{ hash = 8880015, name = 'rmodcharger69', price = 2000000, banido = false, modelo = 'Charger 69', capacidade = 40, tipo = 'import' },
	{ hash = 1784428761, name = 'rmodjesko', price = 2000000, banido = false, modelo = 'Koenigsegg Jesko', capacidade = 20, tipo = 'import' },
	{ hash = -1222347999, name = 'rmodmk7', price = 2000000, banido = false, modelo = 'Golf MK7', capacidade = 50, tipo = 'import' },
	{ hash = -1835937232, name = 'rmodskyline34', price = 2000000, banido = false, modelo = 'Nissan Skyline R34', capacidade = 50, tipo = 'import' },
	{ hash = -13524981, name = 'bmwm4gts', price = 2000000, banido = false, modelo = 'BMW M4 GTS', capacidade = 30, tipo = 'import' },
	{ hash = 986544975, name = 'dodgecharger', price = 2000000, banido = false, modelo = 'Dodge Charger', capacidade = 30, tipo = 'import' },
	{ hash = 493030188, name = 'amarok', price = 2000000, banido = false, modelo = 'Amarok', capacidade = 80, tipo = 'import' },
	{ hash = 905399718, name = 'a80', price = 2000000, banido = false, modelo = 'Supra A80', capacidade = 40, tipo = 'import' },
	{ hash = -1173768715, name = 'ferrariitalia', price = 2500000, banido = false, modelo = 'Ferrari 458 Italia', capacidade = 20, tipo = 'import' },
	{ hash = -1573350092, name = 'fordmustang', price = 2000000, banido = false, modelo = 'Ford Mustang', capacidade = 30, tipo = 'import' },
	{ hash = -2115506157, name = 'golfmk6', price = 2000000, banido = false, modelo = 'Golf MK6', capacidade = 30, tipo = 'import' },
	{ hash = 1114244595, name = 'lamborghinihuracan', price = 2000000, banido = false, modelo = 'Lamborghini Huracan P', capacidade = 20, tipo = 'import' },
	{ hash = -133349447, name = 'lancerevolution9', price = 2000000, banido = false, modelo = 'Lancer EVO 9', capacidade = 30, tipo = 'import' },
	{ hash = 2034235290, name = 'mazdarx7', price = 2000000, banido = false, modelo = 'Mazda RX7', capacidade = 30, tipo = 'import' },
	{ hash = 1537503531, name = 'mercedesgt63s', price = 2000000, banido = false, modelo = 'Mercedes Gt63s', capacidade = 30, tipo = 'import' },
	{ hash = -4816535, name = 'nissanskyliner34', price = 2000000, banido = false, modelo = 'Skyline R34', capacidade = 30, tipo = 'import' },
	{ hash = 351980252, name = 'teslaprior', price = 1000000, banido = false, modelo = 'Tesla Prior', capacidade = 40, tipo = 'import' },
	{ hash = 723779872, name = 'toyotasupra', price = 1500000, banido = false, modelo = 'Toyota Supra', capacidade = 30, tipo = 'import' },
	{ hash = -739058151, name = 'audir8', price = 1750000, banido = false, modelo = 'Audi R8', capacidade = 20, tipo = 'import' },
	{ hash = 1676738519, name = 'audirs6', price = 2000000, banido = false, modelo = 'Audi RS6', capacidade = 40, tipo = 'import' },
	{ hash = -1540353819, name = 'bmwi8', price = 2000000, banido = false, modelo = 'BMW i8', capacidade = 30, tipo = 'import' },
	{ hash = -910968918, name = 'dodgechallenger', price = 2000000, banido = false, modelo = 'Dodge Challenger', capacidade = 30, tipo = 'import' },
	{ hash = 467774884, name = 'fordfocus', price = 2000000, banido = false, modelo = 'Ford Focus', capacidade = 30, tipo = 'import' },
	{ hash = 1939826804, name = 'jeepcherokee', price = 2000000, banido = false, modelo = 'Jeep Cherokee', capacidade = 50, tipo = 'import' },
	{ hash = 1244065430, name = 'maseratif620', price = 2000000, banido = false, modelo = 'Maserati F620', capacidade = 30, tipo = 'import' },
	{ hash = -2015218779, name = 'nissan370z', price = 2000000, banido = false, modelo = 'Nissan 370z', capacidade = 30, tipo = 'import' },
	{ hash = 68304089, name = 'subarubrz13', price = 2000000, banido = false, modelo = 'Subaru BRZ13', capacidade = 30, tipo = 'import' },

----------------------------------------------
----------- CARRROS V2 -----------------------
----------------------------------------------
	{ hash = -217995216, name = 'amggtc', price = 1200000, banido = false, modelo = 'Mercedes AMG GTR20', capacidade = 40, tipo = 'import' },
	{ hash = -1404319008, name = 'bmwm8', price = 2000000, banido = false, modelo = 'Bmw M8', capacidade = 50, tipo = 'import' },
	{ hash = -1430138530, name = 'bnr34', price = 1500000, banido = false, modelo = 'Nissan Skyline', capacidade = 50, tipo = 'import' },
	{ hash = 898843282, name = 'contss18', price = 2000000, banido = false, modelo = 'Bentley Continental', capacidade = 50, tipo = 'import' },
	{ hash = -221557333, name = 'foxct', price = 2000000, banido = false, modelo = 'Tesla Cyber Truck', capacidade = 40, tipo = 'import' },
	{ hash = -1421258057, name = 'foxevo', price = 2000000, banido = false, modelo = 'Huracan EVO', capacidade = 40, tipo = 'import' },
	{ hash = 1232041052, name = 'foxevos', price = 2000000, banido = false, modelo = 'Huracan EVOs', capacidade = 40, tipo = 'import' },
	{ hash = -2114265264, name = 'golf7gti', price = 2000000, banido = false, modelo = 'Golf Gti', capacidade = 40, tipo = 'import' },
	{ hash = 235772231, name = 'fxxkevo', price = 2000000, banido = false, modelo = 'Ferrari FXX K EVO', capacidade = 20, tipo = 'import' },
	{ hash = -1872809930, name = 'gallardo07', price = 2000000, banido = false, modelo = 'Lamborghini Gallardo', capacidade = 20, tipo = 'import' },
	{ hash = 2140652925, name = 'gle53', price = 2000000, banido = false, modelo = 'Mercedes GLE53', capacidade = 50, tipo = 'import' },
	{ hash = 926685683, name = 'huayrar', price = 2000000, banido = false, modelo = 'Pagani Huayra', capacidade = 20, tipo = 'import' },
	{ hash = 1820118107, name = 'huraperfospy', price = 2000000, banido = false, modelo = 'Lamborghini Spyder', capacidade = 20, tipo = 'import' },
	{ hash = 138058075, name = 'hurper', price = 2000000, banido = false, modelo = 'Lamborghini Huracan', capacidade = 20, tipo = 'import' },
	{ hash = 140254791, name = 'l200', price = 2000000, banido = false, modelo = 'L200 Triton', capacidade = 150, tipo = 'import' },
	{ hash = 382459906, name = 'lamboavj', price = 2000000, banido = false, modelo = 'Lamborghini SVJ', capacidade = 20, tipo = 'import' },
	{ hash = 949614817, name = 'lp700r', price = 2000000, banido = false, modelo = 'Lamborghini LP700R', capacidade = 20, tipo = 'import' },
	{ hash = 329848940, name = 'm5f90', price = 2000000, banido = false, modelo = 'Bmw M5 F90', capacidade = 50, tipo = 'import' },
	{ hash = 99671692, name = 'mercxclass', price = 2000000, banido = false, modelo = 'Mercedes X Class', capacidade = 150, tipo = 'import' },
	{ hash = 194366558, name = 'panamera17turbo', price = 2000000, banido = false, modelo = 'Porsche Panamera', capacidade = 50, tipo = 'import' },
	{ hash = 468395564, name = 'pista', price = 2000000, banido = false, modelo = 'Ferrari Pista', capacidade = 20, tipo = 'import' },
	{ hash = -1385753106, name = 'r8ppi', price = 2000000, banido = false, modelo = 'Audi R8 PPI', capacidade = 50, tipo = 'import' },
	{ hash = 1085789913, name = 'regera', price = 2000000, banido = false, modelo = 'Koenigsegg Regera', capacidade = 20, tipo = 'import' },
	{ hash = -1259375426, name = 'rmodbacalar', price = 1000000, banido = false, modelo = 'Bentley Bacalar', capacidade = 20, tipo = 'import' },
	{ hash = 1734939441, name = 'rmodcamaro', price = 1000000, banido = false, modelo = 'Camaro', capacidade = 40, tipo = 'import' },
	{ hash = 29976887, name = 'rmodf12tdf', price = 1800000, banido = false, modelo = 'Ferrari F12 TDF', capacidade = 40, tipo = 'import' },
	{ hash = -1637862878, name = 'rmodf40', price = 2000000, banido = false, modelo = 'Ferrari F40', capacidade = 20, tipo = 'import' },
	{ hash = 1674460262, name = 'rmodgtr50', price = 2000000, banido = false, modelo = 'Nissan GTR50', capacidade = 50, tipo = 'import' },
	{ hash = -1190838052, name = 'rmodi8ks', price = 2000000, banido = false, modelo = 'Bmw I8', capacidade = 20, tipo = 'import' },
	{ hash = 47055373, name = 'rmodm3e36', price = 2000000, banido = false, modelo = 'Bmw M3 E36', capacidade = 50, tipo = 'import' },
	{ hash = 934775262, name = 'rmodm4gts', price = 950000, banido = false, modelo = 'Bmw M4 GTS', capacidade = 50, tipo = 'import' },
	{ hash = 339065598, name = 'rmodmartin', price = 1100000, banido = false, modelo = 'Aston Martin DB11', capacidade = 20, tipo = 'import' },
	{ hash = -1765254558, name = 'rmodsianr', price = 2000000, banido = false, modelo = 'Lamborghini Sian', capacidade = 20, tipo = 'import' },
	{ hash = 2045784380, name = 'rmodx6', price = 2000000, banido = false, modelo = 'Bmw X6M', capacidade = 60, tipo = 'import' },
	{ hash = 1260387191, name = 'rs7r', price = 2000000, banido = false, modelo = 'Audi RS7 R', capacidade = 60, tipo = 'import' },
	{ hash = 1966489524, name = 's15', price = 2000000, banido = false, modelo = 'Nissan S15', capacidade = 50, tipo = 'import' },
	{ hash = -1136096889, name = 'stingray', price = 2000000, banido = false, modelo = 'Corvette Stingray', capacidade = 20, tipo = 'import' },
	{ hash = -435728526, name = 'teslapd', price = 2000000, banido = false, modelo = 'Tesla S P100D', capacidade = 50, tipo = 'import' },
	{ hash = 1762839497, name = 'tsgr20', price = 2000000, banido = false, modelo = 'Toyota Supra RR', capacidade = 50, tipo = 'import' },
	{ hash = 241596819, name = 'unoescada', price = 2000000, banido = false, modelo = 'Fiat Uno', capacidade = 50, tipo = 'import' },
	{ hash = -520214134, name = 'urus', price = 2000000, banido = false, modelo = 'Lamborghini Urus', capacidade = 50, tipo = 'import' },
	{ hash = -42051018, name = 'veneno', price = 2000000, banido = false, modelo = 'Lamborghini Veneno', capacidade = 20, tipo = 'import' },
	{ hash = -1414722888, name = 'rmodp1gtr', price = 2000000, banido = false, modelo = 'McLaren P1 GTR', capacidade = 20, tipo = 'import' },
	{ hash = 619016222, name = 'rmodessenza', price = 2000000, banido = false, modelo = 'Lamborghini Essenza', capacidade = 20, tipo = 'import' },
	{ hash = -221892567, name = 'rmod240sx', price = 2000000, banido = false, modelo = 'Nissan 240SX', capacidade = 50, tipo = 'import' },
	{ hash = 144259586, name = '911r', price = 2000000, banido = false, modelo = 'Porsche 911r', capacidade = 20, tipo = 'import' },
	{ hash = -654239719, name = 'agerars', price = 2000000, banido = false, modelo = 'Koenigsegg Agera RS', capacidade = 20, tipo = 'import' },
	{ hash = -2133373014, name = 'ahksv', price = 2000000, banido = false, modelo = 'Lamborghini Aventador Sv', capacidade = 20, tipo = 'import' },
	{ hash = -676313463, name = 'fox720m', price = 2000000, banido = false, modelo = 'Mclaren 720s', capacidade = 20, tipo = 'import' },
	{ hash = 1592796651, name = 'foxc8', price = 2000000, banido = false, modelo = 'Corvette C8', capacidade = 20, tipo = 'import' },
	{ hash = 1082938645, name = 'foxgt2', price = 2000000, banido = false, modelo = 'Mclaren GT2', capacidade = 20, tipo = 'import' },
	{ hash = 1203624503, name = 'foxsenna', price = 2000000, banido = false, modelo = 'Mclaren Senna', capacidade = 20, tipo = 'import' },
	{ hash = 980885719, name = 'rmodgt63', price = 2000000, banido = false, modelo = 'Mercedes GT63', capacidade = 40, tipo = 'import' },
	{ hash = -750067359, name = 'rmodbentleygt', price = 2000000, banido = false, modelo = 'Bentley GT', capacidade = 40, tipo = 'import' },
	{ hash = 242156012, name = 'rmodbmwm8', price = 2000000, banido = false, modelo = 'BMW M8', capacidade = 40, tipo = 'import' },
	{ hash = 1734939441, name = 'rmodcamaro', price = 2000000, banido = false, modelo = 'Camaro', capacidade = 30, tipo = 'import' },
	{ hash = 1191498149, name = 'rmodchiron300', price = 2000000, banido = false, modelo = 'Bugatti Chiron HP', capacidade = 20, tipo = 'import' },
	{ hash = -2098155976, name = 'rmodjeep', price = 2000000, banido = false, modelo = 'Jeep Cherokee LW', capacidade = 50, tipo = 'import' },
	{ hash = -192929549, name = 'audirs7', price = 2000000, banido = false, modelo = 'Audi RS7', capacidade = 30, tipo = 'import' },
	{ hash = 1289935896, name = 'pistaspider19', price = 2000000, banido = false, modelo = 'Ferrari 488 Pista S', capacidade = 20, tipo = 'import' },
	{ hash = -1745812157, name = 'rs6wb', price = 2000000, banido = false, modelo = 'Audi RS6 WB', capacidade = 20, tipo = 'import' },
	{ hash = -675592250, name = 'svj63', price = 2000000, banido = false, modelo = 'Lamborghini Aventador SVJ', capacidade = 20, tipo = 'import' },
	{ hash = 366352275, name = 'f8spider', price = 2000000, banido = false, modelo = 'Ferrari F8 S', capacidade = 20, tipo = 'import' },
	{ hash = -378442770, name = 'nc1', price = 2000000, banido = false, modelo = 'Acura NSX NC1', capacidade = 20, tipo = 'import' },
	{ hash = 1966489524, name = 's15', price = 2000000, banido = false, modelo = 'Nissan Silvia S15', capacidade = 40, tipo = 'import' },
	{ hash = -1745789659, name = 'fk8', price = 2000000, banido = false, modelo = 'Honda Civic FK8', capacidade = 40, tipo = 'import' },
	{ hash = -1298373790, name = 'subwrx', price = 2000000, banido = false, modelo = 'Subaru Impreza WRX', capacidade = 40, tipo = 'import' },
	{ hash = -1532987787, name = 'forgt50020', price = 2000000, banido = false, modelo = 'Ford Mustang Shelby', capacidade = 40, tipo = 'import' },
	{ hash = 1125354406, name = 'ocnetrongt', price = 2000000, banido = false, modelo = 'Audi E-Tron', capacidade = 40, tipo = 'import' },
	
----------------------------------------------
----------- MOTOS V2 -------------------------
----------------------------------------------
	{ hash = 1047274985, name = 'africat', price = 260000, banido = false, modelo = 'Africat', capacidade = 40, tipo = 'import' },
	{ hash = 2047166283, name = 'bmws', price = 260000, banido = false, modelo = 'Bmw S1000RR', capacidade = 20, tipo = 'import' },
	{ hash = 494265960, name = 'cb500x', price = 260000, banido = false, modelo = 'Honda 500X', capacidade = 20, tipo = 'import' },
	{ hash = -486920242, name = 'dm1200', price = 260000, banido = false, modelo = 'Ducati 1200', capacidade = 20, tipo = 'import' },
	{ hash = 1303167849, name = 'f4rr', price = 260000, banido = false, modelo = 'MV Augusta F4RR', capacidade = 20, tipo = 'import' },
	{ hash = -688419137, name = 'hayabusa', price = 260000, banido = false, modelo = 'Hayabusa', capacidade = 40, tipo = 'import' },
	{ hash = -1265899455, name = 'hcbr17', price = 260000, banido = false, modelo = 'Honda CBR1000RR', capacidade = 20, tipo = 'import' },
	{ hash = -1667727259, name = 'nh2r', price = 260000, banido = false, modelo = 'Kawasaki Ninja H2R', capacidade = 20, tipo = 'import' },
	{ hash = 1474015055, name = 'r1', price = 260000, banido = false, modelo = 'Yamaha R1', capacidade = 20, tipo = 'import' },
	{ hash = -188978926, name = 'r6', price = 300000, banido = false, modelo = 'Yamaha R6 2018', capacidade = 20, tipo = 'import' },
	{ hash = -359650641, name = 'yzfr6', price = 260000, banido = false, modelo = 'Yamaha R6', capacidade = 20, tipo = 'import' },
	{ hash = -1156537658, name = 'tiger', price = 260000, banido = false, modelo = 'Tiger 800', capacidade = 40, tipo = 'import' },
	{ hash = 1744543800, name = 'z1000', price = 260000, banido = false, modelo = 'Kawasaki Z1000', capacidade = 20, tipo = 'import' },
	{ hash = 991407206, name = 'r1250', price = 260000, banido = false, modelo = 'BMW GS R1200', capacidade = 20, tipo = 'import' },
	{ hash = 341441189, name = 'fz07', price = 260000, banido = false, modelo = 'Yamaha MT-07', capacidade = 20, tipo = 'import' },
	{ hash = -982818719, name = 'cbr17', price = 260000, banido = false, modelo = 'CBR 17', capacidade = 10, tipo = 'import' },
	{ hash = -525917300, name = 'bmws1000', price = 260000, banido = false, modelo = 'BMW S1000RR', capacidade = 10, tipo = 'import' },
	{ hash = 1937232175, name = 'ninjazx10', price = 2000000, banido = false, modelo = 'Ninja Zx10', capacidade = 10, tipo = 'import' },
	{ hash = 681304370, name = 'bmwr1250rocam', price = 2000000, banido = false, modelo = 'Bmw R1250', capacidade = 10, tipo = 'import' },
	{ hash = 342059638, name = 'xj6', price = 2000000, banido = false, modelo = 'XJ-6', capacidade = 10, tipo = 'import' },
	{ hash = -714386060, name = 'zx10r', price = 2000000, banido = false, modelo = 'Kawasaki Zx10r', capacidade = 10, tipo = 'import' },
----------------------------------------------
----------- BARCOS ---------------------------
----------------------------------------------
	{ hash = -861217386, name = 'amels200', price = 2000000, banido = false, modelo = 'Yatch Amels', capacidade = 50, tipo = 'import' },
	{ hash = 1448677353, name = 'tropic2', price = 2000000, banido = false, modelo = 'Yatch Tropic', capacidade = 50, tipo = 'import' },
	{ hash = 1019783291, name = 'yacht2', price = 2000000, banido = false, modelo = 'Yatch', capacidade = 50, tipo = 'import' },
----------------------------------------------
----------- POLICIA --------------------------
----------------------------------------------
	{ hash = -50123501, name = 'Wrgtr', price = 1000, banido = false, modelo = 'Nissan GTR', capacidade = 0, tipo = 'work' },
	{ hash = -74939923, name = 'WRbmwm4', price = 1000, banido = false, modelo = 'Bmw M4', capacidade = 0, tipo = 'work' },
	{ hash = -1666489083, name = 'wrcb500x', price = 1000, banido = false, modelo = 'Cb500x', capacidade = 0, tipo = 'work' },
	{ hash = 431385387, name = 'WRclassxv2', price = 1000, banido = false, modelo = 'Mercedes', capacidade = 0, tipo = 'work' },
	{ hash = -758728264, name = 'WRlancerx', price = 1000, banido = false, modelo = 'Lancer Evo X', capacidade = 0, tipo = 'work' },
	{ hash = -1602618053, name = 'WRtahoe21', price = 1000, banido = false, modelo = 'Tahoe 2021', capacidade = 0, tipo = 'work' },
	{ hash = -1042468582, name = 'WR20x5m', price = 1000, banido = false, modelo = 'Bmw X5M', capacidade = 0, tipo = 'work' },
	
----------------------------------------------
----------- DREAM NEWS -----------------------
----------------------------------------------
	{ hash = 1882073176, name = 'vandreamnews5', price = 1000, banido = false, modelo = 'Van Dream News', capacidade = 0, tipo = 'import'},
----------------------------------------------
----------- MECANICA -------------------------
----------------------------------------------
	{ hash = 884485413, name = 'f150mec', price = 1000, banido = false, modelo = 'F150 DreamCustom', capacidade = 60, tipo = 'work'},
	{ hash = -2098954619, name = 'club', price = 1000, banido = false, modelo = 'Club', capacidade = 60, tipo = 'work'},
	{ hash = 1322123305, name = 'f450c', price = 1000, banido = false, modelo = 'F450 DreamCustom', capacidade = 60, tipo = 'work'},
--- VEICULO DA BENNYS SLAMTRUCK
	{ hash = -1045911276, name = 'slamtruck', price = 1000, banido = false, modelo = 'Slamtruck', capacidade = 0, tipo = 'work'},

----------------------------------------------
----------- BAD ------------------------------
----------------------------------------------
	{ hash = 1295777722, name = 'taycan', price = 2000000, banido = false, modelo = 'Porsche Taycan', capacidade = 60, tipo = 'import'},
	{ hash = 13109281, name = 'jetta1', price = 2000000, banido = false, modelo = 'VW Jetta', capacidade = 60, tipo = 'import'},
	{ hash = -834001553, name = 'aventadors', price = 2000000, banido = false, modelo = 'Aventador BAD', capacidade = 60, tipo = 'import'},
	{ hash = 679104869, name = 'minibc', price = 2000000, banido = false, modelo = 'Mini Moto', capacidade = 60, tipo = 'import'},
	{ hash = 366724942, name = 'sennas', price = 2000000, banido = false, modelo = 'Senna', capacidade = 60, tipo = 'import'},
	{ hash = -704666574, name = 'hilux', price = 2000000, banido = false, modelo = 'Toyota Hilux', capacidade = 100, tipo = 'import'},
	{ hash = -1398152935, name = 'celtach', price = 2000000, banido = false, modelo = 'Chevrolet Celta', capacidade = 40, tipo = 'import'},
	{ hash = -1078573354, name = 'kadett', price = 2000000, banido = false, modelo = 'Chevrolet Kadett', capacidade = 40, tipo = 'import'},
	{ hash = -110704625, name = 's10', price = 2000000, banido = false, modelo = 'Chevrolet S10', capacidade = 120, tipo = 'import'},
	{ hash = 1883881780, name = 'golg2', price = 2000000, banido = false, modelo = 'VW Gol G2', capacidade = 40, tipo = 'import'},
	{ hash = 167397304, name = 'paredao', price = 2000000, banido = false, modelo = 'Paredao de Som', capacidade = 10, tipo = 'import'},
	{ hash = 150895758, name = 'sommarqculuz', price = 2000000, banido = false, modelo = 'Paredao de Som 2', capacidade = 10, tipo = 'import'},
	{ hash = 466040693, name = '370z', price = 2000000, banido = false, modelo = 'Nissan 370z', capacidade = 40, tipo = 'import'},
	{ hash = 1769548661, name = 'c63w205', price = 2000000, banido = false, modelo = 'Mercedes C63W', capacidade = 40, tipo = 'import'},
	{ hash = -228528329, name = 'evo9', price = 2000000, banido = false, modelo = 'Lancer Evolution 9', capacidade = 40, tipo = 'import'},
	{ hash = -1298373790, name = 'subwrx', price = 2000000, banido = false, modelo = 'Subaru Impreza', capacidade = 40, tipo = 'import'},
	{ hash = 964004222, name = 'vetog', price = 2000000, banido = false, modelo = 'Kart', capacidade = 40, tipo = 'work'},
	{ hash = -1965859950, name = 'golgti', price = 2000000, banido = false, modelo = 'Gol Gti', capacidade = 40, tipo = 'import'},
	{ hash = -1632191186, name = 'lancer', price = 2000000, banido = false, modelo = 'Lancer Rebaixado', capacidade = 60, tipo = 'import'},
	{ hash = 650619149, name = 'a45Boost', price = 500000, banido = false, modelo = 'Mercedes A45 Boost', capacidade = 40, tipo = 'import'},
	{ hash = 1751977304, name = 'dm12602', price = 260000, banido = false, modelo = 'Ducati Multistrada', capacidade = 40, tipo = 'import'},

----------------------------------------------
----------- NOVOS ----------------------------
----------------------------------------------
	{ hash = -1863430482, name = '71gtx', price = 2000000, banido = false, modelo = 'Plymounth GTX', capacidade = 60, tipo = 'import'},
	{ hash = -2025387310, name = 'benzsl63', price = 2000000, banido = false, modelo = 'Mercedes SL63', capacidade = 60, tipo = 'import'},
	{ hash = 1603928703, name = 'fusionreba', price = 2000000, banido = false, modelo = 'Ford Fusion', capacidade = 60, tipo = 'import'},
	{ hash = 356442851, name = 'gsxr', price = 260000, banido = false, modelo = 'Suzuki GSX', capacidade = 40, tipo = 'import'},
	{ hash = 859592619, name = 'porsche992', price = 2000000, banido = false, modelo = 'Porsche 992', capacidade = 60, tipo = 'import'},
	{ hash = -1476696782, name = 'rmodmi8lb', price = 2000000, banido = false, modelo = 'BMW i8 LB', capacidade = 60, tipo = 'import'},
	{ hash = -1530300769, name = 'rmodskyline35', price = 2000000, banido = false, modelo = 'Nissan GTR Nismo', capacidade = 60, tipo = 'import'},
	{ hash = -1990820579, name = 'sxr', price = 260000, banido = false, modelo = 'BMW S1000XR', capacidade = 40, tipo = 'import'},
	{ hash = -1409222256, name = 'xre3', price = 260000, banido = false, modelo = 'Honda XRE300', capacidade = 40, tipo = 'import'},
	{ hash = -714386060, name = 'zx10r', price = 260000, banido = false, modelo = 'ZX10R', capacidade = 40, tipo = 'import'},
	{ hash = 436874758, name = 's1000rr', price = 260000, banido = false, modelo = 'S1000RR D', capacidade = 40, tipo = 'import'},
	{ hash = 1487748792, name = 'tradordilan', price = 500000, banido = false, modelo = 'John Deere 6320', capacidade = 60, tipo = 'import'},
	{ hash = -1560751994, name = 'pm19', price = 500000, banido = false, modelo = 'Porsche SUV', capacidade = 120, tipo = 'importvip'},

	{ hash = -322014905, name = 'ferrari812', price = 500000, banido = false, modelo = 'Ferrari 812', capacidade = 120, tipo = 'import'},
	{ hash = 2086119546, name = 'yaluxe', price = 500000, banido = false, modelo = 'Yaych de Luxo', capacidade = 10000, tipo = 'import'},
----------------------------------------------
----------- HOSPITAL -------------------------
----------------------------------------------
	{ hash = 493361920, name = 'sheriffx6', price = 1000, banido = true, modelo = 'Bmw X6', capacidade = 30, tipo = 'work' },
	{ hash = -1549729528, name = 'sprinter3', price = 1000, banido = true, modelo = 'Sprinter CMD', capacidade = 30, tipo = 'work' },
	{ hash = -1311812071, name = 'kawasaki', price = 1000, banido = true, modelo = 'Kawasaki CMD', capacidade = 30, tipo = 'work' },
}

-- RETORNA A LISTA DE VEÍCULOS
config.getVehList = function()
    return config.vehList
end

-- RETORNA AS INFORMAÇÕES CONTIDAS NA LISTA DE UM VEÍCULO ESPECÍFICO
config.getVehicleInfo = function(vehicle)
    for i in ipairs(config.vehList) do
        if vehicle == config.vehList[i].hash or vehicle == config.vehList[i].name then
            return config.vehList[i]
        end
    end
    return false
end

-- RETORNA O MODELO DE UM VEÍCULO ESPECÍFICO (NOME BONITINHO)
config.getVehicleModel = function(vehicle)
    local vehInfo = config.getVehicleInfo(vehicle)
    if vehInfo then
        return vehInfo.modelo or vehicle
    end
    return vehicle
end

-- RETORNA A CAPACIDADE DO PORTA-MALAS DE UM VEÍCULO ESPECÍFICO
config.getVehicleTrunk = function(vehicle)
    local vehInfo = config.getVehicleInfo(vehicle)
    if vehInfo then
        return vehInfo.capacidade or 0
    end
    return 0
end

-- RETORNA O PREÇO DE UM VEÍCULO ESPECÍFICO
config.getVehiclePrice = function(vehicle)
    local vehInfo = config.getVehicleInfo(vehicle)
    if vehInfo then
        return vehInfo.price or 0
    end
    return 0
end

-- RETORNA O TIPO DE UM VEÍCULO ESPECÍFICO
config.getVehicleType = function(vehicle)
    local vehInfo = config.getVehicleInfo(vehicle)
    if vehInfo then
        return vehInfo.tipo or 0
    end
    return "none"
end

-- RETORNA O STATUS DE BANIDO DE UM VEÍCULO ESPECÍFICO
config.isVehicleBanned = function(vehicle)
    local vehInfo = config.getVehicleInfo(vehicle)
    if vehInfo then
        return vehInfo.banido
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYTAX
-----------------------------------------------------------------------------------------------------------------------------------------
config.payTax = function(source,user_id,vehicle)
    if source and user_id and vehicle then
		local vehInfo = config.getVehicleInfo(vehicle)
		local value = vRP.getUData(parseInt(user_id),"vRP:multas")
		local multas = json.decode(value) or 0
		if multas >= 5000 then
			TriggerClientEvent("Notify",source,"amarelo","Você tem mais de <b> $5.000 </b> em  multas pendentes, pague elas antes de tirar algum veículo da garagem.",10000)
			return
		end
        if vehInfo then
            local tipo = vehInfo.class
            if (tipo == "premiums" and vRP.hasPermission(user_id,"naopagaipva.permissao") or  "exclusive2" and vRP.hasPermission(user_id,"naopagaipva.permissao")) or tipo == "rental" then
                TriggerClientEvent("Notify",source,"verde","Veículo <b>Exclusivo (com o vip ativo) ou Alugado</b>, Não será cobrado a taxa de liberação.",10000)
                return true
            elseif tipo ~= "premiums" or tipo ~= "imports" or tipo ~= "carros" or  tipo ~= "motos"   then
                --local price = vehInfo.price
				--local payment = 500 --price * 0.005
				--if vRP.tryFullPayment(user_id,payment) then
					--TriggerClientEvent("Notify",source,"verde","Você pagou: <b>$" ..vRP.format(parseInt(payment)).. "</b> da taxa do veículo (sempre que tira da garagem)" ,10000)
                return true
                --else
                    --TriggerClientEvent("Notify",source,"vermelho","Dinheiro insuficiente para pagar a taxa do veículo (sempre que retira da garagem). Preço: <b>$" ..vRP.format(parseInt(payment)).. "</b>",10000)
                --end
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWMARKER
-----------------------------------------------------------------------------------------------------------------------------------------
config.drawMarker = function(coords,marker) -- funcao para desenhar os markers das garagens no chão
	local idTop = config.markers[marker] or config.markers["carro"] 
	local idBase = 27
	DrawMarker(idTop,coords,0,0,0,0,0,0,1.0,1.0,1.0,153, 102, 255,155,1,1,1,1)
	DrawMarker(idBase,coords.x,coords.y,coords.z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,102, 0, 255,155,0,0,0,1)
--	xpkMarker(coords.x,coords.y,coords.z+0.4, 1.0, 1.0, 1.0, "imagensblips", "garagem")
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
config.showBlips = true -- quando true, mostra os blips das garagens públicas no mapa
config.biciCleta = true -- True Mostra blips dos bicicletários
config.heliPonto = true -- True mostra os helipontos
config.blipId = 357 -- id do blip
config.blipColor = 42 -- cor do blip
config.blipSize = 0.6 -- tamanho do blip
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETAR VEÍCULOS INATIVOS
-----------------------------------------------------------------------------------------------------------------------------------------
config.reset = false -- quando true, deleta os veículos que estão parados durante um determinado tempo
config.tempoReset = 60 -- tempo para deletar um veículo inativo (em minutos)
-----------------------------------------------------------------------------------------------------------------------------------------
-- IMAGENS
-----------------------------------------------------------------------------------------------------------------------------------------
config.defaultImg = "https://svgsilh.com/svg/160895.svg" -- imagem default
config.imgDir = "http://131.196.197.44/vrp_vehicles/" -- url ou diretorio das imagens

-----------------------------------------------------------------
------------- GARAGENS PÚBLICAS E DE SERVIÇO --------------------
-----------------------------------------------------------------

config.garages = {

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR RESIDÊNCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
config.hasHome = function(source,user_id,home)
	if home ~= '' then
		local myHomes = vRP.query("homes/get_homeuserowner",{ user_id = user_id, home = home })
		if myHomes[1] then
			return true 
		end
	end
	TriggerClientEvent("Notify",source,"vermelho","Você não tem acesso à essa residência.",3000)
	return false
end
  