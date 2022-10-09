local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONNECTION ]----------------------------------------------------------------------------------------------------------------

emp6 = Tunnel.getInterface("emp_driver")

--[ VARIABLES ]-----------------------------------------------------------------------------------------------------------------

local emservico = false

--[ FUNCTION ]------------------------------------------------------------------------------------------------------------------

function CalculateTimeToDisplay6()
	hour = GetClockHours()
	if hour <= 9 then
		hour = "0" .. hour
	end
end

--[ THREAD ]-----------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		if not emservico then
			for _,v in pairs(configdriver.start) do
				local ped = PlayerPedId()
				local x,y,z = table.unpack(GetEntityCoords(ped))
				local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
				local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
				local lastVehicle = GetEntityModel(GetPlayersLastVehicle())
					if distance <= 3 then
						idle = 5
						-- DrawMarker(21,v.x,v.y,v.z-0.6,0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.5, 222, 67, 11, 100, 0, 0, 0, 0)
						DrawText3D(v.x,v.y,v.z, textodriver)
						if distance <= 1.2 then
							idle = 5
							-- drawTxt("PRESSIONE  E  PARA INICIAR A ROTA",4,0.5,0.92,0.35,255,255,255,180)
							if IsControlJustPressed(1,38) then
								emservico = true
								empdriver()
								empdriver1()
								if v.id == 2 then
									destino = 28
								else
									destino = 1
								end
								criandoblip(configdriver.route,destino)
								TriggerEvent("Notify","sucesso","Você entrou em serviço.")
							end
						end
					end
				end
			end
		Citizen.Wait(idle)
	end
end)

--[ DELIVERY ]-----------------------------------------------------------------------------------------------------------------
function empdriver()
Citizen.CreateThread(function()
	while emservico do
		local idle = 1000
		local ped = PlayerPedId()
		if emservico then
			idle = 5
			if IsPedInAnyVehicle(ped) then
				local vehicle = GetVehiclePedIsIn(ped)
				local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),configdriver.route[destino].x,configdriver.route[destino].y,configdriver.route[destino].z,true)
				if distance <= 50 then
					idle = 5
					DrawMarker(21,configdriver.route[destino].x,configdriver.route[destino].y,configdriver.route[destino].z+0.20,0,0,0,0,180.0,130.0,2.0,2.0,1.0,222, 67, 11, 11,1,0,0,1)
					if distance <= 4 then
						if IsVehicleModel(GetVehiclePedIsUsing(GetPlayerPed(-1)),GetHashKey(configdriver.bus)) or IsVehicleModel(GetVehiclePedIsUsing(GetPlayerPed(-1)),GetHashKey(configdriver.bus1)) then
							RemoveBlip(blip)
							if destino == 27 then
								emp6.checkPayment(20)
								destino = 1
							elseif destino == 54 then
								destino = 28
							else
								emp6.checkPayment(20)
								destino = destino + 1
							end
							criandoblip(configdriver.route,destino)
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)
end
--[ CANCEL | THREAD ]--------------------------------------------------------------------------------------------------------------------
function empdriver1()
Citizen.CreateThread(function()
	while emservico do
		local idle=1000
		if emservico then
			idle=5
			if IsControlJustPressed(0,168) then
					emservico = false
					RemoveBlip(blip)
					TriggerEvent("Notify","importante","Você saiu de serviço.",8000)
			end
		end
		Citizen.Wait(idle)
	end
end)
end

--[ FUNCTION ]--------------------------------------------------------------------------------------------------------

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

function criandoblip(entregas,destino)
	blip = AddBlipForCoord(configdriver.route[destino].x,configdriver.route[destino].y,configdriver.route[destino].z)
	SetBlipSprite(blip,1)
	SetBlipColour(blip,27)
	SetBlipScale(blip,0.4)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Rota de Motorista")
	EndTextCommandSetBlipName(blip)
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