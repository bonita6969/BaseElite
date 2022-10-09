local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
EMP = Tunnel.getInterface("desmanche")
vGARAGE = Tunnel.getInterface("elite_garages")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local segundos = 0
local roubando = false
local CoordenadaX = 1550.14 -- 1550.14, 3513.47, 36.01
local CoordenadaY = 3513.47
local CoordenadaZ = 31.00

local sleep
local sleep2
local sleep3
local sleep4
local sleep5

local tVehicle
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS  
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = { 
	{ ['x'] = 1535.92, ['y'] = 3545.8, ['z'] = 36.53, ['perm'] = "thelost.permissao" },
	{ ['x'] = 1533.78, ['y'] = 3534.89, ['z'] = 35.39, ['perm'] = "thelost.permissao" },

}  
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESMANCHE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		sleep = 1000
		if not roubando then
			for _,v in pairs(locais) do
				local ped = PlayerPedId()
				local x,y,z = table.unpack(v)
				local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),v.x,v.y,v.z)
				if distance <= 50 and GetPedInVehicleSeat(GetVehiclePedIsUsing(ped),-1) == ped then
					sleep = 5
					DrawMarker(23,v.x,v.y,v.z-0.96,0,0,0,0,0,0,5.0,5.0,0.5,255,0,0,50,0,0,0,0)
					if distance <= 3.1 then
						if IsControlJustPressed(0,38) and EMP.checkPermission(v.perm) then
							if EMP.checkVehicle() then
								tVehicle = EMP.tipoVeiculo()
								roubando = true
								segundos = 40
								FreezeEntityPosition(GetVehiclePedIsUsing(ped),true)

								repeat
									Citizen.Wait(10)
								until segundos == 0

								roubando = false
							end
						end
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- VENDER PEÇAS
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- VENDER PEÇAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		sleep2 = 1000
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
		local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
		local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)
				
		if distance <= 30.0 then
			sleep2 = 5
			DrawMarker(21,CoordenadaX,CoordenadaY,CoordenadaZ-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,153,0,153,50,0,0,0,1)
			if distance <= 1.2 then
				DrawText3D(CoordenadaX, CoordenadaY, CoordenadaZ-0.50, "PRESSIONE  [~r~E~w~]  PARA ~r~VENDER AS PEÇAS ILEGAIS~w~.")
				if IsControlJustPressed(0,38) then
					EMP.checkPayment()
				end
			end	
		end
		Citizen.Wait(sleep2)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TEXTO
----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if roubando then
			local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			if tVehicle == "carros" or tVehicle == "import" or tVehicle == "exclusive" then
				if segundos > 19 and segundos < 33 then
					TriggerEvent("Notify","importante","Abrindo a Porta da Frente Esquerda.")
					SetVehicleDoorOpen(veh,0,0,0)
					Citizen.Wait(2000)
					TriggerEvent("Notify","importante","Abrindo a Porta da Frente Direita.")	
					SetVehicleDoorOpen(veh,1,0,0)
					Citizen.Wait(2000)
					TriggerEvent("Notify","importante","Verificando as rodas.")	
					Citizen.Wait(2000)
					TriggerEvent("Notify","importante","Abrindo o Capo para verificar o motor.")	
					SetVehicleDoorOpen(veh,4,0,0)
					Citizen.Wait(2000)
					TriggerEvent("Notify","importante","Verificando os discos de freio.")	
					Citizen.Wait(2000)
					TriggerEvent("Notify","importante","Verificando a qualidade da placa do veículo.")	
					Citizen.Wait(5000)
				elseif segundos <= 16 and segundos >= 4 then
					Citizen.Wait(2000)
					TriggerEvent("Notify","sucesso","Removido a Porta da Frente Esquerda.")
					SetVehicleDoorBroken(veh, 0	, false)
					Citizen.Wait(2000)
					TriggerEvent("Notify","sucesso","Removido a Porta da Frente Direita.")	
					Citizen.Wait(1000)
					TriggerEvent("Notify","aviso","Portas traseiras não puderam ser aproveitadas.")	
					SetVehicleDoorBroken(veh, 1	, false)
					Citizen.Wait(2000)
					TriggerEvent("Notify","sucesso","Removendo as rodas.")	
					SetVehicleTyreBurst(veh,0,true,1000.0)
					SetVehicleTyreBurst(veh,1,true,1000.0)
					SetVehicleTyreBurst(veh,2,true,1000.0)
					SetVehicleTyreBurst(veh,3,true,1000.0)
					SetVehicleTyreBurst(veh,4,true,1000.0)
					SetVehicleTyreBurst(veh,5,true,1000.0)
					SetVehicleTyreBurst(veh,6,true,1000.0)
					SetVehicleTyreBurst(veh,7,true,1000.0)
					Citizen.Wait(2000)
					TriggerEvent("Notify","sucesso","Removendo o motor.")	
					SetVehicleDoorBroken(veh, 4	, false)
					Citizen.Wait(2000)
					TriggerEvent("Notify","sucesso","Removendo os discos de freio.")	
					Citizen.Wait(2000)
					TriggerEvent("Notify","sucesso","Removendo a placa.")	
					Citizen.Wait(4000)
					TriggerEvent("Notify","sucesso","Veiculo desmontado.")
					TriggerEvent("Notify","importante","Peças recebidas.")
				end
			else
				if segundos > 19 and segundos < 33 then
					TriggerEvent("Notify","importante","Verificando os discos de freio.")
					Citizen.Wait(3000)
					TriggerEvent("Notify","importante","Verificando as rodas.")	
					Citizen.Wait(3000)
					TriggerEvent("Notify","importante","Verificando o motor.")
					Citizen.Wait(3000)
					TriggerEvent("Notify","importante","Verificando a qualidade da placa do veículo.")	
					Citizen.Wait(6000)
				elseif segundos <= 16 and segundos >= 4 then
					SetVehicleTyreBurst(veh,0,true,1000.0)
					SetVehicleTyreBurst(veh,4,true,1000.0)
					TriggerEvent("Notify","sucesso","Removido as rodas.")	
					Citizen.Wait(3000)
					TriggerEvent("Notify","sucesso","Removido o motor.")	
					Citizen.Wait(3000)
					TriggerEvent("Notify","sucesso","Removido os discos de freio.")	
					Citizen.Wait(3000)
					TriggerEvent("Notify","sucesso","Removido a placa.")	
					Citizen.Wait(7000)
					TriggerEvent("Notify","sucesso","Veiculo desmontado.")
					TriggerEvent("Notify","importante","Peças recebidas.")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESMANCHAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('desmancharVehicle')
