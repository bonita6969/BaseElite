-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local opened = {}
local saqueada = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REVISTAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("revistar",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local nplayer = vRPclient.getNearestPlayer(source,5)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			if checkpolice(nuser_id) then

				if vRP.hasPermission(user_id,config.revistar) or vRP.hasPermission(user_id,config.revistar_adm) then
					vRPclient._playAnim(source,true,{{"oddjobs@shop_robbery@rob_till","loop"}},true)
					vRPclient._playAnim(nplayer,true,{{"random@arrests@busted","idle_a"}},true)
					vCLIENT.toggleCarry(nplayer,source)
					saqueada[user_id] = false
					opened[user_id] = parseInt(nuser_id)
					garmasrevistar(nplayer,nuser_id)
					TriggerClientEvent('cancelando',nplayer,true)
					TriggerClientEvent('notinv',nplayer,true)

					vCLIENT.openInspect(source)
					vCLIENT.ungun(nplayer)
				else
					if vRPclient.getHealth(nplayer) > 101 then
						local request = vRP.request(nplayer,"Você está sendo revistado, você permite?",60)
						if request then
							vRPclient._playAnim(source,true,{{"oddjobs@shop_robbery@rob_till","loop"}},true)
							vRPclient._playAnim(nplayer,true,{{"random@arrests@busted","idle_a"}},true)
							garmasrevistar(nplayer,nuser_id)
							vCLIENT.toggleCarry(nplayer,source)

							TriggerClientEvent('cancelando',nplayer,true)
							TriggerClientEvent('notinv',nplayer,true)
							opened[user_id] = parseInt(nuser_id)

							saqueada[user_id] = false
							vCLIENT.openInspect(source)
							vCLIENT.ungun(nplayer)
						else
							TriggerClientEvent("Notify",source,"negado","Pedido de revista recusado.",5000)
						end
					else
						garmasrevistar(nplayer,nuser_id)
						vRPclient._playAnim(nplayer,true,{"random@arrests@busted","idle_a"},true)
						opened[user_id] = parseInt(nuser_id)


						saqueada[user_id] = true
						vCLIENT.openInspect(source)
						vCLIENT.ungun(nplayer)
					end
				end
			else
				TriggerClientEvent("Notify",source,"negado","Você não pode revistar um policial!",5000)
			end
		end
	end
end)
RegisterCommand("revistarm",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local nplayer = vRPclient.getNearestPlayer(source,5)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			if checkpolice(nuser_id) then

				if vRP.hasPermission(user_id,config.revistar) or vRP.hasPermission(user_id,config.revistar_adm) then
					vRPclient._CarregarObjeto(nplayer,"anim@heists@box_carry@","idle","hei_prop_heist_box",50,28422)
					vRPclient._playAnim(source,true,{{"anim@heists@ornate_bank@grab_cash_heels","grab"}},true)
					vCLIENT.toggleCarry(nplayer,source)
					saqueada[user_id] = false
					opened[user_id] = parseInt(nuser_id)
					garmasrevistar(nplayer,nuser_id)
					TriggerClientEvent('cancelando',nplayer,true)
					TriggerClientEvent('notinv',nplayer,true)

					vCLIENT.openInspect(source)
					vCLIENT.ungun(nplayer)
				else
					if vRPclient.getHealth(nplayer) > 101 then
						local request = vRP.request(nplayer,"Você está sendo revistado, você permite?",60)
						if request then
							vRPclient._CarregarObjeto(nplayer,"anim@heists@box_carry@","idle","hei_prop_heist_box",50,28422)
							vRPclient._playAnim(source,true,{{"anim@heists@ornate_bank@grab_cash_heels","grab"}},true)
							garmasrevistar(nplayer,nuser_id)
							-- vRPclient._playAnim(nplayer,true,{"random@arrests@busted","idle_a"},true)
							vCLIENT.toggleCarry(nplayer,source)

							TriggerClientEvent('cancelando',nplayer,true)
							TriggerClientEvent('notinv',nplayer,true)
							opened[user_id] = parseInt(nuser_id)

							saqueada[user_id] = false
							vCLIENT.openInspect(source)
							vCLIENT.ungun(nplayer)
						else
							TriggerClientEvent("Notify",source,"negado","Pedido de revista recusado.",5000)
						end
					else
						garmasrevistar(nplayer,nuser_id)
						vRPclient._playAnim(nplayer,true,{"random@arrests@busted","idle_a"},true)
						opened[user_id] = parseInt(nuser_id)


						saqueada[user_id] = true
						vCLIENT.openInspect(source)
						vCLIENT.ungun(nplayer)
					end
				end
			else
				TriggerClientEvent("Notify",source,"negado","Você não pode revistar um policial!",5000)
			end
		end
	end
end)

function garmasrevistar(source1,user_id)
	if user_id then
	local weapons = vRPclient.replaceWeapons(source1,{})
	for k,v in pairs(weapons) do
		if vRP.itemIndexList(k) ~= nil then
	    	vRP.giveInventoryItem(user_id,k,1)
	    end
	    if v.ammo > 0 then
	        for m,n in pairs(config.weapon_ammos) do
	            for t,j in pairs(n) do
	                if j == k then
	                    munni = m
	                    break
	                end
	            end
	        end

		    if vRP.itemIndexList(munni) ~= nil then
		    	vRP.giveInventoryItem(user_id,munni,v.ammo)
		    end
	      
	    end
	end
	end
