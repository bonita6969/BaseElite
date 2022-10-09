local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

config = {}
Proxy.addInterface("nation_concessionaria", config)

-------------------------------
config.imgDir = "http://131.196.197.44/vrp_vehicles/" -- DIRETORIO DAS IMAGENS DOS VEÍCULOS

config.topVehicles = { "19ftype", "zx10", "nissangtr", "skyr34"}

config.logo = "https://media.discordapp.net/attachments/902679973129773137/980746829555695726/ELC.png" -- LOGO DO SERVIDOR

config.defaultImg = "https://svgsilh.com/svg/160895.svg" -- IMAGEM DEFAULT (SERÁ EXIBIDA QUANDO NÃO EXISTIR A IMAGEM DE ALGUM VEÍCULO NO DIRETÓRIO ESPECIFICADO)

config.openconce_permission = nil -- permissao para abrir a concessionaria

config.updateconce_permission = "manager.permissao" -- permissao para abrir o menu de gerenciamento da conce

config.porcentagem_venda = 30 -- porcentagem de venda dos veículos possuidos

config.porcentagem_testdrive = 0.1 -- porcentagem do valor do veículo paga para a realização do test drive

config.tempo_testdrive = 30 -- tempo de duração do test drive em segundos

config.maxDistance = 500 -- distância máxima (em radius(raio)) que o player poderá ir quando estiver realizando o test drive

config.porcentagem_aluguel = 1 -- porcentagem do valor do veículo paga para alugar

---------------------------------------------------------------------------
-----COMPRA DE CARRO                                                    ---
---------------------------------------------------------------------------
config.permissao1 = "prata.permissao"
config.permissao2 = "ouro.permissao"
config.permissao3 = "platina.permissao"
config.permissao4 = "supremo.permissao"
config.permissao5 = "monster.permissao"
config.permissao6 = "elite.permissao"
---------------------------------------------------------------------------
----- TOTAL DE GARAGEM DE CADA GRUPO                                                   
---------------------------------------------------------------------------
config.totalg = 4 --- PODERA TER 3 CARROS NA GARAGEM AO TOTAL E NÃO PODERA
config.totalgaragem = 4 --- SEM SET
config.totalgaragem1 = 6 -- PERMISÃO QUE VC COLOCOU EM CONFIG.PERMISSAO1 PODERA TER 10 CARROS AO TOTAL
config.totalgaragem2 = 8 --  PERMISÃO QUE VC COLOCOU EM CONFIG.PERMISSAO2 PODERA TER 11 CARROS AO TOTAL
config.totalgaragem3 = 13 --  PERMISÃO QUE VC COLOCOU EM CONFIG.PERMISSAO3 PODERA TER 12 CARROS AO TOTAL
config.totalgaragem4 = 16 --  PERMISÃO QUE VC COLOCOU EM CONFIG.PERMISSAO3 PODERA TER 12 CARROS AO TOTAL
config.totalgaragem5 = 20 --  PERMISÃO QUE VC COLOCOU EM CONFIG.PERMISSAO3 PODERA TER 12 CARROS AO TOTAL
config.totalgaragem6 = 30 --  PERMISÃO QUE VC COLOCOU EM CONFIG.PERMISSAO3 PODERA TER 12 CARROS AO TOTAL

-- DESCONTOS POR PERMISSÃO

config.descontos = {
    {perm = "elite.permissao", porcentagem = 70},
    {perm = "monster.permissao", porcentagem = 60},
    {perm = "supremo.permissao", porcentagem = 50},
    {perm = "platina.permissao", porcentagem = 40},
    {perm = "ouro.permissao", porcentagem = 30},
    {perm = "prata.permissao", porcentagem = 20},
}

-- CLASSES QUE APARECEM NO MENU DA CONCE

