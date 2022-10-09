config = {}

config.license = "EQ8SWONYJBCY0FO62WWF" -- Sua licença
---------------------------------------- [ SCRIPT ELITE HOMES ] -----------------------------------------

config.policePerm = 'policia.permissao' -- Permissao da sua Policia

config.permissaoadd = 'addhomes.permissao' -- Permissão para adicionar casas

config.permissaorem = 'remhomes.permissao' -- Permissão para remover casas

config.admpermissao = 'manager.permissao' -- Permissão que poderá CRIAR casas na cidade

AlterarInterior = true -- Se quiser deixar a opção de mudança de interior ativada deixe true

config.houseDecor = false -- Se vc usa o sistema de decoração, deixa ativado. Se vc não tiver e deixar true, vai crashar!

config.IsMoneyItem = true -- Se na sua base o dinheiro for item deixar igual true, se for carteira então false

config.chestcustomclient = false -- Se o evento do seu Inventário for via Client-Side deixe true e o de baixo false

config.chestcustomserver = false -- Se o evento do seu Inventário for via Server-Side deixe true e o de cima false

config.roupascustom = false -- Caso use Guarda Roupas personalizados (Como o do nyo)

config.garagevalor = '500000' -- Valor para adicionar/mudar de posição a gargem

config.addgarage = '100' -- Valor para adicionar permissão a outro morador na garagem

config.NameItemMoney = 'dinheiro' -- Como se chama o nome do item dinheiro na sua base? Mudar aqui

config.taxas = 0.03 -- Taxa das residências (Normais)

config.taxvip = 0.000020 -- Taxa das casas VIPs (Para que essa taxa se aplique o valor das residências devem estar a cima de R$999.999.9 )

------- [ TEXTOS DOS MARKERS ] ---------

textobau = "Aperte ~r~E~w~P/ Baú ~g~" -- Texto que aparece no Blip do BAÚ
textosair = "Aperte ~r~E~w~ <br>P/ SAIR ~g~ " -- Texto que aparece no Blip para SAIR da Casa
textoenter = "Aperte ~r~E~w~ <br>P/ ENTRAR ~g~" -- Texto que aparece no Blip pra ENTRAR na Casa
textoroupas = "~r~E~w~  Roupas" -- Texto que aparece no Blip do Guarda Roupas

-------- [ EVENTOS DE NOTIFY ] ---------

evento_aviso = "aviso" -- Evento de notify de sucesso/verde
evento_negado = "negado" -- Evento de notify de aviso/amarelo
evento_sucesso = "sucesso" -- Evento de notify de negado/vermelho

------------ [ WEBHOOKs ] -----------------

config.iptu = 'https://discord.com/api/webhooks/1027615382799917117/ektO0ggK8bjLFL5XnCoSjSC6Qgfa2w5E1C1PxoIA-rg9kWAXO5X3ZQb_nM2HuZHMaN2s' -- Log do pagamento do IPTU
config.darcasa = 'https://discord.com/api/webhooks/1027615610600968232/0k7rcJKW2U9mvI2beCdE_emHXfmvxK3fus8EQKFOwGh0inhSDvq-EH3GleYlJUEnhDIc' -- Log de adição de casas
config.remcasa = 'https://discord.com/api/webhooks/1027615774229151824/lBG4v1Ew-An49F3fW_-W1RKOK9x_IKbWlkmLztWmMLoxVAxSJ8HSUdgnPdBVns0q3Gxs' -- Log de remoção de casas
config.criarap = 'https://discord.com/api/webhooks/1027615952415752283/FGW6K3nWIL6I6tjno6FoxNTC9fJKI17-x6z7HPbVxl5vvYHmloa80BBHzxRKjC1pbvtU' -- Webhook log de criação de apartamentos
config.criarcasa = 'https://discord.com/api/webhooks/1027616429266190428/o8FJVs57uRuFU7sBydylpCL1PgS4MvgiJuJ_mnkU7D6tzfolM2divsVb29cNxoEKOLkK' -- Webhook log de criação de casas
config.buyhomes = 'https://discord.com/api/webhooks/1027616810687795300/DJ0HCXw0f3E3PpGPJ67xhGo-YSXC6hwwVve8eCHA0LsBLlCPGKGJyKXjP9Xkgtn7MqEG' -- Log de compra de casas
config.transfer = 'https://discord.com/api/webhooks/1027617426763944006/5SdNEZnkWXOVxKYyiJaRyG5fP9NHZjVScwv7dzDKyPBD_uNJjfbFDH_npyVPns6YOjOa' -- Log de trasnferência do imóvel
config.addhomes = 'https://discord.com/api/webhooks/1027617651222130698/NIHjB5u6dtB2lxRlUfq6TVgO44e8fjJ73bSCHl4MpF055xJ0XjYSPxq5sUsHwB8h6Ogd' -- Log de adição de permissão na casa
config.remhomes = 'https://discord.com/api/webhooks/1027617800187039816/8BIwUiRqNHMpuQPN7fCI4w4M7E2mMejrD-Zt7DaCJLhHq3BPW7TezudYMYuxxHMeQjg1' -- Log de remoção de permissão na casa
config.bugRotear = 'https://discord.com/api/webhooks/1027618063052439632/0Th3g5BUJDUiEZ9H9_eWT50nPiOkHa7UtjeFkskOSjmn6uYfmva-Gtd6syfTzD0qKbxx' -- Log de pessoa tentando bugar pra sair da casa
config.addpermgarage = 'https://discord.com/api/webhooks/1027618295710498867/-wq1i0msmJvX0Upz7oq7qsT2uz5bGf6CS1D0_EnLepdsukf59ze8aOhtEXd0jNAe4cEG' -- Log de adição de permissão na garagem da casa

