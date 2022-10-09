local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONNECTION ]----------------------------------------------------------------------------------------------------------------

emp4 = Tunnel.getInterface("emp_postman")

--[ VARIABLES ]-----------------------------------------------------------------------------------------------------------------

local process = false

--[ TIME | FUNCTION ]-----------------------------------------------------------------------------------------------------------

local time = 0
function CalculateTimeToDisplay5()
	time = GetClockHours()
	if time <= 9 then
		time = "0" .. time
	end
end

--[ PROCESS | THREAD ]----------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local x,y,z = table.unpack(GetEntityCoords(ped))
			if Vdist(configpostman.startpostman.x,configpostman.startpostman.y,configpostman.startpostman.z,x,y,z) < 5.1 then
				idle = 5
				-- DrawMarker(21, configpostman.startpostman.x, configpostman.startpostman.y, configpostman.startpostman.z-0.6, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.5, 222, 67, 11, 100, 0, 0, 0, 0)
				DrawText3D(configpostman.startpostman.x, configpostman.startpostman.y, configpostman.startpostman.z, textopostman)
				if Vdist(configpostman.startpostman.x,configpostman.startpostman.y,configpostman.startpostman.z,x,y,z) <= 1.2 then
					if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), configpostman.startpostman.x,configpostman.startpostman.y,configpostman.startpostman.z, true ) <= 1.1  then
						-- DrawText3D(configpostman.startpostman.x,configpostman.startpostman.y,configpostman.startpostman.z, "Pressione [E] para empacotar as ~p~ENCOMENDAS~w~.")
					end
					if IsControlJustPressed(1,38) then
						if not process then
								if emp4.checkWeight() then
									process = true
									TriggerEvent('cancelando',true)
									TriggerEvent("progress",2000,"Coletando")
									FreezeEntityPosition(ped,true)
									vRP._playAnim(false,{{configpostman.animpostman,configpostman.animname}},true)
									SetTimeout(2000,function()
										process = false
										TriggerEvent('cancelando',false)
										emp4.giveOrders()
										FreezeEntityPosition(ped,false)
										vRP._stopAnim(false)
									end)
								end
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

--[ TEXT | FUNCTION ]-----------------------------------------------------------------------------------------------------------

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