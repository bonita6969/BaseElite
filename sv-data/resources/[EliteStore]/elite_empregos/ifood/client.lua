local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
Ifoo = Tunnel.getInterface("ifood")
----------------------------------------------------------------------
-- VARIAVEIS
----------------------------------------------------------------------
local service = false -- não mexer
local object = nil -- não mexer
local pickvehicle = false -- não mexer
local carrypizza = false -- não mexer
local readydelivery = false -- não mexer
local pizza = 0 -- não mexer
local selected = 0 -- não mexer
local nveh = nil -- Não mexer
---------------------------------------------------------------------
-- [ FUNCTIONS ]
---------------------------------------------------------------------
function startRoute()
	selected = math.random(#cfg.homes)
	CreateBlip(selected)
end

function CreateBlip(route)
	blip = AddBlipForCoord(cfg.homes[route][1],cfg.homes[route][2],cfg.homes[route][3])
	SetBlipSprite(blip,162)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.4)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Rota das encomenda")
	EndTextCommandSetBlipName(blip)
end

-- function DrawText3D(x,y,z, text)
--     local onScreen,_x,_y=World3dToScreen2d(x,y,z)
--     local px,py,pz=table.unpack(GetGameplayCamCoords())
    
--     SetTextScale(0.35, 0.35)
--     SetTextFont(4)
--     SetTextProportional(1)
--     SetTextColour(255, 255, 255, 215)
--     SetTextEntry("STRING")
--     SetTextCentre(1)
--     AddTextComponentString(text)
--     DrawText(_x,_y)
-- 	local factor = (string.len(text)) / 370
--     DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 50)
-- end

function getMotorcyclePosition(radius)
	local ped = PlayerPedId()
	local coordsx = GetEntityCoords(ped, 1)
	local coordsy = GetOffsetFromEntityInWorldCoords(ped, 0.0, radius+0.00001, 0.0)
	local nearVehicle = GetMotorDirection(coordsx, coordsy)
	if IsEntityAVehicle(nearVehicle) then
	    return nearVehicle
	else
		local x,y,z = table.unpack(coordsx)
	    if IsPedSittingInAnyVehicle(ped) then
	        local veh = GetVehiclePedIsIn(ped,true)
	        return veh
	    else
	        local veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001,radius+0.0001,0,8192+4096+4+2+1) 
	        if not IsEntityAVehicle(veh) then 
	        	veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001,radius+0.0001,0,4+2+1) 
	        end 
	        return veh
	    end
	end
end

function GetMotorDirection(coordFrom,coordTo)
	local position = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, PlayerPedId(), 0)
	local a,b,c,d,vehicle = GetRaycastResult(position)
	return vehicle
end

function spawnPizza()
	object = CreateObject(GetHashKey(cfg.prop),cfg.spawnprop[1],cfg.spawnprop[2],cfg.spawnprop[3]-0.95,false,true,false)
	SetEntityAsMissionEntity(object)
	Wait(2000)
	TriggerEvent("Notify","aviso","Há uma nova entrega, retire no balcão da empresa")
end

function pickPizza()	
	TriggerEvent("emotes","pizza")
	carrypizza = true
	vRP.playSound("ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
	DeleteObject(object)
end

function putPizza()
	carrypizza = false
	ClearPedTasksImmediately(ped)
	vRP._DeletarObjeto()
	vRP.stopAnim(true)
end
---------------------------------------------------------------------
-- NÃO CORRER COM A PIZZA NA MÃO (NÃO MEXER)
---------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
	    local timedistance = 1000

		if carrypizza then
			timedistance = 5
			DisableControlAction(0,21,true)
		end

	    Citizen.Wait(timedistance)
	end
end)
---------------------------------------------------------------------
-- SAIR DE SERVIÇO (NÃO MEXER)
---------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
    	local timedistance = 1000
    	local ped = PlayerPedId()

        if service then
			drawTxt("PRESSIONE ~g~F7 ~w~PARA FINALIZAR O EXPEDIENTE",4,0.260,0.905,0.5,255,255,255,200)
			drawTxt("~w~ PROSSIGA ATE O SEU DESTINO ",4,0.260,0.929,0.5,255,255,255,200)
            timedistance = 5
    		if IsControlJustPressed(0,168) then
                local veh = getMotorcyclePosition(2)
                local model = GetEntityModel(veh)

        			TriggerEvent("Notify","aviso","Você saiu de serviço")
        			DeleteObject(object)
					DeleteVehicle(nveh)
					RemoveBlip(blip)
        			nveh = nil
        			service = false
        			object = nil
        			pickvehicle = false
        			carrypizza = false
        			readydelivery = false
        			pizza = 0
        			selected = 0
                end
    		
    	end
        Citizen.Wait(timedistance)
	end