config.conceClasses = {
    {
        class = "carros",
        img = "https://img.indianautosblog.com/2018/09/25/india-bound-2019-honda-civic-images-front-three-qu-e966.jpg"
    }, {
        class = "import",
        img = "https://cdn.discordapp.com/attachments/983226699053416538/995146188493959178/thumb2-lamborghini-gallardo-supercars-motion-blur-road-gray-gallardo.jpg"
    }, {
        class = "motos",
        img = "https://i.pinimg.com/originals/cc/92/dd/cc92dda56f23a2a41682e80e7fe0f744.jpg"
    }, {
        class = "trucks",
        img = "https://images3.alphacoders.com/149/thumb-1920-149257.jpg"
    }, {
        class = "exclusivos",
        img = "https://cdn.discordapp.com/attachments/983226699053416538/995146188795936788/thumb2-ford-transit-custom-sport-4k-2018-cars-motion-blur-orange-ford-transit.jpg"
    }
}

-- IMAGEM QUE APARECE NA SEÇÃO DE 'MEUS VEÍCULOS'

config.myVehicles_img =
    "https://cdn.discordapp.com/attachments/728820577464221838/974005960144212048/unknown.png"

-- CLASSES DOS VEÍCULOS INSERIDAS DENTRO DAS CLASSES QUE APARECEM NA CONCE

config.availableClasses = {
    ["carros"] = {"carros", "esportivos"},
    -- ["br"] = {"carrosbr", "motosbr"},
    ["import"] = {"import", "exclusive"},
    ["motos"] = {"motos"},
    ["trucks"] = {"truck"},
    ["exclusivos"] = {"exclusive"}
}

-- ÍCONES DA CONCE

config.miscIcons = {
	{ description = "Força e velocidade necessárias para aquela dose de adrenalina.", img = "https://cdn.discordapp.com/attachments/930749163157721108/957864238058209280/forca.png" },
	{ description = "Incríveis opções econômicas que cabem no seu bolso!", img = "https://cdn.discordapp.com/attachments/930749163157721108/957864238284697650/saco-de-dinheiro-em-dolares-na-mao.png" },
	{ description = "Para você que valoriza a eficácia e praticidade.", img = "https://cdn.discordapp.com/attachments/930749163157721108/957864238490214400/melhor-pratica.png" },
}

-- RETORNA AS INFORMAÇÕES CONTIDAS NA LISTA DE UM VEÍCULO ESPECÍFICO
config.getVehicleInfo = function(vehicle)
    for k, v in pairs(vRP.vehicleGlobal()) do
        if vehicle == v.hash or vehicle == k or vehicle == v.name then 
            return v end
    end
    return false
end

config.getVehicleInfo2 = function(vehicle)
    for k, v in pairs(vRP.vehicleGlobal()) do
        if vehicle == v.hash or vehicle == k or vehicle == v.name then 
            return k end
    end
    return false
end

-- RETORNA A CAPACIDADE DO PORTA-MALAS DE UM VEÍCULO ESPECÍFICO
config.getVehicleTrunk = function(vehicle)
    local vehInfo = config.getVehicleInfo(vehicle)
    if vehInfo then return vehInfo.capacidade or 0 end
    return 0
end

-- RETORNA O PREÇO DE UM VEÍCULO ESPECÍFICO
config.getVehiclePrice = function(vehicle)
    local vehInfo = config.getVehicleInfo(vehicle)
    if vehInfo then return vehInfo.price or 0 end
    return 0
end

-- RETORNA O TIPO DE UM VEÍCULO ESPECÍFICO
config.getVehicleType = function(vehicle)
    local vehInfo = config.getVehicleInfo(vehicle)
    if vehInfo then return vehInfo.tipo or 0 end
    return "none"
end

-- RETORNA O STATUS DE BANIDO DE UM VEÍCULO ESPECÍFICO
config.isVehicleBanned = function(vehicle)
    local vehInfo = config.getVehicleInfo(vehicle)
    if vehInfo then return vehInfo.banido end
    return false
end

-------------------------------

--- MYSQL---

vRP._prepare("nation_conce/getConceVehicles",
             "SELECT * FROM vrp_estoque WHERE quantidade > 0")

vRP._prepare("nation_conce/hasVehicle",
             "SELECT vehicle, alugado FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")

vRP._prepare("nation_conce/hasFullVehicle",
             "SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND alugado = 0")

vRP._prepare("nation_conce/hasRentedVehicle",
             "SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND alugado = 1")

vRP._prepare("nation_conce/getMyVehicles",
             "SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id")

vRP._prepare("nation_conce/deleteRentedVehicles",
             "DELETE FROM vrp_user_vehicles WHERE alugado = 1 AND data_alugado != @data_alugado")

