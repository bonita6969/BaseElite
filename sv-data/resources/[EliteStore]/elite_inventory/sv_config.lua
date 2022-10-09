-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
Tunnel = module("vrp","lib/Tunnel")
Proxy = module("vrp","lib/Proxy")
Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- SCRIPTS
-----------------------------------------------------------------------------------------------------------------------------------------
idgens = Tools.newIDGenerator()

vGARAGE = Tunnel.getInterface("elite_garages")
vCLIENT = Tunnel.getInterface("elite_garages")
vTASKBAR = Tunnel.getInterface("taskbar")
vClientINV = Tunnel.getInterface('elite_inventory')
-- vGARAGE = Tunnel.getInterface("nation_garages")
fclient = Tunnel.getInterface("nation_garages")

vRP.prepare("getSelf","SELECT * FROM inv_identity WHERE user_id = @user_id")
vRP.prepare("setSelf","REPLACE INTO inv_identity(user_id,self) VALUES(@user_id,@self)")
---------------------------------------------------------------------------------------------------------------------------------------
--VARIABLES
---------------------------------------------------------------------------------------------------------------------------------------
local active = {}
local weaponrechenger = {}
local registerTimers = {}
local actived = {}
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- MOCHILA
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.Mochila()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local inv = vRP.getInventory(user_id)
        if inv then
            local inventory = {}
            for k, v in pairs(inv) do
                if (parseInt(v.amount) <= 0 or vRP.itemBodyList(v.item) == nil) then
                    vRP.removeInventoryItem(user_id, v.item, parseInt(v.amount), false)
                else
                    
                    v.amount = parseInt(v.amount)
                    v.name = vRP.itemNameList(v.item)
                    v.peso = vRP.getItemWeight(v.item)
                    v.index = vRP.itemIndexList(v.item)
                    v.key = v.item
                    v.slot = k
                    
                    inventory[k] = v
                end
            end
            
            local data = vRP.query('getSelf', { user_id = user_id })
            local selfie
            if data[1] ~= nil then
                selfie = data[1].self
            else
                selfie = "https://images-ext-2.discordapp.net/external/uNH8qfRXyUNlNvH-dV5B-J5Rl1jojStvgzarMXEEcHw/https/images-ext-1.discordapp.net/external/6jZ21y6F01NR9mEUz4cyWOSTuu14_T08nDa6tZY2l38/%253Fsize%253D2048/https/cdn.discordapp.com/icons/796759127678124043/a_824fd144108b5ddae724592d30c04f6d.gif"
            end
            local identity = vRP.getUserIdentity(user_id)
            local emp = vRP.getUserGroupByType(user_id,"job")
            emp = vRP.getGroupTitle(emp)
            if emp == "" or emp == nil then
                emp = "Civil"
            end

            local coins = vRP.getCoins(user_id) or 0
            local multas = vRP.getUData(user_id,"vRP:multas")
            local mymultas = json.decode(multas) or 0
		    local vip = vRP.getUserGroupByType(user_id,"vip")
		    local vip2= vRP.getUserGroupByType(user_id,"vip2")
		    local vip3 = vRP.getUserGroupByType(user_id,"vip3")
		    local vip4 = vRP.getUserGroupByType(user_id,"vip4")
		    local vip5 = vRP.getUserGroupByType(user_id,"vip5")
		    local vip6 = vRP.getUserGroupByType(user_id,"vip6")
		    local vip7 = vRP.getUserGroupByType(user_id,"vip7")
		    local vip8 = vRP.getUserGroupByType(user_id,"vip8")
            if vip1 == "" or vip1 == nil then
                vip1 = ""
            end
            if vip2 == "" or vip2 == nil then
                vip2 = ""
            end
            if vip3 == "" or vip3 == nil then
                vip3 = ""
            end
            if vip4 == "" or vip4 == nil then
                vip4 = ""
            end
            if vip5 == "" or vip5 == nil then
                vip5 = ""
            end
            if vip6 == "" or vip6 == nil then
                vip6 = ""
            end
            if vip7 == "" or vip7 == nil then
                vip7 = ""
            end
            if vip8 == "" or vip8 == nil then
                vip8 = ""
            end
        return inventory, vRP.computeInvWeight(user_id), vRP.getInventoryMaxWeight(user_id), {identity.name .. " " .. identity.firstname, parseInt(user_id), vRP.getBankMoney(user_id), emp, identity.phone, identity.registration, identity.age,vRP.getMoney(user_id),coins,parseInt(mymultas),vip1,vip2,vip3,vip4,vip5,vip6,vip7,vip8},selfie
        end
    end
end

