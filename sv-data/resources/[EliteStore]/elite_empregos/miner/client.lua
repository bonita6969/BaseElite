local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONNECTION ]----------------------------------------------------------------------------------------------------------------

emp11 = Tunnel.getInterface("emp_miner")

--[ VARIABLES ]-----------------------------------------------------------------------------------------------------------------

local working = false
local selected = 1
local process = false

--[ IN WORKING AREA | THREAD ]--------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		if not working then
			local ped = PlayerPedId()
			if not IsPedInAnyVehicle(ped) then
				local x,y,z = table.unpack(GetEntityCoords(ped))
				local distance = Vdist(x, y, z, configminer.rocks[selected].x, configminer.rocks[selected].y, configminer.rocks[selected].z)
				local lastVehicle = GetEntityModel(GetPlayersLastVehicle())
				if distance <= 100.0 then
					idle = 5
					DrawMarker(21, configminer.rocks[selected].x, configminer.rocks[selected].y, configminer.rocks[selected].z-0.3, 0, 0, 0, 0, 180.0, 130.0, 0.6, 0.8, 0.5, 255, 255, 0, 100, 1, 0, 0, 1)
					if distance <= 1.2 and IsControlJustPressed(1,38) then
						if lastVehicle == configminer.lastveh and emp11.checkPlate(lastVehicle) then
							if emp11.checkWeight() then
								working = true
								vRP.DeletarObjeto()
								TriggerEvent("cancelando",true)
								SetEntityCoords(ped, configminer.rocks[selected].x+0.0001, configminer.rocks[selected].y+0.0001, configminer.rocks[selected].z+0.0001-1, 1, 0, 0, 1)
								vRP.CarregarObjeto("amb@world_human_const_drill@male@drill@base", "base","prop_tool_jackham", 15, 28422)
								
								SetTimeout(10000,function()
									working = false
									vRP.DeletarObjeto()
									vRP._stopAnim(false)
									TriggerEvent("cancelando",false)
									backentrega = selected
									while true do
										if backentrega == selected then
											selected = math.random(#configminer.rocks)
										else
											break
										end
										Citizen.Wait(10)
									end
									emp11.collectOres()
								end)
							else
								TriggerEvent("Notify","negado","<b>Ferramenta</b> ou <b>espaço na mochila</b> insuficientes.")	
							end
						else
							TriggerEvent("Notify","negado","Você precisa do <b>veículo da mineradora</b> para fazer isso.")
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

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