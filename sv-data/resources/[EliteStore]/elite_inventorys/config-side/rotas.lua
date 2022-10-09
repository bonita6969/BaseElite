cfg = {} -- Não mexer
---------------------------------------------------------------------------------------------------------------------------------------
--[ CONFIGURAÇÃO DAS ROTAS ]
-----------------------------------------------------------------------------------------------------------------------------------------
RotasSequenciais = true -- False para rotas Randomicas E True para Rotas Sequenciais iguais (DEIXE TRUE ATÉ ATUALIZARMOS)

ChamarPolicia = true -- True para Chamar a polícia e false para não! (É chamado a polícia em CADA blip pego, necessário notifyPush)

cfg.titulo = 'Coleta' -- Título da Notify que vai aparecer para o policial (Apenas se ChamarPolicia estiver = true)

cfg.codigo = '12' -- Código da ocorrência (Apenas se ChamarPolicia estiver = true)

cfg.mensagem = 'Possível coleta ilegal' -- Mensagem que vai aparecer para o policial (Apenas se ChamarPolicia estiver = true)

cfg.permissao = 'policia.permissao' -- Permissão da Polícia do seu servidor

cfg.segundos = 5   -- Tempo em segundos que o player ficará coletando os itens

cfg.blipCoords = { -- Nome da ORGANIZAÇÃO, PERMISSÃO e COORDENADAS das rotas de cada ORG
  --Nome da Organização          Permissão da Org                          Onde irá coletar  
	['TheLost'] = { ['perm'] = 'thelost.permissao', ['coords'] = vector3(974.56, -95.43, 74.85) },
	
	['Bahamas'] = { ['perm'] = 'bahamas.permissao', ['coords'] = vector3(-1366.03, -624.34, 30.33) }, 
    
	['Mafia'] = { ['perm'] = 'mafia.permissao', ['coords'] = vector3(1393.1, 1160.15, 114.34) },
	
	['Playboy'] = { ['perm'] = 'playboy.permissao', ['coords'] = vector3(-1534.08, 145.81, 55.66) },
	
	['Laranjas'] = { ['perm'] = 'laranjas.permissao', ['coords'] = vector3(111.11, 6621.51, 31.737) },
	
	['Azuis'] = { ['perm'] = 'azuis.permissao', ['coords'] = vector3(826.08, 1058.31, 292.59) },

	['Vagos'] = { ['perm'] = 'vagos.permissao', ['coords'] = vector3(2037.53, 478.49, 168.04) },
	
	['Verdes'] = { ['perm'] = 'verdes.permissao', ['coords'] = vector3(800.07, -294.66, 66.53) },
	
	['Vermelhos'] = { ['perm'] = 'vermelhos.permissao', ['coords'] = vector3(1273.05, -128.32, 84.69) },
	
	['Roxos'] = { ['perm'] = 'roxos.permissao', ['coords'] = vector3(2037.1, 479.35, 168.04) },
	
	['Merryweather'] = { ['perm'] = 'mw.permissao', ['coords'] = vector3(5.56, 537.32, 176.03) },
	
	['Cartel'] = { ['perm'] = 'cartel.permissao', ['coords'] = vector3(-1866.5, 2061.25, 135.44) }, -- 900.28, -3232.65, -98.29 (Bunker)
	
	['Mecanico'] = { ['perm'] = 'mecanico.permissao', ['coords'] = vector3(-195.7, -1320.99, 31.09) },

	['Confeitaria'] = { ['perm'] = 'confeitaria.permissao', ['coords'] = vector3(270.8, -818.87, 29.44) },
}