end

function checkpolice(nuser_id)
	if vRP.hasPermission(nuser_id,config.policia_nrevist) then
		return false
	end
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.openInspectChest()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then

		if opened[user_id] ~= nil then

			local ninventory = {}
			local myInv = vRP.getInventory(user_id)
			for k,v in pairs(myInv) do

				v.amount = parseInt(v.amount)
				v.name = vRP.itemNameList(v.item)
				v.peso = vRP.getItemWeight(v.item)
				v.index = vRP.itemIndexList(v.item)
				v.key = v.item
				v.slot = k

				ninventory[k] = v
			end

			local uinventory = {}
			local othInv = vRP.getInventory(opened[user_id])
			for k,v in pairs(othInv) do

				v.amount = parseInt(v.amount)
				v.name = vRP.itemNameList(v.item)
				v.peso = vRP.getItemWeight(v.item)
				v.index = vRP.itemIndexList(v.item)
				v.key = v.item
				v.slot = k

				uinventory[k] = v
			end
			
			local emp = vRP.getUserGroupByType(user_id,"job")
			emp = vRP.getGroupTitle(emp)
			if emp == "" or emp == nil then
				emp = "Civil"
			end

			local identity = vRP.getUserIdentity(user_id)
			return ninventory,uinventory,vRP.computeInvWeight(user_id),vRP.getInventoryMaxWeight(user_id),vRP.computeInvWeight(opened[user_id]),vRP.getInventoryMaxWeight(opened[user_id]),{ identity.name.." "..identity.firstname,user_id,parseInt(identity.bank),emp,identity.phone,identity.registration }
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inspect:populateSlot")
AddEventHandler("vrp_inspect:populateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
			vRP.giveInventoryItem(user_id,itemName,amount,false,target)
			TriggerClientEvent("vrp_inspect:Update",source,"updateInspect")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inspect:updateSlot")
AddEventHandler("vrp_inspect:updateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		local inv = vRP.getInventory(user_id)
		if inv then
			if inv[tostring(slot)] and inv[tostring(target)] and inv[tostring(slot)].item == inv[tostring(target)].item then
				if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
					vRP.giveInventoryItem(user_id,itemName,amount,false,target)
				end
			else
				vRP.swapSlot(user_id,slot,target)
			end
		end

		TriggerClientEvent("vrp_inspect:Update",source,"updateInspect")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SUMSLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inspect:sumSlot")
AddEventHandler("vrp_inspect:sumSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local inv = vRP.getInventory(user_id)
		if inv then
			if inv[tostring(target)] and inv[tostring(target)].item == itemName then
				if vRP.tryGetInventoryItem(opened[user_id],itemName,amount,false,slot) then
					vRP.giveInventoryItem(user_id,itemName,amount,false,target)
					TriggerClientEvent("vrp_inspect:Update",source,"updateInspect")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SUM2SLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inspect:sum2Slot")
AddEventHandler("vrp_inspect:sum2Slot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local inv = vRP.getInventory(opened[user_id])
		if inv[tostring(target)] and inv[tostring(target)].item == item then
			if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
				vRP.giveInventoryItem(opened[user_id],itemName,amount,false,target)
				TriggerClientEvent("vrp_inspect:Update",source,"updateInspect")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.takeItem(itemName,slot,amount,target)
	local source = source
	if itemName then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local identity2 = vRP.getUserIdentity(opened[user_id])
		if user_id then
			if vRP.computeInvWeight(user_id) + vRP.getItemWeight(itemName) * parseInt(amount) <= vRP.getInventoryMaxWeight(user_id) then
				if vRP.tryGetInventoryItem(opened[user_id],itemName,amount,true,slot) then
					vRP.giveInventoryItem(user_id,itemName,amount,false,target)
					SendWebhookMessage(webh.revistar,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Pegou]: "..itemName.." \n Quantidade: "..amount..'\n [Do Cidadão]: \nID '..opened[user_id]..": "..identity2.name..', '..identity2.firstname..'\n'..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
					TriggerClientEvent("vrp_inspect:Update",source,"updateInspect")
				end
			else
				TriggerClientEvent("Notify",source,"negado","Mochila cheia.",5000)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESETINSPECT
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.resetInspect()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local nplayer = vRPclient.getNearestPlayer(source,5)
		if nplayer then
			TriggerClientEvent('cancelando',nplayer,false)
			TriggerClientEvent('notinv',nplayer,false)
			if not saqueada[user_id] then
				vCLIENT.toggleCarry(nplayer,source)
				vRPclient._stopAnim(nplayer,false)
			end
		end

		if opened[user_id] ~= nil then
			opened[user_id] = nil
		end

		if saqueada[user_id] ~= nil then
			saqueada[user_id] = nil
		end
		vRPclient._stopAnim(source,false)
	end
end