AddEventHandler('desmancharVehicle', function(vehicle)
	if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
		saveVehInfo(vehicle)
		Citizen.InvokeNative(0xAD738C3085FE7E11,v,true,true)
		SetEntityAsMissionEntity(vehicle,true,true)
		SetVehicleHasBeenOwnedByPlayer(vehicle,true)
		NetworkRequestControlOfEntity(vehicle)
		Citizen.InvokeNative(0xEA386986E786A54F,Citizen.PointerValueIntInitialized(vehicle))
		DeleteEntity(vehicle)
		DeleteVehicle(vehicle)
		SetEntityAsNoLongerNeeded(vehicle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVE VEH INFO
-----------------------------------------------------------------------------------------------------------------------------------------
function saveVehInfo(v)
    if not v then return end
    local hash = GetEntityModel(v)
    local plate, engine, body, fuel, vnet =  GetVehicleNumberPlateText(v), parseInt(GetVehicleEngineHealth(v)), 
    parseInt(GetVehicleBodyHealth(v)), parseInt(GetVehicleFuelLevel(v)), VehToNet(v)
    local vehDoors = {}
    for i = 0,5 do
        vehDoors[i] = IsVehicleDoorDamaged(v,i)
    end
    local vehWindows = {}
    for i = 0,7 do
        vehWindows[i] = IsVehicleWindowIntact(v,i)
    end
    local vehTyres = {}
    for i = 0,7 do
        local tyre_state = 2
        if IsVehicleTyreBurst(v,i,true) then
            tyre_state = 1
        elseif IsVehicleTyreBurst(v,i,false) then
            tyre_state = 0
        end
        vehTyres[i] = tyre_state
    end
    local estado = { doors = vehDoors, windows = vehWindows, tyres = vehTyres }
    Citizen.CreateThread(function()
        if plate then
            plate = string.gsub(plate, "%s+", "")
        end
        local vehInfo = vGARAGE.getVehicleInfo(hash)
        if vehInfo and plate and engine and body and fuel then
            EMP.saveVehicle(vehInfo.name, plate, engine, body, fuel, estado)
        end
        TriggerServerEvent("nyo_fuel:delVehicle", vnet)
    end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TEXTO
----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if roubando then
			DisableControlAction(0,75,true)	
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if roubando then
			local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			if segundos >= 33 then
				drawTxt("AGUARDE ~g~"..segundos.." SEGUNDOS~w~, ESTAMOS DESATIVANDO O ~y~RASTREADOR ~w~DO VEÍCULO",4,0.50,0.87,0.50,255,255,255,180)
			elseif segundos > 19 and segundos < 33 then
				drawTxt("AGUARDE ~g~"..segundos.." SEGUNDOS~w~, ESTAMOS CALCULANDO PEÇAS",4,0.50,0.87,0.50,255,255,255,180)
			elseif segundos < 19 and segundos > 16 then
				drawTxt("AGUARDE ~g~"..segundos.." SEGUNDOS~w~, PEÇAS CALCULADAS",4,0.50,0.87,0.50,255,255,255,180)
			elseif segundos <= 16 and segundos >= 4 then
				drawTxt("AGUARDE ~g~"..segundos.." SEGUNDOS~w~, DESMANCHANDO ",4,0.50,0.87,0.50,255,255,255,180)
			elseif segundos < 4 then
				drawTxt("AGUARDE ~g~"..segundos.." SEGUNDOS~w~, FINALIZANDO DESMANCHE ",4,0.50,0.87,0.50,255,255,255,180)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIMINUINDO O TEMPO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if roubando then
			if segundos > 0 then
				segundos = segundos - 1
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end