----------------- [ EVENTOS DE BAÚ E GAURDA ROUPAS ] ---------------------

function roupascustomopen(homename) -- Se for client e deixe o config.roupascustom = true
	TriggerEvent('elite_homes:roupas',home) -- Evento aqui 
end

function chestcustomopenclient(homename) -- Se for client e deixe o config.chestcustomclient = true
	exports['vrp_chest']:homechest(homename)
	TriggerEvent('ld-inv:Server:OpenInventory','chest:'..houseName,{isHouse=true,slots=20,weight=1000},houseName) -- Evento aqui
end

function chestcustomopenserver(homename,peso) -- Se for server  e deixe o config.chestcustomserver = true
	TriggerServerEvent('ld-inv:Server:OpenInventory','chest:'..houseName,{isHouse=true,slots=20,weight=peso},houseName) -- Evento aqui
end
----------------- [ CONFIGURAÇÃO DOS BAÚS ] ---------------------

config.chest = {
	['Small'] = { -- Nome do Baú
		valor = 300, -- Valor do Baú para aumentar
		size = 1000,  -- Tamanho em KG do baú
		['info'] = '[1000KG] Baú pequeno, mas útil' -- Informação do Baú
	},
	
	['Medium'] = {
		valor = 3000, 
		size = 2000, 
		['info'] = '[2000KG] Para quem não tem muita coisa para guardar' 
	},

	['Big'] = {
		valor = 6000, 
		size = 3000, 
		['info'] = '[3000KG] Baú grande, e bem espaçoso!' 
	},

	['XLbig'] = {
		valor = 50000, 
		size = 5000, 
		['info'] = '[5000KG] Vai caber a familia toda aqui..' 
	}
}

----------------- [ CONFIGURAÇÃO DOS INTERIORES DAS CASAS ] ---------------------

