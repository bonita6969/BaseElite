local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
print('['.. GetCurrentResourceName() .. '] Iniciado com sucesso')

--[ CONEXÃO ]----------------------------------------------------------------------------------------------------------------------------

cmB = {}
Tunnel.bindInterface("dossantos_rotas",cmB)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ FUNCÕES ]
-----------------------------------------------------------------------------------------------------------------------------------------
local amount = {}

cmB.checkPerm = function(perm)
    local user_id = vRP.getUserId(source)
    return vRP.hasPermission(user_id,perm)
end

cmB.awardEntrega = function(item)
    
if ChamarPolicia then	
    local user_id = vRP.getUserId(source)
    local livre = vRP.getInventoryMaxWeight(user_id) - vRP.getInventoryWeight(user_id)
    local pesoItem = 0
        local policiais = vRP.getUsersByPermission(cfg.permissao)
        local x,y,z = vRPclient.getPosition(source)
        for l,w in pairs(policiais) do
            local player = vRP.getUserSource(w)
            if player then
                local data = { x = x, y = y, z = z, title = cfg.titulo, code = cfg.codigo, badge = cfg.mensagem }    
                TriggerClientEvent('NotifyPush',player,data)
            end
        end
        for k,v in pairs(cfg.blipItem[item]) do
            if #v == 2 then
                amount[k] = math.random(v[1],v[2])
                local peso = vRP.getItemWeight(k)*amount[k]
                pesoItem = pesoItem + peso
            elseif #v == 1 then
                amount[k] = v[1]
                local peso = vRP.getItemWeight(k)*amount[k]
                pesoItem = pesoItem + peso
         else
            print('ERRO: VOCÊ COLOCOU A QUANTIDADE DO ITEM: ['..k..'] DE FORMA ERRADA, COLOQUE 2 NÚMEROS PARA SER UM VALOR RANDOM ENTRE ELES, OU UM NÚMERO PARA SER UM VALOR FIXO')
        end
    end
    if livre - pesoItem < 0 then
        TriggerClientEvent('Notify',source,"negado","Espaço insuficiente.")
        return false
    else
        SetTimeout(cfg.segundos*1000, function()
            for k,v in pairs(cfg.blipItem[item]) do
                vRP.giveInventoryItem(user_id,k,amount[k])
                amount[k] = nil
            end
        end)
        return true
    end
-- end
else
    local user_id = vRP.getUserId(source)
    local livre = vRP.getInventoryMaxWeight(user_id) - vRP.getInventoryWeight(user_id)
    local pesoItem = 0
    for k,v in pairs(cfg.blipItem[item]) do
        if #v == 2 then
            amount[k] = math.random(v[1],v[2])
            local peso = vRP.getItemWeight(k)*amount[k]
            pesoItem = pesoItem + peso
        elseif #v == 1 then
            amount[k] = v[1]
            local peso = vRP.getItemWeight(k)*amount[k]
            pesoItem = pesoItem + peso
        else
            print('ERRO: VOCÊ COLOCOU A QUANTIDADE DO ITEM: ['..k..'] DE FORMA ERRADA, COLOQUE 2 NÚMEROS PARA SER UM VALOR RANDOM ENTRE ELES, OU UM NÚMERO PARA SER UM VALOR FIXO')
        end
    end
        if livre - pesoItem < 0 then
            TriggerClientEvent('Notify',source,"negado","Espaço insuficiente.")
            return false
        else
            SetTimeout(cfg.segundos*1000, function()
                for k,v in pairs(cfg.blipItem[item]) do
                    vRP.giveInventoryItem(user_id,k,amount[k])
                    amount[k] = nil
                end
            end)
            return true
        end
    end
end