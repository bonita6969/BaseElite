-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("elite_garages",src)
vSERVER = Tunnel.getInterface("elite_garages")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local workgarage = ""
local vehicle = {}
local vehblips = {}
local pointspawn = 1

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuEnabled = false
function ToggleActionMenu(name,status)
	if name and status then
		workgarage = name
		pointspawn = status
	end
	menuEnabled = not menuEnabled
	if menuEnabled then
		SetNuiFocus(true,true)
		SendNUIMessage({ action = "showMenu" })
		vRP._Anim("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a")
		vRP._CarregarObjeto("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a","idle_b","prop_cs_tablet",49,28422)
	else
		SetNuiFocus(false,false)
		SendNUIMessage({ action = "hideMenu" })
		vRP._DeletarObjeto()
		vRP._stopAnim(false)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENGARAGE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.openGarage(work,number)
	ToggleActionMenu(work,parseInt(number))
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEMODS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.vehicleMods(veh,custom)
	if custom and veh then
		SetVehicleModKit(veh,0)
		if custom.color then
			SetVehicleColours(veh,tonumber(custom.color[1]),tonumber(custom.color[2]))
			SetVehicleExtraColours(veh,tonumber(custom.extracolor[1]),tonumber(custom.extracolor[2]))
		end

		if custom.smokecolor then
			SetVehicleTyreSmokeColor(veh,tonumber(custom.smokecolor[1]),tonumber(custom.smokecolor[2]),tonumber(custom.smokecolor[3]))
		end

		if custom.neon then
			SetVehicleNeonLightEnabled(veh,0,1)
			SetVehicleNeonLightEnabled(veh,1,1)
			SetVehicleNeonLightEnabled(veh,2,1)
			SetVehicleNeonLightEnabled(veh,3,1)
			SetVehicleNeonLightsColour(veh,tonumber(custom.neoncolor[1]),tonumber(custom.neoncolor[2]),tonumber(custom.neoncolor[3]))
		else
			SetVehicleNeonLightEnabled(veh,0,0)
			SetVehicleNeonLightEnabled(veh,1,0)
			SetVehicleNeonLightEnabled(veh,2,0)
			SetVehicleNeonLightEnabled(veh,3,0)
		end

		if custom.plateindex then
			SetVehicleNumberPlateTextIndex(veh,tonumber(custom.plateindex))
		end

		if custom.windowtint then
			SetVehicleWindowTint(veh,tonumber(custom.windowtint))
		end

		if custom.bulletProofTyres then
			SetVehicleTyresCanBurst(veh,custom.bulletProofTyres)
		end

		if custom.wheeltype then
			SetVehicleWheelType(veh,tonumber(custom.wheeltype))
		end

		if custom.spoiler then
			SetVehicleMod(veh,0,tonumber(custom.spoiler))
			SetVehicleMod(veh,1,tonumber(custom.fbumper))
			SetVehicleMod(veh,2,tonumber(custom.rbumper))
			SetVehicleMod(veh,3,tonumber(custom.skirts))
			SetVehicleMod(veh,4,tonumber(custom.exhaust))
			SetVehicleMod(veh,5,tonumber(custom.rollcage))
			SetVehicleMod(veh,6,tonumber(custom.grille))
			SetVehicleMod(veh,7,tonumber(custom.hood))
			SetVehicleMod(veh,8,tonumber(custom.fenders))
			SetVehicleMod(veh,10,tonumber(custom.roof))
			SetVehicleMod(veh,11,tonumber(custom.engine))
			SetVehicleMod(veh,12,tonumber(custom.brakes))
			SetVehicleMod(veh,13,tonumber(custom.transmission))
			SetVehicleMod(veh,14,tonumber(custom.horn))
			SetVehicleMod(veh,15,tonumber(custom.suspension))
			SetVehicleMod(veh,16,tonumber(custom.armor))
			SetVehicleMod(veh,23,tonumber(custom.tires),custom.tiresvariation)
		
			if IsThisModelABike(GetEntityModel(veh)) then
				SetVehicleMod(veh,24,tonumber(custom.btires),custom.btiresvariation)
			end
		
			SetVehicleMod(veh,25,tonumber(custom.plateholder))
			SetVehicleMod(veh,26,tonumber(custom.vanityplates))
			SetVehicleMod(veh,27,tonumber(custom.trimdesign)) 
			SetVehicleMod(veh,28,tonumber(custom.ornaments))
			SetVehicleMod(veh,29,tonumber(custom.dashboard))
			SetVehicleMod(veh,30,tonumber(custom.dialdesign))
			SetVehicleMod(veh,31,tonumber(custom.doors))
			SetVehicleMod(veh,32,tonumber(custom.seats))
			SetVehicleMod(veh,33,tonumber(custom.steeringwheels))
			SetVehicleMod(veh,34,tonumber(custom.shiftleavers))
			SetVehicleMod(veh,35,tonumber(custom.plaques))
			SetVehicleMod(veh,36,tonumber(custom.speakers))
			SetVehicleMod(veh,37,tonumber(custom.trunk)) 
			SetVehicleMod(veh,38,tonumber(custom.hydraulics))
			SetVehicleMod(veh,39,tonumber(custom.engineblock))
			SetVehicleMod(veh,40,tonumber(custom.camcover))
			SetVehicleMod(veh,41,tonumber(custom.strutbrace))
			SetVehicleMod(veh,42,tonumber(custom.archcover))
			SetVehicleMod(veh,43,tonumber(custom.aerials))
			SetVehicleMod(veh,44,tonumber(custom.roofscoops))
			SetVehicleMod(veh,45,tonumber(custom.tank))
			SetVehicleMod(veh,46,tonumber(custom.doors))
			SetVehicleMod(veh,48,tonumber(custom.liveries))
			SetVehicleLivery(veh,tonumber(custom.liveries))

			ToggleVehicleMod(veh,20,tonumber(custom.tyresmoke))
			ToggleVehicleMod(veh,22,tonumber(custom.headlights))
			ToggleVehicleMod(veh,18,tonumber(custom.turbo))
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
local gps = {}
function src.spawnVehicle(vehname,vehengine,vehbody,vehfuel,custom)
	if vehicle[vehname] == nil then
		local checkslot = 1
		local mhash = GetHashKey(vehname)
		while not HasModelLoaded(mhash) do
			RequestModel(mhash)
			Citizen.Wait(1)
		end

		if HasModelLoaded(mhash) then
			while true do
				local checkPos = GetClosestVehicle(garages.garages[pointspawn][checkslot].coords.x,garages.garages[pointspawn][checkslot].coords.y,garages.garages[pointspawn][checkslot].coords.z,3.001,0,71)
				SetNuiFocus(false,false)
				SendNUIMessage({ action = "hideMenu" })
				vRP._DeletarObjeto()
				vRP._stopAnim(false)
				if DoesEntityExist(checkPos) and checkPos ~= nil then
					checkslot = checkslot + 1
					if checkslot > #garages.garages[pointspawn] then
						checkslot = -1
						TriggerEvent("Notify","aviso","Todas as vagas estão ocupadas no momento.",10000)
						break
					end
				else
					break
				end
				Citizen.Wait(10)
			end
			
			if checkslot ~= -1 then
				local nveh = CreateVehicle(mhash,garages.garages[pointspawn][checkslot].coords.x,garages.garages[pointspawn][checkslot].coords.y,garages.garages[pointspawn][checkslot].coords.z+0.5,garages.garages[pointspawn][checkslot].h,true,false)
				
				SetVehicleIsStolen(nveh,false)
				SetVehicleDoorsLocked(nveh,2)
				SetVehicleNeedsToBeHotwired(nveh,false)
				SetVehicleOnGroundProperly(nveh)
				SetVehicleNumberPlateText(nveh,vRP.getRegistrationNumber())
				SetEntityAsMissionEntity(nveh,true,true)
				SetVehRadioStation(nveh,"OFF")
				
				SetVehicleEngineHealth(nveh,vehengine+0.0)
				SetVehicleBodyHealth(nveh,vehbody+0.0)
				SetVehicleFuelLevel(nveh,vehfuel+0.0)

				src.vehicleMods(nveh,custom)
				src.syncBlips(nveh,vehname)

				vehicle[vehname] = true
				gps[vehname] = true

				SetModelAsNoLongerNeeded(mhash)

				return true,VehToNet(nveh)
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.syncBlips(nveh,vehname)
	Citizen.CreateThread(function()
		while true do
			if GetBlipFromEntity(nveh) == 0 and gps[vehname] ~= nil then
				vehblips[vehname] = AddBlipForEntity(nveh)
				SetBlipSprite(vehblips[vehname],1)
				SetBlipAsShortRange(vehblips[vehname],false)
				SetBlipColour(vehblips[vehname],80)
				SetBlipScale(vehblips[vehname],0.4)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString("~b~Rastreador: ~g~"..GetDisplayNameFromVehicleModel(GetEntityModel(nveh)))
				EndTextCommandSetBlipName(vehblips[vehname])
			end
			Citizen.Wait(100)
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.deleteVehicle(vehicle)
	if IsEntityAVehicle(vehicle) then
		vSERVER.tryDelete(VehToNet(vehicle),GetVehicleEngineHealth(vehicle),GetVehicleBodyHealth(vehicle),GetVehicleFuelLevel(vehicle))
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.removeGpsVehicle(vehname)
	if vehicle[vehname] then
		RemoveBlip(vehblips[vehname])
		vehblips[vehname] = nil
		gps[vehname] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTEBOOKREMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.freezeVehicleNotebook(vehicle)
	while not HasAnimDictLoaded(animDict) do
		RequestAnimDict(animDict)
		Citizen.Wait(1)
	end

	if IsEntityAVehicle(vehicle) then
		FreezeEntityPosition(vehicle,true)
		TaskPlayAnim(PlayerPedId(),animDict,anim,3.0,3.0,-1,49,5.0,0,0,0)
		SetTimeout(60000,function()
			FreezeEntityPosition(vehicle,false)
			StopAnimTask(PlayerPedId(),animDict,anim,1.0)
		end)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.syncVehicle(vehicle)
	if NetworkDoesNetworkIdExist(vehicle) then
		local v = NetToVeh(vehicle)
		if DoesEntityExist(v) and IsEntityAVehicle(v) then
			Citizen.InvokeNative(0xAD738C3085FE7E11,v,true,true)
			SetEntityAsMissionEntity(v,true,true)
			SetVehicleHasBeenOwnedByPlayer(v,true)
			NetworkRequestControlOfEntity(v)
			Citizen.InvokeNative(0xEA386986E786A54F,Citizen.PointerValueIntInitialized(v))
			DeleteEntity(v)
			DeleteVehicle(v)
			SetEntityAsNoLongerNeeded(v)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCNAMEDELETE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.syncNameDelete(vehname)
	if vehicle[vehname] then
		vehicle[vehname] = nil
		if DoesBlipExist(vehblips[vehname]) then
			RemoveBlip(vehblips[vehname])
			vehblips[vehname] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RETURNVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.returnVehicle(name)
	return vehicle[name]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEANCHOR
-----------------------------------------------------------------------------------------------------------------------------------------
local vehicleanchor = false
function src.vehicleAnchor(vehicle)
	local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),393.26,-1618.58,29.3,true)
	if IsEntityAVehicle(vehicle) then
		if distance <= 20 then
			if vehicleanchor then
				TriggerEvent("Notify","aviso","Veículo destravado.",8000)
				FreezeEntityPosition(vehicle,false)
				vehicleanchor = false
			else
				TriggerEvent("Notify","aviso","Veículo travado.",8000)
				FreezeEntityPosition(vehicle,true)
				vehicleanchor = true
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BOATANCHOR
-----------------------------------------------------------------------------------------------------------------------------------------
local boatanchor = false
function src.boatAnchor(vehicle)
	if IsEntityAVehicle(vehicle) and GetVehicleClass(vehicle) == 14 then
		if boatanchor then
			TriggerEvent("Notify","aviso","Barco desancorado.",8000)
			FreezeEntityPosition(vehicle,false)
			boatanchor = false
		else
			TriggerEvent("Notify","aviso","Barco ancorado.",8000)
			FreezeEntityPosition(vehicle,true)
			boatanchor = true
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTONCLICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "exit" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("myVehicles",function(data,cb)
	local vehicles = vSERVER.myVehicles(workgarage)
	if vehicles then
		cb({ vehicles = vehicles })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COOLDOWN
-----------------------------------------------------------------------------------------------------------------------------------------
local cooldown = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if cooldown > 0 then
			cooldown = cooldown - 1
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('spawnVehicles',function(data)
    if cooldown < 1 then
        cooldown = 3
        vSERVER.spawnVehicles(data.name,parseInt(pointspawn))
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('deleteVehicles',function(data)
    if cooldown < 1 then
        cooldown = 3
        vSERVER.deleteVehicles()
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLECLIENTLOCK
-----------------------------------------------------------------------------------------------------------------------------------------
function src.vehicleClientLock(vehid,lock)
	if NetworkDoesNetworkIdExist(vehid) then
		local v = NetToVeh(vehid)
		if DoesEntityExist(v) and IsEntityAVehicle(v) then
			if lock == 1 then
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
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLECLIENTTRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
function src.vehicleClientTrunk(vehid,trunk)
	if NetworkDoesNetworkIdExist(vehid) then
		local v = NetToVeh(vehid)
		if DoesEntityExist(v) and IsEntityAVehicle(v) then
			if trunk then
				SetVehicleDoorShut(v,5,0)
			else
				SetVehicleDoorOpen(v,5,0,0)
			end
		end
	end
end

--[ BUTTONS ]----------------------------------------------------------------------------------------------------------------------------

RegisterKeyMapping('vrp_garages:lock', '[V] Trancar/destrancar veiculo', 'keyboard', 'L')


RegisterCommand("vrp_garages:lock",function(source,args,custom)
	local ped = PlayerPedId()
	local vehicle = vRP.getNearestVehicle(5)
	if vehicle then
		if cooldown < 1 then
			cooldown = 3
			vSERVER.vehicleLock()
		end
	end
end, false)


local select = nil
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local idle = 1000
		if cooldown < 1 then
			local ped = PlayerPedId()
			if not IsPedInAnyVehicle(ped) then
				local playerCoords = GetEntityCoords(ped)
				if select then
					if #(playerCoords - garages.garages[select].coords) < 10.5 then
						idle = 5
						DrawText3D(garages.garages[select].coords.x,garages.garages[select].coords.y,garages.garages[select].coords.z, texto)
						-- DrawMarker(27,garages.garages[select].coords.x,garages.garages[select].coords.y,garages.garages[select].coords.z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,102, 0, 255,155,0,0,0,1)
						if #(playerCoords - garages.garages[select].coords) <= 1.5 then -- Range de abertura da garagem (Distancia)
							if IsControlJustPressed(0,38) then
								vSERVER.returnHouses(garages.garages[select].name,select)
							end
						end
					else
						select = nil
					end
				else
					for k,v in pairs(garages.garages) do
						if #(playerCoords - v.coords) <= 10.5 then
							select = k
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCDOORSEVERYONE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.syncVehiclesEveryone(veh,status)
	SetVehicleDoorsLocked(veh,status)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPARAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('reparar')
AddEventHandler('reparar',function()
	local vehicle = vRP.getNearestVehicle(3)
	if IsEntityAVehicle(vehicle) then
		TriggerServerEvent("tryreparar",VehToNet(vehicle))
	end
end)

RegisterNetEvent('syncreparar')
AddEventHandler('syncreparar',function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		local fuel = GetVehicleFuelLevel(v)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				SetVehicleFixed(v)
				SetVehicleDirtLevel(v,0.0)
				SetVehicleUndriveable(v,false)
				Citizen.InvokeNative(0xAD738C3085FE7E11,v,true,true)
				SetVehicleOnGroundProperly(v)
				SetVehicleFuelLevel(v,fuel)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPARAR MOTOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('repararmotor')
AddEventHandler('repararmotor',function()
	local vehicle = vRP.getNearestVehicle(3)
	if IsEntityAVehicle(vehicle) then
		TriggerServerEvent("trymotor",VehToNet(vehicle))
	end
end)

RegisterNetEvent('syncmotor')
AddEventHandler('syncmotor',function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				SetVehicleEngineHealth(v,1000.0)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RETURNLIVERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.returnlivery(vehicle,livery)
	local ped = PlayerPedId()
	local vehicle = vRP.getNearestVehicle(5)
	local livery = GetVehicleLivery(vehicle)
	return livery
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GET HASH
-----------------------------------------------------------------------------------------------------------------------------------------
function src.getHash(vehiclehash)
    local vehicle = vRP.getNearestVehicle(7)
    local vehiclehash = GetEntityModel(vehicle)
    return vehiclehash
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end