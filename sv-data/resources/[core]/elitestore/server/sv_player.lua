local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")


--[ CONEXÃO ]----------------------------------------------------------------------------------------------------------------------------

src = {}
Tunnel.bindInterface("vrp_dossantos",src)
local idgens = Tools.newIDGenerator()

vRP.prepare("vRP/get_groups1","SELECT user_id FROM vrp_user_identities WHERE job = @job")

--[ function webhook ]-----------------------------------------------------------------------------------------------------------------------

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterCommand('reparar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if not vRPclient.isInVehicle(source) then
        local vehicle = vRPclient.getNearestVehicle(source,7)
        if vRP.hasPermission(user_id,"reparar.permissao") then
            TriggerClientEvent('cancelando',source,true)
            vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
            TriggerClientEvent("progress",source,30000,"reparando")
            SetTimeout(30000,function()
                TriggerClientEvent('cancelando',source,false)
                TriggerClientEvent('reparar',source,vehicle)
                vRPclient._stopAnim(source,false)
            end)
        else
            if vRP.tryGetInventoryItem(user_id,"repairkit",1) then
                TriggerClientEvent('cancelando',source,true)
                vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
                TriggerClientEvent("progress",source,30000,"reparando")
                SetTimeout(30000,function()
                    TriggerClientEvent('cancelando',source,false)
                    TriggerClientEvent('reparar',source,vehicle)
                    vRPclient._stopAnim(source,false)
                end)
            else
                TriggerClientEvent("Notify",source,"negado","Precisa de um <b>Kit de Reparos</b> para reparar o veículo.")
            end
        end
    else
        TriggerClientEvent("Notify",source,"negado","Precisa estar próximo ou fora do veículo para efetuar os reparos.")
    end
end)

RegisterServerEvent("tryreparar")
AddEventHandler("tryreparar",function(nveh)
    TriggerClientEvent("syncreparar",-1,nveh)
end)
local veiculos = {}
RegisterServerEvent("TryDoorsEveryone")
AddEventHandler("TryDoorsEveryone",function(veh,doors,placa)
	if not veiculos[placa] then
		TriggerClientEvent("SyncDoorsEveryone",-1,veh,doors)
		veiculos[placa] = true
	end
end)
--[ PTR ]-----------------------------------------------------------------------------------------------------------------------

RegisterCommand('ptr',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	local policia = vRP.getUsersByPermission('ptr.permissao')
	TriggerClientEvent('Notify',source,"sucesso","Existem "..#policia.." policiais em serviço.")
end)

--[ POLICIAIS ON ]-----------------------------------------------------------------------------------------------------------------------

RegisterCommand('ptr2', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local oficiais = vRP.getUsersByPermission("policia.permissao")
	local policiais = 0
	local oficiais_nomes = ""
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"geral.permissao") then
		for k,v in ipairs(oficiais) do
			local identity = vRP.getUserIdentity(parseInt(v))
			oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
			policiais = policiais + 1
		end
		TriggerClientEvent("Notify", source, "aviso", "Atualmente <b>"..policiais.." Oficiais</b> em serviço.")
		if parseInt(policiais) > 0 then
			TriggerClientEvent("Notify", source, "aviso", oficiais_nomes)
		end
	end
end)
--[ MECANICOS ON ]-----------------------------------------------------------------------------------------------------------------------

RegisterCommand('mecon', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local trabalhadores = vRP.getUsersByPermission("mecanico.permissao")
	local mecanicos = 0
	local trabalhadores_nomes = ""
	if vRP.hasPermission(user_id,"mecanico.permissao") or vRP.hasPermission(user_id,"geral.permissao") then
		for k,v in ipairs(trabalhadores) do
			local identity = vRP.getUserIdentity(parseInt(v))
			trabalhadores_nomes = trabalhadores_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
			mecanicos = mecanicos + 1
		end
		TriggerClientEvent("Notify", source, "aviso", "Atualmente <b>"..mecanicos.." Mecânicos</b> em serviço.")
		if parseInt(mecanicos) > 0 then
			TriggerClientEvent("Notify", source, "aviso", trabalhadores_nomes)
		end
	end
end)
--[ MEDICOS ON ]-----------------------------------------------------------------------------------------------------------------------

RegisterCommand('medon', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local medicos = vRP.getUsersByPermission("ems.permissao")
	local medico = 0
	local medicos_nomes = ""
	if vRP.hasPermission(user_id,"ems.permissao") or vRP.hasPermission(user_id,"geral.permissao") then
		for k,v in ipairs(medicos) do
			local identity = vRP.getUserIdentity(parseInt(v))
			medicos_nomes = medicos_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
			medico = medico + 1
		end
		TriggerClientEvent("Notify", source, "aviso", "Atualmente <b>"..medico.." Médicos</b> em serviço.")
		if parseInt(medico) > 0 then
			TriggerClientEvent("Notify", source, "aviso", medicos_nomes)
		end
	end
end)


RegisterCommand('staffon', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local staffs = vRP.getUsersByPermission("geral.permissao")
	local staff = 0
	local staffs_nomes = ""
	if vRP.hasPermission(user_id,"geral.permissao") then
		for k,v in ipairs(staffs) do
			local identity = vRP.getUserIdentity(parseInt(v))
			staffs_nomes = staffs_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
			staff = staff + 1
		end
		TriggerClientEvent("Notify", source, "aviso", "Atualmente <b>"..staff.." STAFFs</b> em serviço.")
		if parseInt(staff) > 0 then
			TriggerClientEvent("Notify", source, "aviso", staffs_nomes)
		end
	end
end)

--[ LOG ECONOMIA ]-----------------------------------------------------------------------------------------------------------------------

local timerec = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		if timerec ~= 0 then
			timerec = timerec - 1
		else
			timerec = 600
			logeconomiasend()
		end
	end
end)

function logeconomiasend()
	local users = vRP.getUsers()
	local logsend = ''
	if users then
		for k,v in pairs(users) do
			logsend = logsend..'ID: '..k..' | DINHEIRO EM MÃOS: '..dot_number(vRP.getMoney(k)).." | DINHEIRO NO BANCO: "..dot_number(vRP.getBankMoney(k)).." | DINHEIRO SUJO EM MÃOS: "..dot_number(vRP.getInventoryItemAmount(k,"dinheiro-sujo")).."\n"
		end
		SendWebhookMessage(webh.logeconomia,"```"..logsend.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."```")
	end
end

function dot_string(s)
    if s:len() <= 3 then
        return s
    end 
    return dot_string(s:sub(1, -4)) .. "." .. s:sub(-3)
end 

function dot_number(n)
    return dot_string(tostring(n))
end

RegisterCommand('cor',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if args[1] then
		if vRP.getInventoryItemAmount(user_id, "spray") >= 1 or vRP.hasPermission(user_id,'cor.permissao') then
			vRP.tryGetInventoryItem(user_id,"spray",1) 
			TriggerClientEvent('colorgun',source,args[1])
		else
			TriggerClientEvent('Notify',source,"negado","o /cor é restrito a vips!")
		end
	end
end)

--[ CHECK ROUPAS ]-----------------------------------------------------------------------------------------------------------------------

function checkRoupas()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRPclient.checkAcao(source) then
			if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
				return true 
			elseif vRP.hasPermission(user_id,"roupas.permissao") then
				return true
			else
				TriggerClientEvent("Notify",source,"negado","Você não possui roupas em sua mochila.") 
				return false
			end
		end
	end