vRP._prepare("nation_conce/updateUserVehicle",
             "UPDATE vrp_user_vehicles SET alugado = 0 WHERE user_id = @user_id AND vehicle = @vehicle")

vRP.prepare("nation_conce/addUserVehicle", [[
	INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,detido,time,engine,body,fuel,ipva) 
	VALUES(@user_id,@vehicle,@detido,@time,@engine,@body,@fuel,@ipva);
]])

vRP.prepare("nation_conce/addUserRentedVehicle", [[
	INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,detido,time,engine,body,fuel,ipva,alugado,data_alugado) 
	VALUES(@user_id,@vehicle,@detido,@time,@engine,@body,@fuel,@ipva,1,@data_alugado);
]])

vRP._prepare("nation_conce/removeUserVehicle",
             "DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")

-----------

function getConceList(cb)
    Citizen.CreateThread(function()
        local vehicles = vRP.query("nation_conce/getConceVehicles") or {}
        cb(vehicles)
    end)
end

function getTopList()
	getConceList(function(list)
		local vehicleList = {}
		for k,v in ipairs(list) do
			local vehInfo = config.getVehicleInfo(v.vehicle)
			if vehInfo then
				vehicleList[#vehicleList+1] = { 
					vehicle = v.vehicle, price = vehInfo.price
				}
			end
		end
		if #vehicleList >= 5 then
			table.sort(vehicleList, function(a, b) return a.price > b.price end)
			for i = 1, 5 do
				local veh = vehicleList[i]
				config.topVehicles[i] = veh.vehicle 
			end
		end
	end)
end

-- NOMES DAS CLASSES DOS VEÍCULOS

config.vehicleClasses = {
    [0] = "compact",
    [1] = "sedan",
    [2] = "suv",
    [3] = "coupé",
    [4] = "muscle",
    [5] = "classic",
    [6] = "sport",
    [7] = "super",
    [8] = "moto",
    [9] = "off-road",
    [10] = "industrial",
    [11] = "utility",
    [12] = "van",
    [13] = "cycle",
    [14] = "boat",
    [15] = "helicopter",
    [16] = "plane",
    [17] = "service",
    [18] = "emergency",
    [19] = "military",
    [20] = "commercial",
    [21] = "train",
    [21] = "import"
}

-- FUNCÃO DE COMPRA DO VEÍCULO

config.tryBuyVehicle = function(source, user_id, vehicle, color, price, mods)
    if source and user_id and vehicle and color and price and mods then
        local data = vRP.query("nation_conce/hasVehicle",
                               {user_id = user_id, vehicle = vehicle})
        local hasVehicle = #data > 0
        local isRented = data[1] and data[1].alugado > 0
        if hasVehicle and not isRented then
            return false, "veículo já possuído"
        end

        if vRP.tryPayment(user_id, price) then
            Citizen.CreateThread(function()
                if isRented then
                    vRP.execute("nation_conce/updateUserVehicle",
                                {user_id = user_id, vehicle = vehicle})
                else
                    vRP.execute("nation_conce/addUserVehicle", {
                        user_id = user_id,
                        vehicle = vehicle,
                        detido = 0,
                        time = 0,
                        engine = 1000,
                        body = 1000,
                        fuel = 100,
                        ipva = os.time()
                    })
                end
                mods.customPcolor = color
                vRP.setSData("custom:u" .. user_id .. "veh_" .. vehicle,
                             json.encode(mods))
            end)
            return true, "sucesso!"
        else
            return false, "falha no pagamento"
        end
    end
    return false, "erro inesperado"
end

-- FUNÇÃO DE VENDA DO VEÍCULO

config.trySellVehicle = function(source, user_id, vehicle, price)
    if source and user_id and vehicle and price then
        local hasVehicle = #vRP.query("nation_conce/hasFullVehicle",
                                      {user_id = user_id, vehicle = vehicle}) >
                               0
        if hasVehicle then
            vRP.execute("losanjos/rem_vehicle",
                        {user_id = parseInt(user_id), vehicle = vehicle})
            vRP.execute("losanjos/rem_srv_data", {
                dkey = "custom:u" .. parseInt(user_id) .. "veh_" .. vehicle
            })
            vRP.execute("losanjos/rem_srv_data", {
                dkey = "chest:u" .. parseInt(user_id) .. "veh_" .. vehicle
            })
            vRP.giveMoney(user_id, parseInt(price))
            return true, "sucesso!"
        else
            return false, "veículo alugado ou já vendido"
        end
    end
    return false, "erro inesperado"
