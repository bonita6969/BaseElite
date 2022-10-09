local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONNECTION ]----------------------------------------------------------------------------------------------------------------

emp3 = Tunnel.getInterface("vrp_milkman-delivery")

--[ VARIABLES ]-----------------------------------------------------------------------------------------------------------------

local check = 0
local blips = false
local working = false
local hour = 0

--[ FUNCTION ]------------------------------------------------------------------------------------------------------------------

function CalculateTimeToDisplay()
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
			local bowz,cdz = GetGroundZFor_3dCoord(configmilkmand.ini.x,configmilkmand.ini.y,configmilkmand.ini.z)
			local distance = Vdist(configmilkmand.ini.x,configmilkmand.ini.y,configmilkmand.ini.z,x,y,z)
			local lastVehicle = GetEntityModel(GetPlayersLastVehicle())
			if distance < 15.1 then
				idle = 5
				-- DrawMarker(21,configmilkmand.ini.x,configmilkmand.ini.y,configmilkmand.ini.z-0.6,0,0,0,0,0,0,1.0,1.0,0.5,222, 67, 11, 180,0,0,0,0)
				DrawText3D(configmilkmand.ini.x,configmilkmand.ini.y,configmilkmand.ini.z, textomilkman)
				if distance <= 1.2 then
					-- drawTexts("PRESSIONE  E  PARA INICIAR ENTREGAS",4,0.5,0.92,0.35,255,255,255,180)
					if IsControlJustPressed(1,38) then
						if not working then
							working = true
							threadmilkman()
							threadmilkman1()
							check = math.random(#configmilkmand.deliverys)
							makeBlipsServicesMilk()
							TriggerEvent("Notify","sucesso","Entregas iniciada com <b>sucesso</b>.",8000)
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

--[ THREAD ]--------------------------------------------------------------------------------------------------------------------
function threadmilkman()
Citizen.CreateThread(function()
	while working do
		local idle = 1000
		local ped = PlayerPedId()
		if working then
			if not IsPedInAnyVehicle(ped) then
				local x,y,z = table.unpack(GetEntityCoords(ped))
				local distance = Vdist(configmilkmand.deliverys[check][1],configmilkmand.deliverys[check][2],configmilkmand.deliverys[check][3],x,y,z)
				if distance < 15.1 then
					idle = 5
					DrawMarker(21,configmilkmand.deliverys[check][1],configmilkmand.deliverys[check][2],configmilkmand.deliverys[check][3]-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,222, 67, 11, 180,0,0,0,1)
					if distance <= 1.2 then
						drawTexts("PRESSIONE  G  PARA ENTREGAR GARRAFAS DE LEITE",4,0.5,0.93,0.50,255,255,255,180)
						if IsControlJustPressed (1,47) then
							if emp3.startPayments() then
								RemoveBlip(blips)
								check = math.random(#configmilkmand.deliverys)
								makeBlipsServicesMilk()
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
function threadmilkman1()
Citizen.CreateThread(function()
	while working do
		local idle=1000
		if working then
			idle=5
			if IsControlJustPressed(0,168) then
					working = false
					RemoveBlip(blips)
					TriggerEvent("Notify","importante","Você saiu de serviço.",8000)
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

function makeBlipsServicesMilk()
	blips = AddBlipForCoord(configmilkmand.deliverys[check][1],configmilkmand.deliverys[check][2],configmilkmand.deliverys[check][3])
	SetBlipSprite(blips,1)
	SetBlipColour(blips,27)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entregas")
	EndTextCommandSetBlipName(blips)
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