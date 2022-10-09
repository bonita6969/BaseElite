config = {}
config.no_repair = false
config.showDebug = false -- mostrar modificacoes cada vez q um veiculo é spawnado
config.prices = {

---------tipos de cor-----------

	["colortypes"] = {
		["cromado"] = 2000,  -- + o preco da cor normal
		["metálico"] = 2000,
		["fosco"] = 0,
		["metal"] = 0 
	},

----------cor secundária custom--------
	["cor-secundaria"] = {
		startprice = 3000,
	},	
----------cor primaria custom--------
	["cor-primaria"] = {
		startprice = 3000,
	},
----------cor secundária--------
	["secundaria"] = {
		startprice = 1000,
	},	
----------cor primaria--------
	["primaria"] = {
		startprice = 2000,
	},
----------Perolado--------
	["perolado"] = {
		startprice = 3000,
	},
----------Cor da roda--------
	["wheelcolor"] = {
		startprice = 1000,
	},
----------Neon--------
	["neon"] = {
		startprice = 13000,
	},
----------Pneu custom--------
	["custom"] = {
		startprice = 1000,
	},
----------Pneu a prova de balas--------
	--["bulletproof"] = {
	--	startprice = 240000,
	--},
----------Placa--------
	["placa"] = {
		startprice = 1000,
		increaseby = 0
	},
----------Vidro--------
	["vidro"] = {
		startprice = 3000,
		increaseby = 0
	},
----------Liveries--------
	[48] = {
		startprice = 5000,
		increaseby = 0
	},
	
----------Windows--------
	[46] = {
		startprice = 3000,
		increaseby = 0
	},
	
----------Tank--------
	[45] = {
		startprice = 20000,
		increaseby = 20000
	},
	
----------Trim--------
	[44] = {
		startprice = 1000,
		increaseby = 0
	},
	
----------Aerials--------
	[43] = {
		startprice = 2000,
		increaseby = 0
	},

----------Arch cover--------
	[42] = {
		startprice = 2000,
		increaseby = 0
	},

----------Struts--------
	[41] = {
		startprice = 5000,
		increaseby = 0
	},
	
----------Air filter--------
	[40] = {
		startprice = 2000,
		increaseby = 0
	},
	
----------Engine block--------
	[39] = {
		startprice = 2000,
		increaseby = 0
	},

----------Hydraulics--------
	[38] = {
		startprice = 5000,
		increaseby = 0
	},
	
----------Trunk--------
	[37] = {
		startprice = 4000,
		increaseby = 0
	},

----------Speakers--------
	[36] = {
		startprice = 5000,
		increaseby = 0
	},

----------Plaques--------
	[35] = {
		startprice = 2000,
		increaseby = 0
	},
	
----------Shift leavers--------
	[34] = {
		startprice = 3000,
		increaseby = 0
	},
	
----------Steeringwheel--------
	[33] = {
		startprice = 3000,
		increaseby = 0
	},
	
----------Seats--------
	[32] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Door speaker--------
	[31] = {
		startprice = 5000,
		increaseby = 0
	},

----------Dial--------
	[30] = {
		startprice = 4000,
		increaseby = 0
	},
----------Dashboard--------
	[29] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Ornaments--------
	[28] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Trim--------
	[27] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Vanity plates--------
	[26] = {
		startprice = 3000,
		increaseby = 0
	},
	
----------Plate holder--------
	[25] = {
		startprice = 3000,
		increaseby = 0
	},
---------Back Wheels---------
	[24] = {
		startprice = 5000,
		increaseby = 0
	},
---------Front Wheels---------
	[23] = {
		startprice = 5000,
		increaseby = 0
	},
---------Headlights---------
	[22] = {
		startprice = 15000,
	},
	
----------Turbo---------
	[18] = {
		startprice = 20000,
	},
	
-----------Armor-------------
	[16] = {
		startprice = 20000,
		increaseby = 20000
	},

---------Suspension-----------
	[15] = {
		startprice = 5000,
		increaseby = 5000
	},
-----------Horn----------
    [14] = {
        startprice = 2000,
		increaseby = 0
    },
-----------Transmission-------------
    [13] = {
        startprice = 30000,
		increaseby = 10000
	},
	
-----------Brakes-------------
	[12] = {
        startprice = 10000,
		increaseby = 10000
	},
	
------------Engine----------
	[11] = {
        startprice = 10000,
		increaseby = 10000
	},
    ---------Roof----------
	[10] = {
		startprice = 2000,
		increaseby = 0
	},
	
------------Fenders---------
	[8] = {
		startprice = 4000,
		increaseby = 0
	},
	
------------Hood----------
	[7] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Grille----------
	[6] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Roll cage----------
	[5] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Exhaust----------
	[4] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Skirts----------
	[3] = {
		startprice = 5000,
		increaseby = 0
	},
	
-----------Rear bumpers----------
	[2] = {
		startprice = 5000,
		increaseby = 0
	},
	
----------Front bumpers----------
	[1] = {
		startprice = 5000,
		increaseby = 0
	},
	
----------Spoiler----------
	[0] = {
		startprice = 5000,
		increaseby = 0
	},
}


config.locais = {
	[1] = vec3(875.71, -2125.61, 30.56),
	[2] = vec3(886.98, -2126.52, 30.56),
	[3] = vec3(897.77, -2127.76, 30.56),
	[4] = vec3(909.16, -2128.33, 30.56),
	[5] = vec3(895.91, -2102.09, 30.47),
	[6] = vec3(888.26, -2101.58, 30.47),
	[7] = vec3(-776.78, -2568.14, 13.59),
	[8] = vec3(871.87, -1929.45, 96.09), -- Tunagem de Helicopteros
	[9] = vec3(895.9, -2103.24, 30.47),
	[10] = vec3(903.3, -2103.24, 30.47),
	[11] = vec3(913.58, -2103.6, 30.46),


}

config.permissao = 	"mecanico.permissao"

config.use_vehlist = true

config.use_modelname = false

config.logo = "https://media.discordapp.net/attachments/902679973129773137/980746829555695726/ELC.png"