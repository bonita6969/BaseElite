local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONNECTION ]----------------------------------------------------------------------------------------------------------------

emp7 = Tunnel.getInterface("emp_lumberjack")

--[ VARIABLES ]-----------------------------------------------------------------------------------------------------------------

local processo = false
local segundos = 0
local list = {}

--[ THREAD ]--------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		if not processo then
			for _,func in pairs(configlumberjack.trees) do
				local ped = PlayerPedId()
				local i,x,y,z = table.unpack(func)
				local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),x,y,z)
				local vehicle = GetPlayersLastVehicle()
				if distancia <= 10 and list[i] == nil then
					idle = 5
					DrawMarker(21,x,y,z,0,0,0,0,180.0,130.0,0.5,0.5,0.5,222, 67, 11,180,1,0,0,1)
					if distancia <= 1.2 then
						if GetSelectedPedWeapon(ped) == GetHashKey(configlumberjack.axe) or GetSelectedPedWeapon(ped) == GetHashKey(configlumberjack.axe) then
							print(1)
							if IsControlJustPressed(0,47) and emp7.checkPayment() then
								if emp7.checkPayment() then
									list[i] = true
									processo = true
									lenhador()
									segundos = 3
									SetEntityCoords(ped,x,y,z-1)
									SetEntityHeading(ped,100.0)
									vRP._playAnim(false,{{"melee@hatchet@streamed_core","plyr_front_takedown_b"}},true)
									TriggerEvent('cancelando',true)
								end
							end
						end
					end
				end
			end
		end
		if processo then
			idle = 5
			drawTxt("AGUARDE ~g~"..segundos.."~w~ SEGUNDOS ATÉ FINALIZAR A EXTRAÇÃO DA MADEIRA",4,0.5,0.92,0.35,255,255,255,180)
		end
		Citizen.Wait(idle)
	end
end)

--[ CANCEL | THREAD ]--------------------------------------------------------------------------------------------------------------------
function lenhador()
Citizen.CreateThread(function()
	while processo do
		local idle = 1000
		if processo then
			if segundos > 0 then
				segundos = segundos - 1
				if segundos == 0 then
					processo = false
					vRP._stopAnim(false)
					TriggerEvent('cancelando',false)
				end
			end
		end
		Citizen.Wait(1000)
	end
end)
end
--[ FUNCTION ]--------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(180000)
		list = {}
	end
end)

--[ FUNCTION ]------------------------------------------------------------------------------------------------------------------

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