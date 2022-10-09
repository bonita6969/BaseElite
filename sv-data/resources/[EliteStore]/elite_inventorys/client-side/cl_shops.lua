-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestShop",function(data,cb)
	local inventoryShop,inventoryUser,weight,maxweight,infos = vSERVER.requestShop(data.shop)
	if inventoryShop then
		cb({ inventoryShop = inventoryShop, inventoryUser = inventoryUser, weight = weight, maxweight = maxweight, infos = infos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTBUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionShops",function(data,cb)
	vSERVER.functionShops(data.shop,data.item,data.amount,data.slot)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateShops",function(data,cb)
	TriggerServerEvent("vrp_shops:populateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateShops",function(data,cb)
	TriggerServerEvent("vrp_shops:updateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_SHOPS:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_shops:Update")
AddEventHandler("vrp_shops:Update",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:MEGAMALL
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:megaMallStore",function()
	SendNUIMessage({ action = "showNUI", name = tostring("megaMallStore"), type = vSERVER.getShopType("megaMallStore") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for k,v in pairs(shops.coords) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 1.5 then
					timeDistance = 4
					DrawText3D(v[1],v[2],v[3],"~g~E~w~   ABRIR")
					if IsControlJustPressed(1,38) and vSERVER.requestPermShops(v[4]) then
						SetNuiFocus(true,true)
						TransitionToBlurred(1000)
						SendNUIMessage({ action = "showShops", name = tostring(v[4]), type = vSERVER.getShopType(v[4]) })
					end
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPSHOPS
-----------------------------------------------------------------------------------------------------------------------------------------
-- local propShops = {
-- 	{ "prop_vend_coffe_01","coffeeMachine" },
-- 	{ "prop_vend_soda_02","sodaMachine" },
-- 	{ "prop_vend_soda_01","colaMachine" },
-- 	{ "v_ret_247_donuts","donutMachine" },
-- 	{ "prop_burgerstand_01","burgerMachine" },
-- 	{ "prop_hotdogstand_01","hotdogMachine" },
-- 	{ "prop_vend_water_01","waterMachine" },
-- 	{ "prop_vend_fridge01","fridgeMachine" },
-- 	{ "prop_food_van_02","vanFood" }, 
-- 	{ "prop_fruit_stand_01","frutasFood" },
-- 	{ "prop_vend_snak_01","snakFood" },
-- 	{ "prop_watercooler", "waterRefil"}
-- }
Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		local timeDistance = 500
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for k,v in pairs(shops.props) do
				if DoesObjectOfTypeExistAtCoords(coords,0.8,GetHashKey(v[1]),true) then	
					local objeto = GetClosestObjectOfType(GetEntityCoords(ped), 0.8, GetHashKey(v[1]))
					if objeto ~= 0 then
						local propcoord = GetEntityCoords(objeto)
						DrawText3D(propcoord.x,propcoord.y,propcoord.z+1.0,"~g~E~w~   ABRIR")
						-- drawTxt("PRESSIONE  ~b~E~w~  PARA ABRIR",4,0.5,0.93,0.50,255,255,255,180)
						timeDistance = 4
						if IsControlJustPressed(1,38) then	
							SetNuiFocus(true,true)
							TransitionToBlurred(1000)
							SendNUIMessage({ action = "showShops", name = tostring(v[2]), type = vSERVER.getShopType(v[2]) })
							
						end
					end
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,100)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 450
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
end