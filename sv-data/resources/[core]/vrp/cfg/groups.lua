---------------------------------------------------------------------------------------------------------
---------------------------------------- [ vrp ] --------------------------------------------------------
---------------------------------------------------------------------------------------------------------
groups = {}

groups.list = {
------------------------------------------------------
--[	Staff ]------------------------------------------------------------------

	["Manager"] = {
		_config = {
			title = "Manager",
			gtype = "staff"
		},
		"baupolicia.permissao", -- Baú da Policia
		"bauhp.permissao", -- Baú do Hospital
		"baumec.permissao", -- Baú da Mecânica
		"bauvermelhos.permissao", -- Baú dos Vermelhos
		"bauazuis.permissao", -- Baú dos Azuis
		"bauroxos.permissao", -- Baú dos Roxos
		"baumw.permissao", -- Baú da Merryweather
		"baumafia.permissao", -- Baú da Máfia
		"baucartel.permissao", -- Baú do Cartel
		"bauplayboy.permissao", -- Baú dos playboy
		"bauthelost.permissao", -- Baú da The Lost
		"bauvanilla.permissao", -- Baú do Vanilla
		"baubahamas.permissao", -- Baú do Bahamas
		"bauanonymous.permissao", -- Baú do Anonymous

		"addhomes.permissao", -- Permissão para adicionar casas
		"remhomes.permissao", -- Permissão para remover casas
		"antiafk.permissao", -- Permissão para não ser kickado por estar AFK
		"cor.permissao", -- Permissão para colocar cor nas armas
		"animacao.permissao", -- Permissão para usar o /e2
		"kill.permissao", -- Permissão para matar qualquer ID
		"reset.permissao", -- Permissão para resetar personagens
		"carregarh.permissao", -- Permissão para Carregar os Players
		"vsync.permissao", -- Permissão para mexer com Tempo e Hora da cidade
		"spawncar.permissao",  -- Spawn de carros
		"god.permissao",  -- Permisão para Reviver
		"godall.permissao",  -- Permisão para Reviver todos do servidor
		"group.permissao", -- Permissão de Setagem
		"vgroup.permissao", -- Permissão para ver setagens globais
		"renomear.permissao", -- Permissão para resetar RG do cidadão
		"geral.permissao", -- Permissão que todos os STAFFs tem (Incuindo suporte)
		"addcar.permissao", -- Permissão para adicionar e remover carros
		"uncuff.permissao", -- Permissão para se desalgemar
		"skin.permissao", -- Permissão para setar skin
		"fix.permissao", -- Permissão para reparar o carro
		"tuning.permissao", -- Permissão para tunar o carro /tuning
		"wl.permissao", -- Permissão adicionar ou Remover Wl /wl /unwl
		"kick.permissao", -- Permissão para expulsar players da cidade
		"kickall.permissao", -- Permissão para expulsar TODOS da cidade
		"ban.permissao", -- Permissão para banir e desbanir players
		"money.permisao", -- Permissão para spawn de DIN no banco
		"noclip.permissao", -- Permissão para dar noclip
		"teleport.permissao", -- Permissão para os TPs
		"limparinv.permissao", -- Permissão para Limpar Inventário do player
		"tratamento.permissao", -- Permissão para dar tratamento e /re
		"spawnitem.permissao", -- Permissão para Spawn de ITEM
		"uservehs.permissao", -- Permissão para ver os carros que o Player tem
		"rg.permissao", -- Permissão para dar /rg
		"detido.permissao", -- Permissão para dar /detido
		"placa.permissao", -- Permissão para dar /placa
		"prender.permissao", -- Permissão para Prender
		"clima.permissao", -- Permissão para mexer no Clima
		"time.permissão", -- Permissão para mexer nas horas /time
		"dv.permissao", -- Permissão para dar DV
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial
		"instagram.permissao", -- Permissão para adicionar verificado no Celular
		"coins.permissao", -- Permissão para adicionar COINS para os players
		"vroupas.permissao", -- Permissão para o uso do comando /vroupas
		"roupas.permissao", -- Permissão para poder usar os comandos de roupas
		"manager.permissao",
		"managersrv.permissao", -- Permissão para sair de serviço STAFF
	},
	
	["ManagerAP"] = {
		_config = {
			title = "Manager OFF",
			gtype = "staff"
		},
		"managerp.permissao" -- Permissão para entrar de serviço STAFF

	},

	["Administrador"] = {
		_config = {
			title = "Administrador",
			gtype = "staff"
		},
		"baupolicia.permissao", -- Baú da Policia
		"bauhp.permissao", -- Baú do Hospital
		"baumec.permissao", -- Baú da Mecânica
		"bauvermelhos.permissao", -- Baú dos Vermelhos
		"bauazuis.permissao", -- Baú dos Azuis
		"bauroxos.permissao", -- Baú dos Roxos
		"baumw.permissao", -- Baú da Merryweather
		"baumafia.permissao", -- Baú da Máfia
		"baucartel.permissao", -- Baú do Cartel
		"bauplayboy.permissao", -- Baú dos playboy
		"bauthelost.permissao", -- Baú da The Lost
		"bauvanilla.permissao", -- Baú do Vanilla
		"baubahamas.permissao", -- Baú do Bahamas

		"antiafk.permissao", -- Permissão para não ser kickado por estar AFK
		"roupas.permissao", -- Permissão para poder usar os comandos de roupas
		"cor.permissao", -- Permissão para colocar cor nas armas
		"animacao.permissao", -- Permissão para usar o /e2
		"kill.permissao", -- Permissão para matar qualquer ID
		"reset.permissao", -- Permissão para resetar personagens
		"vsync.permissao", -- Permissão para mexer com Tempo e Hora da cidade
		"spawncar.permissao", -- Spawn de carros
		"god.permissao",  -- Permisão para Reviver
		"godall.permissao",  -- Permisão para Reviver todos do servidor
		"group.permissao", -- Permissão de Setagem
		"vgroup.permissao", -- Permissão para ver setagens globais
		"renomear.permissao", -- Permissão para resetar RG do cidadão
		"geral.permissao", -- Permissão que todos os STAFFs tem (Incuindo suporte)
		"addcar.permissao", -- Permissão para adicionar e remover carros
		"uncuff.permissao", -- Permissão para se desalgemar
		"skin.permissao", -- Permissão para setar skin
		"fix.permissao", -- Permissão para reparar o carro
		"tuning.permissao", -- Permissão para tunar o carro /tuning
		"wl.permissao", -- Adicionar ou Remover Wl /wl /unwl
		"kick.permissao", -- Permissão para expulsar players da cidade
		"kickall.permissao", -- Permissão para expulsar TODOS da cidade
		"ban.permissao", -- Permissão para banir e desbanir players
		"noclip.permissao", -- Permissão para dar noclip
		"teleport.permissao", -- Permissão para os TPs
		"limparinv.permissao", -- Permissão para Limpar Inventário do player
		"tratamento.permissao", -- Permissão para dar tratamento e /re
		"spawnitem.permissao", -- Permissão para Spawn de ITEM
		"uservehs.permissao", -- Permissão para ver os carros que o Player tem
		"rg.permissao", -- Permissão para dar /rg
		"placa.permissao", -- Permissão para dar /placa
		"detido.permissao", -- Permissão para dar /detido
		"prender.permissao", -- Permissão para Prender
		"carregarh.permissao", -- Permissão para carregar no H
		"clima.permissao", -- Permissão para mexer no Clima
		"time.permissão", -- Permissão para mexer nas horas /time
		"dv.permissao", -- Permissão para dar DV
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial
		"instagram.permissao", -- Permissão para adicionar verificado no Celular
		"coins.permissao", -- Permissão para adicionar COINS para os players
		"vroupas.permissao", -- Permissão para o uso do comando /vroupas
		"administrador.permissao",
		"administradorsrv.permissao" -- Permissão para sair de serviço STAFF
	},
	["AdministradorAP"] = {
		_config = {
			title = "Administrador OFF",
			gtype = "staff"
		},
		"administradorp.permissao" -- Permissão para entrar de serviço STAFF

	},

	["Moderador"] = {
		_config = {
			title = "Moderador(a)",
			gtype = "staff"
		},
		"cor.permissao", -- Permissão para colocar cor nas armas
		"animacao.permissao", -- Permissão para usar o /e2
		"kill.permissao", -- Permissão para matar qualquer ID
		"god.permissao",  -- Permisão para Reviver
		"group.permissao", -- Permissão de Setagem
		"vgroup.permissao", -- Permissão para ver setagens globais
		"geral.permissao", -- Permissão que todos os STAFFs tem (Incuindo suporte)
		"uncuff.permissao", -- Permissão para se desalgemar
		"fix.permissao", -- Permissão para reparar o carro
		"wl.permissao", -- Adicionar ou Remover Wl /wl /unwl
		"kick.permissao", -- Permissão para expulsar players da cidade
		"ban.permissao", -- Permissão para banir e desbanir players
		"noclip.permissao", -- Permissão para dar noclip
		"teleport.permissao", -- Permissão para os TPs
		"limparinv.permissao", -- Permissão para Limpar Inventário do player
		"tratamento.permissao", -- Permissão para dar tratamento e /re
		"uservehs.permissao", -- Permissão para ver os carros que o Player tem
		"rg.permissao", -- Permissão para dar /rg
		"spawncar.permissao", -- Spawn de carros
		"placa.permissao", -- Permissão para dar /placa
		"detido.permissao", -- Permissão para dar /detido
		"carregarh.permissao", -- Permissão para carregar no H
		"dv.permissao", -- Permissão para dar DV
		"renomear.permissao", -- Permissão para resetar RG do cidadão
		"vroupas.permissao", -- Permissão para o uso do comando /vroupas
		"moderador.permissao",
		"moderadorsrv.permissao" -- Permissão para sair de serviço STAFF
	},
	["ModeradorAP"] = {
		_config = {
			title = "Moderador OFF",
			gtype = "staff"
		},
		"moderadorp.permissao" -- Permissão para entrar de serviço STAFF

	},
	["Suporte"] = {
		_config = {
			title = "Suporte",
			gtype = "staff"
		},
		"animacao.permissao", -- Permissão para usar o /e2
		"geral.permissao", -- Permissão que todos os STAFFs tem (Incuindo suporte)
		"god.permissao",  -- Permisão para Reviver
		"fix.permissao", -- Permissão para reparar o carro
		"wl.permissao", -- Adicionar ou Remover Wl /wl /unwl
		"kick.permissao", -- Permissão para expulsar players da cidade
		"noclip.permissao", -- Permissão para dar noclip
		"teleport.permissao", -- Permissão para os TPs
		"rg.permissao", -- Permissão para dar /rg
		"carregarh.permissao", -- Permissão para carregar no H
		"dv.permissao", -- Permissão para dar DV
		"renomear.permissao", -- Permissão para resetar RG do cidadão
		"vroupas.permissao", -- Permissão para o uso do comando /vroupas
		"suporte.permissao",
		"suportesrv.permissao" -- Permissão para sair de serviço STAFF
	},
	["SuporteAP"] = {
		_config = {
			title = "Suporte OFF",
			gtype = "staff"
		},
		"suportep.permissao" -- Permissão para entrar de serviço STAFF

	},
	--[	Civil ]------------------------------------------------
	
	["civil"] = {
		_config = {
			title = "CIVIL",
			gtype = "job"
		},
		"civil.permissao",
		"portas.permissao"
	},
	["Taxista"] = {
		_config = {
			title = "Taxista",
			gtype = "job2"
		},
		"taxista.permissao",
		"portas.permissao"
	},

	--[	Cargos Policiais ]------------------------------------------------

	["Recruta"] = {
		_config = {
			title = "Recruta",
			gtype = "job"
		},
		"portas.permissao",
		"recruta.permissao",
		"carropm.permissao",
		"disparos.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"baupolicia.permissao", -- Acesso ao Baú
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"rg.permissao", -- Permissão para dar /rg
		"placa.permissao", -- Permissão para dar /placa
		"prender.permissao", -- Permissão para Prender
		"algemar.permissao", -- Permissão para algemar
		"carregarh.permissao", -- Permissão para carregar no H
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial
		"policia.permissao",
		"ptr.permissao"
	},

	["RecrutaAP"] = {
		_config = {
			title = "Recruta AP",
			gtype = "job"
		},
		"portas.permissao",
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"recrutaAP.permissao",
		"policiapaisana.permissao"
	},
	------------------------------------------------
	["Soldado"] = {
		_config = {
			title = "Soldado",
			gtype = "job"
		},
		"portas.permissao",
		"soldado.permissao",
		"disparos.permissao",
		"policia.permissao",
		"ptr.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"baupolicia.permissao", -- Acesso ao Baú
		"carregarh.permissao", -- Permissão para carregar no H
		"algemar.permissao", -- Permissão para algemar
		"prender.permissao", -- Permissão para Prender
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"placa.permissao", -- Permissão para dar /placa
		"rg.permissao", -- Permissão para dar /rg
		"tabletpm.permissao" -- Permissão para poder acessar o tablet policial
	},

	["SoldadoAP"] = {
		_config = {
			title = "Soldado AP",
			gtype = "job"
		},
		"portas.permissao",
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"soldadoAP.permissao",
		"policiapaisana.permissao"
	},
	------------------------------------------------
	["Cabo"] = {
		_config = {
			title = "Cabo",
			gtype = "job"
		},
		"portas.permissao",
		"cabo.permissao",
		"carropm.permissao",
		"disparos.permissao",
		"policia.permissao",
		"ptr.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"baupolicia.permissao", -- Acesso ao Baú
		"carregarh.permissao", -- Permissão para carregar no H
		"algemar.permissao", -- Permissão para algemar
		"prender.permissao", -- Permissão para Prender
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"placa.permissao", -- Permissão para dar /placa
		"rg.permissao", -- Permissão para dar /rg
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial

		"baupolicia.permissao"
	},
	["CaboAP"] = {
		_config = {
			title = "Cabo AP",
			gtype = "job"
		},
		"portas.permissao",
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"caboAP.permissao",
		"policiapaisana.permissao"
	},
	------------------------------------------------
	["3Sargento"] = {
		_config = {
			title = "3ºSargento",
			gtype = "job"
		},
		"portas.permissao",
		"3sargento.permissao",
		"disparos.permissao",
		"policia.permissao",
		"carropm.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"baupolicia.permissao", -- Acesso ao Baú
		"carregarh.permissao", -- Permissão para carregar no H
		"algemar.permissao", -- Permissão para algemar
		"prender.permissao", -- Permissão para Prender
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"placa.permissao", -- Permissão para dar /placa
		"rg.permissao", -- Permissão para dar /rg
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial
		"ptr.permissao",
		"baupolicia.permissao"
	},

	["3SargentoAP"] = {
		_config = {
			title = "3º Sargento AP",
			gtype = "job"
		},
		"portas.permissao",
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"3sargentoAP.permissao",
		"policiapaisana.permissao"
	},
	------------------------------------------------
	["2Sargento"] = {
		_config = {
			title = "2º Sargento",
			gtype = "job"
		},
		"portas.permissao",
		"2sargento.permissao",
		"carropm.permissao",
		"disparos.permissao",
		"policia.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"baupolicia.permissao", -- Acesso ao Baú
		"carregarh.permissao", -- Permissão para carregar no H
		"algemar.permissao", -- Permissão para algemar
		"prender.permissao", -- Permissão para Prender
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"placa.permissao", -- Permissão para dar /placa
		"rg.permissao", -- Permissão para dar /rg
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial

		"ptr.permissao",
		"baupolicia.permissao"
	},

	["2SargentoAP"] = {
		_config = {
			title = "2º Sargento AP",
			gtype = "job"
		},
		"portas.permissao",
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"2sargentoAP.permissao",
		"policiapaisana.permissao"
	},
	------------------------------------------------
	["1Sargento"] = {
		_config = {
			title = "1º Sargento",
			gtype = "job"
		},
		"portas.permissao",
		"1sargento.permissao",
		"disparos.permissao",
		"policia.permissao",
		"carropm.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"baupolicia.permissao", -- Acesso ao Baú
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"carregarh.permissao", -- Permissão para carregar no H
		"algemar.permissao", -- Permissão para algemar
		"prender.permissao", -- Permissão para Prender
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"placa.permissao", -- Permissão para dar /placa
		"rg.permissao", -- Permissão para dar /rg
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial

		"ptr.permissao",
		"baupolicia.permissao"
	},

	["1SargentoAP"] = {
		_config = {
			title = "1º Sargento AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"1sargentoAP.permissao",
		"policiapaisana.permissao"
	},
	------------------------------------------------

	["Subtenente"] = {
		_config = {
			title = "SubTenente",
			gtype = "job"
		},
		"portas.permissao",
		"subtenente.permissao",
		"disparos.permissao",
		"policia.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"baupolicia.permissao", -- Acesso ao Baú
		"carregarh.permissao", -- Permissão para carregar no H
		"algemar.permissao", -- Permissão para algemar
		"prender.permissao", -- Permissão para Prender
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"placa.permissao", -- Permissão para dar /placa
		"rg.permissao", -- Permissão para dar /rg
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial

		"carropm.permissao",
		"ptr.permissao",
		"baupolicia.permissao"
	},

	["SubtenenteAP"] = {
		_config = {
			title = "Tenente AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"subtenenteAP.permissao",
		"policiapaisana.permissao"
	},
	------------------------------------------------

	["Tenente"] = {
		_config = {
			title = "Tenente",
			gtype = "job"
		},
		"portas.permissao",
		"tenente.permissao",
		"carropm.permissao",
		"disparos.permissao",
		"policia.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"baupolicia.permissao", -- Acesso ao Baú
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"carregarh.permissao", -- Permissão para carregar no H
		"algemar.permissao", -- Permissão para algemar
		"prender.permissao", -- Permissão para Prender
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"placa.permissao", -- Permissão para dar /placa
		"rg.permissao", -- Permissão para dar /rg
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial

		"ptr.permissao",
		"baupolicia.permissao"
	},

	["TenenteAP"] = {
		_config = {
			title = "Tenente AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"tenenteAP.permissao",
		"policiapaisana.permissao"
	},
------------------------------------------------
	["Capitao"] = {
		_config = {
			title = "Capitão",
			gtype = "job"
		},
		"portas.permissao",
		"capitao.permissao",
		"disparos.permissao",
		"policia.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"baupolicia.permissao", -- Acesso ao Baú
		"carregarh.permissao", -- Permissão para carregar no H
		"algemar.permissao", -- Permissão para algemar
		"prender.permissao", -- Permissão para Prender
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"placa.permissao", -- Permissão para dar /placa
		"rg.permissao", -- Permissão para dar /rg
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial

		"carropm.permissao",
		"ptr.permissao",
		"baupolicia.permissao"
	},

	["CapitaoAP"] = {
		_config = {
			title = "Capitaão AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"capitaoAP.permissao",
		"policiapaisana.permissao"
	},
------------------------------------------------
	["Major"] = {
		_config = {
			title = "Major",
			gtype = "job"
		},
		"portas.permissao",
		"major.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"baupolicia.permissao", -- Acesso ao Baú
		"carregarh.permissao", -- Permissão para carregar no H
		"algemar.permissao", -- Permissão para algemar
		"prender.permissao", -- Permissão para Prender
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"placa.permissao", -- Permissão para dar /placa
		"rg.permissao", -- Permissão para dar /rg
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial

		"carropm.permissao",
		"disparos.permissao",
		"policia.permissao",
		"ptr.permissao",
		"baupolicia.permissao"
	},

	["MajorAP"] = {
		_config = {
			title = "Major AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"majorAP.permissao",
		"policiapaisana.permissao"
	},
	------------------------------------------------
	["Tencoronel"] = {
		_config = {
			title = "Tenente Coronel",
			gtype = "job"
		},
		"portas.permissao",
		"tcel.permissao",
		"carropm.permissao",
		"disparos.permissao",
		"policia.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"baupolicia.permissao", -- Acesso ao Baú
		"carregarh.permissao", -- Permissão para carregar no H
		"algemar.permissao", -- Permissão para algemar
		"prender.permissao", -- Permissão para Prender
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"placa.permissao", -- Permissão para dar /placa
		"rg.permissao", -- Permissão para dar /rg
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial

		"ptr.permissao",
		"baupolicia.permissao"
	},

	["TencoronelAP"] = {
		_config = {
			title = "Tenente Coronel AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"tcelAP.permissao",
		"policiapaisana.permissao"
	},
	------------------------------------------------
	["Coronel"] = {
		_config = {
			title = "Coronel",
			gtype = "job"
		},
		"portas.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"baupolicia.permissao", -- Acesso ao Baú
		"carregarh.permissao", -- Permissão para carregar no H
		"algemar.permissao", -- Permissão para algemar
		"prender.permissao", -- Permissão para Prender
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"placa.permissao", -- Permissão para dar /placa
		"rg.permissao", -- Permissão para dar /rg
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial

		"coronel.permissao",
		"disparos.permissao",
		"policia.permissao",
		"carropm.permissao",
		"ptr.permissao",
		"baupolicia.permissao"
	},

	["CoronelAP"] = {
		_config = {
			title = "Coronel AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"coronelAP.permissao",
		"policiapaisana.permissao"
	},
	------------------------------------------------

	["Subcomandante"] = {
		_config = {
			title = "Sub Comandante",
			gtype = "job"
		},
		"portas.permissao",
		"subcomandante.permissao",
		"disparos.permissao",
		"policia.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"baupolicia.permissao", -- Acesso ao Baú
		"carregarh.permissao", -- Permissão para carregar no H
		"algemar.permissao", -- Permissão para algemar
		"prender.permissao", -- Permissão para Prender
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"placa.permissao", -- Permissão para dar /placa
		"rg.permissao", -- Permissão para dar /rg
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial

		"carropm.permissao",
		"ptr.permissao",
		"baupolicia.permissao"
	},
	

	["SubcomandanteAP"] = {
		_config = {
			title = "Sub Comandante AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"subcomandanteAP.permissao",
		"policiapaisana.permissao"
	},
	------------------------------------------------

	["Comandante"] = {
		_config = {
			title = "Comandante",
			gtype = "job"
		},
		"portas.permissao",
		"comandante.permissao",
		"carropm.permissao",
		"detido.permissao", -- Permissão para dar /detido
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"baupolicia.permissao", -- Acesso ao Baú
		"carregarh.permissao", -- Permissão para carregar no H
		"algemar.permissao", -- Permissão para algemar
		"prender.permissao", -- Permissão para Prender
		"multar.permissao", -- Permissão para dar multas
		"loc.permissao", -- Permissão para enviar e receber loc
		"placa.permissao", -- Permissão para dar /placa
		"rg.permissao", -- Permissão para dar /rg
		"tabletpm.permissao", -- Permissão para poder acessar o tablet policial

		"disparos.permissao",
		"ptr.permissao",
		"policia.permissao",
		"baupolicia.permissao"
	},
	

	["ComandanteAP"] = {
		_config = {
			title = "Comandante AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"comandanteAP.permissao",
		"policiapaisana.permissao"
	},
	--[	Cargos Mecanicos ] --------------------------------------------------------
	--------------------------------------------------------
	
		["Mecanico"] = {
			_config = {
				title = "Mecanico",
				gtype = "job"
			},
			"portas.permissao",
			'mecanico.permissao',
			'mecanico1.permissao',
			"baumec.permissao",
			"reparar.permissao",
			"carromecanico.permissao",
			"toogle.permissao", -- Permissão de acesso ao Blip de serviço
			"funcionariomec.permissao"
		},
	
		["MecanicoAP"] = {
			_config = {
				title = "Mecanico AP",
				gtype = "job"
			},
			"toogle.permissao", -- Permissão de acesso ao Blip de serviço
			"portas.permissao",
			"mecanicoAP.permissao"
		},
	--------------------------------------------------------
	
		["Estagiariomec"] = {
			_config = {
				title = "Mecanico Estagiario",
				gtype = "job"
			},
			"portas.permissao",
			"baumec.permissao",
			"estagiomec.permissao",
			"mecanico.permissao",
			"reparar.permissao",
			"toogle.permissao", -- Permissão de acesso ao Blip de serviço
			"carromecanico.permissao"
		},
	
		["EstagiariomecAP"] = {
			_config = {
				title = "Mecanico Estagiario AP",
				gtype = "job"
			},
			"toogle.permissao", -- Permissão de acesso ao Blip de serviço
			"portas.permissao",
			"estagiariomecAP.permissao"
		},
	--------------------------------------------------------
	
		["Gerentemec"] = {
			_config = {
				title = "Mecanico Gerente",
				gtype = "job"
			},
			"portas.permissao",
			"gerentemec.permissao",
			"baumec.permissao",
			"mecanico.permissao",
			"reparar.permissao",
			"toogle.permissao", -- Permissão de acesso ao Blip de serviço
			"carromecanico.permissao"
		},
	
		["GerentemecAP"] = {
			_config = {
				title = "Mecanico Gerente AP",
				gtype = "job"
			},
			"toogle.permissao", -- Permissão de acesso ao Blip de serviço
			"portas.permissao",
			"gerentemecAP.permissao"
		},
	
		["Lidermec"] = {
			_config = {
				title = "Mecanico Chefe",
				gtype = "job"
			},
			"portas.permissao",
			'lidermec.permissao',
			"baumec.permissao",
			"mecanico.permissao",
			"reparar.permissao",
			"toogle.permissao", -- Permissão de acesso ao Blip de serviço
			"carromecanico.permissao"
		},
	
		["LidermecAP"] = {
			_config = {
				title = "Mecanico Chefe AP",
				gtype = "job"
			},
			"toogle.permissao", -- Permissão de acesso ao Blip de serviço
			"portas.permissao",
			"lidermecanicoAP.permissao"
		},

	--[	Cargos Hospitalares ] 	--------------------------------------------------------
	--------------------------------------------------------
	
	["Enfermeiroems"] = {
		_config = {
			title = "Enfermeiro EMS",
			gtype = "job"
		},
		"portas.permissao",
		"garagemhp.permissao",
		'enfermeiroems.permissao',
		"bauhp.permissao",
		"ems.permissao",
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"carregarh.permissao"
	},
	
	["EnfermeiroemsAP"] = {
		_config = {
			title = "Enfermeiro EMS AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"enfermeiroemsAP.permissao"
	},
	--------------------------------------------------------
	
	["Medicoems"] = {
		_config = {
			title = "Médico EMS",
			gtype = "job"
		},
		"portas.permissao",
		"garagemhp.permissao",
		'medicoems.permissao',
		"bauhp.permissao",
		"ems.permissao",
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"carregarh.permissao"
	},
	
	["MedicoemsAP"] = {
		_config = {
			title = "Médico EMS AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"medicoemsAP.permissao"
	},
	--------------------------------------------------------
	
	["Paramedicoems"] = {
		_config = {
			title = "Paramedico EMS",
			gtype = "job"
		},
		"portas.permissao",
		"garagemhp.permissao",
		'paramedicoems.permissao',
		"bauhp.permissao",
		"ems.permissao",
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"carregarh.permissao"
	},
	
	["ParamedicoemsAP"] = {
		_config = {
			title = "Paramedico EMS AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"paramedicoemsAP.permissao"
	},
	--------------------------------------------------------
	
	["Vicediretorems"] = {
		_config = {
			title = "Vice Diretor EMS",
			gtype = "job"
		},
		"portas.permissao",
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"garagemhp.permissao",
		'vicediretorems.permissao',
		"bauhp.permissao",
		"ems.permissao",
		"carregarh.permissao"
	},
	
	["VicediretoremsAP"] = {
		_config = {
			title = "Vice Diretor EMS AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"vicediretoremsAP.permissao"
	},
	--------------------------------------------------------
	
	["Diretorems"] = {
		_config = {
			title = "Diretor EMS",
			gtype = "job"
		},
		"portas.permissao",
		"garagemhp.permissao",
		'diretorems.permissao',
		"bauhp.permissao",
		"ems.permissao",
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"carregarh.permissao"
	},
	
	["DiretoremsAP"] = {
		_config = {
			title = "Diretor EMS AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"diretoremsAP.permissao"
	},

	--[ Confeitaria ] 	--------------------------------------------------------

	["Liderconfeitaria"] = {
		_config = {
			title = "Chefe Confeitaria",
			gtype = "job"
		},
		"liderconfeitaria.permissao",
		"confeitaria.permissao",
		"bauconfeitaria.permissao",
		"portasconfeitaria.permissao",
		"portas.permissao",
		"toogle.permissao" -- Permissão de acesso ao Blip de serviço
	},
	
	["LiderconfeitariaAP"] = {
		_config = {
			title = "Chefe Confeitaria AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"portasconfeitaria.permissao",
		"liderconfeitariaAP.permissao"
	},
	----------------------------------------------------------

	["Gerenteconfeitaria"] = {
		_config = {
			title = "Gerente Confeitaria",
			gtype = "job"
		},
		"gerenteconfeitaria.permissao",
		"confeitaria.permissao",
		"bauconfeitaria.permissao",
		"portasconfeitaria.permissao",
		"portas.permissao",
		"toogle.permissao" -- Permissão de acesso ao Blip de serviço
	},
	
	["GerenteconfeitariaAP"] = {
		_config = {
			title = "Gerente Confeitaria AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"portasconfeitaria.permissao",
		"gerenteconfeitariaAP.permissao"
	},
	----------------------------------------------------------

	["Confeitaria"] = {
		_config = {
			title = "Funcionário Confeitaria",
			gtype = "job"
		},
		"funcconfeitaria.permissao",
		"confeitaria.permissao",
		"bauconfeitaria.permissao",
		"portasconfeitaria.permissao",
		"portas.permissao",
		"toogle.permissao" -- Permissão de acesso ao Blip de serviço
	},
	
	["ConfeitariaAP"] = {
		_config = {
			title = "Funcionário Confeitaria AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"portasconfeitaria.permissao",
		"funcconfeitariaAP.permissao"
	},
	----------------------------------------------------------

	["Atendenteconfeitaria"] = {
		_config = {
			title = "Confeitaria Atendente",
			gtype = "job"
		},
		"atendenteconfeitaria.permissao",
		"confeitaria.permissao",
		"bauconfeitaria.permissao",
		"portasconfeitaria.permissao",
		"portas.permissao",
		"toogle.permissao" -- Permissão de acesso ao Blip de serviço
	},
	
	["AtendenteconfeitariaAP"] = {
		_config = {
			title = "Confeitaria Atendente AP",
			gtype = "job"
		},
		"toogle.permissao", -- Permissão de acesso ao Blip de serviço
		"portas.permissao",
		"portasconfeitaria.permissao",
		"atendenteconfeitariaAP.permissao"
	},
	--[	Cargos de Facções ] 	--------------------------------------------------------

	["Lidervermelhos"] = {
        _config = {
            title = "Líder Vermelhos",
            gtype = "job"
        },
        "lidervermelhos.permissao",
        "vermelhos.permissao",
        "bauvermelhos.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Gerentevermelhos"] = {
        _config = {
            title = "Gerente Vermelhos",
            gtype = "job"
        },
        "lidervermelhos.permissao",
        "vermelhos.permissao",
        "bauvermelhos.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Vermelhos"] = {
        _config = {
            title = "Vermelhos Membro",
            gtype = "job"
        },
        "vermelhos.permissao",
        "bauvermelhos.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
   ---------------[Verdes Facção]----------------------
    ---------------------------------------------------
    ["Liderverdes"] = {
        _config = {
            title = "Líder Verdes",
            gtype = "job"
        },
        "liderverdes.permissao",
        "verdes.permissao",
        "bauverdes.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Gerenteverdes"] = {
        _config = {
            title = "Gerente Verdes",
            gtype = "job"
        },
        "liderverdes.permissao",
        "verdes.permissao",
        "bauverdes.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Verdes"] = {
        _config = {
            title = "Verdes Membro",
            gtype = "job"
        },
        "verdes.permissao",
        "bauverdes.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ---------------[Azuis Facção]----------------------
    ---------------------------------------------------
    ["Liderazuis"] = {
        _config = {
            title = "Líder Azuis",
            gtype = "job"
        },
        "liderazuis.permissao",
        "azuis.permissao",
        "bauazuis.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Gerenteazuis"] = {
        _config = {
            title = "Gerente Azuis",
            gtype = "job"
        },
        "liderazuis.permissao",
        "azuis.permissao",
        "bauazuis.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Azuis"] = {
        _config = {
            title = "Azuis Membro",
            gtype = "job"
        },
        "azuis.permissao",
        "bauazuis.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ---------------[Roxos Facção]----------------------
    ---------------------------------------------------
    ["Liderroxos"] = {
        _config = {
            title = "Líder Roxos",
            gtype = "job"
        },
        "liderroxos.permissao",
        "roxos.permissao",
        "bauroxos.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Gerenteroxos"] = {
        _config = {
            title = "Gerente Roxos",
            gtype = "job"
        },
        "liderroxos.permissao",
        "roxos.permissao",
        "bauroxos.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Roxos"] = {
        _config = {
            title = "Roxos Membro",
            gtype = "job"
        },
        "roxos.permissao",
        "bauroxos.permissao",
        "portas.permissao"
    },

	--[	Cargos das ORGs de Munições ] 	--------------------------------------------------------

	-------------------------------------------
	-------------[Merryweather]----------------
	-------------------------------------------
    ["Lidermw"] = {
        _config = {
            title = "Líder Merryweather",
            gtype = "job"
        },
		"lidermw.permissao",
        "mw.permissao",
        "baumw.permissao",
        "portas.permissao",
    },
    ---------------------------------------------------
	["Gerentemw"] = {
        _config = {
            title = "Gerente Merryweather",
            gtype = "job"
        },
		"gerentemw.permissao",
        "mw.permissao",
        "baumw.permissao",
        "portas.permissao",
    },
    ---------------------------------------------------
    ["Mw"] = {
        _config = {
            title = "Merryweather Membro",
            gtype = "job"
        },
        "mw.permissao",
        "baumw.permissao",
        "portas.permissao",
    },

	-------------------------------------------
	---------------[Anonymous]-----------------
	-------------------------------------------
	    ["Lideranonymous"] = {
        _config = {
            title = "Líder Anonymous",
            gtype = "job"
        },
        "lideranonymous.permissao",
        "anonymous.permissao",
        "bauanonymous.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Gerenteanonymous"] = {
        _config = {
            title = "Gerente Anonymous",
            gtype = "job"
        },
        "Gerenteanonymous.permissao",
        "anonymous.permissao",
        "bauanonymous.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Anonymous"] = {
        _config = {
            title = "Anonymous Membro",
            gtype = "job"
        },
        "anonymous.permissao",
        "bauanonymous.permissao",
        "portas.permissao"
    },
	--[	Cargos das ORGs Fabricação Armas ] 	--------------------------------------------------------
 	-------------------------------------------
	---------------[Máfia Russa]-------------------
	-------------------------------------------
    ["Lidermafia"] = {
        _config = {
            title = "Líder Máfia Russa",
            gtype = "job"
        },
        "lidermafia.permissao",
        "mafia.permissao",
        "baumafia.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Gerentemafia"] = {
        _config = {
            title = "Gerente Máfia Russa",
            gtype = "job"
        },
        "Gerentemafia.permissao",
        "mafia.permissao",
        "baumafia.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Mafia"] = {
        _config = {
            title = "Máfia Russa Membro",
            gtype = "job"
        },
        "mafia.permissao",
        "baumafia.permissao",
        "portas.permissao"
    },
	-------------------------------------------
	---------------[Cartel]-------------------
	-------------------------------------------
    ["Lidercartel"] = {
        _config = {
            title = "Líder Cartel",
            gtype = "job"
        },
        "lidercartel.permissao",
        "cartel.permissao",
        "baucartel.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Gerentecartel"] = {
        _config = {
            title = "Gerente Cartel",
            gtype = "job"
        },
        "Gerentecartel.permissao",
        "cartel.permissao",
        "baucartel.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Cartel"] = {
        _config = {
            title = "Cartel Membro",
            gtype = "job"
        },
        "cartel.permissao",
        "baucartel.permissao",
        "portas.permissao"
    },

	-------------------------------------------
	---------------[PlayBoy]-------------------
	-------------------------------------------
	["Liderplayboy"] = {
		_config = {
			title = "Lider PlayBoy",
			gtype = "job"
		},
		"liderplayboy.permissao",
		"playboy.permissao",
		"bauplayboy.permissao",
		"portas.permissao"
	},

	["Gerenteplayboy"] = {
		_config = {
			title = "Gerente PlayBoy",
			gtype = "job"
		},
		"gerenteplayboy.permissao",
		"playboy.permissao",
		"bauplayboy.permissao",
		"portas.permissao"
	},
	["Playboy"] = {
		_config = {
			title = "PlayBoy Membro",
			gtype = "job"
		},
		"playboy.permissao",
		"bauplayboy.permissao",
		"portas.permissao"
	},
	-------------------------------------------
	---------------[The LOST]-------------------
	-------------------------------------------
    ---------------------------------------------------
    ["Liderthelost"] = {
        _config = {
            title = "Líder The Lost",
            gtype = "job"
        },
        "liderthelost.permissao",
        "thelost.permissao",
        "bauthelost.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Gerentethelost"] = {
        _config = {
            title = "Gerente The Lost",
            gtype = "job"
        },
        "gerentehelost.permissao",
        "thelost.permissao",
        "bauthelost.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Thelost"] = {
        _config = {
            title = "The Lost Membro",
            gtype = "job"
        },
        "thelost.permissao",
        "bauthelost.permissao",
        "portas.permissao"
    },


	--[	Organização de Lavagem e Bares  ]------------------------------
    ["Lidervanilla"] = {
        _config = {
            title = "Líder Vanilla",
            gtype = "job",
        },
		"lidervanilla.permissao",
        "vanilla.permissao",
        "bauvanilla.permissao",
        "lavar.dinheiro",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Gerentevanilla"] = {
        _config = {
            title = "Gerente Vanilla",
            gtype = "job",
        },
		"gerentevanilla.permissao",
        "vanilla.permissao",
        "bauvanilla.permissao",
        "lavar.dinheiro",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Vanilla"] = {
        _config = {
            title = "Vanilla Membro",
            gtype = "job",
        },
        "vanilla.permissao",
        "bauvanilla.permissao",
        "lavar.dinheiro",
        "portas.permissao"
    },
    ---------------------------------------------------
    -----------------[Bahamas]-------------------------
    ---------------------------------------------------
    ["Liderbahamas"] = {
        _config = {
            title = "Líder Bahamas",
            gtype = "job"
        },
		"liderbahamas.permissao",
        "bahamas.permissao",
        "baubahamas.permissao",
        "lavar.dinheiro",
        "portas.permissao"
    },
    ---------------------------------------------------
	["Gerentebahamas"] = {
        _config = {
            title = "Gerente Bahamas",
            gtype = "job"
        },
		"gerentebahamas.permissao",
        "bahamas.permissao",
        "baubahamas.permissao",
        "lavar.dinheiro",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Bahamas"] = {
        _config = {
            title = "Bahamas Membro",
            gtype = "job"
        },
        "bahamas.permissao",
        "baubahamas.permissao",
        "lavar.dinheiro",
        "portas.permissao"
    },
    ---------------------------------------------------
    -----------------[LARANJAS]-------------------------
    ---------------------------------------------------
    ["Liderlaranjas"] = {
        _config = {
            title = "Líder Laranjas",
            gtype = "job"
        },
		"liderlaranjas.permissao",
        "laranjas.permissao",
        "baularanjas.permissao",
        "desmanche.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
	["Gerentelaranjas"] = {
        _config = {
            title = "Gerente Laranjas",
            gtype = "job"
        },
		"gerentelaranjas.permissao",
        "laranjas.permissao",
        "baularanjas.permissao",
        "desmanche.permissao",
        "portas.permissao"
    },
    ["Laranjas"] = {
		_config = {
			title = "Laranjas Membro",
            gtype = "job"
        },
        "laranjas.permissao",
        "baularanjas.permissao",
		"desmanche.permissao",
        "portas.permissao"
    },
	---------------------------------------------------
    -----------------[LARANJAS]-------------------------
    ---------------------------------------------------
    ---------------------------------------------------
    ["Lideriaa"] = {
        _config = {
            title = "Líder IAA",
            gtype = "job"
        },
		"lideriaa.permissao",
        "iaa.permissao",
        "bauiaa.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
	["Gerenteiaa"] = {
        _config = {
            title = "Gerente IAA",
            gtype = "job"
        },
		"gerenteiaa.permissao",
        "iaa.permissao",
        "bauiaa.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Iaa"] = {
        _config = {
            title = "Iaa Membro",
            gtype = "job"
        },
        "iaa.permissao",
        "bauiaa.permissao",
        "portas.permissao"
    },
	---------------------------------------------------
    ----------------- [WEAZEL NEWS] -------------------
    ---------------------------------------------------
    ---------------------------------------------------
    ["Jornallider"] = {
        _config = {
            title = "Chefe News",
            gtype = "job"
        },
		"liderweazel.permissao",
        "weazel.permissao",
        "bauweazel.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
	["Gerentejornal"] = {
        _config = {
            title = "Gerente News",
            gtype = "job"
        },
		"gerenteweazel.permissao",
        "weazel.permissao",
        "bauweazel.permissao",
        "portas.permissao"
    },
    ---------------------------------------------------
    ["Jornal"] = {
        _config = {
            title = "Func News",
            gtype = "job"
        },
        "weazel.permissao",
        "bauweazel.permissao",
        "portas.permissao"
    },
	---------------------------------------------------
	---------------- [Jurídico] -----------------------
	---------------------------------------------------
    ["Advogado"] = {
        _config = {
            title = "Advogado",
            gtype = "job2"
        },
        "advogado.permissao",
        "bauadv.permissao",
        "portas.permissao"
    },
    ["Juiz"] = {
        _config = {
            title = "Juiz",
            gtype = "job"
        },
        "juiz.permissao",
        "bauadv.permissao",
        "portas.permissao"
    },
    ["Ministrostj"] = {
        _config = {
            title = "Ministro do STJ",
            gtype = "job"
        },
        "ministrostj.permissao",
        "bauadv.permissao",
        "portas.permissao"
    },
    ["Ministrostf"] = {
        _config = {
            title = "Ministro do STF",
            gtype = "job"
        },
        "ministrostf.permissao",
        "bauadv.permissao",
        "portas.permissao"
    },
	--[	Vips ]-------------------------------------------------------------------
	["Elite"] = {
		_config = {
			title = "Elite",
			gtype = "vip9"
		},
		"vip.permissao",
		"attachs.permissao",
		"roupas.permissao",
		"som.permissao",
		"mochila.permissao",
		"cor.permissao",
		"personagens.permissao",
		"instagram.permissao", -- Permissão para adicionar verificado no Celular
		"elite.permissao"
	},
	["Monster"] = {
		_config = {
			title = "Monster",
			gtype = "vip8"
		},
		"vip.permissao",
		"attachs.permissao",
		"roupas.permissao",
		"cor.permissao",
		"som.permissao",
		"personagens.permissao",
		"instagram.permissao", -- Permissão para adicionar verificado no Celular
		"mochila.permissao",
		"monster.permissao"
	},
	["Supremo"] = {
		_config = {
			title = "Supremo",
			gtype = "vip7"
		},
		"vip.permissao",
		"attachs.permissao",
		"roupas.permissao",
		"cor.permissao",
		"mochila.permissao",
		"som.permissao",
		"personagens.permissao",
		"supremo.permissao"
	},
	["Platina"] = {
		_config = {
			title = "Platina",
			gtype = "vip6"
		},
		"vip.permissao",
		"attachs.permissao",
		"roupas.permissao",
		"cor.permissao",
		"personagens.permissao",
		"mochila.permissao",
		"platina.permissao"
	},
	["Ouro"] = {
		_config = {
			title = "Ouro",
			gtype = "vip5"
		},
		"vip.permissao",
		"roupas.permissao",
		"cor.permissao",
		"ouro.permissao"
	},
	["Prata"] = {
		_config = {
			title = "Prata",
			gtype = "vip4"
		},
		"vip.permissao",
		"prata.permissao"
	},
	["Bronze"] = {
		_config = {
			title = "Bronze",
			gtype = "vip3"
		},
		"vip.permissao",
		"bronze.permissao"
	},
	["Streamer"] = {
		_config = {
			title = "Prata",
			gtype = "vip2"
		},
		"vip.permissao",
		"attachs.permissao",
		"cor.permissao",
		"streamer.permissao"
	},
	["MultiChar"] = {
		_config = {
			title = "MultiChar",
			gtype = "MultiChar"
		},
		"multipersonagens.permissao"
	},
	["Spotify"] = {
		_config = {
			title = "Spotify",
			gtype = "vip1"
		},
		"som.permissao"
	},
}