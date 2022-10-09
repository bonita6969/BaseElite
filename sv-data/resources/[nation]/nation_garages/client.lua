local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vSERVER = Tunnel.getInterface("nation_garages")
cO = {}
Tunnel.bindInterface("nation_garages",cO)


--- TABLE QUE ARMAZENA AS GARAGENS PRÓXIMAS ---
nearestGarages = {} 
homeGarage = false


--- CLASSES DOS VEÍCULOS PARA ENVIAR À NUI ---
local classes = {
	[0] = "Compacts",  
	[1] = "Sedans",  
	[2] = "SUVs",  
	[3] = "Coupes",  
	[4] = "Muscle",  
	[5] = "Sports Classics",  
	[6] = "Sports",  
	[7] = "Super",  
	[8] = "Motorcycles",  
	[9] = "Off-road",  
	[10] = "Industrial",  
	[11] = "Utility",
	[12] = "Vans",
	[13] = "Cycles",  
	[14] = "Boats",  
	[15] = "Helicopters",  
	[16] = "Planes",  
	[17] = "Service", 
	[18] = "Emergency",  
	[19] = "Military",  
	[20] = "Commercial",  
	[21] = "Trains" 
}


--- RETORNA A CLASSE DE UM VEÍCULO PELO ÍNDICE ---
function getVehicleClass(class)
	return classes[class] or "none"
end


--- TUNNEL DO TOGGLE DA NUI ---
function cO.toggleNui()
	toggleNui()
end


--- TOGGLE DA NUI ---
function toggleNui(garage, service, hangar)
	nui = not nui
	if nui then
		nearestGarage = garage
		if service then
			openServiceGarage(garage)
		elseif hangar then 
			openPlanesGarage()
		else
			openPublicGarage()
		end
	else
		closeGarage()
	end
end


--- ABRIR GARAGEM PÚBLICA ---
function openPublicGarage()
	local vehicles = getMyVehicles()

	TriggerScreenblurFadeIn(500)
	SetNuiFocus(true,true)
	SendNUIMessage({
		action = "show", vehicles = vehicles, seguradora = config.seguradora / 100, ipva = ((config.ipva or 1) / 100), 
		detido = config.detido / 100, defaultImg = config.defaultImg, imgDir = config.imgDir,
		saveNearestVeh = config.guardar_veiculo_proximo, time = vSERVER.getTime(), addGarageButton = config.addGarageButton
	})
	nui = true
	checkNui(GetEntityCoords(PlayerPedId()))
end

--- ABRIR GARAGEM DE SERVIÇO ---
function openServiceGarage(garage)
	local vehicles = getServiceVehicles(garage)
	TriggerScreenblurFadeIn(500)
	SetNuiFocus(true,true)
	SendNUIMessage({
		action = "show", vehicles = vehicles, seguradora = config.seguradora / 100, 
		detido = config.detido / 100, defaultImg = config.defaultImg, imgDir = config.imgDir,
		saveNearestVeh = config.guardar_veiculo_proximo, time = vSERVER.getTime()
	})
	nui = true
	checkNui(GetEntityCoords(PlayerPedId()))
end
--- ABRIR GARAGEM PÚBLICA ---
function openPlanesGarage()
	local vehicles = getMyAviao()
	TriggerScreenblurFadeIn(500)
	SetNuiFocus(true,true)
	SendNUIMessage({
		action = "show", vehicles = vehicles, seguradora = config.seguradora / 100, ipva = ((config.ipva or 1) / 100), 
		detido = config.detido / 100, defaultImg = config.defaultImg, imgDir = config.imgDir,
		saveNearestVeh = config.guardar_veiculo_proximo, time = vSERVER.getTime(), addGarageButton = config.addGarageButton
	})
	nui = true
	checkNui(GetEntityCoords(PlayerPedId()))
end


--- FECHAR A NUI ---
function closeGarage()
	TriggerScreenblurFadeOut(500)
	SetNuiFocus(false)
	SendNUIMessage({action = "hide"})
	nui = false