config.Interiores = { -- Tem total liberdade para adição de MAIS interiores

	['Hotel'] = { 
		['price'] = 500000, -- Preço do interior (Apenas para trocar os interiores)
		['info'] = 'Um quarto de Hotel', -- Informação que aparece sobre o interior
		['location'] = { ['x'] = 324.31, ['y'] = -173.8, ['z'] = 70.37, ['h'] = 262.08 }, -- Localização da Porta de Entrada do interior
		['vault'] = { ['x'] = 319.75, ['y'] = -172.39, ['z'] = 70.37 }, -- Localização do Baú no interior
		['geladeira'] = { ['x'] = 321.98, ['y'] = -173.75, ['z'] = 70.37 },  -- Localização da Geladeira ou Armário do interior (Por enquanto sem função mas coloque) 
		['armario'] = { ['x'] = 317.89, ['y'] = -170.57, ['z'] = 70.37 } -- Localização do Guarda Roupas no interior (Mesmo se usar OUTRO script pra função de Guarda Roupas)
	},

	['AppartamentoM'] = { 
		['price'] = 1500000, 
		['info'] = 'Luxo1',
		['location'] = { ['x'] = 119.85, ['y'] = 514.3, ['z'] = 138.97, ['h'] = 3.563}, 
		['vault'] = { ['x'] = 106.01, ['y'] = 505.73, ['z'] = 138.37 }, 
		['geladeira'] = { ['x'] = 110.76, ['y'] = 499.76, ['z'] = 138.37 }, 
		['armario'] = { ['x'] = 131.82, ['y'] = 512.78, ['z'] = 137.77 } 
	},

	['AppartamentoG'] = { 
		['price'] = 2500000, 
		['info'] = 'Luxo2',
		['location'] = { ['x'] = 330.79, ['y'] = 454.04, ['z'] = 137.0, ['h'] = 89.98}, 
		['vault'] = { ['x'] = 320.07, ['y'] = 460.22, ['z'] = 137.01 }, 
		['geladeira'] = { ['x'] = 312.5, ['y'] = 464.82, ['z'] = 135.6 }, 
		['armario'] = { ['x'] = 314.73, ['y'] = 473.17, ['z'] = 130.8 } 
	},

	['HouseP'] = { 
		['price'] = 1000000, 
		['info'] = 'Casa Simples',
		['location'] = { ['x'] = 321.02, ['y'] = -1856.04, ['z'] = 20.03, ['h'] = 196.22}, 
		['vault'] = { ['x'] = 328.92, ['y'] = -1861.63, ['z'] = 20.03 }, 
		['geladeira'] = { ['x'] = 325.09, ['y'] = -1865.75, ['z'] = 20.03 }, 
		['armario'] = { ['x'] = 324.66, ['y'] = -1853.91, ['z'] = 20.03 } 
	},

	['ApartamentoP'] = { 
		['price'] = 850000, 
		['info'] = 'AP Simples',
		['location'] = { ['x'] = 254.52, ['y'] = -1725.85, ['z'] = 20.64, ['h'] = 139.617}, 
		['vault'] = { ['x'] = 260.74, ['y'] = -1730.54, ['z'] = 22.64 }, 
		['geladeira'] = { ['x'] = 262.5, ['y'] = -1731.79, ['z'] = 22.64 }, 
		['armario'] = { ['x'] = 261.37, ['y'] = -1723.21, ['z'] = 22.64 } 
	},

	['HouseLuxuosa'] = { 
		['price'] = 5000000, 
		['info'] = 'Luxo Master',
		['location'] = { ['x'] = -2994.74, ['y'] = 719.47, ['z'] = 14.56, ['h'] = 186.77}, 
		['vault'] = { ['x'] = -2990.78, ['y'] = 719.92, ['z'] = 6.95 }, 
		['geladeira'] = { ['x'] = -2994.02, ['y'] = 723.99, ['z'] = 14.56 }, 
		['armario'] = { ['x'] = -2986.0, ['y'] = 728.48, ['z'] = 10.75 } 
	},

	['ApartamentoM'] = { 
		['price'] = 900000, 
		['info'] = 'AP Médio',
		['location'] = { ['x'] = 1386.66, ['y'] = -573.9, ['z'] = 67.84, ['h'] = 89.33}, 
		['vault'] = {['x'] = 1401.73, ['y'] = -572.86, ['z'] = 67.84 }, 
		['geladeira'] = { ['x'] = 1396.22, ['y'] = -566.69, ['z'] = 67.84 }, 
		['armario'] = { ['x'] = 1406.04, ['y'] = -569.73, ['z'] = 67.84 } 
	},

	['CoberturaV'] = { 
		['price'] = 999999999999999999999999, 
		['info'] = 'Cobertura de Luxo',
		['location'] = { ['x'] = -288.44, ['y'] = -722.61, ['z'] = 125.48, ['h'] = 254.20}, 
		['vault'] = { ['x'] = -262.76, ['y'] = -726.18, ['z'] = 125.48 }, 
		['geladeira'] = { ['x'] = 1396.22, ['y'] = -566.69, ['z'] = 67.84 }, 
		['armario'] = { ['x'] = -279.1, ['y'] = -722.51, ['z'] = 125.47 } 
	},

}
----------------- [ CONFIGURAÇÃO DE QUANTOS APs VAI APARECER NA OPÇÃO DE CRIAR APARTAMENTOS ] ---------------------

