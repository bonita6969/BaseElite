local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
rot = {}
Tunnel.bindInterface("rot_policia_rotas",rot)
print('['.. GetCurrentResourceName() .. '] Iniciado com sucesso')
local profit = {}

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
function rot.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"policia.permissao")
end

function rot.endService()
	local source = source
	local user_id = vRP.getUserId(source)
	TriggerClientEvent("Notify", source, "aviso","Patrulhamento encerrado. Bom descanso!")
	TriggerClientEvent("Notify",source,"sucesso","Bonificação total recebida: R$"..profit[user_id].."")
	profit[user_id] = nil
end

function rot.startService()
	local source = source
	local user_id = vRP.getUserId(source)
	profit[user_id] = 0
end

function rot.checkPayment(distance)
	local money = math.random(Config.min,Config.max)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		profit[user_id] = profit[user_id] + money
		vRP.giveBankMoney(user_id, money)
		TriggerClientEvent("Notify",source,"sucesso","R$"..money.." recebido (bônus de patrulha)")
	end
end