end


--- RETORNA UMA TABLE COM TODOS OS VEÍCULOS DO PLAYER E SUAS INFORMAÇÕES ---
function getMyVehicles()
	local vehicles = vSERVER.getVehicles()
	if vehicles and #vehicles > 0 then
		for i in ipairs(vehicles) do
			local class = GetVehicleClassFromName(vehicles[i].vehicle)
			vehicles[i].classe = getVehicleClass(class)
		end
	end
	return vehicles or {}
end
--- RETORNA UMA TABLE COM TODOS AVIÕES DO PLAYER E SUAS INFORMAÇÕES ---
function getMyAviao()
	local vehicles = vSERVER.getVehicles()
	local k = 0
	local planes = {}
	if vehicles and #vehicles > 0 then
		for i in ipairs(vehicles) do
			local class = GetVehicleClassFromName(vehicles[i].vehicle)
			if class == 15 or class == 16 then 
				if vehicles[i] ~= nil then
					k = k + 1
					planes[k] = vehicles[i] 
					planes[k].classe = getVehicleClass(class)
				end
			end
		end
		return planes or {}
	end
end

--- RETORNA OS VEÍCULOS DE UMA DETERMINADA GARAGEM DE SERVIÇO ---
function getServiceVehicles(garage)
	local vehicles = garage.vehicles
	for i in ipairs(vehicles) do
		local class = GetVehicleClassFromName(vehicles[i].vehicle)
		vehicles[i].classe = getVehicleClass(class)
		vehicles[i].name = vehicles[i].modelo or vehicles[i].vehicle
		vehicles[i].engine, vehicles[i].body, vehicles[i].fuel = 1000, 1000, 100
	end
	return vehicles or {}
end

function cO.getGaragesHouse(table)
	config.homeGarages = table