end)
---------------------------------------------------------------------
-- ENTREGAR A PIZZA
---------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timedistance = 1000
		local ped = PlayerPedId()
		local coords = vector3(GetEntityCoords(ped))

		if readydelivery then
			local distance = #(coords - vector3(cfg.homes[selected][1],cfg.homes[selected][2],cfg.homes[selected][3]))
			if distance <= 3 then
				timedistance = 5
				DrawMarker(21,cfg.homes[selected][1],cfg.homes[selected][2],cfg.homes[selected][3]-0.6,0,0,0,0.0,0,0,0.6,0.6,0.5,222, 67, 11,150,1,1,0,0)
				if IsControlJustPressed(0,47) and carrypizza then
					if pizza ~= 0 then
						RemoveBlip(blip)
						startRoute()
						putPizza()
						Ifoo.checkPayment()
					else
						RemoveBlip(blip)
						putPizza()
						readydelivery = false
						spawnPizza()
						Ifoo.checkPayment()
					end
				end
			end
		end
		Citizen.Wait(timedistance)
	end
end)
---------------------------------------------------------------------
-- PEGAR SERVIÇO (NÃO MEXER)
---------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timedistance = 1000
		local ped = PlayerPedId()
		local coords = vector3(GetEntityCoords(ped))
		if not service then
            local distance = #(coords - vector3(cfg.startservice[1],cfg.startservice[2],cfg.startservice[3]))
			if distance <= 2.0 then
				timedistance = 5
				-- DrawText3D(cfg.startservice[1],cfg.startservice[2],cfg.startservice[3]-0.3, "~g~G~w~ PARA INICIAR O ~g~ SERVIÇO")
				DrawText3D(cfg.startservice[1],cfg.startservice[2],cfg.startservice[3], textoifood)
				if IsControlJustPressed(0,47) then
					service = true
	                TriggerEvent("Notify","aviso","Trabalho iniciado com sucesso")
					Wait(2000)
					TriggerEvent("Notify","aviso","retire o veiculo do serviço na garagem")	
					Wait(2000)
					pickvehicle = true
					spawnPizza()
				end
			end
		end
		Citizen.Wait(timedistance)
	end
end)
---------------------------------------------------------------------
-- PEGAR A PIZZA DO BALCAO (NÃO MEXER)
---------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timedistance = 1000
		local ped = PlayerPedId()
		local coords = vector3(GetEntityCoords(ped))

		if pickvehicle and not carrypizza then
            local distance = #(coords - vector3(cfg.spawnprop[1],cfg.spawnprop[2],cfg.spawnprop[3]))

			if distance <= 2.0 then
				if pizza < 10 and not readydelivery then
					timedistance = 5
					DrawText3D(cfg.spawnprop[1],cfg.spawnprop[2],cfg.spawnprop[3]-0.6, "~g~G~w~ PARA ~g~PEGAR~w~")	

					if IsControlJustPressed(0,47) then
						pickPizza()
					end
				end
			end
		end
		Citizen.Wait(timedistance)
	end
end)
---------------------------------------------------------------------
-- COLOCAR OU TIRAR PIZZA DA CAIXA 
---------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timedistance = 1000
		local ped = PlayerPedId()
		local coords = vector3(GetEntityCoords(ped))

		if pickvehicle then
			local veh = getMotorcyclePosition(2)
			local PositionMotorcycle = GetOffsetFromEntityInWorldCoords(veh,0.0,-0.9,0.0)
            local distance = #(coords - vector3(PositionMotorcycle.x,PositionMotorcycle.y,PositionMotorcycle.z))

			if not IsPedInAnyVehicle(ped) and distance <= 2.0 then
				if carrypizza then
					timedistance = 5 
					DrawText3D(PositionMotorcycle.x,PositionMotorcycle.y,PositionMotorcycle.z+0.80,"~g~G~w~ PARA GUARDAR ~g~ ENCOMENDA "..pizza.."/10")
					if IsControlJustPressed(0,47) and GetEntityModel(veh) == cfg.vehiclejobhash then
						putPizza()
						pizza = pizza + 1
						if pizza == 10 and not readydelivery then
							TriggerEvent("Notify","aviso","Suba na moto para realizar as entregas")
							vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
							readydelivery = true
							startRoute()
						end
						if not readydelivery then
							spawnPizza()
						end
					end
				elseif pizza > 0 then
					timedistance = 5
					DrawText3D(PositionMotorcycle.x,PositionMotorcycle.y,PositionMotorcycle.z+0.80,"~g~G~w~ PARA PEGAR ~g~ ENCOMENDA "..pizza.."/10")
					if IsControlJustPressed(0,47) then
						pickPizza()
						pizza = pizza - 1
					end
				end
			end
		end
		Citizen.Wait(timedistance)
	end
end)
---------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------
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