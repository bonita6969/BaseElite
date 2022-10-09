-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPERM
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.requestPermCraft(craftType)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.wantedReturn(user_id) then
			return false
		end
		if craft.list[craftType]["perm"] ~= nil then
			if not vRP.hasPermission(user_id,craft.list[craftType]["perm"]) then
				return false
			end
		end
		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.requestCrafting(craftType)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local inventoryShop = {}
		for k,v in pairs(craft.list[craftType]["list"]) do
			local craftList = {}

			for k,v in pairs(v.require) do
				table.insert(craftList,{ name = vRP.itemNameList(k), amount = v })
			end

			table.insert(inventoryShop,{ name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, weight = vRP.getItemWeight(k), list = craftList })
		end

		local inventoryUser = {}
		local inv = vRP.getInventory(user_id)
		if inv then
			for k,v in pairs(inv) do
				v.amount = parseInt(v.amount)
				v.name = vRP.itemNameList(v.item)
				v.peso = vRP.getItemWeight(v.item)
				v.index = vRP.itemIndexList(v.item)
				v.key = v.item
				v.slot = k

				inventoryUser[k] = v
			end
		end  

		local identity = vRP.getUserIdentity(user_id)
		local emp = vRP.getUserGroupByType(user_id,"job")
		emp = vRP.getGroupTitle(emp)
		if emp == "" or emp == nil then
			emp = "Civil"
		end
		return inventoryShop,inventoryUser,vRP.computeInvWeight(user_id),vRP.getInventoryMaxWeight(user_id),{ identity.name.." "..identity.firstname,parseInt(user_id),parseInt(identity.bank),emp,identity.phone,identity.registration }
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.functionCrafting(shopItem,shopType,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end
		if craft.list[shopType]['skillbar'] == true or craft.list[shopType]['notfast'] == true then shopAmount = 1 end

		if craft.list[shopType]["list"][shopItem] then
			for k,v in pairs(craft.list[shopType]["list"][shopItem]["require"]) do
				if vRP.getInventoryItemAmount(user_id,k) < parseInt(v*shopAmount) then
					return
				end
				Citizen.Wait(1)
			end
			if craft.list[shopType]['skillbar'] == true then
				TriggerClientEvent('fecharnuicrafting', source, true)
				vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_ped"}},true)
				local taskBar = vTASKBAR.taskOne(source,2)
				if not taskBar then
					vRPclient._stopAnim(source,false)
					return
				end
			end
			if vRP.getItemWeight(shopItem)*craft.list[shopType]["list"][shopItem]["amount"]*shopAmount + vRP.getInventoryWeight(user_id) < vRP.getInventoryMaxWeight(user_id) then
				for k,v in pairs(craft.list[shopType]["list"][shopItem]["require"]) do
					vRP.removeInventoryItem(user_id,k,parseInt(v*shopAmount))
					Citizen.Wait(1)
				end
				if craft.list[shopType]['notfast'] == true then
					TriggerClientEvent('fecharnuicrafting', source, false)
					vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_ped"}},true)
					TriggerClientEvent("progress", source, 2000, "tomando")
					SetTimeout(2000,function()
						vRPclient._stopAnim(source,false)
						TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
						vRP.giveInventoryItem(user_id,shopItem,craft.list[shopType]["list"][shopItem]["amount"]*shopAmount,true,slot)
					end)
				else
					vRPclient._stopAnim(source,false)
					TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
					vRP.giveInventoryItem(user_id,shopItem,craft.list[shopType]["list"][shopItem]["amount"]*shopAmount,true,slot)
				end
			else
				TriggerClientEvent('fecharnuicrafting', source, true)
			end
		end
		vCLIENT.updateCrafting(source,"requestCrafting")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONDESTROY
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.functionDestroy(shopItem,shopType,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end
		
		if craft.list[shopType]["list"][shopItem] then
			if craft.list[shopType]["list"][shopItem]["destroy"] then
				if vRP.tryGetInventoryItem(user_id,shopItem,craft.list[shopType]["list"][shopItem]["amount"]) then
					for k,v in pairs(craft.list[shopType]["list"][shopItem]["require"]) do
						if parseInt(v) <= 1 then
							TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
							vRP.giveInventoryItem(user_id,k,1)
						else
							TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
							vRP.giveInventoryItem(user_id,k,v/2)
						end
						Citizen.Wait(1)
					end
				end
			end
		end
		vCLIENT.updateCrafting(source,"requestCrafting")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_crafting:populateSlot")
AddEventHandler("vrp_crafting:populateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end
		if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
			TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
			vRP.giveInventoryItem(user_id,itemName,amount,false,target)
			vCLIENT.updateCrafting(source,"requestCrafting")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_crafting:updateSlot")
AddEventHandler("vrp_crafting:updateSlot",function(itemName,slot,target,amount)
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
		vCLIENT.updateCrafting(source,"requestCrafting")
	end
end)