cfg.blipItem = { -- Colocando dois números a COLETA SERÁ com quantidades RANDÔMICAS colocando apenas um número irá entregar apenas a quantidade escolhida SEMPRE
--  Nome da Organização
	['TheLost'] = { 
		-- Item que será coletado
		['paninho'] = {1,3}, -- {Quantidade Mínima,Quantidade Máxima}
		['aco'] = {1,3},
		['barra-ferro'] = {1,3},
	},

	['Confeitaria'] = { 
		['tomate'] = {1,5},
		['frango2'] = {1,5},
		['ovos'] = {1,5},
		['massa'] = {1,5},
		['leite'] = {1,5},
		['pao'] = {1,5},
		['fermento'] = {1,5},
		['margarina'] = {1,5},
		['morangos'] = {1,5},
		['laranja'] = {1,5},
		['gelo'] = {1,4},
		['acucar'] = {1,5},
		['picole'] = {0,2},
		['sorvete'] = {0,2},
		['dinheiro'] = {50},
	},
	
	['Cartel'] = { 
		['cafe'] = {1,3},
		['garrafa-vazia'] = {1,3},
		['sprunk'] = {1,3},
		['alvejante'] = {1,3},
		['papelada'] = {1,3},
	},
	
	['Verdes'] = { 
		['composito'] = {1,3},
		['acido'] = {1,3},
	},
	
	['Vermelhos'] = { 
		['folha-marijuana'] = {1,3},
		['seda'] = {1,3},
	},
	
	['Azuis'] = { 
		['ergolina'] = {1,3},
		['folhadeselo'] = {1,3},
	},
	
	['Merryweather'] = { 
		['capsulas'] = {1,3},
		['polvora'] = {1,3},
	},
	
	['Playboy'] = { 
		['placa-metal'] = {1,3},
		['molas'] = {1,3},
		['gatilho'] = {1,3},
		['peca-de-arma'] = {1,3},
	},

	['Vagos'] = { 
		['placa-metal'] = {1,3},
		['molas'] = {1,3},
		['gatilho'] = {1,3},
		['peca-de-arma'] = {1,3},
	},
	
	['Laranjas'] = { 
		['paninho'] = {1,3},
		['aco'] = {1,3},
		['barra-ferro'] = {1,3},
	},
	
	-- ['Roxos'] = { 
	-- 	['pasta-base'] = {1,3},
	-- 	['ziplock'] = {1,3},
	-- },
	
	['Bahamas'] = { 
		['aco'] = {1,3},
		['barra-ferro'] = {1,3},
	},		
	
	['Mafia'] = {
		['placa-metal'] = {1,3},
		['molas'] = {1,3},
		['gatilho'] = {1,3},
		['peca-de-arma'] = {1,3},
	},
	
	['Mecanico'] = { 
		['tinta'] = {1,3},
		['papelada'] = {1,3},
	},
}

cfg.entregaCoords = { -- COORDENADAS DAS COLETAS
	vector3(-1965.49,-509.49,11.84),
	vector3(-1008.79,-1015.27,2.16), 
	vector3(192.36,-1883.27,25.06), 
	vector3(-216.53,-1674.28,34.47), 
	vector3(-1274.11,315.63,65.52), 
	vector3(-1856.78,87.58,79.75), 
	vector3(464.25,-787.36,27.36), 
	vector3(-1411.97,-262.32,46.38), 
	vector3(-699.95,-147.0,37.85), 
	vector3(-68.14,214.25,97.23), 
	vector3(-2019.37,-358.24,48.11), 
	vector3(-1213.78,-480.5,32.36),
	vector3(-2952.75,49.77,11.61), 
	vector3(101.48,-222.16,54.64), 
	vector3(844.75,-902.86,25.26), 
	vector3(-3101.4,743.7,21.29), 
	vector3(220.53,112.19,93.48), 
	vector3(-45.1,-1290.09,29.19), 
	vector3(-2066.26,-312.47,13.27), 
	vector3(804.66,-141.74,74.9), 
	vector3(1247.18,-350.08,69.21), 
	vector3(218.07,-19.61,69.9), 
	vector3(650.21,246.23,103.43), 
	vector3(-577.94,-1047.74,25.99),
	vector3(581.11,138.93,99.48), 
	vector3(-1211.72,-402.05,38.1), 
	vector3(551.41,-154.59,57.04), 
	vector3(-490.41,27.94,46.3), 
	vector3(486.18,-591.67,26.22), 
	vector3(-595.31,-1070.44,22.33), 
	vector3(722.3,-2016.35,29.3), 
	vector3(659.76,263.89,102.72), 
	vector3(975.57,-2358.11,31.83),
	vector3(2505.57,-333.52,93.0), 
	vector3(-0.38,301.77,110.92), 
	vector3(-534.35,-2200.81,6.3), 
	vector3(-332.98,98.8,71.22), 
	vector3(-705.81,-1036.31,16.41), 
	vector3(-601.91,-1030.65,22.55), 
	vector3(-1218.87,-1051.64,8.42), 
	vector3(-850.71,-252.02,39.66), 
	vector3(-1613.12,-1028.17,13.16),
	vector3(-1327.1,-189.47,47.89), 
	vector3(-1816.63,-1193.6,14.31), 
	vector3(442.56,-1969.44,24.41), 
	vector3(-1565.66,-231.46,49.47), 
	vector3(-1472.95,-193.1,48.85), 
	vector3(-1546.9,-561.12,33.73), 
	vector3(-1142.7,-1993.51,13.17), 
	vector3(-1361.25,-758.26,22.49),
}

