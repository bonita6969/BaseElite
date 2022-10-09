local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONNECTION ]----------------------------------------------------------------------------------------------------------------

emp5 = Tunnel.getInterface("emp_postman-delivery")

--[ VARIABLES ]-----------------------------------------------------------------------------------------------------------------

local check = 0
local blips = false
local inService = false
local time = 0

--[ TIME | FUNCTION ]-----------------------------------------------------------------------------------------------------------

function CalculateTimeToDisplays()
	time = GetClockHours()
	if time <= 9 then
		time = "0" .. time
	end
end

--[ START DELIVERY | THREAD ]---------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local distance = Vdist(config.postmanloc.x,config.postmanloc.y,config.postmanloc.z,x,y,z)
			local lastVehicle = GetEntityModel(GetPlayersLastVehicle())
			if distance < 10.1 then
				idle = 5
				-- DrawMarker(21,config.postmanloc.x,config.postmanloc.y,config.postmanloc.z-0.6,0,0,0,0,0,0,1.0,1.0,0.5,222, 67, 11, 180,0,0,0,0)
				DrawText3D(config.postmanloc.x,config.postmanloc.y,config.postmanloc.z, textopostmands)
				if distance < 1.2 then
					if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), config.postmanloc.x,config.postmanloc.y,config.postmanloc.z, true ) <= 1.1  then
						-- DrawText3D(config.postmanloc.x,config.postmanloc.y,config.postmanloc.z, "Pressione [G] para iniciar a entrega das ~p~ENCOMENDAS~w~.")
					end
					if IsControlJustPressed(1,47) and not inService then
						if lastVehicle == config.postmanveh and emp5.checkPlate(lastVehicle) then
							inService = true
							postamanthread1()
							postamanthread2()
							check = math.random(#config.postmandeliverys)
							makeBlipsServices()
							TriggerEvent("Notify","sucesso","<b>Rota</b> iniciada.",8000)
						else
							TriggerEvent("Notify","negado","Você precisa do <b>veículo de entregas</b> para fazer isso.")
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

--[ DELIVER ORDER | THREAD ]----------------------------------------------------------------------------------------------------
function postamanthread1()
Citizen.CreateThread(function()
	while inService do
		local idle = 1000
		local ped = PlayerPedId()
		if inService then
			if not IsPedInAnyVehicle(ped) then
				local x,y,z = table.unpack(GetEntityCoords(ped))
				local distance = Vdist(config.postmandeliverys[check][1],config.postmandeliverys[check][2],config.postmandeliverys[check][3],x,y,z)
				local lastVehicle = GetEntityModel(GetPlayersLastVehicle())
				if distance < 10.1 then
					idle = 5
					DrawMarker(21, config.postmandeliverys[check][1],config.postmandeliverys[check][2],config.postmandeliverys[check][3]-0.6, 0, 0, 0, 0, 180.0, 130.0, 0.6, 0.8, 0.5, 222, 67, 11, 100, 1, 0, 0, 1)
					if distance < 1.2 then
						if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),config.postmandeliverys[check][1],config.postmandeliverys[check][2],config.postmandeliverys[check][3], true ) <= 1.1  then
							DrawText3D(config.postmandeliverys[check][1],config.postmandeliverys[check][2],config.postmandeliverys[check][3], "Pressione [E] para entregar as ~p~ENCOMENDAS~w~.")
						end
						if IsControlJustPressed(1,38) then
							if lastVehicle == config.postmanveh and emp5.checkPlate(lastVehicle) then
								if emp5.startPayments() then
									RemoveBlip(blips)
									check = math.random(#config.postmandeliverys)
									makeBlipsServices()
								end
							else
								TriggerEvent("Notify","negado","Você precisa do <b>veículo de entregas</b> para fazer isso.")
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
--[ CANCEL SERVICE | THREAD ]---------------------------------------------------------------------------------------------------
function postamanthread2()
Citizen.CreateThread(function()
	while true do
		local idle=1000
		if inService then
			idle=5
			if IsControlJustPressed(0,168) then
					inService = false
					RemoveBlip(blips)
					TriggerEvent("Notify","importante","Você saiu de serviço.",8000)
			end
		end
		Citizen.Wait(idle)
	end
end)
end
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

--[ BLIP | FUNCTION ]-----------------------------------------------------------------------------------------------------------

function makeBlipsServices()
	blips = AddBlipForCoord(config.postmandeliverys[check][1],config.postmandeliverys[check][2],config.postmandeliverys[check][3])
	SetBlipSprite(blips,1)
	SetBlipColour(blips,27)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Encomendas")
	EndTextCommandSetBlipName(blips)
end

