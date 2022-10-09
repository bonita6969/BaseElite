-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local chestOpen = {}
local antichestdump = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATE CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('createChest',function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id and vRP.hasPermission(user_id,"manager.permissao") then
		local x,y,z = vRPclient.getPosition(source)

		local nome = vRP.prompt(source,"Nome do chest?","")
		if nome == "" then
			return
		end

		local perm = vRP.prompt(source,"Permissao do chest?","")
		if perm == "" then
			return
		end

		local tamanho = vRP.prompt(source,"Tamanho do chest?","")
		if tamanho == "" then
			return
		end

		vCLIENT.insertTable(-1,nome, { x,y,z } )
		vRP.execute("vRP/addChest", { permiss = perm, name = nome, x = x, y = y, z = z, weight = tamanho })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKINTPERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.checkIntChestPermissions(chestName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,chestc.list[chestName]['perm']) then
			chestOpen[user_id] = chestName
			return true
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.chestClose()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if chestOpen[user_id] then
			antichestdump[chestOpen[user_id]] = false
			chestOpen[user_id] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERLEAVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerLeave",function(user_id,source)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if antichestdump[chestOpen[user_id]] then
			antichestdump[chestOpen[user_id]] = false
		end
		if chestOpen[user_id] then
			chestOpen[user_id] = nil
		end
	end
end)
----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.checkchestdump(k)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not antichestdump[k] then
			antichestdump[k] = true
			return true
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.openChest()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local myinventory = {}
		local mychestopen = {}
		local mychestname = chestOpen[parseInt(user_id)]
		if mychestname ~= nil then
			local inv = vRP.getInventory(parseInt(user_id))
			if inv then
				for k,v in pairs(inv) do

					v.amount = parseInt(v.amount)
					v.name = vRP.itemNameList(v.item)
					v.peso = vRP.getItemWeight(v.item)
					v.index = vRP.itemIndexList(v.item)
					v.key = v.item
					v.slot = k

					myinventory[k] = v
				end
			end

			local data = vRP.getSData("chest:"..mychestname)
			local sdata = json.decode(data) or {}
			if data then
				for k,v in pairs(sdata) do
					table.insert(mychestopen,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
				end
			end
			return myinventory,mychestopen,vRP.computeInvWeight(user_id),vRP.getInventoryMaxWeight(user_id),vRP.computeChestWeight(sdata),chestc.list[mychestname]['kg'],{ identity.name.." "..identity.firstname,parseInt(user_id),identity.phone,identity.registration,vRP.getBankMoney(user_id) }
		end
	end
	return false
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_chest:populateSlot")
AddEventHandler("vrp_chest:populateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
			TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
			vRP.giveInventoryItem(user_id,itemName,amount,false,target)
			TriggerClientEvent("vrp_chest:Update",source,"updateChest")
		end
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_chest:updateSlot")
AddEventHandler("vrp_chest:updateSlot",function(itemName,slot,target,amount)
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

		TriggerClientEvent("vrp_chest:Update",source,"updateChest")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_chest:sumSlot")
AddEventHandler("vrp_chest:sumSlot",function(itemName,slot,amount)
	print('Nome: '..itemName)
	print('Slot: '..slot)
	print('Quantida: '..amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local inv = vRP.getInventory(user_id)
		if inv then
			if inv[tostring(slot)] and inv[tostring(slot)].item == itemName then
				if vRP.tryChestItem(user_id,"chest:"..tostring(chestOpen[parseInt(user_id)]),itemName,amount,slot) then
					TriggerClientEvent("vrp_chest:Update",source,"updateChest")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.storeChestItem(itemName,slot,amount)
	if not amount then amount = 1 end
	if itemName then
		local source = source
		local user_id = vRP.getUserId(source)
		if user_id then
			local wg = 100
			local mychestname = chestOpen[parseInt(user_id)]
			if chestc.list[mychestname] then
				if chestc.list[mychestname]['kg'] then
					wg = chestc.list[mychestname]['kg']
				end
			end
			if vRP.storeChestItem(user_id,"chest:"..tostring(chestOpen[parseInt(user_id)]),itemName,amount,wg,slot,"chest") then
				TriggerEvent("dossantos:logbau",user_id,true,itemName,amount,tostring(chestOpen[parseInt(user_id)]))
				TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
				TriggerClientEvent("vrp_chest:Update",source,"updateChest")
				local chestName = tostring(chestOpen[user_id])
				if chestc.list[chestName] then
					if chestc.list[chestName].logs then
						local identity = vRP.getUserIdentity(user_id)
						local name = ""
						if identity.name2 then
							name = identity.name.." "..identity.name2
						else
							name = identity.name.." "..identity.firstname
						end
                    	local log = "|| ||\n>>> :calendar: _("..os.date("%d/%m/%Y às %H:%M:%S")..")_\n:scroll: **["..user_id.."] "..name.."** GUARDOU **"..amount.."x "..itemName.."** DO BAÚ **"..chestName.."**."
                    	PerformHttpRequest(chestc.list[chestName].logs, function(err, text, headers) end, 'POST', json.encode({ username = "[LOGS] | EliteStore", avatar_url = "https://images-ext-2.discordapp.net/external/uh-7u1EdGsDOSwbaLYvWRopo2UMpseo7eb565jm_jJk/%3Fwidth%3D473%26height%3D473/https/media.discordapp.net/attachments/805132341064368209/917827242426503220/EliteStore_PNG.png", content = log }), { ['Content-Type'] = 'application/json' })
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.takeChestItem(itemName,slot,amount)
	if not amount then amount = 1 end
	if itemName then
		local source = source
		local user_id = vRP.getUserId(source)
		if user_id then
			if vRP.tryChestItem(user_id,"chest:"..tostring(chestOpen[parseInt(user_id)]),itemName,amount,slot,"chest") then
				TriggerEvent("dossantos:logbau",user_id,false,itemName,amount,tostring(chestOpen[parseInt(user_id)]))
				TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
				TriggerClientEvent("vrp_chest:Update",source,"updateChest")
				local chestName = tostring(chestOpen[user_id])
				if chestc.list[chestName] then
					if chestc.list[chestName].logs then
						local identity = vRP.getUserIdentity(user_id)
						local name = ""
						if identity.name2 then
							name = identity.name.." "..identity.name2
						else
							name = identity.name.." "..identity.firstname
						end
                    	local log = "|| ||\n>>> :calendar: _("..os.date("%d/%m/%Y às %H:%M:%S")..")_\n:scroll: **["..user_id.."] "..name.."** RETIROU **"..amount.."x "..itemName.."** DO BAÚ **"..chestName.."**."
                    	PerformHttpRequest(chestc.list[chestName].logs, function(err, text, headers) end, 'POST', json.encode({ username = "[LOGS] | EliteStore", avatar_url = "https://images-ext-2.discordapp.net/external/uh-7u1EdGsDOSwbaLYvWRopo2UMpseo7eb565jm_jJk/%3Fwidth%3D473%26height%3D473/https/media.discordapp.net/attachments/805132341064368209/917827242426503220/EliteStore_PNG.png", content = log }), { ['Content-Type'] = 'application/json' })
					end
				end
			end
		end
	end
end


