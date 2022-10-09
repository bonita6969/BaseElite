local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP1 = {}
Tunnel.bindInterface("vrp_srkmischp",emP1)
vRPclient = Tunnel.getInterface("vRP")

function emP1.checkServices()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local paramedicos = vRP.getUsersByPermission('ems.permissao')
		if parseInt(#paramedicos) == 0 then
			return true
		end
	end
    return false
end


RegisterCommand('re',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		if vRPclient.isInComa(nplayer) then
			if vRP.hasPermission(user_id,"ems.permissao") then
				TriggerClientEvent('cancelando',source,true)
				vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
				TriggerClientEvent("progress",source,20000,"reanimando")
				SetTimeout(20000,function()
					TriggerClientEvent('godblur',nplayer)
					vRPclient.killGod(nplayer)
					vRPclient._stopAnim(source,false)
					TriggerClientEvent('cancelando',source,false)
					TriggerClientEvent('cancelando',nplayer,false)
				end)
			-- else
			-- 	-- local x,y,z = vRPclient.getPosition(source)
			-- 	-- local distance = #(vector3(x,y,z) - vector3(-805.17, -1227.15, 7.34))
			-- 	-- if distance < 35 then
			-- 		local ems = vRP.getUsersByPermission(hospital.permissao)
			-- 		if #ems == 0 then
			-- 			TriggerClientEvent('cancelando',source,true)
			-- 			vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
			-- 			TriggerClientEvent("progress",source,20000,"reanimando")
			-- 			SetTimeout(20000,function()
			-- 				vRPclient.killGod(nplayer)
			-- 				vRPclient._stopAnim(source,false)
			-- 				TriggerClientEvent('cancelando',source,false)
			-- 				TriggerClientEvent('cancelando',nplayer,false)
			-- 			end)
			-- 		else
			-- 			TriggerClientEvent("Notify", source, "aviso","Existem medicos em serviço.")
			-- 		end
				-- else
				-- 	TriggerClientEvent("Notify", source, "aviso","Você so pode utilizar o /re dentro do hospital e sem socorristas em trabalho.")
				-- end
			end
		else
			TriggerClientEvent("Notify", source, "aviso","A pessoa precisa estar em coma para prosseguir.")
		end
	end
end)

    
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tratamento',function(source,args,rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    local nplayer = vRPclient.getNearestPlayer(source,3)
    local nuser_id = vRP.getUserId(nplayer)
    local identityu = vRP.getUserIdentity(nuser_id)
    
    if vRP.hasPermission(user_id,"ems.permissao") then
        if vRP.request(nplayer,"Deseja receber tratamento no valor de <b>$2000</b>?",30) then
            if user_id then
                vRP.tryPayment(nuser_id,2000,(args[1]))
                vRP.giveBankMoney(user_id,2000,(args[1]))
                TriggerClientEvent('Notify',source,"Sucesso","Recebeu <b>R$2000</b> de <b>"..identityu.name.. " "..identityu.firstname.."</b>.")
                if nplayer then
                    if not vRPclient.isComa(nplayer) then
                        TriggerClientEvent("tratamento",nplayer)
                        TriggerClientEvent("Notify",source,"Sucesso","Tratamento no paciente iniciado com sucesso.",10000)
                        TriggerClientEvent("Notify",nplayer,"Sucesso","Tratamento iniciado com sucesso.",10000)
                    end
                end
            else    
                TriggerClientEvent("Notify",source,"Negado","Dinheiro insuficiente.")
            end   
        end
    end
end)