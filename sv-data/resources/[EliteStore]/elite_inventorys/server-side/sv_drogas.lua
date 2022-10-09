local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
drogas_entregas = {}
Tunnel.bindInterface("vrp_rotas-entrega",drogas_entregas)
local idgens = Tools.newIDGenerator()
local blips = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSAO
-----------------------------------------------------------------------------------------------------------------------------------------
function drogas_entregas.checkPermission(k)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,dossantos.bonus) or vRP.hasPermission(user_id,dossantos.paisana) then
		return false
	end
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
function drogas_entregas.checkPayment(inservice)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(dossantos.rotasdrogas[inservice]['items']) do
			local quantidade = math.random(v['qntmin'],v['qntmax'])
			local payment = math.random(v['rewmin'],v['rewmax'])
			
			local policia = vRP.getUsersByPermission(dossantos.permbonus)
			local bonus = 0
			
			if #policia > 0 then
				bonus = #policia*dossantos.bonus
			end

			if checkfac(user_id) then
				payment = payment + dossantos.bonusfac
			end

			payment = payment+bonus
			payment = payment*quantidade

			if vRP.tryGetInventoryItem(user_id,v['item'],quantidade) then
				vRP.giveInventoryItem(user_id,dossantos.sujo,payment)
				return true
			else
				TriggerClientEvent("Notify",source,"negado","Drogas insuficientes.")
				return false
			end
		end
	end
end

function checkfac(user_id)
	if vRP.hasPermission(user_id, dossantos.ilegal) then
		return false
	-- elseif vRP.hasPermission(user_id, dossantos.ilegal2) then
	-- 	return false
	end
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
function drogas_entregas.MarcarOcorrencia()
	local source = source
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local soldado = vRP.getUsersByPermission(dossantos.permbonus)
		for l,w in pairs(soldado) do
			local player = vRP.getUserSource(parseInt(w))
			if player then

				local data = { x = x, y = y, z = z, title = 'ENTREGA DE DROGAS', code = 'DENUNCIA' }
				blips = vRPclient.addBlip(player,x,y,z,42,5,".ENTREGA DE DROGAS",0.5,false)
						
				TriggerClientEvent('NotifyPush',player,data)
				SetTimeout(20000,function() vRPclient.removeBlip(player,blips) idgens:free(id) end)

			end
		end
		SendWebhookMessage(webh.rotadrogas,"```prolog\n[ID]: "..user_id.." "..identity.firstname.." "..identity.name.." \n[DENUNCIA]: coletar itens "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."\r```")
	end
end