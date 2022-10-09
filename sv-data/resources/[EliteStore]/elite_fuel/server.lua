local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface(GetCurrentResourceName(), src)

vCLIENT = Tunnel.getInterface(GetCurrentResourceName())

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
            print(colors.Magenta..'=========   [Elite Fuel Iniciado com sucesso]     ========='..colors.Magenta)
            print(colors.Magenta..'==========================================================='..colors.Magenta)
            -- print(colors.blue..'['.. GetCurrentResourceName() .. '] Iniciado com sucesso'..colors.blue)
        end 
end)

RegisterCommand('wolf',function(source)
	local user_id = vRP.getUserId(source)
	if user_id then 
		vCLIENT.wolfzera(source)
	end 
end)

function src.checkMoney(price)
	local source = source
	local user_id = vRP.getUserId(source)

	local hasMoney = vRP.getMoney(user_id) >= price
	if not hasMoney then
		TriggerClientEvent("Notify",source,"negado","Você não tem dinheiro suficiente")
	end	
	return { hasMoney = hasMoney }
end

RegisterServerEvent("elite_fuel:pagamento")
AddEventHandler("elite_fuel:pagamento",function(price,galao)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id and price > 0 then
		if vRP.tryPayment(user_id,price) then
			if galao then
				TriggerClientEvent('elite_fuel:galao',source)
				TriggerClientEvent("Notify",source,"sucesso","Pagou <b>$"..vRP.format(price).." reais</b> pelo <b>Galão</b>.")
			else
				TriggerClientEvent("Notify",source,"sucesso","Pagou <b>$"..vRP.format(price).." reais</b> em combustível.")
			end
		else
			TriggerClientEvent('elite_fuel:insuficiente',source)
			TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
		end
	end
end)


RegisterCommand("fuel",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "manager.permissao") and args[1] then
		local vehicle = vRPclient.getNearestVehicle(source, 7)
		TriggerClientEvent("fuel:setvehiclefuel", -1, vehicle, tonumber(args[1]))
		TriggerClientEvent("fuel:setvehiclefuel2", source, vehicle, tonumber(args[1]))
	end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print(colors.Magenta..'==========================================================='..colors.Magenta)
    print(colors.Magenta..'==========   [Elite Fuel Parado (CUIDADO!)]    ============'..colors.Magenta)
    print(colors.Magenta..'==========================================================='..colors.Magenta)
    -- print(colors.blue..'['.. GetCurrentResourceName() .. '] Iniciado com sucesso'..colors.blue)
end)