end
--[ ITEM ]-------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('item',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	
	if vRP.hasPermission(user_id,"spawnitem.permissao") then
		if args[1] and args[2] then
			local itemIndex = vRP.itemIndexList(args[1])

			if itemIndex then
				vRP.giveInventoryItem(user_id,args[1],parseInt(args[2]))

			else
				TriggerClientEvent("Notify",source,"negado","Item <b>inválido ou inexistente</b>.")
			end
		end
	end
end)


--[ USER VEHS ADMIN ]--------------------------------------------------------------------------------------------------------------------

RegisterCommand('uservehs',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"uservehs.permissao") then
        	local nuser_id = parseInt(args[1])
            if nuser_id > 0 then 
                local vehicle = vRP.query("creative/get_vehicle",{ user_id = parseInt(nuser_id) })
                local car_names = {}
                for k,v in pairs(vehicle) do
                	table.insert(car_names, "<b>" .. vRP.vehicleName(v.vehicle) .. "</b>")
                end
                car_names = table.concat(car_names, ", ")
                local identity = vRP.getUserIdentity(nuser_id)
                TriggerClientEvent("Notify", source, "aviso","Veículos de <b>"..identity.name.." " .. identity.firstname.. " ("..#vehicle..")</b>: "..car_names,10000)
            end
        end
    end
end)

--[ ID ]---------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('id',function(source,rawCommand)	
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	if nuser_id then
		local identity = vRP.getUserIdentity(nuser_id)
		vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 8%; right: 2.5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #d1257d; }","<div class=\"local\"><b>Passaporte:</b> ( "..vRP.format(identity.user_id).." )</div>")
		vRP.request(source,"Você deseja fechar o registro geral?",1000)
		vRPclient.removeDiv(source,"completerg")
	end
end)

--[ ID ]---------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('rg',function(source,rawCommand)	
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	if vRP.hasPermission(user_id,'rg.permissao') then
		if nuser_id then
			local identity = vRP.getUserIdentity(nuser_id)
			local value = vRP.getUData(parseInt(nuser_id),"vRP:multas")
			if not value then
				value = 0
			end
			vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 8%; right: 2.5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #d1257d; }","<div class=\"local\"><b>Passaporte:</b> ( "..vRP.format(identity.user_id).." ) "..identity.name.." "..identity.firstname.." | Multas: "..value.."</div>")
			vRP.request(source,"Você deseja fechar o registro geral?",1000)
			vRPclient.removeDiv(source,"completerg")
		end
	end
end)

--[ Detido ]-------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('detido',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"policia.permissao") then
        local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,5)
        local motivo = vRP.prompt(source,"Motivo:","")
        if motivo == "" then
			return
		end
		local oficialid = vRP.getUserIdentity(user_id)
        if vehicle then
            local puser_id = vRP.getUserByRegistration(placa)
            local rows = vRP.query("creative/get_vehicles",{ user_id = parseInt(puser_id), vehicle = vname })
            if rows[1] then
                if parseInt(rows[1].detido) == 1 then
                    TriggerClientEvent("Notify",source,"aviso","Este veículo já se encontra detido.",8000)
                else
                	local identity = vRP.getUserIdentity(puser_id)
                	local nplayer = vRP.getUserSource(parseInt(puser_id))
                	SendWebhookMessage(webh.detido,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============PRENDEU==============] \n[CARRO]: "..vname.." \n[PASSAPORTE]: "..puser_id.." "..identity.name.." "..identity.firstname.." \n[MOTIVO]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                    vRP.execute("creative/set_detido",{ user_id = parseInt(puser_id), vehicle = vname, detido = 1, time = parseInt(os.time()) })

					randmoney = math.random(90,150)
					vRP.giveMoney(user_id,parseInt(randmoney))
					TriggerClientEvent("Notify",source,"sucesso","Carro apreendido com sucesso.")
					TriggerClientEvent("Notify",source,"negado","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
					TriggerClientEvent("Notify",nplayer,"negado","Seu Veículo foi <b>Detido</b>.<br><b>Motivo:</b> "..motivo..".")
					vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
                end
            end
        end
    end
end) 
--[ Prender ]-------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('prender',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"prender.permissao") then
		local crimes = vRP.prompt(source,"Crimes:","")
		if crimes == "" then
			return
		end

		local player = vRP.getUserSource(parseInt(args[1]))
		if player then
			vRP.setUData(parseInt(args[1]),"vRP:prisao",json.encode(parseInt(args[2])))
			vRPclient.setHandcuffed(player,false)
			TriggerClientEvent('prisioneiro',player,true)
			vRPclient.teleport(player,1680.1,2513.0,45.5)
			prison_lock(parseInt(args[1]))
			TriggerClientEvent('removealgemas',player)
			TriggerClientEvent("vrp_sound:source",player,'jaildoor',0.7)
			TriggerClientEvent("vrp_sound:source",source,'jaildoor',0.7)

			
			local oficialid = vRP.getUserIdentity(user_id)
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			SendWebhookMessage(webh.prender,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============PRENDEU==============] \n[PASSAPORTE]: "..(args[1]).." "..identity.name.." "..identity.firstname.." \n[TEMPO]: "..vRP.format(parseInt(args[2])).." Meses \n[CRIMES]: "..crimes.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			
			randmoney = math.random(90,150)
			vRP.giveMoney(user_id,parseInt(randmoney))
			TriggerClientEvent("Notify",source,"sucesso","Prisão efetuada com sucesso.")
			TriggerClientEvent("Notify",source,"aviso","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
			TriggerClientEvent("Notify",nplayer,"aviso","Você foi preso por <b>"..vRP.format(parseInt(args[2])).." meses</b>.<br><b>Motivo:</b> "..crimes..".")
			vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
		end 
	end
end)
--[ MULTAR ]-------------------------------------------------------------------------------------------------------------------------------------------------------------
 
