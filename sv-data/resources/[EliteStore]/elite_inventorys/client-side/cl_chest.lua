local uqyvsv_checkauth = false
local uqyvsv_checkauth2 = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while not checkauth do
		Wait(0)
	end	
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("takeChest",function(data)
	vSERVER.takeChestItem(data.item,data.slot,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("storeChest",function(data)
	local ped = GetPlayerPed(-1)
	vSERVER.storeChestItem(data.item,data.slot,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateChest",function(data,cb)
	local ped = GetPlayerPed(-1)
	TriggerServerEvent("vrp_chest:populateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateChest",function(data,cb)
	TriggerServerEvent("vrp_chest:updateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("sumChest",function(data,cb)
	TriggerServerEvent("vrp_chest:sumSlot",data.item,data.slot,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_CHEST:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_chest:Update")
AddEventHandler("vrp_chest:Update",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestChest",function(data,cb)
	local inventario,inventario2,peso,maxpeso,peso2,maxpeso2,infos = vSERVER.openChest()
	if inventario then
		cb({ inventario = inventario, inventario2 = inventario2, peso = peso, maxpeso = maxpeso, peso2 = peso2, maxpeso2 = maxpeso2, infos = infos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETGRIDCHUNK
-----------------------------------------------------------------------------------------------------------------------------------------
function gridChunk(x)
	return math.floor((x + 8192) / 128)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOCHANNEL
-----------------------------------------------------------------------------------------------------------------------------------------
function toChannel(v)
	return (v.x << 8) | v.y
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
local chestCoords = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
local select = ''
CreateThread(function()
    while true do
        local timeDistance = 1000
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
        for k,v in pairs(chestc.list) do
			if select ~= '' then
				if k == select then
					if Vdist(x,y,z,v['x'],v['y'],v['z']) < 2 then
						timeDistance = 5
						DrawMarker(21,v['x'],v['y'],v['z']-0.6, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.5, 222, 67, 11, 180, 0, 0, 0, 0)
						if Vdist(x,y,z,v['x'],v['y'],v['z']) < 0.5 then
							if IsControlJustPressed(1,38) and vSERVER.checkIntChestPermissions(k) then

								if vSERVER.checkchestdump(k) then
									SetNuiFocus(true,true)
									SendNUIMessage({ action = "showChest", log = 'Chest' })
									TransitionToBlurred(1000)
									TriggerEvent("vrp_sound:source","zipper",0.2)
								else
									TriggerEvent("Notify","negado","Existe outra pessoa utilizando o bau.")
								end
							end
						end
					else
						select = ''
					end
				end
			elseif Vdist(x,y,z,v['x'],v['y'],v['z']) < 5 then
				select = k
            end
        end
        Citizen.Wait(timeDistance)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION ADD IN TABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.insertTable(chestname,coords)
	local x,y,z = table.unpack(coords)
	table.insert(chestCoords,{ chestname = chestname, x = x, y = y, z = z })
end