-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
Tunnel = module("vrp","lib/Tunnel")
Proxy = module("vrp","lib/Proxy")
Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROXY
-----------------------------------------------------------------------------------------------------------------------------------------
cO = {}
Tunnel.bindInterface(GetCurrentResourceName(),cO)
vCLIENT = Tunnel.getInterface(GetCurrentResourceName())
-----------------------------------------------------------------------------------------------------------------------------------------
-- SCRIPTS
-----------------------------------------------------------------------------------------------------------------------------------------
idgens = Tools.newIDGenerator()

vGARAGE = Tunnel.getInterface("vrp_garages")
vTASKBAR = Tunnel.getInterface("vrp_taskbar")

local colors = {
    none = '\27[0m',
    black = '\27[0;30m',
    red = '\27[0;31m',
    green = '\27[0;32m',
    yellow = '\27[0;33m',
    blue = '\27[0;34m',
    magenta = '\27[0;35m',
    cyan = '\27[0;36m',
    white = '\27[0;37m',
    Black = '\27[1;30m',
    Red = '\27[1;31m',
    Green = '\27[1;32m',
    Yellow = '\27[1;33m',
    Blue = '\27[1;34m',
    Magenta = '\27[1;35m',
    Cyan = '\27[1;36m',
    White = '\27[1;37m',
    _black = '\27[40m',
    _red = '\27[41m',
    _green = '\27[42m',
    _yellow = '\27[43m',
    _blue = '\27[44m',
    _magenta = '\27[45m',
    _cyan = '\27[46m',
    _white = '\27[47m'
}
AddEventHandler('onResourceStart',function(resource)
    if resource == GetCurrentResourceName() then
            print(colors.Magenta..'==========================================================='..colors.Magenta)
            print(colors.Magenta..'=======   [Elite Inventory Iniciado com sucesso]     ======'..colors.Magenta)
            print(colors.Magenta..'==========================================================='..colors.Magenta)
            -- print(colors.blue..'['.. GetCurrentResourceName() .. '] Iniciado com sucesso'..colors.blue)
        end 
end)


AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print(colors.Magenta..'==========================================================='..colors.Magenta)
    print(colors.Magenta..'========   [Elite Inventory Parado (CUIDADO!)]    ========='..colors.Magenta)
    print(colors.Magenta..'==========================================================='..colors.Magenta)
    -- print(colors.blue..'['.. GetCurrentResourceName() .. '] Iniciado com sucesso'..colors.blue)
end)