end
RegisterNetEvent('AtualizaçãoGaragem')
AddEventHandler('AtualizaçãoGaragem',function(table)
	config.homeGarages = table
end)
--- THREAD QUE ATUALIZA AS GARAGENS PRÓXIMAS ---
Citizen.CreateThread(function()
	TriggerScreenblurFadeOut(500)
	SetNuiFocus(false)

	while true do
		if not nui then
			local playercoords = GetEntityCoords(PlayerPedId())
			for i in ipairs(config.garages) do 
				local distance = #(playercoords - config.garages[i].coords)
				if distance < 5 then
					nearestGarages[i] = config.garages[i]
				elseif nearestGarages[i] then
					nearestGarages[i] = nil
				end
			end
			
			for i in ipairs(config.homeGarages) do 
				local distance = #(playercoords - config.homeGarages[i].coords)
				if distance < 5 then
					nearestGarages[#config.garages+i] = config.homeGarages[i]
				elseif nearestGarages[#config.garages+i] then
					nearestGarages[#config.garages+i] = nil
				end
			end
		end
		Citizen.Wait(500)
	end
end)


--- THREAD PARA DESENHAR OS MARKERS (GARAGENS PRÓXIMAS) E ABRIR A NUI CASO O PLAYER PRESSIONE "E" ---
Citizen.CreateThread(function()
	while true do
		local idle = 500
		if not nui and length(nearestGarages) > 0 then
			local playercoords = GetEntityCoords(PlayerPedId())
			for i in pairs(nearestGarages) do
				if nearestGarages[i] then
					idle = 0
					local coords = nearestGarages[i].coords
					local marker = nearestGarages[i].marker 
					config.drawMarker(coords,marker)
					if IsControlJustPressed(0,38) then
						local distance = #(playercoords - coords)
						if distance < 2 then
							if nearestGarages[i].type == "service" then
								if vSERVER.hasPermission(nearestGarages[i].perm) then
									homeGarage = false
									toggleNui(nearestGarages[i],true)
								end
							elseif nearestGarages[i].type == "home" then
								if vSERVER.hasHome(nearestGarages[i].home) then
									homeGarage = nearestGarages[i].home
									toggleNui(nearestGarages[i])
								end
							elseif nearestGarages[i].type == "pessoal" then
								if vSERVER.hasPermission(nearestGarages[i].perm) then
									homeGarage = false
									toggleNui(nearestGarages[i])
								end
							elseif nearestGarages[i].type == "hangar" then
								if vSERVER.hasPermission(nearestGarages[i].perm) then
									homeGarage = false
									toggleNui(nearestGarages[i],false,true) -- Primeiro False para dizer que não é de serviço e segunda para dizer que é um hangar
								end
							else
								homeGarage = false
								toggleNui(nearestGarages[i])
							end
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)



function checkNui(coords)
	Citizen.CreateThread(function()
		while nui do
			local playercoords = GetEntityCoords(PlayerPedId())
			local distance = #(playercoords - coords)
			if distance > 1.5 then
				closeGarage()
			end
			Citizen.Wait(1000)
		end
	end)
end

--- CHECA SE O VEÍCULO JÁ ESTÁ NA RUA ---
function checkInStreet(vehicle,plate)
	local plate = plate or vRP.getRegistrationNumber()
	local vehicles = GetGamePool("CVehicle")
	if plate and vehicles then
		for _,veh in pairs(vehicles) do
			local vehPlate = GetVehicleNumberPlateText(veh)
			if vehPlate then
				vehPlate = string.gsub(vehPlate, "%s+", "")
				plate = string.gsub(plate, "%s+", "")
			end
			if vehPlate == plate and GetDisplayNameFromVehicleModel(GetEntityModel(veh)):lower() == vehicle then
				return true,VehToNet(veh),vehicle,GetEntityModel(veh)
			end
		end
	end
	return false
end


--- CHECA SE TEM VAGA PARA SPAWNAR O VEÍCULO ---

function cO.checkSpot(vehicleInfo, plate)
	local modelName = GetDisplayNameFromVehicleModel(vehicleInfo.vehicle):lower()
	if checkInStreet(modelName, plate) then
		closeGarage()
		TriggerEvent("Notify","vermelho","Você já tem um veículo deste modelo fora da garagem.", 3000)
		return
	end
	local count = 0
	for _,spawn in ipairs(nearestGarage.vehiclePositions) do
		local spawnCoords = spawn[1]
		local closestVehicleOnSpot = GetClosestVehicle(spawnCoords.x,spawnCoords.y,spawnCoords.z,3.001,0,71)
		if DoesEntityExist(closestVehicleOnSpot) then
			count = count + 1
			if count >= #nearestGarage.vehiclePositions then
				toggleNui()
				TriggerEvent('Notify', 'vermelho', 'Todas as vagas estão ocupadas no momento.', 3000)
				return
			end
		else
			closeGarage()
			if spawnVehicle(vehicleInfo, spawnCoords, spawn.h, plate) then -- Se é avião ou helipcotero, a função não ta entrando aqui
				notify(vehicleInfo.vehicle, "retirou", vSERVER.getVehicleModel(vehicleInfo.vehicle))
			end
			return
		end
	end 
end
--- FUNÇÃO DE SPAWN DO VEÍCULO ---
local iniciar = 0
function spawnVehicle(vehicleInfo, coords, h, plate)
	local mhash = loadModel(vehicleInfo.vehicle)
	if not mhash then
		TriggerEvent("Notify","amarelo","Veículo em falta na cidade!",3000)
		return false
	end
	local plate = plate or vRP.getRegistrationNumber()
	if plate then
		plate = string.gsub(plate, "%s+", "")
	end
	local vehicle = false
	if config.client_vehicle then
		vehicle = CreateVehicle(mhash,coords.x,coords.y,coords.z+0.5,h,true,true)
		local netveh = VehToNet(vehicle)
		NetworkRegisterEntityAsNetworked(vehicle)
		while not NetworkGetEntityIsNetworked(vehicle) do
			NetworkRegisterEntityAsNetworked(vehicle)
			Citizen.Wait(1)
		end
		if NetworkDoesNetworkIdExist(netveh) then
			SetEntitySomething(vehicle,true)
			if NetworkGetEntityIsNetworked(vehicle) then
				SetNetworkIdExistsOnAllMachines(netveh,true)
			end
		end
		NetworkFadeInEntity(vehicle,true)
		SetVehicleNumberPlateText(vehicle,plate)
	else
		vSERVER.spawnVeh(mhash,coords,h,plate)
		while not vehicle do 
			local nearestVeh = GetClosestVehicle(coords.x,coords.y,coords.z,3.001,0,71) -- Essa função não retorna carro de policia e nem aviao, helicoptero e etc, por isso fica em looping
			if nearestVeh == 0 then -- Resolvi incrementando essa aqui, to varrendo só helipcoptero e avião!!
				if iniciar == 2 then 
					iniciar = iniciar 
				else 
					iniciar = 1
				end
				if iniciar ~= 1 then 
					local plane = vRP.getNearestVehicle(20)
					local classe = GetVehicleClass(nearestVeh)
					nearestVeh = plane
				end
			end

			if DoesEntityExist(nearestVeh) and IsVehicleModel(nearestVeh, vehicleInfo.vehicle) then
				local vehPlate = GetVehicleNumberPlateText(nearestVeh)
				if vehPlate then
					vehPlate = string.gsub(vehPlate, "%s+", "")
					if vehPlate == plate then
						vehicle = nearestVeh
					end
				end
			end
			iniciar = 2
			Citizen.Wait(1)
		end
	end
	iniciar = 0
	if DoesEntityExist(vehicle) then
		SetVehicleIsStolen(vehicle,false)
		SetVehicleNeedsToBeHotwired(vehicle,false)
		SetEntityInvincible(vehicle,false)
		SetEntityAsMissionEntity(vehicle,true,true)
		SetVehicleHasBeenOwnedByPlayer(vehicle,true)
		SetVehRadioStation(vehicle,"OFF")
		TriggerEvent("nation:applymods", vehicle,vehicleInfo.vehicle)
		SetVehicleEngineHealth(vehicle, vehicleInfo.engine+0.0)
		SetVehicleBodyHealth(vehicle, vehicleInfo.body+0.0)
		SetVehicleFuelLevel(vehicle,vehicleInfo.fuel+0.0)
		TriggerServerEvent("nyo_fuel:addVehicle", VehToNet(vehicle), vehicleInfo.fuel+0.0)
		SetModelAsNoLongerNeeded(mhash)
		vSERVER.registerVehicle(VehToNet(vehicle),mhash,plate)
		return true
	end
	return false
end

----------------------------------


--- CHECA SE O VEÍCULO ESTÁ ATIVO (ALGUM PLAYER DEVE ESTAR DENTRO DO VEÍCULO PARA RETORNAR TRUE) ---

function cO.isVehicleActive(netveh)
	local vehicle = NetToVeh(netveh)
	if DoesEntityExist(vehicle) then
		local ped = PlayerPedId()
		if GetVehiclePedIsIn(ped,false) == vehicle then
			return true
		end
	end
	return false
end

---------------------------------------------------------------------------------------------------------


--- IDENTIFICA O VEÍCULO MAIS PRÓXIMO E DELETA (CHAMA A FUNCÃO DE DELETAR) ---
function cO.tryDeleteNearestVehicle()
	local vehicle = getNearestVehicle(7)
	local timeout = 2000
	while (not vehicle or not DoesEntityExist(vehicle)) and timeout > 0 do
		vehicle = getNearestVehicle(7)
		timeout = timeout - 10
		Citizen.Wait(10)
	end
	if vehicle and DoesEntityExist(vehicle) then
		TriggerServerEvent("nation:deleteVehicleSync",VehToNet(vehicle))
		return vehicle
	end
	return false
end


--- DELETAR ALGUM VEÍCULO (NETVEH) ---
function cO.deleteVehicle(index)
	Citizen.CreateThread(function()
		if NetworkDoesEntityExistWithNetworkId(index) then
			-- SetVehicleAsNoLongerNeeded(index)
			-- SetEntityAsMissionEntity(index,true,true)
			local v = NetToVeh(index)
			
			if DoesEntityExist(v) then
				SetVehicleHasBeenOwnedByPlayer(v,false)
				PlaceObjectOnGroundProperly(v)
				SetEntityAsNoLongerNeeded(v)
				SetEntityAsMissionEntity(v,true,true)
				local hash = GetEntityModel(v)
				local plate, engine, body, fuel =  GetVehicleNumberPlateText(v), parseInt(GetVehicleEngineHealth(v)), 
				parseInt(GetVehicleBodyHealth(v)), parseInt(GetVehicleFuelLevel(v))
				DeleteVehicle(v)
				if plate then
					plate = string.gsub(plate, "%s+", "")
				end
				local vehInfo = vSERVER.getVehicleInfo(hash,true)
				if vehInfo then
					vSERVER.saveVehicle(vehInfo.name, plate, engine, body, fuel)
				end
				vSERVER.removeVehicle(index,hash,plate)
				TriggerServerEvent("nyo_fuel:delVehicle", index)
			end
		end
	end)
end


-- CARREGAR O MODEL DO VEÍCULO --
function loadModel(model)
	local mhash = GetHashKey(model)
	local timeout = 30 * 1000
	while not HasModelLoaded(mhash) do
		RequestModel(mhash)
		timeout = timeout - 1
		if timeout <= 0 then
			return false
		end
		Citizen.Wait(1)
	end
	return mhash
end


-- PEGAR O TAMANHO DA TABLE (ÍNDICES NÃO ORDENADOS) --
function length(array)
	local len = 0
	for i in pairs(array) do 
		if array[i] then
			len = len+1
		end
	end
	return len
end


---- NOTIFICAÇÃO DOS VEÍCULOS ---

function notify(vehicle, type, vehname)
	SendNUIMessage({ action = "notify", vehicle = vehicle, type = type, vehname = vehname })
end

------------------------------------

-------- IDENTIFICAR VEÍCULOS PRÓXIMOS -----------


-- IDENTIFICAR TODOS OS VEÍCULOS PRÓXIMOS --
function getNearestVehicles(radius)
	local r = {}
	local px,py,pz = table.unpack(GetEntityCoords(PlayerPedId()))
	local vehs = {}
	local it,veh = FindFirstVehicle()
	if veh then
		table.insert(vehs,veh)
	end
	local ok
	repeat
		ok,veh = FindNextVehicle(it)
		if ok and veh then
			table.insert(vehs,veh)
		end
	until not ok
	EndFindVehicle(it)
	for _,veh in pairs(vehs) do
		local x,y,z = table.unpack(GetEntityCoords(veh,true))
		local distance = GetDistanceBetweenCoords(x,y,z,px,py,pz,true)
		if distance <= radius then
			r[veh] = distance
		end
	end
	return r
end

-- IDENTIFICAR O VEÍCULO MAIS PRÓXIMO --
function getNearestVehicle(radius)
	local veh
	local vehs = getNearestVehicles(radius)
	local min = radius+0.0001
	for _veh,dist in pairs(vehs) do
		if dist < min then
			min = dist
			veh = _veh
		end
	end
	return veh 
end

-- IDENTIFICAR O RETORNAR INFORMAÇÕES SOBRE O VEÍCULO MAIS PRÓXIMO --
function cO.getNearestVehicleInfo()
	local veh = GetVehiclePedIsIn(PlayerPedId(), false)
	if veh == 0 then
		veh = getNearestVehicle(7)
	end
	if DoesEntityExist(veh) then
		local v = vSERVER.getVehicleInfo(GetEntityModel(veh),true)
		if v then
			return GetVehicleNumberPlateText(veh),v.name,parseInt(v.price),v.banido,VehToNet(veh),veh
		end
	end
end

------------------------------------------------------





------ TRANCAR E DESTRANCAR O VEÍCULO -----

--- COMANDO PARA O KEYMAPPING DE TRANCASR / DESTRANCAR O VEÍCULO
cooldown = 0
RegisterCommand('+tryLockVehicle',function()
	if cooldown < 1 then
		startCooldown(1)
		TriggerServerEvent("nation:tryLockNearestVehicle")
	end
end)

--- KEYMAPPING DO COMANDO +TRYLOCKVEHICLE ---
RegisterKeyMapping("+tryLockVehicle", "", "keyboard", "l")


--- COOLDOWN DO KEYMAPPING ---
function startCooldown(time)
	Citizen.CreateThread(function()
		cooldown = time
		while cooldown > 0 do
			Citizen.Wait(1000)
			cooldown = cooldown - 1
		end
	end)
end


--- FUNCAO TRANCAR / DESTRANCAR O VEÍCULO ---
function cO.toggleLock(vnet)
	local vehicle = NetToVeh(vnet)
	if IsEntityAVehicle(vehicle) then
		local locked = GetVehicleDoorLockStatus(vehicle) >= 2
		local vehmodel = vSERVER.getVehicleInfo(GetEntityModel(vehicle),true).modelo
		local vehname = vSERVER.getVehicleInfo(GetEntityModel(vehicle),true).name
		--notify(vehicleInfo.vehicle, "retirou", vSERVER.getVehicleModel(vehicleInfo.vehicle))
		if locked then
			TriggerServerEvent("nation:tryLockVehicle",VehToNet(vehicle))
			notify(vehname, "destrancado", vehmodel)
		else
			TriggerServerEvent("nation:tryLockVehicle",VehToNet(vehicle))
			notify(vehname, "trancado", vehmodel)
		end
		if not IsPedInAnyVehicle(PlayerPedId()) then
			if config.playAnim then
				config.playAnim()
			else
				vRP._playAnim(true,{"anim@mp_player_intmenu@key_fob@","fob_click"},false)
			end
		end
	end
end


-------------------- SYNC -------------------------

RegisterNetEvent("nation:syncLock")
AddEventHandler("nation:syncLock",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				local locked = GetVehicleDoorLockStatus(v)
				if locked == 1 then
					SetVehicleDoorsLocked(v,2)
				else
					SetVehicleDoorsLocked(v,1)
				end
				SetVehicleLights(v,2)
				Wait(200)
				SetVehicleLights(v,0)
				Wait(200)
				SetVehicleLights(v,2)
				Wait(200)
				SetVehicleLights(v,0)
			end
		end
	end
end)

RegisterNetEvent("nation:closeGarage")
AddEventHandler("nation:closeGarage",function(index)
	closeGarage()
end)

---------------------------------------------------------------------


--- ANCORAR ---

local ancorado = false
function cO.toggleAnchor(vnet)
	local vehicle = NetToVeh(vnet)
	if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) and GetVehicleClass(vehicle) == 14 then
		if ancorado then
			FreezeEntityPosition(vehicle,false)
			ancorado = false
			TriggerEvent('Notify', 'amarelo','Veiculo <b>desancorado!</b>')
		else
			FreezeEntityPosition(vehicle,true)
			ancorado = true
			TriggerEvent('Notify', 'verde','Veiculo <b>Ancorado!</b>')
		end
	end
end

-------------


--- FUNÇÃO DE TUNNING (ENVIAR BONITINHO PARA A NUI) ---

function verify(index,armor)
	if armor then
		if armor == -1 then
			index = "<strong>Desativado</strong>"
		elseif armor < 3 then
			index = "<a>"..(20 + armor * 20).." %</a>" 
		else
			index = "<b>"..(20 + armor * 20).." %</b>"  
		end	
	elseif index then
		if index == -1 then
			index = "<strong>Desativado</strong>"
		elseif index < 3 then
			index = "<a>Level "..(index + 1).."</a>"
		else
			index = "<b>Level "..(index + 1).."</b>"
		end
	end
	return index
end

-----------------------------------------------------------


--- COOLDOWN DOS CALLBACKS ---

function setBlock()
	block = true
	Citizen.CreateThread(function()
		local time = 3
		while time > 0 do
			Wait(1000)
			time = time - 1
		end
		block = false
	end)
end

--------------------------------


----------------------------------------------------------------
----------------------- CALLBACKS ------------------------------
----------------------------------------------------------------


-- RETORNA AS TUNAGENS DO VEÍCULO --
RegisterNUICallback("get-tuning", function(data,cb)
	if data and data.vehicle then
		local tuning = vSERVER.getVehicleTuning(data.vehicle)
		local tunagem = {}
		local engine 
		local brakes 
		local transmission 
		local suspention 
		local armour 
		local turbo 
		if tuning then
			if tuning.engine then
				engine = verify(tuning.engine)
				brakes = verify(tuning.brakes)
				transmission = verify(tuning.transmission)
				suspention = verify(tuning.suspension)
				armour = verify(false,tuning.armor) or "<strong>Desativado</strong>"
				turbo = tuning.turbo
				if turbo then
					if type(turbo) == "number" then
						if turbo > 0 then
							turbo = "<b>Instalado</b>"
						else
							turbo = "<strong>Desinstalado</strong>" 
						end
					else 
						turbo = "<b>Instalado</b>"
					end
				else 
					turbo = "<strong>Desinstalado</strong>"
				end
			elseif tuning.mods then
				if type(tuning.mods['11']) == "table" then
					engine = verify(tuning.mods['11'].mod)
					brakes = verify(tuning.mods['12'].mod)
					transmission = verify(tuning.mods['13'].mod)
					suspention = verify(tuning.mods['15'].mod)
					armour = verify(false,tuning.mods['16'].mod)
					turbo = tuning.mods['18'].mod
					if turbo < 1 then turbo = "<strong>Desinstalado</strong>" else turbo = "<b>Instalado</b>" end
				else
					engine = verify(tuning.mods['11'])
					brakes = verify(tuning.mods['12'])
					transmission = verify(tuning.mods['13'])
					suspention = verify(tuning.mods['15'])
					armour = verify(false,tuning.mods['16'])
					turbo = tuning.mods['18']
					if turbo then
						if type(turbo) == "number" then
							if turbo > 0 then
								turbo = "<b>Instalado</b>"
							else
								turbo = "<strong>Desinstalado</strong>" 
							end
						else 
							turbo = "<b>Instalado</b>"
						end
					else 
						turbo = "<strong>Desinstalado</strong>"
					end
				end
			end
			tunagem = { motor = engine, freios = brakes, transmissao = transmission, suspensao = suspention, blindagem = armour, turbo = turbo }
		end	
		cb(tunagem)
	end
end) 

-- RETORNA A CAPACIDADE E O ESPAÇO OCUPADO NO PORTA-MALAS DE UM DETERMINADO VEÍCULO --
RegisterNUICallback("get-trunk", function(data,cb)
	if data and data.vehicle and data.vehicle.vehicle then
		local chestMax, chest = vSERVER.getVehicleTrunkChest(data.vehicle.vehicle)
		cb({ chestMax = chestMax, chest = chest })
	end
end) 


-- FECHAR --
RegisterNUICallback("close", function(data)
	toggleNui()
end) 


-- RETORNA TRUE CASO O PLAYER PAGUE A TAXA COM SUCESSO --
RegisterNUICallback("pay-tax", function(data,cb)
	if data and data.vehicle then
		cb(vSERVER.tryPayTax(data.vehicle))
	end
end)


-- TENTA SPAWNAR O VEÍCULO --
RegisterNUICallback("spawn-vehicle", function(data)
	if data and data.vehicle and not block then
		setBlock()
		vSERVER.checkVehicle(data.vehicle, nearestGarage.type, GetHashKey(data.vehicle), homeGarage)
	end
end)


-- GUARDAR O VEÍCULO --
RegisterNUICallback("save-vehicle", function(data)
	if data and data.vehicle and not block then
		setBlock()
		local modelName = GetDisplayNameFromVehicleModel(data.vehicle):lower()
		local plate = vSERVER.getVehiclePlate(data.vehicle) or vRP.getRegistrationNumber()
		local inStreet, netveh = checkInStreet(modelName, plate)
		if inStreet then
			local vehicle = NetToVeh(netveh)
			if DoesEntityExist(vehicle) then
				local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(vehicle))
				if distance < 50 then
					local plate, engine, body, fuel =  GetVehicleNumberPlateText(vehicle), parseInt(GetVehicleEngineHealth(vehicle)), 
					parseInt(GetVehicleBodyHealth(vehicle)), parseInt(GetVehicleFuelLevel(vehicle))
					if plate then
						plate = string.gsub(plate, "%s+", "")
					end
		
					vSERVER.saveVehicle(data.vehicle, plate, engine, body, fuel)
					TriggerServerEvent("nation:deleteVehicleSync",netveh)
					notify(data.vehicle, "guardou", vSERVER.getVehicleModel(data.vehicle))
					closeGarage()
				end
			end
		end
	end
end)

RegisterNUICallback("save-nearest-vehicle", function(data)
	if not block then
		setBlock()
		local vehicle = getNearestVehicle(15)
		if DoesEntityExist(vehicle) then
			local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(vehicle))
			if distance < 50 then
				local plate, engine, body, fuel = GetVehicleNumberPlateText(vehicle), parseInt(GetVehicleEngineHealth(vehicle)), 
				parseInt(GetVehicleBodyHealth(vehicle)), parseInt(GetVehicleFuelLevel(vehicle))
				local vehInfo = vSERVER.getVehicleInfo(GetEntityModel(vehicle),true)
				if vehInfo and vehInfo.name then
					if plate then
						plate = string.gsub(plate, "%s+", "")
					end
					vSERVER.saveVehicle(vehInfo.name, plate, engine, body, fuel)
					TriggerServerEvent("nation:deleteVehicleSync",VehToNet(vehicle))
					notify(vehInfo.name, "guardou", vSERVER.getVehicleModel(vehInfo.name))
				end
				closeGarage()
			end
		end
	end
end)