RegisterCommand('multar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id, "policia.permissao") then
		local id = vRP.prompt(source,"Passaporte:","")
		local valor = vRP.prompt(source,"Valor:","")
		local motivo = vRP.prompt(source,"Motivo:","")
		if id == "" or valor == "" or motivo == "" then
			return
		end
		local value = vRP.getUData(parseInt(id),"vRP:multas")
		local multas = json.decode(value) or 0
		vRP.setUData(parseInt(id),"vRP:multas",json.encode(parseInt(multas)+parseInt(valor)))
		local oficialid = vRP.getUserIdentity(user_id)
		local identity = vRP.getUserIdentity(parseInt(id))
		local nplayer = vRP.getUserSource(parseInt(id))

		randmoney = math.random(90,150)
		vRP.giveMoney(user_id,parseInt(randmoney))
		SendWebhookMessage(webh.multar,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.firstname.." "..oficialid.name.." \n[==============MULTOU==============] \n[PASSAPORTE]: "..user.." "..identity.name.." "..identity.firstname.." \n[VALOR]: R$"..vRP.format(parseInt(value)).." \n[MOTIVO]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent("Notify",source,"sucesso","Multa aplicada com sucesso.")
		TriggerClientEvent("Notify", source, "aviso","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
		TriggerClientEvent("Notify", nplayer, "aviso","Você foi multado em <b>$"..vRP.format(parseInt(valor)).." dólares</b>.<br><b>Motivo:</b> "..motivo..".")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end)
--[ SALÁRIO ]----------------------------------------------------------------------------------------------------------------------------

local timers = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(timers) do
			if v > 0 then
				timers[k] = v - 1
			end
		end
	end
end)


RegisterServerEvent('salario:pagamento')
AddEventHandler('salario:pagamento',function()
	local source = source
	local user_id = vRP.getUserId(source)


	if timers[user_id] == 0 or not timers[user_id] then
		timers[user_id] = 5
		if user_id then
			for k,v in pairs(salarios.values) do
				if vRP.hasPermission(user_id,v.permissao) then
					TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
					TriggerClientEvent("Notify", source, "aviso","Obrigado por colaborar com a cidade, seu salario de <b>$"..vRP.format(parseInt(v.payment)).." dólares</b> foi depositado.")
					vRP.giveBankMoney(user_id,parseInt(v.payment))
					PerformHttpRequest(webh.logsalario, function(err, text, headers) end, 'POST', json.encode({
						embeds = {
							{ 	------------------------------------------------------------
								title = "REGISTRO DE RECEBIMENTO DE SALARIO:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
								thumbnail = {
									url = webh.img
								}, 
								fields = {
									{
										name = "**ID : **"..user_id.." VALOR: "..parseInt(v.payment),
										value = " ORIGEM: "..v.permissao
									}
								}, 
								footer = { 
									text = "flintstore - "..os.date("%d/%m/%Y | %H:%M:%S"),
									icon_url = webh.img
								},
								color = 15906321 
							}
						}
					}), { ['Content-Type'] = 'application/json' })
				end
			end
		end
	else
		PerformHttpRequest(webh.logPegaTroxa, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{ 	------------------------------------------------------------
					title = "REGISTRO DE BANIMENTO POR CHEAT:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
						url = webh.img
					}, 
					fields = {
						{
							name = "**ID BANIDO: **"..user_id,
							value = "Banido ao tentar usar o evento de salário."
						}
					}, 
					footer = { 
						text = "flintstore - "..os.date("%d/%m/%Y | %H:%M:%S"),
						icon_url = webh.img
					},
					color = 15906321 
				}
			}
		}), { ['Content-Type'] = 'application/json' })

		vRP.setBanned(user_id,true)
		vRP.kick(source,"Você foi banido, PAU NO CU!")
	end
end)

--[ NOCARJACK ]--------------------------------------------------------------------------------------------------------------------------

-- local veiculos = {}
-- RegisterServerEvent("TryDoorsEveryone")
-- AddEventHandler("TryDoorsEveryone",function(veh,doors,placa)
-- 	if not veiculos[placa] then
-- 		TriggerClientEvent("SyncDoorsEveryone",-1,veh,doors)
-- 		veiculos[placa] = true
-- 	end
-- end)

--[ AFKSYSTEM ]--------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent("kickAFK")
AddEventHandler("kickAFK",function()
    local source = source
    local user_id = vRP.getUserId(source)
    if not vRP.hasPermission(user_id,"antiafk.permissao") then
        DropPlayer(source,"Voce foi desconectado por ficar ausente.")
    end
end)

--[ SEQUESTRO ]--------------------------------------------------------------------------------------------------------------------------

RegisterCommand('sequestro',function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,5)
	if nplayer then
		if vRPclient.isHandcuffed(nplayer) then
			if not vRPclient.getNoCarro(source) then
				local vehicle = vRPclient.getNearestVehicle(source,7)
				if vehicle then
					if vRPclient.getCarroClass(source,vehicle) then
						vRPclient.setMalas(nplayer)
					end
				end
			elseif vRPclient.isMalas(nplayer) then
				vRPclient.setMalas(nplayer)
			end
		else
			TriggerClientEvent("Notify",source,"aviso","A pessoa precisa estar algemada para colocar ou retirar do Porta-Malas.")
		end
	end
end)

--[ TRYTOW ]-----------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent("trytow")
AddEventHandler("trytow",function(nveh,rveh)
	TriggerClientEvent("synctow",-1,nveh,rveh)
end)

--[ WINS ]-------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent("trywins")
AddEventHandler("trywins",function(nveh)
	TriggerClientEvent("syncwins",-1,nveh)
end)

--[ HOOD ]-------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent("tryhood")
AddEventHandler("tryhood",function(nveh)
	TriggerClientEvent("synchood",-1,nveh)
end)

--[ DOORS ]------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent("trydoors")
AddEventHandler("trydoors",function(nveh,door)
	TriggerClientEvent("syncdoors",-1,nveh,door)
end)

-- --[ CALL ]-------------------------------------------------------------------------------------------------------------------------------

-- local blips = {}
-- RegisterCommand('chamar',function(source,args,rawCommand)
-- 	local source = source
-- 	local answered = false
-- 	local user_id = vRP.getUserId(source)
-- 	local uplayer = vRP.getUserSource(user_id)
-- 	vida = vRPclient.getHealth(source)
-- 	vRPclient._CarregarObjeto(source,"cellphone@","cellphone_call_to_text","prop_amb_phone",50,28422)
-- 	if user_id then
-- 		local descricao = vRP.prompt(source,"Descrição:","")
-- 		if descricao == "" then
-- 			vRPclient._stopAnim(source,false)
-- 			vRPclient._DeletarObjeto(source)
-- 			return
-- 		end

-- 		local x,y,z = vRPclient.getPosition(source)
-- 		local players = {}
-- 		local playerstwo = {}
-- 		local playersthree = {}
-- 		vRPclient._stopAnim(source,false)
-- 		vRPclient._DeletarObjeto(source)
-- 		local especialidade = false

-- 		if args[1] == "190" then
-- 			players = vRP.getUsersByPermission("disparos.permissao")
-- 			especialidade = "agentes do <b>departamento de policia</b>"
-- 		elseif args[1] == "god" then
-- 			players = vRP.getUsersByPermission("geral.permissao")
-- 			playerstwo = vRP.getUsersByPermission("moderador.permissao")
-- 			playersthree = vRP.getUsersByPermission("manager.permissao")
-- 			especialidade = "staff"
-- 		elseif args[1] == "adv" then
-- 			players = vRP.getUsersByPermission("advogado.permissao")
-- 			playerstwo = vRP.getUsersByPermission("ministro.permissao")
-- 			playersthree = vRP.getUsersByPermission("permissao")
-- 			especialidade = "Advogado"
-- 		elseif args[1] == "192" then
-- 			players = vRP.getUsersByPermission("ems1.permissao")
-- 			playerstwo = vRP.getUsersByPermission("ems.permissao")
-- 			playersthree = vRP.getUsersByPermission("paramedico.permissao")
-- 			especialidade = "Medico"
-- 		elseif args[1] == "mec" then
-- 			players = vRP.getUsersByPermission("mecanico.permissao")
-- 			playerstwo = vRP.getUsersByPermission("permissao")
-- 			playersthree = vRP.getUsersByPermission("permissao")
-- 			especialidade = "Mecanico"
-- 		end

-- 		local adm = ""

-- 		if especialidade == "Staff" then
-- 			adm = "[STAFF] "
-- 		end
		
-- 		vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		
-- 		local identitys = vRP.getUserIdentity(user_id)
-- 		TriggerClientEvent("Notify",source,"sucesso","Chamado enviado com sucesso.")

-- 		for l,w in pairs(players) do
-- 			local player = vRP.getUserSource(parseInt(w))
-- 			local nuser_id = vRP.getUserId(player)
-- 			if player and player ~= uplayer then
-- 				async(function()
-- 					vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
-- 					TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},adm.."Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0 ["..user_id.."], "..descricao)
-- 					SendWebhookMessage(webh.chamados,"```prolog\n O Player "..identitys.name.." "..identitys.firstname.."^0 ID: ["..user_id.."], Fez um chamado Com a seguinte descrição \n"..descricao.."```")
-- 					local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
-- 					if ok then
-- 						if not answered then
-- 							answered = true
-- 							local identity = vRP.getUserIdentity(nuser_id)
-- 							TriggerClientEvent("Notify", source, "aviso","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
-- 							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
-- 							vRPclient._setGPS(player,x,y)
-- 						else
-- 							TriggerClientEvent("Notify",player,"aviso","Chamado ja foi atendido por outra pessoa.")
-- 							vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
-- 						end
-- 					end
-- 					local id = idgens:gen()
-- 					blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
-- 					SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
-- 				end)
-- 			end
-- 		end

