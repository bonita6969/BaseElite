local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
fclient = Tunnel.getInterface("nation_concessionaria")
func = {}
Tunnel.bindInterface("nation_concessionaria", func)

local conceVehicles = {}
local userVehicles = {}

function func.getConfig() return config end

RegisterServerEvent('nationConce:getConfig')
AddEventHandler('nationConce:getConfig', function()
    local source = source
    TriggerClientEvent("nationConce:setConfig", source, config)
end)

vRP._prepare("getVehicles", "SELECT * FROM nation_concessionaria")

function getDbVehicles()
    conceVehicles = {}
    for k, v in pairs(vRP.vehicleGlobal()) do
        if v.tipo ~= "work" and v.tipo ~= "importadmin" then
            local vehicle = vRP.query("creative/get_estoque", {vehicle = k})
            local estoque = 0
            if vehicle[1] ~= nil then
                estoque = parseInt(vehicle[1].quantidade)
            end
            conceVehicles[#conceVehicles + 1] = {
                vehicle = k,
                price = v.price,
                modelo = v.name,
                capacidade = v.mala,
                name = v.name,
                estoque = estoque
            }
            conceVehicles[#conceVehicles].class = v.tipo
        end
    end
end

function checkRentedVehicles()
    vRP.execute("nation_conce/deleteRentedVehicles",
                {data_alugado = os.date("%d/%m/%Y")})
    Wait(60 * 1000 * 60 * 6)
    checkRentedVehicles()
end

Citizen.CreateThread(function()
    getDbVehicles()
    checkRentedVehicles()
end)


function func.getConceVehicles() return conceVehicles end

function func.getTopVehicles()
    local list = {}
    if config.topVehicles and type(config.topVehicles == "table") then
        for _, veh in ipairs(config.topVehicles) do
            local vehInfo = getTopVehicleInfo(veh)
            if vehInfo then list[#list + 1] = vehInfo end
        end
    end
    return list
end

function func.getDiscount(id)
    local source = source
    local user_id = id or vRP.getUserId(source)
    for _, i in pairs(config.descontos) do
        if vRP.hasPermission(user_id, i.perm) then
            if i.porcentagem > 100 or i.porcentagem < 0 then return 0 end
            return i.porcentagem
        end
    end
    return 0
end

function getTopVehicleInfo(vehicle)
    if vehicle and conceVehicles then
        for k, v in ipairs(conceVehicles) do
            if (v.name == vehicle) then return conceVehicles[k] end
        end
    end
    return false
end

function getVehicleEstoque(vehicle)
    if vehicle then
        for _, veh in ipairs(conceVehicles) do
            if veh.vehicle == vehicle then return veh.estoque end
        end
    end
    return 0
end

function getVehiclePrice(vehicle)
    if vehicle then
        for _, veh in ipairs(conceVehicles) do
            if veh.vehicle == vehicle then return veh.price end
        end
    end
    return 0
end

function func.buyVehicle(vehicle, color)
    local source = source
    local user_id = vRP.getUserId(source)
    local estoque = getVehicleEstoque(vehicle)
    local state, message
    if vRP.vehicleType(vehicle) == "import" or vRP.vehicleType(vehicle) == "exclusive" 
    or vRP.vehicleType(vehicle) == "work" or vRP.vehicleType(vehicle) == "importadmin" then
        state, message = false, "Veículo exclusivo do VIP"
        return state, message
    end

    if estoque <= 0 then
        return false, "veículo fora de estoque"
    elseif hasVehicle(user_id, vehicle) then
        return false, "veículo já possuído"
    end
    local maxvehs = vRP.query("creative/con_maxvehs",
                              {user_id = parseInt(user_id)})
    local totalGaragens = config.totalg
    if vRP.getPremium(user_id) then
        if parseInt(maxvehs[1].qtd) >= totalGaragens + config.totalgaragem then
            return false,
                   "Atingiu o número máximo de veículos em sua garagem."
        end
    elseif vRP.hasPermission(user_id, config.permissao1) then
        if parseInt(maxvehs[1].qtd) >= totalGaragens + config.totalgaragem1 then
            return false,
                   "Atingiu o número máximo de veículos em sua garagem."
        end
    elseif vRP.hasPermission(user_id, config.permissao2) then
        if parseInt(maxvehs[1].qtd) >= totalGaragens + config.totalgaragem2 then
            return false,
                   "Atingiu o número máximo de veículos em sua garagem."
        end
    elseif vRP.hasPermission(user_id, config.permissao3) then
        if parseInt(maxvehs[1].qtd) >= totalGaragens + config.totalgaragem3 then
            return false,
                   "Atingiu o número máximo de veículos em sua garagem."
        end
    elseif vRP.hasPermission(user_id, config.permissao4) then
        if parseInt(maxvehs[1].qtd) >= totalGaragens + config.totalgaragem4 then
            return false,
                   "Atingiu o número máximo de veículos em sua garagem."
        end
    elseif vRP.hasPermission(user_id, config.permissao5) then
        if parseInt(maxvehs[1].qtd) >= totalGaragens + config.totalgaragem5 then
            return false,
                   "Atingiu o número máximo de veículos em sua garagem."
        end
    elseif vRP.hasPermission(user_id, config.permissao6) then
        if parseInt(maxvehs[1].qtd) >= totalGaragens + config.totalgaragem6 then
            return false,
                   "Atingiu o número máximo de veículos em sua garagem."
        end
    else
        if parseInt(maxvehs[1].qtd) >= config.totalg then
            return false,
                   "Atingiu o número máximo de veículos em sua garagem."
        end
    end

    local desconto = func.getDiscount(user_id) / 100
    local price = getVehiclePrice(vehicle)
    price = parseInt(price - (price * desconto))
    local vehName = config.getVehicleInfo2(vehicle)
    local mods = fclient.getVehicleMods(source, vehicle)
    local state, message = config.tryBuyVehicle(source, user_id, vehName, color,
                                                price, mods)
    if state then
        local vehInfo = config.getVehicleInfo(vehicle)
        removeEstoque(vehName)
        if vehInfo then addUserVehicle(user_id, vehInfo, vehName) end
    end
    return state, message
end

function func.sellVehicle(vehicle)
    local source = source
    local user_id = vRP.getUserId(source)
    local state, message = false, "erro inesperado"
    local vehInfo = config.getVehicleInfo(vehicle)

    local vehicleName = config.getVehicleInfo2(vehicle)
    if hasVehicle(user_id, vehicleName) and vehInfo then
        if vehInfo.tipo == "import" or vehInfo.tipo == "exclusive" 
        or vehInfo.tipo == "work"  or vehInfo.tipo == "importadmin" then
            state, message = false, "Veículo exclusivo do VIP"
            return state, message
        end
        local price = vehInfo.price * (config.porcentagem_venda / 100)
        state, message = config.trySellVehicle(source, user_id, vehicleName, price)
        if state then
            removeUserVehicle(user_id, vehicleName)
            addEstoque(vehicleName, 1)
        end
    end
    return state, message
end

function hasVehicle(user_id, vehicle)
    if user_id and vehicle and userVehicles[user_id] then
        for _, veh in ipairs(userVehicles[user_id]) do
            if veh.spawnName == vehicle then return true end
        end
    end
    return false
end

function addUserVehicle(user_id, vehInfo, vehName)
    if user_id and userVehicles[user_id] then
        local veh = {
            spawnName = vehName,
            vehicle = vehInfo.name,
            price = vehInfo.price * (config.porcentagem_venda / 100),
            modelo = vehInfo.modelo,
            capacidade = vehInfo.capacidade
        }
        table.insert(userVehicles[user_id], veh)
    end
end

function removeUserVehicle(user_id, vehicle)
    if user_id and vehicle and userVehicles[user_id] then
        for i, veh in ipairs(userVehicles[user_id]) do
            if veh.spawnName == vehicle then
                table.remove(userVehicles[user_id], i)
                return
            end
        end
    end
end

function removeEstoque(vehicle, qtd)
    if vehicle then
        local qtd = qtd or 1
        for i, veh in ipairs(conceVehicles) do
            if vehicle == veh.vehicle then
                conceVehicles[i].estoque = conceVehicles[i].estoque - qtd
                qtd = conceVehicles[i].estoque
                if conceVehicles[i].estoque <= 0 then
                    table.remove(conceVehicles, i)
                    qtd = 0
                end

                vRP.execute("creative/set_estoque",
                            {vehicle = vehicle, quantidade = qtd})
                return true
            end
        end
    end
    return false
end

function addEstoque(vehicle, qtd)

    if vehicle then
        local qtd = qtd or 1

        local est = vRP.query("creative/get_estoque", {vehicle = vehicle})
        local estoque = 0
        if est[1] ~= nil then estoque = parseInt(est[1].quantidade) end

        qtd = estoque + qtd

        vRP.execute("creative/set_estoque",
                    {vehicle = vehicle, quantidade = qtd})

        local vehInfo = config.getVehicleInfo(vehicle)
        if vehInfo then
            conceVehicles[#conceVehicles + 1] = {
                vehicle = vehicle,
                price = vehInfo.price,
                modelo = vehInfo.modelo,
                capacidade = vehInfo.capacidade,
                name = vehInfo.name,
                estoque = qtd
            }
            return true
        end
    end
    return false
end

function func.getMyVehicles(force)
    local source = source
    local user_id = vRP.getUserId(source)
    local myVehicles = {}
    if force or not userVehicles[user_id] then
        local data =
            vRP.query("nation_conce/getMyVehicles", {user_id = user_id})
        for k, v in pairs(data) do
            myVehicles[#myVehicles + 1] = {
                spawnName = v.vehicle,
                vehicle = vRP.vehicleName(v.vehicle),
                price = parseInt(vRP.vehiclePrice(v.vehicle) *
                (config.porcentagem_venda / 100)),
                modelo = v.vehicle,
                capacidade = vRP.vehicleChest(v.vehicle)
            }
        end
    else
        return userVehicles[user_id]
    end
    userVehicles[user_id] = myVehicles
    return myVehicles
end

function func.testDrive(vehicle)
    local source = source
    local user_id = vRP.getUserId(source)
    local state, message, vehInfo = false, "erro inesperado", {}
    vehInfo = config.getVehicleInfo(vehicle)
    if vehInfo then
        state, message = config.tryTestDrive(source, user_id, vehInfo)
    end
    return state, message
end

function func.payTest(vehicle)
    local source = source
    local user_id = vRP.getUserId(source)
    local state, message, vehInfo, price = false, "erro inesperado", {}, 0
    vehInfo = config.getVehicleInfo(vehicle)
    if vehInfo then
        state, message, price = config.payTest(source, user_id, vehInfo)
    end
    return state, message, price
end

function func.rentVehicle(vehicle)
    local source = source
    local user_id = vRP.getUserId(source)
    local state, message, vehInfo = false, "erro inesperado", {}
    local estoque = getVehicleEstoque(vehicle)
    
    if vRP.vehicleType(vehicle) == "import" or vRP.vehicleType(vehicle) == "exclusive" 
    or vRP.vehicleType(vehicle) == "work" or vRP.vehicleType(vehicle) == "importadmin" then
        state, message = false, "Veículo exclusivo do VIP"
        return state, message
    end
    if estoque <= 0 then
        return false, "veículo fora de estoque"
    elseif hasVehicle(user_id, vehicle) then
        return false, "veículo já possuído"
    end
    vehInfo = config.getVehicleInfo(vehicle)
    local vehName = config.getVehicleInfo2(vehicle)
    if vehInfo then
        state, message = config.tryRentVehicle(source, user_id, vehInfo, vehName)
    end
    return state, message
end

function func.payRent(vehicle)
    local source = source
    local user_id = vRP.getUserId(source)
    local state, message, vehInfo = false, "erro inesperado", {}
    vehInfo = config.getVehicleInfo(vehicle)
    local vehicleName = config.getVehicleInfo2(vehicle)
    if vehInfo then
        state, message = config.tryPayRent(source, user_id, vehInfo, vehicleName)
    end
    return state, message
end

function func.hasPermission()
    local source = source
    local user_id = vRP.getUserId(source)
    if config.openconce_permission then
        return vRP.hasPermission(user_id, config.openconce_permission)
    end
    return true
end

function func.chargeBack(price)
    local source = source
    local user_id = vRP.getUserId(source)
    if config.chargeBack then
        config.chargeBack(source, user_id, parseInt(price))
    end
end

function showNotify(source, mode, message, time)
    local time = time
    if not time then time = 3000 end
    if config.notify then
        config.notify(source, mode, message, time)
    else
        TriggerClientEvent("Notify", source, mode, message, time)
    end
end

local manages = {
    ["update"] = function(source)
        getDbVehicles()
        showNotify(source, "sucesso", "Concessionária atualizada com sucesso!")
    end,
    ["add"] = function(source, vehicle, qtd)
        local qtd = parseInt(qtd)
        if qtd and qtd > 0 then
            local vehInfo = config.getVehicleInfo(vehicle)
            if vehInfo then
                if addEstoque(vehicle, qtd) then
                    showNotify(source, "sucesso",
                               "Adicionado(s) <b>" .. qtd .. " " ..
                                   vehInfo.modelo .. "</b> à concessionária!")
                else
                    showNotify(source, "negado", "Erro inesperado.")
                end
            else
                showNotify(source, "negado", "Veículo não identificado.")
            end
        else
            showNotify(source, "negado", "Quantidade inválida.")
        end
    end,
    ["remove"] = function(source, vehicle, qtd)
        local qtd = parseInt(qtd)
        if qtd and qtd > 0 then
            local vehInfo = config.getVehicleInfo(vehicle)
            if vehInfo then
                if removeEstoque(vehicle, qtd) then
                    showNotify(source, "sucesso", "Removido(s) <b>" .. qtd ..
                                   " " .. vehInfo.modelo ..
                                   "</b> da concessionária!")
                else
                    showNotify(source, "negado", "Erro inesperado.")
                end
            else
                showNotify(source, "negado", "Veículo não identificado.")
            end
        else
            showNotify(source, "negado", "Quantidade inválida.")
        end

    end
}

function func.manageConce(mode, vehicle, qtd)
    local source = source
    local user_id = vRP.getUserId(source)
    if mode and vehicle and qtd and
        vRP.hasPermission(user_id, config.updateconce_permission) then
        if manages[mode] then manages[mode](source, vehicle, qtd) end
    end
end

RegisterCommand('conce', function(source)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, config.updateconce_permission) then
        fclient.showAdminMenu(source)
    end
end)

function func.checkAuth() return true end