local bandagem = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(bandagem) do
			if v > 0 then
				bandagem[k] = v - 1
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- USEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inventory:useItem")
AddEventHandler("vrp_inventory:useItem", function(slot, rAmount)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if rAmount == nil then
            rAmount = 1
        end
        
        if rAmount <= 0 then
            rAmount = 1
        end

        if active[user_id] == nil then
            local inv = vRP.getInventory(user_id)
            if inv then
                if not inv[tostring(slot)] or inv[tostring(slot)].item == nil then
                    return
                end

                local itemName = inv[tostring(slot)].item

                if vRP.itemTypeList(itemName) == "use" then

                    if itemName == "mochila" then
                        if vRP.getInventoryMaxWeight(user_id) >= 90 then
                            TriggerClientEvent("Notify",source,"negado","Você não pode equipar mais mochilas.",8000)
                        else
                            if vRP.tryGetInventoryItem(user_id,"mochila",1) then
                                vClientINV.closeInventory(source)
                                TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
                                vRP.varyExp(user_id,"physical","strength",650)
        
                                if vRP.getExp(user_id,"physical","strength") <= 660 then
                                    TriggerClientEvent("inventory:mochilaoff",source)
                                elseif vRP.getExp(user_id,"physical","strength") >= 680 then
                                else
                                    TriggerClientEvent("inventory:mochilaon",source)
                                end
                            end
                        end
                    elseif itemName == "pneus" then
                        if not vRPclient.isInVehicle(source) then
                            local vehicle = vRPclient.getNearestVehicle(source,3)
                            if vehicle then
                                if vRP.hasPermission(user_id,"mecanico.permissao") then
                                    actived[user_id] = true
                                    TriggerClientEvent('cancelando',source,true)
                                    vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
                                    TriggerClientEvent("progress",source,5000,"reparando pneus")
                                    SetTimeout(5000,function()
                                        actived[user_id] = nil
                                        TriggerClientEvent('cancelando',source,false)
                                        TriggerClientEvent('vrp_inventory:repairTires',-1,vnetid)
                                        vRPclient._stopAnim(source,false)
                                    end)
                                else
                                    if vRP.tryGetInventoryItem(user_id,"pneus",1,slot) then
                                        vClientINV.closeInventory(source)
                                        actived[user_id] = true
                                        TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
                                        TriggerClientEvent('cancelando',source,true)
                                        vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
                                        TriggerClientEvent("progress",source,5000,"reparando pneus")
                                        SetTimeout(5000,function()
                                            actived[user_id] = nil
                                            TriggerClientEvent('cancelando',source,false)
                                            TriggerClientEvent('vrp_inventory:repairTires',-1,vnetid)
                                            vRPclient._stopAnim(source,false)
                                        end)
                                    end
                                end
                            end
                        end	
                    elseif itemName == "adrenalina" then
                        local paramedico = vRP.getUsersByPermission("ems.permissao")
                        if parseInt(#paramedico) < 1 then
                            local nplayer = vRPclient.getNearestPlayer(source,2)
                            if nplayer then
                                if vRPclient.isInComa(nplayer) then
                                    if vRP.tryGetInventoryItem(user_id,"adrenalina",1) then
                                        vClientINV.closeInventory(source)
                                        TriggerClientEvent('cancelando',source,true)
                                        vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
                                        TriggerClientEvent("progress",source,30000,"reanimando")
                                        SetTimeout(30000,function()
                                            TriggerClientEvent('godblur',nplayer)
                                            TriggerClientEvent('resetWarfarina',nplayer)
                                            vRPclient.killGod(nplayer)
                                            vRPclient._stopAnim(source,false)
                                            TriggerClientEvent('cancelando',source,false)
                                        end)
                                    end
                                else
                                    TriggerClientEvent("Notify", source, "aviso","A pessoa precisa estar em coma para prosseguir.",8000)
                                end
                            end
                        end
                    elseif itemName == "bandagem" then
                            if vRPclient.getHealth(source) > 0 and vRPclient.getHealth(source) < 3000 then
                                if bandagem[user_id] == 300 or not bandagem[user_id] then
                                    if vRP.tryGetInventoryItem(user_id,"bandagem",1) then
                                        vClientINV.closeInventory(source)
                                        vCLIENT.fecharnuicrafting(source)
                                        bandagem[user_id] = 300
                                        actived[user_id] = true
                                        vRPclient._CarregarObjeto(source,"amb@world_human_clipboard@male@idle_a","idle_c","v_ret_ta_firstaid",49,60309)
                                        TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
                                        TriggerClientEvent('cancelando',source,true)
                                        TriggerClientEvent("progress",source,20000,"bandagem")
                                        SetTimeout(20000,function()
                                            actived[user_id] = nil
                                            TriggerClientEvent('bandagem',source)
                                            TriggerClientEvent('resetWarfarina',source)
                                            TriggerClientEvent('tratamento',source)
                                            TriggerClientEvent('resetBleeding',source)
                                            TriggerClientEvent('resetDiagnostic',source)
                                            TriggerClientEvent('cancelando',source,false)
                                            vRPclient._DeletarObjeto(source)
                                            TriggerClientEvent("Notify",source,"sucesso","Bandagem utilizada com sucesso.",8000)
                                            Citizen.Wait(10000)
                                        end)
                                    end
                                end
                            else
                                TriggerClientEvent("Notify",source,"aviso","Você não pode utilizar de vida cheia ou nocauteado.",8000)
                            end
                    elseif itemName == "maquininha" then
                        local source = source
                        local user_id = vRP.getUserId(source)
                        local nplayer = vRPclient.getNearestPlayer(source, 2)
                        local nuser_id = vRP.getUserId(nplayer)

                        TriggerClientEvent("vrp_inventory:fechar", source)
                        vClientINV.closeInventory(source)

                        if nplayer then
                            local identity = vRP.getUserIdentity(user_id)
                            local identitynu = vRP.getUserIdentity(nuser_id)
                            local banco = vRP.getBankMoney(user_id)
                            local banconu = vRP.getBankMoney(nuser_id)

                            if vRP.getInventoryItemAmount(user_id, "maquininha") >= 1 then
                                local cobranca = vRP.prompt(source, "Quanto deseja cobrar pelos serviços prestados a " .. identitynu.name .. " " .. identitynu.firstname .. "</b>?", "")
                                TriggerClientEvent("emotes", source, "anotar2")

                                if cobranca ~= "" then
                                    local valorfatura = parseInt(cobranca)
                                    local fatura = vRP.request(nplayer, "<b>" .. identity.name .. " " .. identity.firstname .. "</b> está cobrando <b>$" .. valorfatura .. " dólares</b> pelos serviços. Deseja pagar?", 30)

                                    if fatura then
                                        if vRP.getInventoryItemAmount(nuser_id, "cartao-debito") >= 1 then
                                            if banconu >= valorfatura then
                                                local tax = parseInt(3 / 100 * valorfatura)
                                                local pagamento = parseInt(valorfatura - tax)

                                                vRP.setBankMoney(user_id, banco + pagamento)
                                                vRP.setBankMoney(nuser_id, banconu - valorfatura)

                                                TriggerClientEvent("Notify", source, "sucesso", "<b>" .. identitynu.name .. " " .. identitynu.firstname .. "</b> pagou <b>$" .. valorfatura .. " dólares</b> pelo serviço.s")
                                                TriggerClientEvent("Notify", nplayer, "sucesso", "Você pagou <b>$" .. valorfatura .. " dólares</b> a <b>" .. identity.name .. " " .. identity.firstname .. "</b> pelo serviço.")

                                                vRPclient._stopAnim(source, false)
                                                vRPclient._DeletarObjeto(source)
                                            else
                                                TriggerClientEvent("Notify", source, "negado", "<b>" .. identitynu.name .. " " .. identitynu.firstname .. "</b> não tem dinheiro suficiente para o pagamento.")
                                                TriggerClientEvent("Notify", nplayer, "negado", "Saldo insuficiente.")
                                                vRPclient._stopAnim(source, false)
                                                vRPclient._DeletarObjeto(source)
                                            end
                                        else
                                            TriggerClientEvent("Notify", source, "negado", "O cliente não possuí cartão de débito para fazer o pagamento.")
                                            TriggerClientEvent("Notify", nplayer, "negado", "Você não tem um cartão de débito na mochila.")
                                        end
                                    else
                                        TriggerClientEvent("Notify", source, "negado", "<b>" .. identitynu.name .. " " .. identitynu.firstname .. "</b> negou o pagamento.")
                                        vRPclient._stopAnim(source, false)
                                        vRPclient._DeletarObjeto(source)
                                    end
                                else
                                    TriggerClientEvent("Notify", source, "negado", "Você precisa colocar o valor que deseja cobrar!")
                                    vRPclient._stopAnim(source, false)
                                    vRPclient._DeletarObjeto(source)
                                end
                            else
                                TriggerClientEvent("Notify", source, "negado", "Você não possuí uma maquina de cobranças em sua mochila.")
                            end
                        else
                            TriggerClientEvent("Notify", source, "negado", "Não há players por perto.")
                        end
                    elseif itemName == "colete" then
                        if vRP.tryGetInventoryItem(user_id, "colete", 1, true) then
                            vRPclient.setArmour(source, 100)
                            vClientINV.closeInventory(source)
                        end
                                elseif itemName == "repairkit" then
                                    if not vRPclient.isInVehicle(source) then
                                        local vehicle = vRPclient.getNearestVehicle(source, 3.5)
                                        if vehicle then
                                            if vRP.hasPermission(user_id, "mecanico.permissao") or vRP.hasPermission(user_id, "admin.permissao") then
                                                actived[user_id] = true
                                                vClientINV.closeInventory(source)
                                                TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
                                                TriggerClientEvent('cancelando', source, true)
                                                vRPclient._playAnim(source, false, {{"mini@repair", "fixing_a_player"}}, true)
                                                TriggerClientEvent("progress", source, 30000, "reparando veículo")
                                                SetTimeout(30000, function()
                                                    actived[user_id] = nil
                                                    TriggerClientEvent('cancelando', source, false)
                                                    TriggerClientEvent('reparar',-1,vehNet)
                                                    TriggerClientEvent('repararmotor', source, vehicle)
                                                    vRPclient._stopAnim(source, false)
                                                end)
                                            else
                                                if vRP.tryGetInventoryItem(user_id, "repairkit", 1, true) then
                                                    actived[user_id] = true
                                                    vClientINV.closeInventory(source)
                                                    TriggerClientEvent('cancelando', source, true)
                                                    vRPclient._playAnim(source, false, {{"mini@repair", "fixing_a_player"}}, true)
                                                    TriggerClientEvent("progress", source, 30000, "reparando veículo")
            
                                                    SetTimeout(30000, function()
                                                        actived[user_id] = nil
                                                        TriggerClientEvent('cancelando', source, false)
                                                        TriggerClientEvent('reparar',-1,vehNet)
                                                        TriggerClientEvent('repararmotor', source, vehicle)
                                                        vRPclient._stopAnim(source, false)
                                                    end)
                                                end
                                            end
                                        end
                                    end
                    elseif itemName == "paninho" then
                        if not vRPclient.isInVehicle(source) then
                            local vehicle = vRPclient.getNearestVehicle(source, 3.5)
                            if vehicle then
                                if vRP.tryGetInventoryItem(user_id, "paninho", 1, true) then
                                    vClientINV.closeInventory(source)
                                    actived[user_id] = true
                                    vClientINV.closeInventory(source)
                                    TriggerClientEvent('cancelando', source, true)

                                    TriggerClientEvent("emotes", source, "pano")

                                    TriggerClientEvent("progress", source, 10000, "limpando")

                                    SetTimeout(10000, function()
                                        actived[user_id] = nil
                                        TriggerClientEvent('cancelando', source, false)
                                        TriggerClientEvent('limpar', source)
                                        vRPclient._stopAnim(source, false)
                                        vRPclient._DeletarObjeto(src)
                                    end)
                                end
                            end
                        end
                    elseif itemName == "radio" then
                        if vRP.getInventoryItemAmount(user_id, "radio") >= 1 then
                            vClientINV.closeInventory(source)
                            TriggerClientEvent("vrp_radio:toggleNui",source,true)
                                TriggerClientEvent("Notify", source, "sucesso", "Você abriu o rádio, use apenas frequências conhecidas.", 8000)
                            end  
                        elseif itemName == "nameChange" then
                            local changeName = vRP.prompt(source,"Nome:", "")
                            local changeName2 = vRP.prompt(source,"Sobrenome:", "")
                            if not changeName then
                                return
                            end
                            if not changeName2 then
                                return
                            end
                            print(changeName, changeName2)
                            if vRP.tryGetInventoryItem(user_id,itemName,1,true,Slot) then
            					TriggerClientEvent("Notify",source,"sucesso","Passaporte atualizado.",5000)
                                TriggerClientEvent("Creative:Update",source,"updateMochila")
                                vRP.upgradeNames(user_id,changeName,changeName2)
                            end

                        elseif itemName == "plateChange" then
                            local changeplate = vRP.prompt(source,"Placa (8 Digitos):", "")
                            -- if digitos = digitos then
                            if not changeplate then
                                return
                            end

                            if vRP.tryGetInventoryItem(user_id,itemName,1,true,Slot) then
            					TriggerClientEvent("Notify",source,"sucesso","Placa atualizada (Reinicie seu game).",5000)
                                TriggerClientEvent("Creative:Update",source,"updateMochila")
                                print(user_id, changeplate)
                                vRP.upgradeRegistration(user_id,changeplate)
                            end
                        elseif itemName == "husky" then
                                if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
                                    vClientINV.closeInventory(source)
                                    TriggerClientEvent("dynamic:spawn",source,"Husky")
                                end
                            elseif itemName == "pug" then
                                if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
                                vClientINV.closeInventory(source)
                                TriggerClientEvent("dynamic:spawn",source,"Pug")
                                end
                           elseif itemName == "rottweiler" then
                                if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
                                vClientINV.closeInventory(source)
                                TriggerClientEvent("dynamic:spawn",source,"Rottweiler")
                                end
                            elseif itemName == "shepherd" then
                                if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
                                vClientINV.closeInventory(source)
                                TriggerClientEvent("dynamic:spawn",source,"Shepherd")
                                end
                            elseif itemName == "westy" then
                                if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
                                vClientINV.closeInventory(source)
                                TriggerClientEvent("dynamic:spawn",source,"Westy")
                                end
                            elseif itemName == "poodle" then
                                if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
                                vClientINV.closeInventory(source)
                                TriggerClientEvent("dynamic:spawn",source,"Poodle")
                                end
                            elseif itemName == "retriever" then
                                if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
                                vClientINV.closeInventory(source)
                                TriggerClientEvent("dynamic:spawn",source,"Retriever")
                                end
                        elseif itemName == "cat" then
                                if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
                                vClientINV.closeInventory(source)
                                TriggerClientEvent("dynamic:spawn",source,"Cat")
                                end
            elseif itemName == "lockpick" then
                local vehicle, vnetid, placa, vname, lock, banned, trunk, model, street = vRPclient.vehList(source, 2)
                local policia = vRP.getUsersByPermission("policia.permissao")
                if vehicle then
                    vRPclient._playAnim(source, false, {{"missfbi_s4mop", "clean_mop_back_player"}}, true)
                    if vRP.getInventoryItemAmount(user_id, "lockpick") >= 1 and vRP.tryGetInventoryItem(user_id, "lockpick", 1, true) then
                        vClientINV.closeInventory(source)
                        local taskBar = vTASKBAR.taskLockpick(source)
                        if taskBar then
                            actived[user_id] = true
                            TriggerClientEvent('cancelando', source, true)
                            vRPclient._playAnim(source, false, {{"missfbi_s4mop", "clean_mop_back_player"}}, true)
                            TriggerClientEvent("progress", source, 15000, "roubando")
                            SetTimeout(15000, function()
                                actived[user_id] = nil
                                TriggerClientEvent('cancelando', source, false)
                                vRPclient._stopAnim(source, false)
                                TriggerEvent("setPlateEveryone", placa)
                                vCLIENT.vehicleClientLock(-1,vnetid,2)
                                TriggerClientEvent("vrp_sound:source", source, 'lock', 0.5)
                                local policia = vRP.getUsersByPermission("policia.permissao")
                                local x, y, z = vRPclient.getPosition(source)
                                for k, v in pairs(policia) do
                                    local player = vRP.getUserSource(parseInt(v))
                                    if player then
                                        local data = { x = x, y = y, z = z, title = 'VEICULO', code = 'FURTO', veh = model }
                                        TriggerClientEvent('NotifyPush',player,data)
                                    end
                                end
                            end)
                        end
                     end
                else
                    TriggerClientEvent("vrpdoorsystem:forceOpen", source, itemName)
                end
                    elseif itemName == "capuz" then
                        if vRP.getInventoryItemAmount(user_id, "capuz") >= 1 then
                            vClientINV.closeInventory(source)
                            vClientINV.closeInventory(source)
                            local nplayer = vRPclient.getNearestPlayer(source, 2)
                            if nplayer then
                                vRPclient.setCapuz(nplayer)
                                vRP.closeMenu(nplayer)
                                TriggerClientEvent("Notify", source, "sucesso", "Capuz utilizado com sucesso.", 8000)
                            end
                        end
                    elseif itemName == "placa-clonada" then
                        if vRPclient.GetVehicleSeat(source) then
                            if vRP.tryGetInventoryItem(user_id, "placa-clonada", 1, true) then
                                vClientINV.closeInventory(source)
                                local taskBar = vTASKBAR.taskLockpick(source)
                                if taskBar then
                                    actived[user_id] = true
                                local placa = vRP.generatePlate()
                                vClientINV.closeInventory(source)
                                TriggerClientEvent('cancelando', source, true)
                                TriggerClientEvent("vehicleanchor", source)
                                TriggerClientEvent("progress", source, 10000, "clonando")

                                SetTimeout(10000, function()
                                    actived[user_id] = nil
                                    TriggerClientEvent('cancelando', source, false)
                                    TriggerClientEvent("cloneplates",source)
                                    vCLIENT.vehicleClientLock(-1,vnetid,2)
                                    -- vGARAGE.toggleLock(source, vnetid)
                                    TriggerClientEvent("Notify", source, "sucesso", "Placa clonada com sucesso.", 8000)
                                end)
                            end
                        end
                        else						
                            TriggerClientEvent("vrpdoorsystem:forceOpen",source,itemName)
                        end
                    elseif itemName == "energetico" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id, "energetico", 1, true) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            vClientINV.closeInventory(source)
                            vRPclient._CarregarObjeto(src, "amb@world_human_drinking@beer@male@idle_a", "idle_a", "prop_energy_drink", 49, 28422)
                            TriggerClientEvent("progress", source, 10000, "tomando")

                            SetTimeout(10500, function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source, false)
                                vRPclient._DeletarObjeto(src)
                                vRP.varyThirst(user_id,40)
                                vRP.varyHunger(user_id,20)
                                TriggerClientEvent('energeticos',source,true)
                                TriggerClientEvent("progress", source, 30000, "tomando")
                                SetTimeout(30000, function()
                                    TriggerClientEvent('energeticos',source,false)
                                    TriggerClientEvent("Notify", source, "aviso", "O efeito do energetico passou", 8000)
                                end)
                            end)
                        end
                    elseif itemName == "capuccino" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id, "capuccino", 1, true) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            vClientINV.closeInventory(source)
                            vRPclient._CarregarObjeto(src, "amb@world_human_drinking@beer@male@idle_a", "idle_a", "prop_fib_coffee", 49, 28422)
                            TriggerClientEvent("progress", source, 10000, "tomando")

                            SetTimeout(10500, function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source, false)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent('energeticos',source,true)
                                TriggerClientEvent("progress", source, 30000, "tomando")
                                SetTimeout(30000, function()
                                    TriggerClientEvent('energeticos',source,false)
                                    TriggerClientEvent("Notify", source, "aviso", "O efeito do energetico passou", 8000)
                                end)
                            end)
                        end
                    elseif itemName == "agua" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"agua",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_ld_flow_bottle",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-40)
                                vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Água</b>.")
                            end)
        
                        end 
                    elseif itemName == "pamonha" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"pamonha",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                        --	pacoca = { dict = "mp_player_inteat@burger", anim = "", prop = "bag_pacoca", flag = 49, bones = {60309}, pos = {0.1, 0.05, -0.09, 0.03, -100.0, 50.0}},
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"mp_player_inteat@burger","mp_player_int_eat_burger","bag_pamonhami",49,60309)
                            --vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","bag_pamonha",49,60309)
        
                            TriggerClientEvent("progress",source,10000,"Comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-40)
                                vRP.varyHunger(user_id,-50)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você Comeu uma  <b>Pamonha</b>.")
                            end)
        
                        end 
                    elseif itemName == "pacoca" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"pacoca",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                        --	pacoca = { dict = "mp_player_inteat@burger", anim = "", prop = "bag_pacoca", flag = 49, bones = {60309}, pos = {0.1, 0.05, -0.09, 0.03, -100.0, 50.0}},
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"mp_player_inteat@burger","mp_player_int_eat_burger","bag_pacoca2",49,60309)
                            --vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","bag_pamonha",49,60309)
        
                            TriggerClientEvent("progress",source,10000,"Comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-10)
                                vRP.varyHunger(user_id,-20)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você Comeu uma  <b>pacoca</b>.")
                            end)
        
                        end 
                    elseif itemName == "macadoamor" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"macadoamor",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                        --	pacoca = { dict = "mp_player_inteat@burger", anim = "", prop = "bag_pacoca", flag = 49, bones = {60309}, pos = {0.1, 0.05, -0.09, 0.03, -100.0, 50.0}},
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"mp_player_inteat@burger","mp_player_int_eat_burger","bag_macami",49,60309)
        
                    --		vRPclient._CarregarObjeto(src,"mp_player_inteat@burger","mp_player_int_eat_burger","bag_maca",49,60309)
                            --vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","bag_pamonha",49,60309)
        
                            TriggerClientEvent("progress",source,10000,"Comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-10)
                                vRP.varyHunger(user_id,-20)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você Comeu uma  <b>maca</b>.")
                            end)
        
                        end 
                    elseif itemName == "milhoverde" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"milhoverde",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"mp_player_inteat@burger","mp_player_int_eat_burger","bag_milho",49,60309)
        
                            TriggerClientEvent("progress",source,10000,"Comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-10)
                                vRP.varyHunger(user_id,-20)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você Comeu um  <b>Milho</b>.")
                            end)
        
                        end 
                    elseif itemName == "lean-alta" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,itemName,1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            --vRPclient._playAnim(source,false,{{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"}},true)
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                TriggerClientEvent("setMeth",source)
                                --vRP.varyThirst(user_id,-40)
                                --vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                
                            --	TriggerClientEvent("Notify",source,"sucesso","Você Fumou um <b>Do bom</b>.")
                            end)
        
                        end
                    elseif itemName == "coca-alta" or itemName == "meta-alta" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,itemName,1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            --vRPclient._playAnim(source,false,{{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"}},true)
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._playAnim(source,false,{{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"}},49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                TriggerClientEvent("setMeth",source)
                                --vRP.varyThirst(user_id,-40)
                                --vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                
                            --	TriggerClientEvent("Notify",source,"sucesso","Você Fumou um <b>Do bom</b>.")
                            end)
        
                        end
                    elseif itemName == "baseado" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"baseado",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            --vRPclient._playAnim(source,false,{{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"}},true)
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(source,"amb@world_human_aa_smoke@male@idle_a","idle_c","prop_cs_ciggy_01",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                TriggerClientEvent("setMeth",source)
                                --vRP.varyThirst(user_id,-40)
                                --vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                
                                TriggerClientEvent("Notify",source,"sucesso","Você Fumou um <b>Do bom</b>.")
                            end)
        
                        end
                    elseif itemName == "leite" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"leite",1) then
                            vClientINV.closeInventory(source)

                            actived[user_id] = true
                            TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","v_serv_bs_mug",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")

                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-40)
                                vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                            end)

                        end
                    elseif itemName == "cafe" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"cafe",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_aa_coffee@idle_a","idle_a","prop_fib_coffee",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-40)
                                vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Café</b>.")
                            end)
        
                        end
                    elseif itemName == "cafecleite" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"cafecleite",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_aa_coffee@idle_a","idle_a","prop_fib_coffee",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-40)
                                vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Cafe com Leite</b>.")
                            end)
        
                        end
                    elseif itemName == "cafeexpresso" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"cafeexpresso",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_aa_coffee@idle_a","idle_a","prop_fib_coffee",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-40)
                                vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent('energeticos',source,true)
                                TriggerClientEvent('cancelando',source,false)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Cafe Expresso</b>.")
                            end)
                            SetTimeout(20000,function()
                                TriggerClientEvent('energeticos',source,false)
                                TriggerClientEvent("Notify",source,"sucesso","O efeito do cafeexpresso passou e o coração voltou a bater normalmente.",8000)
                            end)
        
                        end
                    elseif itemName == "capuccino" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"capuccino",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_aa_coffee@idle_a","idle_a","prop_fib_coffee",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-55)
                                vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Capuccino</b>.")
                            end)
        
                        end
                    elseif itemName == "frappuccino" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"frappuccino",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_aa_coffee@idle_a","idle_a","p_shk_starbucks_props",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-50)
                                vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Frappuccino</b>.")
                            end)
        
                        end
                    elseif itemName == "cha" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"cha",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_aa_coffee@idle_a","idle_a","prop_fib_coffee",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-50)
                                vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Chá</b>.")
                            end)
        
                        end
                    elseif itemName == "icecha" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"icecha",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-50)
                                vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Chá Gelado</b>.")
                            end)
        
                        end
                    elseif itemName == "sprunk" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"sprunk",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","ng_proc_sodacan_01b",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-50)
                                vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Sprunk</b>.")
                            end)
        
                        end
                    elseif itemName == "cola" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"cola",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","ng_proc_sodacan_01a",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-50)
                                vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Cola</b>.")
                            end)
        
                        end
                    elseif itemName == "energetico" then
                        if vRP.tryGetInventoryItem(user_id,"energetico",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('cancelando',source,true)
                            vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
                            TriggerClientEvent("progress",source,20000,"bebendo")
                            SetTimeout(20000,function()
                                actived[user_id] = nil
                                TriggerClientEvent('energeticos',source,true)
                                TriggerClientEvent('cancelando',source,false)
                                vRPclient._DeletarObjeto(source)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Energético</b>.",8000)
                            end)
                            SetTimeout(60000,function()
                                TriggerClientEvent('energeticos',source,false)
                                TriggerClientEvent("Notify",source,"aviso","O efeito do energético passou e o coração voltou a bater normalmente.",8000)
                            end)
                        end
                    elseif itemName == "whisky" then
                        if vRP.tryGetInventoryItem(user_id,"whisky",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('cancelando',source,true)
                            vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
                            TriggerClientEvent("progress",source,30000,"bebendo")
                            SetTimeout(30000,function()
                                actived[user_id] = nil
                                vRPclient.playScreenEffect(source,"RaceTurbo",180)
                                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                                TriggerClientEvent('cancelando',source,false)
                                vRPclient._DeletarObjeto(source)
                                TriggerClientEvent("Notify",source,"sucesso","whisky utilizada com sucesso.",8000)
                            end)
                        end
                    elseif itemName == "vinho1" then
                        if vRP.tryGetInventoryItem(user_id,"vinho1",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('cancelando',source,true)
                            vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_logopen",49,28422)
                            TriggerClientEvent("progress",source,30000,"bebendo")
                            SetTimeout(30000,function()
                                actived[user_id] = nil
                                vRPclient.playScreenEffect(source,"RaceTurbo",180)
                                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                                TriggerClientEvent('cancelando',source,false)
                                vRPclient._DeletarObjeto(source)
                                TriggerClientEvent("Notify",source,"sucesso","vinho utilizada com sucesso.",8000)
                            end)
                        end
                    elseif itemName == "vinho2" then
                        if vRP.tryGetInventoryItem(user_id,"vinho2",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('cancelando',source,true)
                            vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_blr",49,28422)
                            TriggerClientEvent("progress",source,30000,"bebendo")
                            SetTimeout(30000,function()
                                actived[user_id] = nil
                                vRPclient.playScreenEffect(source,"RaceTurbo",180)
                                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                                TriggerClientEvent('cancelando',source,false)
                                vRPclient._DeletarObjeto(source)
                                TriggerClientEvent("Notify",source,"sucesso","vinho2 utilizada com sucesso.",8000)
                            end)
                        end
                    elseif itemName == "patriot" then
                        if vRP.tryGetInventoryItem(user_id,"patriot",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('cancelando',source,true)
                            vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
                            TriggerClientEvent("progress",source,30000,"bebendo")
                            SetTimeout(30000,function()
                                actived[user_id] = nil
                                vRPclient.playScreenEffect(source,"RaceTurbo",180)
                                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                                TriggerClientEvent('cancelando',source,false)
                                vRPclient._DeletarObjeto(source)
                                TriggerClientEvent("Notify",source,"sucesso","Patriot utilizada com sucesso.",8000)
                            end)
                        end
                    elseif itemName == "pibwassen" then
                        if vRP.tryGetInventoryItem(user_id,"pibwassen",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('cancelando',source,true)
                            vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
                            TriggerClientEvent("progress",source,30000,"bebendo")
                            SetTimeout(30000,function()
                                actived[user_id] = nil
                                vRPclient.playScreenEffect(source,"RaceTurbo",180)
                                vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                                TriggerClientEvent('cancelando',source,false)
                                vRPclient._DeletarObjeto(source)
                                TriggerClientEvent("Notify",source,"sucesso","PibwasseP utilizada com sucesso.",8000)
                            end)
                        end
                    --------------------------------------------------------------------------------------------------------------------------------------------------
                    --[ COMIDAS ]-------------------------------------------------------------------------------------------------------------------------------------
                    --------------------------------------------------------------------------------------------------------------------------------------------------	
                    elseif itemName == "sanduiche" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"sanduiche",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent("emotes",source,"comer")
                            TriggerClientEvent("progress",source,10000,"comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-80)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>Sanduíche</b>.")
                            end)
        
                        end
                    elseif itemName == "rosquinha" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"rosquinha",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent("emotes",source,"comer3")
                            TriggerClientEvent("progress",source,10000,"comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-80)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>Rosquinha</b>.")
                            end)
                        end
                    elseif itemName == "hotdog" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"hotdog",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent("emotes",source,"comer2")
                            TriggerClientEvent("progress",source,10000,"comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-80)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>HotDog</b>.")
                            end)
        
                        end
                    elseif itemName == "xburguer" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"xburguer",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent("emotes",source,"comer")
                            TriggerClientEvent("progress",source,10000,"comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-80)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>xBurguer</b>.")
                            end)
        
                        end
                    elseif itemName == "chips" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"chips",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","ng_proc_food_chips01b",49,28422)
                            TriggerClientEvent("progress",source,10000,"comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-80)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>Batata Chips</b>.")
                            end)
        
                        end
                    elseif itemName == "batataf" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"batataf",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_food_bs_chips",49,28422)
                            TriggerClientEvent("progress",source,10000,"comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-80)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>Batata Frita</b>.")
                            end)
        
                        end
                    elseif itemName == "pizza" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"pizza",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,17)

                          --  vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","v_res_tt_pizzaplate",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-80)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>Pizza</b>.")
                            end)
        
                        end
                    elseif itemName == "frango" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"frango",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_food_cb_nugets",49,28422)
                            TriggerClientEvent("progress",source,10000,"comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-80)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>Frango Frito</b>.")
                            end)
        
                        end
                    elseif itemName == "bcereal" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"bcereal",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_choc_pq",49,28422)
                            TriggerClientEvent("progress",source,10000,"comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-80)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>Barra de Cereal</b>.")
                            end)
        
                        end
                    elseif itemName == "bchocolate" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"bchocolate",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_choc_meto",49,28422)
                            TriggerClientEvent("progress",source,10000,"comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-80)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>Barra de Chocolate</b>.")
                            end)
        
                        end
                    elseif itemName == "taco" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"taco",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,10000,"comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-80)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>Taco</b>.")
                            end)
        
                        end
                    elseif itemName == "coxinha" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"coxinha",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,3)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-40)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu uma <b>coxinha</b>.")
                            end)
                        end
                    elseif itemName == "trufa" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"trufa",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,2)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-20)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu uma <b>trufa</b>.")
                            end)
                        end
                    elseif itemName == "bolo1" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"bolo1",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,8)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-50)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>bolo</b>.")
                            end)
                        end
                    elseif itemName == "cupcake" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"cupcake",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,4)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-40)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>cupcake</b>.")
                            end)
                        end
                    elseif itemName == "palha" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"palha",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,14)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-40)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu uma <b>palha italiana</b>.")
                            end)
                        end
                    elseif itemName == "sorvete" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"sorvete",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,12)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-40)
                                vRP.varyHunger(user_id,-10)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou um <b>sorvete</b>.")
                            end)
                        end
                    elseif itemName == "pipoca" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"pipoca",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,19)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-20)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu uma <b>pipoca</b>.")
                            end)
                        end
                    elseif itemName == "picole" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"picole",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,20)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-30)
                                vRP.varyHunger(user_id,0)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>picole</b>.")
                            end)
                        end
                    elseif itemName == "esfirra" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"esfirra",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,21)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-50)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu uma <b>esfirra</b>.")
                            end)
                        end
                    elseif itemName == "torrada" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"torrada",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,26)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-50)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu uma <b>torrada</b>.")
                            end)
                        end
                    elseif itemName == "torta" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"torta",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,16)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-50)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu uma <b>torta</b>.")
                            end)
                        end
                    elseif itemName == "sucolaranja" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"sucolaranja",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,27)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,-50)
                                vRP.varyHunger(user_id,-10)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>sucolaranja</b>.")
                            end)
                        end
                    elseif itemName == "paoqueijo" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"paoqueijo",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,1)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-50)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu uma <b>pão queijo</b>.")
                            end)
                        end
                    elseif itemName == "paoalho" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"paoalho",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,9)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-50)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu uma <b>pão alho</b>.")
                            end)
                        end
                    elseif itemName == "espetinhocamarao" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"espetinhocamarao",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            TriggerClientEvent('ajnabakery:playAnim', source,23)
                        --	vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_taco_01",49,28422)
                            TriggerClientEvent("progress",source,4000,"comendo")
        
                            SetTimeout(4000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-50)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu uma <b>espetinho de camarão</b>.")
                            end)
                        end
                    elseif itemName == "yakisoba" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"yakisoba",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_cs_plate_01",49,28422)
                            TriggerClientEvent("progress",source,10000,"comendo")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                vRP.varyThirst(user_id,0)
                                vRP.varyHunger(user_id,-80)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você comeu um <b>Yakisoba</b>.")
                            end)
        
                        end
                    --------------------------------------------------------------------------------------------------------------------------------------------------
                    --[ REMÉDIOS ]------------------------------------------------------------------------------------------------------------------------------------
                    --------------------------------------------------------------------------------------------------------------------------------------------------	
                    elseif itemName == "xarelto" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"xarelto",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_cs_pills",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                TriggerClientEvent("remedios",source)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Xarelto</b>.")
                            end)
                        end
                    elseif itemName == "dipirona" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"dipirona",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_cs_pills",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                TriggerClientEvent("remedios",source)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Dipirona</b>.")
                            end)
                        end
                    elseif itemName == "nebacetin" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"nebacetin",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_cs_pills",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                TriggerClientEvent("remedios",source)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Nebacetin</b>.")
                            end)
                        end
                    elseif itemName == "hirudoid" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"hirudoid",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_cs_pills",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                TriggerClientEvent("remedios",source)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Hirudoid</b>.")
                            end)
                        end
                    elseif itemName == "tandrilax" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"tandrilax",1) then
                            vClientINV.closeInventory(source)
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_cs_pills",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                TriggerClientEvent("tandrilax",source)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Tandrilax</b>.")
                            end)
                        end
                    elseif itemName == "dorflex" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"dorflex",1) then
                            vClientINV.closeInventory(source)
        
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(src,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_cs_pills",49,28422)
                            TriggerClientEvent("progress",source,10000,"tomando")
        
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                TriggerClientEvent("remedios",source)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você tomou <b>Dorflex</b>.")
                            end)
                        end
                    elseif itemName == "kitmedico" then
                        local src = source
                        if vRP.tryGetInventoryItem(user_id,"kitmedico",1) then
                            vClientINV.closeInventory(source)
            
                            actived[user_id] = true
                            TriggerClientEvent('Creative:Update',source,'updateMochila')
                            vRPclient._CarregarObjeto(source,"amb@world_human_clipboard@male@idle_a","idle_c","v_ret_ta_firstaid",49,60309)
                            TriggerClientEvent("progress",source,10000,"utilizando")
            
                            SetTimeout(10000,function()
                                actived[user_id] = nil
                                vRPclient._stopAnim(source,false)
                                TriggerClientEvent("remedios2",source)
                                vRPclient._DeletarObjeto(src)
                                TriggerClientEvent("Notify",source,"sucesso","Você utilizou <b>Kit Médico</b>.")
                            end)
                        end
                        elseif itemName == "suspensaoar" then
                            TriggerClientEvent('zo_install_suspe_ar', source)
                            vClientINV.closeInventory(source)
                            TriggerClientEvent("Notify",source,"sucesso","<b>Kit Suspensão a ar</b> Pré-Instalado.",8000)
                        elseif itemName == "moduloneon" then
                            TriggerClientEvent('zo_install_mod_neon', source)
                            vClientINV.closeInventory(source)
                        elseif itemName == "moduloxenon" then
                            TriggerClientEvent('zo_install_mod_xenon', source)
                            vClientINV.closeInventory(source)
                        end
                    end

					if itemName == "garrafa-vazia" then
						local status,style = vCLIENT.checkFountain(source)
                        vClientINV.closeInventory(source)
						if status then
							vRPclient.stopActived(source)
							vCLIENT.blockButtons(source,true)

							if style == "fountain" then
								vClientINV.closeInventory(source)
								vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							elseif style == "floor" then
								vClientINV.closeInventory(source)
								vRPclient._playAnim(source,false,{{"amb@world_human_bum_wash@male@high@base","base"}},true)
							end

							active[user_id] = parseInt(rAmount*3)

							TriggerClientEvent("progress", source, 3000, "tomando")

							repeat
								if active[user_id] == 0 then
									active[user_id] = nil
									vRPclient._DeletarObjeto(source)
									vCLIENT.blockButtons(source,false)

                                    if vRP.computeInvWeight(nuser_id) + vRP.getItemWeight(itemName) * parseInt(amount) <= vRP.getInventoryMaxWeight(nuser_id) then
										if vRP.tryGetInventoryItem(user_id,itemName,parseInt(rAmount),true,slot) then
                                            vRPclient._stopAnim(source, false)
											if style == "floor" then
												vRP.giveInventoryItem(user_id,"agua",parseInt(rAmount),true)
											else
												vRP.giveInventoryItem(user_id,"agua",parseInt(rAmount),true)
											end
										end
									end
								end
								Citizen.Wait(0)
							until active[user_id] == nil
						end
					end
                    
                if vRP.itemTypeList(itemName) == "equip" then
                    if vRP.tryGetInventoryItem(user_id,itemName,1) then
                        local weapons = {}
                        local identity = vRP.getUserIdentity(user_id)
                        local nameweapon = itemName
                        weapons[itemName] = { ammo = 0 }
                        vRPclient._giveWeapons(source,weapons)
        
                        TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
                    end
                end

                if vRP.itemTypeList(itemName) == "pqd" then
                    if vRP.tryGetInventoryItem(user_id,itemName,1) then
                        vCLIENT.parachuteColors(source)
        
                        TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
                    end
                end

                if vRP.itemTypeList(itemName) == "recharge" then

                    local uweapons = vRPclient.getWeapons(source)
                    local identity = vRP.getUserIdentity(user_id)
                    
                    for k,v in pairs(config.weapon_ammos) do
                        if k == itemName then
                            for m,n in pairs(v) do
                                if uweapons[n] then
                                    local itemAmount = 0
                                    local data = vRP.getUserDataTable(user_id)
                                    if vRP.tryGetInventoryItem(user_id, itemName, rAmount) then
                                        local weapons = {}
                                        weapons[n] = { ammo = rAmount }
                                        itemAmount = rAmount
                                        vRPclient._giveWeapons(source,weapons,false)
                                        
                                        TriggerClientEvent('vrp_inventory:Update',source,'updateMochila')
                                    end
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

