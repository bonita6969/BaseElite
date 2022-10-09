local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONNECTION ]----------------------------------------------------------------------------------------------------------------

empfarmer = Tunnel.getInterface("vrp_farmer-delivery")

--[ VARIABLES ]-----------------------------------------------------------------------------------------------------------------

local check = 0
local blips = false
local working = false
local hour = 0

--[ FUNCTION ]------------------------------------------------------------------------------------------------------------------

function CalculateTimeToDisplay3()
	hour = GetClockHours()
	if hour <= 9 then
		hour = "0" .. hour
	end
end

--[ THREAD ]--------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(configfarmerd.ini.x,configfarmerd.ini.y,configfarmerd.ini.z)
			local distance = Vdist(configfarmerd.ini.x,configfarmerd.ini.y,configfarmerd.ini.z,x,y,z)
			local lastVehicle = GetEntityModel(GetPlayersLastVehicle())
			if distance < 15.1 then
				idle = 5
				DrawMarker(23,configfarmerd.ini.x,configfarmerd.ini.y,configfarmerd.ini.z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,136, 96, 240, 180,0,0,0,0)
				if distance <= 1.2 then
					drawTexts("PRESSIONE  G  PARA INICIAR ENTREGAS",4,0.5,0.92,0.35,255,255,255,180)
					if IsControlJustPressed(1,47) then
						if lastVehicle == configfarmerd.lastve then
							-- if empfarmer.checkCrimeRecord() then
								if not working then
									working = true
									empfarmerr()
									empfarmerr1()
									check = math.random(#configfarmerd.deliverys)
									makeBlipsServices2()
									TriggerEvent("Notify","sucesso","Entregas iniciada com <b>sucesso</b>.",8000)
								end
							-- else
							-- 	TriggerEvent("Notify","importante","Sua ficha criminal se encontra suja.",8000)
							-- end
						else
							TriggerEvent("Notify","importante","Veiculo inválido.",8000)
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

--[ THREAD ]--------------------------------------------------------------------------------------------------------------------

function empfarmerr()
Citizen.CreateThread(function()
	while working do
		local idle = 1000
		local ped = PlayerPedId()
		if working then
			if not IsPedInAnyVehicle(ped) then
				local x,y,z = table.unpack(GetEntityCoords(ped))
				local distance = Vdist(configfarmerd.deliverys[check][1],configfarmerd.deliverys[check][2],configfarmerd.deliverys[check][3],x,y,z)
				local lastVehicle = GetEntityModel(GetPlayersLastVehicle())local lastVehicle = GetEntityModel(GetPlayersLastVehicle())
				if distance < 15.1 then
					idle = 5
					DrawMarker(21,configfarmerd.deliverys[check][1],configfarmerd.deliverys[check][2],configfarmerd.deliverys[check][3]-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,136, 96, 240, 180,0,0,0,1)
					if distance <= 1.2 then
						drawTexts("PRESSIONE  G  PARA ENTREGAR GRAOS",4,0.5,0.93,0.50,255,255,255,180)
						if IsControlJustPressed(1,47) and lastVehicle == 1026149675 and empfarmer.checkPlate(lastVehicle) then			
							if empfarmer.startPayments() then
								RemoveBlip(blips)
								check = math.random(#configfarmerd.deliverys)
								makeBlipsServices2()
							end
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
function empfarmerr1()
Citizen.CreateThread(function()
	while working do
		local idle=1000
		if working then
			idle=5
			if IsControlJustPressed(0,168) then
					working = false
					RemoveBlip(blips)
					TriggerEvent("Notify","aviso","Você saiu de serviço.",8000)
			end
		end
		Citizen.Wait(idle)
	end
end)
end
--[ FUNCTION ]------------------------------------------------------------------------------------------------------------------

function drawTexts(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function makeBlipsServices2()
	blips = AddBlipForCoord(configfarmerd.deliverys[check][1],configfarmerd.deliverys[check][2],configfarmerd.deliverys[check][3])
	SetBlipSprite(blips,1)
	SetBlipColour(blips,27)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entregas")
	EndTextCommandSetBlipName(blips)
end