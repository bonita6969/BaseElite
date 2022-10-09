local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
desm = {}
Tunnel.bindInterface("desmanche",desm)

local itens = {
	-- Placa do veículo
	["placa"] = { valor = 5200 },
	-- Comuns
	["discofreio"] = { valor = 5200 },
	["volante"] = { valor = 5200 },
	["motorcarro"] = { valor = 5200 },
	["rodacarro"] = { valor = 5200 },
	["portacarro"] = { valor = 5200 },
	["motormoto"] = { valor = 5200 },
	["rodamoto"] = { valor = 5200 },
	-- Importados
	["discofreioimport"] = { valor = 8000 },
	["volanteimport"] = { valor = 8000 },
	["motorcarroimport"] = { valor = 8000 },
	["rodacarroimport"] = { valor = 8000 },
	["portacarroimport"] = { valor = 8000 },
	["motormotoimport"] = { valor = 8000 },
	["rodamotoimport"] = { valor = 8000 },
	-- Exclusivos
	["discofreioexclusive"] = { valor = 10500 },
	["volanteexclusive"] = { valor = 10500 },
	["motorcarroexclusive"] = { valor = 10500 },
	["rodacarroexclusive"] = { valor = 10500 },
	["portacarroexclusive"] = { valor = 10500 },
	["motormotoexclusive"] = { valor = 10500 },
	["rodamotoexclusive"] = { valor = 10500 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREPARE
-----------------------------------------------------------------------------------------------------------------------------------------
vRP._prepare("creative/get_vehicle","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("creative/rem_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/get_vehicles","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/set_update_vehicles","UPDATE vrp_user_vehicles SET engine = @engine, body = @body, fuel = @fuel WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/set_detido","UPDATE vrp_user_vehicles SET detido = @detido, time = @time WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/get_detido","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/set_ipva","UPDATE vrp_user_vehicles SET ipva = @ipva WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/move_vehicle","UPDATE vrp_user_vehicles SET user_id = @nuser_id WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,ipva) VALUES(@user_id,@vehicle,@ipva)")
vRP._prepare("creative/con_maxvehs","SELECT COUNT(vehicle) as qtd FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("creative/rem_srv_data","DELETE FROM vrp_srv_data WHERE dkey = @dkey")
vRP._prepare("creative/get_estoque","SELECT * FROM vrp_estoque WHERE vehicle = @vehicle")
vRP._prepare("creative/set_estoque","UPDATE vrp_estoque SET quantidade = @quantidade WHERE vehicle = @vehicle")
vRP._prepare("creative/get_users","SELECT * FROM vrp_users WHERE id = @user_id")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local tipoVehicle
-----------------------------------------------------------------------------------------------------------------------------------------
-- Permissão
-----------------------------------------------------------------------------------------------------------------------------------------
function desm.checkPermission(perm)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,perm)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- Checa Veículo e entrega os itens
-----------------------------------------------------------------------------------------------------------------------------------------
function desm.checkVehicle()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vnetid,placa,vname,lock,banned,work = vRPclient.vehList(source,7)
		if vehicle and placa then
			tipoVehicle = vRP.vehicleType(vname)
			local puser_id = vRP.getUserByRegistration(placa)
			if puser_id then
				if user_id == puser_id then
					TriggerClientEvent("Notify",source,"negado","Você não pode desmanchar seu próprio veículo.",8000)
					return false
				else
					if tipoVehicle ~= "work" then
						local vehicle = vRP.query("creative/get_vehicles",{ user_id = parseInt(puser_id), vehicle = vname })
						if #vehicle <= 0 then
							TriggerClientEvent("Notify",source,"importante","Veículo não encontrado na lista do proprietário.",8000)
							return false
						end
						if parseInt(vehicle[1].detido) == 1 then
							TriggerClientEvent("Notify",source,"importante","Veículo encontra-se apreendido na seguradora.",8000)
							return false
						end
						if banned then
							TriggerClientEvent("Notify",source,"negado","Veículos de serviço ou alugados não podem ser desmanchados.",8000)
							return false
						end
					else
						TriggerClientEvent("Notify",source,"negado","Esse veículo não pode ser desmanchado!")	
						return false
					end
				end
			else
				return false
			end
			SetTimeout(23000,function()
				TriggerClientEvent("vrp_sound:source",source,'saw',0.6)
			end)

			SetTimeout(40000,function()
				-- Carros
				if tipoVehicle == "carros" then
					vRP.giveInventoryItem(user_id,"discofreio",4)
					vRP.giveInventoryItem(user_id,"volante",1)
					vRP.giveInventoryItem(user_id,"motorcarro",1)
					vRP.giveInventoryItem(user_id,"rodacarro",4)
					vRP.giveInventoryItem(user_id,"portacarro",2)
					vRP.giveInventoryItem(user_id,"placa",1)
					vRP.giveInventoryItem(user_id,"dinheirosujo",30000)
				elseif tipoVehicle == "import" then
					vRP.giveInventoryItem(user_id,"discofreioimport",4)
					vRP.giveInventoryItem(user_id,"volanteimport",1)
					vRP.giveInventoryItem(user_id,"motorcarroimport",1)
					vRP.giveInventoryItem(user_id,"rodacarroimport",4)
					vRP.giveInventoryItem(user_id,"portacarroimport",2)
					vRP.giveInventoryItem(user_id,"placa",1)
					vRP.giveInventoryItem(user_id,"dinheirosujo",50000)
				elseif tipoVehicle == "exclusive" then
					vRP.giveInventoryItem(user_id,"discofreioexclusive",4)
					vRP.giveInventoryItem(user_id,"volanteexclusive",1)
					vRP.giveInventoryItem(user_id,"motorcarroexclusive",1)
					vRP.giveInventoryItem(user_id,"rodacarroexclusive",4)
					vRP.giveInventoryItem(user_id,"portacarroexclusive",2)
					vRP.giveInventoryItem(user_id,"dinheirosujo",50000)
					vRP.giveInventoryItem(user_id,"placa",1)
				-- Motos
				elseif tipoVehicle == "motos" then
					vRP.giveInventoryItem(user_id,"discofreio",2)
					vRP.giveInventoryItem(user_id,"motormoto",1)
					vRP.giveInventoryItem(user_id,"rodamoto",2)
					vRP.giveInventoryItem(user_id,"placa",1)
					vRP.giveInventoryItem(user_id,"dinheirosujo",20000)
				elseif tipoVehicle == "motosimport" then
					vRP.giveInventoryItem(user_id,"discofreioimport",2)
					vRP.giveInventoryItem(user_id,"motormotoimport",1)
					vRP.giveInventoryItem(user_id,"rodamotoimport",2)
					vRP.giveInventoryItem(user_id,"placa",1)
					vRP.giveInventoryItem(user_id,"dinheirosujo",20000)
				elseif tipoVehicle == "motosexclusive" then
					vRP.giveInventoryItem(user_id,"discofreioexclusive",2)
					vRP.giveInventoryItem(user_id,"motormotoexclusive",1)
					vRP.giveInventoryItem(user_id,"rodamotoexclusive",2)
					vRP.giveInventoryItem(user_id,"placa",1)
					vRP.giveInventoryItem(user_id,"dinheirosujo",20000)
				end
				TriggerClientEvent("desmancharVehicle",-1,vehicle)
				vRP.execute("creative/set_detido",{ user_id = parseInt(puser_id), vehicle = vname, detido = 1, time = parseInt(os.time()) })
			end)
			return true					
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVE VEH INFO
-----------------------------------------------------------------------------------------------------------------------------------------
function desm.saveVehicle(vehicle,plate,engine,body,fuel,estado)
    if not vehicle or not plate or not engine or not body or not fuel then
        return
    end
    local user_id = vRP.getVehiclePlate(plate) or vRP.getUserByRegistration(plate)
    if user_id then
        vRP.execute("vRP/setVehicleData", { engine = engine, body = body, fuel = fuel, estado = json.encode(estado or {}), user_id = user_id, vehicle = vehicle })
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- Verifica o tipo do veículo
-----------------------------------------------------------------------------------------------------------------------------------------
function desm.tipoVeiculo()
	local vehicle,vnetid,placa,vname,lock,banned,work = vRPclient.vehList(source,7)
	if vehicle and placa then
		tipoVehicle = vRP.vehicleType(vname)
		return tipoVehicle
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- Verifica itens no inventário e realiza pagamento
-----------------------------------------------------------------------------------------------------------------------------------------
function desm.checkPayment()
	local pagamento = 0
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data and data.inventory then
			for k,v in pairs(data.inventory) do
				if itens[k] ~= nil then
					vRP.tryGetInventoryItem(user_id,k,v.amount)
					pagamento = pagamento + (v.amount * itens[k].valor)
				end
			end
		end
	end
	vRP.giveInventoryItem(user_id,"dinheirosujo",pagamento)
	if pagamento > 0 then
		TriggerClientEvent("Notify",source,"sucesso","Você vendeu todas suas peças por <b>R$"..pagamento.." reais</b> em dinheiro sujo!",8000)
	else
		TriggerClientEvent("Notify",source,"negado","Você não possui nenhuma peça ilegal para vender!",8000)
	end
end




