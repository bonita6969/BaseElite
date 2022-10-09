--[ WEBHOOK ]-----------------------------------------------------------------------------------------------------------------

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPERM
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.requestPermShops(shopType)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.wantedReturn(user_id) then
			return false
		end

		if shops.list[shopType]["perm"] ~= nil then
			if not vRP.hasPermission(user_id,shops.list[shopType]["perm"]) then
				return false
			end
		end
		
		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.requestShop(name)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local inventoryShop = {}
		for k,v in pairs(shops.list[name]["list"]) do
			if shops.list[name]["type"] == "CoinsCar" or shops.list[name]["type"] == "CoinsGroup" then
				table.insert(inventoryShop,{ price = parseInt(v), name = k, index = k, key = k, weight = 0.0 })
			else
				table.insert(inventoryShop,{ price = parseInt(v), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, weight = vRP.getItemWeight(k) })
			end
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
		return inventoryShop,inventoryUser,vRP.computeInvWeight(user_id),vRP.getInventoryMaxWeight(user_id),{ identity.name.." "..identity.firstname,parseInt(user_id),vRP.getBankMoney(user_id),vRP.getCoins(user_id),identity.phone,identity.registration }
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- GETSHOPTYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.getShopType(name)
    return shops.list[name].mode
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.functionShops(shopType,shopItem,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end
		local inv = vRP.getInventory(user_id)
		if inv then
			if shops.list[shopType]["mode"] == "Buy" then
					if shops.list[shopType]["type"] == "CoinsCar" then
					if shops.list[shopType]["list"][shopItem] then
						local get_veh = vRP.query("creative/get_vehicles", { user_id = parseInt(user_id), vehicle = shopItem})
						-- local get_veh = vRP.query("creative/get_vehicle", {user_id = user_id, vehicle = shopItem})
						-- vRP.query("creative/get_vehicles",{ user_id = parseInt(user_id), vehicle = name })
						if #get_veh <= 0 then
							if vRP.tryCoins(user_id,parseInt(shops.list[shopType]["list"][shopItem])) then
								TriggerClientEvent("Notify",source,"sucesso","Veiculo comprado com sucesso.",5000)
								vRP.execute("creative/add_vehicle", {user_id = user_id, vehicle = shopItem, ipva = parseInt(os.time())})
								SendWebhookMessage(webh.webvip,"```prolog\n[JOGADOR]: » "..user_id.."\n[VEICULO]: "..shopItem.." [COINS]:"..parseInt(shops.list[shopType]["list"][shopItem])..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							else
								TriggerClientEvent("Notify",source,"negado","Coins insuficientes.",5000)
							end
						else
							TriggerClientEvent("Notify",source,"negado","Você ja tem um veiculo desse em sua garagem",5000)
						end
					end
				elseif shops.list[shopType]["type"] == "CoinsGroup" then
					if shops.list[shopType]["list"][shopItem] then
						if not vRP.hasGroup(user_id,shopItem) then
							if vRP.tryCoins(user_id,parseInt(shops.list[shopType]["list"][shopItem])) then
								vRP.addUserGroup(user_id,shopItem)
								SendWebhookMessage(webh.webvip,"```prolog\n[JOGADOR]: » "..user_id.."\n[VIP]: "..shopItem.." [COINS]:"..parseInt(shops.list[shopType]["list"][shopItem])..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								TriggerClientEvent("Notify",source,"sucesso","Vip comprado com sucesso.",5000)
							else
								TriggerClientEvent("Notify",source,"negado","Coins insuficientes.",5000)
							end
						else
							TriggerClientEvent("Notify",source,"negado","Você ja possui esse vip",5000)
						end
					end
				else
					if vRP.computeInvWeight(parseInt(user_id)) + vRP.getItemWeight(shopItem) * parseInt(shopAmount) <= vRP.getInventoryMaxWeight(user_id) then
						if shops.list[shopType]["type"] == "Cash" then
							if shops.list[shopType]["list"][shopItem] then
								if vRP.tryPayment(user_id,parseInt(shops.list[shopType]["list"][shopItem]*shopAmount)) then
									if inv[tostring(slot)] then
										if shopItem == "colete" then
											vRPclient.setArmour(source, 100)
										else
											TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
											vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false)
										end
									else
										if shopItem == "colete" then
											vRPclient.setArmour(source, 100)
										else
											TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
											vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false,slot)
										end
									end							
								else
									TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",5000)
								end
							end
						elseif shops.list[shopType]["type"] == "BlackCash" then
							if shops.list[shopType]["list"][shopItem] then
								
								if vRP.tryGetInventoryItem(user_id,'dinheiro-sujo',parseInt(shops.list[shopType]["list"][shopItem]*shopAmount),false) then
									if inv[tostring(slot)] then
										TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
										vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false)
									else
										TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
										vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false,slot)
									end							
								else
									TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",5000)
								end
							end
						elseif shops.list[shopType]["type"] == "CoinsItem" then
							if shops.list[shopType]["list"][shopItem] then
								if vRP.tryCoins(user_id,parseInt(shops.list[shopType]["list"][shopItem]*shopAmount)) then
									if inv[tostring(slot)] then
										TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
										vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false)
									else
										TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
										vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false,slot)
									end							
								else
									TriggerClientEvent("Notify",source,"negado","Coins insuficiente.",5000)
								end
							end
						end
					else
						TriggerClientEvent("Notify",source,"negado","Mochila cheia.",5000)
					end
				end
			elseif shops.list[shopType]["mode"] == "Sell" then
				if shops.list[shopType]["list"][shopItem] then
					if shops.list[shopType]["type"] == "Cash" then
						if vRP.tryGetInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),true,slot) then	
							TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
							vRP.giveInventoryItem(parseInt(user_id),"dinheiro",parseInt(shops.list[shopType]["list"][shopItem]*shopAmount),true)
							TriggerClientEvent("Notify",source,"aviso","Voce recebeu $"..shops.list[shopType]["list"][shopItem]*shopAmount.." dolares.",5000)
						end
					elseif shops.list[shopType]["type"] == "BlackCash" then
						if vRP.tryGetInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),true,slot) then	
							TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
							vRP.giveInventoryItem(parseInt(user_id),"dinheiro-sujo",parseInt(shops.list[shopType]["list"][shopItem]*shopAmount),true)
							TriggerClientEvent("Notify",source,"aviso","Voce recebeu $"..shops.list[shopType]["list"][shopItem]*shopAmount.." dolares.",5000)
						end
					end
				end
			end
		end

		TriggerClientEvent("vrp_shops:Update",source,"requestShop")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_shops:populateSlot")
AddEventHandler("vrp_shops:populateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
			TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
			vRP.giveInventoryItem(user_id,itemName,amount,false,target)
			TriggerClientEvent("vrp_shops:Update",source,"requestShop")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_shops:updateSlot")
AddEventHandler("vrp_shops:updateSlot",function(itemName,slot,target,amount)
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

		TriggerClientEvent("vrp_shops:Update",source,"requestShop")
	end
end)
