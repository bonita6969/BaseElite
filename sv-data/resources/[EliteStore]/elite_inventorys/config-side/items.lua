---------------------------------------------------------------------------------------------------------
---------------------------------------- [ VRP ] --------------------------------------------------------
---------------------------------------------------------------------------------------------------------
items = {}

items.list = {
	
	['antisseptico'] = { ['index'] = 'antisseptico', ['name'] = 'antisseptico', ['type'] = 'use', ['weight'] = 0.1 },
	['atadura'] = { ['index'] = 'atadura', ['name'] = 'atadura', ['type'] = 'use', ['weight'] = 0.1 },
	['gaze'] = { ['index'] = 'gaze', ['name'] = 'gaze', ['type'] = 'use', ['weight'] = 0.1 },
	['cartao'] = { ['index'] = 'cartao', ['name'] = 'cartao', ['type'] = 'use', ['weight'] = 0.01 },
	['pendrive'] = { ['index'] = 'pendrive', ['name'] = 'pendrive', ['type'] = 'use', ['weight'] = 0.01 },
	['pano'] = { ['index'] = 'pano', ['name'] = 'pano', ['type'] = 'use', ['weight'] = 0.01 },
	['disco'] = { ['index'] = 'disco', ['name'] = 'disco', ['type'] = 'use', ['weight'] = 0.01 },
	['chave'] = { ['index'] = 'chave', ['name'] = 'chave', ['type'] = 'use', ['weight'] = 0.01 },


	--	['placa-metal'] = { ['index'] = 'algema', ['name'] = 'algema', ['type'] = 'use', ['weight'] = 0.1 },
	['tecido'] = { ['index'] = 'tecido', ['name'] = 'tecido', ['type'] = 'use', ['weight'] = 0.01 },
	['docinho'] = { ['index'] = 'docinho', ['name'] = 'docinho', ['type'] = 'use', ['weight'] = 0.01 },
	['bolored '] = { ['index'] = 'bolored ', ['name'] = 'Bolo Vermelho', ['type'] = 'use', ['weight'] = 0.01 },
	['pasta-alta'] = { ['index'] = 'pasta-alta', ['name'] = 'pasta alta', ['type'] = 'use', ['weight'] = 0.1 },
	['whisky'] = { ['index'] = 'whisky', ['name'] = 'whisky', ['type'] = 'use', ['weight'] = 0.1 },
	['ametista2'] = { ['index'] = 'ametista2', ['name'] = 'Ametista', ['type'] = 'use', ['weight'] = 0.1 },
	['ferro2'] = { ['index'] = 'ferro2', ['name'] = 'ferro2', ['type'] = 'use', ['weight'] = 0.01 },
	['brownie'] = { ['index'] = 'brownie', ['name'] = 'brownie', ['type'] = 'use', ['weight'] = 0.01 },
	['corda'] = { ['index'] = 'corda', ['name'] = 'corda', ['type'] = 'use', ['weight'] = 0.1 },
	['wafer'] = { ['index'] = 'wafer', ['name'] = 'wafer', ['type'] = 'use', ['weight'] = 0.1 },
	['prelean-alta'] = { ['index'] = 'prelean-alta', ['name'] = 'lean alta', ['type'] = 'use', ['weight'] = 0.5 },
	['preabsinto-alta'] = { ['index'] = 'preabsinto-alta', ['name'] = 'absinto alta', ['type'] = 'use', ['weight'] = 0.5 },
	['absinto-alta'] = { ['index'] = 'absinto-alta', ['name'] = 'absinto HQ', ['type'] = 'use', ['weight'] = 0.5 },
	['pecadearma'] = { ['index'] = 'pecadearma', ['name'] = 'peça de arma', ['type'] = 'use', ['weight'] = 0.01 },

	['algema'] = { ['index'] = 'algema', ['name'] = 'algema', ['type'] = 'use', ['weight'] = 0.5 },
	['secador'] = { ['index'] = 'secador', ['name'] = 'secador', ['type'] = 'use', ['weight'] = 0.1 },
	['c4'] = { ['index'] = 'c4', ['name'] = 'c4', ['type'] = 'use', ['weight'] = 0.1 },
	['casino_ticket'] = { ['index'] = 'casino_ticket', ['name'] = 'casino ticket', ['type'] = 'use', ['weight'] = 0.01 },
	['casino_token'] = { ['index'] = 'casino_token', ['name'] = 'casino token', ['type'] = 'use', ['weight'] = 0.01 },
	['engrenagem'] = { ['index'] = 'engrenagem', ['name'] = 'engrenagem', ['type'] = 'use', ['weight'] = 0.05 },
	['vidro'] = { ['index'] = 'vidro', ['name'] = 'vidro', ['type'] = 'use', ['weight'] = 0.05 },
	['macarico'] = { ['index'] = 'macarico', ['name'] = 'macarico', ['type'] = 'use', ['weight'] = 0.05 },
	['estepe'] = { ['index'] = 'estepe', ['name'] = 'estepe', ['type'] = 'use', ['weight'] = 0.05 },
	['ferramentas'] = { ['index'] = 'ferramentas', ['name'] = 'ferramentas', ['type'] = 'use', ['weight'] = 0.05 },
	['acessoalavagem'] = { ['index'] = 'acessoalavagem', ['name'] = 'acesso a lavagem', ['type'] = 'use', ['weight'] = 0.05 },
	['sacodelixo'] = { ['index'] = 'sacodelixo', ['name'] = 'saco de lixo', ['type'] = 'use', ['weight'] = 0.05 },
	['garrafadeleite'] = { ['index'] = 'garrafadeleite', ['name'] = 'garrafa de leite', ['type'] = 'use', ['weight'] = 0.05 },
	['garrafavazia'] = { ['index'] = 'garrafavazia', ['name'] = 'garrafa vazia', ['type'] = 'use', ['weight'] = 0.05 },
	['taurina'] = { ['index'] = 'taurina', ['name'] = 'taurina', ['type'] = 'use', ['weight'] = 0.05 },

	['nitro'] = { ['index'] = 'nitro', ['name'] = 'Nitro', ['type'] = 'use', ['weight'] = 1.5 },
	['queijo'] = { ['index'] = 'queijo', ['name'] = 'Queijo', ['type'] = 'use', ['weight'] = 0.1 },
	['aguamineral'] = { ['index'] = 'aguamineral', ['name'] = 'Agua Mineral', ['type'] = 'use', ['weight'] = 0.1 },
	['raceticket'] = { ['index'] = 'raceticket', ['name'] = 'Race Ticket', ['type'] = 'use', ['weight'] = 0.05 },
	['absinto-alta'] = { ['index'] = 'absinto-alta', ['name'] = 'Absinto HQ', ['type'] = 'use', ['weight'] = 0.1 },
	['taca'] = { ['index'] = 'taca', ['name'] = 'Taça', ['type'] = 'use', ['weight'] = 0.01 },
	['losna'] = { ['index'] = 'losna', ['name'] = 'Losna', ['type'] = 'use', ['weight'] = 0.01 },
	['anis'] = { ['index'] = 'anis', ['name'] = 'Anis', ['type'] = 'use', ['weight'] = 0.01 },
	['funcho'] = { ['index'] = 'funcho', ['name'] = 'Funcho', ['type'] = 'use', ['weight'] = 0.01 },
	['ervas'] = { ['index'] = 'ervas', ['name'] = 'Ervas', ['type'] = 'use', ['weight'] = 0.01 },
	['acucar'] = { ['index'] = 'acucar', ['name'] = 'Açucar', ['type'] = 'use', ['weight'] = 0.001 },
	['salsicha'] = { ['index'] = 'salsicha', ['name'] = 'Salsicha', ['type'] = 'use', ['weight'] = 0.001  },
	['pao'] = { ['index'] = 'pao', ['name'] = 'Pão', ['type'] = 'use', ['weight'] = 0.001 },
	--['tomate'] = { ['index'] = 'tomate', ['name'] = 'Tomate', ['type'] = 'use', ['weight'] = 0.05 },
	['laudo'] = { ['index'] = 'laudo', ['name'] = 'Laudo', ['type'] = 'use', ['weight'] = 0.1 },
	['alface'] = { ['index'] = 'alface', ['name'] = 'Alface', ['type'] = 'use', ['weight'] = 0.001 },
	['carne'] = { ['index'] = 'carne', ['name'] = 'Carne', ['type'] = 'use', ['weight'] = 0.001 },
	['massa'] = { ['index'] = 'massa', ['name'] = 'Massa', ['type'] = 'use', ['weight'] = 0.001 },
	['frango2'] = { ['index'] = 'frango2', ['name'] = 'frango', ['type'] = 'use', ['weight'] = 0.002 },
	['farinha2'] = { ['index'] = 'farinha2', ['name'] = 'Farinha de rosca', ['type'] = 'use', ['weight'] = 0.005 },
	['ovos'] = { ['index'] = 'ovos', ['name'] = 'Ovos', ['type'] = 'use', ['weight'] = 0.005 },
	--['leite'] = { ['index'] = 'leite', ['name'] = 'Leite', ['type'] = 'use', ['weight'] = 0.05 },
	['margarina'] = { ['index'] = 'margarina', ['name'] = 'Margarina', ['type'] = 'use', ['weight'] = 0.01 },
	['fermento'] = { ['index'] = 'fermento', ['name'] = 'Fermento', ['type'] = 'use', ['weight'] = 0.005 },
	['morangos'] = { ['index'] = 'morangos', ['name'] = 'Morangos', ['type'] = 'use', ['weight'] = 0.005 },
	--['torrada'] = { ['index'] = 'torrada', ['name'] = 'torrada', ['type'] = 'use', ['weight'] = 0.1 },
	['bala'] = { ['index'] = 'bala', ['name'] = 'bala', ['type'] = 'use', ['weight'] = 0.05 },
	['gelo'] = { ['index'] = 'gelo', ['name'] = 'gelo', ['type'] = 'use', ['weight'] = 0.05 },
	['codeina'] = { ['index'] = 'codeina', ['name'] = 'codeina', ['type'] = 'use', ['weight'] = 0.05 },
	['refrigerante'] = { ['index'] = 'refrigerante', ['name'] = 'refrigerante', ['type'] = 'use', ['weight'] = 0.05 },
	['alcool'] = { ['index'] = 'alcool', ['name'] = 'alcool', ['type'] = 'use', ['weight'] = 0.05 },
	['copo'] = { ['index'] = 'copo', ['name'] = 'copo', ['type'] = 'use', ['weight'] = 0.05 },
	['fita'] = { ['index'] = 'fita', ['name'] = 'fita', ['type'] = 'use', ['weight'] = 0.05 },
	['fios'] = { ['index'] = 'fios', ['name'] = 'fios', ['type'] = 'use', ['weight'] = 0.05 },
	['controle'] = { ['index'] = 'controle', ['name'] = 'controle', ['type'] = 'use', ['weight'] = 0.05 },
	['armacaodefuradeira'] = { ['index'] = 'armacaodefuradeira', ['name'] = 'Armação furadeira', ['type'] = 'use', ['weight'] = 0.05 },
	['keycard'] = { ['index'] = 'keycard', ['name'] = 'Cartão roubo', ['type'] = 'use', ['weight'] = 0.1 },
	['keycard2'] = { ['index'] = 'keycard2', ['name'] = 'Cartão Reutilizavel', ['type'] = 'use', ['weight'] = 0.05 },
	['pendrivebanco'] = { ['index'] = 'pendrivebanco', ['name'] = 'Pendrive Roubo', ['type'] = 'use', ['weight'] = 0.1 },
	['c4b'] = { ['index'] = 'c4b', ['name'] = 'c4 basica', ['type'] = 'use', ['weight'] = 1.5 },
	['pendrive2'] = { ['index'] = 'pendrive2', ['name'] = 'Pendrive Reutilizavel', ['type'] = 'use', ['weight'] = 0.05 },
	['arame'] = { ['index'] = 'arame', ['name'] = 'arame', ['type'] = 'use', ['weight'] = 0.05 },
	['ferrob'] = { ['index'] = 'ferrob', ['name'] = 'ferro', ['type'] = 'use', ['weight'] = 0.05 },
	--['tinta'] = { ['index'] = 'tinta', ['name'] = 'tinta', ['type'] = 'use', ['weight'] = 0.05 },
	['papel'] = { ['index'] = 'papel', ['name'] = 'papel', ['type'] = 'use', ['weight'] = 0.05 },
	['husky'] = { ['index'] = 'husky', ['name'] = 'Husky', ['type'] = 'use', ['weight'] = 0.05 },
	['pug'] = { ['index'] = 'pug', ['name'] = 'Pug', ['type'] = 'use', ['weight'] = 0.05 },
	['rottweiler'] = { ['index'] = 'rottweiler', ['name'] = 'Rottweiler', ['type'] = 'use', ['weight'] = 0.05 },
	['shepherd'] = { ['index'] = 'shepherd', ['name'] = 'Shepherd', ['type'] = 'use', ['weight'] = 0.05 },
	['westy'] = { ['index'] = 'westy', ['name'] = 'Westy', ['type'] = 'use', ['weight'] = 0.05 },
	['poodle'] = { ['index'] = 'poodle', ['name'] = 'Poodle', ['type'] = 'use', ['weight'] = 0.05 },
	['retriever'] = { ['index'] = 'retriever', ['name'] = 'Retriever', ['type'] = 'use', ['weight'] = 0.05 },
	['cat'] = { ['index'] = 'cat', ['name'] = 'Cat', ['type'] = 'use', ['weight'] = 0.05 },
	['papel'] = { ['index'] = 'papel', ['name'] = 'papel', ['type'] = 'use', ['weight'] = 0.05 },
	['nameChange'] = { ['index'] = 'nameChange', ['name'] = 'Mudar Nome', ['type'] = 'use', ['weight'] = 0.05 },
	['plateChange'] = { ['index'] = 'plateChange', ['name'] = 'Mudar Placa', ['type'] = 'use', ['weight'] = 0.05 },
	['cedulas'] = { ['index'] = 'cedulas', ['name'] = 'cedulas', ['type'] = 'use', ['weight'] = 0.0 },
	['caneta'] = { ['index'] = 'caneta', ['name'] = 'caneta', ['type'] = 'use', ['weight'] = 0.05 },
	['cilindro'] = { ['index'] = 'cilindro', ['name'] = 'cilindro', ['type'] = 'use', ['weight'] = 0.05 },
	['gas'] = { ['index'] = 'gas', ['name'] = 'gas', ['type'] = 'use', ['weight'] = 0.05 },
	['pamonha'] = { ['index'] = 'pamonha', ['name'] = 'pamonha', ['type'] = 'use', ['weight'] = 0.1 },
	['macadoamor'] = { ['index'] = 'macadoamor', ['name'] = 'Maça do amor', ['type'] = 'use', ['weight'] = 0.1 },
	['pacoca'] = { ['index'] = 'pacoca', ['name'] = 'Paçoca', ['type'] = 'use', ['weight'] = 0.1 },
	['milhoverde'] = { ['index'] = 'milhoverde', ['name'] = 'milhoverde', ['type'] = 'use', ['weight'] = 0.1 },
	['lean-alta'] = { ['index'] = 'lean-alta', ['name'] = 'lean HQ', ['type'] = 'use', ['weight'] = 0.1 },
	['coca-alta'] = { ['index'] = 'coca-alta', ['name'] = 'Cocaína HQ"', ['type'] = 'use', ['weight'] = 0.1 },
	['meta-alta'] = { ['index'] = 'meta-alta', ['name'] = 'Metanfetamina HQ', ['type'] = 'use', ['weight'] = 0.5 },
	['vinho1'] = { ['index'] = 'vinho1', ['name'] = 'vinho tinto', ['type'] = 'use', ['weight'] = 0.05 },
	['vinho2'] = { ['index'] = 'vinho2', ['name'] = 'Vinho Branco', ['type'] = 'use', ['weight'] = 0.05 },
	['trufa'] = { ['index'] = 'trufa', ['name'] = 'Trufa', ['type'] = 'use', ['weight'] = 0.1 },
	['bolo1'] = { ['index'] = 'bolo1', ['name'] = 'Bolo', ['type'] = 'use', ['weight'] = 0.1 },
	['aguadecoco'] = { ['index'] = 'aguadecoco', ['name'] = 'Agua de Coco', ['type'] = 'use', ['weight'] = 0.1 },
	['paodealho'] = { ['index'] = 'paodealho', ['name'] = 'Pão de Alho', ['type'] = 'use', ['weight'] = 0.1 },
	['paodequeijo'] = { ['index'] = 'paodequeijo', ['name'] = 'Pão de Queijo', ['type'] = 'use', ['weight'] = 0.1 },
	['sucolaranja'] = { ['index'] = 'sucolaranja', ['name'] = 'Sucolaranja', ['type'] = 'use', ['weight'] = 0.1 },
	['sorvete'] = { ['index'] = 'sorvete', ['name'] = 'sorvete', ['type'] = 'use', ['weight'] = 0.1 },
	['cupcake'] = { ['index'] = 'cupcake', ['name'] = 'Cupcake', ['type'] = 'use', ['weight'] = 0.1 },
	['palha'] = { ['index'] = 'palha', ['name'] = 'palha italiana', ['type'] = 'use', ['weight'] = 0.1 },
	['pipoca'] = { ['index'] = 'pipoca', ['name'] = 'pipoca', ['type'] = 'use', ['weight'] = 0.1 },
	['picole'] = { ['index'] = 'picole', ['name'] = 'picole', ['type'] = 'use', ['weight'] = 0.1 },
	['esfirra'] = { ['index'] = 'esfirra', ['name'] = 'esfirra', ['type'] = 'use', ['weight'] = 0.1 },
	['torrada'] = { ['index'] = 'torrada', ['name'] = 'Torrada', ['type'] = 'use', ['weight'] = 0.2 },
	['torta'] = { ['index'] = 'torta', ['name'] = 'torta', ['type'] = 'use', ['weight'] = 0.1 },
	['paoqueijo'] = { ['index'] = 'paoqueijo', ['name'] = 'Pão de queijo', ['type'] = 'use', ['weight'] = 0.001 },
	['paoalho'] = { ['index'] = 'paoalho', ['name'] = 'Pão de alho', ['type'] = 'use', ['weight'] = 0.1 },
	['espetinhocamarao'] = { ['index'] = 'espetinhocamarao', ['name'] = 'Espetinho de camarao', ['type'] = 'use', ['weight'] = 0.01 },
	['yakisoba'] = { ['index'] = 'yakisoba', ['name'] = 'yakisoba', ['type'] = 'use', ['weight'] = 0.1 },
	['hirudoid'] = { ['index'] = 'hirudoid', ['name'] = 'hirudoid', ['type'] = 'use', ['weight'] = 0.1 },
	['nebacetin'] = { ['index'] = 'nebacetin', ['name'] = 'nebacetin', ['type'] = 'use', ['weight'] = 0.1 },
	['buscopan'] = { ['index'] = 'buscopan', ['name'] = 'buscopan', ['type'] = 'use', ['weight'] = 0.1 },
	['dorflex'] = { ['index'] = 'dorflex', ['name'] = 'dorflex', ['type'] = 'use', ['weight'] = 0.1 },
	['dipirona'] = { ['index'] = 'dipirona', ['name'] = 'dipirona', ['type'] = 'use', ['weight'] = 0.1 },
	['xarelto'] = { ['index'] = 'xarelto', ['name'] = 'xarelto', ['type'] = 'use', ['weight'] = 0.1 },
	['morfina'] = { ['index'] = 'morfina', ['name'] = 'morfina', ['type'] = 'use', ['weight'] = 0.1 },
	['r-xarelto'] = { ['index'] = 'r-xarelto', ['name'] = 'Receita xarelto', ['type'] = 'use', ['weight'] = 0.01 },
	['r-nebacetin'] = { ['index'] = 'r-nebacetin', ['name'] = 'Receita nebacetin', ['type'] = 'use', ['weight'] = 0.01 },
	['r-tandrilax'] = { ['index'] = 'r-tandrilax', ['name'] = 'Receita tandrilax', ['type'] = 'use', ['weight'] = 0.01 },
	['tandrilax'] = { ['index'] = 'tandrilax', ['name'] = ' tandrilax', ['type'] = 'use', ['weight'] = 0.01 },
	['r-dipirona'] = { ['index'] = 'r-dipirona', ['name'] = 'Receita dipirona', ['type'] = 'use', ['weight'] = 0.01 },
	['r-dorflex'] = { ['index'] = 'r-dorflex', ['name'] = 'Receita dorflex', ['type'] = 'use', ['weight'] = 0.015 },
	['r-buscopan'] = { ['index'] = 'r-buscopan', ['name'] = 'Receita buscopan', ['type'] = 'use', ['weight'] = 0.01 },
	['r-hirudoid'] = { ['index'] = 'r-hirudoid', ['name'] = 'Receita hirudoid', ['type'] = 'use', ['weight'] = 0.01 },
	['kitmedico'] = { ['index'] = 'kitmedico', ['name'] = 'kit medico', ['type'] = 'use', ['weight'] = 0.1 },
	['folhas-coca'] = { ['index'] = 'folhas-coca', ['name'] = 'Folhas de coca', ['type'] = 'use', ['weight'] = 0.01 },
	['calcio-po'] = { ['index'] = 'calcio-po', ['name'] = 'Calcio em po', ['type'] = 'use', ['weight'] = 0.01 },
	['querosene'] = { ['index'] = 'querosene', ['name'] = 'Querosene', ['type'] = 'use', ['weight'] = 0.01 },
	['maconha-alta'] = { ['index'] = 'maconha-alta', ['name'] = 'Maconha HQ', ['type'] = 'use', ['weight'] = 0.1 },
	['tetra-hidrocanabinol'] = { ['index'] = 'tetra-hidrocanabinol', ['name'] = 'tetra hidrocanabinol', ['type'] = 'use', ['weight'] = 0.05 },
	['haxixe'] = { ['index'] = 'haxixe', ['name'] = 'Haxixe', ['type'] = 'use', ['weight'] = 0.05 },
	['skunk'] = { ['index'] = 'skunk', ['name'] = 'skunk', ['type'] = 'use', ['weight'] = 0.05 },
	['beck'] = { ['index'] = 'beck', ['name'] = 'beck', ['type'] = 'use', ['weight'] = 0.05 },
	['nitrato-amonia'] = { ['index'] = 'nitrato-amonia', ['name'] = 'nitrato de amonia', ['type'] = 'use', ['weight'] = 0.01 },
	['hidroxido-sodio'] = { ['index'] = 'hidroxido-sodio', ['name'] = 'hidroxido de sodio', ['type'] = 'use', ['weight'] = 0.01 },
	['pseudoefedrina'] = { ['index'] = 'pseudoefedrina', ['name'] = 'pseudoefedrina', ['type'] = 'use', ['weight'] = 0.01 },
	['eter'] = { ['index'] = 'eter', ['name'] = 'eter', ['type'] = 'use', ['weight'] = 0.01 },

----------------------------------
----
------------------------------------
	['mochila'] = { ['index'] = 'mochila', ['name'] = 'Mochila', ['type'] = 'use', ['weight'] = 1.0 },
	['ticket-corrida'] = { ['index'] = 'ticket-corrida', ['name'] = 'Ticket', ['type'] = 'use', ['weight'] = 0.1 },
	['tinta'] = { ['index'] = 'tinta', ['name'] = 'Tinta', ['type'] = 'use', ['weight'] = 0.01 },
	['papelada'] = { ['index'] = 'papelada', ['name'] = 'Papelada', ['type'] = 'use', ['weight'] = 0.2 },
	['fichas'] = { ['index'] = 'fichas', ['name'] = 'Fichas Cassino', ['type'] = 'use', ['weight'] = 0.0001 },
	['peca-de-arma'] = { ['index'] = 'peca-de-arma', ['name'] = 'Peças de Armas', ['type'] = 'use', ['weight'] = 0.2 },
	['skate'] = { ['index'] = 'skate', ['name'] = 'Skate', ['type'] = 'use', ['weight'] = 5.0 },

	['suspensaoar'] = { ['index'] = 'suspensaoar', ['name'] = 'Kit Suspensão a ar', ['type'] = 'use', ['weight'] = 5.0 },
	['moduloneon'] = { ['index'] = 'moduloneon', ['name'] = 'Kit módulo Neon', ['type'] = 'use', ['weight'] = 5.0 },
	['moduloxenon'] = { ['index'] = 'moduloxenon', ['name'] = 'Kit módulo Xenon', ['type'] = 'use', ['weight'] = 5.0 },
	--------------------------------------------------------------------------------
	['silenciador'] = { ['index'] = 'silenciador', ['name'] = 'Silenciador', ['type'] = 'use', ['weight'] = 0.1 },
	['pente'] = { ['index'] = 'pente', ['name'] = 'Pente Estendido', ['type'] = 'use', ['weight'] = 0.2 },
	['empunhadura'] = { ['index'] = 'empunhadura', ['name'] = 'Empunhadura', ['type'] = 'use', ['weight'] = 1.0 },
	['mira'] = { ['index'] = 'mira', ['name'] = 'Mira', ['type'] = 'use', ['weight'] = 0.4 },
	['lanterna'] = { ['index'] = 'lanterna', ['name'] = 'Lanterna Tática', ['type'] = 'use', ['weight'] = 0.4 },
	['spray'] = { ['index'] = 'spray', ['name'] = 'Spray', ['type'] = 'use', ['weight'] = 0.8 },
	--------------------------------------------------------------------------------
	['plano-one'] = { ['index'] = 'plano-one', ['name'] = 'Plano 1', ['type'] = 'use', ['weight'] = 0.1 },
	['plano-three'] = { ['index'] = 'plano-three', ['name'] = 'Plano 3', ['type'] = 'use', ['weight'] = 0.1 },
	['plano-five'] = { ['index'] = 'plano-five', ['name'] = 'Plano 5', ['type'] = 'use', ['weight'] = 0.1 },
	['plano-ten'] = { ['index'] = 'plano-ten', ['name'] = 'Plano 10', ['type'] = 'use', ['weight'] = 0.1 },

	['celular'] = { ['index'] = 'celular', ['name'] = 'SmartPhone', ['type'] = 'use', ['weight'] = 1.0 },
	['celular-pro'] = { ['index'] = 'celular-pro', ['name'] = 'SmartPhone Pro', ['type'] = 'use', ['weight'] = 0.1 },
	['jbl'] = { ['index'] = 'jbl', ['name'] = 'JBL', ['type'] = 'use', ['weight'] = 0.1 },
	['calculadora'] = { ['index'] = 'calculadora', ['name'] = 'Calculadora', ['type'] = 'use', ['weight'] = 0.1 },
	['tablet'] = { ['index'] = 'tablet', ['name'] = 'Tablet', ['type'] = 'use', ['weight'] = 0.1 },
	['notebook'] = { ['index'] = 'notebook', ['name'] = 'Notebook', ['type'] = 'use', ['weight'] = 0.1 },
	['controleremoto'] = { ['index'] = 'controleremoto', ['name'] = 'Controle remoto', ['type'] = 'use', ['weight'] = 0.1 },
	['baterias'] = { ['index'] = 'baterias', ['name'] = 'Baterias', ['type'] = 'use', ['weight'] = 0.1 },
	['radio'] = { ['index'] = 'radio', ['name'] = 'WalkTalk', ['type'] = 'use', ['weight'] = 1.0 },
	['chapeu'] = { ['index'] = 'chapeu', ['name'] = 'Chapeu', ['type'] = 'use', ['weight'] = 0.1 },
	['mascara'] = { ['index'] = 'mascara', ['name'] = 'Mascara', ['type'] = 'use', ['weight'] = 0.1 },
	['oculos'] = { ['index'] = 'oculos', ['name'] = 'Óculos', ['type'] = 'use', ['weight'] = 0.1 },
	['passaporte'] = { ['index'] = 'passaporte', ['name'] = 'Passaporte', ['type'] = 'use', ['weight'] = 0.1 },
	['portearmas'] = { ['index'] = 'portearmas', ['name'] = 'Porte de Armas', ['type'] = 'use', ['weight'] = 0.1 },
	['identidade'] = { ['index'] = 'identidade', ['name'] = 'Identidade', ['type'] = 'use', ['weight'] = 0.1 },
	['cnh'] = { ['index'] = 'cnh', ['name'] = 'CNH', ['type'] = 'use', ['weight'] = 0.1 },
	['colete'] = { ['index'] = 'colete', ['name'] = 'Colete Balístico', ['type'] = 'use', ['weight'] = 2.0 },
	['repairkit'] = { ['index'] = 'repairkit', ['name'] = 'Kit de Reparos', ['type'] = 'use', ['weight'] = 2.0 },
	['dinheiro'] = { ['index'] = 'dinheiro', ['name'] = 'Dinheiro', ['type'] = 'use', ['weight'] = 0.0 },
	['cartao-debito'] = { ['index'] = 'cartao-debito', ['name'] = 'Cartão de débito', ['type'] = 'use', ['weight'] = 0.05 },
	['maquininha'] = { ['index'] = 'maquininha', ['name'] = 'Maquininha', ['type'] = 'use', ['weight'] = 0.1 },
	['paninho'] = { ['index'] = 'paninho', ['name'] = 'Pano de Microfibra', ['type'] = 'use', ['weight'] = 0.1 },
	['carrinho'] = { ['index'] = 'carrinho', ['name'] = 'Carrinho', ['type'] = 'use', ['weight'] = 0.1 },
	['camisinha'] = { ['index'] = 'camisinha', ['name'] = 'Camisinha', ['type'] = 'use', ['weight'] = 0.1 },
	['vibrador'] = { ['index'] = 'vibrador', ['name'] = 'Vibrador', ['type'] = 'use', ['weight'] = 0.1 },
	['kit'] = { ['index'] = 'kit', ['name'] = 'Kit de Sex Shop', ['type'] = 'use', ['weight'] = 0.1 },
	['roupas'] = { ['index'] = 'roupas', ['name'] = 'Roupas', ['type'] = 'use', ['weight'] = 6.0 },

	['alvejante'] = { ['index'] = 'alvejante', ['name'] = 'Alvejante', ['type'] = 'use', ['weight'] = 1.0 },
	
	['alianca'] = { ['index'] = 'alianca', ['name'] = 'Aliança', ['type'] = 'use', ['weight'] = 1.0 },
	['aluminio'] = { ['index'] = 'aluminio', ['name'] = 'aluminio', ['type'] = 'use', ['weight'] = 0.05 },

	--[ Illegal Utilities ]--------------------------------------------------------------------------------------------
	
	['dinheiro-sujo'] = { ['index'] = 'dinheiro-sujo', ['name'] = 'Dinheiro Sujo', ['type'] = 'use', ['weight'] = 0.0 },
	['binoculos'] = { ['index'] = 'binoculos', ['name'] = 'Binoculos', ['type'] = 'use', ['weight'] = 0.1 },
	['algemas'] = { ['index'] = 'algema', ['name'] = 'Algemas', ['type'] = 'use', ['weight'] = 1.5 },
	['lockpick'] = { ['index'] = 'lockpick', ['name'] = 'Lockpick', ['type'] = 'use', ['weight'] = 2.5 },
	['masterpick'] = { ['index'] = 'masterpick', ['name'] = 'Masterpick', ['type'] = 'use', ['weight'] = 2.5 },
	['capuz'] = { ['index'] = 'capuz', ['name'] = 'Capuz', ['type'] = 'use', ['weight'] = 2.5 },
	['placa-aluminio'] = { ['index'] = 'placa-aluminio', ['name'] = 'Aluminio', ['type'] = 'use', ['weight'] = 0.1 },
	['cobre'] = { ['index'] = 'copper', ['name'] = 'Cobre', ['type'] = 'use', ['weight'] = 0.1 },
	['placa-clonada'] = { ['index'] = 'placa', ['name'] = 'Placa Branca', ['type'] = 'use', ['weight'] = 0.1 },
	['plastico'] = { ['index'] = 'plastico', ['name'] = 'Plastico', ['type'] = 'use', ['weight'] = 0.2 },
	['vidro'] = { ['index'] = 'vidro', ['name'] = 'Vidro', ['type'] = 'use', ['weight'] = 0.2 },
	['relogioroubado'] = { ['index'] = 'relogioroubado', ['name'] = 'Relogio Roubado', ['type'] = 'use', ['weight'] = 0.1 },
	['pulseiraroubada'] = { ['index'] = 'pulseiraroubada', ['name'] = 'Pulseira Roubada', ['type'] = 'use', ['weight'] = 0.1 },
	['anelroubado'] = { ['index'] = 'anelroubado', ['name'] = 'Anel Roubado', ['type'] = 'use', ['weight'] = 0.1 },
	['colarroubado'] = { ['index'] = 'colarroubado', ['name'] = 'Colar Roubado', ['type'] = 'use', ['weight'] = 0.1 },
	['brincoroubado'] = { ['index'] = 'brincoroubado', ['name'] = 'Brinco Roubado', ['type'] = 'use', ['weight'] = 0.1 },
	['carteiraroubada'] = { ['index'] = 'carteiraroubada', ['name'] = 'Carteira Roubada', ['type'] = 'use', ['weight'] = 0.1 },
	['carregadorroubado'] = { ['index'] = 'carregadorroubado', ['name'] = 'Carregador Roubado', ['type'] = 'use', ['weight'] = 0.1 },
	['tabletroubado'] = { ['index'] = 'tabletroubado', ['name'] = 'Tablet Roubado', ['type'] = 'use', ['weight'] = 0.1 },
	['sapatosroubado'] = { ['index'] = 'sapatosroubado', ['name'] = 'Sapatos Roubado', ['type'] = 'use', ['weight'] = 0.1 },
	['vibradorroubado'] = { ['index'] = 'vibradorroubado', ['name'] = 'Vibrador Roubado', ['type'] = 'use', ['weight'] = 0.1 },
	['perfumeroubado'] = { ['index'] = 'perfumeroubado', ['name'] = 'Perfume Roubado', ['type'] = 'use', ['weight'] = 0.1 },
	['maquiagemroubada'] = { ['index'] = 'maquiagemroubada', ['name'] = 'Maquiagem Roubado', ['type'] = 'use', ['weight'] = 0.1 },
	['etiqueta'] = { ['index'] = 'etiqueta', ['name'] = 'Etiqueta', ['type'] = 'use', ['weight'] = 0.1 },
	
	--[ Tools ] -------------------------------------------------------------------------------------------------------
	
	['furadeira'] = { ['index'] = 'furadeira', ['name'] = 'Furadeira', ['type'] = 'use', ['weight'] = 2.5 },
	['serra'] = { ['index'] = 'serra', ['name'] = 'Serra', ['type'] = 'use', ['weight'] = 2.5 },
	['broca'] = { ['index'] = 'broca', ['name'] = 'Broca', ['type'] = 'use', ['weight'] = 0.05 },
	['disco-serra'] = { ['index'] = 'disco-serra', ['name'] = 'Disco de Serra', ['type'] = 'use', ['weight'] = 1.5 },
	['pa-jardinagem'] = { ['index'] = 'pa-jardinagem', ['name'] = 'Pá de Jardinagem', ['type'] = 'use', ['weight'] = 0.1 },

	--[ Miscs ]------------------------------------------------------------------------------------------------------

	['garrafa-vazia'] = { ['index'] = 'garrafa-vazia', ['name'] = 'Garrafa vazia', ['type'] = 'use', ['weight'] = 0.1 },
	['ponta-britadeira'] = { ['index'] = 'ponta-britadeira', ['name'] = 'Ponta de britadeira', ['type'] = 'use', ['weight'] = 0.1 },

	--[ Miner Work ]------------------------------------------------------------------------------------------------------

	['minerio-diamante'] = { ['index'] = 'minerio-diamante', ['name'] = 'Minerio de Diamante', ['type'] = 'use', ['weight'] = 0.1 },
	['minerio-ouro'] = { ['index'] = 'minerio-ouro', ['name'] = 'Minerio de Ouro', ['type'] = 'use', ['weight'] = 0.1 },
	['minerio-prata'] = { ['index'] = 'minerio-prata', ['name'] = 'Minerio de Prata', ['type'] = 'use', ['weight'] = 0.1 },
	['minerio-ferro'] = { ['index'] = 'minerio-ferro', ['name'] = 'Minerio de Ferro', ['type'] = 'use', ['weight'] = 0.1 },
	['aco'] = { ['index'] = 'aco', ['name'] = 'Barra Aço', ['type'] = 'use', ['weight'] = 0.3 },

	['diamante'] = { ['index'] = 'diamante', ['name'] = 'Diamante Bruto', ['type'] = 'use', ['weight'] = 0.1 },
	['barra-ouro'] = { ['index'] = 'barra-ouro', ['name'] = 'Barra de Ouro', ['type'] = 'use', ['weight'] = 0.1 },
	['barra-prata'] = { ['index'] = 'barra-prata', ['name'] = 'Barra de Prata', ['type'] = 'use', ['weight'] = 0.1 },
	['barra-ferro'] = { ['index'] = 'barra-ferro', ['name'] = 'Barra de Ferro', ['type'] = 'use', ['weight'] = 0.1 },

	--[ Drinks ]-------------------------------------------------------------------------------------------------------
	
	['agua'] = { ['index'] = 'agua', ['name'] = 'Água', ['type'] = 'use', ['weight'] = 0.1 },
	['leite'] = { ['index'] = 'leite', ['name'] = 'Leite', ['type'] = 'use', ['weight'] = 0.005 },
	['cafe'] = { ['index'] = 'cafe', ['name'] = 'Café Americano', ['type'] = 'use', ['weight'] = 0.1 },
	['cafecleite'] = { ['index'] = 'cafecleite', ['name'] = 'Café com Leite', ['type'] = 'use', ['weight'] = 0.1 },
	['cafeexpresso'] = { ['index'] = 'cafeexpresso', ['name'] = 'Café Expresso', ['type'] = 'use', ['weight'] = 0.1 },
	['capuccino'] = { ['index'] = 'capuccino', ['name'] = 'Capuccino', ['type'] = 'use', ['weight'] = 0.1 },
	['frappuccino'] = { ['index'] = 'frappuccino', ['name'] = 'Frapuccino', ['type'] = 'use', ['weight'] = 0.1 },
	['coldbrew'] = { ['index'] = 'coldbrew', ['name'] = 'Cold Brew', ['type'] = 'use', ['weight'] = 0.1 },
	['cha'] = { ['index'] = 'cha', ['name'] = 'Chá Mate', ['type'] = 'use', ['weight'] = 0.1 },
	['chapreto'] = { ['index'] = 'chapreto', ['name'] = 'Chá Preto', ['type'] = 'use', ['weight'] = 0.1 },
	['chaverde'] = { ['index'] = 'chaverde', ['name'] = 'Chá Verde', ['type'] = 'use', ['weight'] = 0.1 },
	['icecha'] = { ['index'] = 'icecha', ['name'] = 'Chá Gelado', ['type'] = 'use', ['weight'] = 0.1 },
	['chadecamomila'] = { ['index'] = 'chadecamomila', ['name'] = 'Chá de Camomila', ['type'] = 'use', ['weight'] = 0.1 },
	['chadehortela'] = { ['index'] = 'chadehortela', ['name'] = 'Chá de Hortelã', ['type'] = 'use', ['weight'] = 0.1 },
	['sprunk'] = { ['index'] = 'sprunk', ['name'] = 'Sprunk', ['type'] = 'use', ['weight'] = 0.1 },
	['cola'] = { ['index'] = 'cola', ['name'] = 'Coca Cola', ['type'] = 'use', ['weight'] = 0.1 },
	['energetico'] = { ['index'] = 'energetico', ['name'] = 'Energético', ['type'] = 'use', ['weight'] = 0.1 },
	
	--[ Alcoholic Beverages ]------------------------------------------------------------------------------------------
	
	['pibwassen'] = { ['index'] = 'pibwassen', ['name'] = 'PibWassen', ['type'] = 'use', ['weight'] = 0.1 },
	['tequilya'] = { ['index'] = 'tequilya', ['name'] = 'Tequilya', ['type'] = 'use', ['weight'] = 0.1 },
	['patriot'] = { ['index'] = 'patriot', ['name'] = 'Patriot', ['type'] = 'use', ['weight'] = 0.1 },
	['blarneys'] = { ['index'] = 'blarneys', ['name'] = 'Blarneys', ['type'] = 'use', ['weight'] = 0.1 },
	['jakeys'] = { ['index'] = 'jakeys', ['name'] = 'Jakeys', ['type'] = 'use', ['weight'] = 0.1 },
	['barracho'] = { ['index'] = 'barracho', ['name'] = 'Barracho', ['type'] = 'use', ['weight'] = 0.1 },
	['ragga'] = { ['index'] = 'ragga', ['name'] = 'Ragga', ['type'] = 'use', ['weight'] = 0.1 },
	['nogo'] = { ['index'] = 'nogo', ['name'] = 'Nogo', ['type'] = 'use', ['weight'] = 0.1 },
	['mount'] = { ['index'] = 'mount', ['name'] = 'Mount', ['type'] = 'use', ['weight'] = 0.1 },
	['cherenkov'] = { ['index'] = 'cherenkov', ['name'] = 'Cherenkov', ['type'] = 'use', ['weight'] = 0.1 },
	['bourgeoix'] = { ['index'] = 'bourgeoix', ['name'] = 'Bourgeoix', ['type'] = 'use', ['weight'] = 0.1 },
	['bleuterd'] = { ['index'] = 'bleuterd', ['name'] = 'Bleuterd', ['type'] = 'use', ['weight'] = 0.1 },
	
	--[ FastFoods ]----------------------------------------------------------------------------------------------------
	
	['sanduiche'] = { ['index'] = 'sanduiche', ['name'] = 'Sanduíche', ['type'] = 'use', ['weight'] = 0.2 },
	['coxinha'] = { ['index'] = 'coxinha', ['name'] = 'Coxinha', ['type'] = 'use', ['weight'] = 0.2 },
	['ovocbacon'] = { ['index'] = 'ovocbacon', ['name'] = 'Ovos com Bacon', ['type'] = 'use', ['weight'] = 0.2 },
	['croissant'] = { ['index'] = 'croissant', ['name'] = 'Croissant', ['type'] = 'use', ['weight'] = 0.2 },
	['salada'] = { ['index'] = 'salada', ['name'] = 'Salada', ['type'] = 'use', ['weight'] = 0.2 },
	['rosquinha'] = { ['index'] = 'rosquinha', ['name'] = 'Rosquinha', ['type'] = 'use', ['weight'] = 0.2 },
	['hotdog'] = { ['index'] = 'hotdog', ['name'] = 'HotDog', ['type'] = 'use', ['weight'] = 0.2 },
	['xburguer'] = { ['index'] = 'xburguer', ['name'] = 'xBurguer', ['type'] = 'use', ['weight'] = 0.2 },
	['chips'] = { ['index'] = 'chips', ['name'] = 'Batata Chips', ['type'] = 'use', ['weight'] = 0.2 },
	['batataf'] = { ['index'] = 'batataf', ['name'] = 'Batata Frita', ['type'] = 'use', ['weight'] = 0.2 },
	['pizza'] = { ['index'] = 'pizza', ['name'] = 'Pedaço de Pizza', ['type'] = 'use', ['weight'] = 0.2 },
	['frango'] = { ['index'] = 'frango', ['name'] = 'Frango Frito', ['type'] = 'use', ['weight'] = 0.2 },
	['bcereal'] = { ['index'] = 'bcereal', ['name'] = 'Barra de Cereal', ['type'] = 'use', ['weight'] = 0.2 },
	['bchocolate'] = { ['index'] = 'bchocolate', ['name'] = 'Barra de Chocolate', ['type'] = 'use', ['weight'] = 0.2 },
	['bolococolate'] = { ['index'] = 'bolococolate', ['name'] = 'Bolo de Chocolate', ['type'] = 'use', ['weight'] = 0.2 },
	['bolodemorango'] = { ['index'] = 'bolodemorango', ['name'] = 'Bolo de Morango', ['type'] = 'use', ['weight'] = 0.2 },
	['tortagelada'] = { ['index'] = 'tortagelada', ['name'] = 'Torta Gelada', ['type'] = 'use', ['weight'] = 0.2 },
	['cookie'] = { ['index'] = 'cookie', ['name'] = 'Cookie', ['type'] = 'use', ['weight'] = 0.2 },
	['palhaitaliana'] = { ['index'] = 'palhaitaliana', ['name'] = 'Palha Italiana', ['type'] = 'use', ['weight'] = 0.2 },
	['taco'] = { ['index'] = 'taco', ['name'] = 'Taco', ['type'] = 'use', ['weight'] = 0.2 },
	
	--[ Drugs ]--------------------------------------------------------------------------------------------------------
	
	['paracetamil'] = { ['index'] = 'paracetamil', ['name'] = 'Paracetamil', ['type'] = 'use', ['weight'] = 0.1 },
	['voltarom'] = { ['index'] = 'voltarom', ['name'] = 'Voltarom', ['type'] = 'use', ['weight'] = 0.1 },
	['trandrylux'] = { ['index'] = 'trandrylux', ['name'] = 'Trandrylux', ['type'] = 'use', ['weight'] = 0.1 },
	['dorfrex'] = { ['index'] = 'dorfrex', ['name'] = 'Dorfrex', ['type'] = 'use', ['weight'] = 0.1 },
	['buscopom'] = { ['index'] = 'buscopom', ['name'] = 'Buscopom', ['type'] = 'use', ['weight'] = 0.1 },
	
	--[ Prescription ]-------------------------------------------------------------------------------------------------
	
	['r-paracetamil'] = { ['index'] = 'r-paracetamil', ['name'] = 'Receituário Paracetamil', ['type'] = 'use', ['weight'] = 0.1 },
	['r-voltarom'] = { ['index'] = 'r-voltarom', ['name'] = 'Receituário Voltarom', ['type'] = 'use', ['weight'] = 0.1 },
	['r-trandrylux'] = { ['index'] = 'r-trandrylux', ['name'] = 'Receituário Trandrylux', ['type'] = 'use', ['weight'] = 0.1 },
	['r-dorfrex'] = { ['index'] = 'r-dorfrex', ['name'] = 'Receituário Dorfrex', ['type'] = 'use', ['weight'] = 0.1 },
	['r-buscopom'] = { ['index'] = 'r-buscopom', ['name'] = 'Receituário Buscopom', ['type'] = 'use', ['weight'] = 0.1 },
	['headblock'] = { ['index'] = 'headblock', ['name'] = 'Headblock', ['type'] = 'use', ['weight'] = 0.1 },
	['gesso'] = { ['index'] = 'gesso', ['name'] = 'Gesso', ['type'] = 'use', ['weight'] = 0.1 },
	['cinta'] = { ['index'] = 'cinta', ['name'] = 'Cinta', ['type'] = 'use', ['weight'] = 0.1 },
	['bandagem'] = { ['index'] = 'bandagem', ['name'] = 'Bandagem', ['type'] = 'use', ['weight'] = 0.1 },

	--[ Drogas ]-------------------------------------------------------------------------------------------------

	['composito'] = { ['index'] = 'composito', ['name'] = 'Compósito', ['type'] = 'use', ['weight'] = 0.8 },
	['cristal-metanfetamina'] = { ['index'] = 'cristal-metanfetamina', ['name'] = 'Cristal Metanfetamina', ['type'] = 'use', ['weight'] = 0.4 },
	['acido'] = { ['index'] = 'acido', ['name'] = 'Acido', ['type'] = 'use', ['weight'] = 0.4 },
	['acido-sulfurico'] = { ['index'] = 'acido-sulfurico', ['name'] = 'acido-sulfurico', ['type'] = 'use', ['weight'] = 0.04 },
	['metanfetamina'] = { ['index'] = 'metanfetamina', ['name'] = 'Metanfetamina', ['type'] = 'use', ['weight'] = 0.25 },

	['pasta-base'] = { ['index'] = 'pasta-base', ['name'] = 'Pasta Base', ['type'] = 'use', ['weight'] = 0.8 },
	['ziplock'] = { ['index'] = 'ziplock', ['name'] = 'Zip-Lock', ['type'] = 'use', ['weight'] = 0.4 },
	['cocaina'] = { ['index'] = 'cocaina', ['name'] = 'Cocaína', ['type'] = 'use', ['weight'] = 0.25 },
	['cocaina-embalada'] = { ['index'] = 'cocaina-embalada', ['name'] = 'Cocaína Embalada', ['type'] = 'use', ['weight'] = 0.1 },

	['ergolina'] = { ['index'] = 'ergolina', ['name'] = 'Quimico Ergolina', ['type'] = 'use', ['weight'] = 0.8 },
	['lsd'] = { ['index'] = 'lsd', ['name'] = 'LSD', ['type'] = 'use', ['weight'] = 0.4 },
	['folhadeselo'] = { ['index'] = 'folhadeselo', ['name'] = 'Folha de Selo', ['type'] = 'use', ['weight'] = 0.004 },
	['lsdselo'] = { ['index'] = 'lsdselo', ['name'] = 'LSD Selo', ['type'] = 'use', ['weight'] = 0.25 },

	['folha-marijuana'] = { ['index'] = 'folha-marijuana', ['name'] = 'Folha de Marijuana', ['type'] = 'use', ['weight'] = 0.004 },
	['maconha'] = { ['index'] = 'maconha', ['name'] = 'Maconha', ['type'] = 'use', ['weight'] = 0.4 },
	['seda'] = { ['index'] = 'seda', ['name'] = 'Seda', ['type'] = 'use', ['weight'] = 0.4 },
	['baseado'] = { ['index'] = 'baseado', ['name'] = 'Baseado', ['type'] = 'use', ['weight'] = 0.25 },
	
	--[ Weapons body ] [ Weapons Production ]---------------------------------------------------------------------------
	
	['corpo-fuzil'] = { ['index'] = 'corpo-fuzil', ['name'] = 'Corpo de Fuzil', ['type'] = 'use', ['weight'] = 1.8 },
	['corpo-sub'] = { ['index'] = 'corpo-sub', ['name'] = 'Corpo de SUB', ['type'] = 'use', ['weight'] = 1.5 },
	['corpo-pistola'] = { ['index'] = 'corpo-pistola', ['name'] = 'Corpo de Pistola', ['type'] = 'use', ['weight'] = 1.5 },
	['corpo-doze'] = { ['index'] = 'corpo-doze', ['name'] = 'Corpo de Escopeta', ['type'] = 'use', ['weight'] = 1.5 },


	--[ Miscellaneous ][ Weapons Production ]--------------------------------------------------------------------------
	
	['molas'] = { ['index'] = 'molas', ['name'] = 'Molas', ['type'] = 'use', ['weight'] = 0.01 },
	['placa-metal'] = { ['index'] = 'placa-metal', ['name'] = 'Placa de Metal', ['type'] = 'use', ['weight'] = 0.009 },
	['gatilho'] = { ['index'] = 'gatilho', ['name'] = 'Gatilho', ['type'] = 'use', ['weight'] = 0.009 },
	['capsulas'] = { ['index'] = 'capsulas', ['name'] = 'Capsulas', ['type'] = 'use', ['weight'] = 0.01 },
	['polvora'] = { ['index'] = 'polvora', ['name'] = 'Polvora', ['type'] = 'use', ['weight'] = 0.01 },

	--[ Emprego ][ Leiteiro ]------------------------------------------------------------------------------------------

	['garrafa-leite'] = { ['index'] = 'garrafa-leite', ['name'] = 'Garrafa com Leite', ['type'] = 'use', ['weight'] = 0.1 },

	--[ Emprego ][ Desmanche ]------------------------------------------------------------------------------------------
	['motorcarro'] = { ['index'] = 'motorcarro', ['name'] = 'Motor de Carro', ['type'] = 'use', ['weight'] = 9.5 },
	['rodacarro'] = { ['index'] = 'rodacarro', ['name'] = 'Roda de Carro', ['type'] = 'use', ['weight'] = 4.2 },
	['portacarro'] = { ['index'] = 'portacarro', ['name'] = 'Porta de Carro', ['type'] = 'use', ['weight'] = 5.0 },
	['volante'] = { ['index'] = 'volante', ['name'] = 'Volante de Carro', ['type'] = 'use', ['weight'] = 1.5 },
	['parachoque'] = { ['index'] = 'parachoque', ['name'] = 'Parachoque de Veículo', ['type'] = 'use', ['weight'] = 1.5 },
	['placa'] = { ['index'] = 'placa', ['name'] = 'Placa', ['type'] = 'use', ['weight'] = 0.1 },	
	
	--[ Emprego ][ Desmanche ][ IMPORTS ]------------------------------------------------------------------------------------------
	['discofreioimport'] = { ['index'] = 'discofreio', ['name'] = 'Disco de Freio', ['type'] = 'use', ['weight'] = 1.5 },
	['motorcarroimport'] = { ['index'] = 'motorcarro', ['name'] = 'Motor de Carro', ['type'] = 'use', ['weight'] = 9.5 },
	['rodacarroimport'] = { ['index'] = 'rodacarro', ['name'] = 'Roda de Carro', ['type'] = 'use', ['weight'] = 4.2 },
	['portacarroimport'] = { ['index'] = 'portacarro', ['name'] = 'Porta de Carro', ['type'] = 'use', ['weight'] = 5.0 },
	['volanteimport'] = { ['index'] = 'volante', ['name'] = 'Volante de Carro', ['type'] = 'use', ['weight'] = 1.5 },
	
	--[ Emprego ][ Desmanche ][ EXCLUSIVE ]------------------------------------------------------------------------------------------
	['discofreioexclusive'] = { ['index'] = 'discofreio', ['name'] = 'Disco de Freio', ['type'] = 'use', ['weight'] = 1.5 },
	['motorcarroexclusive'] = { ['index'] = 'rodacarro', ['name'] = 'Roda de Carro', ['type'] = 'use', ['weight'] = 4.2 },
	['rodacarroexclusive'] = { ['index'] = 'rodacarro', ['name'] = 'Roda de Carro', ['type'] = 'use', ['weight'] = 4.2 },
	['portacarroexclusive'] = { ['index'] = 'portacarro', ['name'] = 'Porta de Carro', ['type'] = 'use', ['weight'] = 5.0 },
	['volanteexclusive'] = { ['index'] = 'volante', ['name'] = 'Volante de Carro', ['type'] = 'use', ['weight'] = 1.5 },
	
	--[ Emprego ][ Desmanche ][ MOTOS ]------------------------------------------------------------------------------------------
	['discofreio'] = { ['index'] = 'discofreio', ['name'] = 'Disco de Freio', ['type'] = 'use', ['weight'] = 1.5 },
	['motormoto'] = { ['index'] = 'motormoto', ['name'] = 'Motor de Moto', ['type'] = 'use', ['weight'] = 3.5 },
	['rodamoto'] = { ['index'] = 'rodamoto', ['name'] = 'Roda de Moto', ['type'] = 'use', ['weight'] = 1.5 },
	
	--[ Emprego ][ Desmanche ][ MOTOS IMPORT ]------------------------------------------------------------------------------------------
	['discofreioimport'] = { ['index'] = 'discofreio', ['name'] = 'Disco de Freio', ['type'] = 'use', ['weight'] = 1.5 },
	['motormotoimport'] = { ['index'] = 'motormoto', ['name'] = 'Motor de Moto', ['type'] = 'use', ['weight'] = 3.5 },
	['rodamotoimport'] = { ['index'] = 'rodamoto', ['name'] = 'Roda de Moto', ['type'] = 'use', ['weight'] = 1.5 },
	
	--[ Emprego ][ Desmanche ][ MOTOS EXCLUSIVE ]------------------------------------------------------------------------------------------
	['discofreioexclusive'] = { ['index'] = 'discofreio', ['name'] = 'Disco de Freio', ['type'] = 'use', ['weight'] = 1.5 },
	['motormotoexclusive'] = { ['index'] = 'motormoto', ['name'] = 'Motor de Moto', ['type'] = 'use', ['weight'] = 3.5 },
	['rodamotoexclusive'] = { ['index'] = 'rodamoto', ['name'] = 'Roda de Moto', ['type'] = 'use', ['weight'] = 1.5 },
	
	
	--[ Emprego ][ Pescador ]------------------------------------------------------------------------------------------

	['isca'] = { ['index'] = 'isca', ['name'] = 'Isca de pesca', ['type'] = 'use', ['weight'] = 0.3 },
	['dourado'] = { ['index'] = 'dourado', ['name'] = 'Dourado', ['type'] = 'use', ['weight'] = 2.0 },
	['corvina'] = { ['index'] = 'corvina', ['name'] = 'Corvina', ['type'] = 'use', ['weight'] = 2.0 },
	['salmao'] = { ['index'] = 'salmao', ['name'] = 'Salmão', ['type'] = 'use', ['weight'] = 2.0 },
	['pacu'] = { ['index'] = 'pacu', ['name'] = 'Pacu', ['type'] = 'use', ['weight'] = 2.0 },
	['pintado'] = { ['index'] = 'pintado', ['name'] = 'Pintado', ['type'] = 'use', ['weight'] = 2.0 },
	['pirarucu'] = { ['index'] = 'pirarucu', ['name'] = 'Pirarucu', ['type'] = 'use', ['weight'] = 2.0 },
	['tilapia'] = { ['index'] = 'tilapia', ['name'] = 'Tilápia', ['type'] = 'use', ['weight'] = 2.0 },
	['tucunare'] = { ['index'] = 'tucunare', ['name'] = 'Tucunaré', ['type'] = 'use', ['weight'] = 2.0 },
	['lambari'] = { ['index'] = 'lambari', ['name'] = 'Lambari', ['type'] = 'use', ['weight'] = 2.0 },

	--[ Emprego ][ Lenhador ]------------------------------------------------------------------------------------------

	['tora'] = { ['index'] = 'tora', ['name'] = 'Tora de Madeira', ['type'] = 'use', ['weight'] = 0.9 },

	--[ Emprego ][ Lixeiro ]------------------------------------------------------------------------------------------

	['saco-lixo'] = {['index'] = 'saco-lixo', ['name'] = 'Saco de Lixo', ['type'] = 'use', ['weight'] = 0.1 },

	--[ Emprego ][ Carteiro ]------------------------------------------------------------------------------------------

	['encomenda'] = { ['index'] = 'encomenda', ['name'] = 'Encomenda', ['type'] = 'use', ['weight'] = 1.0 },
	['caixa-vazia'] = { ['index'] = 'caixa-vazia', ['name'] = 'Caixa Vazia', ['type'] = 'use', ['weight'] = 1.0 },

	--[ Emprego ][ Transporter ]------------------------------------------------------------------------------------------

	['malote'] = { ['index'] = 'malote', ['name'] = 'Malote de Dinheiro', ['type'] = 'use', ['weight'] = 0.1 },

	--[ Emprego ][ Farmer ]------------------------------------------------------------------------------------------

	['semente-marijuana'] = { ['index'] = 'semente-maconha', ['name'] = 'Sementes Genericas', ['type'] = 'use', ['weight'] = 0.1 },
	['semente-blueberry'] = { ['index'] = 'semente-blueberry', ['name'] = 'Sementes de Blueberry', ['type'] = 'use', ['weight'] = 0.1 },
	['semente-tomate'] = { ['index'] = 'semente-tomate', ['name'] = 'Semente de Tomate', ['type'] = 'use', ['weight'] = 0.1 },
	['semente-laranja'] = { ['index'] = 'semente-laranja', ['name'] = 'Semente de Laranja', ['type'] = 'use', ['weight'] = 0.1 },
	
	['laranja'] = { ['index'] = 'laranja', ['name'] = 'Laranja', ['type'] = 'use', ['weight'] = 0.005 },
	['tomate'] = { ['index'] = 'tomate', ['name'] = 'Tomate', ['type'] = 'use', ['weight'] = 0.1 },
	['blueberry'] = { ['index'] = 'blueberry', ['name'] = 'Blueberry', ['type'] = 'use', ['weight'] = 0.1 },

	['graosimpuros'] = { ['index'] = 'graosimpuros', ['name'] = 'Graos Impuros', ['type'] = 'use', ['weight'] = 0.1 },
	['graos'] = { ['index'] = 'graos', ['name'] = 'Graos', ['type'] = 'use', ['weight'] = 0.1 },

	--[ Desmanche ]------------------------------------------------------------------------------------------

	['transmissao'] = { ['index'] = 'transmissao', ['name'] = 'Transmissao', ['type'] = 'use', ['weight'] = 0.1 },
	['suspensao'] = { ['index'] = 'suspensao', ['name'] = 'Suspensao', ['type'] = 'use', ['weight'] = 0.1 },
	['portas'] = { ['index'] = 'portas', ['name'] = 'Portas', ['type'] = 'use', ['weight'] = 0.1 },
	['borrachas'] = { ['index'] = 'borrachas', ['name'] = 'Borrachas', ['type'] = 'use', ['weight'] = 0.1 },
	['pneus'] = { ['index'] = 'pneus', ['name'] = 'Pneus', ['type'] = 'use', ['weight'] = 0.1 },
	['capo'] = { ['index'] = 'capo', ['name'] = 'Capo', ['type'] = 'use', ['weight'] = 0.1 },
	['bateria-carro'] = { ['index'] = 'bateria-carro', ['name'] = 'Bateria de Carro', ['type'] = 'use', ['weight'] = 0.1 },
	['motor'] = { ['index'] = 'motor', ['name'] = 'Motor', ['type'] = 'use', ['weight'] = 0.1 },


	['transmissao'] = { ['index'] = 'transmissao', ['name'] = 'Transmissao', ['type'] = 'use', ['weight'] = 0.1 },
	['suspensao'] = { ['index'] = 'suspensao', ['name'] = 'Suspensao', ['type'] = 'use', ['weight'] = 0.1 },
	['portas'] = { ['index'] = 'portas', ['name'] = 'Portas', ['type'] = 'use', ['weight'] = 0.1 },
	['borrachas'] = { ['index'] = 'borrachas', ['name'] = 'Borrachas', ['type'] = 'use', ['weight'] = 0.1 },
	['pneus'] = { ['index'] = 'pneus', ['name'] = 'Pneus', ['type'] = 'use', ['weight'] = 0.1 },
	['capo'] = { ['index'] = 'capo', ['name'] = 'Capo', ['type'] = 'use', ['weight'] = 0.1 },
	['bateria-carro'] = { ['index'] = 'bateria-carro', ['name'] = 'Bateria de Carro', ['type'] = 'use', ['weight'] = 0.1 },
	['motor'] = { ['index'] = 'motor', ['name'] = 'Motor', ['type'] = 'use', ['weight'] = 0.1 },

	--[ Itens danificados ]--------------------------------------------------------------------------------------------

	['celular-queimado'] = { ['index'] = 'celular-queimado', ['name'] = 'Celular queimado', ['type'] = 'use', ['weight'] = 0.1 },
	['jbl-queimada'] = { ['index'] = 'jbl-queimada', ['name'] = 'JBL queimada', ['type'] = 'use', ['weight'] = 0.1 },
	['calculadora-queimada'] = { ['index'] = 'calculadora-queimada', ['name'] = 'Calculadora queimada', ['type'] = 'use', ['weight'] = 0.1 },
	['tablet-queimado'] = { ['index'] = 'tablet-queimado', ['name'] = 'Tablet queimado', ['type'] = 'use', ['weight'] = 0.1 },
	['notebook-queimado'] = { ['index'] = 'notebook-queimado', ['name'] = 'Notebook queimado', ['type'] = 'use', ['weight'] = 0.1 },
	['controleremoto-queimado'] = { ['index'] = 'controleremoto-queimado', ['name'] = 'Controle remoto queimado', ['type'] = 'use', ['weight'] = 0.1 },
	['baterias-queimadas'] = { ['index'] = 'baterias-queimadas', ['name'] = 'Baterias queimadas', ['type'] = 'use', ['weight'] = 0.1 },
	['radio-queimado'] = { ['index'] = 'radio-queimado', ['name'] = 'Rádio queimado', ['type'] = 'use', ['weight'] = 0.1 },
	['maquininha-queimada'] = { ['index'] = 'maquininha-queimada', ['name'] = 'Maquininha queimada', ['type'] = 'use', ['weight'] = 0.1 },

	--[ MUNICOES ]--------------------------------------------------------------------------------------------

	['WEAPON_PISTOL_AMMO'] = { ['index'] = 'WEAPON_PISTOL_AMMO', ['name'] = 'M-PISTOLA', ['type'] = 'recharge', ['weight'] = 0.1 },
	['WEAPON_SMG_AMMO'] = { ['index'] = 'WEAPON_SMG_AMMO', ['name'] = 'M-SMG', ['type'] = 'recharge', ['weight'] = 0.1 },
	['WEAPON_GUSENBERG_AMMO'] = { ['index'] = 'WEAPON_GUSENBERG_AMMO', ['name'] = 'M-SEMI', ['type'] = 'recharge', ['weight'] = 0.1 },
	['WEAPON_RIFLE_AMMO'] = { ['index'] = 'WEAPON_RIFLE_AMMO', ['name'] = 'M-RIFLE', ['type'] = 'recharge', ['weight'] = 0.1 },
	['WEAPON_SHOTGUN_AMMO'] = { ['index'] = 'WEAPON_SHOTGUN_AMMO', ['name'] = 'M-SHOTGUN', ['type'] = 'recharge', ['weight'] = 0.1 },
	['WEAPON_PETROLCAN_AMMO'] = { ['index'] = 'WEAPON_PETROLCAN_AMMO', ['name'] = 'M-GASOLINA', ['type'] = 'recharge', ['weight'] = 0.1 },
	['WEAPON_SNIPER_AMMO'] = { ['index'] = 'WEAPON_SNIPER_AMMO', ['name'] = 'M-SNIPER', ['type'] = 'recharge', ['weight'] = 0.1 },
	
	--[ Weapons ][ Melee]----------------------------------------------------------------------------------------------

	['WEAPON_DAGGER'] = { ['index'] = 'WEAPON_DAGGER', ['name'] = 'Adaga', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_BALL'] = { ['index'] = 'WEAPON_BALL', ['name'] = 'Bolas', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_BALL_AMMO'] = { ['index'] = 'WEAPON_BALL', ['name'] = 'BolasM', ['type'] = 'recharge', ['weight'] = 1.0 },
	['WEAPON_BAT'] = { ['index'] = 'WEAPON_BAT', ['name'] = 'Taco de Baseball', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_BOTTLE'] = { ['index'] = 'WEAPON_BOTTLE', ['name'] = 'Garrafa quebrada', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_CROWBAR'] = { ['index'] = 'WEAPON_CROWBAR', ['name'] = 'Pé de Cabra', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_FLASHLIGHT'] = { ['index'] = 'WEAPON_FLASHLIGHT', ['name'] = 'Lanterna', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_GOLFCLUB'] = { ['index'] = 'WEAPON_GOLFCLUB', ['name'] = 'Taco de Golf', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_HAMMER'] = { ['index'] = 'WEAPON_HAMMER', ['name'] = 'Martelo', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_HATCHET'] = { ['index'] = 'WEAPON_HATCHET', ['name'] = 'Machado', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_KNUCKLE'] = { ['index'] = 'WEAPON_KNUCKLE', ['name'] = 'Soco Inglês', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_KNIFE'] = { ['index'] = 'WEAPON_KNIFE', ['name'] = 'Faca', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_MACHETE'] = { ['index'] = 'WEAPON_MACHETE', ['name'] = 'Machado', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_SWITCHBLADE'] = { ['index'] = 'WEAPON_SWITCHBLADE', ['name'] = 'Canivete', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_NIGHTSTICK'] = { ['index'] = 'WEAPON_NIGHTSTICK', ['name'] = 'Cassetete', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_WHENCH'] = { ['index'] = 'WEAPON_WHENCH', ['name'] = 'Grifo', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_BATTLEAXE'] = { ['index'] = 'WEAPON_BATTLEAXE', ['name'] = 'Machado De Batalha', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_POOLCUE'] = { ['index'] = 'WEAPON_POOLCUE', ['name'] = 'Taco de Sinuca', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_STONE_HATCHET'] = { ['index'] = 'WEAPON_STONE_HATCHET', ['name'] = 'Machado de Pedra', ['type'] = 'equip', ['weight'] = 1.0 },

	--[ Handguns ][ Weapons ]------------------------------------------------------------------------------------------
	
	['WEAPON_PISTOL'] = { ['index'] = 'WEAPON_PISTOL', ['name'] = 'USP', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_PISTOL_MK2'] = { ['index'] = 'WEAPON_PISTOL_MK2', ['name'] = 'Five-Seven', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_COMBATPISTOL'] = { ['index'] = 'WEAPON_COMBATPISTOL', ['name'] = 'GLOCK', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_APPISTOL'] = { ['index'] = 'WEAPON_APPISTOL', ['name'] = 'XSE 1911', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_STUNGUN'] = { ['index'] = 'WEAPON_STUNGUN', ['name'] = 'Taser', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_PISTOL50'] = { ['index'] = 'WEAPON_PISTOL50', ['name'] = 'Desert Eagle', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_SNSPISTOL'] = { ['index'] = 'WEAPON_SNSPISTOL', ['name'] = 'HK', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_SNSPISTOL_MK2'] = { ['index'] = 'WEAPON_SNSPISTOL_MK2', ['name'] = 'Walther PPK2', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_HEAVYPISTOL'] = { ['index'] = 'WEAPON_HEAVYPISTOL', ['name'] = 'Wide 1911', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_VINTAGEPISTOL'] = { ['index'] = 'WEAPON_VINTAGEPISTOL', ['name'] = 'FN 1903', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_FLAREGUN'] = { ['index'] = 'WEAPON_FLAREGUN', ['name'] = 'Sinalizador', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_MARKSMANPISTOL'] = { ['index'] = 'WEAPON_MARKSMANPISTOL', ['name'] = 'Musket Pistol', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_REVOLVER'] = { ['index'] = 'WEAPON_REVOLVER', ['name'] = 'ASG CO2', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_REVOLVER_MK2'] = { ['index'] = 'WEAPON_REVOLVER_MK2', ['name'] = 'Raging Bull', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_DOUBLEACTION'] = { ['index'] = 'WEAPON_DOUBLEACTION', ['name'] = 'Python', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_RAYPISTOL'] = { ['index'] = 'WEAPON_RAYPISTOL', ['name'] = 'Raypistol', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_CERAMICPISTOL'] = { ['index'] = 'WEAPON_CERAMICPISTOL', ['name'] = 'Koch P7', ['type'] = 'equip', ['weight'] = 3.0 },
	['WEAPON_NAVYREVOLVER'] = { ['index'] = 'WEAPON_NAVYREVOLVER', ['name'] = 'Colt 1851', ['type'] = 'equip', ['weight'] = 3.0 },

	--[ Submachine Guns ][ Weapons ]-----------------------------------------------------------------------------------

	['WEAPON_MICROSMG'] = { ['index'] = 'WEAPON_MICROSMG', ['name'] = 'Micro Uzi', ['type'] = 'equip', ['weight'] = 5.0 },
	['WEAPON_SMG'] = { ['index'] = 'WEAPON_SMG', ['name'] = 'MP5', ['type'] = 'equip', ['weight'] = 5.0 },
	['WEAPON_SMG_MK2'] = { ['index'] = 'WEAPON_SMG_MK2', ['name'] = 'MP5K', ['type'] = 'equip', ['weight'] = 5.0 },
	['WEAPON_ASSAULTSMG'] = { ['index'] = 'WEAPON_ASSAULTSMG', ['name'] = 'P90', ['type'] = 'equip', ['weight'] = 5.0 },
	['WEAPON_COMBATPDW'] = { ['index'] = 'WEAPON_COMBATPDW', ['name'] = 'MPX-SD', ['type'] = 'equip', ['weight'] = 5.0 },
	['WEAPON_MACHINEPISTOL'] = { ['index'] = 'WEAPON_MACHINEPISTOL', ['name'] = 'TEC-DC9', ['type'] = 'equip', ['weight'] = 5.0 },
	['WEAPON_MINISMG'] = { ['index'] = 'WEAPON_MINISMG', ['name'] = 'VZ.82', ['type'] = 'equip', ['weight'] = 5.0 },
	['WEAPON_RAYCARBINE'] = { ['index'] = 'WEAPON_RAYCARBINE', ['name'] = 'Ray Carbine', ['type'] = 'equip', ['weight'] = 5.0 },

	--[ Shotguns ][ Weapons ]------------------------------------------------------------------------------------------

	['WEAPON_PUMPSHOTGUN'] = { ['index'] = 'WEAPON_PUMPSHOTGUN', ['name'] = 'Shotgun', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_PUMPSHOTGUN_MK2'] = { ['index'] = 'WEAPON_PUMPSHOTGUN_MK2', ['name'] = 'Remington 870', ['type'] = 'equip', ['weight'] = 7.0 },
	['WEAPON_SAWNOFFSHOTGUN'] = { ['index'] = 'WEAPON_SAWNOFFSHOTGUN', ['name'] = 'Cano Curto', ['type'] = 'equip', ['weight'] = 7.0 },
	['WEAPON_ASSAULTSHOTGUN'] = { ['index'] = 'WEAPON_ASSAULTSHOTGUN', ['name'] = 'UTS-15', ['type'] = 'equip', ['weight'] = 7.0 },
	['WEAPON_BULLPUPSHOTGUN'] = { ['index'] = 'WEAPON_BULLPUPSHOTGUN', ['name'] = 'Kel-Tec KSG ', ['type'] = 'equip', ['weight'] = 7.0 },
	['WEAPON_MUSKET'] = { ['index'] = 'WEAPON_MUSKET', ['name'] = 'Musket', ['type'] = 'equip', ['weight'] = 7.0 },
	['WEAPON_HEAVYSHOTGUN'] = { ['index'] = 'WEAPON_HEAVYSHOTGUN', ['name'] = 'Saiga 12', ['type'] = 'equip', ['weight'] = 7.0 },
	['WEAPON_DBSHOTGUN'] = { ['index'] = 'WEAPON_DBSHOTGUN', ['name'] = 'Zabala', ['type'] = 'equip', ['weight'] = 7.0 },
	['WEAPON_AUTOSHOTGUN'] = { ['index'] = 'WEAPON_AUTOSHOTGUN', ['name'] = 'Armsel Protecta', ['type'] = 'equip', ['weight'] = 7.0 },

	--[ Assault Rifles ][ Weapons ]------------------------------------------------------------------------------------

	['WEAPON_ASSAULTRIFLE'] = { ['index'] = 'WEAPON_ASSAULTRIFLE', ['name'] = 'AKS', ['type'] = 'equip', ['weight'] = 10.0 },
	['WEAPON_ASSAULTRIFLE_MK2'] = { ['index'] = 'WEAPON_ASSAULTRIFLE_MK2', ['name'] = 'AK-47', ['type'] = 'equip', ['weight'] = 10.0 },
	['WEAPON_CARBINERIFLE'] = { ['index'] = 'WEAPON_CARBINERIFLE', ['name'] = 'AR-15', ['type'] = 'equip', ['weight'] = 10.0 },
	['WEAPON_CARBINERIFLE_MK2'] = { ['index'] = 'WEAPON_CARBINERIFLE_MK2', ['name'] = 'M4-A1', ['type'] = 'equip', ['weight'] = 10.0 },
	['WEAPON_ADVANCEDRIFLE'] = { ['index'] = 'WEAPON_ADVANCEDRIFLE', ['name'] = 'Tavor CTAR-21', ['type'] = 'equip', ['weight'] = 10.0 },
	['WEAPON_SPECIALCARBINE'] = { ['index'] = 'WEAPON_SPECIALCARBINE', ['name'] = 'G36C', ['type'] = 'equip', ['weight'] = 10.0 },
	['WEAPON_SPECIALCARBINE_MK2'] = { ['index'] = 'WEAPON_SPECIALCARBINE_MK2', ['name'] = 'G36K', ['type'] = 'equip', ['weight'] = 10.0 },
	['WEAPON_BULLPUPRIFLE'] = { ['index'] = 'WEAPON_BULLPUPRIFLE', ['name'] = 'Norinco 86S', ['type'] = 'equip', ['weight'] = 10.0 },
	['WEAPON_BULLPUPRIFLE_MK2'] = { ['index'] = 'WEAPON_BULLPUPRIFLE_MK2', ['name'] = 'HS VHS-D2', ['type'] = 'equip', ['weight'] = 10.0 },
	['WEAPON_COMPACTRIFLE'] = { ['index'] = 'WEAPON_COMPACTRIFLE', ['name'] = 'Draco', ['type'] = 'equip', ['weight'] = 10.0 },

	--[ Light Machine Guns ][ Weapons ]--------------------------------------------------------------------------------

	['WEAPON_MG'] = { ['index'] = 'WEAPON_MG', ['name'] = 'PKM', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_COMBATMG'] = { ['index'] = 'WEAPON_COMBATMG', ['name'] = 'M60', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_COMBATMG_MK2'] = { ['index'] = 'WEAPON_COMBATMG_MK2', ['name'] = 'M60E4', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_GUSENBERG'] = { ['index'] = 'WEAPON_GUSENBERG', ['name'] = 'Thompson', ['type'] = 'equip', ['weight'] = 1.0 },

	--[ Sniper Rifles ][ Weapons ]-------------------------------------------------------------------------------------

	['WEAPON_SNIPERRIFLE'] = { ['index'] = 'WEAPON_SNIPERRIFLE', ['name'] = 'AW-F', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_HEAVYSNIPER'] = { ['index'] = 'WEAPON_HEAVYSNIPER', ['name'] = 'Barrett M107', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_HEAVYSNIPER_MK2'] = { ['index'] = 'WEAPON_HEAVYSNIPER_MK2', ['name'] = 'Serbu BFG-50A', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_MASKMANRIFLE'] = { ['index'] = 'WEAPON_MASKMANRIFLE', ['name'] = 'M39', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_MASKMANRIFLE_MK2'] = { ['index'] = 'WEAPON_MASKMANRIFLE_MK2', ['name'] = 'M1A', ['type'] = 'equip', ['weight'] = 1.0 },

	--[ Heavy Weapons ][ Weapons ]-------------------------------------------------------------------------------------

	['WEAPON_RPG'] = { ['index'] = 'WEAPON_RPG', ['name'] = 'RPG', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_GRENADELAUNCHER'] = { ['index'] = 'WEAPON_GRENADELAUNCHER', ['name'] = 'Lançador de Granadas', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_GRENADELAUNCHER_SMOKE'] = { ['index'] = 'WEAPON_GRENADELAUNCHER_SMOKE', ['name'] = 'Lançador de Granadas de Smoke', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_MINIGUN'] = { ['index'] = 'WEAPON_MINIGUN', ['name'] = 'Minigun', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_FIREWORK'] = { ['index'] = 'WEAPON_FIREWORK', ['name'] = 'Firework', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_FIREWORK_AMMO'] = { ['index'] = 'WEAPON_FIREWORK_AMMO', ['name'] = 'Munição Firework', ['type'] = 'recharge', ['weight'] = 1.0 },
	['WEAPON_RAILGUN'] = { ['index'] = 'WEAPON_RAILGUN', ['name'] = 'Railgun', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_HOMINGLAUNCHER'] = { ['index'] = 'WEAPON_HOMINGLAUNCHER', ['name'] = 'Railgun', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_COMPACTLAUNCHER'] = { ['index'] = 'WEAPON_COMPACTLAUNCHER', ['name'] = 'Lançador de Granadas Compacto', ['type'] = 'equip', ['weight'] = 1.0 },
	['WEAPON_RAYMINIGUN'] = { ['index'] = 'WEAPON_RAYMINIGUN', ['name'] = 'Rayminigun', ['type'] = 'equip', ['weight'] = 1.0 },

	--[ MISCELLANEOUS ]------------------------------------------------------------------------------------------------

	['GADGET_PARACHUTE'] = { ['index'] = 'GADGET_PARACHUTE', ['name'] = 'Paraquédas', ['type'] = 'equip', ['weight'] = 1.0 },

	['WEAPON_PETROLCAN'] = { ['index'] = 'WEAPON_PETROLCAN', ['name'] = 'Galão de Gasolina', ['type'] = 'equip', ['weight'] = 1.0 },
	['wammoWEAPON_FIREEXTINGUISHER'] = { ['index'] = 'wammoWEAPON_FIREEXTINGUISHER', ['name'] = 'Extintor', ['type'] = 'equip', ['weight'] = 1.0 }
}