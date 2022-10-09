--[BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319]--
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

c2nbike = {}
Tunnel.bindInterface("c2n_manobras",c2nbike)

--[ PERMISSÃO ]-------------------------------------------------------------------
function c2nbike.checkPermVip()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"manager.permissao") then
        return true
    end
end
--[BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319]--