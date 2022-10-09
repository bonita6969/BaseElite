local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

--[ CONNECTION ]----------------------------------------------------------------------------------------------------------------

emp2 = {}
Tunnel.bindInterface("emp_milkman",emp2)

--[ FUNCTION ]------------------------------------------------------------------------------------------------------------------

function emp2.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(configmilkman.milk2)*configmilkman.multiplicador <= vRP.getInventoryMaxWeight(user_id) then
			if vRP.tryGetInventoryItem(user_id,configmilkman.milk,configmilkman.milk1) then
				vRP.sendemplog1(source,"leite","leite")
				vRP.giveInventoryItem(user_id,configmilkman.milk2,configmilkman.milk3)
				return true
			end
		end
	end
end

--[ FUNCTION ]------------------------------------------------------------------------------------------------------------------

function emp2.checkPlate(modelo)
	local source = source
	local user_id = vRP.getUserId(source)
	local veh,vhash,vplaca,vname = vRPclient.vehListHash(source,4)
	if veh and vhash == modelo then
		local placa_user_id = vRP.getUserByRegistration(vplaca)
		if user_id == placa_user_id then
			return true
		else
			return false
		end
	end
end
