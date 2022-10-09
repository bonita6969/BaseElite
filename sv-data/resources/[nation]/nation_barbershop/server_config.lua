local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
fclient = Tunnel.getInterface("nation_barbershop")
func = {}
Tunnel.bindInterface("nation_barbershop", func)

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

function func.checkPermission(permission, src)
    local source = src or source
    local user_id = vRP.getUserId(source)
    if type(permission) == "table" then
        for i, perm in pairs(permission) do
            if vRP.hasPermission(user_id, perm) then
                return true
            end
        end
        return false
    end
    return vRP.hasPermission(user_id, permission)
end


function func.saveChar(char)
    local source = source
    local user_id = vRP.getUserId(source)
    vRP._setUData(user_id, "nation_char", json.encode(char,{indent=false}))
    return true
end


function func.tryPay(value)
    local source = source
    local user_id = vRP.getUserId(source)
    if value >= 0 then
        if vRP.tryPayment(user_id, value) or vRP.paymentBank(user_id, value) or value == 0 then
            return true
        end
    end
    return false
end



local chairsUsers = {}
function func.checkChair(barberId, chairIndex, perm)
    local source = source
    if perm and not func.hasPermission(perm, source) then return end
    for src, v in pairs(chairsUsers) do
        if v.barberId == barberId and v.chairIndex == chairIndex then
            return false
        end
    end
    chairsUsers[source] = { barberId = barberId, chairIndex = chairIndex  }
    return true
end

function func.leaveChar(_source)
    local source = _source or source
    if chairsUsers[source] then
        chairsUsers[source] = nil
    end
end


AddEventHandler('playerDropped', function()
    func.leaveChar(source)
end)


function func.getOverlay()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local data = vRP.getUData(user_id, "nation_char")
        if data and data ~= "" then
            local char = json.decode(data)
            if char and char.overlay then
                return char.overlay
            end
        end
    end
    return 0
end

function getUserClothes(user_id)
    local data = vRP.getUData(user_id, "Clothings")
    if data and data ~= "" then
        local clothes = json.decode(data)
        if clothes then
            return clothes
        end
    end
    local datatable = vRP.getUserDataTable(user_id) or {}
    return datatable.customization or {}
end

function func.getTattoos()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local char = getUserChar(user_id)
        return (char.tattoos or {}), (char.overlay or 0)
    end
    return false
end

function setPlayerTattoos(source, user_id)
    local data = vRP.getUData(user_id,"Tattoos")
    if data and data ~= '' then
        local tattoos = json.decode(data)
        TriggerClientEvent("reloadtattos", source)
    end
end

function func.setPlayerTattoos()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        setPlayerTattoos(source, user_id)
    end
end

--local webhookvidaroupas = ""
RegisterCommand("bvida", function(source)
    local user_id = vRP.getUserId(source)
    local data = vRP.getUData(user_id, "nation_char")
    local caduh = math.random(9999999)
    local caduh2 = vRP.prompt(source, 'Verificacao de Capcha! <b>Digite o Codigo a baixo!</b><br>' .. caduh .. '</br>', '')
    if caduh2 == tostring(caduh) then
        if data and data ~= "" then
            local char = json.decode(data)
            fclient._setPlayerChar(source, char, false, true)
            TriggerClientEvent("nation_barbershop:init", source, char)
            setPlayerTattoos(source, user_id)
            fclient._setClothing(source, getUserClothes(user_id))
        end
    else
        TriggerClientEvent('Notify',source,'UP City','<b>NEGADO:</b> Codigo Errado!',6000)
    end
end)

-- tattoos dope nuis

--[[ AddEventHandler("dpn_tattoo:setPedServer", function(source)
    Wait(200)
    TriggerClientEvent("nation_barbershop:reloadOverlay", source)
end) ]]