-- 		for l,w in pairs(playerstwo) do
-- 			local player = vRP.getUserSource(parseInt(w))
-- 			local nuser_id = vRP.getUserId(player)
-- 			if player and player ~= uplayer then
-- 				async(function()
-- 					vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
-- 					TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},adm.."Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0 ["..user_id.."], "..descricao)
-- 					local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
-- 					if ok then
-- 						if not answered then
-- 							answered = true
-- 							local identity = vRP.getUserIdentity(nuser_id)
-- 							TriggerClientEvent("Notify", source, "aviso","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
-- 							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
-- 							vRPclient._setGPS(player,x,y)
-- 						else
-- 							TriggerClientEvent("Notify",player,"aviso","Chamado ja foi atendido por outra pessoa.")
-- 							vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
-- 						end
-- 					end
-- 					local id = idgens:gen()
-- 					blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
-- 					SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
-- 				end)
-- 			end
-- 		end

-- 		for l,w in pairs(playersthree) do
-- 			local player = vRP.getUserSource(parseInt(w))
-- 			local nuser_id = vRP.getUserId(player)
-- 			if player and player ~= uplayer then
-- 				async(function()
-- 					vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
-- 					TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},adm.."Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0 ["..user_id.."], "..descricao)
-- 					local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
-- 					if ok then
-- 						if not answered then
-- 							answered = true
-- 							local identity = vRP.getUserIdentity(nuser_id)
-- 							TriggerClientEvent("Notify", source, "aviso","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
-- 							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
-- 							vRPclient._setGPS(player,x,y)
-- 						else
-- 							TriggerClientEvent("Notify",player,"aviso","Chamado ja foi atendido por outra pessoa.")
-- 							vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
-- 						end
-- 					end
-- 					local id = idgens:gen()
-- 					blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
-- 					SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
-- 				end)
-- 			end
-- 		end
-- 	end
-- end)

