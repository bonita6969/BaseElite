local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
fclient = Tunnel.getInterface("nation_skinshop")
func = {}
Tunnel.bindInterface("nation_skinshop", func)


---------------------------------------------------------------------------
-----------------------VERIFICAÇÃO DE PERMISSÃO--------------------------
---------------------------------------------------------------------------


function func.checkPermission(permission)
    local source = source
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



---------------------------------------------------------------------------
-----------------------VERIFICAÇÃO DE PAGAMENTO--------------------------
---------------------------------------------------------------------------


function func.tryPayClothes(value)
    local source = source
    local user_id = vRP.getUserId(source)
    if value >= 0 then
        return vRP.tryPayment(user_id, value) or value == 0
    end
    return false
end




--------- CREATIVE V3 ------------


--[[ function func.tryPayClothes(value)
    local source = source
    local user_id = vRP.getUserId(source)
    if value >= 0 then
        if vRP.paymentBank(user_id, value) or value == 0 then
            local clothes = fclient.getCloths(source)
            vRP.setUData(user_id,"Clothings",json.encode(clothes))
            return true
        end
    end
    return false
end

function func.updateClothes()
    local source = source
    local user_id = vRP.getUserId(source)
    local clothes = fclient.getCloths(source)
    vRP.setUData(user_id,"Clothings",json.encode(clothes))
end



 ]]


















--------- NYO GUARDA ROUPAS ------------


--[[ 
 local clothParts = {
	["legs"] = 4,
	["torsos"] = 3,
	["undershirts"] = 8,
	["tops"] = 11,
	["bodyArmors"] = 9,
	["bags"] = 5,
	["shoes"] = 6,
	["masks"] = 1,
	["hats"] = "p0",
	["glasses"] = "p1",
	["ears"] = "p2",
	["watches"] = "p7",
	["bracelets"] = "p7",
	["accessories"] = 7,
	["decals"] = 10
}




function func.tryPayClothes(value)
    local source = source
    local user_id = vRP.getUserId(source)
    if value >= 0 then
        if vRP.tryPayment(user_id, value) then
            local parts = fclient.getCloths(source) or {}
            local dataParts = vRP.getUData(user_id, "nyo:GuardaRoupa")
            local playerParts = {}
            if dataParts then 
                playerParts = json.decode(dataParts) or {}
            end
            for _, comp in pairs(clothParts) do
                if parts[comp] and parts[comp][1] >= 0 then
                    local drawable = tostring(parts[comp][1])
                    local c = tostring(comp)
                    if playerParts[c] then
                        playerParts[c][drawable] = true
                    else
                        playerParts[c] = { [drawable] = true}
                    end
                end
            end

           vRP.setUData(user_id,"nyo:GuardaRoupa",json.encode(playerParts)) 
           return true
        end
    end
    return false
end ]]