-------------------------------------------------------------------------
RegisterCommand('limparinv',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id, "geral.permissao") then
			if args[1] then
				local nuser_id = parseInt(args[1])
				local myInv = vRP.getInventory(nuser_id)
				for k,v in pairs(myInv) do
					vRP.tryGetInventoryItem(nuser_id, v.item, parseInt(v.amount))
				end
			else
				local myInv = vRP.getInventory(user_id)
				for k,v in pairs(myInv) do
					vRP.tryGetInventoryItem(user_id, v.item, parseInt(v.amount))
				end
			end
		end
	end
end)

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- APREENDER
-- -----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('apreender',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "apreender.permissao") then
		local user_id = vRP.getUserId(source)
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			local identity = vRP.getUserIdentity(user_id)
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local nidentity = vRP.getUserIdentity(nuser_id)
				local itens_apreendidos = {}
				local weapons = vRPclient.replaceWeapons(nplayer,{})
				for k,v in pairs(weapons) do
					if v.ammo > 0 then
					end
				end
				local inv = vRP.getInventory(nuser_id)
				for k,v in pairs(config.itemlist) do
					local sub_items = { v }
					if string.sub(v,1,1) == "*" then
						local idname = string.sub(v,2)
						sub_items = {}
						for fidname,_ in pairs(inv) do
							if splitString(fidname,"")[1] == idname then
								table.insert(sub_items,fidname)
							end
						end
					end
					for _,idname in pairs(sub_items) do
						local amount = vRP.getInventoryItemAmount(nuser_id,idname)
						if amount > 0 then
							local item_name,item_weight = vRP.getItemWeight(idname)
							if item_name then
								if vRP.tryGetInventoryItem(nuser_id,idname,amount,true) then
									table.insert(itens_apreendidos, "[ITEM]: "..vRP.itemNameList(idname).." [QUANTIDADE]: "..amount)
								end
							end
						end
					end
				end
				local apreendidos = table.concat(itens_apreendidos, "\n")
				SendWebhookMessage(webh.apreendidos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[APREENDEU DE]:  "..nuser_id.." "..nidentity.name.." "..nidentity.firstname.."\n" .. apreendidos ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				TriggerClientEvent("Notify",nplayer,"importante","Todos os seus pertences foram apreendidos.")
				TriggerClientEvent("Notify",source,"importante","Apreendeu todos os pertences da pessoa.")
			end
		end
	end
end)