--[ TOOGLE ]--------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('ponto',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	for k,v in pairs(cargos.toogle) do 
		if vRP.hasPermission(user_id,v['inperm']) then
			vRP.addUserGroup(parseInt(user_id),v['outgroup'])
			vRPclient.giveWeapons(source,{},true)
			TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço")
			SendWebhookMessage(webh.logPonto,"```prolog\n[SAIU DE SERVIÇO]: » "..user_id.."\n[CARGO] "..v['outgroup'].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		elseif vRP.hasPermission(user_id,v['outperm']) then
			vRP.addUserGroup(parseInt(user_id),v['ingroup'])
			TriggerClientEvent("Notify",source,"aviso","Você entrou em serviço")
			SendWebhookMessage(webh.logPonto,"```prolog\n[ENTROU DE SERVIÇO]: » "..user_id.."\n[CARGO] "..v['ingroup'].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
--[ TOOGLE STAFF ]--------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('staff',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	for k,v in pairs(cargos.tooglestaff) do 
		if vRP.hasPermission(user_id,v['inperms']) then
			vRP.addUserGroup(parseInt(user_id),v['outgroups'])
			TriggerClientEvent("Notify", source, "aviso","Você saiu de serviço STAFF")
			SendWebhookMessage(webh.logPontoStaff,"```prolog\n[SAIU DE SERVIÇO]: » "..user_id.."\n[CARGO] "..v['outgroup'].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		elseif vRP.hasPermission(user_id,v['outperms']) then
			vRP.addUserGroup(parseInt(user_id),v['ingroups'])
			TriggerClientEvent("Notify", source, "aviso","Você entrou em serviço STAFF")
			SendWebhookMessage(webh.logPontoStaff,"```prolog\n[ENTROU DE SERVIÇO]: » "..user_id.."\n[CARGO] "..v['ingroup'].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)

--[ PLACA ]--------------------------------------------------------------------------------------------------------------------------------------------------------------
 
RegisterCommand('placa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"placa.permissao") then
		if args[1] then
			local user_id = vRP.getUserByRegistration(args[1])
			if user_id then
				local identity = vRP.getUserIdentity(user_id)
				if identity then
					vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
					TriggerClientEvent('chatMessage',source,"COPOM",{64,64,255},"^1Passaporte: ^0"..identity.user_id.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.firstname.."   ^2|   ^1Idade: ^0"..identity.age.." anos   ^2|   ^1Telefone: ^0"..identity.phone)
				end
			else
				TriggerClientEvent("Notify", source, "aviso","Placa inválida ou veículo de americano.")
			end
		else
			local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
			local placa_user = vRP.getUserByRegistration(placa)
			if placa then
				if placa_user then
					local identity = vRP.getUserIdentity(placa_user)
					if identity then
						local vehicleName = vRP.vehicleName(vname)
						vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
						TriggerClientEvent('chatMessage',source,"COPOM",{64,64,255},"^1Passaporte: ^0"..identity.user_id.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.firstname.."   ^2|   ^1Modelo: ^0"..vehicleName.."   ^2|   ^1Idade: ^0"..identity.age.." anos   ^2|   ^1Telefone: ^0"..identity.phone)
					end
				else
					TriggerClientEvent("Notify", source, "aviso","Placa inválida ou veículo de americano.")
				end
			end
		end
	end
end)

local policia = {}
RegisterCommand('p',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if vRPclient.getHealth(source) > 100 then
		if vRP.hasPermission(user_id,"policia.permissao") then
			local soldado = vRP.getUsersByPermission("policia.permissao")
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))

				if player then
					local data = { x = x, y = y, z = z, title = 'POLICIAL', code = 'QTH', badge = identity.name.." "..identity.firstname }
					TriggerClientEvent('NotifyPush',player,data)
				end
			end
			TriggerClientEvent("Notify",source,"sucesso","Localização enviada com sucesso.")
			vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
local presets = {
	["1"] = {
		[1885233650] = {
            [1] = { -1,0 }, -- máscara
            [3] = { 0,0 }, -- maos
            [4] = { 33,0 }, -- calça
            [5] = { -1,0 }, -- mochila
            [6] = { 25,0 }, -- sapato
            [7] = { -1,0 },  -- acessorios
            [8] = { 16,1 }, -- blusa
            [9] = { 8,0 }, -- colete
            [10] = { -1,0 }, -- adesivo
            [11] = { 271,0 }, -- jaqueta	
            ["p0"] = { -1,0 }, -- chapeu
            ["p1"] = { -1,0 },
            ["p2"] = { -1,0 },
            ["p6"] = { -1,0 },
            ["p7"] = { -1,0 },
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 0,0 }, -- maos
			[4] = { 32,0 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 25,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 230,0 }, -- jaqueta	
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 },
		}
	},
	["2"] = {
		[1885233650] = {
			[1] = {169,0,1},
			[2] = {4,0,0},
			[3] = {174,0,1},
			[4] = {130,1,1},
			[5] = {-1,0,2},
			[6] = {25,0,2},
			[7] = {1,0,1},
			[8] = {57,0,1},
			[9] = {7,0,1},
			[10] = {-1,0,2},
			[11] = {220,0,1},
			["p2"] = {-1,0},
			["p1"] = {5,0},
			["p0"] = {106,20},
			["p6"] = {-1,0},
			[0] = {0,0,0},
			["p7"] = {-1,0},
		},
		[-1667301416] = {
			[1] = { 121,0 },
			[3] = { 14,0 },
			[4] = { 49,0 },
			[5] = { -1,0 },
			[6] = { 25,0 },
			[7] = { 1,0 },			
			[8] = { 34,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 84,0 },
			["p0"] = { 10,0 },
			["p1"] = { 11,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["3"] = {
		[1885233650] = {
			[1] = { 121,0 },
			[3] = { 59,0 },
			[4] = { 31,0 },
			[5] = { -1,0 },
			[6] = { 25,0 },
			[7] = { 1,0 },			
			[8] = { 57,0 },
			[9] = { 7,1 },
			[10] = { -1,0 },
			[11] = { 222,20 },		
			["p0"] = { 10,0 },
			["p1"] = { 5,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 121,0 },
			[3] = { 67,0 },
			[4] = { 30,0 },
			[5] = { -1,0 },
			[6] = { 66,3 },
			[7] = { 1,0 },			
			[8] = { 34,0 },
			[9] = { 7,1 },
			[10] = { -1,0 },
			[11] = { 9,0 },
			["p0"] = { 10,0 },
			["p1"] = { 11,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["4"] = {
		[1885233650] = {
			[1] = { 121,0 },
			[3] = { 4,0 },
			[4] = { 31,0 },
			[5] = { -1,0 },
			[6] = { 24,0 },
			[7] = { -1,0 },			
			[8] = { 23,0 },
			[9] = { 13,0 },
			[10] = { -1,0 },
			[11] = { 151,0 },
			["p0"] = { 10,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 121,0 },
			[3] = { 3,0 },
			[4] = { 30,0 },
			[5] = { -1,0 },
			[6] = { 66,3 },
			[7] = { 8,0 },			
			[8] = { 69,0 },
			[9] = { 14,0 },
			[10] = { -1,0 },
			[11] = { 148,0 },			
			["p0"] = { 10,0 },
			["p1"] = { 11,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["5"] = {
		[1885233650] = {
			[1] = { 56,2 },
			[3] = { 96,0 },
			[4] = { 31,0 },
			[5] = { -1,0 },
			[6] = { 24,0 },
			[7] = { -1,0 },			
			[8] = { -1,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 50,0 },		
			["p0"] = { 124,0 },
			["p1"] = { 25,4 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 56,2 },
			[3] = { 111,0 },
			[4] = { 30,0 },
			[5] = { -1,0 },
			[6] = { 66,3 },
			[7] = { 1,0 },			
			[8] = { 34,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 43,0 },
			["p0"] = { 123,0 },
			["p1"] = { 27,4 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["6"] = {
		[1885233650] = {
			[1] = { 121,0 },
			[3] = { 74,0 },
			[4] = { 96,0 },
			[5] = { -1,0 },
			[6] = { 56,1 },
			[7] = { 127,0 },
			[8] = { 56,1 },
			[9] = { -1,0 },
			[10] = { 58,0 },
			[11] = { 250,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 121,0 },
			[3] = { 96,0 },
			[4] = { 99,0 },
			[5] = { -1,0 },
			[6] = { 27,0 },
			[7] = { 97,0 },
			[8] = { 27,1 },
			[9] = { -1,0 },
			[10] = { 66,0 },
			[11] = { 258,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["7"] = {
		[1885233650] = {
			[1] = { 121,0 },
			[3] = { 81,0 },
			[4] = { 10,0 },
			[5] = { -1,0 },
			[6] = { 56,1 },
			[7] = { 127,0 },			
			[8] = { 56,1 },
			[9] = { -1,0 },
			[10] = { 58,0 },
			[11] = { 95,1 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 0,0 },
			[3] = { 106,1 },
			[4] = { 37,0 },
			[5] = { 0,0 },
			[6] = { 27,0 },
			[7] = { 97,0 },			
			[8] = { 27,1 },
			[9] = { -1,0 },
			[10] = { 66,0 },
			[11] = { 86,1 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["8"] = {
		[1885233650] = {
			[1] = { 121,0 },
			[3] = { 38,0 },
			[4] = { 96,0 },
			[5] = { -1,0 },
			[6] = { 56,1 },
			[7] = { 126,0 },			
			[8] = { 71,3 },
			[9] = { -1,0 },
			[10] = { 57,0 },
			[11] = { 249,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,1 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 121,0 },
			[3] = { 18,0 },
			[4] = { 99,0 },
			[5] = { -1,0 },
			[6] = { 27,0 },
			[7] = { 14,3 },
			[8] = { 77,3 },		
			[9] = { -1,0 },
			[10] = { 65,0 },
			[11] = { 257,0 },		
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["9"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 81,0 },
			[4] = { 25,5 },
			[5] = { -1,0 },
			[6] = { 21,9 },
			[7] = { 126,0 },			
			[8] = { 56,1 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 13,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 85,0 },
			[4] = { 37,5 },
			[5] = { -1,0 },
			[6] = { 10,1 },
			[7] = { 14,3 },		
			[8] = { 27,1 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 27,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["10"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 4,0 },
			[4] = { 25,5 },
			[5] = { -1,0 },
			[6] = { 21,9 },
			[7] = { 126,0 },			
			[8] = { 31,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 31,7 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 1,0 },
			[4] = { 37,5 },
			[5] = { -1,0 },
			[6] = { 0,2 },
			[7] = { 14,3 },		
			[8] = { 64,2 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 57,7 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["11"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 74,0 },
			[4] = { 3,3 },
			[5] = { -1,0 },
			[6] = { 7,0 },
			[7] = { 126,0 },			
			[8] = { 15,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 16,1 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 96,0 },
			[4] = { 3,13 },
			[5] = { -1,0 },
			[6] = { 10,1 },
			[7] = { 14,3 },
			[8] = { 15,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },	
			[11] = { 141,1 },		
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["12"] = {
		-- male
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 26,0 },
			[4] = { 4,0 },
			[5] = { 34,0 },
			[6] = { 24,0 },
			[7] = { -1,0 },			
			[8] = { -1,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 234,5 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		-- female
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 20,0 }, -- maos
			[4] = { 75,0 }, -- calça
			[5] = { 34,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 86,1 }, -- jaqueta
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["66"] = {
		-- male
		[1885233650] = {
			[1] = { 68,0 },
			[3] = { 36,0 },
			[4] = { 26,0 },
			[5] = { -1,0 },
			[6] = { 25,0 },
			[7] = { -1,0 },			
			[8] = { 129,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 220,20 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		 
		}
	},
	["devil"] = {
		-- male
		[1885233650] = {
			[1] = { 104,25 },
			[3] = { 33,0 },
			[4] = { 33,0 },
			[5] = { -1,0 },
			[6] = { 25,0 },
			[7] = { -1,0 },			
			[8] = { 0,0 },
			[9] = { 220,20 },
			[10] = { -1,0 },
			[11] = { 220,20 },
			["p0"] = { 106,20 },
			["p1"] = { 15,7 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		-- female
		[-1667301416] = {
			[1] = { 104,25 },
			[3] = { 33,0 },
			[4] = { 33,0 },
			[5] = { -1,0 },
			[6] = { 25,0 },
			[7] = { -1,0 },			
			[8] = { 0,0 },
			[9] = { 220,20 },
			[10] = { -1,0 },
			[11] = { 234,5 },
			["p0"] = { -1,0 },
			["p1"] = { 15,7 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["67"] = {
		-- female
		[-1667301416] = {
			[1] = { 52,0 },
			[3] = { 62,0 },
			[4] = { 11,1 },
			[5] = { 32,11 },
			[6] = { 85,0 },
			[7] = { -1,0 },
			[8] = { 155,0 },
			[9] = { 0,0 },
			[10] = { 0,0 },
			[11] = { 42,5 },
			["p0"] = { 117,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
	}
}

RegisterCommand('preset',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"ems.permissao") or vRP.hasPermission(user_id,"mecanico.permissao") or vRP.hasPermission(user_id,"group.permissao") then
		if args[1] then
			local custom = presets[tostring(args[1])]
			if custom then
				local old_custom = vRPclient.getCustomization(source)
				local idle_copy = {}

				idle_copy = vRP.save_idle_custom(source,old_custom)
				idle_copy.modelhash = nil

				for l,w in pairs(custom[old_custom.modelhash]) do
					idle_copy[l] = w
				end
				vRPclient._setCustomization(source,idle_copy)
			end
		else
			vRP.removeCloak(source)
		end
	end
end)

--[ DETIDO ]-------------------------------------------------------------------------------------------------------------------------------------------------------------
 
RegisterCommand('detido',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"detido.permissao") then
        local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,5)
        local motivo = vRP.prompt(source,"Motivo:","")
        if motivo == "" then
			return
		end
		local oficialid = vRP.getUserIdentity(user_id)
        if vehicle then
            local puser_id = vRP.getUserByRegistration(placa)
            local rows = vRP.query("creative/get_vehicles",{ user_id = parseInt(puser_id), vehicle = vname })
            if rows[1] then
                if parseInt(rows[1].detido) == 1 then
                    TriggerClientEvent("Notify", source, "aviso","Este veículo já se encontra detido.",8000)
                else
                	local identity = vRP.getUserIdentity(puser_id)
					local nplayer = vRP.getUserSource(parseInt(puser_id))
					
					vRP.execute("creative/set_detido",{ user_id = parseInt(puser_id), vehicle = vname, detido = 1, time = parseInt(os.time()) })

					randmoney = math.random(90,150)
					vRP.giveMoney(user_id,parseInt(randmoney))
					TriggerClientEvent("Notify",source,"sucesso","Carro apreendido com sucesso.")
					TriggerClientEvent("Notify", source, "aviso","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
					TriggerClientEvent("Notify", nplayer, "aviso","Seu Veículo foi <b>Detido</b>.<br><b>Motivo:</b> "..motivo..".")
					vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
                end
            end
        end
    end
end)
 
 
--[ ALGEMAR ]------------------------------------------------------------------------------------------------------------------------------------------------------------
 
RegisterServerEvent("vrp_policia:algemar")
AddEventHandler("vrp_policia:algemar",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		if not vRPclient.isHandcuffed(source) then
			if vRP.getInventoryItemAmount(user_id,"algemas") >= 1 then
				if vRPclient.isHandcuffed(nplayer) then
					TriggerClientEvent('carregar',nplayer,source)
					vRPclient._playAnim(source,false,{{"mp_arresting","a_uncuff"}},false)
					SetTimeout(5000,function()
						vRPclient.toggleHandcuff(nplayer)
						TriggerClientEvent('carregar',nplayer,source)
						TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
						TriggerClientEvent('removealgemas',nplayer)
					end)
				else
					TriggerClientEvent('cancelando',source,true)
					TriggerClientEvent('cancelando',nplayer,true)
					TriggerClientEvent('carregar',nplayer,source)
					vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
					vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
					SetTimeout(3500,function()
						vRPclient._stopAnim(source,false)
						vRPclient.toggleHandcuff(nplayer)
						TriggerClientEvent('carregar',nplayer,source)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('cancelando',nplayer,false)
						TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
						TriggerClientEvent('setalgemas',nplayer)
					end)
				end
			else
				if vRP.hasPermission(user_id,"algemar.permissao") then
					if vRPclient.isHandcuffed(nplayer) then
						TriggerClientEvent('carregar',nplayer,source)
						vRPclient._playAnim(source,false,{{"mp_arresting","a_uncuff"}},false)
						SetTimeout(5000,function()
							vRPclient.toggleHandcuff(nplayer)
							TriggerClientEvent('carregar',nplayer,source)
							TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
							TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
							TriggerClientEvent('removealgemas',nplayer)
						end)
					else
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent('cancelando',nplayer,true)
						TriggerClientEvent('carregar',nplayer,source)
						vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
						vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
						SetTimeout(3500,function()
							vRPclient._stopAnim(source,false)
							vRPclient.toggleHandcuff(nplayer)
							TriggerClientEvent('carregar',nplayer,source)
							TriggerClientEvent('cancelando',source,false)
							TriggerClientEvent('cancelando',nplayer,false)
							TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
							TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
							TriggerClientEvent('setalgemas',nplayer)
						end)
					end
				end
			end
		end
	end
end)
 
--[ CARREGAR ]-----------------------------------------------------------------------------------------------------------------------------------------------------------
 
RegisterServerEvent("vrp_policia:carregar")
AddEventHandler("vrp_policia:carregar",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if vRP.hasPermission(user_id,"carregarh.permissao") then
		if nplayer then
			if not vRPclient.isHandcuffed(source) then
				TriggerClientEvent('carregar',nplayer,source)
			end
		end
	end
end)
 
--[ RMASCARA ]-----------------------------------------------------------------------------------------------------------------------------------------------------------
 
RegisterCommand('rmascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id, "geral.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent('rmascara',nplayer)
		end
	end
end)
 
--[ RCHAPEU ]------------------------------------------------------------------------------------------------------------------------------------------------------------
 
RegisterCommand('rchapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent('rchapeu',nplayer)
		end
	end
end)
 
--[ RCAPUZ ]-------------------------------------------------------------------------------------------------------------------------------------------------------------
 
RegisterCommand('rcapuz',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id, "geral.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			if vRPclient.isCapuz(nplayer) then
				vRPclient.setCapuz(nplayer)
				TriggerClientEvent("Notify",source,"sucesso","Capuz colocado com sucesso.")
			else
				TriggerClientEvent("Notify", source, "aviso","A pessoa não está com o capuz na cabeça.")
			end
		end
	end
end)
 
--[ CV ]-----------------------------------------------------------------------------------------------------------------------------------------------------------------
 
RegisterCommand('cv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,5)
	if nplayer then
		if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id, "geral.permissao") then
			vRPclient.putInNearestVehicleAsPassenger(nplayer,7)
		else
			if vRPclient.isInComa(nplayer) then
				vRPclient.putInNearestVehicleAsPassenger(nplayer,7)
			else
				local ok = vRP.request(nplayer,"Você deseja ser colocado no veiculo?",8)
				if ok then
					vRPclient.putInNearestVehicleAsPassenger(nplayer,7)
				end
			end
		end
	end
end)

--[ RV ]-----------------------------------------------------------------------------------------------------------------------------------------------------------------
 
RegisterCommand('rv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,10)
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id, "geral.permissao") then
		vRPclient.ejectVehicle(nplayer)
	else
		if vRPclient.isInComa(nplayer) then
			vRPclient.ejectVehicle(nplayer)
		else
			local ok = vRP.request(nplayer,"Você deseja ser retirado do veiculo?",8)
			if ok then
				vRPclient.ejectVehicle(nplayer)
			end
		end
	end
end)

--[ PD ]-----------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('pd',function(source,args,rawCommand)
    if args[1] then
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        local permission = "policia.permissao"
        if vRP.hasPermission(user_id,permission) then
            local soldado = vRP.getUsersByPermission(permission)
            for l,w in pairs(soldado) do
                local player = vRP.getUserSource(parseInt(w))
                if player then
                    async(function()
                        TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{64,179,255},rawCommand:sub(3))
                    end)
                end
            end
        end
    end
end)
 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ CONE ]---------------------------------------------------------------------------------------------------------------------------------------------------------------
 
RegisterCommand('cone',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		TriggerClientEvent('cone',source,args[1])
	end
end)
 
--[ BARREIRA ]-----------------------------------------------------------------------------------------------------------------------------------------------------------
 
RegisterCommand('barreira',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		TriggerClientEvent('barreira',source,args[1])
	end
end)
 
--[ SPIKE ]--------------------------------------------------------------------------------------------------------------------------------------------------------------
 
RegisterCommand('spike',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		TriggerClientEvent('spike',source,args[1])
	end
end)
 
--[ DISPAROS ]-----------------------------------------------------------------------------------------------------------------------------------------------------------
 
delay = {}
RegisterServerEvent('atirando')
AddEventHandler('atirando',function(x,y,z)
	local user_id = vRP.getUserId(source)
	if user_id then	
		if not delay[user_id] then
			delay[user_id] = true
			if not vRP.hasPermission(user_id,"disparos.permissao") then
				local policiais = vRP.getUsersByPermission("disparos.permissao")
				for l,w in pairs(policiais) do
					local player = vRP.getUserSource(w)
					if player then

						local data = { x = x, y = y, z = z, title = 'DISPAROS', code = 'QTH' }
						
						TriggerClientEvent('NotifyPush',player,data)
					end
				end
			end
			SetTimeout(10000,function()
				delay[user_id] = nil
			end)
		end
	end
end)
 
--[ PRISÃO ]-------------------------------------------------------------------------------------------------------------------------------------------------------------
 
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	local player = vRP.getUserSource(parseInt(user_id))
	if player then
		SetTimeout(30000,function()
			local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
			local tempo = json.decode(value) or -1

			if tempo == -1 then
				return
			end

			if tempo > 0 then
				TriggerClientEvent('prisioneiro',player,true)
				vRPclient.teleport(player,1680.1,2513.0,46.5)
				prison_lock(parseInt(user_id))
			end
		end)
	end
end)

function prison_lock(target_id)
	local player = vRP.getUserSource(parseInt(target_id))
	if player then
		SetTimeout(60000,function()
			local value = vRP.getUData(parseInt(target_id),"vRP:prisao")
			local tempo = json.decode(value) or 0
			if parseInt(tempo) >= 1 then
				TriggerClientEvent("Notify",player,"aviso","Ainda vai passar <b>"..parseInt(tempo).." meses</b> preso.")
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(parseInt(tempo)-1))
				prison_lock(parseInt(target_id))
			elseif parseInt(tempo) == 0 then
				TriggerClientEvent('prisioneiro',player,false)
				vRPclient.teleport(player,1850.5,2604.0,45.5)
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(-1))
				TriggerClientEvent("Notify",player,"aviso","Sua sentença terminou, esperamos não ve-lo novamente.")
			end
			vRPclient.PrisionGod(player)
		end)
	end
end
 
--[ DIMINUIR PENA ]------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent("diminuirpena879545235")
AddEventHandler("diminuirpena879545235",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
	local tempo = json.decode(value) or 0
	if tempo >= 2 then
		vRP.setUData(parseInt(user_id),"vRP:prisao",json.encode(parseInt(tempo)-2))
		TriggerClientEvent("Notify", source, "aviso","Sua pena foi reduzida em <b>2 meses</b>, continue o trabalho.")
	else
		TriggerClientEvent("Notify", source, "aviso","Atingiu o limite da redução de pena, não precisa mais trabalhar.")
	end
end)

function src.checkPermissao()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		return true
	end
	return false
end

RegisterCommand('teste', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
	local tempo = json.decode(value) or 0
	if tempo >= 2 then
		vRP.setUData(parseInt(user_id),"vRP:prisao",json.encode(parseInt(tempo)-2))
		TriggerClientEvent("Notify", source, "aviso","Sua pena foi reduzida em <b>2 meses</b>, continue o trabalho.")
	else
		TriggerClientEvent("Notify", source, "aviso","Atingiu o limite da redução de pena, não precisa mais trabalhar.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /mascara
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if checkRoupas() then
				if user_id then
					TriggerClientEvent("setmascara",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /blusa
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('blusa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if checkRoupas() then
				if user_id then
					TriggerClientEvent("setblusa",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /colete
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('colete',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if checkRoupas() then
				if user_id then
					TriggerClientEvent("setcolete",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /jaqueta
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('jaqueta',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if checkRoupas() then
				if user_id then
					TriggerClientEvent("setjaqueta",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /maos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if checkRoupas() then
				if user_id then
					TriggerClientEvent("setmaos",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /calca
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('calca',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if checkRoupas() then
				if user_id then
					TriggerClientEvent("setcalca",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /acessorios
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('acessorios',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if checkRoupas() then
				if user_id then
					TriggerClientEvent("setacessorios",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /sapatos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sapatos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if checkRoupas() then
				if user_id then
					TriggerClientEvent("setsapatos",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /chapeu
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('chapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if checkRoupas() then
				if user_id then
					TriggerClientEvent("setchapeu",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /oculos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('oculos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if checkRoupas() then
				if user_id then
					TriggerClientEvent("setoculos",source,args[1],args[2])
				end
			end
		end
	end
end)
------------------------------------------------------------
--  CARREGAR NO OMBRO
----------------------------------------------------------------

local ac_webhook = ""

function banir(user_id)
	source = vRP.getUserSource(user_id)
	if source ~= nil then
		local ped = GetPlayerPed(source) 
		local loc = GetEntityCoords(ped) 
		local reason = "ANTI HACK: 	localização:	"..loc.x..","..loc.y..","..loc.z
		vRP.setBanned(user_id,true)					
		local temp = os.date("%x  %X")
		local msg = "Puxando todos players!"
		PerformHttpRequest(webh.carregar, function(err, text, headers) end, 'POST', json.encode({content = "ANTI HACK	[ID]: "..user_id.."		"..temp.."[BAN]		[MOTIVO:"..msg.."]	"..reason}), { ['Content-Type'] = 'application/json' }) 		
		TriggerClientEvent("vrp_sound:source",source,"ban",1.0)
		Citizen.Wait(4000)
		source = vRP.getUserSource(user_id)
		vRP.kick(source,"Tentativa de bug!")						
	end
end

RegisterServerEvent('cmg2_animations:syncSCRIPTFODIDO')
AddEventHandler('cmg2_animations:syncSCRIPTFODIDO', function(target, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget)
	vRP.antiflood(source,"cmg2_animations:syncSCRIPTFODIDO",3)
	local user_id = vRP.getUserId(source)
	if(target~=0 or targetSrc~=0)then
		banir(user_id)
		return
	end
	
	targetSrc = vRPclient.getNearestPlayer(source,3)
	
	animationLib		= "missfinale_c2mcs_1"
	animationLib2		= "nm"
	animation 			= "fin_c2_mcs_1_camman"
	animation2			= "firemans_carry"
	distans 			= 0.15
	distans2 			= 0.27
	height 				= 0.63
	length 				= 100000
	spin 				= 0.0			
	controlFlagSrc 		= 49
	controlFlagTarget 	= 33
	animFlagTarget 		= 1
		if targetSrc and source then
			TriggerClientEvent('cmg2_animations:syncTargetSCRIPTFODIDO', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget)
			TriggerClientEvent('cmg2_animations:syncMeSCRIPTFODIDO', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
		end
end)

RegisterServerEvent('cmg2_animations:stopSCRIPTFODIDO')
AddEventHandler('cmg2_animations:stopSCRIPTFODIDO', function(targetSrc)
	vRP.antiflood(source,"cmg2_animations:stopSCRIPTFODIDO",3)
	local user_id = vRP.getUserId(source)
	if(targetSrc~=0)then
		banir(user_id)
		return
	end
	targetSrc = vRPclient.getNearestPlayer(source,3)
	if targetSrc then
		TriggerClientEvent('cmg2_animations:cl_stopSCRIPTFODIDO', targetSrc)
	end
end)

function src.checkRadio()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"radio") >= 1 then
		return true
	else
		TriggerClientEvent("Notify", source, "aviso","Você precisa comprar um <b>Rádio</b> na <b>Loja de Departamento</b>.",8000)
		return false
	end
end

function src.checkPolice()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "policia.permissao") then
		return true
	else
		TriggerClientEvent("Notify", source, "aviso","Frequencia exclusiva!",8000)
		return false
	end
end

-- bvida
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('bvida',function(source,rawCommand)
    local user_id = vRP.getUserId(source)
        vRPclient._setCustomization(source,vRPclient.getCustomization(source))
        -- vRP.removeCloak(source)    
        SendWebhookMessage(webh.bvida,"Passaporte: [ ** "..user_id.."** ] usou o comando: **/bvida** e ")        
end)
----------------------------------------------------------------
----------------------- REQUEST BEIJO --------------------------
----------------------------------------------------------------
RegisterCommand("beijar",function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRPclient.getNearestPlayer(source,2)
    if nplayer then
        local pedido = vRP.request(nplayer,"Deseja iniciar o beijo ?",10)
        if pedido then
            vRPclient.playAnim(source,true,{{"mp_ped_interaction","kisses_guy_a"}},false)
            vRPclient.playAnim(nplayer,true,{{"mp_ped_interaction","kisses_guy_b"}},false)
        end
    end
end)
--[ MARCAR AÇÃO ]---------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('acao',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if true then
		local id = vRP.prompt(source,"QUANTOS BANDIDOS?:","")
		local ocorrencia = vRP.prompt(source,"QUAL AÇÃO:","")
		local horario = vRP.prompt(source,"QUAL HORARIO:","")
		if id == "" or ocorrencia == "" then
			return
		end
		local oficialid = vRP.getUserIdentity(user_id)
		local identity = vRP.getUserIdentity(parseInt(id))
		local nplayer = vRP.getUserSource(parseInt(id))

		SendWebhookMessage(webh.acao,"```\n[==============MARCAR AÇÃO==============]\n[QUANTOS BANDIDOS]: "..id.."Bandidos\n[QUAL AÇÃO?]: "..ocorrencia.."\n[HORARIO DA AÇÃO] "..horario.." \r```")

		TriggerClientEvent("Notify",source,"sucesso","Ação marcada com sucesso.")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end)

--[ MARCAR AÇÃO ]---------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('advdeus',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"manager.permissao") then
		local id = vRP.prompt(source,"Passaporte:","")
		local ocorrencia = vRP.prompt(source,"Motivo:","")
		if id == "" or ocorrencia == "" then
			return
		end
		local oficialid = vRP.getUserIdentity(user_id)
		local identity = vRP.getUserIdentity(parseInt(id))
		local nplayer = vRP.getUserSource(parseInt(id))

		SendWebhookMessage(webh.staffadv,"```prolog\n[==============ADVERTÊNCIA STAFF==============]\n[STAFF]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.."  \n[STAFF ADVERTIDO]: "..id.." "..identity.name.." "..identity.firstname.."\n[MOTIVO]: "..ocorrencia.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

		TriggerClientEvent("Notify",source,"sucesso","Registrado com sucesso.")
		TriggerClientEvent("Notify",nplayer,"aviso","Você recebeu uma advertência administrativa")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end)

------------ [ ADV STAFF ] --------------------------------------------------------------------------------------------------------------------

RegisterCommand('adv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"geral.permissao") then
		local id = vRP.prompt(source,"Passaporte:","")
		local ocorrencia = vRP.prompt(source,"Advertencia:","")
		if id == "" or ocorrencia == "" then
			return
		end
		local oficialid = vRP.getUserIdentity(user_id)
		local identity = vRP.getUserIdentity(parseInt(id))
		local nplayer = vRP.getUserSource(parseInt(id))

		SendWebhookMessage(webh.adv,"```prolog\n[==============ADVERTÊNCIA==============]\n[STAFF]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.."  \n[CIVIL]: "..id.." "..identity.name.." "..identity.firstname.."\n[Advertencia]: "..ocorrencia.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

		TriggerClientEvent("Notify",source,"sucesso","Advertencia registrada com sucesso.")
		TriggerClientEvent("Notify",nplayer,"aviso","Sua <b>Você</b> foi advertido, verifique a sala de advertencias no discord.")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------
--Servidor online
------------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    PerformHttpRequest("WEBHOOK", function(err, text, headers) end, 'POST', json.encode({
         content = '||@everyone||',
         embeds = {
            { 
                title = "Servidor Online:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                thumbnail = {
                url = "https://media.discordapp.net/attachments/902679973129773137/980746829555695726/ELC.png"
                }, 
                fields = {
                    { 
                        name = "FIVEM CONNECT", 
                        value = "connect elite.jogar.com",
                        inline = true
                    },
                    { 
                        name = "Loja Elite", 
                        value = "https://discord.gg/SjC4eEHAcD",
                        inline = true
                    },

                }, 
                footer = { 
                    text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
                    icon_url = "https://media.discordapp.net/attachments/902679973129773137/980746829555695726/ELC.png" 
                },
                color = 16384038 
            }
        }
    }), { ['Content-Type'] = 'application/json' })
 end)

----------------------------------------------------------------------------------------------------------------------------------------
-- PED INVISIVEL NA CRIAÇAO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
	  local sleep = 500
	  if Instanced then
		sleep = 0
        for i=0, 255 do 
          local otherPlayerPed = GetPlayerPed(i)
    
          if otherPlayerPed ~= PlayerPedId() then
            SetEntityLocallyInvisible(otherPlayerPed)
            SetEntityNoCollisionEntity(PlayerPedId(),  otherPlayerPed,  true)
          end
        end
	  end
	  Citizen.Wait(sleep)
    end
end)

RegisterCommand('attachs',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,'attachs.permissao') then
		TriggerClientEvent('attachsgun',source)
	else
		TriggerClientEvent('Notify',source,"negado","o /attachs é restrito a vips!")
	end
end)

RegisterCommand('cor',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if args[1] then
		if vRP.hasPermission(user_id,'cor.permissao') then
			TriggerClientEvent('colorgun',source,args[1])
		else
			TriggerClientEvent('Notify',source,"negado","o /cor é restrito a vips!")
		end
	end
end)