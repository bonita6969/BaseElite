-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local chestOpen = {}
local vehChest = {}
local vnames = {}
local vehWeight = {}
print('['.. GetCurrentResourceName() .. '] Iniciado com sucesso')
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.TrunkchestClose()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if chestOpen[user_id] then
			chestOpen[user_id] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.openTrunkChest()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local vehicle,vnetid,placa,vname,lock,banned,trunk = vRPclient.vehList(source,3)
		if vehicle then
			local plateUserId = vRP.getUserByRegistration(placa)
			if plateUserId then
				local myinventory = {}
				local myvehicle = {}
				if vRPclient.isInVehicle(source) then
					vehWeight[user_id] = 5
					vehChest[parseInt(user_id)] = "gloveschest:"..parseInt(plateUserId)..":"..vname
				else
					vehWeight[user_id] = parseInt(vRP.vehicleChest(vname))
					vehChest[parseInt(user_id)] = "trunkchest:"..parseInt(plateUserId)..":"..vname
				end

				vnames[parseInt(user_id)] = vname

				local inv = vRP.getInventory(parseInt(user_id))
				local data = vRP.getSData(vehChest[parseInt(user_id)])
				local sdata = json.decode(data) or {}
				if data and sdata ~= nil then
					for k,v in pairs(sdata) do
						table.insert(myvehicle,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
					end
				end

				for k,v in pairs(inv) do

					v.amount = parseInt(v.amount)
					v.name = vRP.itemNameList(v.item)
					v.peso = vRP.getItemWeight(v.item)
					v.index = vRP.itemIndexList(v.item)
					v.key = v.item
					v.slot = k

					myinventory[k] = v
				end
			return myinventory,myvehicle,vRP.computeInvWeight(user_id),vRP.getInventoryMaxWeight(user_id),vRP.computeChestWeight(sdata),vehWeight[user_id],{ identity.name.." "..identity.firstname,parseInt(user_id),identity.phone,identity.registration,vRP.getBankMoney(user_id) }
			end
		end
	end
	return false
end

function checkWeaponByAmmo(ammo, weapon)
	local is_w = config.weapon_ammos[ammo]
	if is_w then
		for k, v in pairs(is_w) do
			if v == weapon then
				return true
			end
		end
	end
	return false
end
function getAmmoTypeByWeapon(wea)
	for ammo, weapons in pairs(config.weapon_ammos) do
		for _, weapon in pairs(weapons) do
			if weapon  == wea then
				return ammo
			end
		end
	end
	return ""
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_trunkchest:populateSlot")
AddEventHandler("vrp_trunkchest:populateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then


			vRP.giveInventoryItem(user_id,itemName,amount,false,target)
			TriggerClientEvent("vrp_trunkchest:Update",source,"updateTrunk")
		end
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_trunkchest:updateSlot")
AddEventHandler("vrp_trunkchest:updateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		TriggerClientEvent("vrp_sound:source",source,"slot",0.1)
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

		TriggerClientEvent("vrp_trunkchest:Update",source,"updateTrunk")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_trunkchest:sumSlot")
AddEventHandler("vrp_trunkchest:sumSlot",function(itemName,slot,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local inv = vRP.getInventory(user_id)
		if inv then
			if inv[tostring(slot)] and inv[tostring(slot)].item == itemName then
				if vRP.tryChestItem(user_id,"chest:"..tostring(chestOpen[parseInt(user_id)]),itemName,amount,slot) then
					TriggerClientEvent("vrp_trunkchest:Update",source,"updateTrunk")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.storeTrunkItem(itemName,slot,amount)
	if itemName then
		local source = source
		local user_id = vRP.getUserId(source)
		if user_id then
			if vRP.storeChestItem(user_id,vehChest[parseInt(user_id)],itemName,amount,parseInt(vehWeight[user_id]),slot,"trunkchest") then
				TriggerClientEvent("vrp_trunkchest:Update",source,"updateTrunk")
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.openinvTRUNK()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local vehicle,vnetid,placa,vname,lock,banned,trunk = vRPclient.vehList(source,4)
        if vehicle then
            for k,v in pairs(chestOpen) do
                if v == placa then
                    return
                end
            end
            if lock == 1 then
                local type = vRP.vehicleType(vname)
                if type ~= "work" then
                    local plateUserId = vRP.getUserByRegistration(placa)
                    local ok = false
                    if plateUserId == user_id or vRP.hasPermission(user_id,config.permbau) then
                        ok = true
                    else
                        if vRP.getUserSource(plateUserId) then
                            local identity = vRP.getUserIdentity(user_id)
							local psource = vRP.getUserSource(plateUserId)
                            TriggerClientEvent("Notify",psource,"importante","Alguém conseguiu acessar seu porta-malas.",12000)
							chestOpen[user_id] = placa
                        	vCLIENT.trunkOpen(source)
                        end
                    end
                    if ok then
                        chestOpen[user_id] = placa
                        vCLIENT.trunkOpen(source)
                    end
                end
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.takeTrunkItem(itemName,slot,amount)
	if itemName then
		local source = source
		local user_id = vRP.getUserId(source)
		if user_id then
			if vRP.tryChestItem(user_id,vehChest[parseInt(user_id)],itemName,amount,slot,"trunkchest") then
				TriggerClientEvent("vrp_trunkchest:Update",source,"updateTrunk")
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERLEAVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerLeave",function(user_id,source)
	if chestOpen[user_id] then
		chestOpen[user_id] = nil
	end
end)

RegisterServerEvent("trytrunk")
AddEventHandler("trytrunk",function(nveh)
	TriggerClientEvent("synctrunk",-1,nveh)
end)
