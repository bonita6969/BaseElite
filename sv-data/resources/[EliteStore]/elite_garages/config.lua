---------------------------------------------------------------------------------------------------------
---------------------------------------- [ elite_garages ] ----------------------------------------------
---------------------------------------------------------------------------------------------------------
config = {} -- Não mexer
garages = {} -- Não mexer
config.homeGarages = {} -- Não mexer
texto = "~g~[GARAGEM]\n~w~PRESSIONE ~r~[E]~w~ PARA ACESSAR" -- O que aparece em 3D no "BLIP"

config.dv = "dv.permissao" -- Permissão para o USO do DV
config.car = "spawncar.permissao" -- Permissão para spawnar carros
config.hash = "geral.permissao" -- Permissão para pegar HASH dos veículos
config.travar = "policia.permissao" -- Permissão para fixar carros no chão

config.ipva = 10 -- Taxa para ser paga quando o veiculo estiver com o ipva atrasado (Porcentagem do valor do veículo)
config.multas = 10000 -- Caso o player tenha multa em um valor MAIOR do que definido aqui, não será possivel fazer a retirada o veículo (Valor em R$ não é Porcentagem)
config.detido = 10 -- Taxa para ser paga quando o veiculo for detido (Porcentagem do valor do veículo)
config.retencao = 10 -- Taxa a ser paga quando o veículo se encontra retido (Porcentagem do valor do veículo)
config.seguradora = 0.05 -- Taxa para ser paga quando o veiculo estiver apreendido (Porcentagem do valor do veículo)

garages.workgarage = { -- Aqui você coloca os veículos de cada garagem
	["Policia"] = { -- Repete esse nome aqui em baixo, seguindo os padrões definidos já
		"cdacivic", -- Nome dos carros que aparecerão no BLIP
		"cdaporsche",
		"cda500x",
		"cdapassat",
		"cdaranger",
		"cdac7"
	},

	["PoliciaHeli"] = {
		"cdaheli"
	},

	["Paramedico"] = {
		"cdasprinter"
	},

	["ParamedicoHeli"] = {
		"cdamedicheli"
	},

	["Mecanico"] = {
		"energy450",
		"energyr1200",
		"energyraptor",
		"energyrepair"
	},

	["Correios"] = {
		"cdacaddy"
	},

	["Mineracao"] = {
		"tiptruck"
	},

	["Airport"] = {
		"panto"
	},

	["Motorista"] = {
		"airbus",
		"coach"
	},

	["Ifood"] = {
		"cdaavalanches"
	},

	["Lenhador"] = {
		"rebel"
	},

	["Leiteiro"] = {
		"youga2"
	},
	
	["Taxista"] = {
		"cdataxi"
	},

	["Farmer"] = {
		"tractor2"
	},
}