config.QTDaps = { -- Não é interessante colocar um numero muito alto!, pq vai sobrecarregar a DB.

	['min'] = 1,
	['max'] = 10
}

----------------- [ CONFIGURAÇÃO DOS INTERIORES DOS APARTAMENTOS ] ---------------------

config.Apartamento = {

	['Suites'] = { 
		['price'] = 500000, -- Preço do interior (Apenas para trocar os interiores)
		['info'] = 'Um quarto de Hotel', -- Informação que aparece sobre o interior
		['location'] = { ['x'] = 324.31, ['y'] = -173.8, ['z'] = 70.37, ['h'] = 262.08 }, -- Localização da Porta de Entrada do interior
		['vault'] = { ['x'] = 319.75, ['y'] = -172.39, ['z'] = 70.37 }, -- Localização do Baú no interior
		['size'] = 10000, -- Tamanho do baú do Apartamento (Apartamento não poderão AUMENTAR os Baús)
		['armario'] = { ['x'] = 317.89, ['y'] = -170.57, ['z'] = 70.37 } -- Localização do Guarda Roupas no interior (Mesmo se usar OUTRO script pra função de Guarda Roupas)
	},

	['Officer'] = { 
		['price'] = 2500000,
		['info'] = 'Luxo2',
		['location'] = { ['x'] = -787.08, ['y'] = 315.6, ['z'] = 187.92, ['h'] = 354.80 }, 
		['vault'] = { ['x'] = -794.99, ['y'] = 326.42, ['z'] = 187.32 }, 
		['size'] = 10000, 
		['armario'] = { ['x'] = -797.82, ['y'] = 328.03, ['z'] = 190.72 } 
	},
	['Executive'] = { 
		['price'] = 2500000, 
		['info'] = 'Executivo',
		['location'] = { ['x'] = -781.92, ['y'] = 325.87, ['z'] = 176.81, ['h'] = 354.80 }, 
		['vault'] = { ['x'] = -794.99, ['y'] = 326.42, ['z'] = 187.32 }, 
		['size'] = 10000, 
		['armario'] = { ['x'] = -797.75, ['y'] = 1328.11, ['z'] = 1290.72 } 
	},
	['Executive1'] = { 
		['price'] = 2500000, 
		['info'] = 'Executivo',
		['location'] = { ['x'] = -781.92, ['y'] = 325.87, ['z'] = 176.81, ['h'] = 354.80 }, 
		['vault'] = { ['x'] = -794.99, ['y'] = 326.42, ['z'] = 187.32 }, 
		['size'] = 10000, 
		['armario'] = { ['x'] = -797.75, ['y'] = 1328.11, ['z'] = 1290.72 } 
	},

}

----------------- [ CONFIGURAÇÃO DOS COMANDOS DISPONÍVEIS PARA USAR SEM O DYNAMIC ] ---------------------

RegisterCommand("UpdateBlips",function() -- Comando para dar update nos blips após criar a casa
	updateBlipHomes()
	TriggerEvent('Notify',evento_sucesso,'Atualizou os blips da casa com sucesso!')
end) 

RegisterCommand("moradia",function(source) -- Nome do comando para criar Casas/Apartamentos
	local adm, id = vSERVER.PermADM()
	if not adm then return end  --DESCOMENTAR PARA SO ADM CRIAR E GERENCIAR CASAS
	local sourceP = GetPlayerServerId(PlayerId())
	if vSERVER.Ciente() then 
		Choices[sourceP] = {}
		Choices[sourceP]['creating'] = true
		Choices[sourceP]['user_id'] = id
		exports["dynamic"]:SubMenu("Gerenciar Casas/AP: ","Criar Moradias","GerenciarHomes")
		exports["dynamic"]:AddButton("Casa","Criar Casa","InvokeHomeAndAp",'casinha',"GerenciarHomes",false)
		exports["dynamic"]:AddButton("Apartamento","Criar Apartamento","InvokeHomeAndAp",'apartamento',"GerenciarHomes",false)
	end 
end)

return config