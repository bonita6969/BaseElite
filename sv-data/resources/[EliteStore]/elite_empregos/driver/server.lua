local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

--[ CONNECTION ]----------------------------------------------------------------------------------------------------------------

emp6 = {}
Tunnel.bindInterface("emp_driver",emp6)

--[ PAYMENT | FUNCTION ]---------------------------------------------------------------------------------------------------

function emp6.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	local pagamento = parseInt(math.random(configdriver.min,configdriver.max))
	if user_id then
		vRP.giveMoney(user_id,parseInt(pagamento))
		vRP.sendemplog(source,"motorista",pagamento)
		TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>$"..vRP.format(parseInt(pagamento)).." dólares</b>.")
	end
end