garages.garages = { -- Aqui você vai defniir as garagens, indepedente de públicas, privadas ou de serviço!
	-----------------------------------------------------------------------------------------------------------------------------------------
	------ [ GARAGENS PÚBLICAS MARCADAS NO MAPA ] -------------------------------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------------
	[1] = { coords = vector3(55.47, -876.17, 30.67), ['name'] = "Garagem", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(51.26, -892.13, 30.17), h = 336.98 },
		[2] = { coords = vector3(47.94, -891.2, 30.17), h = 336.98 },
		[3] = { coords = vector3(44.6, -889.82, 30.19), h = 336.98 },
		[4] = { coords = vector3(41.35, -888.79, 30.19), h = 336.98 },
		[5] = { coords = vector3(38.02, -887.63, 30.2), h = 336.98 },
		[6] = { coords = vector3(39.57, -883.02, 30.27), h = 162.37 },
		[7] = { coords = vector3(42.82, -884.19, 30.26), h = 162.37 },
		[8] = { coords = vector3(46.21, -885.46, 30.25), h = 162.37 },
		[9] = { coords = vector3(49.49, -886.7, 30.24), h = 162.37 },
		[10] = { coords = vector3(52.67, -887.75, 30.24), h = 162.37 },
		[11] = { coords = vector3(50.71, -873.18, 30.44), h = 336.98 },
		[12] = { coords = vector3(47.53, -871.9, 30.46), h = 336.98 },
		[13] = { coords = vector3(44.16, -870.61, 30.47), h = 336.98 },
		[14] = { coords = vector3(47.48, -861.64, 30.61), h = 336.98 },
		[15] = { coords = vector3(50.68, -862.98, 30.59), h = 336.98 },
		[16] = { coords = vector3(54.03, -864.23, 30.58), h = 336.98 },
		[17] = { coords = vector3(57.26, -865.43, 30.57), h = 336.98 },
		[18] = { coords = vector3(60.42, -866.6, 30.56), h = 336.98 }
	},
	[2] = { coords = vector3(-349.28, -874.44, 31.32), ['name'] = "Garagem", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(-343.35, -875.95, 30.41), h = 168.1 },
		[2] = { coords = vector3(-340.11, -876.49, 30.41), h = 168.1 }
	},

	[3] = { coords = vector3(100.94, -1073.27, 29.38), ['name'] = "Garagem", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(119.08, -1070.01, 28.53), h = 359.2 },
		[2] = { coords = vector3(122.32, -1069.48, 28.53), h = 359.2 },
		[3] = { coords = vector3(125.84, -1069.79, 28.53), h = 359.2 },
		[4] = { coords = vector3(129.0, -1069.55, 28.53), h = 359.2 }
	},
	[4] = { coords = vector3(1991.12, 3778.15, 32.19), ['name'] = "Garagem", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(1994.76, 3763.39, 32.19), h = 209.04 },
		[2] = { coords = vector3(1992.44, 3762.03, 32.19), h = 209.04 },
		[3] = { coords = vector3(1990.08, 3760.54, 32.18), h = 209.04 },
	},

	[5] = { coords = vector3(154.57, 6643.41, 31.61), ['name'] = "Garagem", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(147.51, 6639.8, 31.59), h = 319.17 },
		[2] = { coords = vector3(150.55, 6635.8, 31.63), h = 319.17 }
	},

	[6] = { coords = vector3(-39.59, -1116.69, 26.44), ['name'] = "Garagem", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(-47.86, -1116.1, 26.44), h = 352.98 },
		[2] = { coords = vector3(-53.52, -1115.64, 26.44), h = 352.98 }
	},

	[7] = { coords = vector3(1845.83, 2585.76, 45.68), ['name'] = "Garagem", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(1854.51, 2578.67, 45.68), h = 270.98 }
	},

	[8] = { coords = vector3(213.37, -808.28, 31.02), ['name'] = "Garagem", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(219.55, -808.99, 30.69), h = 251.98 },
		[2] = { coords = vector3(220.39, -806.49, 30.7), h = 251.98 },
		[3] = { coords = vector3(221.77, -804.02, 30.69), h = 251.98 },
	},
	-----------------------------------------------------------------------------------------------------------------------------------------
	------ [ GARAGENS PÚBLICAS NÃO MARCADAS NO MAPA ] ---------------------------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------------



	
	-----------------------------------------------------------------------------------------------------------------------------------------
	------ [ GARAGENS DE SERVIÇOS SETADOS ] -------------------------------------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------------
	[9] = { coords = vector3(-487.19, -347.84, 34.51), ['name'] = "Paramedico", ['payment'] = false, ['perm'] = "ems.permissao",
		[1] = { coords = vector3(-488.6, -342.79, 34.37), h = 260.59 },
	},

	[10] = { coords = vector3(-440.55, -331.66, 78.17), ['name'] = "ParamedicoHeli", ['payment'] = false, ['perm'] = "ems.permissao",
		[1] = { coords = vector3(-447.44, -312.51, 78.17), h = 260.59 },
	},

	[11] = { coords = vector3(462.16, -991.04, 25.79), ['name'] = "Policia", ['payment'] = false, ['perm'] = "policia.permissao",
		[1] = { coords = vector3(459.21, -989.04, 25.41), h = 359.47 },
	},

	[12] = { coords = vector3(463.85, -982.07, 43.7), ['name'] = "PoliciaHeli", ['payment'] = false, ['perm'] = "policia.permissao",
		[1] = { coords = vector3(448.89, -980.95, 43.7), h = 89.5 },
	},

	[13] = { coords = vector3(854.12, -2114.11, 30.59), ['name'] = "Mecanico", ['payment'] = false, ['perm'] = "mecanico.permissao",
		[1] = { coords = vector3(851.43, -2123.77, 30.55), h = 265.23 },
	},
	-----------------------------------------------------------------------------------------------------------------------------------------
	------ [ GARAGENS DE SERVIÇOS TEMPORÁRIOS ] ---------------------------------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------------
	[50] = { coords = vector3(55.97, 111.44, 79.2), ['name'] = "Correios", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(63.52, 116.97, 79.1), h = 150.50 },
	},

	[51] = { coords = vector3(2569.29,2720.32,42.96), ['name'] = "Mineracao", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(2582.05,2728.45,42.71), h = 217.41 },
	},

	[52] = { coords = vector3(-1024.17, -2732.72, 13.76), ['name'] = "Airport", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(-1018.45, -2732.27, 13.66), h = 237.49 },
	},

	[53] = { coords = vector3(898.62, -177.02, 73.8), ['name'] = "Taxista", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(899.52, -180.81, 73.85), h = 246.03 },
	},

	[55] = { coords = vector3(1704.69, 4723.22, 42.26), ['name'] = "Leiteiro", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(1700.74, 4722.11, 42.22), h = 198.17 },
	},

	[56] = { coords = vector3(748.61, 6454.36, 31.97), ['name'] = "Farmer", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(743.43, 6455.35, 31.62), h = 85.79 },
	},

	[57] = { coords = vector3(20.36, -1604.74, 29.4), ['name'] = "Ifood", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(21.37, -1607.03, 29.29), h = 136.79 },
	},

	[58] = { coords = vector3(1200.51, -1277.36, 35.58), ['name'] = "Lenhador", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(1200.89, -1270.09, 35.23), h = 253.88 },
	},

	[59] = { coords = vector3(417.07, 6528.33, 27.75), ['name'] = "Leiteiro", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(424.46, 6526.76, 27.69), h = 354.17 },
	},
	[60] = { coords = vector3(453.89, -600.34, 28.59), ['name'] = "Motorista", ['payment'] = false, ['public'] = true,
		[1] = { coords = vector3(465.89, -598.67, 28.47), h = 176.56 },
	},
}