end

-- VERIFICAÇÃO DE TEST DRIVE

config.tryTestDrive = function(source, user_id, info)
    if source and user_id and info then
        local price =
            parseInt(info.price * (config.porcentagem_testdrive / 100))
        return true, "deseja pagar <b>$ " .. vRP.format(price) ..
                   "</b> para realizar o test drive em um(a) <b>" .. info.name ..
                   "</b> ?"
    end
    return false, "erro inesperado"
end

-- VERIFICAÇÃO DO PAGAMENTO DO TEST DRIVEc

config.payTest = function(source, user_id, info)
    if source and user_id and info then
        local price =
            parseInt(info.price * (config.porcentagem_testdrive / 100))
        if vRP.tryPayment(user_id, price) then
            return true, "sucesso!", price
        else
            return false, "falha no pagamento"
        end
    end
    return false, "erro inesperado"
end

-- DEVOLVER O DINHEIRO CASO NÃO DÊ PARA FAZER O TEST

config.chargeBack = function(source, user_id, price)
    if source and user_id and price then
        vRP.giveMoney(user_id, price)
        TriggerClientEvent("Notify", source, "importante",
                           "Você recebeu seus <b>$ " .. vRP.format(price) ..
                               "</b> de volta.", 3000)
    end
end

-- VERIFICAÇÃO DE ALUGUEL DO VEÍCULO

config.tryRentVehicle = function(source, user_id, info, vehicleName)
    if source and user_id and info then
        local hasVehicle = #vRP.query("nation_conce/hasVehicle",
                                      {user_id = user_id, vehicle = vehicleName}) >
                               0
        if hasVehicle then return false, "veículo já possuído" end
        local price = parseInt(info.price * (config.porcentagem_aluguel / 100))
        return true,
               "deseja pagar <b>$ " .. vRP.format(price) ..
                   "</b> para alugar um(a) <b>" .. info.name ..
                   "</b> por 1 dia?"
    end
    return false, "erro inesperado"
end

-- VERIFICAÇÃO DO PAGAMENTO DO ALUGUEL DO VEÍCULO

config.tryPayRent = function(source, user_id, info, vehicleName)
    if source and user_id and info then
        local price = parseInt(info.price * (config.porcentagem_aluguel / 100))
        if vRP.tryPayment(user_id, price) then
            Citizen.CreateThread(function()
                vRP.execute("nation_conce/addUserRentedVehicle", {
                    user_id = user_id,
                    vehicle = vehicleName,
                    detido = 0,
                    time = 0,
                    engine = 1000,
                    body = 1000,
                    fuel = 100,
                    ipva = os.time(),
                    data_alugado = os.date("%d/%m/%Y")
                })
            end)
            return true, "sucesso!"
        else
            return false, "falha no pagamento"
        end
    end
    return false, "erro inesperado"
end

getTopList() -- pega os veículos mais caros da conce e coloca na lista de destaque

-- LOCAIS DAS CONCESSIONARIAS E REALIZAÇÃO DE TESTES

config.locais = {
    {
        conce = vec3(-56.14, -1096.36, 26.43),
        test_locais = {
            { coords = vec3(-11.25,-1080.46,26.68), h = 129.4 },
			{ coords = vec3(-14.11,-1079.84,26.67), h = 122.02 },
			{ coords = vec3(-16.43,-1078.62,26.67), h = 126.74 },
			{ coords = vec3(-8.45,-1081.58,26.67), h = 117.45 },
        }
    }, {
        conce = vec3(-1123.49, -1708.12, 4.45),
        test_locais = {
            {coords = vec3(-1177.30, -1743.51, 4.04), h = 204.54},
            {coords = vec3(-1173.95, -1741.34, 4.05), h = 212.41},
            {coords = vec3(-1171.41, -1739.55, 4.07), h = 210.01}
        }
    }
}

