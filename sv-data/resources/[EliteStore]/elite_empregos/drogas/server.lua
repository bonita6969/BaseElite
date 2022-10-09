local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

emP = {}
Tunnel.bindInterface("emp_drogas",emP)
local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
local quantidade = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUANTIDADE
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.Quantidade()
	local source = source
	if quantidade[source] == nil then
		quantidade[source] = math.random(2,4)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkItens()
	emP.Quantidade()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.hasPermission(user_id,"trafico2.permissao") then
			return vRP.getInventoryItemAmount(user_id,"baseado") or vRP.getInventoryItemAmount(user_id,"metanfetamina") or vRP.getInventoryItemAmount(user_id,"lsdselo") or vRP.getInventoryItemAmount(user_id,"cocaina-embalada") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"relogioroubado") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"pulseiraroubada") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"anelroubado") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"colarroubado") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"brincoroubado") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"carteiraroubada") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"carregadorroubado") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"tabletroubado") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"sapatosroubado") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"vibradorroubado") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"perfumeroubado") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"maquiagemroubada") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"etiqueta") >= quantidade[source]
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------

function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
		TriggerClientEvent("Notify",source,"aviso","Chamaram a policia cuzão, corre.")
		local policia = vRP.getUsersByPermission("policia.permissao")
		-- for l,w in pairs(policia) do
		-- 	local player = vRP.getUserSource(parseInt(w))
		if vRP.tryGetInventoryItem(user_id,"metanfetamina",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"lsdselo",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"baseado",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"cocaina-embalada",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"relogioroubado",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"pulseiraroubada",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"anelroubado",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"colarroubado",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"brincoroubado",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"carteiraroubada",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"carregadorroubado",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"tabletroubado",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"sapatosroubado",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"vibradorroubado",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"perfumeroubado",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"maquiagemroubada",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"etiqueta",quantidade[source]) then 
			vRP.giveInventoryItem(user_id,"dinheiro-sujo",math.random(800,1100)*quantidade[source]+(#policia*120))
					if player then
						local data = { x = x, y = y, z = z, title = 'TRÁFICO', code = '92', veh = model }
						TriggerClientEvent('NotifyPush',player,data)
					vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
					quantidade[source] = nil
				-- end
			end
		end
	end
end

function emP.MarcarOcorrencia()
	local source = source
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
		TriggerClientEvent("Notify",source,"aviso","Chamaram a policia cuzão, corre.")
		local soldado = vRP.getUsersByPermission("policia.permissao")
		for l,w in pairs(soldado) do
			local player = vRP.getUserSource(parseInt(w))
			if player then
				async(function()
					local id = idgens:gen()
					blips[id] = vRPclient.addBlip(player,x,y,z,153,84,".Trafico",0.5,false)
					vRPclient._playSound(player,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
					TriggerClientEvent('chatMessage',player,"CENTRAL",{65,130,255},"Recebemos uma denuncia de drogas, verifique o ocorrido.")
					SetTimeout(15000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end
	end
end
-- function emP.checkPayment()
-- 	local source = source
-- 	local user_id = vRP.getUserId(source)
-- 	if user_id then
-- 		function emP.MarcarOcorrencia()
-- 			local source = source
-- 			local user_id = vRP.getUserId(source)
-- 			local x,y,z = vRPclient.getPosition(source)
-- 			if user_id then
-- 				TriggerClientEvent("Notify",source,"aviso","Chamaram a policia cuzão, corre.")
-- 				local soldado = vRP.getUsersByPermission("policia.permissao")
-- 				for l,w in pairs(soldado) do
-- 					local player = vRP.getUserSource(parseInt(w))
-- 					if player then
-- 						async(function()
-- 							local id = idgens:gen()
-- 							blips[id] = vRPclient.addBlip(player,x,y,z,1,59,".Ocorrência",0.5,false)
-- 							vRPclient._playSound(player,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
-- 							TriggerClientEvent('chatMessage',player,"190",{65,130,255},"Recebemos uma denuncia de drogas, verifique o ocorrido.")
-- 							SetTimeout(15000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
-- 						end)
-- 					end
-- 				end
-- 			end
-- 		end
-- 		local policia = vRP.getUsersByPermission("policia.permissao")
-- 		if vRP.tryGetInventoryItem(user_id,"metanfetamina",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"lsdselo",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"baseado",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"cocaina-embalada",quantidade[source]) then 
-- 			vRP.giveInventoryItem(user_id,"dinheiro-sujo",math.random(700,1300)*quantidade[source]+(#policia*100))
-- 			-- TriggerClientEvent("Notify",source, "Sucesso", "Você recebeu R$ " ..payment)
-- 			vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
-- 			quantidade[source] = nil

-- 		end
-- 	end
-- end