RegisterNUICallback("add-garage", function(data)
	if not block then
		setBlock()
		vSERVER.addGarage()
	end
end)


----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------




----------------------------------------------------------------
----------------------- BLIPS ----------------------------------
----------------------------------------------------------------

Citizen.CreateThread(function()
    if config.showBlips then
		local id = config.blipId
		local color = config.blipColor
		local size = config.blipSize
		local garages = config.garages
		for i in ipairs(garages) do 
			if garages[i].type == "public" then
				local coords = garages[i].coords
				local name = garages[i].name or "Garagem"
				addBlip(coords,id,color,size,name)
			end
		end
	end
	if config.biciCleta then	
		local garages = config.garages
		for i in ipairs(garages) do 
			if garages[i].type == "service" then
				if garages[i].marker == "bicicleta" then	
					local coords = garages[i].coords
					local name = "Bicicletário"
					addBlip(coords,348,46,0.4,name)
				elseif garages[i].marker == "barco" then
					local coords = garages[i].coords
					local name = "Barcos Pesqueiros"
					addBlip(coords,410,4,0.4,name)
				elseif garages[i].marker == "moto" then
					local coords = garages[i].coords
					local name = "Quadriciclos 4x4"
					addBlip(coords,512,4,0.4,name)
				end
			end
		end
	end
	if config.heliPonto then	
		local garages = config.garages
		for i in ipairs(garages) do 
			if garages[i].type == "service" and garages[i].marker == "helicóptero" then
				local coords = garages[i].coords
				local name = "HeliPonto"
				addBlip(coords,64,32,0.4,name)
			end
		end
	end
end)

function addBlip(coords,id,color,scale,name)
	local x,y,z = table.unpack(coords)
	local blip = AddBlipForCoord(x,y,z)
	SetBlipSprite(blip,id)
	SetBlipColour(blip,color)
	SetBlipScale(blip,scale)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(name)
	EndTextCommandSetBlipName(blip)
	return blip
end

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------